package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.TermsService;
import com.devcamp.tripssoda.service.TourInterestCodeService;
import com.devcamp.tripssoda.service.UserService;
import com.devcamp.tripssoda.service.UserTourInterestService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class RegisterController {

    UserService userService;

    UserTourInterestService userTourInterestService;

    TourInterestCodeService tourInterestCodeService;

    TermsService termsService;

    // 생성자
    public RegisterController(TermsService termsService, UserService userService, UserTourInterestService userTourInterestService, TourInterestCodeService tourInterestCodeService) {
        this.userService = userService;
        this.userTourInterestService = userTourInterestService;
        this.tourInterestCodeService = tourInterestCodeService;
        this.termsService = termsService;
    }

    // 회원가입 유형 선택 페이지로 이동
    @GetMapping("/register")
    public String selectRegisterType() {
        return "user/selectRegisterType.subTiles";
    }

    // 이메일 회원가입 양식 페이지로 이동
    @GetMapping("/register/write")
    public String writeUserInfo() {
        return "user/registerForm.subTiles";
    }

    // 이메일 회원가입 form 전송
    @PostMapping("/register/write")
    public String writeUserInfo(UserDto userDto, String pwdConfirm, int year, int month, int day,
                                int firstTermsStatus, int secondTermsStatus, Integer thirdTermsStatus, HttpServletRequest request, Model model, RedirectAttributes rattr) throws Exception {
        try {
            // 비밀번호와 비밀번호 확인값이 다르면 예외를 던짐
            if(!pwdConfirm.equals(userDto.getPwd())) {
                throw new Exception("Password is different");
            }

            // 날짜를 Dto에 저장
            Date birthday = new Date(year - 1900, month - 1, day);
            userDto.setBirthday(birthday);

            // 3번째 약관(선택약관)에 동의를 하지 않았으면 0(비동의)으로 상태 저장
            if(thirdTermsStatus==null) {
                thirdTermsStatus = 0;
            }

            // 세션에 약관 상태를 저장
            HttpSession session = request.getSession();
            session.setAttribute("userDto", userDto);
            session.setAttribute("firstTermsStatus", firstTermsStatus);
            session.setAttribute("secondTermsStatus", secondTermsStatus);
            session.setAttribute("thirdTermsStatus", thirdTermsStatus);

            // 여행관심사 목록을 model에 저장
            List<TourInterestCodeDto> tourInterestCodeDtoList = tourInterestCodeService.selectAllTourInterestCode();
            model.addAttribute("tourInterestCodeDtoList", tourInterestCodeDtoList);

        } catch (Exception e) {
            // 에러가 발생했을 경우 메세지를 표시하고 회원가입 양식 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "USER_WRITE_ERR");
            return "redirect:/register/write";
        }
        // 여행관심사 선택 페이지로 이동
        return "user/selectInterest.subTiles";
    }

    // 회원가입 제출
    @PostMapping("/register/submit")
    public String submitUserInfo(String firstInterest, String secondInterest, String thirdInterest, HttpSession session, Model model, RedirectAttributes rattr) throws Exception {
        try {
            // 세션에 저장되어있던 유저정보와 약관동의상태들을 가져옴
            UserDto userDto = (UserDto)session.getAttribute("userDto");
            int firstTermsStatus = (int)session.getAttribute("firstTermsStatus");
            int secondTermsStatus = (int)session.getAttribute("secondTermsStatus");
            int thirdTermsStatus = (int)session.getAttribute("thirdTermsStatus");

            // 회원가입 성공시 가입한 이메일을 보여주기위해 모델에 저장
            model.addAttribute("email", userDto.getEmail());

//       userService.txTest();

            // 유저정보를 insert함
            userService.insertUser(userDto, firstInterest, secondInterest, thirdInterest, firstTermsStatus, secondTermsStatus, thirdTermsStatus);
//            if(insertUserResult == false) {
//                model.addAttribute("msg", "USER_REGISTER_ERR");
//                return "user/registerForm.subTiles";
//            }

            // insert 되었으면 세션을 종료
            session.invalidate();
        } catch (Exception e) {
            // 에러가 발생했을 경우 메세지를 표시하고 회원가입 양식 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "USER_REGISTER_ERR");
            return "redirect:/register/write";
        }

        // 가입 성공 화면으로 이동
        return "user/registerSuccess.subTiles";
    }








    // 약관 보여주는 화면을 일단 임시로 여기 컨트롤러에 만들어둠
    @GetMapping("/terms/service")
    public String showServiceTerm(Model model) {
        TermsDto termsDto = termsService.selectTerms("U001", 1);
        model.addAttribute("termsDto", termsDto);

        return "user/serviceTerm.subTiles";
    }

    @GetMapping("/terms/privacy")
    public String showPrivacyTerm(Model model) {
        TermsDto termsDto = termsService.selectTerms("U001", 2);
        model.addAttribute("termsDto", termsDto);

        return "user/privacyTerm.subTiles";
    }

    @GetMapping("/terms/marketing")
    public String showMarketingTerm(Model model) {
        TermsDto termsDto = termsService.selectTerms("U001", 3);
        model.addAttribute("termsDto", termsDto);

        return "user/marketingTerm.subTiles";
    }
}
