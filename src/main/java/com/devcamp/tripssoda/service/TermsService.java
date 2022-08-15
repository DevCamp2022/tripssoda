package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.TermsDto;

import java.util.List;

public interface TermsService {
    int insertTerms(TermsDto termsDto);

    TermsDto selectTerms(String userCode, Integer orderNo);

    List<TermsDto> selectAllTermsByCode(String userCode);

    int updateTerms(TermsDto termsDto);

    int deleteTerms(Integer id);
}
