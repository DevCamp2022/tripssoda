package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CombinedBoardHistoryMapper {

    public int insert(CombinedBoardDto combinedBoardDto);
}
