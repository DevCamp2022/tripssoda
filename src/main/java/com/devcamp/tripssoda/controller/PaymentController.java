package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.PaymentInitialInfoDto;
import com.devcamp.tripssoda.service.PaymentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("payment")
public class PaymentController {

    PaymentService paymentService;

    public PaymentController(PaymentService paymentService){
        this.paymentService = paymentService;
    }

    @GetMapping("/reservation")
    public String pay(){
        return "payment/payment.mainTiles";
    }

    @PostMapping("/reservation")
    public String pay(HttpServletRequest request){
        return "payment/payment.mainTiles";
    }

    @GetMapping("/paymentDetail")
    @ResponseBody
    public PaymentInitialInfoDto paymentDetail(HttpSession session, Integer productId, Integer scheduleId){
//        Integer userId = (Integer) session.getAttribute("userId");
        Integer userId = 39 ;
        return paymentService.selectPaymentInitialInfo(userId, productId, scheduleId);
    }
}
