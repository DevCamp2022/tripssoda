package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;
import com.devcamp.tripssoda.dto.PaymentSuccessDto;
import com.devcamp.tripssoda.service.PaymentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/payment")
public class PaymentController {
    private final PaymentService paymentService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    @GetMapping("/reservation")
    public String pay() {
        return "payment/payment.mainTiles";
    }

    @PostMapping("/reservation")
    public String pay(HttpServletRequest request) {
        return "payment/payment.mainTiles";
    }

    @GetMapping("/paymentDetail")
    @ResponseBody
    public PaymentInitialInfoDto paymentDetail(HttpSession session, Integer productId, Integer scheduleId) {
        Integer userId = (Integer) session.getAttribute("id");
        return paymentService.selectPaymentInitialInfo(userId, productId, scheduleId);
    }

    @PostMapping("/complete")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> complete(@RequestBody String paymentDetail, HttpSession session) {

        PaymentDetailDto paymentDetailDto = null;
        ObjectMapper objectMapper = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        Map<String, Object> result = new HashMap<>();

        try {
            paymentDetailDto = objectMapper.readValue(paymentDetail, PaymentDetailDto.class);

            System.out.println("paymentDetail = " + paymentDetail);
            Integer userId = (Integer) session.getAttribute("id");
            paymentDetailDto.setUserId(userId);

            paymentService.insertPayment(paymentDetailDto);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            result.put("message","결제 정보가 누락되었습니다.");
            return new ResponseEntity<Map<String, Object>>(result, HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();

            switch (e.getMessage()) {
                case "code: P100": {
                    result.put("message", "결제 정보가 일치하지 않습니다.");
                    return new ResponseEntity<Map< String,Object>>(result, HttpStatus.BAD_REQUEST);
                }
                case "code: P200":{
                    result.put("message", "보유하신 포인트가 부족합니다.");
                    return new ResponseEntity<Map< String,Object>>(result, HttpStatus.BAD_REQUEST);
                }
                case "code: P300": {
                    result.put("message", "결제 처리도중 에러가 발생하였습니다.");
                    return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
                }
                default: {
                    result.put("message", "결제에 실패했습니다.");
                    return new ResponseEntity<Map<String, Object>>(result, HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }
        }
        result.put("message","payment success");
        result.put("paymentId", paymentDetailDto.getId());
        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
    }

    @GetMapping("/success")
    public String success(Integer paymentId){
        return "payment/success.mainTiles";
    }

    @GetMapping("/successInfo")
    public ResponseEntity<PaymentSuccessDto> successInfo(HttpSession session, Integer paymentId){
        Integer userId = (Integer) session.getAttribute("id");

        Map<String, Integer> paymentInfo = new HashMap<>();
        paymentInfo.put("userId", userId);
        paymentInfo.put("paymentId", paymentId);

        PaymentSuccessDto successDetailDto = paymentService.selectPaymentSuccessDetail(paymentInfo);
        if (successDetailDto==null){
            return new ResponseEntity<PaymentSuccessDto>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<PaymentSuccessDto>(successDetailDto, HttpStatus.OK);
    }
}