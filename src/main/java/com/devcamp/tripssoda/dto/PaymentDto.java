package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Alias("PaymentDto")
public class PaymentDto {
    
    private Integer id;
    private String userId;
    private String productId;
    private String productScheduleId;
    private String reserverName;
    private String reserverGender;
    private String reserverBirthYear;
    private String reserverBirthMonth;
    private String reserverBirthDay;
    private String reserverCntryCode;
    private String reserverTel;
    private String reserverEmail;
    private String reserverPickup;
    private String optionQty;
    private String optionPrice;
    private String[] optionDetail;
    private String productQty;
    private Integer productPrice;
    private Integer productTitle;
    private Integer usedPoint;
    private Integer finalPrice;



    private String title;

    private String pgId;

    private String status;
    private String approvalAt;
    private String cancelAt;
    private String receiptDetailUrl;
    private String createdAt;
    private String createdBy;
    private String updatedAt;
    private String updatedBy;


    private String method;

}
