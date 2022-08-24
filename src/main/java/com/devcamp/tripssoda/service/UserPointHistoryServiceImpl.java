package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserPointHistoryDto;
import com.devcamp.tripssoda.mapper.UserPointHistoryMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserPointHistoryServiceImpl implements UserPointHistoryService {

    private UserPointHistoryMapper userPointHistoryMapper;

    public UserPointHistoryServiceImpl(UserPointHistoryMapper userPointHistoryMapper) {
        this.userPointHistoryMapper = userPointHistoryMapper;
    }


    @Override
    public UserPointHistoryDto selectUserPointHistory(Integer id) {
        return userPointHistoryMapper.selectUserPointHistory(id);
    }

    @Override
    public List<UserPointHistoryDto> selectAllUserPointHistory(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);
        return userPointHistoryMapper.selectAllUserPointHistory(userIdAndSc);
    }

    @Override
    public int selectAllUserPointHistoryCnt(Integer userId) {
        return userPointHistoryMapper.selectAllUserPointHistoryCnt(userId);
    }

}
