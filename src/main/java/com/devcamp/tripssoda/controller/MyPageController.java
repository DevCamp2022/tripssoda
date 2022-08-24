package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.*;
import net.coobird.thumbnailator.Thumbnails;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.dto.UserTourInterestDto;
import com.devcamp.tripssoda.dto.UserValidator;
import com.devcamp.tripssoda.service.UserService;
import com.devcamp.tripssoda.service.UserTourInterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class MyPageController {

    @Autowired
    UserService userService;

    @Autowired
    UserTourInterestService userTourInterestService;

    @Autowired
    TourInterestCodeService tourInterestCodeService;

    @Autowired
    UserPointHistoryService userPointHistoryService;

    @Autowired
    ProductReviewService productReviewService;

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @Autowired
    AccompanyService accompanyService;

    @Autowired
    InquiryService inquiryService;

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
                List<String> userTourInterestListKeyword = userTourInterestService.selectAllUserTourInterestKeyword(userId);
                model.addAttribute("userTourInterestList", userTourInterestListKeyword);

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
    // 회원 정보 update form을 보여줌
    @GetMapping("/mypage/info/update")
    public String updateUserInfo(HttpSession session, Model model, HttpServletRequest request, RedirectAttributes rattr) {
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
                List<String> userTourInterestList = userTourInterestService.selectAllUserTourInterestKeyword(userId);
                model.addAttribute("userTourInterestList", userTourInterestList);

            }
        } catch (Exception e) {
            // 에러발생시 로그인 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "READ_INFO_ERR");
            return "redirect:/login";
        }
        return "user/updateUserForm.subTiles";
    }

    // 회원 정보를 업데이트
    @PostMapping("/mypage/info/update")
    public String updateUserInfo(UserDto userDto, BindingResult bindingResult, MultipartFile img, HttpServletRequest request, HttpSession session, RedirectAttributes rattr) throws Exception {
        // 업데이트 하는 정보 수동검증
        UserUpdateValidator userUpdateValidator = new UserUpdateValidator();
        userUpdateValidator.validate(userDto, bindingResult);
        // 에러가 있으면 계정정보 페이지로 redirect
        if(bindingResult.hasErrors()) {
            System.out.println("bindingResult = " + bindingResult);
            return "user/updateUserForm.subTiles";
        }

        try {
            // 비밀번호를 암호화 하여 userDto에 저장
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String securedPwd = encoder.encode(userDto.getPwd());
            userDto.setPwd(securedPwd);

            // 이미지 파일의 이름을 저장
            String realPath = request.getServletContext().getRealPath("/resources/user/profileImg");

            UUID uuid = UUID.randomUUID();
            String uploadName = uuid + img.getOriginalFilename();

            File folder = new File(realPath);
            // 이미지가 비어있으면 기존에 있던 이미지 파일 이름을 다시 저장하고 업데이트
            if(img.isEmpty()) {
                String oldImg = userService.selectUserByEmail(userDto.getEmail()).getProfileImg();
                userDto.setProfileImg(oldImg);

                userService.updateUser(userDto, session);
                rattr.addFlashAttribute("msg", "UPDATE_SUCCESS");
//                userDto.setProfileImg("Empty");
            } else {

                if(!folder.exists()){
                    try{
                        folder.mkdirs(); // 폴더 생성
                    } catch(Exception e){
                        e.printStackTrace();
                    }
                }

                /* 파일 위치, 파일 이름을 합친 File 객체 */
                File file = new File(realPath, uploadName);

//                //실제 업로드       File.separator + "resized"
//                try {
//                    img.transferTo(file);
//                    ImageResize.thumbnailResize(realPath, uploadName);
//
//                } catch (IllegalStateException | IOException e) {
//
//                }

                /* 파일 저장 */
                try {
                    img.transferTo(file);

                    File thumbnailFile = new File(realPath, "resized" + uploadName);

                    BufferedImage bo_image = ImageIO.read(file);

//                //비율
//                double ratio = 3;
//                //넓이 높이
//                int width = (int) (bo_image.getWidth() / ratio);
//                int height = (int) (bo_image.getHeight() / ratio);

                    int width = 300;
                    int height = 300;

                    Thumbnails.of(file)
                            .size(width, height)
                            .toFile(thumbnailFile);

                    userDto.setProfileImg("resized" + uploadName);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            // 유저 정보를 업데이트
            userService.updateUser(userDto, session);

            rattr.addFlashAttribute("msg", "UPDATE_SUCCESS");
        } catch (Exception e) {
            // 에러 발생시 에러메세지를 표시하고 계정 관리 페이지로 이동
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "UPDATE_INFO_ERR");
        }

        // 계정관리 페이지로 이동
        return "redirect:/mypage/info";
    }

//    // 여행관심사 선택 페이지로 이동(회원 여행관심사 수정에 사용할 수도?)
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
            userService.deleteUser(userEmail);

            // 세션을 종료
            session.invalidate();

            rattr.addFlashAttribute("msg", "DELETE_SUCCESS");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DELETE_ERR");
        }

        return "redirect:/";
    }

    // 여행관심사 선택 페이지로 이동(Register Controller에 만들어놓은 메서드 활용)
    @GetMapping("/mypage/info/updateInterest")
    public String updateUserInterest(Model model) {

        // 여행관심사 목록을 model에 저장
        List<TourInterestCodeDto> tourInterestCodeDtoList = tourInterestCodeService.selectAllTourInterestCode();
        model.addAttribute("tourInterestCodeDtoList", tourInterestCodeDtoList);

        return "user/selectInterest.subTiles";
    }

    // 닉네임 중복 체크
    @ResponseBody
    @PostMapping("/mypage/info/nicknameCheck")
    public Boolean nicknameCheck(String nickname, HttpSession session) {
        // 닉네임이 기존 닉네임과 동일하면 true 반환
        if(nickname.equals(userService.selectUserByEmail((String)session.getAttribute("email")).getNickname())) {
            return true;
        }
        // 닉네임으로 유저정보를 select했을 때 null인지 아닌지를 반환(null이면 중복 x)
        return userService.selectUserByNickname(nickname) == null;
    }

    // 사이드 메뉴를 보여주는 메서드
    @GetMapping("/mypage/side")
    public String side(){
        return "user/myPageSide";
    }

    // 예약 내역 페이지로 이동
    @GetMapping("/mypage/reservationList")
    public String reservationInfo(HttpSession session, HttpServletRequest request) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }


        return "user/reservationList.subTiles";
    }

    // 적립 내역 페이지로 이동
    @GetMapping("/mypage/pointHistory")
    public String pointHistory(HttpSession session, HttpServletRequest request, SearchCondition sc, Model model) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }
        // 세션으로부터 userId와 이메일을 얻는다
        Integer userId = (Integer)session.getAttribute("id");
        String email = (String)session.getAttribute("email");
        // 계정 정보에서 point를 가져온다
        UserDto userDto = userService.selectUser(email);
        Integer point = userDto.getPoint();
        model.addAttribute("point", point);

        // 총 포인트 변경이력 갯수를 얻는다.
        int totalCnt = userPointHistoryService.selectAllUserPointHistoryCnt(userId);
        // SearchCondition의 한번에 보여줄 이력의 숫자를 5로 만든다.(페이지 핸들링에 영향)
        sc.setPageSize(5);
        // 페이지핸들러를 만든다
        PageHandler ph = new PageHandler(totalCnt, sc);
        // 포인트 변경이력 목록을 가져온다
        List<UserPointHistoryDto> userPointHistoryDtoList = userPointHistoryService.selectAllUserPointHistory(userId, sc);

        // 모델에 각각 저장한다
        model.addAttribute("totalCnt", totalCnt);
        model.addAttribute("ph", ph);
        model.addAttribute("userPointHistoryDtoList", userPointHistoryDtoList);

        return "user/pointHistory.subTiles";
    }

    // 여행후기 페이지로 이동
    @GetMapping("/mypage/tourReviewList")
    public String tourReviewList(HttpSession session, HttpServletRequest request, SearchCondition sc, Model model) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }

        // 세션으로부터 userId를 얻는다
        Integer userId = (Integer)session.getAttribute("id");
        // 해당 계정으로 등록한 여행후기 total글 수를 가져온다.
        int totalCnt = productReviewService.selectAllUserProductReviewCnt(userId);
        // 한 번에 보여줄 후기의 갯수를 5로 지정한다
        sc.setPageSize(5);
        // 페이지 핸들러를 만든다
        PageHandler ph = new PageHandler(totalCnt, sc);
        // 해당 계정으로 등록된 여행후기 목록을 가져온다.
        List<ProductReviewDto> productReviewDtoList = productReviewService.selectAllUserProductReview(userId, sc);
        // 모델에 각각 저장한다
        model.addAttribute("totalCnt", totalCnt);
        model.addAttribute("ph", ph);
        model.addAttribute("productReviewDtoList", productReviewDtoList);

        return "user/tourReviewList.subTiles";

    }

    // 내 QnA 페이지로 이동 - 작성한 질문 리스트
    @GetMapping("/mypage/qnaList")
    public String qnaList(HttpSession session, HttpServletRequest request, SearchCondition sc, Model model) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }
        // 세션으로부터 userId를 얻는다
        Integer userId = (Integer)session.getAttribute("id");
        // 해당 계정으로 등록한 여행후기 작성 total글 수를 가져온다.
        int totalQuestionCnt = questionService.selectAllUserQuestionCnt(userId);
        // 해당 계정으로 등록한 여행후기 답변 total글 수를 가져온다.
        int totalAnswerCnt = answerService.selectAllUserAnswerCnt(userId);

        // 한 번에 보여줄 후기의 갯수를 5로 지정한다
        sc.setPageSize(5);
        // 페이지 핸들러를 만든다
        PageHandler ph = new PageHandler(totalQuestionCnt, sc);
        // 해당 계정으로 등록된 QnA 목록을 가져온다.
        List<QuestionDto> questionDtoList = questionService.selectAllUserQuestion(userId, sc);

        model.addAttribute("totalQuestionCnt", totalQuestionCnt);
        model.addAttribute("totalAnswerCnt", totalAnswerCnt);
        model.addAttribute("ph", ph);
        model.addAttribute("questionDtoList", questionDtoList);

        return "user/qnaList.subTiles";
    }

    // 내 QnA 페이지 - 작성한 답변 리스트
    @GetMapping("/mypage/answerList")
    public String answerList(HttpSession session, HttpServletRequest request, SearchCondition sc, Model model) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }
        // 세션으로부터 userId를 얻는다
        Integer userId = (Integer)session.getAttribute("id");
        // 해당 계정으로 등록한 여행후기 total글 수를 가져온다.
        int totalQuestionCnt = questionService.selectAllUserQuestionCnt(userId);
        // 해당 계정으로 등록한 여행후기 답변 total글 수를 가져온다.
        int totalAnswerCnt = answerService.selectAllUserAnswerCnt(userId);
        // 한 번에 보여줄 게시글의 갯수를 5로 지정한다
        sc.setPageSize(5);
        // 페이지 핸들러를 만든다
        PageHandler ph = new PageHandler(totalAnswerCnt, sc);
        // 해당 계정으로 등록된 QnA 목록을 가져온다.
        List<AnswerDto> answerDtoList = answerService.selectAllUserAnswer(userId, sc);
        // 닉네임을 가져온다.
        String nickname = userService.selectUserByEmail((String)session.getAttribute("email")).getNickname();

        model.addAttribute("nickname", nickname);
        model.addAttribute("totalQuestionCnt", totalQuestionCnt);
        model.addAttribute("totalAnswerCnt", totalAnswerCnt);
        model.addAttribute("ph", ph);
        model.addAttribute("answerDtoList", answerDtoList);

        return "user/answerList.subTiles";
    }

    // 내 동행게시글 페이지로 이동
    @GetMapping("/mypage/accompanyList")
    public String accompanyList(HttpSession session, HttpServletRequest request, SearchCondition sc, Model model) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }

        // 세션으로부터 userId를 얻는다
        Integer userId = (Integer)session.getAttribute("id");
        // 해당 계정으로 등록한 동행게시글 total글 수를 가져온다.
        int totalCnt = accompanyService.selectUserAccompanyCnt(userId);
        // 한 번에 보여줄 게시글의 갯수를 5로 지정한다
        sc.setPageSize(5);
        // 페이지 핸들러를 만든다
        PageHandler ph = new PageHandler(totalCnt, sc);
        // 해당 계정으로 등록된 동행게시글 목록을 가져온다.
        List<AccompanyDto> accompanyDtoList = accompanyService.selectAllUserAccompany(userId, sc);

        model.addAttribute("totalCnt", totalCnt);
        model.addAttribute("ph", ph);
        model.addAttribute("accompanyDtoList", accompanyDtoList);

        return "user/accompanyList.subTiles";
    }

    // 내 1:1 문의 페이지로 이동
    @GetMapping("/mypage/inquiryList")
    public String inquiryList(HttpSession session, HttpServletRequest request, SearchCondition sc, Model model) {
        // 세션에 이메일이 없으면 로그인 페이지로 이동
        if(session.getAttribute("email") == null) {
            return "redirect:/login?toURL="+request.getRequestURL();
        }
        // 세션으로부터 userId를 얻는다
        Integer userId = (Integer)session.getAttribute("id");
        // 해당 계정으로 등록한 1:1문의 total글 수를 가져온다.
        int totalCnt = inquiryService.selectUserInquiryCnt(userId);
        // 한 번에 보여줄 게시글의 갯수를 5로 지정한다
        sc.setPageSize(5);
        // 페이지 핸들러를 만든다
        PageHandler ph = new PageHandler(totalCnt, sc);
        // 해당 계정으로 등록된 동행게시글 목록을 가져온다.
        List<InquiryDto> inquiryDtoList = inquiryService.selectAllUserInquiry(userId, sc);

        model.addAttribute("totalCnt", totalCnt);
        model.addAttribute("ph", ph);
        model.addAttribute("inquiryDtoList", inquiryDtoList);

        return "user/inquiryList.subTiles";
    }

    // 내 위시리스트 페이지로 이동
//    @GetMapping("/mypage/wishList")
//    public String wishList() {
//        return
//    }

}