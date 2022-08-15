package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("UserDto")
public class UserDto {
    private Integer id;
    private String name;
    private String pwd;
    private String email;
    private String tel;
    private Character gender;
    private Date birthday;
    private String nickname;
    private String intro = "";
    private String profileImg;
    private String instagramId = "";
    private Integer point;
    private Integer reportCnt;
    private Integer status;
    private String userCode;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;

    // 기본 생성자
    public UserDto() {}

    // 생성자
    public UserDto(String name, String pwd, String email, String nickname, String tel, Character gender, Date birthday, String userCode) {
        this.name = name;
        this.pwd = pwd;
        this.email = email;
        this.nickname = nickname;
        this.tel = tel;
        this.gender = gender;
        this.birthday = birthday;
        this.userCode = userCode;
    }

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
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

    // toString
    @Override
    public String toString() {
        return "UserDto{" +
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
                ", status=" + status +
                ", userCode='" + userCode + '\'' +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }

    // equals
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof UserDto)) return false;
        UserDto userDto = (UserDto) o;
        return Objects.equals(getId(), userDto.getId()) && Objects.equals(getName(), userDto.getName()) && Objects.equals(getPwd(), userDto.getPwd()) && Objects.equals(getEmail(), userDto.getEmail()) && Objects.equals(getTel(), userDto.getTel()) && Objects.equals(getGender(), userDto.getGender()) && Objects.equals(getBirthday(), userDto.getBirthday()) && Objects.equals(getNickname(), userDto.getNickname()) && Objects.equals(getIntro(), userDto.getIntro()) && Objects.equals(getProfileImg(), userDto.getProfileImg()) && Objects.equals(getInstagramId(), userDto.getInstagramId()) && Objects.equals(getPoint(), userDto.getPoint()) && Objects.equals(getReportCnt(), userDto.getReportCnt()) && Objects.equals(getStatus(), userDto.getStatus()) && Objects.equals(getUserCode(), userDto.getUserCode()) && Objects.equals(getCreatedAt(), userDto.getCreatedAt()) && Objects.equals(getCreatedBy(), userDto.getCreatedBy()) && Objects.equals(getUpdatedAt(), userDto.getUpdatedAt()) && Objects.equals(getUpdatedBy(), userDto.getUpdatedBy());
    }

    // hashCode
    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getPwd(), getEmail(), getTel(), getGender(), getBirthday(), getNickname(), getIntro(), getProfileImg(), getInstagramId(), getPoint(), getReportCnt(), getStatus(), getUserCode(), getCreatedAt(), getCreatedBy(), getUpdatedAt(), getUpdatedBy());
    }

}
