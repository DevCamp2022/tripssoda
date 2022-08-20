package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.mapper.PartnerMapper;
import com.devcamp.tripssoda.mapper.ProductMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductMapper productMapper;

    public ProductServiceImpl(ProductMapper productMapper){
        this.productMapper = productMapper;
    }

    @Override
    public void regProduct(RegProductDto dto, RegProductListDto regProductDtoList) {
        //product 등록
//        productMapper.insertProduct(dto);

        //product_option 등록
        List<RegProductDto> list = regProductDtoList.getRegProductDtoList();
        if(list.size()>0) {
            for (int i = 0; i < list.size(); i++) {
                dto.setType(list.get(i).getType());
                dto.setName(list.get(i).getName());
                dto.setContent(list.get(i).getContent());
                dto.setPrice(list.get(i).getPrice());
                dto.setOrderNo(list.get(i).getOrderNo());
                productMapper.insertProductOption(dto);
            }
        }

        //product_schedule 등록

    }

    @Override
    public void regProductTwo(ProductDto dto
                              , RegProductOptionListDto regProductDtoOptionList
                              , RegProductScheduleListDto regProductScheduleListDto
    ) {
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
        List<RegProductOptionDto> list = regProductDtoOptionList.getRegProductOptionListDto();
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
                productMapper.insertProductOptionList(PODto);
                System.out.println("PODto" + "[" + i + "]" + PODto);
            }
        }

        //product_schedule 등록
        List<RegProductScheduleDto> listSchedule = regProductScheduleListDto.getRegProductScheduleListDto();
        if(listSchedule == null)
            return;

        for (int i = 0; i < listSchedule.size(); i++) {
            if (listSchedule.get(i).getStartDate() == null) {
                continue;
            }
            PSDto.setStartDate(listSchedule.get(i).getStartDate());
            PSDto.setSchedulePrice(listSchedule.get(i).getSchedulePrice());
            PSDto.setScheduleMinMember(listSchedule.get(i).getScheduleMinMember());
            PSDto.setScheduleMaxMember(listSchedule.get(i).getScheduleMaxMember());
            System.out.println("PSDto" + "[" + i + "]" + PSDto);
        }
    }
}
