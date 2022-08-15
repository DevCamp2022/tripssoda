package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.dto.SampleDto;
import com.devcamp.tripssoda.mapper.PartnerMapper;
import com.devcamp.tripssoda.mapper.SampleMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PartnerServiceImpl implements PartnerService {
    private final PartnerMapper partnerMapper;

    public PartnerServiceImpl(PartnerMapper partnerMapper){
        this.partnerMapper = partnerMapper;
    }

    @Override
    public void regPartner(PartnerDto dto) {
        partnerMapper.insertPartner(dto);
    }
}
