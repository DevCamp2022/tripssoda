package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserHistoryDto;
import com.devcamp.tripssoda.mapper.UserHistoryMapper;
import org.springframework.stereotype.Service;

@Service
public class UserHistoryServiceImpl implements UserHistoryService {

    private UserHistoryMapper userHistoryMapper;

    public UserHistoryServiceImpl(UserHistoryMapper userHistoryMapper) {
        this.userHistoryMapper = userHistoryMapper;
    }

    @Override
    public int insertUserHistory(UserHistoryDto userHistoryDto) {
        return userHistoryMapper.insertUserHistory(userHistoryDto);
    }
}
