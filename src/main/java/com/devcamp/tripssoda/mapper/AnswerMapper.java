package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.AnswerDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AnswerMapper {
    public AnswerDto selectAnswer(Integer id);

    public int selectAllUserAnswerCnt(Integer userId);

    public List<AnswerDto> selectAllUserAnswer(Map map);
}
