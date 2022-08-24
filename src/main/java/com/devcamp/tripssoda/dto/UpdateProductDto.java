package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("UpdateProductDto")
public class UpdateProductDto {
    private Integer userId;
    private Integer productId;
    private Integer partnerId;
    private String title;
    private String category;
    private String thumbnail;
    private Integer rating;
    private Integer reqTime;
    private String keyword;
    private Integer refundAmount;
    private Integer dayCnt;
    private Integer minMember;
    private Integer maxMember;
    private String prdIntro;
    private String courseIntro;
    private String additionalInfo;
    private String inclusion;
    private String exclusion;
    private String meetingPoint;
    private String pickupType;
    private String pickupOption;
    private String mandatoryGuidance;
    private String refundPolicy;

    private Integer optionId;
    private String type;
    private String name;
    private String content;
    private String optionPrice;
    private Integer orderNo;

    private Integer scheduleId;
    private Date startDate;
    private Integer price;
    private Integer scheduleMinMember;
    private Integer scheduleMaxMember;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(Integer partnerId) {
        this.partnerId = partnerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getReqTime() {
        return reqTime;
    }

    public void setReqTime(Integer reqTime) {
        this.reqTime = reqTime;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getRefundAmount() {
        return refundAmount;
    }

    public void setRefundAmount(Integer refundAmount) {
        this.refundAmount = refundAmount;
    }

    public Integer getDayCnt() {
        return dayCnt;
    }

    public void setDayCnt(Integer dayCnt) {
        this.dayCnt = dayCnt;
    }

    public Integer getMinMember() {
        return minMember;
    }

    public void setMinMember(Integer minMember) {
        this.minMember = minMember;
    }

    public Integer getMaxMember() {
        return maxMember;
    }

    public void setMaxMember(Integer maxMember) {
        this.maxMember = maxMember;
    }

    public String getPrdIntro() {
        return prdIntro;
    }

    public void setPrdIntro(String prdIntro) {
        this.prdIntro = prdIntro;
    }

    public String getCourseIntro() {
        return courseIntro;
    }

    public void setCourseIntro(String courseIntro) {
        this.courseIntro = courseIntro;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    public String getInclusion() {
        return inclusion;
    }

    public void setInclusion(String inclusion) {
        this.inclusion = inclusion;
    }

    public String getExclusion() {
        return exclusion;
    }

    public void setExclusion(String exclusion) {
        this.exclusion = exclusion;
    }

    public String getMeetingPoint() {
        return meetingPoint;
    }

    public void setMeetingPoint(String meetingPoint) {
        this.meetingPoint = meetingPoint;
    }

    public String getPickupType() {
        return pickupType;
    }

    public void setPickupType(String pickupType) {
        this.pickupType = pickupType;
    }

    public String getPickupOption() {
        return pickupOption;
    }

    public void setPickupOption(String pickupOption) {
        this.pickupOption = pickupOption;
    }

    public String getMandatoryGuidance() {
        return mandatoryGuidance;
    }

    public void setMandatoryGuidance(String mandatoryGuidance) {
        this.mandatoryGuidance = mandatoryGuidance;
    }

    public String getRefundPolicy() {
        return refundPolicy;
    }

    public void setRefundPolicy(String refundPolicy) {
        this.refundPolicy = refundPolicy;
    }

    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(Integer optionId) {
        this.optionId = optionId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOptionPrice() {
        return optionPrice;
    }

    public void setOptionPrice(String optionPrice) {
        this.optionPrice = optionPrice;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getScheduleMinMember() {
        return scheduleMinMember;
    }

    public void setScheduleMinMember(Integer scheduleMinMember) {
        this.scheduleMinMember = scheduleMinMember;
    }

    public Integer getScheduleMaxMember() {
        return scheduleMaxMember;
    }

    public void setScheduleMaxMember(Integer scheduleMaxMember) {
        this.scheduleMaxMember = scheduleMaxMember;
    }

    @Override
    public String toString() {
        return "UpdateProductDto{" +
                "userId=" + userId +
                ", productId=" + productId +
                ", partnerId=" + partnerId +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", rating=" + rating +
                ", reqTime=" + reqTime +
                ", keyword='" + keyword + '\'' +
                ", refundAmount=" + refundAmount +
                ", dayCnt=" + dayCnt +
                ", minMember=" + minMember +
                ", maxMember=" + maxMember +
                ", prdIntro='" + prdIntro + '\'' +
                ", courseIntro='" + courseIntro + '\'' +
                ", additionalInfo='" + additionalInfo + '\'' +
                ", inclusion='" + inclusion + '\'' +
                ", exclusion='" + exclusion + '\'' +
                ", meetingPoint='" + meetingPoint + '\'' +
                ", pickupType='" + pickupType + '\'' +
                ", pickupOption='" + pickupOption + '\'' +
                ", mandatoryGuidance='" + mandatoryGuidance + '\'' +
                ", refundPolicy='" + refundPolicy + '\'' +
                ", optionId=" + optionId +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", optionPrice='" + optionPrice + '\'' +
                ", orderNo=" + orderNo +
                ", scheduleId=" + scheduleId +
                ", startDate=" + startDate +
                ", price=" + price +
                ", scheduleMinMember=" + scheduleMinMember +
                ", scheduleMaxMember=" + scheduleMaxMember +
                '}';
    }
}
