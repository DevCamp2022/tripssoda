package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("QuestionDto")
public class QuestionDto {
    private Integer id;
    private Integer userId;
    private String nickname;
    private String title;
    private String content;
    private String hashtag;
    private Integer ansCnt;
    private Integer viewCnt;
    private Integer status;
    private Integer reportCnt;
    private String regionCode;
    private String cityName;
    private Date deletedAt;
    private Date createdAt;
    private Integer createdBy;
    private Date updatedAt;
    private Integer updatedBy;
    private String profileImg;

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public QuestionDto() {}

    public QuestionDto(Integer userId, String title, String content, String hashtag) {
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.hashtag = hashtag;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
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

    public String getHashtag() {
        return hashtag;
    }

    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }

    public Integer getAnsCnt() {
        return ansCnt;
    }

    public void setAnsCnt(Integer ansCnt) {
        this.ansCnt = ansCnt;
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

    public Integer getReportCnt() {
        return reportCnt;
    }

    public void setReportCnt(Integer reportCnt) {
        this.reportCnt = reportCnt;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    public Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Date deletedAt) {
        this.deletedAt = deletedAt;
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
    public String toString() {
        return "QuestionDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", hashtag='" + hashtag + '\'' +
                ", ansCnt=" + ansCnt +
                ", viewCnt=" + viewCnt +
                ", status=" + status +
                ", reportCnt=" + reportCnt +
                ", regionCode=" + regionCode +
                ", deletedAt=" + deletedAt +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                ", profileImg='" + profileImg + '\'' +
                '}';
    }
}
