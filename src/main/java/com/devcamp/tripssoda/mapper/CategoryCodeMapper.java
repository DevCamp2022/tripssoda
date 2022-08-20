package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.CategoryCodeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryCodeMapper {
    public List<String> selectAllCategoryCode();
}
