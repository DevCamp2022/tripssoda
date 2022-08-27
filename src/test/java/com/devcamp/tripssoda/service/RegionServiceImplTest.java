package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.RegionDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class) //ac를자동으로 만들어주는애.
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}) //xml설정파일 위치를 지정해주는것
@WebAppConfiguration
public class RegionServiceImplTest {
    @Autowired
    private RegionService regionService;

    @Test
    public void insertContinentTest() throws Exception {
        String continentNames = "동아시아,동남아시아,서남아시아,유럽,아메리카,오세아니아,아프리카";
        String[] continentArr = continentNames.split(",");
        for(int i = 0; i<=continentArr.length-1; i++){
            String idx = "0"+i;
            System.out.println("idx = " + idx);
            RegionDto regionDto = new RegionDto(idx, continentArr[i]);
            System.out.println("regionDto = " + regionDto);
            int rowCnt = regionService.insertContinent(regionDto);
            assertTrue(rowCnt==1);
        }
    }

    @Test
    public void insertCountryTest2() throws Exception {
        //1. "나라"이름인 countryNames를 변경
        String countryNames = "이집트,남아프리카공화국,탄자니아,에티오피아,케냐,나미비아,모로코";
        String[] countryArr = countryNames.split(",");
        for (int i = 0; i <= countryArr.length - 1; i++) {
            //2. 더하는 값을 변경
            String idx = 36 + i + "";
            System.out.println("idx = " + idx);

            //3. 아래 continentCode를 바꾼다.
            RegionDto regionDto = new RegionDto(idx, countryArr[i], "06");
            System.out.println("regionDto = " + regionDto);
            int rowCnt = regionService.insertCountry(regionDto);
            assertTrue(rowCnt == 1);
        }
    }

    @Test
    public void insertCityTest3() throws Exception {

        //1. "도시"이름인 cityNames를 바꾼다.
        String cityNames = "카사블랑카,마라케시,페스";

        String[] cityArr = cityNames.split(",");
        //2. cityCode인 int i의 값을 바꾼다.
        for (int i = 0; i <= cityArr.length - 1; i++) {
            String idx = 159 + i + "" ;
            System.out.println("idx = " + idx);

            //3. 아래 countryCode를 바꾼다.
            RegionDto regionDto = new RegionDto(idx, cityArr[i], "42");

            System.out.println("regionDto = " + regionDto);
            int rowCnt = regionService.insertCity(regionDto);
            assertTrue(rowCnt == 1);
        }
    }

    @Test
    public void updateCityCode() throws Exception {
        //도시가 100개가 넘어서 update테스트코드로 city_code를 3자리로 변경
        //1. 반복문으로 00부터 09까지 돌려서 cityCode값을 000~009로 변경
        //2. 반복문으로 10부터 99까지 돌려서 cityCode값을 010~099로 변경
        //cityCode1은 where 조건
        String cityCode1 = "";
        //cityCode2는 update할 값
        String cityCode2 = "";

        for (int i = 10; i <= 99; i++) {

                cityCode1 = "" + i;
                cityCode2 = "0" + i;
                regionService.updateCity(cityCode1, cityCode2);
        }

    }
}