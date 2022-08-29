package com.devcamp.tripssoda.controller;

import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;

public class AccompanyControllerTest {
    @Test
    public void dateTest() throws Exception {
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");

        long format_time1 = System.currentTimeMillis();
        String format_time2 = format2.format (System.currentTimeMillis());

        System.out.println(format_time1);
        System.out.println(format_time2);
    }
}