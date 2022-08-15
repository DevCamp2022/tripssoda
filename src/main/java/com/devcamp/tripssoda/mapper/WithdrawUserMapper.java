package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.dto.WithdrawUserDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WithdrawUserMapper {

    public int insertWithdrawUser(UserDto userDto);
}
