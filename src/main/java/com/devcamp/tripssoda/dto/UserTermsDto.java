package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("UserTermsDto")
public class UserTermsDto {

    private Integer id;
    private Integer userId;
    private Integer termsId;
    private Integer status;
    private Date agreementAt;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    // 기본 생성자
    public UserTermsDto() {}

    // 생성자
    public UserTermsDto(Integer userId, Integer termsId, Integer status, Date agreementAt) {
        this.userId = userId;
        this.termsId = termsId;
        this.status = status;
        this.agreementAt = agreementAt;
    }

    // Getter & Setter
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

    public Integer getTermsId() {
        return termsId;
    }

    public void setTermsId(Integer termsId) {
        this.termsId = termsId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getAgreementAt() {
        return agreementAt;
    }

    public void setAgreementAt(Date agreementAt) {
        this.agreementAt = agreementAt;
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

    // equals
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserTermsDto)) return false;
        UserTermsDto that = (UserTermsDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getUserId(), that.getUserId()) && Objects.equals(getTermsId(), that.getTermsId()) && Objects.equals(getStatus(), that.getStatus());
    }

    // hashCode
    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserId(), getTermsId(), getStatus());
    }

    // toString
    @Override
    public String toString() {
        return "UserTermsDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", termsId=" + termsId +
                ", status=" + status +
                ", agreementAt=" + agreementAt +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }

}
