package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.CombinedBoardDto;
import com.devcamp.tripssoda.dto.PageHandler;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.mapper.IpBanListMapper;
import com.devcamp.tripssoda.service.AdminBoardService;
import com.devcamp.tripssoda.service.AdminUserService;
import com.devcamp.tripssoda.service.UserService;
import com.devcamp.tripssoda.util.annotations.SkipChecking;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@EnableAspectJAutoProxy
@RequestMapping("/admin")
public class AdminController {
    private final AdminBoardService adminBoardService;
    private final AdminUserService adminUserService;
    private final UserService userService;

    @Autowired
    private final IpBanListMapper ipBanListMapper = null;

    public AdminController(AdminBoardService adminBoardService,
                           AdminUserService adminUserService,
                           UserService userService)
    {
        this.adminBoardService = adminBoardService;
        this.adminUserService = adminUserService;
        this.userService = userService;
    }

//    @AuthChecking
//    public static String toTest(){
//        String a = "aaa";
//        return a;
//    }

    //aop대상에서 제외됨
    @SkipChecking
    @RequestMapping("/")
    public static String toLoginPage() {
        return "/";
    }


    //관리자페이지 메뉴바
    @GetMapping("/side")
    public String side(){
        return "admin/side";
    }


    @GetMapping("/home")
    public String adminHome(){
        return "admin/admin_home.subTiles";
    }


    //관리자페이지 통합게시판 & 각 게시판 목록
    @GetMapping("/boardList")
    public String boardList(Model m,SearchCondition sc, @RequestParam(value="menuCode",defaultValue="0") String menuCode) throws Exception{

        try {
            //menuCode 게시판아이디를 같이 보내준다
            int totalCnt = adminBoardService.getSearchResultCnt(sc, menuCode);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<CombinedBoardDto> list = adminBoardService.getSearchResultPage(sc, menuCode);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

//            for(CombinedBoardDto dto : list)
//                System.out.println(dto);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);

        }
        return "admin/combined_board.subTiles";
    }

    // 게시글 내용
    @GetMapping("/boardContent")
    public String read(Model m, @RequestParam int id, SearchCondition sc) throws Exception{ //게시글id
        CombinedBoardDto combinedBoardDto = adminBoardService.read(id);
        m.addAttribute("combinedBoardDto",combinedBoardDto);
        m.addAttribute("searchCondition",sc);

        return "admin/board_content.subTiles";
    }

    // 게시글 수정
    @PostMapping("/boardModify")
    public String modify(CombinedBoardDto combinedBoardDto, SearchCondition sc, RedirectAttributes rattr, Model m, HttpSession session) {
        System.out.println("combinedBoardDto.getMenuCode() = " + combinedBoardDto.getMenuCode());
        System.out.println("combinedBoardDto.getId() = " + combinedBoardDto.getId());

        try{
            if(session.getAttribute("id")==null){
                throw new Exception("No session id");
            }

            combinedBoardDto.setUserId((int)session.getAttribute("id"));
//            System.out.println("adminBoardService.modify(combinedBoardDto) = " + adminBoardService.modify(combinedBoardDto));

            adminBoardService.modify(combinedBoardDto);

            m.addAttribute(combinedBoardDto);
            m.addAttribute("sc",sc);
            rattr.addFlashAttribute("msg","MOD_SUCCESS");

            return "redirect:/admin/boardContent?id="+combinedBoardDto.getId();

        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(combinedBoardDto);
            m.addAttribute("sc",sc);
            m.addAttribute("msg","MOD_ERR");
            return "admin/board_content.subTiles";
        }
    }

    // 글 등록 폼
    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "admin/board_content.subTiles";
    }

    // 게시글 등록
    @PostMapping("/write")
    public String write(CombinedBoardDto combinedBoardDto, String boardOption, RedirectAttributes rattr, Model m, HttpSession session,
                        HttpServletResponse response, HttpServletRequest request) {

        System.out.println(" ##########  ##########");
        Logger logger = LoggerFactory.getLogger(AdminController.class);

        int writer = (int)session.getAttribute("id");
        String menuOption = boardOption;
        combinedBoardDto.setUserId(writer);
        combinedBoardDto.setMenuCode(menuOption);

            try {
                if (adminBoardService.write(combinedBoardDto) != 1)
                    throw new Exception("글 등록에 실패했습니다");

                rattr.addFlashAttribute("msg", "글이 정상적으로 등록되었습니다");
                return "redirect:/admin/boardList";

            } catch (Exception e) {
                e.printStackTrace();
                m.addAttribute(combinedBoardDto);
                m.addAttribute("mode", "new");
                m.addAttribute("msg", "WRT_ERR");
                return "admin/board_content.subTiles";
            }
    }


    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr){
        Integer writer = (Integer) session.getAttribute("id");

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

    // 선택된 게시글 삭제
    @PostMapping("/removeRows")
    @ResponseBody
    public String removeRows(HttpServletRequest request, String menuCode, SearchCondition sc, Model m, HttpSession session, RedirectAttributes rattr){
        //선택된 게시글id를 배열로 받아온다
        String[] id = request.getParameterValues("idArr");

        System.out.println("session = " + session);
        Integer userId = (Integer)session.getAttribute("id");
        System.out.println("uuuuuuuuuuuuserId = " + userId);

        try {
            int totalCnt = adminBoardService.getSearchResultCnt(sc, menuCode);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<CombinedBoardDto> list = adminBoardService.getSearchResultPage(sc, menuCode);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

            for(int i=0; i<id.length; i++) {

                int rowCnt = adminBoardService.remove(Integer.parseInt(id[i]), userId);

                if(rowCnt==0)
                    throw new Exception("글 삭제에 실패했습니다");

                else if(rowCnt==4)
                    throw new Exception("이미 삭제된 게시글입니다");
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "err";
        }
        return "success";
    }

    //회원관리
    @GetMapping("/userList")
    public String userList(Model m, SearchCondition sc) throws Exception{

        try{
            int totalCnt = adminUserService.getAllUserCnt();
            System.out.println("totalCnt = " + totalCnt);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<UserDto> list = adminUserService.searchSelectUser(sc);

            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

        }catch(Exception e){
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }
        return "admin/user_manage.subTiles";
    }


    @GetMapping("/partnerList")
    public String partnerList(){

        return "admin/partner_list.subTiles";
    }

}
