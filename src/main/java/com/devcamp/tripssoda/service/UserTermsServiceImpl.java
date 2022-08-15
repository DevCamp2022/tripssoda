package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserTermsDto;
import com.devcamp.tripssoda.mapper.UserTermsMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserTermsServiceImpl implements UserTermsService {

    private UserTermsMapper userTermsMapper;

    public UserTermsServiceImpl(UserTermsMapper userTermsMapper) {
        this.userTermsMapper = userTermsMapper;
    }

    @Override
    public UserTermsDto selectUserTerms(Integer id) {
        return userTermsMapper.selectUserTerms(id);
    }

    @Override
    public List<UserTermsDto> selectAllUserTerms() {
        return userTermsMapper.selectAllUserTerms();
    }

    @Override
    public int updateUserTerms(UserTermsDto userTermsDto) {
        return userTermsMapper.updateUserTerms(userTermsDto);
    }

    @Override
    public int deleteUserTerms(Integer id) {
        return userTermsMapper.deleteUserTerms(id);
    }
}
