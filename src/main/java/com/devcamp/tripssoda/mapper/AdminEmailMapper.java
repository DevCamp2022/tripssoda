package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.AdminEmailReceiverInfoDto;
import com.devcamp.tripssoda.dto.EmailHistoryDto;
import org.apache.ibatis.annotations.Mapper;

import javax.validation.constraints.Email;
import java.util.List;
import java.util.Map;

@Mapper
public interface AdminEmailMapper {
    public List<AdminEmailReceiverInfoDto> selectReceiverByUserCode(Map<String,String> receiver);
    public int insertEmailHistory(EmailHistoryDto emailHistoryDto);

}
