package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("PriceProductDto")
public class PriceProductDto {
    private String productId;
    private String scheduleId;
    private Integer productPrice;
    private List<PriceOptionDto> priceOptionList;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(String scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public List<PriceOptionDto> getPriceOptionList() {
        return priceOptionList;
    }

    public void setPriceOptionList(List<PriceOptionDto> priceOptionList) {
        this.priceOptionList = priceOptionList;
    }

    @Override
    public String toString() {
        return "PriceProductDto{" +
                "productId='" + productId + '\'' +
                ", scheduleId='" + scheduleId + '\'' +
                ", productPrice=" + productPrice +
                ", priceOptionList=" + priceOptionList +
                '}';
    }
}

