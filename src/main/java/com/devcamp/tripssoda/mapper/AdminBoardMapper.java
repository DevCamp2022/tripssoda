package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminBoardMapper {

    CombinedBoardDto selectBoard(Integer id) throws Exception;

//    int delete(Integer id, Integer userId) throws Exception;

    int delete(Map map) throws Exception;

    int insert(CombinedBoardDto dto) throws Exception;

    int update(CombinedBoardDto dto) throws Exception;

    int increaseViewCnt(Integer id) throws Exception;

    List<CombinedBoardDto> selectPage(Map map) throws Exception;

    List<CombinedBoardDto> selectAllBoard() throws Exception;

    int deleteAll() throws Exception;

    int count() throws Exception;

//    int searchResultCnt(SearchCondition sc) throws Exception;
    int searchResultCnt(Map<String, Object> map) throws Exception;

//    List<CombinedBoardDto> searchSelectPage(SearchCondition sc) throws Exception;
//    List<CombinedBoardDto> searchSelectPage(SearchCondition sc, String menuCode) throws Exception;
    List<CombinedBoardDto> searchSelectPage(Map map) throws Exception;

}