package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias("RegProductOptionDto")
public class RegProductOptionDto implements Serializable {
    private Integer userId;
    private Integer productId;

    //productOption
    private Integer productOptionId;
    private String type;
    private String name;
    private String content;
    private String price;
    private Integer orderNo;
    private String optionCreatedAt;
    private Integer optionCreatedBy;
    private String optionUpdatedAt;
    private Integer optionUpdatedBy;

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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
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

    @Override
    public String toString() {
        return "RegProductOptionDto{" +
                "userId=" + userId +
                ", productId=" + productId +
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
                '}';
    }
}
