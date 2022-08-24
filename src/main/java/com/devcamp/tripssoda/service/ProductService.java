package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ProductService {
    public void regProduct(ProductDto dto, RegProductOptionListDto regProductOptionListDto, RegProductScheduleListDto regProductScheduleListDto, HttpServletRequest request, MultipartFile uploadThumb);
    public void getMainList(Model model);
    public GetDetailProductDto getProductDetail(GetDetailProductDto dto);
    public GetDetailProductDto getProductDetailById(Integer productId);

    public List<ProductScheduleDto> selectScheduleList(Integer productId);
    public List<ProductOptionDto> selectOptionList(Integer productId);
    public int updateProductApproval(ApprovalDto approvalDto) throws Exception;
    public List<ProductScheduleDto> getScheduleList(Integer productId);
    public UpdateProductDto getUpdateProduct(Integer productId);
    public List<UpdateProductDto> getUpdateProductOption(Integer productId);
    public List<UpdateProductDto> getUpdateProductSchedule(Integer productId);
    public void updateProduct(UpdateProductDto dto, @RequestParam MultipartFile uploadThumb, HttpServletRequest request, RegProductOptionListDto regProductOptionListDto, RegProductScheduleListDto regProductScheduleListDto);
}
