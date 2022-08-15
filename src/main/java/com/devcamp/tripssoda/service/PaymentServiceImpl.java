package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;
import com.devcamp.tripssoda.dto.ReserverDto;
import com.devcamp.tripssoda.mapper.PaymentMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class PaymentServiceImpl implements PaymentService{

    PaymentMapper paymentMapper;

    public PaymentServiceImpl(PaymentMapper paymentMapper){
        this.paymentMapper = paymentMapper;
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
}
