package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.ProductReviewDto;
import com.devcamp.tripssoda.dto.SearchCondition;

import java.util.List;

public interface ProductReviewService {
    ProductReviewDto selectProductReview(Integer id);

    List<ProductReviewDto> selectAllUserProductReview(Integer userId, SearchCondition sc);

    int selectAllUserProductReviewCnt(Integer userId);
}
