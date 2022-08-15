package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.dto.UserHistoryDto;
import com.devcamp.tripssoda.service.UserHistoryService;
import com.devcamp.tripssoda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class LoginController {

    @Autowired
    UserService userService;

    @Autowired
    UserHistoryService userHistoryService;

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/login")
    public String selectRegisterType() {

        return "user/selectLoginType.subTiles";
    }

    @GetMapping("/login/emailLogin")
    public String loginForm() {

        return "user/loginForm.subTiles";
    }

    @PostMapping("/login/emailLogin")
    public String login(String email, String pwd, boolean rememberId, String toURL, HttpServletRequest request, HttpServletResponse response) {
        try {
            if(!loginCheck(email, pwd)) {
                String msg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "utf-8");

                return "redirect:/login/emailLogin?msg=" + msg;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        UserDto userDto = userService.selectUser(email);
        Integer userId = userDto.getId();
        session.setAttribute("id", userId);
        session.setAttribute("email", email);

        // 로그인 기록을 저장
        UserHistoryDto userHistoryDto = new UserHistoryDto(userId, "로그인", userId);
        userHistoryService.insertUserHistory(userHistoryDto);

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

    // 로그인 시도하는 메서드
    private boolean loginCheck(String email, String pwd) {
        UserDto userDto = userService.selectUser(email);

        // 유저 정보가 없거나, 비밀번호가 틀리면 false 반환
        return userDto != null && userDto.getStatus() != 0 && userDto.getPwd().equals(pwd);
    }
}
