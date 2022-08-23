package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("PaymentSuccessDto")
public class PaymentSuccessDto {
    private Integer id;
    private String title;
    private String productPrice;
    private String qty;
    private String optionAmount;
    private String usedPoint;
    private String totalAmount;
    private String receiptUrl;
    private String thumbnail;
    private String startDate;

    @Override
    public String toString() {
        return "PaymentSuccessDto{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", productPrice='" + productPrice + '\'' +
                ", qty='" + qty + '\'' +
                ", optionAmount='" + optionAmount + '\'' +
                ", usedPoint='" + usedPoint + '\'' +
                ", totalAmount='" + totalAmount + '\'' +
                ", receiptUrl='" + receiptUrl + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", startDate='" + startDate + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }

    public String getOptionAmount() {
        return optionAmount;
    }

    public void setOptionAmount(String optionAmount) {
        this.optionAmount = optionAmount;
    }

    public String getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(String usedPoint) {
        this.usedPoint = usedPoint;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getReceiptUrl() {
        return receiptUrl;
    }

    public void setReceiptUrl(String receiptUrl) {
        this.receiptUrl = receiptUrl;
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
}
