package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("WithdrawUserDto")
public class WithdrawUserDto {

    private Integer id;
    private String name;
    private String pwd;
    private String email;
    private String tel;
    private Character gender;
    private Date birthday;
    private String nickname;
    private String intro;
    private String profileImg;
    private String instagramId;
    private Integer point;
    private Integer reportCnt;
    private String userCode;
    private Date regDate;
    private Date withdrawDate;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    // Getter & Setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Character getGender() {
        return gender;
    }

    public void setGender(Character gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public String getInstagramId() {
        return instagramId;
    }

    public void setInstagramId(String instagramId) {
        this.instagramId = instagramId;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getReportCnt() {
        return reportCnt;
    }

    public void setReportCnt(Integer reportCnt) {
        this.reportCnt = reportCnt;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getWithdrawDate() {
        return withdrawDate;
    }

    public void setWithdrawDate(Date withdrawDate) {
        this.withdrawDate = withdrawDate;
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
        if (!(o instanceof WithdrawUserDto)) return false;
        WithdrawUserDto that = (WithdrawUserDto) o;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getName(), that.getName()) && Objects.equals(getPwd(), that.getPwd()) && Objects.equals(getEmail(), that.getEmail()) && Objects.equals(getTel(), that.getTel()) && Objects.equals(getGender(), that.getGender()) && Objects.equals(getBirthday(), that.getBirthday()) && Objects.equals(getNickname(), that.getNickname()) && Objects.equals(getIntro(), that.getIntro()) && Objects.equals(getProfileImg(), that.getProfileImg()) && Objects.equals(getInstagramId(), that.getInstagramId()) && Objects.equals(getPoint(), that.getPoint()) && Objects.equals(getReportCnt(), that.getReportCnt()) && Objects.equals(getUserCode(), that.getUserCode());
    }
    // hashCode
    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getPwd(), getEmail(), getTel(), getGender(), getBirthday(), getNickname(), getIntro(), getProfileImg(), getInstagramId(), getPoint(), getReportCnt(), getUserCode());
    }

    // toString
    @Override
    public String toString() {
        return "WithdrawUserDto{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pwd='" + pwd + '\'' +
                ", email='" + email + '\'' +
                ", tel='" + tel + '\'' +
                ", gender=" + gender +
                ", birthday=" + birthday +
                ", nickname='" + nickname + '\'' +
                ", intro='" + intro + '\'' +
                ", profileImg='" + profileImg + '\'' +
                ", instagramId='" + instagramId + '\'' +
                ", point=" + point +
                ", reportCnt=" + reportCnt +
                ", userCode='" + userCode + '\'' +
                ", regDate=" + regDate +
                ", withdrawDate=" + withdrawDate +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
