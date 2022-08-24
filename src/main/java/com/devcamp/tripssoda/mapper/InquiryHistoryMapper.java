package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.InquiryHistoryDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InquiryHistoryMapper {

    public int insertInquiryHistory(InquiryHistoryDto inquiryHistoryDto);

}
