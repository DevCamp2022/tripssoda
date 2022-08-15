package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.TermsDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TermsMapper {

    public int insertTerms(TermsDto termsDto);

    public TermsDto selectTerms(Map selectConditionMap);

    public List<TermsDto> selectAllTermsByCode(String userCode);

    public int updateTerms(TermsDto termsDto);

    public int deleteTerms(Integer id);

}
