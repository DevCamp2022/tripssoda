package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.ReservationDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.exception.InsertException;
import com.devcamp.tripssoda.mapper.PaymentMapper;
import com.devcamp.tripssoda.mapper.ReservationMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReservationServiceImpl implements ReservationService {

    public final ReservationMapper reservationMapper;

    public final PaymentMapper paymentMapper;

    public ReservationServiceImpl(ReservationMapper reservationMapper, PaymentMapper paymentMapper) {
        this.reservationMapper = reservationMapper;
        this.paymentMapper = paymentMapper;
    }

    public int insertReservation(PaymentDetailDto paymentDetailDto) throws InsertException {
        int rowCnt = reservationMapper.insertReservation(paymentDetailDto);
        System.out.println("paymentDetailDto = " + paymentDetailDto);
        if (rowCnt != 1)
            throw new InsertException("Error occurred while inserting reservation");

        Map<String, Object> reservationDetail = new HashMap<>();
        reservationDetail.put("reservationId",paymentDetailDto.getReservationId());
        reservationDetail.put("userId",paymentDetailDto.getUserId());

        Map<String, String> optionDetail = paymentDetailDto.getOptionDetail();
        if (optionDetail!=null) {
            for (int i = 0; i < optionDetail.size(); i++) {
                String[] option = optionDetail.get("" + i).split("#");
                Integer optionId = Integer.valueOf(option[0]);
                String optionValue = option[1];
                reservationDetail.put("productOptionId", optionId);
                reservationDetail.put("content", optionValue);
                rowCnt = reservationMapper.insertReservationDetail(reservationDetail);
                if (rowCnt != 1)
                    throw new InsertException("Error occurred while inserting reservation detail");
            }
        } else {
            reservationDetail.put("productOptionId", 0);
            reservationDetail.put("content", "선택된 옵션이 없습니다.");
            rowCnt = reservationMapper.insertReservationDetail(reservationDetail);
            if (rowCnt != 1)
                throw new InsertException("Error occurred while inserting reservation detail");
        }
        return 1;
    }
    @Override
    public List<ReservationDto> selectAllUserReservation(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);

        return reservationMapper.selectAllUserReservation(userIdAndSc);
    }

    @Override
    public int selectAllUserReservationCnt(Integer userId) {
        return reservationMapper.selectAllUserReservationCnt(userId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void cancelUserReservation(Map reservInfo, Map paymentInfo) throws Exception {
        // reservation 데이터의 status를 변경
//        Map statusAndId = new HashMap();
//        statusAndId.put("status", status);
//        statusAndId.put("id", id); // reservation id

        int rowCnt = reservationMapper.cancelUserReservation(reservInfo);
        if (rowCnt != 1) {
            throw new Exception("예약 취소 오류");
        }

        int rowCnt2 = paymentMapper.updatePaymentStatus(paymentInfo);
        if (rowCnt != 1) {
            throw new Exception("결제 취소 오류");
        }

        // payment 데이터의 status를 변경
//        paymentMapper.updatePaymentStatus()
        // public int updatePayment(Map<String, Integer> paymentInfo) {
        //        return paymentMapper.updatePaymentStatus(paymentInfo);
        //    }

    }

//    @Override
//    public List<Date> selectAllUserReservationStartDate(Integer userId) {
//        return reservationMapper.selectAllUserReservationStartDate(userId);
//    }
//
//    @Override
//    public List<Integer> selectAllUserReservationTotalAmount(Integer userId) {
//        return reservationMapper.selectAllUserReservationTotalAmount(userId);
//    }

}
