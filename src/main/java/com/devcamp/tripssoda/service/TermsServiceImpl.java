package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.TermsDto;
import com.devcamp.tripssoda.mapper.TermsMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TermsServiceImpl implements TermsService {

    private TermsMapper termsMapper;

    // 생성자
    public TermsServiceImpl(TermsMapper termsMapper) {
        this.termsMapper = termsMapper;
    }


    @Override
    public int insertTerms(TermsDto termsDto) {
        return termsMapper.insertTerms(termsDto);
    }

    @Override
    public TermsDto selectTerms(String userCode, Integer orderNo) {
        Map selectConditionMap = new HashMap();
        selectConditionMap.put("userCode", userCode);
        selectConditionMap.put("orderNo", orderNo);
        return termsMapper.selectTerms(selectConditionMap);
    }

    @Override
    public List<TermsDto> selectAllTermsByCode(String userCode) {
        return termsMapper.selectAllTermsByCode(userCode);
    }

    @Override
    public int updateTerms(TermsDto termsDto) {
        return termsMapper.updateTerms(termsDto);
    }

    @Override
    public int deleteTerms(Integer id) {
        return termsMapper.deleteTerms(id);
    }
}
