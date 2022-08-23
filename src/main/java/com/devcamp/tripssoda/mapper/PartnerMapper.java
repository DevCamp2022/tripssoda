package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PartnerMapper {
    public void insertPartner(PartnerDto dto);

    public List<PartnerDto> searchSelectPartner(SearchCondition sc);

    List<PartnerDto> selectOnPartner(SearchCondition sc);

    List<PartnerDto> selectOnApplicant(SearchCondition sc);

    Integer updateToPartner(Integer id);

    PartnerDto selectPartnerInfo(Integer id);

    public int count();
}
