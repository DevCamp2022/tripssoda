package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;
import java.util.Objects;

@Alias("CombinedBoardHistoryDto")
public class CombinedBoardHistoryDto {
    private int id;
    private String menuCode;
    private int userId;
    private String title;
    private String content;
    private int viewCnt;
    private int status;
    private Date updatedAt;
    private int updatedBy;

    public CombinedBoardHistoryDto() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CombinedBoardHistoryDto)) return false;
        CombinedBoardHistoryDto that = (CombinedBoardHistoryDto) o;
        return getId() == that.getId() && getUserId() == that.getUserId() && getViewCnt() == that.getViewCnt() && getStatus() == that.getStatus() && Objects.equals(getMenuCode(), that.getMenuCode()) && Objects.equals(getTitle(), that.getTitle()) && Objects.equals(getContent(), that.getContent());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getMenuCode(), getUserId(), getTitle(), getContent(), getViewCnt(), getStatus());
    }

    @Override
    public String toString() {
        return "CombinedBoardHistoryDto{" +
                "id=" + id +
                ", menuCode='" + menuCode + '\'' +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", viewCnt=" + viewCnt +
                ", status=" + status +
                ", updatedAt=" + updatedAt +
                ", updatedBy=" + updatedBy +
                '}';
    }
}
