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

    @GetMapping("/list")
    public String getCategoryList(Model model) {
        productService.getMainList(model);
        return "product/list_product.mainTiles";
    }

    @GetMapping("/register")
    public String registerProduct(HttpSession session) {
        return "product/reg_product.partnerTiles";
    }


    @PostMapping("/register")
    public String registerProduct(
            ProductDto dto,
            HttpServletRequest request,
            @RequestParam MultipartFile uploadThumb,
            @ModelAttribute(value = "RegProductOptionListDto[]") RegProductOptionListDto regProductOptionListDto,
            @ModelAttribute(value = "RegProductScheduleListDto[]") RegProductScheduleListDto regProductScheduleListDto) {

        productService.regProduct(dto, regProductOptionListDto, regProductScheduleListDto, request, uploadThumb);
        return "redirect:/product/register"; //나중에 마이페이지 파트너 상품등록 확인뷰로 바꿀것
    }



    @GetMapping("/detail")
    public String getProductDetail(GetDetailProductDto dto, Model model) {
        GetDetailProductDto details = productService.getProductDetail(dto);
        List<ProductScheduleDto> list = productService.getProductScheduleList(dto);
        model.addAttribute("details", details);
        model.addAttribute("list", list);

        return "product/detail_product.mainTiles";
    }

    @GetMapping("/update")
    public String updateProduct(Integer productId, Model model) {
        UpdateProductDto dto = productService.getUpdateProduct(productId);
        List<UpdateProductDto> poList = productService.getUpdateProductOption(productId);
        List<UpdateProductDto> psList = productService.getUpdateProductSchedule(productId);

        model.addAttribute("dto", dto);
        model.addAttribute("poList", poList);
        model.addAttribute("psList", psList);

        return "product/update_product.partnerTiles";
    }

    @PostMapping("/update")
    public String updateProduct(UpdateProductDto dto,
                                @RequestParam MultipartFile uploadThumb,
                                HttpServletRequest request,
                                RegProductOptionListDto regProductOptionListDto,
                                RegProductScheduleListDto regProductScheduleListDto) {
        System.out.println("dto.getProductId() = "+dto.getProductId());
        productService.updateProduct(dto, uploadThumb, request, regProductOptionListDto, regProductScheduleListDto);
        return "redirect:/product/update?productId="+dto.getProductId();
    }
}
