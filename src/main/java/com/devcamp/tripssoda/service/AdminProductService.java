package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AdminProductDto;

import java.util.List;

public interface AdminProductService {
    public List<AdminProductDto> selectProductByApprovalStatus(String approvalStatus);
    public int getAllProductCnt();
}
