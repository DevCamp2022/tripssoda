package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.QuestionDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QuestionMapper {

    public List<QuestionDto> selectAllUserQuestion(Map map);

    public int selectAllUserQuestionCnt(Integer userId);

}
