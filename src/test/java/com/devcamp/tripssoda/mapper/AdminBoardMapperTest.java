package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class) //ac를자동으로 만들어주는애.
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}) //xml설정파일 위치를 지정해주는것
@WebAppConfiguration
public class AdminBoardMapperTest {
    @Autowired
    private CombinedBoardMapper combinedBoardMapper;

    public AdminBoardMapperTest(){}


    @Test
    public void insertTestData() throws Exception{
//        adminBoardMapper.deleteAll();
        for(int i=1; i<=10; i++){
            CombinedBoardDto combinedBoardDto = new CombinedBoardDto("M00"+(i%3+1),41, "제목제목", "내용내용",41,41);
            combinedBoardMapper.insert(combinedBoardDto);
        }
    }




}