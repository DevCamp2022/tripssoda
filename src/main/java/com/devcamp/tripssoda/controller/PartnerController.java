package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.service.PartnerService;
import com.devcamp.tripssoda.service.UserService;
import com.devcamp.tripssoda.util.annotations.SkipChecking;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/partner")
public class PartnerController {
    private final PartnerService partnerService;
    private final UserService userService;

    public PartnerController(PartnerService partnerService, UserService userService) {
        this.partnerService = partnerService;
        this.userService = userService;
    }

//    @SkipChecking
    @GetMapping("/register")
    public String regPartner(HttpSession session, RedirectAttributes rattr) {

        if(session.getAttribute("id")==null) {
            rattr.addFlashAttribute("msg", "Id is null");
            return "redirect:/register";
        }
        return "partner/reg_partner.mainTiles";
    }

    @GetMapping("/menu")
    public String side(HttpSession session, Model model) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        PartnerDto partnerDto = partnerService.getPartnerInformation(userId);
        model.addAttribute("PartnerDto",partnerDto);

        return "partner/partner_side";
    }

//    @SkipChecking
    @PostMapping("/register")
    public String regPartner(PartnerDto dto,
                             HttpServletRequest request,
                             HttpSession session,
                             @RequestParam MultipartFile uploadLogo,
                             @RequestParam MultipartFile uploadAttach) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        dto.setUserId(userId);
        System.out.println("dto = " + dto);
        System.out.println("uploadLogo = " + uploadLogo);
        System.out.println("uploadAttach = " + uploadAttach);
        partnerService.regPartner(dto, request, uploadLogo, uploadAttach);

        //성공화면 or 마이페이지 등록리스트 나중에 만들어서 리턴값 변경하기
        return "redirect:/partner/info";
    }


//    @SkipChecking //스킵 안돼요오......^^
    @GetMapping("/info")
    public String PartnerInfo(HttpSession session, Model model) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        PartnerDto partnerDto = partnerService.getPartnerInformation(userId);
        model.addAttribute("PartnerDto",partnerDto);
        return "partner/partner_info.partnerTiles";
    }

//    @SkipChecking
    @GetMapping("/info/update")
    public String modPartnerInfo(HttpSession session, Model model) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        PartnerDto partnerDto = partnerService.getPartnerInformation(userId);
        model.addAttribute("PartnerDto",partnerDto);
        return "partner/update_partner.partnerTiles";
    }

//    @SkipChecking
    @PostMapping("/info/update")
    public String modPartnerInfo(PartnerDto dto,
                                 HttpServletRequest request,
                                 @RequestParam MultipartFile uploadLogo,
                                 @RequestParam MultipartFile uploadAttach) {
        partnerService.modifyPartnerInformation(dto, request, uploadLogo, uploadAttach);
        return "redirect:/partner/info";
    }
}
