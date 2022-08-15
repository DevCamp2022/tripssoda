package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.ProductDto;
import com.devcamp.tripssoda.dto.RegProductDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
    public void insertProduct(RegProductDto dto);
}
