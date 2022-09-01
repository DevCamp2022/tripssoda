package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.PartnerService;
import com.devcamp.tripssoda.service.ProductService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;
    private final PartnerService partnerService;

    public ProductController(ProductService productService, PartnerService partnerService) {
        this.productService = productService;
        this.partnerService = partnerService;
    }

    @GetMapping("/list")
    public String getCategoryList(Model model) {
        productService.getMainList(model);
        return "product/list_product.mainTiles";
    }

    @GetMapping("/register")
    public String registerProduct(HttpSession session) {
        return "product/reg_product.mainTiles";
    }


    @PostMapping("/register")
    public String registerProduct(
            ProductDto dto,
            HttpServletRequest request,
            HttpSession session,
            @RequestParam MultipartFile uploadThumb,
            @ModelAttribute(value = "RegProductOptionListDto[]") RegProductOptionListDto regProductOptionListDto,
            @ModelAttribute(value = "RegProductScheduleListDto[]") RegProductScheduleListDto regProductScheduleListDto) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        dto.setUserId(userId);
        PartnerDto partnerDto = partnerService.getPartnerInformation(userId);
        dto.setPartnerId(partnerDto.getId());

        productService.regProduct(dto, regProductOptionListDto, regProductScheduleListDto, request, uploadThumb);
        return "redirect:/product/partner/list";
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

        return "product/update_product.mainTiles";
    }

    @PostMapping("/update")
    public String updateProduct(UpdateProductDto dto,
                                @RequestParam MultipartFile uploadThumb,
                                HttpServletRequest request,
                                RegProductOptionListDto regProductOptionListDto,
                                RegProductScheduleListDto regProductScheduleListDto,
                                HttpSession session,
                                Model model) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        PartnerDto partnerDto = partnerService.getPartnerInformation(userId);
        model.addAttribute("PartnerDto",partnerDto);

        System.out.println("dto.getProductId() = "+dto.getProductId());
        productService.updateProduct(dto, uploadThumb, request, regProductOptionListDto, regProductScheduleListDto);
        return "redirect:/product/update?productId="+dto.getProductId();
    }

    @GetMapping("/partner/list")
    public String partnerProductList(HttpSession session, Model model) {
        Integer userId = Integer.parseInt(String.valueOf(session.getAttribute("id")));
        PartnerDto partnerDto = partnerService.getPartnerInformation(userId);
        model.addAttribute("PartnerDto",partnerDto);

        //product list 담기
        Integer partnerId = partnerDto.getId();
        System.out.println("partnerId = " + partnerId);
        List<ProductDto> pList = productService.getProductList(partnerId);
        model.addAttribute("pList", pList);
        model.addAttribute("pListSize", pList.size());

        //product schedule list 담기
        Map<ProductDto, Object> map = new LinkedHashMap<>();
        for(int i=0; i<pList.size(); i++) {
            Integer productId = pList.get(i).getProductId();
            System.out.println("productId = " + productId);

            List<ProductScheduleDto> psList = productService.selectProductScheduleListforDetail(productId);
            map.put(pList.get(i), psList);
        }
        model.addAttribute("map", map);
        System.out.println("map = " + map);
        return "product/product_info.partnerTiles";
    }
}
