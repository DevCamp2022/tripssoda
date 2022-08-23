package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.exception.InsertException;

public interface ReservationService {
    public int insertReservation(PaymentDetailDto paymentDetailDto) throws InsertException;
}
