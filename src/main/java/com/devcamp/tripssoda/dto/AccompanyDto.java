package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("AccompanyDto")
public class AccompanyDto {
    private Integer id;
    private Integer userId;
    private String nickname;
    private String regionCode;
    private Date startAt;
    private Date endAt;
    private String thumbnail;
    private int status;
    private String title;
    private String content;
    private int memberCnt;
    private String hashtag;
    private int viewCnt;
    private int acmpBoardStatus;
    private int reportCnt;
    private String chatUrl;
    private int applicantCnt;
    private Date deletedAt;
    private Date createdAt;
    private int createdBy;
    private Date updatedAt;
    private int updatedBy;
    private String profileImg;

    private String cityName;

    public AccompanyDto() {}

    public AccompanyDto(String regionCode, Date startAt, Date endAt, String thumbnail, String title, String content, int memberCnt, String hashtag) {
        this.regionCode = regionCode;
        this.startAt = startAt;
        this.endAt = endAt;
        this.thumbnail = thumbnail;
        this.title = title;
        this.content = content;
        this.memberCnt = memberCnt;
        this.hashtag = hashtag;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getStartAt() {
        return startAt;
    }

    public void setStartAt(Date startAt) {
        this.startAt = startAt;
    }

    public Date getEndAt() {
        return endAt;
    }

    public void setEndAt(Date endAt) {
        this.endAt = endAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }
    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    public int getMemberCnt() {
        return memberCnt;
    }

    public void setMemberCnt(int memberCnt) {
        this.memberCnt = memberCnt;
    }

    public String getHashtag() {
        return hashtag;
    }

    public void setHashtag(String hashtag) {
        this.hashtag = hashtag;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public int getAcmpBoardStatus() {
        return acmpBoardStatus;
    }

    public void setAcmpBoardStatus(int acmpBoardStatus) {
        this.acmpBoardStatus = acmpBoardStatus;
    }

    public int getReportCnt() {
        return reportCnt;
    }

    public void setReportCnt(int reportCnt) {
        this.reportCnt = reportCnt;
    }

    public String getChatUrl() {
        return chatUrl;
    }

    public void setChatUrl(String chatUrl) {
        this.chatUrl = chatUrl;
    }

    public int getApplicantCnt() {
        return applicantCnt;
    }

    public void setApplicantCnt(int applicantCnt) {
        this.applicantCnt = applicantCnt;
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

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(int updatedBy) {
        this.updatedBy = updatedBy;
    }

    @Override
    public String toString() {
        return "AccompanyDto{" +
                "id=" + id +
                ", userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", regionCode=" + regionCode +
                ", startAt=" + startAt +
                ", endAt=" + endAt +
                ", thumbnail='" + thumbnail + '\'' +
                ", status=" + status +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", memberCnt=" + memberCnt +
                ", hashtag='" + hashtag + '\'' +
                ", viewCnt=" + viewCnt +
                ", acmpBoardStatus=" + acmpBoardStatus +
                ", reportCnt=" + reportCnt +
                ", chatUrl='" + chatUrl + '\'' +
                ", applicantCnt=" + applicantCnt +
                ", deletedAt=" + deletedAt +
                ", createdAt=" + createdAt +
                ", createdBy=" + createdBy +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                ", profileImg='" + profileImg + '\'' +
                '}';
    }
}
