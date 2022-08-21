package com.devcamp.tripssoda.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserPointMapper {
    public Integer selectUserPoint(Integer userId);

    public Integer updateUserPoint(Map<String, Object> userPoint);

    public Integer updateUserPoint(Integer userId, Integer newPoint, Integer amount, String message);
    public Integer insertUserPointHistory(Map<String, Object> pointHistory);
}