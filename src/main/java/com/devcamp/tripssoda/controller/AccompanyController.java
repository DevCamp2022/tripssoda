package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.dto.PageHandlerOld;
import com.devcamp.tripssoda.service.AccompanyService;
import com.devcamp.tripssoda.service.UserService;
import org.apache.ibatis.javassist.Loader;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

@Controller
@RequestMapping("/accompany")
public class AccompanyController {
    @InitBinder
    public void hashtag(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, false));
    }

    AccompanyService accompanyService;
    UserService userService;

    //생성자로 주입
    AccompanyController(AccompanyService accompanyService, UserService userService) {
        this.accompanyService = accompanyService;
        this.userService = userService;
    }

    @PostMapping("/select")
    public String select(AccompanyDto accompanyDto,
//                         Integer id,
                         Model m, HttpSession session, Integer page, Integer pageSize, RedirectAttributes rattr) {
        Integer writer = (int) session.getAttribute("id");
        accompanyDto.setUserId(writer);

        accompanyDto.setStatus(1);

        try {
            int rowCnt = accompanyService.updateStatus(accompanyDto);
//            questionDto = questionService.read(id);

            if(rowCnt!=1)
                throw new Exception("Update Status Failed");
            rattr.addAttribute("id", accompanyDto.getId());
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            rattr.addFlashAttribute("msg", "SELECT_OK");
            System.out.println("accompanyDto = " + accompanyDto);

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(accompanyDto);
            m.addAttribute("msg", "SELECT_OK");
            System.out.println("accompanyDto = " + accompanyDto);

//            System.out.println("id = " + id);
        }
        return "redirect:/accompany/read";
//        return "question/question.mainTiles";
    }

    @GetMapping("/waiting")
    public String waitingList(String option, Integer page, Integer pageSize, Model m, HttpServletRequest request) {
//
        if(page==null) page=1;
        if(pageSize==null) pageSize=12;

        int totalCnt = 0;
        try {
            totalCnt = accompanyService.waitingGetCount();

            PageHandlerOld ph = new PageHandlerOld(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);
            map.put("option", option);

            List<AccompanyDto> list = accompanyService.waitingGetPage(map);

//            System.out.println("list.size() = " + list.size());
//            List<AccompanyDto> list2 = new ArrayList<>();
//
//            Date today = new Date();
//            for (int i = 0; i < list.size(); i++) {
//                if(list.get(i).getEndAt().getTime()<today.getTime()) {
//                    list.get(i).setStatus(1);
//                }
//                System.out.println("list.get(0) = " + list.get(0));
//                System.out.println("list.get(0).getStatus() = " + list.get(0).getStatus());
//                boolean a = list.get(0).getStatus()==0;
//                System.out.println("a = " + a);
//                if(list.get(i).getStatus()==0) {
//                    list2.add(list.get(i));
//                }
//                System.out.println("list2.get(0) = " + list2.get(0).getStatus());
//            }
//            System.out.println("list2.size() = " + list2.size());

            m.addAttribute("mode", "waiting");
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

    @PostMapping("/modify")
    public String modify(@RequestParam MultipartFile uploadThumb, HttpServletRequest request, AccompanyDto accompanyDto, BindingResult result,
                         Integer page, Integer pageSize, Date startAt, Date endAt, String area3, String toURL, Model m, HttpSession session, RedirectAttributes rattr) {
        System.out.println("result = " + result);
        Integer writer = (int) session.getAttribute("id");
        //매개변수로 받지 않아도 dto로 자동으로 받는다.
        System.out.println("accompanyDto.getMemberCnt() = " + accompanyDto.getMemberCnt());
        accompanyDto.setRegionCode(area3);
        accompanyDto.setUserId(writer);
        accompanyDto.setStartAt(startAt);
        accompanyDto.setEndAt(endAt);

        //유효성 검사를 추가 해야 한다.
        //1. hashtag를 공백으로 구분해서 input태그에서 입력받고, 컨트롤러에서 받아서 공백으로 나눈다.
        if(accompanyDto.getHashtag()==null || accompanyDto.getHashtag().trim().equals(""))
            accompanyDto.setHashtag("아무나다좋아");
        String[] hashList = accompanyDto.getHashtag().split(" ");
        //2. 배열에서 값을 하나씩 꺼내서 앞에 #을 붙이고 문자열로 변환한다.
        String hashtag2 = "";
        for(String hashtag : hashList) {
            if(hashtag.charAt(0)!='#')
                hashtag2 += "# "+hashtag+" ";
            else {
                hashtag2 += hashtag+" ";
            }
        }
        System.out.println("hashtag2 = " + hashtag2);
        //3. 변환한 hashcode를 setter로 dto에 저장한다.
        accompanyDto.setHashtag(hashtag2);

        //chatUrl
        if(accompanyDto.getChatUrl().length()>=8) {
            String urlSub = accompanyDto.getChatUrl().trim().substring(0, 8);
            System.out.println("urlSub = " + urlSub);
            //2. https://면 https://를 제거하고, 아니면 그대로 둔다.
            if(urlSub.equals("https://"))
                accompanyDto.setChatUrl(accompanyDto.getChatUrl().trim().substring(8));
        }

        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);

            int rowCnt = accompanyService.modify(accompanyDto, uploadThumb, request);
            if(rowCnt!=1)
                throw new Exception("Modify Failed");
            rattr.addFlashAttribute("msg", "MOD_OK");
            if(toURL != null) {
                return "redirect:" + toURL;
            }
            return "redirect:/accompany/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(accompanyDto);
            m.addAttribute("msg", "MOD_ERR");
            return "accompany/accompanyWrite.mainTiles";
        }
    }

    @GetMapping("/modify")
    public String modify(Integer id, Integer page, Date startAt, Date endAt, Integer pageSize, Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login?toURL="+request.getRequestURL();
        AccompanyDto accompanyDto = null;
        try {
            accompanyDto = accompanyService.read(id);
            System.out.println("accompanyDto.getStartAt() = " + accompanyDto.getStartAt());
            System.out.println("accompanyDto.getEndAt() = " + accompanyDto.getEndAt());
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            m.addAttribute(accompanyDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "accompany/accompanyWrite.mainTiles";
    }

    @PostMapping("/write")
    public String write(AccompanyDto accompanyDto, BindingResult result, Integer memberCnt, @Valid Date startAt, @Valid Date endAt, String area3, Model m,
                        @RequestParam MultipartFile uploadThumb, HttpServletRequest request, HttpSession session, RedirectAttributes rattr) {
        Integer writer = (int) session.getAttribute("id");
        String email = (String) session.getAttribute("email");
        UserDto userDto = userService.selectUserByEmail(email);
        String nickname = userDto.getNickname();
        accompanyDto.setNickname(nickname);
        accompanyDto.setRegionCode(area3);
        accompanyDto.setStartAt(startAt);
        accompanyDto.setEndAt(endAt);
        accompanyDto.setMemberCnt(memberCnt);

        String profileImg = userDto.getProfileImg();
        System.out.println("profileImg = " + profileImg);
        accompanyDto.setProfileImg(profileImg);
        accompanyDto.setUserId(writer);

        //유효성 검사를 추가 해야 한다.
        //1. hashtag를 공백으로 구분해서 input태그에서 입력받고, 컨트롤러에서 받아서 공백으로 나눈다.
        if(accompanyDto.getHashtag()==null || accompanyDto.getHashtag().trim().equals(""))
            accompanyDto.setHashtag("아무나다좋아");
        String replaceHashtag = accompanyDto.getHashtag().trim().replaceAll(" +", " ");
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
        //3. 변환한 hashcode를 setter로 dto에 저장한다.
        accompanyDto.setHashtag(hashtag2);

        //chatUrl
        //1. chatUrl의 앞에서8글자를 urlSub에 저장.
        if(accompanyDto.getChatUrl().length()>=8) {
            String urlSub = accompanyDto.getChatUrl().trim().substring(0, 8);
            System.out.println("urlSub = " + urlSub);
            //2. https://면 https://를 제거하고, 아니면 그대로 두고 setter로 dto에 저장.
            if(urlSub.equals("https://"))
                accompanyDto.setChatUrl(accompanyDto.getChatUrl().trim().substring(8));
        }
        System.out.println("accompanyDto.getStartAt() = " + accompanyDto.getStartAt());
        System.out.println("result = " + result);
        System.out.println("uploadThumb = " + uploadThumb);
        try {
            int rowCnt = accompanyService.write(accompanyDto, request, uploadThumb);
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
    public String write(HttpServletRequest request, Model m) {

        if(!loginCheck(request))
            return "redirect:/login?toURL="+request.getRequestURL();
        m.addAttribute("mode", "new");
        return "accompany/accompanyWrite.mainTiles";
    }

    @PostMapping("/remove")
    public String remove(Integer id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        //writer
        Integer writer = (int) session.getAttribute("id");
//        Integer writer = 43;

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


        try {
            accompanyDto = accompanyService.read(id);

            //성별을 구한다.
            String genderPrev = accompanyDto.getGender();
            String genderNext = "";
            if(genderPrev.equals("M")) {
                genderNext = "남성";
            } else {
                genderNext = "여성";
            }

            //나이대를 구한다.
            SimpleDateFormat df = new SimpleDateFormat("yyyy");
            Date birthday = accompanyDto.getBirthday();
            String birthdayStr = df.format(birthday);
            Integer birthInt = Integer.valueOf(birthdayStr);
            Integer age = 2022 - birthInt + 1;
            age = age/10*10;
            String finalAge = age+"대";

            //성별, 나이를 해시태그에 setter로 저장.
            String finalHashtag = "#"+ genderNext + " #" + finalAge + " " + accompanyDto.getHashtag();
            accompanyDto.setHashtag(finalHashtag);
            System.out.println("id = " + id);
            System.out.println("accompanyDto.getEndAt() = " + accompanyDto.getEndAt());
            System.out.println("accompanyDto.getStatus() = " + accompanyDto.getStatus());
//            accompanyService.updateStatus(id, accompanyDto.getEndAt());
            System.out.println("accompanyDto.getEndAt() = " + accompanyDto.getEndAt().getTime());
            Date today = new Date();
            Date sqlDateToday = new java.sql.Date(today.getTime());
            Date sqlDateEndAt = new java.sql.Date(accompanyDto.getEndAt().getTime());

            long subtractGetTime = sqlDateToday.getTime() - sqlDateEndAt.getTime();
            System.out.println("subtractGetTime = " + subtractGetTime);
            if(accompanyDto.getEndAt().getTime()+(60*60*24*1000)<=today.getTime()) {
//            if(subtractGetTime > 0) {
                accompanyDto.setStatus(1);
            }

            //1. endAt을 불러온다.
            System.out.println("accompanyDto.getEndAt() = " + accompanyDto.getEndAt());
            //2. 오늘 날짜를 구한다.

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
    public String list(Integer page, Integer pageSize, String area3, String option, Model m, HttpServletRequest request) {
//        if(!loginCheck(request))
//            return "redirect:/login/login+toURL"+request.getRequestURL();
        if(page==null) page=1;
        if(pageSize==null) pageSize=12;
//        if(area3==null) area3="51";

        int totalCnt = 0;
        try {
            totalCnt = accompanyService.getCount();

            PageHandlerOld ph = new PageHandlerOld(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);
            map.put("option", option);
//            map.put("area3", area3);

            List<AccompanyDto> list = accompanyService.getPage(map);

            Date today = new Date();
            for (int i = 0; i < list.size(); i++) {
                if(list.get(i).getEndAt().getTime()+(60*60*24*1000)<=today.getTime()) {
                    list.get(i).setStatus(1);
                }
            }
//            System.out.println("list = " + list);
//            System.out.println("list.get(0).getEndAt() = " + list.get(0).getEndAt());
//            System.out.println("today = " + today.getTime());
//            for (int i = 0; i <= list.size()-1; i++) {
//                if(list.get(i).getEndAt().getTime()<=today.getTime()) {
//                    list.get(i).setStatus(1);
//                }
//            }
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
        return session != null && session.getAttribute("id") != null;
    }
}
