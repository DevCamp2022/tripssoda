package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.GetMainListProductDto;
import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.mapper.PartnerMapper;
import com.devcamp.tripssoda.util.ImageResize;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class PartnerServiceImpl implements PartnerService {
    private final PartnerMapper partnerMapper;

    public PartnerServiceImpl(PartnerMapper partnerMapper){
        this.partnerMapper = partnerMapper;
    }

    @Override
    public void regPartner(PartnerDto dto
            , HttpServletRequest request
            , MultipartFile uploadLogo
            , MultipartFile uploadAttach) {
        //partnerLogo dto바인딩, 파일저장, 리사이징 처리
        String realPath = request.getServletContext().getRealPath("/resources/image/partnerLogo");
        UUID uuid = UUID.randomUUID();
        String uploadName = uuid + uploadLogo.getOriginalFilename();

        File folder = new File(realPath);
        if(uploadLogo.isEmpty())
            dto.setPartnerLogo("Empty");
        else {
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
                uploadLogo.transferTo(file);
                String fileName = ImageResize.logoResize(realPath, uploadName);
                dto.setPartnerLogo(fileName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }


        }

        //attachment저장
        String attchmentPath = request.getServletContext().getRealPath("/resources/partner/attachment");
        UUID uuid2 = UUID.randomUUID();
        String uploadAttachName = uuid + uploadAttach.getOriginalFilename();
        File folder2 = new File(attchmentPath);
        if(uploadAttach.isEmpty())
            dto.setIntroAttachment("Empty");
        else {
            if(!folder2.exists()){
                try{
                    folder2.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            //실제 업로드
            try {
                File file = new File(attchmentPath + File.separator + uploadAttachName);
                uploadAttach.transferTo(file);
                dto.setIntroAttachment(uploadAttachName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }


        }
        //partner 등록
        partnerMapper.insertPartner(dto);
    }

    public PartnerDto getPartnerInformation(Integer userId) {
        return partnerMapper.selectPartnerInformation(userId);
    }

    public void modifyPartnerInformation(PartnerDto dto,
                                         HttpServletRequest request,
                                         @RequestParam MultipartFile uploadLogo,
                                         @RequestParam MultipartFile uploadAttach) {

        String oldFileName = partnerMapper.selectPartnerInformation(dto.getUserId()).getPartnerLogo();

        //logo
        if(uploadLogo.isEmpty()) {
            dto.setPartnerLogo(oldFileName);
        } else {
            String realPath = request.getServletContext().getRealPath("/resources/image/partnerLogo");
            UUID uuid = UUID.randomUUID();
            String newFileName = uuid + uploadLogo.getOriginalFilename();
            dto.setPartnerLogo(newFileName);
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
                uploadLogo.transferTo(file);
                String fileName = ImageResize.logoResize(realPath, newFileName);
                dto.setPartnerLogo(fileName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        }

        //attachment
        String oldFileName2 = partnerMapper.selectPartnerInformation(dto.getUserId()).getIntroAttachment();

        if(uploadAttach.isEmpty()) {
            dto.setIntroAttachment(oldFileName2);
        } else {
            String realPath = request.getServletContext().getRealPath("/resources/partner/attachment");
            UUID uuid = UUID.randomUUID();
            String newFileName2 = uuid + uploadAttach.getOriginalFilename();
            dto.setIntroAttachment(newFileName2);
            File folder = new File(realPath);
            if(!folder.exists()){
                try{
                    folder.mkdirs();
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            try {
                File file = new File(realPath + File.separator + newFileName2);
                if(file.exists()) {
                    file.delete();
                }
                uploadAttach.transferTo(file);
                dto.setIntroAttachment(newFileName2);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        }

        System.out.println("PartnerDto dto = " + dto);
        partnerMapper.updatePartnerInformation(dto);
    }

}
