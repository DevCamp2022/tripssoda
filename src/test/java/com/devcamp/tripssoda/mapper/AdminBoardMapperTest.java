package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
public class AdminBoardMapperTest {
    @Autowired
    private AdminBoardMapper adminBoardMapper;

//    public AdminBoardMapperTest(){}
//    public AdminBoardMapperTest(AdminBoardMapper adminBoardMapper){
//        this.adminBoardMapper = adminBoardMapper;
//    }

    @Test
    public void insertTestData() throws Exception{
//        adminBoardMapper.deleteAll();
        for(int i=1; i<=100; i++){
            CombinedBoardDto combinedBoardDto = new CombinedBoardDto("M00"+(i%3+1),41, "제목제목", "내용내용",41);
            adminBoardMapper.insert(combinedBoardDto);
        }
    }


}