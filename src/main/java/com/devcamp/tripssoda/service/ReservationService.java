package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.ReservationDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.exception.InsertException;

import java.util.Date;
import java.util.List;

public interface ReservationService {
    public int insertReservation(PaymentDetailDto paymentDetailDto) throws InsertException;

    List<ReservationDto> selectAllUserReservation(Integer userId, SearchCondition sc);

    int selectAllUserReservationCnt(Integer userId);

//    List<Date> selectAllUserReservationStartDate(Integer userId);
//
//    List<Integer> selectAllUserReservationTotalAmount(Integer userId);

}
