package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("EmailVerificationDto")
public class EmailVerificationDto {
    private String userEmail;
    private String verfCode;
    private Integer status;
    private Date validTime;

    // Getter & Setter
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getVerfCode() {
        return verfCode;
    }

    public void setVerfCode(String verfCode) {
        this.verfCode = verfCode;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getValidTime() {
        return validTime;
    }

    public void setValidTime(Date validTime) {
        this.validTime = validTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EmailVerificationDto)) return false;
        EmailVerificationDto that = (EmailVerificationDto) o;
        return Objects.equals(getUserEmail(), that.getUserEmail()) && Objects.equals(getVerfCode(), that.getVerfCode());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getUserEmail(), getVerfCode());
    }

    @Override
    public String toString() {
        return "EmailVerificationDto{" +
                "userEmail='" + userEmail + '\'' +
                ", verfCode=" + verfCode +
                ", status=" + status +
                ", validTime=" + validTime +
                '}';
    }
}
