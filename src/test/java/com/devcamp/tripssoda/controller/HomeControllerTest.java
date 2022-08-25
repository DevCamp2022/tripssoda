package com.devcamp.tripssoda.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.validation.constraints.AssertTrue;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@WebAppConfiguration
public class HomeControllerTest {

    @Test
    public void test(){

        String  tmp= "#아무나다좋아      #aaa   #asdasd    #        ";
        String newStr = tmp.trim();
        System.out.println("newStr = " + newStr);
        newStr = newStr.replaceAll("\\s+"," ");
        System.out.println("newStr = " + newStr);
    }
}