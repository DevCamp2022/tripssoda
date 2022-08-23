package com.devcamp.tripssoda.service;

public interface UserPointService {
    public Integer updateUserPoint(Integer userId, Integer newPoint, Integer amount, String message);

    Integer isAvailablePoint(Integer usedPoint, Integer userId) throws Exception;

    public int insertUserPointHistory(Integer userId, Integer amount, String message);

}