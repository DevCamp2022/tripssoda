package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.UserTermsDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserTermsMapper {

    public int insertUserTerms(UserTermsDto userTermsDto);

    public UserTermsDto selectUserTerms(Integer id);

    public List<UserTermsDto> selectAllUserTerms();

    public int updateUserTerms(UserTermsDto userTermsDto);

    public int deleteUserTerms(Integer id);
}
