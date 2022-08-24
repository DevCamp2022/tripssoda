package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.mapper.UserPointMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@WebAppConfiguration
public class PaymentServiceImplTest {
    @Autowired
    PaymentService paymentService;

    @Autowired
    UserPointService userPointService;

    @Autowired
    UserPointMapper userPointMapper;

    @Autowired
    IamportClient iamportClient;

    @Test
    public void selectPaymentInitialInfo() {
    }

    @Test
    public void updatePoint(){
        Integer userId = 40;
        Integer point = 50000;
        int rowCnt = userPointService.updateUserPoint(userId, point, point, "포인트 적립");
        if (rowCnt==1){
            rowCnt = userPointService.insertUserPointHistory(userId, point, "적립");
            if (rowCnt == 1){
                System.out.println("적립성공");
            }
        }
    }

    @Test
    public void insertPayment() {
        String obj = "{\"reserverName\":\"권능\",\"reserverGender\":\"M\",\"reserverBirthYear\":\"2022\",\"reserverBirthMonth\":\"08\",\"reserverBirthDay\":\"01\",\"reserverCntryCode\":\"+82\",\"reserverTel\":\"01012345678\",\"reserverEmail\":\"bbb@bbb.com\",\"optionId\":\"2\",\"optionDetail\":{\"0\":\"1#기본\",\"1\":\"2#(단답형)111\",\"2\":\"1#한식\",\"3\":\"2#(단답형)222\",\"4\":\"1#일식\",\"5\":\"2#(단답형)333\"},\"productTitle\":\"[제주도] 서쪽 버스투어\",\"productId\":\"1\",\"scheduleId\":\"1\",\"\":\"\",\"productQty\":\"3\",\"productAmount\":\"75000\",\"optionAmount\":\"30000\",\"usedPoint\":\"2222\",\"payMethod\":\"kakaopay\",\"totalAmount\":\"102778\"}";
        ObjectMapper objectMapper = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        PaymentDetailDto paymentDetailDto;

        try {
            userPointService.updateUserPoint(40, 100000,100000, "포인트 수정");
            paymentDetailDto = objectMapper.readValue(obj, PaymentDetailDto.class);
            paymentDetailDto.setUserId(40);
            String result = paymentService.insertPayment(paymentDetailDto);
            System.out.println("result = " + result);
            assertTrue("payment success".equals(result));

            paymentDetailDto = objectMapper.readValue(obj, PaymentDetailDto.class);
            paymentDetailDto.setUserId(40);
            paymentDetailDto.setTotalAmount(999);
            result = paymentService.insertPayment(paymentDetailDto);
            System.out.println("result = " + result);
            assertTrue("payment fail".equals(result));

            paymentDetailDto = objectMapper.readValue(obj, PaymentDetailDto.class);
            paymentDetailDto.setUserId(40);
            //유저 포인트 임의로 1000원으로 변경
            userPointService.updateUserPoint(40, 1000,1000, "포인트 수정");
            //가지고 있는 포인트보다 더 많은 포인트 사용
            paymentDetailDto.setUsedPoint(100000);
            paymentDetailDto.setTotalAmount(2778);
            result = paymentService.insertPayment(paymentDetailDto);
            System.out.println("result = " + result);
            assertTrue("payment fail".equals(result));

        } catch (JsonProcessingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Test
    public void isValidPrice() {
        String obj = "{\"reserverName\":\"권능\",\"reserverGender\":\"M\",\"reserverBirthYear\":\"2022\",\"reserverBirthMonth\":\"08\",\"reserverBirthDay\":\"01\",\"reserverCntryCode\":\"+82\",\"reserverTel\":\"01012345678\",\"reserverEmail\":\"bbb@bbb.com\",\"optionId\":\"2\",\"optionDetail\":{\"0\":\"1#기본\",\"1\":\"2#(단답형)111\",\"2\":\"1#한식\",\"3\":\"2#(단답형)222\",\"4\":\"1#일식\",\"5\":\"2#(단답형)333\"},\"productTitle\":\"[제주도] 서쪽 버스투어\",\"productId\":\"1\",\"scheduleId\":\"1\",\"\":\"\",\"productQty\":\"3\",\"productAmount\":\"75000\",\"optionAmount\":\"30000\",\"usedPoint\":\"2222\",\"payMethod\":\"kakaopay\",\"totalAmount\":\"102778\"}";
        ObjectMapper objectMapper = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        PaymentDetailDto paymentDetailDto;
        try {
            //제공된 가격과 DB 가격이 일치할 경우
            paymentDetailDto = objectMapper.readValue(obj, PaymentDetailDto.class);
            assertTrue(paymentService.isValidPrice(paymentDetailDto));

//            //제공된 가격과 DB 가격이 다를 때
//            paymentDetailDto.setTotalAmount(1000);
//            assertTrue(!paymentService.isValidPrice(paymentDetailDto));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getIamPortToken(){
        IamportResponse<AccessToken> token = null;
        try {
            token = iamportClient.getAuth();
            System.out.println("token = " + token);
            IamportResponse<Payment> payment = iamportClient.paymentByImpUid("imp_547335866613");
            System.out.println("payment = " + payment);
            System.out.println("payment = " + payment.getResponse());
            System.out.println("payment = " + payment.getResponse().getAmount());

        } catch (IamportResponseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        assertTrue(token!=null);
    }

}