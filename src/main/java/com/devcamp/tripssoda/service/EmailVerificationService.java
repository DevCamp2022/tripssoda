package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.EmailVerificationDto;

import java.util.Date;
import java.util.List;

public interface EmailVerificationService {
//    String mailCheck(String user_email);

    String sendEmail(String email);

    EmailVerificationDto selectEmailVerification(String email);

    void insertEmailVerification(String email, String verfCode, Date validTime) throws Exception;

    void updateEmailVerificationStatus(EmailVerificationDto emailVerificationDto) throws Exception;

    void updateEmailVerification(EmailVerificationDto emailVerificationDto, String verfCode) throws Exception;
    void deleteEmailVerification(String email) throws IllegalAccessException;

    }
