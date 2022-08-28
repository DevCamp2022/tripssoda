package com.devcamp.tripssoda.service;

public interface AdminEmailService {
    public Integer sendMultipleEmail(Integer userId, String receiver, String title, String content) throws Exception;
}
