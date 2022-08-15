package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserHistoryDto;
import com.devcamp.tripssoda.mapper.UserHistoryMapper;
import org.springframework.stereotype.Service;

@Service
public class UserHistoryService {

    private UserHistoryMapper userHistoryMapper;

    public UserHistoryService(UserHistoryMapper userHistoryMapper) {
        this.userHistoryMapper = userHistoryMapper;
    }

    public int insertUserHistory(UserHistoryDto userHistoryDto) {
        return userHistoryMapper.insertUserHistory(userHistoryDto);
    }
}
