package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.InquiryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface InquiryMapper {

    public InquiryDto selectUserInquiry(Integer id);

    public int selectUserInquiryCnt(Integer userId);

    public List<InquiryDto> selectAllUserInquiry(Map map);

}
