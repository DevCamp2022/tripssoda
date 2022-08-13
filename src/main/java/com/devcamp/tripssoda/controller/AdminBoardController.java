package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.PageHandler;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.service.AdminBoardService;
import com.devcamp.tripssoda.service.SampleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {
    private final AdminBoardService adminBoardService;

    public AdminBoardController(AdminBoardService adminBoardService){
        this.adminBoardService = adminBoardService;
    }

    @GetMapping("/side")
    public String side(){
        return "admin/side";
    }

    @GetMapping("/boardList")
    public String boardList(Model m,SearchCondition sc, @RequestParam(value="menuCode",defaultValue="0") String menuCode) throws Exception{

        System.out.println("컨트롤menuCode = " + menuCode);
        try {
//            int totalCnt = adminBoardService.getSearchResultCnt(sc);
            int totalCnt = adminBoardService.getSearchResultCnt(sc, menuCode);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

//            List<CombinedBoardDto> list = adminBoardService.getSearchResultPage(sc);
            List<CombinedBoardDto> list = adminBoardService.getSearchResultPage(sc, menuCode);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

            for(CombinedBoardDto dto : list)
                System.out.println(dto);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }


        return "admin/combined_board.subTiles";
    }

    @GetMapping("/boardContent")
    public String read(Model m, @RequestParam int id) throws Exception{
        System.out.println("id = " + id);
        CombinedBoardDto dto = adminBoardService.read(id);
        m.addAttribute("dto",dto);
        return "admin/board_content.subTiles";
    }

    @PostMapping("/boardModify")
//    public String modify(CombinedBoardDto combinedBoardDto, Model m, HttpSession session, RedirectAttributes rattr){
    public String modify(CombinedBoardDto combinedBoardDto, SearchCondition sc, RedirectAttributes rattr, Model m, HttpSession session) {
        try {
            int rowCnt = adminBoardService.modify(combinedBoardDto); //insert

            if(rowCnt!=1)
                throw new Exception("Modify failed");

            rattr.addFlashAttribute("msg","MOD_OK");

            return "redirect:/admin/boardList.subTiles";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(combinedBoardDto);
            m.addAttribute("msg","MOD_ERR");
            return "admin/board_content.subTiles";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "admin/board_content.subTiles";
    }

    @PostMapping("/write")
    public String write(CombinedBoardDto combinedBoardDto, String menuOption, RedirectAttributes rattr, Model m, HttpSession session) {
//        int writer = (int)session.getAttribute("id");
        System.out.println("\"왔ㄴ; ? ?   \" = " + "왔ㄴ; ? ?   ");
        System.out.println("menuOption = " + menuOption);

        int writer = 3;
        combinedBoardDto.setUserId(writer);

        try {
            if (adminBoardService.write(combinedBoardDto) != 1)
                throw new Exception("Write failed.");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/admin/combined_board.subTiles";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(combinedBoardDto);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "admin/board.subTiles";
        }
    }


    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr){
//        String writer = (String)session.getAttribute("id");
        System.out.println("지웡ㄹ니얼이ㅏ러");
        int writer = 3;
        try {

            m.addAttribute("page",page);
            m.addAttribute("pageSize",pageSize);

            int rowCnt = adminBoardService.remove(id, writer);

            if(rowCnt!=1)
                throw new Exception("board remove error");

            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }
        return "redirect:/admin/combined_board.subTiles";
    }

    @PostMapping("/removeRows")
    @ResponseBody
    public String removeRows(HttpServletRequest request, String menuCode, SearchCondition sc, Model m, HttpSession session, RedirectAttributes rattr){
        String[] id = request.getParameterValues("idArr");
        System.out.println("선택한거지워줘");
        System.out.println("\"??safsdfsdfs" + "???????????/");
        System.out.println("id.length = " + id.length);
        System.out.println("menuCode = " + menuCode);


        int userId = 3;

        try {
            int totalCnt = adminBoardService.getSearchResultCnt(sc, menuCode);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<CombinedBoardDto> list = adminBoardService.getSearchResultPage(sc, menuCode);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

            for(int i=0; i<id.length; i++) {
                System.out.println("포문포문d = " + id[i]);
                int rowCnt = adminBoardService.remove(Integer.parseInt(id[i]), userId);

                if(rowCnt==0)
                throw new Exception("board remove error");

            }

            rattr.addFlashAttribute("msg","DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg","DEL_ERR");
        }

        return "redirect:/admin/combined_board.subTiles";
    }

}
