package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.*;

public interface ProductService {
    public void regProduct(RegProductDto dto, RegProductListDto regProductDtoList);
    public void regProductTwo(ProductDto dto, RegProductOptionListDto regProductOptionListDto, RegProductScheduleListDto regProductScheduleListDto);

}