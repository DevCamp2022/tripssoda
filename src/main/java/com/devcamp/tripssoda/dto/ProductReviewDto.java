package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("ProductReviewDto")
public class ProductReviewDto {

    private Integer id;
    private Integer productId;
    private Integer userId;
    private String content;
    private Integer rating;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    public ProductReviewDto(Integer id, Integer productId, Integer userId, String content, Integer rating) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.content = content;
        this.rating = rating;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Integer updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductReviewDto)) return false;
        ProductReviewDto that = (ProductReviewDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getProductId(), that.getProductId()) && Objects.equals(getUserId(), that.getUserId()) && Objects.equals(getContent(), that.getContent()) && Objects.equals(getRating(), that.getRating());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getProductId(), getUserId(), getContent(), getRating());
    }

    @Override
    public String toString() {
        return "ProductReviewDto{" +
                "id=" + id +
                ", productId=" + productId +
                ", userId=" + userId +
                ", content='" + content + '\'' +
                ", rating=" + rating +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
