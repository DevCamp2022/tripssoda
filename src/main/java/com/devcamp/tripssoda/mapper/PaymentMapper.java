package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;
import com.devcamp.tripssoda.dto.ReserverDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface PaymentMapper {
    public ReserverDto selectReserverInfo(Integer userId);
    public PaymentInitialInfoDto selectPaymentInitialInfo(Map<String, Integer> productInfo);
}
