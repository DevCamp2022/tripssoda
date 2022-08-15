package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("UserTourInterestDto")
public class UserTourInterestDto {

    private Integer id;
    private Integer userId;
    private String tourIntrCode;
    private Integer tourIntrRank;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    // 기본 생성자
    public UserTourInterestDto() {}

    // 생성자
    public UserTourInterestDto(Integer userId, String tourIntrCode, Integer tourIntrRank) {
        this.userId = userId;
        this.tourIntrCode = tourIntrCode;
        this.tourIntrRank = tourIntrRank;
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

    public String getTourIntrCode() {
        return tourIntrCode;
    }

    public void setTourIntrCode(String tourIntrCode) {
        this.tourIntrCode = tourIntrCode;
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

    public Integer getTourIntrRank() {
        return tourIntrRank;
    }

    public void setTourIntrRank(Integer tourIntrRank) {
        this.tourIntrRank = tourIntrRank;
    }

    // equals

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserTourInterestDto)) return false;
        UserTourInterestDto that = (UserTourInterestDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getUserId(), that.getUserId()) && Objects.equals(getTourIntrCode(), that.getTourIntrCode()) && Objects.equals(getTourIntrRank(), that.getTourIntrRank());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserId(), getTourIntrCode(), getTourIntrRank());
    }

    // toString

    @Override
    public String toString() {
        return "UserTourInterestDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", tourIntrCode='" + tourIntrCode + '\'' +
                ", tourIntrRank=" + tourIntrRank +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
