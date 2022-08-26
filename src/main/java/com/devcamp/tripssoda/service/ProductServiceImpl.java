package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.*;
import com.devcamp.tripssoda.mapper.CategoryCodeMapper;
import com.devcamp.tripssoda.mapper.ProductMapper;
import com.devcamp.tripssoda.util.ImageResize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
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

        if(list != null) {
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
    public List<ProductScheduleDto> selectScheduleList(Integer productId) {
        return productMapper.selectScheduleList(productId);
    }

    @Override
    public List<ProductScheduleDto> getProductScheduleList(GetDetailProductDto dto) {
        return productMapper.selectProductScheduleList(dto);
    }

    public List<ProductOptionDto> selectOptionList(Integer productId){
        return productMapper.selectOptionList(productId);
    }


    @Override
    public GetDetailProductDto getProductDetailById(Integer productId) {
        GetDetailProductDto data = productMapper.selectProductDetailById(productId);
        String categoryCode = data.getCategory();
        data.setCategory(categoryCodeMapper.selectCategoryName(categoryCode));
        return data;
    }

    public List<ProductOptionDto> getOptionList(Integer productId){
        return productMapper.selectOptionList(productId);
    }

    @Transactional(rollbackFor = Exception.class)
    public int updateProductApproval(ApprovalDto productApprovalDto) throws Exception {
        int rowCnt = productMapper.updateProductApproval(productApprovalDto);
        try {
            if (rowCnt != 1) {
                throw new Exception();
            }
            if (productApprovalDto.getApproval().equals(0)) {
                System.out.println("productApprovalDto.getApproval() = " + productApprovalDto.getApproval());

                rowCnt = productMapper.insertProductApprovalHistory(productApprovalDto);
                if (rowCnt != 1) {
                    throw new Exception();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        }
        return rowCnt;
    }

    @Override
    public List<ProductScheduleDto> getScheduleList(Integer productId) {
        return null;
    }

    @Override
    public UpdateProductDto getUpdateProduct(Integer productId) {
        return productMapper.selectProductUpdate(productId);
    }

    @Override
    public List<UpdateProductDto> getUpdateProductOption(Integer productId) {
        return productMapper.selectProductOptionUpdate(productId);
    }

    @Override
    public List<UpdateProductDto> getUpdateProductSchedule(Integer productId) {
        return productMapper.selectProductScheduleUpdate(productId);
    }

    @Override
    public void updateProduct(UpdateProductDto dto,
                              @RequestParam MultipartFile uploadThumb,
                              HttpServletRequest request,
                              RegProductOptionListDto regProductOptionListDto,
                              RegProductScheduleListDto regProductScheduleListDto) {
        String oldFileName = productMapper.selectProductUpdate(dto.getProductId()).getThumbnail();

        if(uploadThumb.isEmpty()) {
            dto.setThumbnail(oldFileName);
        } else {
            String realPath = request.getServletContext().getRealPath("/resources/image/thumbnail");
            UUID uuid = UUID.randomUUID();
            String newFileName = uuid + uploadThumb.getOriginalFilename();
            dto.setThumbnail(newFileName);
            File folder = new File(realPath);
            if(!folder.exists()){
                try{
                    folder.mkdirs();
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            try {
                File file = new File(realPath + File.separator + newFileName);
                if(file.exists()) {
                    file.delete();
                }
                uploadThumb.transferTo(file);
                String fileName = ImageResize.thumbnailResize(realPath, newFileName);
                dto.setThumbnail(fileName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        }
        productMapper.updateProduct(dto);

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

        //product_option
        List<RegProductOptionDto> list = regProductOptionListDto.getRegProductOptionListDto();
        System.out.println("list = " + list);
        if(list != null) {
            for (int i = 0; i < list.size(); i++) {
                PODto.setProductOptionId(list.get(i).getProductOptionId());

                if(list.get(i).getType() == null) {
                    productMapper.deleteProductOption(PODto.getProductOptionId());
                    continue;
                }

                PODto.setType(list.get(i).getType());
                PODto.setName(list.get(i).getName());
                PODto.setContent(list.get(i).getContent());
                PODto.setPrice(list.get(i).getPrice());
                PODto.setOrderNo(list.get(i).getOrderNo());
                int result = productMapper.updateProductOption(PODto);
                System.out.println("PODto["+i+"] = " + PODto);
                System.out.println("result from option = " + result);
            }
        }

        //product_schedule
        List<RegProductScheduleDto> listSchedule = regProductScheduleListDto.getRegProductScheduleListDto();
        System.out.println("listSchedule = " + listSchedule);
        if(listSchedule == null) {
            return;
        }
        for (int i = 0; i < listSchedule.size(); i++) {
            PSDto.setProductScheduleId(listSchedule.get(i).getProductScheduleId());

            if(listSchedule.get(i).getScheduleStartDate() == null) {
                System.out.println("스케쥴실행중"+i);
                productMapper.deleteProductSchedule(PSDto.getProductScheduleId());
                continue;
            }

            PSDto.setScheduleStartDate(listSchedule.get(i).getScheduleStartDate());
            PSDto.setSchedulePrice(listSchedule.get(i).getSchedulePrice());
            PSDto.setScheduleMinMember(listSchedule.get(i).getScheduleMinMember());
            PSDto.setScheduleMaxMember(listSchedule.get(i).getScheduleMaxMember());
            int result = productMapper.updateProductSchedule(PSDto);
            System.out.println("PSDto["+i+"] = " + PSDto);
            System.out.println("result from schedule = " + result);
        }
    }
}
