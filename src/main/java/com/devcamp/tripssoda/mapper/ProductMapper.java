package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    public void insertProduct(ProductDto dto);
    public void insertProductOption(RegProductOptionDto PODto);
    public void insertProductSchedule(RegProductScheduleDto PSDto);
    public List<ProductDto> selectCategoryList(String category);
    public List<GetMainListProductDto> selectMainList(String category);
}
