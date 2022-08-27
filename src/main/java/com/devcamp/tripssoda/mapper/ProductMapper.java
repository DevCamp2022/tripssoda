package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    public void insertProduct(ProductDto dto);
    public void insertProductOption(RegProductOptionDto PODto);
    public void insertProductSchedule(RegProductScheduleDto PSDto);
    public List<GetMainListProductDto> selectMainList(String category);
    public GetDetailProductDto selectProductDetail(GetDetailProductDto dto);
    public List<AdminProductDto> selectProductByApprovalStatus(String approvalStatus);
    public int count();
    public List<ProductOptionDto> selectOptionList(Integer productId);
    public GetDetailProductDto selectProductDetailById(Integer productId);
    public List<ProductScheduleDto> getScheduleList(Integer productId);
    public int selectProductAvailability(Map<String, Integer> scheduleInfo);
    public int increaseCurrentMember(Map<String, Integer> scheduleInfo);
    public int setUpdateBy(Map<String, Integer> map);
    public int updateProductApproval(ApprovalDto approvalDto);
    public int insertProductApprovalHistory(ApprovalDto approvalDto);
    public int updatePartnerpproval(ApprovalDto approvalDto);
    public int insertPartnerApprovalHistory(ApprovalDto approvalDto);
    public List<ProductScheduleDto> selectProductScheduleList(GetDetailProductDto dto);
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
