package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.service.AdminUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class) //ac를자동으로 만들어주는애.
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}) //xml설정파일 위치를 지정해주는것
@WebAppConfiguration
public class AdminUserControllerTest {
    @Autowired
    private AdminUserService adminUserService;

    @Test
    public void userList() {

        SearchCondition sc = new SearchCondition();
        System.out.println("sc = " + sc);
        try{
            int totalCnt = adminUserService.getAllUserCnt();
            System.out.println("totalCnt = " + totalCnt);

            List<UserDto> list = adminUserService.searchSelectUser(sc);

            assertTrue( "totalCount",adminUserService.getAllUserCnt()==5);

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void partnerList() {
    }
}