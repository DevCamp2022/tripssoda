package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserTourInterestDto;
import com.devcamp.tripssoda.mapper.UserTourInterestMapper;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserTourInterestServiceImpl implements UserTourInterestService {

    private UserTourInterestMapper userTourInterestMapper;

    public UserTourInterestServiceImpl(UserTourInterestMapper userTourInterestMapper) {
        this.userTourInterestMapper = userTourInterestMapper;
    }
    @Override
    public boolean insertUserTourInterest(Integer userId, String firstInterest, String secondInterest, String thirdInterest) {

        UserTourInterestDto first = new UserTourInterestDto(userId, firstInterest, 1);
        UserTourInterestDto second = new UserTourInterestDto(userId, secondInterest, 2);
        UserTourInterestDto third = new UserTourInterestDto(userId, thirdInterest, 3);

        int rowCnt1 = userTourInterestMapper.insertUserTourInterest(first);
        if(rowCnt1 != 1) {
            return false;
        }
        int rowCnt2 = userTourInterestMapper.insertUserTourInterest(second);
        if(rowCnt2 != 1) {
            return false;
        }
        int rowCnt3 = userTourInterestMapper.insertUserTourInterest(third);
        if(rowCnt3 != 1) {
            return false;
        }
        return true;
    }

    @Override
    public List<UserTourInterestDto> selectAllUserTourInterest(Integer userId) {
        return userTourInterestMapper.selectAllUserTourInterest(userId);
    }

    @Override
    public void updateUserTourInterest(UserTourInterestDto userTourInterestDto) {
        userTourInterestMapper.updateUserTourInterest(userTourInterestDto);
    }
}
