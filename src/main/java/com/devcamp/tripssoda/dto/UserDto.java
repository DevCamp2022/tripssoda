package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Objects;

@Alias("UserDto")
public class UserDto {
    private Integer id;
    private String name;
    private String pwd;
    // 비밀번호 확인하는 인스턴스 변수
    private String pwdConfirm;
    private String email;
    private String tel;
    private Character gender;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;
    private String nickname;
    private String intro = "";
    private String profileImg;
    private String instagramId = "";
    private Integer point;
    private Integer reportCnt;
    private Integer status;
    private String userCode;
    // 약관동의현황을 저장
    private Integer firstTermsStatus;
    private Integer secondTermsStatus;
    private Integer thirdTermsStatus;
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

    public Integer getFirstTermsStatus() {
        return firstTermsStatus;
    }

    public void setFirstTermsStatus(Integer firstTermsStatus) {
        this.firstTermsStatus = firstTermsStatus;
    }

    public Integer getSecondTermsStatus() {
        return secondTermsStatus;
    }

    public void setSecondTermsStatus(Integer secondTermsStatus) {
        this.secondTermsStatus = secondTermsStatus;
    }

    public Integer getThirdTermsStatus() {
        return thirdTermsStatus;
    }

    public void setThirdTermsStatus(Integer thirdTermsStatus) {
        this.thirdTermsStatus = thirdTermsStatus;
    }

    public String getPwdConfirm() {
        return pwdConfirm;
    }

    public void setPwdConfirm(String pwdConfirm) {
        this.pwdConfirm = pwdConfirm;
    }

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
                ", pwdConfirm='" + pwdConfirm + '\'' +
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
                ", firstTermsStatus=" + firstTermsStatus +
                ", secondTermsStatus=" + secondTermsStatus +
                ", thirdTermsStatus=" + thirdTermsStatus +
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
        return Objects.equals(getId(), userDto.getId()) && Objects.equals(getName(), userDto.getName()) && Objects.equals(getPwd(), userDto.getPwd()) && Objects.equals(getPwdConfirm(), userDto.getPwdConfirm()) && Objects.equals(getEmail(), userDto.getEmail()) && Objects.equals(getTel(), userDto.getTel()) && Objects.equals(getGender(), userDto.getGender()) && Objects.equals(getBirthday(), userDto.getBirthday()) && Objects.equals(getNickname(), userDto.getNickname()) && Objects.equals(getIntro(), userDto.getIntro()) && Objects.equals(getProfileImg(), userDto.getProfileImg()) && Objects.equals(getInstagramId(), userDto.getInstagramId()) && Objects.equals(getPoint(), userDto.getPoint()) && Objects.equals(getReportCnt(), userDto.getReportCnt()) && Objects.equals(getStatus(), userDto.getStatus()) && Objects.equals(getUserCode(), userDto.getUserCode()) && Objects.equals(getFirstTermsStatus(), userDto.getFirstTermsStatus()) && Objects.equals(getSecondTermsStatus(), userDto.getSecondTermsStatus()) && Objects.equals(getThirdTermsStatus(), userDto.getThirdTermsStatus());
    }

    // hashCode
    @Override
    public int hashCode() {
        return Objects.hash(getId(), getName(), getPwd(), getPwdConfirm(), getEmail(), getTel(), getGender(), getBirthday(), getNickname(), getIntro(), getProfileImg(), getInstagramId(), getPoint(), getReportCnt(), getStatus(), getUserCode(), getFirstTermsStatus(), getSecondTermsStatus(), getThirdTermsStatus());
    }
}
