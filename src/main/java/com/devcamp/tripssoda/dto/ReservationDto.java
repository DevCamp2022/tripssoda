package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@Alias("ReservationDto")
public class ReservationDto {
    private Integer id;
    private Date reservAt;
    private Integer status;
    private Integer qty;
    private Date startDate;
    private Integer totalAmount;
    private String productTitle;
    private String thumbnail;
    private Integer productScheduleId;
    private Integer productId;
    private Integer paymentId;
    private String method;
    private Integer usedPoint;
    private Integer price;
    private Integer userId;

    // 쿼리스트링 만들어주는 메서드
    public String getQueryString(){
        // ?id=1&qty=1&price=10000 ...
        try {
            productTitle = URLEncoder.encode(productTitle, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String reservAt = simpleDateFormat.format(getReservAt());
        String startDate = simpleDateFormat.format(getStartDate());
        return UriComponentsBuilder.newInstance()
                .queryParam("id", id)
                .queryParam("qty", qty)
                .queryParam("productTitle", productTitle)
                .queryParam("thumbnail", thumbnail)
                .queryParam("method", method)
                .queryParam("price", price)
                .queryParam("usedPoint", usedPoint)
                .queryParam("reservAt", reservAt)
                .queryParam("startDate", startDate)
                .queryParam("paymentId", paymentId)
                .queryParam("status", status)
                .queryParam("productScheduleId", productScheduleId)
                .queryParam("productId", productId)
                .queryParam("userId", userId)
                .build().toString();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Integer getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(Integer usedPoint) {
        this.usedPoint = usedPoint;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
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

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Integer getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Integer totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getReservAt() {
        return reservAt;
    }

    public void setReservAt(Date reservAt) {
        this.reservAt = reservAt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "ReservationDto{" +
                "id=" + id +
                ", reservAt=" + reservAt +
                ", status=" + status +
                ", qty=" + qty +
                ", startDate=" + startDate +
                ", totalAmount=" + totalAmount +
                ", productTitle='" + productTitle + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", productScheduleId=" + productScheduleId +
                ", productId=" + productId +
                ", paymentId=" + paymentId +
                ", method='" + method + '\'' +
                ", usedPoint=" + usedPoint +
                ", price=" + price +
                ", userId=" + userId +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ReservationDto)) return false;
        ReservationDto that = (ReservationDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getStatus(), that.getStatus()) && Objects.equals(getQty(), that.getQty()) && Objects.equals(getTotalAmount(), that.getTotalAmount()) && Objects.equals(getProductTitle(), that.getProductTitle()) && Objects.equals(getThumbnail(), that.getThumbnail()) && Objects.equals(getProductScheduleId(), that.getProductScheduleId()) && Objects.equals(getProductId(), that.getProductId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getStatus(), getQty(), getTotalAmount(), getProductTitle(), getThumbnail(), getProductScheduleId(), getProductId());
    }
}
