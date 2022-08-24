package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.QuestionDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QuestionMapper {

    public List<QuestionDto> selectAllUserQuestion(Map map);

    public int selectAllUserQuestionCnt(Integer userId);

    public int count() throws Exception;
    public int insert(QuestionDto dto) throws Exception;
    public QuestionDto select(Integer id) throws Exception;
    public int update(QuestionDto dto) throws Exception;
    public int delete(Map map) throws Exception;
    public int increaseViewCnt(Integer id) throws Exception;
    public int deleteAll() throws Exception;
    public List<QuestionDto> selectAll() throws Exception;
    public List<QuestionDto> selectPage(Map map) throws Exception;
    public int updateAnswerCnt(Map map) throws Exception;
    public List<QuestionDto> waitingSelectPage(Map map) throws Exception;
    public int waitingCount() throws Exception;

}
