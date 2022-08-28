package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.InquiryDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface InquiryService {
    InquiryDto selectUserInquiry(Integer id);

    int selectUserInquiryCnt(Integer userId);

    List<InquiryDto> selectAllUserInquiry(Integer userId, SearchCondition sc);

    @Transactional(rollbackFor = Exception.class)
    void updateUserInquiry(InquiryDto inquiryDto, Integer userId) throws Exception;

    void deleteUserInquiry(InquiryDto inquiryDto) throws Exception;

    void insertUserInquiry(InquiryDto inquiryDto) throws Exception;

    void updateAdminInquiry(InquiryDto inquiryDto) throws Exception;
}
