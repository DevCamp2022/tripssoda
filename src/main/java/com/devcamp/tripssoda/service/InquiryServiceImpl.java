package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.InquiryDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.InquiryMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InquiryServiceImpl implements InquiryService {

    private InquiryMapper inquiryMapper;

    public InquiryServiceImpl(InquiryMapper inquiryMapper) {
        this.inquiryMapper = inquiryMapper;
    }

    @Override
    public InquiryDto selectUserInquiry(Integer id) {
        return inquiryMapper.selectUserInquiry(id);
    }

    @Override
    public int selectUserInquiryCnt(Integer userId) {
        return inquiryMapper.selectUserInquiryCnt(userId);
    }

    @Override
    public List<InquiryDto> selectAllUserInquiry(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);

        return inquiryMapper.selectAllUserInquiry(userIdAndSc);
    }

    @Override
    public void updateUserInquiry(InquiryDto inquiryDto) throws Exception {
        int rowCnt = inquiryMapper.updateUserInquiry(inquiryDto);
        if(rowCnt != 1) {
            throw new Exception("1:1 문의글 수정 오류");
        }
    }

    @Override
    public void deleteUserInquiry(InquiryDto inquiryDto) throws Exception {
        int rowCnt = inquiryMapper.deleteUserInquiry(inquiryDto);
        if(rowCnt != 1) {
            throw new Exception("1:1 문의글 삭제 오류");
        }
    }

    @Override
    public void insertUserInquiry(InquiryDto inquiryDto) throws Exception {
        int rowCnt = inquiryMapper.insertUserInquiry(inquiryDto);
        if(rowCnt != 1) {
            throw new Exception("1:1 문의글 등록 오류");
        }
    }
}
