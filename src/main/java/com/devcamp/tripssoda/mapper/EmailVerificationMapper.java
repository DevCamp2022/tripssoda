package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.EmailVerificationDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmailVerificationMapper {
    public int insertEmailVerification(EmailVerificationDto emailVerificationDto);
    public EmailVerificationDto selectEmailVerification(String userEmail);

    public int updateEmailVerificationStatus(EmailVerificationDto emailVerificationDto);

    public int updateEmailVerification(EmailVerificationDto emailVerificationDto);

    public int deleteEmailVerification(String userEmail);
}
