package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.InquiryDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.mapper.CombinedBoardHistoryMapper;
import com.devcamp.tripssoda.mapper.CombinedBoardMapper;
import com.devcamp.tripssoda.mapper.InquiryMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{

    private final CombinedBoardMapper combinedBoardMapper;
    private final CombinedBoardHistoryMapper combinedBoardHistoryMapper;
    private final InquiryMapper inquiryMapper;

    public AdminBoardServiceImpl(CombinedBoardMapper combinedBoardMapper,
                                 CombinedBoardHistoryMapper combinedBoardHistoryMapper,
                                 InquiryMapper inquiryMapper) {
        this.combinedBoardMapper = combinedBoardMapper;
        this.combinedBoardHistoryMapper = combinedBoardHistoryMapper;
        this.inquiryMapper = inquiryMapper;
    }

    @Override
    public int getCount() throws Exception {
        return combinedBoardMapper.count();
    }

    @Override
    public int remove(Integer id, Integer userId) throws Exception {

        int status = combinedBoardMapper.getStatus(id);
        System.out.println("status = " + status);

        if(status == 0){//이미 삭제된 글인 경우 4를 반환
            return 4;
        }

        Map map = new HashMap();
        map.put("id", id);
        map.put("userId", userId);

        return combinedBoardMapper.delete(map);
    }

    @Override
    public int write(CombinedBoardDto combinedBoardDto) throws Exception {
        return combinedBoardMapper.insert(combinedBoardDto);
    }

    @Override
    public List<CombinedBoardDto> selectAllBoard() throws Exception {
        return combinedBoardMapper.selectAllBoard();
    }

    @Override
    public CombinedBoardDto read(Integer id) throws Exception {
        CombinedBoardDto boardDto = combinedBoardMapper.selectBoard(id);
        combinedBoardMapper.increaseViewCnt(id);
        return boardDto;
    }

    @Override
    public List<CombinedBoardDto> getPage(Map map) throws Exception {
        return combinedBoardMapper.selectPage(map);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean modify(CombinedBoardDto combinedBoardDto) throws Exception {

        //변경사항 업데이트
        int resultCnt = combinedBoardMapper.update(combinedBoardDto);
        System.out.println("resultCnt = " + resultCnt);
        //이력 테이블에 저장
        int hisResultCnt = combinedBoardHistoryMapper.insert(combinedBoardDto);
        System.out.println("hisResultCnt = " + hisResultCnt);

        try{
            if(resultCnt!=1)
                throw new Exception("Modify failed");

            if(hisResultCnt!=1)
                throw new Exception("Insert Modify History failed");

        }catch(Exception e){
            e.printStackTrace();
            throw new Exception("게시물 수정에 실패했습니다");
        }
        //수정,인서트 둘다 성공
        return true;
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc, String menuCode) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("sc", sc);
        map.put("menuCode", menuCode);
        return combinedBoardMapper.searchResultCnt(map);
    }


    @Override
    public List<CombinedBoardDto> getSearchResultPage(SearchCondition sc, String menuCode) throws Exception {
        Map map = new HashMap();
        map.put("sc",sc);
        map.put("menuCode", menuCode);
        System.out.println("\"se\" = " + sc);

        return combinedBoardMapper.searchSelectPage(map);
    }

    @Override
    public int selectAllInquiryCnt() {
        return inquiryMapper.selectAllInquiryCnt();
    }

    @Override
    public List<InquiryDto> selectAllInquiry(SearchCondition sc) {
        return inquiryMapper.selectAllInquiry(sc);
    }


    public List<CombinedBoardDto> getSearchResultPageForUser(SearchCondition sc, String menuCode) throws Exception {
        Map<String, Object> map = new HashMap();
        map.put("sc",sc);
        map.put("menuCode", menuCode);

        System.out.println("\"se\" = " + sc);

        return combinedBoardMapper.searchSelectPageForUser(map);
    }

    @Override
    public int getSearchResultCntForUser(SearchCondition sc, String menuCode) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("sc", sc);
        map.put("menuCode", menuCode);
        return combinedBoardMapper.searchResultCntForUser(map);
    }
}
