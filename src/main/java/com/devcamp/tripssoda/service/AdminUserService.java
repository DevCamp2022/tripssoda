package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;

import java.util.List;

public interface AdminUserService {
    public int getAllUserCnt();

    public List<UserDto> searchSelectUser(SearchCondition sc);
}
