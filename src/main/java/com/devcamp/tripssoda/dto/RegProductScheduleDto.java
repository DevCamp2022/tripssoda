package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias("RegProductScheduleDto")
public class RegProductScheduleDto implements Serializable {
    private Integer userId;
    private Integer productId;
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
        return "RegProductScheduleDto{" +
                "userId=" + userId +
                ", productId=" + productId +
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
