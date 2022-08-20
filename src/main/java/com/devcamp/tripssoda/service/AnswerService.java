package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AnswerDto;
import com.devcamp.tripssoda.dto.SearchCondition;

import java.util.List;

public interface AnswerService {
    AnswerDto selectAnswer(Integer id);

    int selectAllUserAnswerCnt(Integer userId);

    List<AnswerDto> selectAllUserAnswer(Integer userId, SearchCondition sc);
}
