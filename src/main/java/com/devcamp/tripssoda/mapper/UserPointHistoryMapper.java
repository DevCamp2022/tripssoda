package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.UserPointHistoryDto;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.User;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserPointHistoryMapper {

    public UserPointHistoryDto selectUserPointHistory(Integer id);

    public List<UserPointHistoryDto> selectAllUserPointHistory(Map map);

    public int selectAllUserPointHistoryCnt(Integer id);


}
