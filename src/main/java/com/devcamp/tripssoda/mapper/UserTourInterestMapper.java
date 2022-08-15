package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.UserTourInterestDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserTourInterestMapper {

    public int insertUserTourInterest(UserTourInterestDto userTourInterestDto);

    public List<UserTourInterestDto> selectAllUserTourInterest(Integer userId);

    public int updateUserTourInterest(UserTourInterestDto userTourInterestDto);
}
