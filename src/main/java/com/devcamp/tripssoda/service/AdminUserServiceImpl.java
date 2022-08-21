package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.mapper.ProductMapper;
import com.devcamp.tripssoda.mapper.UserMapper;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService{
    private final UserMapper userMapper;
    private final ProductMapper productMapper;

    public AdminUserServiceImpl(UserMapper userMapper, ProductMapper productMapper){
        this.userMapper = userMapper;
        this.productMapper = productMapper;
    }

    @Override
    public int getAllUserCnt() {
        return userMapper.count();
    }

    @Override
    public List<UserDto> searchSelectUser(SearchCondition sc) {
        return userMapper.searchSelectUser(sc);
    }
}
