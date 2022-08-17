package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.ProductDto;
import com.devcamp.tripssoda.dto.RegProductDto;
import com.devcamp.tripssoda.dto.RegProductOptionDto;
import com.devcamp.tripssoda.dto.RegProductOptionListDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
//    아래꺼 사용중
//    public void insertProduct(RegProductDto dto);
    public void insertProduct(ProductDto dto);
    public void insertProductOption(RegProductDto dto);
    public void insertProductOptionList(RegProductOptionDto PODto);

    public void insertProductSchedule(RegProductDto dto);
}
