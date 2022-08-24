package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("ApprovalProductDto")
public class AdminProductDto {
    private String partnerId;
    private String companyName;
    private String productId;
    private String title;
    private String reqTime;
    private String dayCnt;
    private String limitQty;
    private String minMember;
    private String maxMember;
    private String approvalStatus;
    private String productPrice;

    @Override
    public String toString() {
        return "ApprovalProductDto{" +
                "partnerId='" + partnerId + '\'' +
                ", companyName='" + companyName + '\'' +
                ", productId='" + productId + '\'' +
                ", title='" + title + '\'' +
                ", reqTime='" + reqTime + '\'' +
                ", dayCnt='" + dayCnt + '\'' +
                ", limitQty='" + limitQty + '\'' +
                ", minMember='" + minMember + '\'' +
                ", maxMember='" + maxMember + '\'' +
                ", approvalStatus='" + approvalStatus + '\'' +
                ", productPrice='" + productPrice + '\'' +
                '}';
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReqTime() {
        return reqTime;
    }

    public void setReqTime(String reqTime) {
        this.reqTime = reqTime;
    }

    public String getDayCnt() {
        return dayCnt;
    }

    public void setDayCnt(String dayCnt) {
        this.dayCnt = dayCnt;
    }

    public String getLimitQty() {
        return limitQty;
    }

    public void setLimitQty(String limitQty) {
        this.limitQty = limitQty;
    }

    public String getMinMember() {
        return minMember;
    }

    public void setMinMember(String minMember) {
        this.minMember = minMember;
    }

    public String getMaxMember() {
        return maxMember;
    }

    public void setMaxMember(String maxMember) {
        this.maxMember = maxMember;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

}
