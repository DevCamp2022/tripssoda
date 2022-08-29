package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("GetMainListProductDto")
public class GetMainListProductDto {
    private Integer partnerId;
    private Integer productId;
    private Integer scheduleId;
    private String thumbnail;
    private String title;
    private Integer rating;
    private Date startDate;
    private Integer price;
    private Integer currentMember;
    private Integer minMember;
    private Integer maxMember;

    public Integer getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(Integer partnerId) {
        this.partnerId = partnerId;
    }

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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
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

    @Override
    public String toString() {
        return "GetMainListProductDto{" +
                "partnerId=" + partnerId +
                ", productId=" + productId +
                ", scheduleId=" + scheduleId +
                ", thumbnail='" + thumbnail + '\'' +
                ", title='" + title + '\'' +
                ", rating=" + rating +
                ", startDate=" + startDate +
                ", price=" + price +
                ", currentMember=" + currentMember +
                ", minMember=" + minMember +
                ", maxMember=" + maxMember +
                '}';
    }
}