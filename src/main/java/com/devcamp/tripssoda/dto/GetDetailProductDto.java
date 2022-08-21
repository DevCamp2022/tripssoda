package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("GetDetailProductDto")
public class GetDetailProductDto {
    private Integer productId;
    private Integer scheduleId;
    private Integer partnerId;
    private String title;
    private String category;
    private String thumbnail;
    private Integer rating;
    private Integer reqTime;
    private String keyword;
    private Integer refundAmount;
    private Integer dayCnt;
    private Integer limitQty;
    private Integer minMember;
    private Integer maxMember;
    private String prdIntro;
    private String courseIntro;
    private String pickupType;
    private String pickupOption;
    private String inclusion;
    private String exclusion;
    private String additionalInfo;
    private String meetingPoint;
    private String mandatoryGuidance;
    private String refundPolicy;
    private Integer totalLikes;
    private Integer saleStatus;
    private Integer approvalStatus;
    private String startDate;
    private String endDate;
    private Integer schedulePrice;
    private Integer currentMember;
    private Integer scheduleMinMember;
    private Integer scheduleMaxMember;
    private Integer memberStatus;
    private String scheduleCreatedAt;
    private Integer scheduleCreatedBy;
    private String scheduleUpdatedAt;
    private Integer scheduleUpdatedBy;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
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

    public Integer getLimitQty() {
        return limitQty;
    }

    public void setLimitQty(Integer limitQty) {
        this.limitQty = limitQty;
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

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    public String getMeetingPoint() {
        return meetingPoint;
    }

    public void setMeetingPoint(String meetingPoint) {
        this.meetingPoint = meetingPoint;
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

    public Integer getTotalLikes() {
        return totalLikes;
    }

    public void setTotalLikes(Integer totalLikes) {
        this.totalLikes = totalLikes;
    }

    public Integer getSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(Integer saleStatus) {
        this.saleStatus = saleStatus;
    }

    public Integer getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(Integer approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getSchedulePrice() {
        return schedulePrice;
    }

    public void setSchedulePrice(Integer schedulePrice) {
        this.schedulePrice = schedulePrice;
    }

    public Integer getCurrentMember() {
        return currentMember;
    }

    public void setCurrentMember(Integer currentMember) {
        this.currentMember = currentMember;
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

    public Integer getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(Integer memberStatus) {
        this.memberStatus = memberStatus;
    }

    public String getScheduleCreatedAt() {
        return scheduleCreatedAt;
    }

    public void setScheduleCreatedAt(String scheduleCreatedAt) {
        this.scheduleCreatedAt = scheduleCreatedAt;
    }

    public Integer getScheduleCreatedBy() {
        return scheduleCreatedBy;
    }

    public void setScheduleCreatedBy(Integer scheduleCreatedBy) {
        this.scheduleCreatedBy = scheduleCreatedBy;
    }

    public String getScheduleUpdatedAt() {
        return scheduleUpdatedAt;
    }

    public void setScheduleUpdatedAt(String scheduleUpdatedAt) {
        this.scheduleUpdatedAt = scheduleUpdatedAt;
    }

    public Integer getScheduleUpdatedBy() {
        return scheduleUpdatedBy;
    }

    public void setScheduleUpdatedBy(Integer scheduleUpdatedBy) {
        this.scheduleUpdatedBy = scheduleUpdatedBy;
    }

    @Override
    public String toString() {
        return "GetDetailProductDto{" +
                "productId=" + productId +
                ", scheduleId=" + scheduleId +
                ", partnerId=" + partnerId +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", rating=" + rating +
                ", reqTime=" + reqTime +
                ", keyword='" + keyword + '\'' +
                ", refundAmount=" + refundAmount +
                ", dayCnt=" + dayCnt +
                ", limitQty=" + limitQty +
                ", minMember=" + minMember +
                ", maxMember=" + maxMember +
                ", prdIntro='" + prdIntro + '\'' +
                ", courseIntro='" + courseIntro + '\'' +
                ", pickupType='" + pickupType + '\'' +
                ", pickupOption='" + pickupOption + '\'' +
                ", inclusion='" + inclusion + '\'' +
                ", exclusion='" + exclusion + '\'' +
                ", additionalInfo='" + additionalInfo + '\'' +
                ", meetingPoint='" + meetingPoint + '\'' +
                ", mandatoryGuidance='" + mandatoryGuidance + '\'' +
                ", refundPolicy='" + refundPolicy + '\'' +
                ", totalLikes=" + totalLikes +
                ", saleStatus=" + saleStatus +
                ", approvalStatus=" + approvalStatus +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", schedulePrice=" + schedulePrice +
                ", currentMember=" + currentMember +
                ", scheduleMinMember=" + scheduleMinMember +
                ", scheduleMaxMember=" + scheduleMaxMember +
                ", memberStatus=" + memberStatus +
                ", scheduleCreatedAt='" + scheduleCreatedAt + '\'' +
                ", scheduleCreatedBy=" + scheduleCreatedBy +
                ", scheduleUpdatedAt='" + scheduleUpdatedAt + '\'' +
                ", scheduleUpdatedBy=" + scheduleUpdatedBy +
                '}';
    }
}