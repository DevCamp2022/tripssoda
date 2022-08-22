package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.exception.NotEnoughPointException;
import com.devcamp.tripssoda.exception.NotValidAmountException;
import com.devcamp.tripssoda.exception.InsertException;
import com.devcamp.tripssoda.mapper.PaymentMapper;
import com.devcamp.tripssoda.mapper.ReservationMapper;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class PaymentServiceImpl implements PaymentService {

    private final PaymentMapper paymentMapper;
    private final UserPointService userPointService;
    private final IamportClient iamportClient;
    public final ReservationService reservationService;

    public PaymentServiceImpl(PaymentMapper paymentMapper, UserPointService userPointService,
                              IamportClient iamportClient, ReservationService reservationService) {
        this.paymentMapper = paymentMapper;
        this.userPointService = userPointService;
        this.iamportClient = iamportClient;
        this.reservationService=reservationService;
    }

    @Override
    public PaymentInitialInfoDto selectPaymentInitialInfo(Integer userId, Integer productId, Integer scheduleId) {
        ReserverDto reserverDto = paymentMapper.selectReserverInfo(userId);

        Map<String, Integer> productInfo = new HashMap<>();
        productInfo.put("productId", productId);
        productInfo.put("scheduleId", scheduleId);

        PaymentInitialInfoDto paymentInitialInfoDto = paymentMapper.selectPaymentInitialInfo(productInfo);
        paymentInitialInfoDto.setReserver(reserverDto);
        return paymentInitialInfoDto;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String insertPayment(PaymentDetailDto paymentDetailDto) throws Exception {

        //사용자 편의를 위한 placeholder 때문에 usedPoint 값이 null로 오는걸 방지하기 위함.
        //if (Objects.isNull(paymentDetailDto.getUsedPoint())) {
        //    paymentDetailDto.setUsedPoint(0);
        //}

        try {
            //요청된 가격과 실제 서버에서의 가격이 동일한지 체크
            boolean validPrice = isValidPrice(paymentDetailDto);

            if (!validPrice) {
                throw new NotValidAmountException("Payment Amount is not valid");
            }

            Integer usedPoint = paymentDetailDto.getUsedPoint();
            Integer userId = paymentDetailDto.getUserId();

            //사용한 포인트 만큼 실제로 보유중인지 확인
            int availablePoint = userPointService.isAvailablePoint(usedPoint, userId);
            if (availablePoint == -1) {
                throw new NotEnoughPointException("Not enough user point");
            }

            //충분한 포인트 보유 중이면, 사용한 만큼 포인트 차감.
            Integer newPoint = availablePoint - usedPoint;
            int rowCnt = userPointService.updateUserPoint(userId, newPoint, -usedPoint, "포인트 사용");
            if (rowCnt == -1) {
                throw new InsertException("Error occurred while updating point");
            }
            System.out.println("BEFORE paymentDetailDto = " + paymentDetailDto);

            rowCnt = paymentMapper.insertPayment(paymentDetailDto);
            System.out.println("AFTER paymentDetailDto = " + paymentDetailDto);

            if (rowCnt != 1){
                throw new InsertException("Error occurred while inserting payment detail");
            }

            rowCnt = reservationService.insertReservation(paymentDetailDto);
            if (rowCnt != 1){
                throw new InsertException("Error occurred while inserting reservation detail");
            }

            return "payment success";

        } catch (NotValidAmountException payAmount) {
            payAmount.printStackTrace();
            iamportClient.cancelPaymentByImpUid(createCancelData(paymentDetailDto.getImpUid(), "요청결제가격과 실제가격 불일치"));
            throw new Exception("code: P100");
        } catch (NotEnoughPointException userPoint) {
            userPoint.printStackTrace();
            iamportClient.cancelPaymentByImpUid(createCancelData(paymentDetailDto.getImpUid(), "유저 포인트 부족"));
            throw new Exception("code: P200");
        } catch (InsertException insert) {
            insert.printStackTrace();
            iamportClient.cancelPaymentByImpUid(createCancelData(paymentDetailDto.getImpUid(), "서버 에러 발생으로 인한 취소"));
            throw new Exception("code: P300");
        } catch (Exception e){
            e.printStackTrace();
            iamportClient.cancelPaymentByImpUid(createCancelData(paymentDetailDto.getImpUid(), "알 수 없는 원인으로 인한 취소"));
            throw new Exception();
        }
    }

    private CancelData createCancelData(String imp_uid, String reason) throws IamportResponseException, IOException {
        CancelData cancelData = new CancelData(imp_uid, true);
        cancelData.setReason(reason);
        return cancelData;
    }

    public boolean isValidPrice(PaymentDetailDto paymentDetailDto) throws NotValidAmountException {

        try {
            //imp_uuid를 통해 아임포트 서버에서 결제정보를 읽어온다
            IamportResponse<Payment> payment = iamportClient.paymentByImpUid(paymentDetailDto.getImpUid());
            BigDecimal totalAmount = payment.getResponse().getAmount();

            //사용자에서 요청한 결제 금액.
            Integer productQty = paymentDetailDto.getProductQty();
            Integer productAmount = paymentDetailDto.getProductAmount();
            Integer optionAmount = paymentDetailDto.getOptionAmount();
            Integer usedPointAmount = paymentDetailDto.getUsedPoint();

            Map<String, Integer> productInfo = new HashMap<>();
            productInfo.put("productId", paymentDetailDto.getProductId());
            productInfo.put("scheduleId", paymentDetailDto.getScheduleId());

            //DB에서 읽어온 상품에 대한 실제 가격 정보.
            PriceProductDto priceFromDB = paymentMapper.selectPriceProduct(productInfo);
            if (priceFromDB == null) {
                throw new Exception("Product info not found");
            } else if (priceFromDB.getPriceOptionList() == null) {
                throw new Exception("Option info not found");
            }

            //DB에서 읽어온 옵션에 대한 실제 가격정보
            List<PriceOptionDto> priceOptFromDB = priceFromDB.getPriceOptionList();

            //optionId에 맞도록 Map에 옵션 내용과 가격정보를 담는다.
            Map<String, Map<String, String>> optPriceMap = new HashMap<>();
            for (int i = 0; i < priceOptFromDB.size(); i++) {
                PriceOptionDto priceOptDto = priceOptFromDB.get(i);
                String[] optContents = priceOptDto.getOptionContent().split(",");
                String[] optPrices = priceOptDto.getOptionPrice().split(",");

                Map<String, String> tmpOpt = new HashMap<>();
                for (int j = 0; j < optContents.length; j++) {
                    tmpOpt.put(optContents[j], optPrices[j]);
                }
                optPriceMap.put(priceOptDto.getOptionId(), tmpOpt);
            }

            //사용자가 선택한 옵션 정보.
            Map<String, String> optDetail = paymentDetailDto.getOptionDetail();

            //DB에서 가져온 옵션 정보와 사용자가 선택한 옵션 정보를 비교
            //선택한 옵션들의 id와 내용들을 비교하여 실제 총 가격을 연산한다.
            Integer realTotalOptionPrice = 0;
            for (int i = 0; i < optDetail.size(); i++) {
                String[] detail = optDetail.get("" + i).split("#");
                String optId = detail[0];
                String optContent = detail[1];
                optContent = optContent.contains("(단답형)") ? "X" : optContent;

                Map<String, String> tmp = optPriceMap.get(optId);
                Integer realPrice = Integer.parseInt(tmp.get(optContent));
                realTotalOptionPrice += realPrice;
            }

            Integer realTotalAmount = (priceFromDB.getProductPrice() * productQty) + realTotalOptionPrice - usedPointAmount;

            if (!productAmount.equals(priceFromDB.getProductPrice() * productQty)) {
                throw new NotValidAmountException("Product amount is not valid");
            } else if (!optionAmount.equals(realTotalOptionPrice)) {
                throw new NotValidAmountException("Option amount is not valid");
            }

            if (totalAmount.equals(BigDecimal.valueOf(realTotalAmount))) {
                return true;
            }

        } catch (IamportResponseException | IOException e) {
            e.printStackTrace();
        } catch (NotValidAmountException e) {
            e.printStackTrace();
            throw new NotValidAmountException("Payment amount is not correct");
        } catch (Exception e){
            e.printStackTrace();
            throw new NotValidAmountException("Payment amount validation failed");
        }
        return false;
    }
}

