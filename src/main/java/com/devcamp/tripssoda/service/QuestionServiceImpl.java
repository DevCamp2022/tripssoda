package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.QuestionDto;
import com.devcamp.tripssoda.mapper.QuestionMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QuestionServiceImpl implements QuestionService {
    QuestionMapper questionMapper;

    //생성자 주입
    QuestionServiceImpl(QuestionMapper questionMapper) {
        this.questionMapper = questionMapper;
    }

    @Override
    public int getCount() throws Exception {
        return questionMapper.count();
    }
    @Override
    public int write(QuestionDto dto) throws Exception {
        return questionMapper.insert(dto);
    }
    @Override
    public QuestionDto read(Integer id) throws Exception {
        QuestionDto dto = questionMapper.select(id);
        questionMapper.increaseViewCnt(id);
        return dto;
    }
    @Override
    public int modify(QuestionDto dto) throws Exception {
        return questionMapper.update(dto);
    }
    @Override
    public int remove(Integer id, Integer userId) throws Exception {
        Map map = new HashMap();
        map.put("id", id);
        map.put("userId", userId);
        return questionMapper.delete(map);
    }

    @Override
    public List<QuestionDto> getPage(Map map) throws Exception {
        return questionMapper.selectPage(map);
    }

    @Override
    public int modifyAnswerCnt(Integer questionId, Integer cnt) throws Exception {
        Map map = new HashMap();
        map.put("id", questionId);
        map.put("cnt", cnt);
        return questionMapper.updateAnswerCnt(map);
    }

    @Override
    public List<QuestionDto> waitingGetPage(Map map) throws Exception {
        return questionMapper.waitingSelectPage(map);
    }

    @Override
    public int waitingGetCount() throws Exception {
        return questionMapper.waitingCount();
    }
}
