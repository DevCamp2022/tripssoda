package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.InquiryDto;
import com.devcamp.tripssoda.dto.SearchCondition;

import java.util.List;

public interface InquiryService {
    InquiryDto selectUserInquiry(Integer id);

    int selectUserInquiryCnt(Integer userId);

    List<InquiryDto> selectAllUserInquiry(Integer userId, SearchCondition sc);

    void updateUserInquiry(InquiryDto inquiryDto) throws Exception;

    void deleteUserInquiry(InquiryDto inquiryDto) throws Exception;

    void insertUserInquiry(InquiryDto inquiryDto) throws Exception;
}
