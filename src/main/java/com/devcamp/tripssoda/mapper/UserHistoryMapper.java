package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.UserHistoryDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserHistoryMapper {

    public int insertUserHistory(UserHistoryDto userHistoryDto);
}
