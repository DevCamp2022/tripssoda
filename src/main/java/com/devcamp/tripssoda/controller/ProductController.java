package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/register")
    public String registerProduct(HttpSession session) {
        session.setAttribute("userId", "2");
        session.setAttribute("partnerId", "2");
        return "product/reg_product.mainTiles";
    }


    @PostMapping("/register")
    public String registerProduct(
            ProductDto dto,
            HttpServletRequest request,
            @RequestParam MultipartFile uploadThumb,
            @ModelAttribute(value = "RegProductOptionListDto[]") RegProductOptionListDto regProductOptionListDto,
            @ModelAttribute(value = "RegProductScheduleListDto[]") RegProductScheduleListDto regProductScheduleListDto) {

        System.out.println("[Controller]regProductScheduleListDto = " + regProductScheduleListDto);
        productService.regProduct(dto, regProductOptionListDto, regProductScheduleListDto, request, uploadThumb);
        return "redirect:/product/register"; //나중에 마이페이지 파트너 상품등록 확인뷰로 바꿀것
    }

    @GetMapping("/list")
    public String getCategoryList(Model model) {
        productService.getMainList(model);
        return "product/list_product.mainTiles";
    }

    @GetMapping("/detail")
    public String getProductDetail(GetDetailProductDto dto, Model model) {
        GetDetailProductDto details = productService.getProductDetail(dto);
        System.out.println("dto.getProductId() = " + dto.getProductId());
        System.out.println("dto.getScheduleId() = " + dto.getScheduleId());

        Integer productId = dto.getProductId();
        List<ProductScheduleDto> list = productService.getScheduleList(productId);
        model.addAttribute("details", details);
        model.addAttribute("list", list);

        System.out.println("details = " + details);
        return "product/detail_product.mainTiles";
    }
}
