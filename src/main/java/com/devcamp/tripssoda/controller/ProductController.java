package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.ProductDto;
import com.devcamp.tripssoda.dto.RegProductDto;
import com.devcamp.tripssoda.dto.RegProductListDto;
import com.devcamp.tripssoda.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
        session.setAttribute("partnerId", "1");
        return "product/reg_product.mainTiles";
    }

    @PostMapping("/register")
    public String registerProduct(
            RegProductDto dto,
            @ModelAttribute(value = "RegProductListDto") RegProductListDto regProductDtoList) {
        System.out.println("dto = " + dto);
        System.out.println("regProductDtoList = " + regProductDtoList);
        //productService.regProduct(dto);
        return "redirect:/product/register";
    }
}
