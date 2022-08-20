package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.QuestionDto;
import com.devcamp.tripssoda.dto.SearchCondition;

import java.util.List;

public interface QuestionService {
    List<QuestionDto> selectAllUserQuestion(Integer userId, SearchCondition sc);

    int selectAllUserQuestionCnt(Integer userId);
}
