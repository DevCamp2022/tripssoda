package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("UserHistoryDto")
public class UserHistoryDto {
    private Integer id;
    private Integer userId;
    private String detail;
    private Date updatedAt;
    private Integer updatedBy;

    public UserHistoryDto(Integer userId, String detail, Integer updatedBy) {
        this.userId = userId;
        this.detail = detail;
        this.updatedBy = updatedBy;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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
        if (!(o instanceof UserHistoryDto)) return false;
        UserHistoryDto that = (UserHistoryDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getUserId(), that.getUserId()) && Objects.equals(getDetail(), that.getDetail());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserId(), getDetail());
    }

    @Override
    public String toString() {
        return "UserHistoryDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", detail='" + detail + '\'' +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
