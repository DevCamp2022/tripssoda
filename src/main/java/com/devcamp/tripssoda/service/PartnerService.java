package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PartnerDto;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;


public interface PartnerService {
    public void regPartner(PartnerDto dto, HttpServletRequest request, MultipartFile uploadThumb, MultipartFile uploadAttach);
}