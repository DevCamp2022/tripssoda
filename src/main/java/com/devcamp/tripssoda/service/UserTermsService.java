package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserTermsDto;

import java.util.List;

public interface UserTermsService {
    UserTermsDto selectUserTerms(Integer id);

    List<UserTermsDto> selectAllUserTerms();

    int updateUserTerms(UserTermsDto userTermsDto);

    int deleteUserTerms(Integer id);
}
