package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.QuestionDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.QuestionMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QuestionServiceImpl implements QuestionService {

    private QuestionMapper questionMapper;

    public QuestionServiceImpl(QuestionMapper questionMapper) {
        this.questionMapper = questionMapper;
    }

    @Override
    public List<QuestionDto> selectAllUserQuestion(Integer userId, SearchCondition sc) {
        Map userIdAndsc = new HashMap();
        userIdAndsc.put("userId", userId);
        userIdAndsc.put("sc", sc);

        return questionMapper.selectAllUserQuestion(userIdAndsc);

    }

    @Override
    public int selectAllUserQuestionCnt(Integer userId) {

        return questionMapper.selectAllUserQuestionCnt(userId);
    }
}
