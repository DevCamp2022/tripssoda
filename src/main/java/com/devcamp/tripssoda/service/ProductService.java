package com.devcamp.tripssoda.service;


import com.devcamp.tripssoda.dto.*;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface ProductService {
    public void regProduct(ProductDto dto, RegProductOptionListDto regProductOptionListDto, RegProductScheduleListDto regProductScheduleListDto, HttpServletRequest request, MultipartFile uploadThumb);
    public void getMainList(Model model);
    public GetDetailProductDto getProductDetail(GetDetailProductDto dto);
    public List<ProductScheduleDto> getScheduleList(Integer productId);
}