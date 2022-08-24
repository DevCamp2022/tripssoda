package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AdminProductDto;
import com.devcamp.tripssoda.dto.ProductOptionDto;
import com.devcamp.tripssoda.mapper.ProductMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminProductServiceImpl implements AdminProductService {
    ProductMapper productMapper;
    public AdminProductServiceImpl(ProductMapper productMapper){
        this.productMapper = productMapper;
    }

    public List<AdminProductDto> selectProductByApprovalStatus(String approvalStatus){
        return productMapper.selectProductByApprovalStatus(approvalStatus);
    }

    public int getAllProductCnt(){
        return productMapper.count();
    }

    public List<ProductOptionDto> selectOptionList(Integer productId){
        return productMapper.selectOptionList(productId);
    }
}
