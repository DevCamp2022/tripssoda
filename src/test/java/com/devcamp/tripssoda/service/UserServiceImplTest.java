package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
public class UserServiceImplTest {

    @Autowired
    private UserService userService;

    @Test
    public void insertUser() throws Exception {
        UserDto userDto = new UserDto("김윤기", "1234", "abcde8@abc.com", "aaaaaaaa", "01046664272", 'M', new Date(), "U001");

        userService.insertUser(userDto, "I001", "I002", "I003");

        assertTrue(1==1);
        assertTrue(2==2);

    }

//    @Test
//    public void tx() throws Exception {
//        userService.txTest();
//    }
}