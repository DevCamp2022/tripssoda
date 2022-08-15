package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.PartnerDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PartnerMapper {
    public void insertPartner(PartnerDto dto);
}
