package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.AccompanyDto;
import com.devcamp.tripssoda.dto.PageHandlerOld;
import com.devcamp.tripssoda.service.AccompanyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/accompany")
public class AccompanyController {
//    @InitBinder
//    public void hashtag(WebDataBinder binder) {
//        binder.registerCustomEditor(String[].class, "hashtag", new StringArrayPropertyEditor(" "));
//    }

    AccompanyService accompanyService;

    //생성자로 주입
    AccompanyController(AccompanyService accompanyService) {
        this.accompanyService = accompanyService;
    }

    @PostMapping("/modify")
    public String modify(AccompanyDto accompanyDto, BindingResult result, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        System.out.println("result = " + result);
        //userId는 인조식별자
//        Integer writer = (int) session.getAttribute("userId");
        Integer writer = 43;
        System.out.println("accompanyDto = " + accompanyDto);
        accompanyDto.setUserId(writer);
        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);

            int rowCnt = accompanyService.modify(accompanyDto);
            if(rowCnt!=1)
                throw new Exception("Modify Failed");
            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/accompany/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(accompanyDto);
            m.addAttribute("msg", "MOD_ERR");
            return "accompany/accompanyWrite.mainTiles";
        }
    }

    @GetMapping("/modify")
    public String modify(Integer id, Integer page, Integer pageSize, Model m) {
        AccompanyDto accompanyDto = null;
        try {
            accompanyDto = accompanyService.read(id);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute(accompanyDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "accompany/accompanyWrite.mainTiles";
    }

    @PostMapping("/write")
    public String write(AccompanyDto accompanyDto, BindingResult result, Model m, HttpSession session, RedirectAttributes rattr) {
//        Integer writer = (int) session.getAttribute("userId");
        Integer writer = 43;
        accompanyDto.setUserId(writer);

        //유효성 검사를 추가 해야 한다.
        //1. hashtag를 공백으로 구분해서 input태그에서 입력받고, 컨트롤러에서 받아서 공백으로 나눈다.
        if(accompanyDto.getHashtag()==null || accompanyDto.getHashtag().trim().equals(""))
            accompanyDto.setHashtag("아무나다좋아");
        String[] hashList = accompanyDto.getHashtag().split(" ");
        //2. 배열에서 값을 하나씩 꺼내서 앞에 #을 붙이고 문자열로 변환한다.
        String hashtag2 = "";
        for(String hashtag : hashList) {
            hashtag2 += "#"+hashtag+" ";
        }
        System.out.println("hashtag2 = " + hashtag2);
        //3. 변환한 hashcode를 setter로 dto에 저장한다.
        accompanyDto.setHashtag(hashtag2);
        System.out.println("accompanyDto.getStartAt() = " + accompanyDto.getStartAt());
        System.out.println("result = " + result);
        try {
            int rowCnt = accompanyService.write(accompanyDto);
            System.out.println("accompanyDto.getMemberCnt() = " + accompanyDto.getMemberCnt());
            if(rowCnt!=1)
                throw new Exception("Write Failed");
            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/accompany/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(accompanyDto);
            m.addAttribute("mode", "new");
            m.addAttribute("msg", "WRT_ERR");
            return "accompany/accompanyWrite.mainTiles";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "accompany/accompanyWrite.mainTiles";
    }

    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        //writer
//        Integer writer = (int) session.getAttribute("userId");
        Integer writer = 43;
        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            int rowCnt = accompanyService.remove(id, writer);
            if(rowCnt!=1)
                throw new Exception("Remove Failed");
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/accompany/list";
    }

    @GetMapping("/read")
    public String read(Integer id, Integer page, Integer pageSize, Model m, RedirectAttributes rattr) {
        AccompanyDto accompanyDto = null;
//        System.out.println("accompanyDto.getHashtag() = " + accompanyDto.getHashtag());
        try {
            accompanyDto = accompanyService.read(id);
            //1. endAt을 불러온다.
            System.out.println("accompanyDto.getEndAt() = " + accompanyDto.getEndAt());
            //2. 오늘 날짜를 구한다.
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date now = new Date();
//            String nowTime = df.format(now);
//            System.out.println("nowTime = " + nowTime);
            long milliSeconds = now.getTime();
            String strLong = Long.toString(milliSeconds);
            System.out.println("milliSeconds = " + milliSeconds);

            //3. 둘 다 milliseconds로 변환 후 오늘 날짜 - endAt<=0이면

            //4. status를 1로 업데이트하고, 1은 지난여행을 뷰에 출력한다.


            m.addAttribute(accompanyDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            if(accompanyDto.equals(null))
                throw new Exception("Read Failed");
            return "accompany/accompany.mainTiles";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_ERR");
            return "redirect:/accompany/list";
        }
    }

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
//        if(!loginCheck(request))
//            return "redirect:/login/login+toURL"+request.getRequestURL();
        if(page==null) page=1;
        if(pageSize==null) pageSize=12;

        int totalCnt = 0;
        try {
        totalCnt = accompanyService.getCount();

        PageHandlerOld ph = new PageHandlerOld(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

            List<AccompanyDto> list = accompanyService.getPage(map);
            m.addAttribute("ph", ph);
            m.addAttribute("list", list);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg", "LIST_ERR");
        }
        return "accompany/accompanyList.mainTiles";
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session != null && session.getAttribute("userId") != null;
    }
}
