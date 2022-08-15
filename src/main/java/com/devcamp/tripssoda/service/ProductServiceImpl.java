package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.dto.ProductDto;
import com.devcamp.tripssoda.dto.RegProductDto;
import com.devcamp.tripssoda.mapper.PartnerMapper;
import com.devcamp.tripssoda.mapper.ProductMapper;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductMapper productMapper;

    public ProductServiceImpl(ProductMapper productMapper){
        this.productMapper = productMapper;
    }

    @Override
    public void regProduct(RegProductDto dto) {
        productMapper.insertProduct(dto);
    }
}
