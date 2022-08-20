package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.EmailVerificationDto;
import com.devcamp.tripssoda.dto.UserDto;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface UserService {

    void insertUser(UserDto userDto, String firstInterest, String secondInterest, String thirdInterest) throws Exception;

    UserDto selectUser(String email);

    List<UserDto> selectAllUser();

    UserDto selectUserByNickname(String nickname);

    UserDto selectUserByEmail(String email);

    UserDto selectUserByNameAndEmail(String name, String email);

    String selectEmailByNameAndTel(String name, String tel);

    void updateUser(UserDto userDto, HttpSession session) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    void updateUserPassword(String email, String pwd) throws Exception;

    void deleteUser(String email) throws Exception;


//    @Transactional(rollbackFor = Exception.class)
//    void txTest() throws Exception;
}
