package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;

public interface PaymentService {
    public PaymentInitialInfoDto selectPaymentInitialInfo(Integer userId, Integer productId, Integer scheduleId);
}
