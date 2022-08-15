package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("ProductScheduleDto")
public class ProductScheduleDto {
    private Integer productScheduleId;
    private Integer productId;
    private String startDate;
    private String endDate;
    private Integer price;
    private Integer currentMember;
    private Integer minMember;
    private Integer maxMember;
    private Integer memberStatus;
    private String createdAt;
    private Integer createdBy;
    private String updatedAt;
    private Integer updatedBy;

    public Integer getProductScheduleId() {
        return productScheduleId;
    }

    public void setProductScheduleId(Integer productScheduleId) {
        this.productScheduleId = productScheduleId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getCurrentMember() {
        return currentMember;
    }

    public void setCurrentMember(Integer currentMember) {
        this.currentMember = currentMember;
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

    public Integer getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(Integer memberStatus) {
        this.memberStatus = memberStatus;
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

    @Override
    public String toString() {
        return "ProductScheduleDto{" +
                "productScheduleId=" + productScheduleId +
                ", productId=" + productId +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", price=" + price +
                ", currentMember=" + currentMember +
                ", minMember=" + minMember +
                ", maxMember=" + maxMember +
                ", memberStatus=" + memberStatus +
                ", createdAt='" + createdAt + '\'' +
                ", createdBy=" + createdBy +
                ", updatedAt='" + updatedAt + '\'' +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
