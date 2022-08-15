package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.dto.UserTourInterestDto;
import com.devcamp.tripssoda.service.UserService;
import com.devcamp.tripssoda.service.UserTourInterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyPageController {

    @Autowired
    UserService userService;

    @Autowired
    UserTourInterestService userTourInterestService;

    // 마이페이지의 default 페이지(마이페이지의 default 페이지는 계정관리 페이지임)
    @GetMapping("/mypage/info")
    public String myPage(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes rattr) {
        try {
            // 세션에 이메일이 없으면 로그인 페이지로 이동
            if(session.getAttribute("email") == null) {
                return "redirect:/login?toURL="+request.getRequestURL();
            } else {
                // 이메일로 유저정보를 가져와서 model에 저장
                String userEmail = (String)session.getAttribute("email");
                UserDto userDto = userService.selectUser(userEmail);
                model.addAttribute("userDto", userDto);

                // id로 유저여행관심사 목록을 가져와서 model에 저장
                Integer userId = (Integer)session.getAttribute("id");
                List<UserTourInterestDto> userTourInterestDtoList = userTourInterestService.selectAllUserTourInterest(userId);
                model.addAttribute("userTourInterestDtoList", userTourInterestDtoList);

            }
        } catch (Exception e) {
            // 에러발생시 로그인 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_INFO_ERR");
            return "redirect:/login";
        }
        // 계정관리 페이지로 이동
        return "user/accountManage.subTiles";
    }

    // 회원 정보를 업데이트
    @PostMapping("/mypage/info/update")
    public String updateUserInfo(UserDto userDto, String pwdConfirm, HttpSession session, Model model, RedirectAttributes rattr) throws Exception {

        try {
            // 비밀번호와 비밀번호 확인값이 다르면 예외를 던짐
            if(!pwdConfirm.equals(userDto.getPwd())) {
                throw new Exception("Password is different");
            }

            boolean updateResult = userService.updateUser(userDto, session);

            if(!updateResult) {
                throw new Exception("Update failed");
            }

            rattr.addFlashAttribute("msg", "UPDATE_SUCCESS");
        } catch (Exception e) {
            // 에러 발생시 에러메세지를 표시하고 계정 관리 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "UPDATE_INFO_ERR");
        }

        // 계정관리 페이지로 이동
        return "redirect:/mypage/info";
    }

//    // 여행관심사 선택 페이지로 이동(회원 여행관심사 수정에 사용할 예정)
//    @GetMapping("/mypage/info/updateInterest")
//    public String selectUserInterest() {
//
//        return "user/selectInterest.subTiles";
//    }

    // 회원 탈퇴
    @PostMapping("/mypage/delete")
    public String deleteUser(HttpSession session, RedirectAttributes rattr) throws Exception {
        try {
            // 세션에서 이메일을 가져와서 계정을 탈퇴시킴
            String userEmail = (String)session.getAttribute("email");
            boolean deleteResult = userService.deleteUser(userEmail);

            //
            if(!deleteResult) {
                throw new Exception("Delete failed");
            }
            session.invalidate();

            rattr.addFlashAttribute("msg", "DELETE_SUCCESS");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/";
    }
}
