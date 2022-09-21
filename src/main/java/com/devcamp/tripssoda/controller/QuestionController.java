package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.AnswerService;
import com.devcamp.tripssoda.service.QuestionService;
import com.devcamp.tripssoda.service.UserService;
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
    AnswerService answerService;
    UserService userService;

    //생성자로 주입
    QuestionController(QuestionService questionService, AnswerService answerService, UserService userService) {
        this.questionService = questionService;
        this.answerService = answerService;
        this.userService = userService;
    }

//    @PostMapping("/answer/modify")
//    public String answerModify(AnswerDto answerDto, BindingResult result, Integer page, Integer pageSize, Model m, RedirectAttributes rattr) {
//        System.out.println("result = " + result);
//        //userId는 인조식별자
////        Integer writer = (int) session.getAttribute("userId");
//        Integer writer = 43;
//        System.out.println("answerDto = " + answerDto);
//        answerDto.setUserId(writer);
//
//        try {
//            rattr.addAttribute("page", page);
//            rattr.addAttribute("pageSize", pageSize);
//
//            int rowCnt = answerService.modify(answerDto);
//            if(rowCnt!=1)
//                throw new Exception("Modify Failed");
//            rattr.addFlashAttribute("msg", "MOD_OK");
//            return "redirect:/question/list";
//        } catch (Exception e) {
//            e.printStackTrace();
//            m.addAttribute(answerDto);
//            m.addAttribute("msg", "MOD_ERR");
//
//            return "question/questionWrite.mainTiles";
//        }
//    }

    @GetMapping("/waiting")
    public String waitingList(String option, Integer page, Integer pageSize, Model m, RedirectAttributes rattr) {
        //로그인 구현되면 주석 풀고 수정.
//        if(!loginCheck(request))
//            return "redirect:/login/login+toURL"+request.getRequestURL();
        if(page==null) page=1;
        if(pageSize==null) pageSize=8;

        int totalCnt = 0;
        try {
            totalCnt = questionService.waitingGetCount();

            PageHandlerOld ph = new PageHandlerOld(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);
            map.put("option", option);

            List<QuestionDto> list = questionService.waitingGetPage(map);
            m.addAttribute("mode", "waiting");
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

    @GetMapping("/answer/modify")
    public String answerModify(Integer id, Integer answerId
            , Integer page, Integer pageSize, Model m
    ) {
        System.out.println("id = " + id);
        System.out.println("answerId = " + answerId);

        QuestionDto questionDto = null;
        AnswerDto answerDto = null;
        try {
            questionDto = questionService.read(id);
            answerDto = answerService.read(answerId);
            System.out.println("questionDto = " + questionDto);
            System.out.println("answerDto = " + answerDto);
//            m.addAttribute("page", page);
//            m.addAttribute("pageSize", pageSize);
            m.addAttribute(questionDto);
            m.addAttribute(answerDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "question/answerWrite.mainTiles";
    }

    @GetMapping("/answer/write")
    public String answerWrite(Integer id, Integer page, Integer pageSize, Model m) {
        QuestionDto questionDto = null;
        try {
            questionDto = questionService.read(id);
            m.addAttribute("mode", "new");
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute(questionDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "question/answerWrite.mainTiles";
    }

    @PostMapping("/modify")
    public String modify(QuestionDto questionDto, BindingResult result, Integer page, Integer pageSize, String area3, Model m, HttpSession session, RedirectAttributes rattr) {
        Integer writer = (int) session.getAttribute("id");
        questionDto.setUserId(writer);
        questionDto.setRegionCode(area3);


        //1. hashtag를 공백으로 구분해서 input태그에서 입력받고, 컨트롤러에서 받아서 공백으로 나눈다.
        if(questionDto.getHashtag()==null || questionDto.getHashtag().trim().equals(""))
            questionDto.setHashtag("아무나다좋아");
        String replaceHashtag = questionDto.getHashtag().trim().replaceAll(" +", " ");
        String[] hashList = replaceHashtag.split(" ");
        //2. 배열에서 값을 하나씩 꺼내서 앞에 #을 붙이고 문자열로 변환한다.
        String hashtag2 = "";
        for(String hashtag : hashList) {
            if(hashtag.charAt(0)!='#')
                hashtag2 += "#"+hashtag+" ";
            else {
                hashtag2 += hashtag+" ";
            }
        }
        System.out.println("hashtag2 = " + hashtag2);
        questionDto.setHashtag(hashtag2);

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
    public String modify(Integer id, Integer page, Integer pageSize, Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login?toURL="+request.getRequestURL();
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
    public String write(String area1, String area2, String area3, QuestionDto questionDto, BindingResult result, Model m, HttpSession session, RedirectAttributes rattr) {
        Integer writer = (int) session.getAttribute("id");
        System.out.println("area1 = " + area1);
        System.out.println("area2 = " + area2);
        System.out.println("area3 = " + area3);

        questionDto.setRegionCode(area3);

        String email = (String) session.getAttribute("email");
        UserDto userDto = userService.selectUserByEmail(email);
        String nickname = userDto.getNickname();
        questionDto.setNickname(nickname);

        String profileImg = userDto.getProfileImg();
        System.out.println("nickname = " + nickname);
        System.out.println("profileImg = " + profileImg);
        questionDto.setProfileImg(profileImg);

        questionDto.setUserId(writer);

        System.out.println("result = " + result);

        //1. hashtag를 공백으로 구분해서 input태그에서 입력받고, 컨트롤러에서 받아서 공백으로 나눈다.
        if(questionDto.getHashtag()==null || questionDto.getHashtag().trim().equals(""))
            questionDto.setHashtag("아무나다좋아");
//        String newHashtag = questionDto.getHashtag().replaceAll("\\s+","");
        String replaceHashtag = questionDto.getHashtag().trim().replaceAll(" +", " ");
        String[] hashList = replaceHashtag.split(" ");
        //2. 배열에서 값을 하나씩 꺼내서 앞에 #을 붙이고 문자열로 변환한다.
        String hashtag2 = "";
        for(String hashtag : hashList) {
            if(hashtag.charAt(0)!='#')
                hashtag2 += "#"+hashtag+" ";
            else {
                hashtag2 += hashtag+" ";
            }
        }
        System.out.println("hashtag2 = " + hashtag2);
        questionDto.setHashtag(hashtag2);

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
    public String write(HttpServletRequest request, Model m) {
        if(!loginCheck(request))
            return "redirect:/login?toURL="+request.getRequestURL();
        m.addAttribute("mode", "new");
        return "question/questionWrite.mainTiles";
    }

    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        Integer writer = (int) session.getAttribute("id");
//        int writer = 43;
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

    @PostMapping("/answer/select")
    public String select(QuestionDto questionDto,
//                         Integer id,
                         Model m, HttpSession session, Integer page, Integer pageSize, RedirectAttributes rattr) {
        Integer writer = (int) session.getAttribute("id");
        questionDto.setUserId(writer);

        questionDto.setStatus(1);

        try {
            int rowCnt = questionService.updateStatus(questionDto);
//            questionDto = questionService.read(id);

            if(rowCnt!=1)
                throw new Exception("Select Failed");
            rattr.addAttribute("id", questionDto.getId());
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "SELECT_OK");
            System.out.println("questionDto = " + questionDto);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(questionDto);
            m.addAttribute("msg", "SELECT_OK");
            System.out.println("questionDto = " + questionDto);

//            System.out.println("id = " + id);
        }
        return "redirect:/question/read";
//        return "question/question.mainTiles";
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
    public String list(Integer page, Integer pageSize, String option, Model m, HttpServletRequest request) {
        //로그인 구현되면 주석 풀고 수정.
//        if(!loginCheck(request))
//            return "redirect:/login/login+toURL"+request.getRequestURL();
        if(page==null) page=1;
        if(pageSize==null) pageSize=8;

        int totalCnt = 0;
        try {
            totalCnt = questionService.getCount();

            PageHandlerOld ph = new PageHandlerOld(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);
            map.put("option", option);

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
        return session != null && session.getAttribute("id") != null;
    }
}