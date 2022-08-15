package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Alias("PaymentInitialInfoDto")
public class PaymentInitialInfoDto {
    private ReserverDto reserver;
    private Integer productId;
    private String title;
    private String pickupType;
    private String meetingPoint;
    private String pickupOption;
    private Integer scheduleId;
    private Integer limitQty;
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private Date startDate;
    private String startDate;
    private Integer optionId;
    private List<ProductOptionDto> optionList;
    private Integer schedulePrice;
    private String thumbnail;

    public Integer getLimitQty() {
        return limitQty;
    }

    public void setLimitQty(Integer limitQty) {
        this.limitQty = limitQty;
    }

    public ReserverDto getReserver() {
        return reserver;
    }

    public void setReserver(ReserverDto reserver) {
        this.reserver = reserver;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
    }


    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(Integer optionId) {
        this.optionId = optionId;
    }

    public List<ProductOptionDto> getOptionList() {
        return optionList;
    }

    public void setOptionList(List<ProductOptionDto> optionList) {
        this.optionList = optionList;
    }

    public Integer getSchedulePrice() {
        return schedulePrice;
    }

    public void setSchedulePrice(Integer schedulePrice) {
        this.schedulePrice = schedulePrice;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getPickupType() {
        return pickupType;
    }

    public void setPickupType(String pickupType) {
        this.pickupType = pickupType;
    }

    public String getMeetingPoint() {
        return meetingPoint;
    }

    public void setMeetingPoint(String meetingPoint) {
        this.meetingPoint = meetingPoint;
    }

    public String getPickupOption() {
        return pickupOption;
    }

    public void setPickupOption(String pickupOption) {
        this.pickupOption = pickupOption;
    }

    @Override
    public String toString() {
        return "PaymentInitialInfoDto{" +
                "reserver=" + reserver +
                ", productId=" + productId +
                ", title='" + title + '\'' +
                ", pickupType='" + pickupType + '\'' +
                ", meetingPoint='" + meetingPoint + '\'' +
                ", pickupOption='" + pickupOption + '\'' +
                ", scheduleId=" + scheduleId +
                ", startDate='" + startDate + '\'' +
                ", optionId=" + optionId +
                ", optionList=" + optionList +
                ", schedulePrice=" + schedulePrice +
                ", thumbnail='" + thumbnail + '\'' +
                '}';
    }
}
