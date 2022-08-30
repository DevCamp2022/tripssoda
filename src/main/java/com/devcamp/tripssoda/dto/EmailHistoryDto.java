package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("EmailHistoryDto")
public class EmailHistoryDto {
    private String id;
    private Integer senderId;
    private Integer receiverId;
    private String receiverEmail;
    private String title;
    private String content;
    private String created_at;
    private String created_by;
    private String updated_at;
    private String updated_by;

    public EmailHistoryDto() {
    }

    public EmailHistoryDto(Integer senderId, Integer receiverId, String receiverEmail, String title, String content) {
        this.senderId = senderId;
        this.receiverEmail = receiverEmail;
        this.receiverId = receiverId;
        this.title = title;
        this.content = content;
    }

    public EmailHistoryDto(String id, Integer senderId, Integer receiverId, String receiverEmail, String title, String content, String created_at, String created_by, String updated_at, String updated_by) {
        this.id = id;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.receiverEmail = receiverEmail;
        this.title = title;
        this.content = content;
        this.created_at = created_at;
        this.created_by = created_by;
        this.updated_at = updated_at;
        this.updated_by = updated_by;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Integer receiverId) {
        this.receiverId = receiverId;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
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

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getCreated_by() {
        return created_by;
    }

    public void setCreated_by(String created_by) {
        this.created_by = created_by;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(String updated_by) {
        this.updated_by = updated_by;
    }
}
