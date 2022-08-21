package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.EmailVerificationDto;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.dto.UserHistoryDto;
import com.devcamp.tripssoda.service.EmailVerificationService;
import com.devcamp.tripssoda.service.UserHistoryService;
import com.devcamp.tripssoda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.regex.Pattern;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @Autowired
    UserHistoryService userHistoryService;

    @Autowired
    EmailVerificationService emailVerificationService;

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        Integer userId = (Integer)session.getAttribute("id");
        UserHistoryDto userHistoryDto = new UserHistoryDto(userId, "로그아웃", userId);
        try {
            int rowCnt = userHistoryService.insertUserHistory(userHistoryDto);
            if(rowCnt != 1) {
                throw new Exception("Insert user history failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 세션을 종료
        session.invalidate();
        return "redirect:/";
    }

    // 로그인 유형 선택화면으로 이동하는 메서드
    @GetMapping("/login")
    public String selectRegisterType() {

        return "user/selectLoginType.mainTiles";
    }

    // 이메일 로그인 화면으로 이동하는 메서드
    @GetMapping("/login/emailLogin")
    public String loginForm() {

        return "user/loginForm.mainTiles";
    }

    // 이메일 로그인 처리하는 메서드
    @PostMapping("/login/emailLogin")
    public String login(String email, String pwd, boolean rememberId, String toURL, RedirectAttributes rattr, HttpServletRequest request, HttpServletResponse response) {
        try {
            if(!loginCheck(email, pwd)) {
                String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");

                return "redirect:/login/emailLogin?msg=" + msg + "&toURL=" + toURL;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        //  세션 객체에 id와 email을 저장
        UserDto userDto = userService.selectUser(email);
        Integer userId = userDto.getId();
        session.setAttribute("id", userId);
        session.setAttribute("email", email);

        // 로그인 기록을 저장
        UserHistoryDto userHistoryDto = new UserHistoryDto(userId, "로그인", userId);
        try {
            userHistoryService.insertUserHistory(userHistoryDto);
        } catch (Exception e) {
            rattr.addFlashAttribute("msg", "Insert user history error");
            return "redirect:/login/emailLogin";
        }

        if(rememberId) {
            Cookie cookie = new Cookie("email", email);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("email", email);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        // 계정이 휴면 상태이면 휴면 해제 화면으로 이동
//        if(userDto.getStatus() == 0) {
//            /* 이동 코드(미구현) */
//        }
        System.out.println("login success");

        // 홈으로 이동
        toURL = toURL == null || toURL.equals("")? "/" : toURL;
        return "redirect:" + toURL;
    }
    // 이메일을 찾는 form을 보여주는 메서드
    @GetMapping("/login/findEmail")
    public String findEmail() {
        return "user/findEmail.mainTiles";
    }

    // 이메일을 찾는 메서드
    @PostMapping("/login/findEmail")
    public String findEmail(String name, String tel, Model model) {

        String email = userService.selectEmailByNameAndTel(name, tel);
        // 이메일이 비어있으면 에러메세지와 함께 redirect
        if(email == null) {
            String msg = "";
            try {
                msg = URLEncoder.encode("해당 정보와 일치하는 이메일을 찾지 못했습니다.", "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return "redirect:/login/findEmail?msg= " + msg;
        }
        model.addAttribute("email", email);

        return "user/findEmailSuccess.mainTiles";
    }

    // 비밀번호를 찾는 form을 보여주는 메서드
    @GetMapping("/login/findPwd")
    public String findPwd() {
        return "user/findPassword.mainTiles";
    }

    // 비밀번호를 찾기 위한 인증번호 전송 메서드
    @ResponseBody
    @PostMapping("/login/findPwd/sendEmail")
    public String emailCheck(String email, String name) {
        // 입력한 이메일, 이름에 해당하는 유저 정보가 없으면 에러 메세지를 반환
        UserDto userDto = userService.selectUserByNameAndEmail(email, name);
        System.out.println("email = " + email);
        System.out.println("name = " + name);
        System.out.println("userDto = " + userDto);

        if(userDto == null) {
            return "Invalid email";
        }

        // 이메일을 전송하고 인증코드를 변수에 저장
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
            return "Email has been sent";
        }

    }

    // 비밀번호를 찾는 메서드(동시에 인증번호도 검증)
    @PostMapping("/login/findPwd")
    public String findPwd(String email, String inputCode, Model model) {
        // 이메일에 해당하는 인증 정보를 가져옴
        EmailVerificationDto emailVerificationDto = emailVerificationService.selectEmailVerification(email);
        // 인증 정보가 없으면 에러 메세지를 반환
        String msg = "";
        if(emailVerificationDto == null) {
            try {
                msg = URLEncoder.encode("인증 정보가 올바르지 않습니다.<br>인증을 다시 진행해주세요.", "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return "redirect:/login/findPwd?msg=" + msg;
        }

        // DB에 저장된 유효시간을 가져옴
        Date validTime = emailVerificationDto.getValidTime();
        // 유효시간이 현재시간보다 이전이면 실패
        if(validTime.before(new Date())) {
            try {
                msg = URLEncoder.encode("유효시간이 만료되었습니다.<br>인증을 다시 진행해주세요.", "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return "redirect:/login/findPwd?msg=" + msg;
        }
        // 인증코드를 가져옴
        String verfCode = emailVerificationDto.getVerfCode();
        // 인증코드가 입력받은 인증코드와 일치하면 새로 비밀번호를 설정하는 화면으로 이동
        if(verfCode.equals(inputCode)) {
            // 이메일을 모델에 저장
            model.addAttribute("email", email);
            return "user/changePassword.mainTiles";
        }
        System.out.println("verfCode = " + verfCode);
        System.out.println("inputCode = " + inputCode);
        try {
            msg = URLEncoder.encode("인증번호가 일치하지 않습니다.<br>올바른 인증번호를 다시 입력해주세요", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:/login/findPwd?msg=" + msg;
    }

    // 비밀번호를 변경하는 메서드
    @PostMapping("/login/changePassword")
    public String changePassword(String pwd, String pwdConfirm, String email, Model model, RedirectAttributes rattr) {
        // 비밀번호 양식 검증 (8~12자리 문자,숫자,특수문자 혼합)
        if(!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,12}$", pwd)) {
            String msg = null;
            try {
                msg = URLEncoder.encode("비밀번호가 올바르지 않습니다. 양식에 맞게 작성해주세요.", "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            model.addAttribute("msg", msg);
            return "user/changePassword.mainTiles";
        }

        // 비밀번호와 비밀번호 확인값이 다른지 검증
        if(!pwd.equals(pwdConfirm)) {
            String msg = null;
            try {
                msg = URLEncoder.encode("비밀번호가 일치하지 않습니다. 다시 입력해주세요.", "UTF-8");

            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            // 다르면 에러메세지를 model에 저장후 다시 돌아옴
            model.addAttribute("msg", msg);
            return "user/changePassword.mainTiles";
        }
        // 변경 완료
        try {
            userService.updateUserPassword(email, pwd);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "UPDATE_PWD_ERR");
            return "redirect:/login/findPwd";
        }
        rattr.addFlashAttribute("msg", "PWD_MOD_OK");

        return "redirect:/login";
    }

    // 로그인 시도하는 메서드
    private boolean loginCheck(String email, String pwd) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        UserDto userDto = userService.selectUser(email);

        // 유저 정보가 없거나, 비밀번호가 틀리면 false 반환
        return userDto != null && userDto.getStatus() != 0 && encoder.matches(pwd, userDto.getPwd());
//        return true;
    }
}
