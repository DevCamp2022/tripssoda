package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AccompanyDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.AccompanyMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AccompanyService {

    private AccompanyMapper accompanyMapper;

    public AccompanyService(AccompanyMapper accompanyMapper) {
        this.accompanyMapper = accompanyMapper;
    }


    public int selectUserAccompanyCnt(Integer userId) {
        return accompanyMapper.selectUserAccompanyCnt(userId);
    }

    public List<AccompanyDto> selectAllUserAccompany(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);

        return accompanyMapper.selectAllUserAccompany(userIdAndSc);
    }

}
