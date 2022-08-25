package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.PageHandler;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.service.AdminBoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/board")
public class CombinedBoardController {
    AdminBoardService adminBoardService;

    public CombinedBoardController(AdminBoardService adminBoardService){
        this.adminBoardService = adminBoardService;
    }

    @GetMapping("/list")
    public String boardList(Model m, SearchCondition sc, @RequestParam(value="menuCode",defaultValue="0") String menuCode) throws Exception{

        try {
            //menuCode 게시판아이디를 같이 보내준다
            int totalCnt = adminBoardService.getSearchResultCntForUser(sc, menuCode);
            m.addAttribute("totalCnt", totalCnt);
            System.out.println("totalCnt = " + totalCnt);
            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<CombinedBoardDto> list = adminBoardService.getSearchResultPageForUser(sc, menuCode);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

            System.out.println("list = " + list);
//            for(CombinedBoardDto dto : list)
//                System.out.println(dto);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);

        }
        return "board/board.mainTiles";
    }

    @GetMapping("/detail")
    public String read(Model m, @RequestParam int id, SearchCondition sc) throws Exception{ //게시글id
        CombinedBoardDto combinedBoardDto = adminBoardService.read(id);
        m.addAttribute("combinedBoardDto",combinedBoardDto);
        m.addAttribute("searchCondition",sc);

        return "board/board_content.mainTiles";
    }
}
