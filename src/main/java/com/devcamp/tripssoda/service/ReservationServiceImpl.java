package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.ReservationDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.exception.InsertException;
import com.devcamp.tripssoda.mapper.ReservationMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReservationServiceImpl implements ReservationService {

    public final ReservationMapper reservationMapper;

    public ReservationServiceImpl(ReservationMapper reservationMapper) {
        this.reservationMapper = reservationMapper;
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
        for (int i = 0; i < optionDetail.size(); i++) {
            String[] option = optionDetail.get("" + i).split("#");
            Integer optionId = Integer.valueOf(option[0]);
            String optionValue = option[1];
            reservationDetail.put("productOptionId",optionId);
            reservationDetail.put("content",optionValue);
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
