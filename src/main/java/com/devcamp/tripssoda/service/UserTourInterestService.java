package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserTourInterestDto;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserTourInterestService {

    boolean insertUserTourInterest(Integer userId, String firstInterest, String secondInterest, String thirdInterest);

    List<UserTourInterestDto> selectAllUserTourInterest(Integer userId);

    void updateUserTourInterest(UserTourInterestDto userTourInterestDto);
}
