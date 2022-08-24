package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ProductMapper {
    public void insertProduct(ProductDto dto);
    public void insertProductOption(RegProductOptionDto PODto);
    public void insertProductSchedule(RegProductScheduleDto PSDto);
    public List<GetMainListProductDto> selectMainList(String category);
    public GetDetailProductDto selectProductDetail(GetDetailProductDto dto);
    public List<ProductScheduleDto> selectScheduleList(Integer productId);
    public UpdateProductDto selectProductUpdate(Integer productId);
    public List<UpdateProductDto> selectProductOptionUpdate(Integer productId);
    public List<UpdateProductDto> selectProductScheduleUpdate(Integer productId);
    public void updateProduct(UpdateProductDto dto);
    public int updateProductOption(RegProductOptionDto PODto);
    public void deleteProductOption(Integer productOptionId);
    public int updateProductSchedule(RegProductScheduleDto PSDto);
    public void deleteProductSchedule(Integer productScheduleId);
}
