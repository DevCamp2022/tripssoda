package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.service.ProductService;
import com.devcamp.tripssoda.util.ImageResize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Controller
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/register")
    public String registerProduct(HttpSession session) {
        session.setAttribute("userId", "1");
        session.setAttribute("partnerId", "1");
        return "product/reg_product.mainTiles";
    }


    @PostMapping("/register")
    public String registerProduct(
            ProductDto dto,
            HttpServletRequest request,
            @RequestParam MultipartFile uploadThumb,
            @ModelAttribute(value = "RegProductOptionListDto[]") RegProductOptionListDto regProductOptionListDto,
            @ModelAttribute(value = "RegProductScheduleListDto[]") RegProductScheduleListDto regProductScheduleListDto) {

        String realPath = request.getServletContext().getRealPath("/thumbnail");
        UUID uuid = UUID.randomUUID();
        String uploadName = uuid + uploadThumb.getOriginalFilename();

        File folder = new File(realPath);
        if(uploadThumb.isEmpty())
            dto.setThumbnail("Empty");
        else {
            dto.setThumbnail(uploadName);
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            //실제 업로드
            try {
                File file = new File(realPath + File.separator + uploadName);
                uploadThumb.transferTo(file);
                ImageResize.thumbnailResize(realPath, uploadName);

            } catch (IllegalStateException | IOException e) {
            }

        }

        productService.regProductTwo(dto, regProductOptionListDto, regProductScheduleListDto);
        return "redirect:/product/register";
    }


}
