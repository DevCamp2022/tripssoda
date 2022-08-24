package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("InquiryHistoryDto")
public class InquiryHistoryDto {

    private Integer id;
    private Integer inquiryId;
    private String item;
    private String beforeContent;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(Integer inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getBeforeContent() {
        return beforeContent;
    }

    public void setBeforeContent(String beforeContent) {
        this.beforeContent = beforeContent;
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
        if (!(o instanceof InquiryHistoryDto)) return false;
        InquiryHistoryDto that = (InquiryHistoryDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getInquiryId(), that.getInquiryId()) && Objects.equals(getItem(), that.getItem()) && Objects.equals(getBeforeContent(), that.getBeforeContent());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getInquiryId(), getItem(), getBeforeContent());
    }

    @Override
    public String toString() {
        return "InquiryHistoryDto{" +
                "id=" + id +
                ", inquiryId=" + inquiryId +
                ", item='" + item + '\'' +
                ", beforeContent='" + beforeContent + '\'' +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
