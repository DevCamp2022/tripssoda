package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.ProductReviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductReviewMapper {

    public ProductReviewDto selectProductReview(Integer id);

    public List<ProductReviewDto> selectAllUserProductReview(Map map);

    public int selectAllUserProductReviewCnt(Integer userId);
}
