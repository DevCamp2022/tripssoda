package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AnswerDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AnswerService {

    AnswerDto selectAnswer(Integer id);

    int selectAllUserAnswerCnt(Integer userId);

    List<AnswerDto> selectAllUserAnswer(Integer userId, SearchCondition sc);

    int getCount(Integer questionId) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int write(AnswerDto dto) throws Exception;

    AnswerDto read(Integer id) throws Exception;

    int modify(AnswerDto dto) throws Exception;

    @Transactional(rollbackFor = Exception.class)
    int remove(Integer id, Integer questionId, Integer userId) throws Exception;

    List<AnswerDto> getList(Integer questionId) throws Exception;

}
