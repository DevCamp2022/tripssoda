package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.AdminBoardMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{

    private final AdminBoardMapper adminBoardMapper;

    public AdminBoardServiceImpl(AdminBoardMapper adminBoardMapper) {
        this.adminBoardMapper = adminBoardMapper;
    }

    @Override
    public int getCount() throws Exception {
        return adminBoardMapper.count();
    }

    @Override
    public int remove(Integer id, Integer userId) throws Exception {
        System.out.println("서비스 딜릿 id = " + id);
        System.out.println("서비스딜리ㅣㅅ userId = " + userId);
        Map map = new HashMap();
        map.put("id", id);
        map.put("userId", userId);

//        return adminBoardMapper.delete(id, userId);
        return adminBoardMapper.delete(map);
    }

    @Override
    public int write(CombinedBoardDto combinedBoardDto) throws Exception {
        return adminBoardMapper.insert(combinedBoardDto);
    }

    @Override
    public List<CombinedBoardDto> selectAllBoard() throws Exception {
        return adminBoardMapper.selectAllBoard();
    }

    @Override
    public CombinedBoardDto read(Integer id) throws Exception {
        CombinedBoardDto boardDto = adminBoardMapper.selectBoard(id);
        adminBoardMapper.increaseViewCnt(id);

        return boardDto;
    }

    @Override
    public List<CombinedBoardDto> getPage(Map map) throws Exception {
        return adminBoardMapper.selectPage(map);
    }

    @Override
    public int modify(CombinedBoardDto boardDto) throws Exception {
        return adminBoardMapper.update(boardDto);
    }

//    @Override
//    public int getSearchResultCnt(SearchCondition sc) throws Exception {
//        return adminBoardMapper.searchResultCnt(sc);
//    }

    @Override
    public int getSearchResultCnt(SearchCondition sc, String menuCode) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("sc", sc);
        map.put("menuCode", menuCode);
        return adminBoardMapper.searchResultCnt(map);
    }


//    @Override
//    public List<CombinedBoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
//        return adminBoardMapper.searchSelectPage(sc);
//    }

    @Override
    public List<CombinedBoardDto> getSearchResultPage(SearchCondition sc, String menuCode) throws Exception {
        Map map = new HashMap();
        map.put("sc",sc);
        map.put("menuCode", menuCode);

        System.out.println("\"se\" = " + sc);

//        return adminBoardMapper.searchSelectPage(sc, menuCode);
        return adminBoardMapper.searchSelectPage(map);
    }
}
