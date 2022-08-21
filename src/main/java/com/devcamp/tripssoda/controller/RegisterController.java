package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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


    EmailVerificationService emailVerificationService;

    // 생성자
    public RegisterController(EmailVerificationService emailVerificationService, TermsService termsService, UserService userService, UserTourInterestService userTourInterestService, TourInterestCodeService tourInterestCodeService) {
        this.userService = userService;
        this.userTourInterestService = userTourInterestService;
        this.tourInterestCodeService = tourInterestCodeService;
        this.termsService = termsService;
        this.emailVerificationService = emailVerificationService;
    }

    // 회원가입 유형 선택 페이지로 이동
    @GetMapping("/register")
    public String selectRegisterType() {
        return "user/selectRegisterType.mainTiles";
    }

    // 이메일 회원가입 양식 페이지로 이동
    @GetMapping("/register/write")
    public String writeUserInfo() {
        return "user/registerForm.mainTiles";
    }

    // 이메일 회원가입 form 전송
    @PostMapping("/register/write")
    public String writeUserInfo(UserDto userDto, BindingResult bindingResult, HttpServletRequest request, Model model, RedirectAttributes rattr) throws Exception {
        // 수동으로 유효성 검사
        UserValidator userValidator = new UserValidator();
        userValidator.validate(userDto, bindingResult);

        // 에러가 있으면 form 초기화
        if(bindingResult.hasErrors()) {
            System.out.println("bindingResult = " + bindingResult);
            return "user/registerForm.subTiles";
        }

        try {
            // 비밀번호와 비밀번호 확인값이 다르면 예외를 던짐
            if(!userDto.getPwdConfirm().equals(userDto.getPwd())) {
                throw new Exception("Password is different");
            }

            // 3번째 약관(선택약관)에 동의를 하지 않았으면 0(비동의)으로 상태 저장
            if(userDto.getThirdTermsStatus()==null) {
                userDto.setThirdTermsStatus(0);
            }
            // 비밀번호를 암호화하여 UserDto에 저장
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String securedPwd = encoder.encode(userDto.getPwd());
            userDto.setPwd(securedPwd);

            // 세션에 가입정보를 저장
            HttpSession session = request.getSession();
            session.setAttribute("userDto", userDto);

            // 이메일 인증정보를 삭제
            emailVerificationService.deleteEmailVerification(userDto.getEmail());

            // 여행관심사 목록을 model에 저장(다음 페이지인 관심사 선택 페이지에서 사용)
            List<TourInterestCodeDto> tourInterestCodeDtoList = tourInterestCodeService.selectAllTourInterestCode();
            model.addAttribute("tourInterestCodeDtoList", tourInterestCodeDtoList);

        } catch (Exception e) {
            // 에러가 발생했을 경우 메세지를 표시하고 회원가입 양식 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "USER_WRITE_ERR");
            return "redirect:/register/write";
        }
        // 여행관심사 선택 페이지로 이동
        return "user/selectInterest.mainTiles";
    }

    // 회원가입 제출
    @PostMapping("/register/submit")
    public String submitUserInfo(String firstInterest, String secondInterest, String thirdInterest, HttpSession session, Model model, RedirectAttributes rattr) throws Exception {
        try {
            // 마이페이지에서 여행관심사를 수정하는 경우에 실행될 코드
            if(session.getAttribute("userDto") == null) {
                userTourInterestService.updateUserTourInterest(firstInterest, secondInterest, thirdInterest, session);

                rattr.addFlashAttribute("msg", "UPDATE_USERINTEREST_SUCCESS");
                return "redirect:/mypage/info";
            }
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "UPDATE_USERINTEREST_FAILED");
            return "redirect:/mypage/info";
        }

        // 회원가입과정에서 여행관심사를 선택하는 경우에 실행될 코드
        try {
            // 세션에 저장되어있던 유저정보와 약관동의상태들을 가져옴
            UserDto userDto = (UserDto)session.getAttribute("userDto");

            // 회원가입 성공시 가입한 이메일을 보여주기위해 모델에 저장
            model.addAttribute("email", userDto.getEmail());

            // 유저정보를 insert함
            userService.insertUser(userDto, firstInterest, secondInterest, thirdInterest);

            // insert 되었으면 세션을 종료
            session.invalidate();
        } catch (Exception e) {
            // 에러가 발생했을 경우 메세지를 표시하고 회원가입 양식 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "USER_REGISTER_ERR");
            return "redirect:/register/write";
        }

        // 가입 성공 화면으로 이동
        return "user/registerSuccess.mainTiles";
    }

    // 이메일 인증번호를 전송하는 메서드
    @ResponseBody
    @PostMapping("/register/emailCheck")
    public String emailCheck(String email) {
        UserDto userDto = userService.selectUserByEmail(email);
        // 이미 가입된 이메일이라면 에러메세지를 반환
        if(userDto != null) {
            return "Email already exists";
        }

        // 인증번호를 발송하고, 인증번호를 가져옴
        String verfCode = emailVerificationService.sendEmail(email);
        // 인증메일 전송 버튼을 누른 후, 인증이 완료되지 않은 상태에서 다시 인증버튼을 누르는 경우
        try {
            EmailVerificationDto emailVerificationDto = emailVerificationService.selectEmailVerification(email);
            if(emailVerificationDto != null) {
                // 인증번호와 인증시간을 새로 업데이트한다.
                emailVerificationService.updateEmailVerification(emailVerificationDto, verfCode);
                return "Email has been sent";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Update emailVerification failed";
        }

        // 인증메일 발송에 에러가 생기는 경우는 에러메세지를 return
        if(verfCode.equals("error")){
            return "Send email failed";
        } else {
            // 새 인증정보를 insert
            try {
                emailVerificationService.insertEmailVerification(email, verfCode, new Date());
            } catch (Exception e) {
                e.printStackTrace();
                return "Insert emailVerification failed";
            }
            return "Email has sent";
        }
    }

    // 인증번호를 확인하는 메서드
    @ResponseBody
    @PostMapping("/register/confirmVerfCode")
    public String confirmVerfCode(String inputCode, String email) {
        EmailVerificationDto emailVerificationDto = emailVerificationService.selectEmailVerification(email);
        // 인증 정보가 없으면 실패 메시지 반환
        if(emailVerificationDto == null) {
            return "invalid verificaion info";
        }
        // DB에 저장된 유효시간을 가져옴
        Date validTime = emailVerificationDto.getValidTime();
        // 유효시간이 현재시간보다 이전이면 실패
        if(validTime.before(new Date())) {
            return "fail";
        }
        // 인증코드를 가져옴
        String verfCode = emailVerificationDto.getVerfCode();
        // 인증코드가 입력받은 인증코드와 일치하면 status를 1(인증성공)으로 업데이트함
        if(verfCode.equals(inputCode)) {
            emailVerificationDto.setStatus(1);
            try {
                emailVerificationService.updateEmailVerificationStatus(emailVerificationDto);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
                return "update fail";
            }
        }
        System.out.println("verfCode = " + verfCode);
        System.out.println("inputCode = " + inputCode);
        return "update fail";
    }

    // 인증상태를 확인하는 메서드
    @ResponseBody
    @PostMapping("/register/confirmVerfStatus")
    public boolean confirmVerfStatus(String email) {
        EmailVerificationDto emailVerificationDto = emailVerificationService.selectEmailVerification(email);
        Integer status = emailVerificationDto.getStatus();
        if(status != 1) {
            return false;
        }
        return true;
    }




    // 약관 보여주는 화면을 일단 임시로 여기 컨트롤러에 만들어둠
    @GetMapping("/terms/service")
    public String showServiceTerm(Model model) {
        TermsDto termsDto = termsService.selectTerms("U001", 1);
        model.addAttribute("termsDto", termsDto);

        return "user/serviceTerm.mainTiles";
    }

    @GetMapping("/terms/privacy")
    public String showPrivacyTerm(Model model) {
        TermsDto termsDto = termsService.selectTerms("U001", 2);
        model.addAttribute("termsDto", termsDto);

        return "user/privacyTerm.mainTiles";
    }

    @GetMapping("/terms/marketing")
    public String showMarketingTerm(Model model) {
        TermsDto termsDto = termsService.selectTerms("U001", 3);
        model.addAttribute("termsDto", termsDto);

        return "user/marketingTerm.mainTiles";
    }

//    @GetMapping("/register/emailCheck")
//    public String emailCheck(){
//        return "user/emailCheck.subTiles";
//    }


}


