package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.InquiryDto;
import com.devcamp.tripssoda.dto.InquiryHistoryDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.InquiryHistoryMapper;
import com.devcamp.tripssoda.mapper.InquiryMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InquiryServiceImpl implements InquiryService {

    private InquiryMapper inquiryMapper;

    private InquiryHistoryMapper inquiryHistoryMapper;

    public InquiryServiceImpl(InquiryHistoryMapper inquiryHistoryMapper, InquiryMapper inquiryMapper) {
        this.inquiryHistoryMapper = inquiryHistoryMapper;
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
    @Transactional(rollbackFor = Exception.class)
    public void updateUserInquiry(InquiryDto inquiryDto, Integer userId) throws Exception {
        // 문의글의 id를 가져옴
        Integer id = inquiryDto.getId();
        // id로부터 수정전의 Dto를 가져옴
        InquiryDto oldInquiryDto = inquiryMapper.selectUserInquiry(id);
        System.out.println("inquiryDto = " + inquiryDto);
        int rowCnt = inquiryMapper.updateUserInquiry(inquiryDto);

        if(rowCnt != 1) {
            throw new Exception("1:1 문의글 수정 오류");
        }

        System.out.println("oldInquiryDto = " + oldInquiryDto);

        // 이력 테이블에 저장할 Dto를 만듦
        InquiryHistoryDto inquiryHistoryDto = new InquiryHistoryDto();
        // 이력Dto에 문의글 id를 저장
        inquiryHistoryDto.setInquiryId(id);
        // 이력Dto에 수정한 사람(userId)를 저장
        inquiryHistoryDto.setUpdatedBy(userId);

        // 수정 전 제목과 수정 후의 제목이 다르면 history에 변경내용 저장
        if(!inquiryDto.getTitle().equals(oldInquiryDto.getTitle())) {
            inquiryHistoryDto.setItem("제목");
            inquiryHistoryDto.setBeforeContent(oldInquiryDto.getTitle());
            System.out.println("inquiryHistoryDto = " + inquiryHistoryDto);

            int rowCnt2 = inquiryHistoryMapper.insertInquiryHistory(inquiryHistoryDto);
            if(rowCnt2 != 1) {
                throw new Exception("제목 변경 이력저장 실패");
            }
        }
        // 수정 전 내용과 수정후의 내용이 다르다면 history에 변경내용 저장
        if(!inquiryDto.getContent().equals(oldInquiryDto.getContent())) {
            inquiryHistoryDto.setItem("내용");
            inquiryHistoryDto.setBeforeContent(oldInquiryDto.getContent());

            System.out.println("inquiryHistoryDto = " + inquiryHistoryDto);

            int rowCnt3 = inquiryHistoryMapper.insertInquiryHistory(inquiryHistoryDto);
            if(rowCnt3 != 1) {
                throw new Exception("내용 변경 이력저장 실패");
            }
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

    @Override
    public void updateAdminInquiry(InquiryDto inquiryDto) throws Exception {

        int rowCnt = inquiryMapper.updateAdminInquiry(inquiryDto);
        if(rowCnt != 1) {
            throw new Exception("1:1 문의글 답변 등록 오류");
        }

    }

}
