package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AnswerDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.AnswerMapper;
import org.springframework.stereotype.Service;
import com.devcamp.tripssoda.mapper.AnswerMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AnswerServiceImpl implements AnswerService {

    private AnswerMapper answerMapper;

    private QuestionService questionService;
    public AnswerServiceImpl(AnswerMapper answerMapper, QuestionService questionService) {
        this.answerMapper = answerMapper;
        this.questionService = questionService;
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

    @Override
    public int getCount(Integer questionId) throws Exception {
        return answerMapper.count(questionId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(AnswerDto dto) throws Exception {
        questionService.modifyAnswerCnt(dto.getQuestionId(), 1);
        return answerMapper.insert(dto);
    }
    @Override
    public AnswerDto read(Integer id) throws Exception {
        return answerMapper.select(id);
    }
    @Override
    public int modify(AnswerDto dto) throws Exception {
        return answerMapper.update(dto);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer id, Integer questionId, Integer userId) throws Exception {
        questionService.modifyAnswerCnt(questionId, -1);
        Map<String, Integer> map = new HashMap();
        map.put("id", id);
        map.put("userId", userId);
        return answerMapper.delete(map);
    }
    @Override
    public List<AnswerDto> getList(Integer questionId) throws Exception {
        return answerMapper.selectAll(questionId);
    }
}
