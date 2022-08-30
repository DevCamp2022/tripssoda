package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("AdminEmailReceiverInfoDto")
public class AdminEmailReceiverInfoDto {
    private Integer userId;
    private String email;
    private String name;
    private String nickname;

    @Override
    public String toString() {
        return "AdminEmailUserInfoDto{" +
                "id=" + userId +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
