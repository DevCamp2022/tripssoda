package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface ReservationMapper {
    public int insertReservation(PaymentDetailDto paymentDetailDto);
    public int insertReservationDetail(Map<String, Object> reservationDetail);
}
