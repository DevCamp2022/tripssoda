package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.exception.ExceedMaxMemberException;
import com.devcamp.tripssoda.exception.NotEnoughPointException;
import com.devcamp.tripssoda.exception.NotValidAmountException;
import com.devcamp.tripssoda.exception.InsertException;
import com.devcamp.tripssoda.mapper.PaymentMapper;
import com.devcamp.tripssoda.mapper.ProductMapper;
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
    private final ReservationService reservationService;
    private final ProductMapper productMapper;

    public PaymentServiceImpl(PaymentMapper paymentMapper, UserPointService userPointService,
                              IamportClient iamportClient, ReservationService reservationService,
                              ProductMapper productMapper) {
        this.paymentMapper = paymentMapper;
        this.userPointService = userPointService;
        this.iamportClient = iamportClient;
        this.reservationService=reservationService;
        this.productMapper = productMapper;
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

        //????????? ????????? ?????? placeholder ????????? usedPoint ?????? null??? ????????? ???????????? ??????.
        //if (Objects.isNull(paymentDetailDto.getUsedPoint())) {
        //    paymentDetailDto.setUsedPoint(0);
        //}



        try {
            Map<String, Integer> scheduleInfo = new HashMap<>();
            scheduleInfo.put("userId", paymentDetailDto.getUserId());
            scheduleInfo.put("productId", paymentDetailDto.getProductId());
            scheduleInfo.put("scheduleId", paymentDetailDto.getScheduleId());


            int rowCnt = 0;
            rowCnt = productMapper.increaseCurrentMember(scheduleInfo);
            if(rowCnt != 1){
                throw new InsertException("Error occurred while increasing current member count");
            }
            rowCnt = productMapper.setUpdateBy(scheduleInfo);
            if(rowCnt != 1){
                throw new InsertException("Error occurred while updating system column");
            }
            //????????? ????????? ?????? ??????????????? ????????? ???????????? ??????
            boolean validPrice = isValidPrice(paymentDetailDto);

            if (!validPrice) {
                throw new NotValidAmountException("Payment Amount is not valid");
            }

            Integer usedPoint = paymentDetailDto.getUsedPoint();
            Integer userId = paymentDetailDto.getUserId();

            //???????????? ??????????????????, ????????? ????????? ?????? ????????? ??????????????? ??????
            if(paymentDetailDto.getUsedPoint()>0) {
                int availablePoint = userPointService.isAvailablePoint(usedPoint, userId);
                if (availablePoint == -1) {
                    throw new NotEnoughPointException("Not enough user point");
                }

                //????????? ????????? ?????? ?????????, ????????? ?????? ????????? ??????.
                Integer newPoint = availablePoint - usedPoint;
                rowCnt = userPointService.updateUserPoint(userId, newPoint, -usedPoint, "????????? ??????");
                if (rowCnt == -1) {
                    throw new InsertException("Error occurred while updating point");
                }
                System.out.println("BEFORE paymentDetailDto = " + paymentDetailDto);
            }
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
            iamportCancelPayment(paymentDetailDto.getImpUid(), "????????????????????? ???????????? ?????????");
            throw new Exception("code: P100");
        } catch (NotEnoughPointException userPoint) {
            userPoint.printStackTrace();
            iamportCancelPayment(paymentDetailDto.getImpUid(), "?????? ????????? ??????");
            throw new Exception("code: P200");
        } catch (InsertException insert) {
            insert.printStackTrace();
            iamportCancelPayment(paymentDetailDto.getImpUid(), "?????? ?????? ???????????? ?????? ??????");
            throw new Exception("code: P300");
        } catch (Exception e){
            e.printStackTrace();
            iamportCancelPayment(paymentDetailDto.getImpUid(), "??? ??? ?????? ???????????? ?????? ??????");
            throw new Exception();
        }
    }

    public void iamportCancelPayment(String impUid, String reason) throws IamportResponseException, IOException {
        iamportClient.cancelPaymentByImpUid(createCancelData(impUid, reason));
    }

    //return?????? 0?????? available false, 1?????? available true
    public int isMemberAvailable(Map<String, Integer> scheduleInfo) {
        return productMapper.selectProductAvailability(scheduleInfo);
    }

    private CancelData createCancelData(String imp_uid, String reason) throws IamportResponseException, IOException {
        CancelData cancelData = new CancelData(imp_uid, true);
        cancelData.setReason(reason);
        return cancelData;
    }

    public boolean isValidPrice(PaymentDetailDto paymentDetailDto) throws NotValidAmountException {
        System.out.println("paymentDetailDto = " + paymentDetailDto);
        try {
            //imp_uuid??? ?????? ???????????? ???????????? ??????????????? ????????????
            IamportResponse<Payment> payment = iamportClient.paymentByImpUid(paymentDetailDto.getImpUid());
            BigDecimal totalAmount = payment.getResponse().getAmount();

            //??????????????? ????????? ?????? ??????.
            Integer productQty = paymentDetailDto.getProductQty();
            Integer productAmount = paymentDetailDto.getProductAmount();
            Integer optionAmount = paymentDetailDto.getOptionAmount();
            Integer usedPointAmount = paymentDetailDto.getUsedPoint();
            Integer realTotalOptionPrice = 0;

            Map<String, Integer> productInfo = new HashMap<>();
            productInfo.put("productId", paymentDetailDto.getProductId());
            productInfo.put("scheduleId", paymentDetailDto.getScheduleId());

            //DB?????? ????????? ????????? ?????? ?????? ?????? ??????.
            PriceProductDto priceFromDB = paymentMapper.selectPriceProduct(productInfo);
            System.out.println("priceFromDB = " + priceFromDB);
            System.out.println("priceFromDB.getPriceOptionList() = " + priceFromDB.getPriceOptionList());

            if (priceFromDB == null) {
                throw new Exception("Product info not found");
            }
            //?????? ????????? ?????? ?????? ??????
            paymentDetailDto.setProductPrice(priceFromDB.getProductPrice());

            if (paymentDetailDto.getOptionDetail()!=null) {
                if (priceFromDB.getPriceOptionList().size() == 0) {
                    throw new Exception("Option info not found");
                }
                //DB?????? ????????? ????????? ?????? ?????? ????????????
                List<PriceOptionDto> priceOptFromDB = priceFromDB.getPriceOptionList();

                //optionId??? ????????? Map??? ?????? ????????? ??????????????? ?????????.
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

                //???????????? ????????? ?????? ??????.
                Map<String, String> optDetail = paymentDetailDto.getOptionDetail();

                //DB?????? ????????? ?????? ????????? ???????????? ????????? ?????? ????????? ??????
                //????????? ???????????? id??? ???????????? ???????????? ?????? ??? ????????? ????????????.
                for (int i = 0; i < optDetail.size(); i++) {
                    String[] detail = optDetail.get("" + i).split("#");
                    String optId = detail[0];
                    String optContent = detail[1];
                    optContent = optContent.contains("(?????????)") ? "X" : optContent;

                    Map<String, String> tmp = optPriceMap.get(optId);
                    Integer realPrice = Integer.parseInt(tmp.get(optContent));
                    realTotalOptionPrice += realPrice;
                }
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

    public PaymentSuccessDto selectPaymentSuccessDetail(Map<String,  Integer> paymentInfo){
        return paymentMapper.selectPaymentSuccessDetail(paymentInfo);
    }

    public boolean increaseCurrentMember(Map<String, Integer> scheduleInfo){
        return true;
    }

}

