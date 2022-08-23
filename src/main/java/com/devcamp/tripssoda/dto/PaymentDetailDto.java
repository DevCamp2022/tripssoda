package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Map;

@Alias("PaymentDetailDto")
public class PaymentDetailDto {
    private Integer id;
    private String impUid;
    private String merchantUid;
    private String reservationId;
    private Integer userId;
    private Integer productId;
    private Integer scheduleId;
    private String reserverName;
    private String reserverGender;
    private String reserverBirthday;
    private String reserverCntryCode;
    private String reserverPickup;
    private String reserverTel;
    private String reserverEmail;
    private String productTitle;
    private Integer productQty;
    private Integer productAmount;
    private Map<String, String> optionDetail;
    private Integer optionAmount;
    private Integer usedPoint;
    private String payMethod;
    private Integer totalAmount;
    private Date createdAt;
    private Integer createdBy;
    private Date updateAt;
    private Integer updateBy;
    private String receiptUrl;

    @Override
    public String toString() {
        return "PaymentDetailDto{" +
                "id=" + id +
                ", impUid='" + impUid + '\'' +
                ", merchantUid='" + merchantUid + '\'' +
                ", reservationId='" + reservationId + '\'' +
                ", userId=" + userId +
                ", productId=" + productId +
                ", scheduleId=" + scheduleId +
                ", reserverName='" + reserverName + '\'' +
                ", reserverGender='" + reserverGender + '\'' +
                ", reserverBirthday='" + reserverBirthday + '\'' +
                ", reserverCntryCode='" + reserverCntryCode + '\'' +
                ", reserverPickup='" + reserverPickup + '\'' +
                ", reserverTel='" + reserverTel + '\'' +
                ", reserverEmail='" + reserverEmail + '\'' +
                ", productTitle='" + productTitle + '\'' +
                ", productQty=" + productQty +
                ", productAmount=" + productAmount +
                ", optionDetail=" + optionDetail +
                ", optionAmount=" + optionAmount +
                ", usedPoint=" + usedPoint +
                ", payMethod='" + payMethod + '\'' +
                ", totalAmount=" + totalAmount +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updateAt=" + updateAt +
                ", updateBy=" + updateBy +
                ", receiptUrl='" + receiptUrl + '\'' +
                '}';
    }

    public String getReserverPickup() {
        return reserverPickup;
    }

    public void setReserverPickup(String reserverPickup) {
        this.reserverPickup = reserverPickup;
    }

    public String getReservationId() {
        return reservationId;
    }

    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }

    public String getImpUid() {
        return impUid;
    }

    public void setImpUid(String impUid) {
        this.impUid = impUid;
    }

    public String getMerchantUid() {
        return merchantUid;
    }

    public void setMerchantUid(String merchantUid) {
        this.merchantUid = merchantUid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public Integer getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
    }

    public String getReserverName() {
        return reserverName;
    }

    public void setReserverName(String reserverName) {
        this.reserverName = reserverName;
    }

    public String getReserverGender() {
        return reserverGender;
    }

    public void setReserverGender(String reserverGender) {
        this.reserverGender = reserverGender;
    }

    public String getReserverCntryCode() {
        return reserverCntryCode;
    }

    public void setReserverCntryCode(String reserverCntryCode) {
        this.reserverCntryCode = reserverCntryCode;
    }

    public String getReserverTel() {
        return reserverTel;
    }

    public void setReserverTel(String reserverTel) {
        this.reserverTel = reserverTel;
    }

    public String getReserverEmail() {
        return reserverEmail;
    }

    public void setReserverEmail(String reserverEmail) {
        this.reserverEmail = reserverEmail;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public Integer getProductQty() {
        return productQty;
    }

    public void setProductQty(Integer productQty) {
        this.productQty = productQty;
    }

    public Integer getProductAmount() {
        return productAmount;
    }

    public void setProductAmount(Integer productAmount) {
        this.productAmount = productAmount;
    }

    public Map<String, String> getOptionDetail() {
        return optionDetail;
    }

    public void setOptionDetail(Map<String, String> optionDetail) {
        this.optionDetail = optionDetail;
    }

    public Integer getOptionAmount() {
        return optionAmount;
    }

    public void setOptionAmount(Integer optionAmount) {
        this.optionAmount = optionAmount;
    }

    public Integer getUsedPoint() {
        return usedPoint;
    }

    public void setUsedPoint(Integer usedPoint) {
        this.usedPoint = usedPoint;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public Integer getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Integer totalAmount) {
        this.totalAmount = totalAmount;
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

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public Integer getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }

    public String getReserverBirthday() {
        return reserverBirthday;
    }

    public void setReserverBirthday(String reserverBirthday) {
        this.reserverBirthday = reserverBirthday;
    }

    public String getReceiptUrl() {
        return receiptUrl;
    }

    public void setReceiptUrl(String receiptUrl) {
        this.receiptUrl = receiptUrl;
    }

}
