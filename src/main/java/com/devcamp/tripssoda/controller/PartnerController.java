package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.service.PartnerService;
import com.devcamp.tripssoda.util.annotations.SkipChecking;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/partner")
public class PartnerController {
    private final PartnerService partnerService;

    public PartnerController(PartnerService partnerService) {
        this.partnerService = partnerService;
    }

    @SkipChecking
    @GetMapping("/register")
    public String regPartner() {
        return "partner/reg_partner.partnerTiles";
    }

    @SkipChecking
    @PostMapping("/register")
    public String regPartner(PartnerDto dto,
                             HttpServletRequest request,
                             @RequestParam MultipartFile uploadLogo,
                             @RequestParam MultipartFile uploadAttach) {
        System.out.println("dto = " + dto);
        System.out.println("uploadLogo = " + uploadLogo);
        System.out.println("uploadAttach = " + uploadAttach);
//        partnerService.regPartner(dto, request, uploadLogo, uploadAttach);

        //성공화면 or 마이페이지 등록리스트 나중에 만들어서 리턴값 변경하기
        return "redirect:/partner/register";
    }


//    @SkipChecking //스킵 안돼요오......^^
    @GetMapping("/mypage")
    public String PartnerMypage() {
        System.out.println("파트너마이페이지 접속중");
        return "partner/mypage.partnerTiles";
    }
}
