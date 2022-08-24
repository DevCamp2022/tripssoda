package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AccompanyDto;
import com.devcamp.tripssoda.dto.QuestionDto;
import com.devcamp.tripssoda.mapper.AccompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccompanyServiceImpl implements AccompanyService {
    AccompanyMapper accompanyMapper;

    AccompanyServiceImpl(AccompanyMapper accompanyMapper) {
           this.accompanyMapper = accompanyMapper;
    }

    @Override
    public int getCount() throws Exception {
        return accompanyMapper.count();
    }
    @Override
    public int write(AccompanyDto dto) throws Exception {
        return accompanyMapper.insert(dto);
    }
    @Override
    public AccompanyDto read(Integer id) throws Exception {
        AccompanyDto dto = accompanyMapper.select(id);
        accompanyMapper.increaseViewCnt(id);
        return dto;
    }
    @Override
    public int modify(AccompanyDto dto) throws Exception {
        return accompanyMapper.update(dto);
    }
    @Override
    public int remove(Integer id, Integer userId) throws Exception {
        Map map = new HashMap();
        map.put("id", id);
        map.put("userId", userId);
        return accompanyMapper.delete(map);
    }

    @Override
    public List<AccompanyDto> getPage(Map map) throws Exception {
        return accompanyMapper.selectPage(map);
    }

    @Override
    public List<AccompanyDto> waitingGetPage(Map map) throws Exception {
        return accompanyMapper.waitingSelectPage(map);
    }

    @Override
    public int waitingGetCount() throws Exception {
        return accompanyMapper.waitingCount();
    }

}
