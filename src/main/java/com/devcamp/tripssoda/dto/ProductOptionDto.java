package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("ProductOptionDto")
public class ProductOptionDto {
    private Integer productOptionId;
    private Integer productId;
    private Integer type;
    private String name;
    private String content;
    private Integer price;
    private Integer orderNo;
    private String createdAt;
    private Integer createdBy;
    private String updatedAt;
    private Integer updatedBy;

    public Integer getProductOptionId() {
        return productOptionId;
    }

    public void setProductOptionId(Integer productOptionId) {
        this.productOptionId = productOptionId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
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

    public Integer getOrder() {
        return orderNo;
    }

    public void setOrder(Integer order) {
        this.orderNo = orderNo;
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
        return "ProductOptionDto{" +
                "productOptionId=" + productOptionId +
                ", productId=" + productId +
                ", type=" + type +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", price=" + price +
                ", order=" + orderNo +
                ", createdAt='" + createdAt + '\'' +
                ", createdBy=" + createdBy +
                ", updatedAt='" + updatedAt + '\'' +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
