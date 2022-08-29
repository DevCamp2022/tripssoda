package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.GetMainListProductDto;
import com.devcamp.tripssoda.dto.PartnerDto;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface PartnerService {
    public void regPartner(PartnerDto dto, HttpServletRequest request, MultipartFile uploadThumb, MultipartFile uploadAttach);
    public PartnerDto getPartnerInformation(Integer userId);
    public void modifyPartnerInformation(PartnerDto dto,
                                         HttpServletRequest request,
                                         @RequestParam MultipartFile uploadLogo,
                                         @RequestParam MultipartFile uploadAttach);
}