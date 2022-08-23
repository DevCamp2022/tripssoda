package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;
import com.devcamp.tripssoda.service.PaymentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

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
    public ResponseEntity<String> complete(@RequestBody String paymentDetail, HttpSession session) {

        PaymentDetailDto paymentDetailDto = null;
        ObjectMapper objectMapper = new ObjectMapper()
                .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        try {
            paymentDetailDto = objectMapper.readValue(paymentDetail, PaymentDetailDto.class);

            System.out.println("paymentDetail = " + paymentDetail);
            Integer userId = (Integer) session.getAttribute("id");
            paymentDetailDto.setUserId(userId);

            paymentService.insertPayment(paymentDetailDto);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return new ResponseEntity<String>("결제 정보가 누락되었습니다.", HttpStatus.BAD_REQUEST);
        } catch (Exception e) {
            e.printStackTrace();

            switch (e.getMessage()) {
                case "code: P100":
                    return new ResponseEntity<String>("결제 정보가 일치하지 않습니다.", HttpStatus.BAD_REQUEST);
                case "code: P200":
                    return new ResponseEntity<String>("보유하신 포인트가 부족합니다.", HttpStatus.BAD_REQUEST);
                case "code: P300":
                    return new ResponseEntity<String>("결제 처리도중 에러가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
                default:
                    return new ResponseEntity<String>("결제에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        }
        return new ResponseEntity<String>("payment success", HttpStatus.OK);
    }

    @GetMapping("/success")
    public String success(HttpSession session, String reservationId){
        Integer userId = (Integer) session.getAttribute("id");
        return "payment/success.mainTiles";
    }

//    @PostMapping
//    public IamportResponse<Payment> paymentByImpUid(Integer imp_uid) throws IamportResponseException, IOException {
//        return importClient.paymentByImpUid(imp_uid);
//    }

}