package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.PageHandlerOld;
import com.devcamp.tripssoda.dto.QuestionDto;
import com.devcamp.tripssoda.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/question")
public class QuestionController {

    QuestionService questionService;
    //생성자로 주입
    QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @PostMapping("/modify")
    public String modify(QuestionDto questionDto, BindingResult result, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        System.out.println("result = " + result);
        //userId는 인조식별자
//        Integer writer = (int) session.getAttribute("userId");
        int writer = 43;
        System.out.println("questionDto = " + questionDto);
        questionDto.setUserId(writer);
        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);

            int rowCnt = questionService.modify(questionDto);
            if(rowCnt!=1)
                throw new Exception("Modify Failed");
            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/question/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(questionDto);
            m.addAttribute("msg", "MOD_ERR");

            return "question/questionWrite.mainTiles";
        }
    }

    @GetMapping("/modify")
    public String modify(Integer id, Integer page, Integer pageSize, Model m) {
        QuestionDto questionDto = null;
        try {
            questionDto = questionService.read(id);
            System.out.println("id = " + id);
            System.out.println("questionDto = " + questionDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute(questionDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "question/questionWrite.mainTiles";
    }

    @PostMapping("/write")
    public String write(QuestionDto questionDto, BindingResult result, Model m, HttpSession session, RedirectAttributes rattr) {
//        Integer writer = (int) session.getAttribute("userId");
        int writer = 43;
        questionDto.setUserId(writer);
        //아래는 테스트를 위한 값
//        accompanyDto.setRegionCode(0);
//        accompanyDto.setStartAt(new Date());
//        accompanyDto.setEndAt(new Date());
//        accompanyDto.setThumbnail("abc");
//        accompanyDto.setMemberCnt(3);
//        accompanyDto.setCreatedAt(new Date());
//        accompanyDto.setCreatedBy(1);
        System.out.println("result = " + result);
        try {
            int rowCnt = questionService.write(questionDto);
            if(rowCnt!=1)
                throw new Exception("Write Failed");
            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/question/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(questionDto);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");

            return "question/questionWrite.mainTiles";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");

        return "question/questionWrite.mainTiles";
    }

    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
//        Integer writer = (int) session.getAttribute("userId");
        int writer = 43;
        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            int rowCnt = questionService.remove(id, writer);
            System.out.println("id = " + id);
            if(rowCnt!=1)
                throw new Exception("Remove Failed");
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/question/list";
    }

    @GetMapping("/read")
    public String read(Integer id, Integer page, Integer pageSize, Model m, RedirectAttributes rattr) {
        QuestionDto questionDto = null;
        try {
            questionDto = questionService.read(id);
            m.addAttribute(questionDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            if(questionDto.equals(null))
                throw new Exception("Read Failed");

            return "question/question.mainTiles";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_ERR");
            return "redirect:/question/list";
        }
    }

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
        //로그인 구현되면 주석 풀고 수정.
//        if(!loginCheck(request))
//            return "redirect:/login/login+toURL"+request.getRequestURL();
        if(page==null) page=1;
        if(pageSize==null) pageSize=12;

        int totalCnt = 0;
        try {
            totalCnt = questionService.getCount();

            PageHandlerOld ph = new PageHandlerOld(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

            List<QuestionDto> list = questionService.getPage(map);
            m.addAttribute("ph", ph);
            m.addAttribute("list", list);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
            m.addAttribute("totalCnt", 0);
        }
        return "question/questionList.mainTiles";
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session != null && session.getAttribute("userId") != null;
    }
}
