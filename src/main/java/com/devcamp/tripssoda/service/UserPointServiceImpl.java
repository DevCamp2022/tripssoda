package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.mapper.UserPointMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserPointServiceImpl implements UserPointService {

    private final UserPointMapper userPointMapper;

    public UserPointServiceImpl(UserPointMapper userPointMapper) {
        this.userPointMapper = userPointMapper;
    }

    //히스토리에는 얼마가 어떻게 사용됐는지.
    //update에는 얼마가 남았는지.
    //업데이트와 히스토리 분리가 필요해보임.

    @Override
    public Integer updateUserPoint(Integer userId, Integer newPoint, Integer amount, String message) {
        System.out.println("updateUserPoint");
        Map<String, Object> userPoint = new HashMap<>();
        userPoint.put("userId", userId);
        userPoint.put("point", newPoint);
        userPoint.put("amount",amount);
        userPoint.put("message", message);

        int rowCnt = userPointMapper.updateUserPoint(userPoint);
        if (rowCnt==1){
            rowCnt = userPointMapper.insertUserPointHistory(userPoint);
            if (rowCnt == 1){
                return 1;
            }
        }

        return -1;
    }

    @Override
    public Integer isAvailablePoint(Integer usedPoint, Integer userId) throws Exception {
        Integer availablePoint = userPointMapper.selectUserPoint(userId);
        if (availablePoint >= usedPoint) {
            return availablePoint;
        }
        return -1;
    }

    public int insertUserPointHistory(Integer userId, Integer amount, String message) {
        Map<String, Object> pointHistory = new HashMap<>();
        pointHistory.put("userId", userId);
        pointHistory.put("amount", amount);
        pointHistory.put("message", message);

        return userPointMapper.insertUserPointHistory(pointHistory);
    }

}
