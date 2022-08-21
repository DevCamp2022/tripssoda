package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.ProductReviewDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.ProductReviewMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductReviewServiceImpl implements ProductReviewService {

    private ProductReviewMapper productReviewMapper;

    public ProductReviewServiceImpl(ProductReviewMapper productReviewMapper) {
        this.productReviewMapper = productReviewMapper;
    }

    @Override
    public ProductReviewDto selectProductReview(Integer id) {
        return productReviewMapper.selectProductReview(id);
    }

    @Override
    public List<ProductReviewDto> selectAllUserProductReview(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);

        return productReviewMapper.selectAllUserProductReview(userIdAndSc);
    }

    @Override
    public int selectAllUserProductReviewCnt(Integer userId) {
        return productReviewMapper.selectAllUserProductReviewCnt(userId);
    }

}
