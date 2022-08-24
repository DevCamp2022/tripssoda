package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    public void insertProduct(ProductDto dto);
    public void insertProductOption(RegProductOptionDto PODto);
    public void insertProductSchedule(RegProductScheduleDto PSDto);
    public List<GetMainListProductDto> selectMainList(String category);
    public GetDetailProductDto selectProductDetail(GetDetailProductDto dto);
    public List<ProductScheduleDto> selectScheduleList(Integer productId);
    public List<AdminProductDto> selectProductByApprovalStatus(String approvalStatus);
    public int count();
    public List<ProductOptionDto> selectOptionList(Integer productId);
    public GetDetailProductDto selectProductDetailById(Integer productId);
    public List<ProductScheduleDto> getScheduleList(Integer productId);
    public int selectProductAvailability(Map<String, Integer> scheduleInfo);
    public int increaseCurrentMember(Map<String, Integer> scheduleInfo);
    public int setUpdateBy(Map<String, Integer> map);
    public int updateProductApproval(ApprovalDto approvalDto);
    public int insertApprovalHistory(ApprovalDto approvalDto);
}
