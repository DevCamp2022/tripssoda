package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;
import com.devcamp.tripssoda.dto.PaymentSuccessDto;
import com.siot.IamportRestClient.exception.IamportResponseException;

import java.io.IOException;
import java.util.Map;

public interface PaymentService {
    public PaymentInitialInfoDto selectPaymentInitialInfo(Integer userId, Integer productId, Integer scheduleId);

    public String insertPayment(PaymentDetailDto paymentDetailDto) throws Exception;

    public boolean isValidPrice(PaymentDetailDto paymentDetailDto) throws Exception;

    public PaymentSuccessDto selectPaymentSuccessDetail(Map<String,  Integer> paymentInfo);

    public void iamportCancelPayment(String impUid, String reason) throws IamportResponseException, IOException;

    public int isMemberAvailable(Map<String, Integer> scheduleInfo);

}
