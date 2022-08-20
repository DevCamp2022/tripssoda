package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AnswerDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.AnswerMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AnswerServiceImpl implements AnswerService {

    private AnswerMapper answerMapper;

    public AnswerServiceImpl(AnswerMapper answerMapper) {
        this.answerMapper = answerMapper;
    }



    @Override
    public AnswerDto selectAnswer(Integer id) {
        return answerMapper.selectAnswer(id);
    }

    @Override
    public int selectAllUserAnswerCnt(Integer userId) {
        return answerMapper.selectAllUserAnswerCnt(userId);
    }

    @Override
    public List<AnswerDto> selectAllUserAnswer(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);

        return answerMapper.selectAllUserAnswer(userIdAndSc);
    }
}
