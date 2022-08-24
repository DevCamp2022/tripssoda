package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.QuestionDto;

import java.util.List;
import java.util.Map;

public interface QuestionService {
    int getCount() throws Exception;

    int write(QuestionDto dto) throws Exception;

    QuestionDto read(Integer id) throws Exception;

    int modify(QuestionDto dto) throws Exception;

    int remove(Integer id, Integer userId) throws Exception;

    List<QuestionDto> getPage(Map map) throws Exception;

    int modifyAnswerCnt(Integer questionId, Integer cnt) throws Exception;

    List<QuestionDto> waitingGetPage(Map map) throws Exception;

    public int waitingGetCount() throws Exception;
}
