package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("TermsDto")
public class TermsDto {
    private Integer id;
    private String title;
    private String content;
    private Integer necessary;
    private Integer orderNo;
    private String userCode;
    private Date applyAt;
    private Integer status;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    // 생성자
    public TermsDto(Integer id, String title, String content, Integer necessary, Integer orderNo, String userCode, Date applyAt, Integer status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.necessary = necessary;
        this.orderNo = orderNo;
        this.userCode = userCode;
        this.applyAt = applyAt;
        this.status = status;
    }

    // Getter & Setter
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getNecessary() {
        return necessary;
    }

    public void setNecessary(Integer necessary) {
        this.necessary = necessary;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public Date getApplyAt() {
        return applyAt;
    }

    public void setApplyAt(Date applyAt) {
        this.applyAt = applyAt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
        if (!(o instanceof TermsDto)) return false;
        TermsDto termsDto = (TermsDto) o;
        return Objects.equals(getId(), termsDto.getId()) && Objects.equals(getTitle(), termsDto.getTitle()) && Objects.equals(getContent(), termsDto.getContent()) && Objects.equals(getNecessary(), termsDto.getNecessary()) && Objects.equals(getOrderNo(), termsDto.getOrderNo()) && Objects.equals(getUserCode(), termsDto.getUserCode()) && Objects.equals(getStatus(), termsDto.getStatus());
    }

    // hashCode
    @Override
    public int hashCode() {
        return Objects.hash(getId(), getTitle(), getContent(), getNecessary(), getOrderNo(), getUserCode(), getStatus());
    }

    // toString
    @Override
    public String toString() {
        return "TermsDto{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", necessary=" + necessary +
                ", orderNo=" + orderNo +
                ", userCode='" + userCode + '\'' +
                ", applyAt=" + applyAt +
                ", status=" + status +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
