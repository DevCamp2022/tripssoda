package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.Map;

@Mapper
public interface UserMapper {

    public int insertUser(UserDto userDto) throws Exception;
    public UserDto selectUser(String email);

    public int updateUser(UserDto userDto);

    public int deleteUser(String email);

    public int updateCreatedBy(Map createInfo);

    public int updateUpdatedBy(Map updateInfo);

    public int updateUserCode(Map updateInfo);

}
