package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias("RegProductDto")
public class RegProductDto implements Serializable {
    private Integer userId;
    //product
    private Integer productId;
    private Integer partnerId;
    private String title;
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
    private String inclusion;
    private String exclusion;
    private String additionalInfo;
    private String meetingPoint;
    private String mandatoryGuidance;
    private String refundPolicy;
    private Integer totalLikes;
    private Integer saleStatus;
    private Integer approvalStatus;
    private String createdAt;
    private Integer createdBy;
    private String updatedAt;
    private Integer updatedBy;

    //productOption
    private Integer productOptionId;
    private String type;
    private String name;
    private String content;
    private Integer price;
    private Integer orderNo;
    private String optionCreatedAt;
    private Integer optionCreatedBy;
    private String optionUpdatedAt;
    private Integer optionUpdatedBy;

    //productSchedule
    private Integer productScheduleId;
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

    public RegProductDto() {
    }

    public RegProductDto(Integer userId, Integer productId, Integer partnerId, String title, String thumbnail, Integer rating, Integer reqTime, String keyword, Integer refundAmount, Integer dayCnt, Integer limitQty, Integer minMember, Integer maxMember, String prdIntro, String courseIntro, String inclusion, String exclusion, String additionalInfo, String meetingPoint, String mandatoryGuidance, String refundPolicy, Integer totalLikes, Integer saleStatus, Integer approvalStatus, String createdAt, Integer createdBy, String updatedAt, Integer updatedBy, Integer productOptionId, String type, String name, String content, Integer price, Integer orderNo, String optionCreatedAt, Integer optionCreatedBy, String optionUpdatedAt, Integer optionUpdatedBy, Integer productScheduleId, String startDate, String endDate, Integer schedulePrice, Integer currentMember, Integer scheduleMinMember, Integer scheduleMaxMember, Integer memberStatus, String scheduleCreatedAt, Integer scheduleCreatedBy, String scheduleUpdatedAt, Integer scheduleUpdatedBy) {
        this.userId = userId;
        this.productId = productId;
        this.partnerId = partnerId;
        this.title = title;
        this.thumbnail = thumbnail;
        this.rating = rating;
        this.reqTime = reqTime;
        this.keyword = keyword;
        this.refundAmount = refundAmount;
        this.dayCnt = dayCnt;
        this.limitQty = limitQty;
        this.minMember = minMember;
        this.maxMember = maxMember;
        this.prdIntro = prdIntro;
        this.courseIntro = courseIntro;
        this.inclusion = inclusion;
        this.exclusion = exclusion;
        this.additionalInfo = additionalInfo;
        this.meetingPoint = meetingPoint;
        this.mandatoryGuidance = mandatoryGuidance;
        this.refundPolicy = refundPolicy;
        this.totalLikes = totalLikes;
        this.saleStatus = saleStatus;
        this.approvalStatus = approvalStatus;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.updatedAt = updatedAt;
        this.updatedBy = updatedBy;
        this.productOptionId = productOptionId;
        this.type = type;
        this.name = name;
        this.content = content;
        this.price = price;
        this.orderNo = orderNo;
        this.optionCreatedAt = optionCreatedAt;
        this.optionCreatedBy = optionCreatedBy;
        this.optionUpdatedAt = optionUpdatedAt;
        this.optionUpdatedBy = optionUpdatedBy;
        this.productScheduleId = productScheduleId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.schedulePrice = schedulePrice;
        this.currentMember = currentMember;
        this.scheduleMinMember = scheduleMinMember;
        this.scheduleMaxMember = scheduleMaxMember;
        this.memberStatus = memberStatus;
        this.scheduleCreatedAt = scheduleCreatedAt;
        this.scheduleCreatedBy = scheduleCreatedBy;
        this.scheduleUpdatedAt = scheduleUpdatedAt;
        this.scheduleUpdatedBy = scheduleUpdatedBy;
    }

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

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Integer updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Integer getProductOptionId() {
        return productOptionId;
    }

    public void setProductOptionId(Integer productOptionId) {
        this.productOptionId = productOptionId;
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public String getOptionCreatedAt() {
        return optionCreatedAt;
    }

    public void setOptionCreatedAt(String optionCreatedAt) {
        this.optionCreatedAt = optionCreatedAt;
    }

    public Integer getOptionCreatedBy() {
        return optionCreatedBy;
    }

    public void setOptionCreatedBy(Integer optionCreatedBy) {
        this.optionCreatedBy = optionCreatedBy;
    }

    public String getOptionUpdatedAt() {
        return optionUpdatedAt;
    }

    public void setOptionUpdatedAt(String optionUpdatedAt) {
        this.optionUpdatedAt = optionUpdatedAt;
    }

    public Integer getOptionUpdatedBy() {
        return optionUpdatedBy;
    }

    public void setOptionUpdatedBy(Integer optionUpdatedBy) {
        this.optionUpdatedBy = optionUpdatedBy;
    }

    public Integer getProductScheduleId() {
        return productScheduleId;
    }

    public void setProductScheduleId(Integer productScheduleId) {
        this.productScheduleId = productScheduleId;
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
        return "RegProductDto{" +
                "userId=" + userId +
                ", productId=" + productId +
                ", partnerId=" + partnerId +
                ", title='" + title + '\'' +
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
                ", inclusion='" + inclusion + '\'' +
                ", exclusion='" + exclusion + '\'' +
                ", additionalInfo='" + additionalInfo + '\'' +
                ", meetingPoint='" + meetingPoint + '\'' +
                ", mandatoryGuidance='" + mandatoryGuidance + '\'' +
                ", refundPolicy='" + refundPolicy + '\'' +
                ", totalLikes=" + totalLikes +
                ", saleStatus=" + saleStatus +
                ", approvalStatus=" + approvalStatus +
                ", createdAt='" + createdAt + '\'' +
                ", createdBy=" + createdBy +
                ", updatedAt='" + updatedAt + '\'' +
                ", updatedBy=" + updatedBy +
                ", productOptionId=" + productOptionId +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", price=" + price +
                ", orderNo=" + orderNo +
                ", optionCreatedAt='" + optionCreatedAt + '\'' +
                ", optionCreatedBy=" + optionCreatedBy +
                ", optionUpdatedAt='" + optionUpdatedAt + '\'' +
                ", optionUpdatedBy=" + optionUpdatedBy +
                ", productScheduleId=" + productScheduleId +
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
