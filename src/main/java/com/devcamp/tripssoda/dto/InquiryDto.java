package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("InquiryDto")
public class InquiryDto {

    private Integer id;
    private Integer userId;
    private String title;
    private String content;
    private Integer viewCnt;
    private Integer status;
    private Integer ansUserId;
    private String ansContent;
    private Date ansDate;
    private String menuCode;
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

    public Integer getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(Integer viewCnt) {
        this.viewCnt = viewCnt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAnsUserId() {
        return ansUserId;
    }

    public void setAnsUserId(Integer ansUserId) {
        this.ansUserId = ansUserId;
    }

    public String getAnsContent() {
        return ansContent;
    }

    public void setAnsContent(String ansContent) {
        this.ansContent = ansContent;
    }

    public Date getAnsDate() {
        return ansDate;
    }

    public void setAnsDate(Date ansDate) {
        this.ansDate = ansDate;
    }

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
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
        if (!(o instanceof InquiryDto)) return false;
        InquiryDto that = (InquiryDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getUserId(), that.getUserId()) && Objects.equals(getTitle(), that.getTitle()) && Objects.equals(getContent(), that.getContent()) && Objects.equals(getViewCnt(), that.getViewCnt()) && Objects.equals(getStatus(), that.getStatus()) && Objects.equals(getAnsUserId(), that.getAnsUserId()) && Objects.equals(getAnsContent(), that.getAnsContent()) && Objects.equals(getMenuCode(), that.getMenuCode()) && Objects.equals(getCreatedBy(), that.getCreatedBy()) && Objects.equals(getUpdatedBy(), that.getUpdatedBy());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserId(), getTitle(), getContent(), getViewCnt(), getStatus(), getAnsUserId(), getAnsContent(), getMenuCode(), getCreatedBy(), getUpdatedBy());
    }

    @Override
    public String toString() {
        return "InquiryDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", viewCnt=" + viewCnt +
                ", status=" + status +
                ", ansUserId=" + ansUserId +
                ", ansContent='" + ansContent + '\'' +
                ", ansDate=" + ansDate +
                ", menuCode='" + menuCode + '\'' +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
