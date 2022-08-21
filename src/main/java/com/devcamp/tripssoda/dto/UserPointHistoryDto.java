package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("UserPointHistoryDto")
public class UserPointHistoryDto {
    private Integer id;
    private Integer userId;
    private Integer amount;
    private String processDetail;
    private Date processAt;
    private Integer status;

    public UserPointHistoryDto(Integer id, Integer userId, Integer amount, String processDetail, Date processAt, Integer status) {
        this.id = id;
        this.userId = userId;
        this.amount = amount;
        this.processDetail = processDetail;
        this.processAt = processAt;
        this.status = status;
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

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getProcessDetail() {
        return processDetail;
    }

    public void setProcessDetail(String processDetail) {
        this.processDetail = processDetail;
    }

    public Date getProcessAt() {
        return processAt;
    }

    public void setProcessAt(Date processAt) {
        this.processAt = processAt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserPointHistoryDto)) return false;
        UserPointHistoryDto that = (UserPointHistoryDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getUserId(), that.getUserId()) && Objects.equals(getAmount(), that.getAmount()) && Objects.equals(getProcessDetail(), that.getProcessDetail()) && Objects.equals(getStatus(), that.getStatus());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getUserId(), getAmount(), getProcessDetail(), getStatus());
    }

    @Override
    public String toString() {
        return "UserPointHistoryDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", amount=" + amount +
                ", processDetail=" + processDetail +
                ", processAt=" + processAt +
                ", status=" + status +
                '}';
    }
}
