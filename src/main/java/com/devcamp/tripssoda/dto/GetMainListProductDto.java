package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Alias("GetMainListProductDto")
public class GetMainListProductDto {
    private Integer productId;
    private String thumbnail;
    private String title;
    private Integer rating;
    private Date startDate;
    private Integer price;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
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

    @Override
    public String toString() {
        return "GetMainListProductDto{" +
                "productId=" + productId +
                ", thumbnail='" + thumbnail + '\'' +
                ", title='" + title + '\'' +
                ", rating=" + rating +
                ", startDate='" + startDate + '\'' +
                ", price=" + price +
                '}';
    }
}