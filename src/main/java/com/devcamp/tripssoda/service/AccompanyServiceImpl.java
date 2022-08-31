package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AccompanyDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.mapper.AccompanyMapper;
import com.devcamp.tripssoda.util.ImageResize;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class AccompanyServiceImpl implements AccompanyService {
    AccompanyMapper accompanyMapper;

    AccompanyServiceImpl(AccompanyMapper accompanyMapper) {
           this.accompanyMapper = accompanyMapper;
    }

    @Override
    public int selectUserAccompanyCnt(Integer userId) {
        return accompanyMapper.selectUserAccompanyCnt(userId);
    }

    @Override
    public List<AccompanyDto> selectAllUserAccompany(Integer userId, SearchCondition sc) {
        Map userIdAndSc = new HashMap();
        userIdAndSc.put("userId", userId);
        userIdAndSc.put("sc", sc);

        return accompanyMapper.selectAllUserAccompany(userIdAndSc);
    }

    @Override
    public int getCount() throws Exception {
        return accompanyMapper.count();
    }
    @Override
    public int write(AccompanyDto dto, HttpServletRequest request, MultipartFile uploadThumb) throws Exception {
        //thumbnail dto바인딩, 파일저장, 리사이징 처리
        String realPath = request.getServletContext().getRealPath("/resources/image/thumbnail");
        UUID uuid = UUID.randomUUID();
        String uploadName = uuid + uploadThumb.getOriginalFilename();

        File folder = new File(realPath);
        System.out.println("realPath = " + realPath);
        System.out.println("uploadThumb = " + uploadThumb);
        System.out.println("uploadName = " + uploadName);
        if(uploadThumb.isEmpty())
            //default이미지를 setter로 dto에 저장
            dto.setThumbnail("default.webp");
        else {
//            dto.setThumbnail(uploadName);
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
            //실제 업로드
            try {
                File file = new File(realPath + File.separator + uploadName);
                uploadThumb.transferTo(file);
                String fileName = ImageResize.thumbnailResize(realPath, uploadName);
                System.out.println("fileName = " + fileName);
                dto.setThumbnail(fileName);

            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
        }

        return accompanyMapper.insert(dto);
    }

    @Override
    public AccompanyDto read(Integer id) throws Exception {
        AccompanyDto dto = accompanyMapper.select(id);
        accompanyMapper.increaseViewCnt(id);
        return dto;
    }

    @Override
    public int modify(AccompanyDto dto) throws Exception {
        return accompanyMapper.update(dto);    
    }

    @Override
    public int modify(AccompanyDto dto, @RequestParam MultipartFile uploadThumb, HttpServletRequest request) throws Exception {
        String oldFileName = accompanyMapper.select(dto.getId()).getThumbnail();

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
        return accompanyMapper.update(dto);
    }

    @Override
    public int remove(Integer id, Integer userId) throws Exception {
        Map map = new HashMap();
        map.put("id", id);
        map.put("userId", userId);
        return accompanyMapper.delete(map);
    }

    @Override
    public List<AccompanyDto> getPage(Map map) throws Exception {
        return accompanyMapper.selectPage(map);
    }

    @Override
    public List<AccompanyDto> waitingGetPage(Map map) throws Exception {
        return accompanyMapper.waitingSelectPage(map);
    }

    @Override
    public int waitingGetCount() throws Exception {
        return accompanyMapper.waitingCount();
    }

    @Override
    public List<AccompanyDto> selectAccompanyForMain(Map map) {
        return accompanyMapper.selectAccompanyForMain(map);
    }

    @Override
    public int updateStatus(AccompanyDto accompanyDto) throws Exception {
        return accompanyMapper.updateStatus(accompanyDto);
    }

    @Override
    public int regionCount(String area3) throws Exception {
        return accompanyMapper.regionCount(area3);
    }

    @Override
    public List<AccompanyDto> regionSelectPage(Map map) throws Exception {
        return accompanyMapper.regionSelectPage(map);
    }

    @Override
    public int waitingRegionCount(String area3) throws Exception {
        return accompanyMapper.waitingRegionCount(area3);
    }

    @Override
    public List<AccompanyDto> waitingRegionSelectPage(Map map) throws Exception {
        return accompanyMapper.waitingRegionSelectPage(map);
    }
}
