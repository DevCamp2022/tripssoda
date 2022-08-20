package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.AccompanyDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AccompanyMapper {
    public int selectUserAccompanyCnt(Integer userId);

    public List<AccompanyDto> selectAllUserAccompany(Map map);

}
