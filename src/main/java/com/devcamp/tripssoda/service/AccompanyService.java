package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AccompanyDto;

import java.util.List;
import java.util.Map;

public interface AccompanyService {
    int getCount() throws Exception;

    int write(AccompanyDto dto) throws Exception;

    AccompanyDto read(Integer id) throws Exception;

    int modify(AccompanyDto dto) throws Exception;

    int remove(Integer id, Integer userId) throws Exception;

    List<AccompanyDto> getPage(Map map) throws Exception;
}
