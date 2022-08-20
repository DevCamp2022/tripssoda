package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.AnswerDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AnswerMapper {
    int count(Integer questionId) throws Exception;

    int insert(AnswerDto dto) throws Exception;

    AnswerDto select(Integer id) throws Exception;

    int update(AnswerDto dto) throws Exception;

    int delete(Map<String, Integer> map) throws Exception;

    List<AnswerDto> selectAll(Integer questionId) throws Exception;

    int deleteAll(Integer questionId) throws Exception;
}
