package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.ReservationDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface ReservationMapper {
    public int insertReservation(PaymentDetailDto paymentDetailDto);
    public int insertReservationDetail(Map<String, Object> reservationDetail);

    public List<ReservationDto> selectAllUserReservation(Map userIdAndSc);

    public int selectAllUserReservationCnt(Integer userId);

//    public List<Date> selectAllUserReservationStartDate(Integer userId);
//
//    public List<Integer> selectAllUserReservationTotalAmount(Integer userId);

}
