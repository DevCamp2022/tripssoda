package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AccompanyDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface AccompanyService {

    public int selectUserAccompanyCnt(Integer userId);

    public List<AccompanyDto> selectAllUserAccompany(Integer userId, SearchCondition sc);
    int getCount() throws Exception;

//    int write(AccompanyDto dto) throws Exception;

    int write(AccompanyDto dto, HttpServletRequest request, MultipartFile uploadThumb) throws Exception;

    AccompanyDto read(Integer id) throws Exception;

    int modify(AccompanyDto dto) throws Exception;

    int modify(AccompanyDto dto, MultipartFile uploadThumb, HttpServletRequest request) throws Exception;

    int remove(Integer id, Integer userId) throws Exception;

    List<AccompanyDto> getPage(Map map) throws Exception;


    List<AccompanyDto> waitingGetPage(Map map) throws Exception;

    int waitingGetCount() throws Exception;

    List<AccompanyDto> selectAccompanyForMain(Map map);

    int updateStatus(AccompanyDto accompanyDto) throws Exception;

    int regionCount(String area3) throws Exception;

    List<AccompanyDto> regionSelectPage(Map map) throws Exception;

    int waitingRegionCount(String area3) throws Exception;

    List<AccompanyDto> waitingRegionSelectPage(Map map) throws Exception;
}
