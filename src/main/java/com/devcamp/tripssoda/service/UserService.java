package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserDto;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

public interface UserService {

    boolean insertUser(UserDto userDto, String firstInterest, String secondInterest, String thirdInterest, int firstTermStatus, int secondTermStatus, int thirdTermStatus) throws Exception;

    UserDto selectUser(String email);

    boolean updateUser(UserDto userDto, HttpSession session) throws Exception;

    boolean deleteUser(String email) throws Exception;

//    @Transactional(rollbackFor = Exception.class)
//    void txTest() throws Exception;
}
