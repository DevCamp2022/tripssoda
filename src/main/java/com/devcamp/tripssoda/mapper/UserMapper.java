package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    public int insertUser(UserDto userDto) throws Exception;
    public UserDto selectUser(String email);

    public List<UserDto> selectAllUser();
    public List<UserDto> searchSelectUser(SearchCondition sc);

    public UserDto selectUserByNickname(String nickname);

    public UserDto selectUserByEmail(String email);

    public UserDto selectUserByNameAndEmail(Map map);

    public String selectEmailByNameAndTel(Map map);

    public int updateUser(UserDto userDto);

    public int updateUserPassword(Map map);

    public int deleteUser(String email);

    public int updateCreatedBy(Map createInfo);

    public int setUpdatedBy(Map updateInfo);

    public int updateUserCode(Map updateInfo);

}
