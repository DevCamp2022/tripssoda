package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface PaymentMapper {
    public ReserverDto selectReserverInfo(Integer userId);
    public PaymentInitialInfoDto selectPaymentInitialInfo(Map<String, Integer> productInfo);
    public PriceProductDto selectPriceProduct(Map<String, Integer> productInfo);
    public Integer insertPayment(PaymentDetailDto paymentDetailDto);
    public PaymentSuccessDto selectPaymentSuccessDetail(Map<String,  Integer> paymentInfo);
}
