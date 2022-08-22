package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.mapper.CategoryCodeMapper;
import com.devcamp.tripssoda.mapper.ProductMapper;
import com.devcamp.tripssoda.util.ImageResize;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductMapper productMapper;
    private final CategoryCodeMapper categoryCodeMapper;

    public ProductServiceImpl(ProductMapper productMapper, CategoryCodeMapper categoryCodeMapper) {
        this.productMapper = productMapper;
        this.categoryCodeMapper = categoryCodeMapper;
    }

    @Override
    public void regProduct(ProductDto dto
            , RegProductOptionListDto regProductOptionListDto
            , RegProductScheduleListDto regProductScheduleListDto
            , HttpServletRequest request
            , MultipartFile uploadThumb) {

        //thumbnail dto바인딩, 파일저장, 리사이징 처리
        String realPath = request.getServletContext().getRealPath("/resources/image/thumbnail");
        UUID uuid = UUID.randomUUID();
        String uploadName = uuid + uploadThumb.getOriginalFilename();

        File folder = new File(realPath);
        if(uploadThumb.isEmpty())
            dto.setThumbnail("Empty");
        else {
//            dto.setThumbnail(uploadName);
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
                String fileName = ImageResize.thumbnailResize(realPath, uploadName);
                dto.setThumbnail(fileName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }


        }

        //product 등록
        productMapper.insertProduct(dto);
        System.out.println("dto = " + dto);

        //product insert 후 반환된 productId 바인딩
        Integer pId = dto.getProductId();
        RegProductOptionDto PODto = new RegProductOptionDto();
        RegProductScheduleDto PSDto = new RegProductScheduleDto();
        PODto.setProductId(pId);
        PSDto.setProductId(pId);

        //userId를 옵션과 스케쥴에 각각 바인딩
        Integer pUserId = dto.getUserId();
        PODto.setUserId(pUserId);
        PSDto.setUserId(pUserId);

        //product_option 등록
        List<RegProductOptionDto> list = regProductOptionListDto.getRegProductOptionListDto();
        if(list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                if(list.get(i).getType()==null){
                    continue;
                }
                PODto.setType(list.get(i).getType());
                PODto.setName(list.get(i).getName());
                PODto.setContent(list.get(i).getContent());
                PODto.setPrice(list.get(i).getPrice());
                PODto.setOrderNo(list.get(i).getOrderNo());
                productMapper.insertProductOption(PODto);
                System.out.println("PODto" + "[" + i + "]" + PODto);
            }
        }

        //product_schedule 등록
        List<RegProductScheduleDto> listSchedule = regProductScheduleListDto.getRegProductScheduleListDto();
        if(listSchedule == null){
            return;
        }

        for (int i = 0; i < listSchedule.size(); i++) {
            if (listSchedule.get(i).getScheduleStartDate() == null) {
                continue;
            }
            PSDto.setScheduleStartDate(listSchedule.get(i).getScheduleStartDate());
            PSDto.setSchedulePrice(listSchedule.get(i).getSchedulePrice());
            PSDto.setScheduleMinMember(listSchedule.get(i).getScheduleMinMember());
            PSDto.setScheduleMaxMember(listSchedule.get(i).getScheduleMaxMember());
            productMapper.insertProductSchedule(PSDto);
            System.out.println("PSDto" + "[" + i + "]" + PSDto);
        }
    }

    @Override
    public void getMainList(Model model) {
        List<String> ccdList = categoryCodeMapper.selectAllCategoryCode();
        //반복문으로 코드를 리스트에 넣어주고, model에 담기
        for(int i=0; i<ccdList.size(); i++) {
            List<GetMainListProductDto> list = productMapper.selectMainList(ccdList.get(i));
            if(list.size()==0){continue;}
            model.addAttribute("list"+i, list);
            System.out.println("list" + i + " = " + list);
        }

    }

    @Override
    public GetDetailProductDto getProductDetail(GetDetailProductDto dto) {
        GetDetailProductDto data = productMapper.selectProductDetail(dto);
        String categoryCode = data.getCategory();
        data.setCategory(categoryCodeMapper.selectCategoryName(categoryCode));
        return data;
    }

    @Override
    public List<ProductScheduleDto> getScheduleList(Integer productId) {
        return productMapper.selectScheduleList(productId);
    }
}
