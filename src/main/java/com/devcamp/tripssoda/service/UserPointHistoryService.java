package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserPointHistoryDto;

import java.util.List;

public interface UserPointHistoryService {
    UserPointHistoryDto selectUserPointHistory(Integer id);

    List<UserPointHistoryDto> selectAllUserPointHistory(Integer userId, SearchCondition sc);

    int selectAllUserPointHistoryCnt(Integer userId);
}
