package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.*;
import org.springframework.ui.Model;
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

    }