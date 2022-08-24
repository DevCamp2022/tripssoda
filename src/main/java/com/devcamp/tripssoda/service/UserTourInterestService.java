package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserTourInterestDto;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserTourInterestService {

    void insertUserTourInterest(Integer userId, String firstInterest, String secondInterest, String thirdInterest) throws Exception;

    List<String> selectAllUserTourInterestKeyword(Integer userId);

    List<UserTourInterestDto> selectAllUserTourInterest(Integer userId);

    void updateUserTourInterest(String firstInterest, String secondInterest, String thirdInterest, HttpSession session) throws Exception;
}
