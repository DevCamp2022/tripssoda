package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.List;

@Alias("RegProductOptionListDto")
public class RegProductOptionListDto implements Serializable {
    private List<RegProductOptionDto> regProductOptionListDto;

    public List<RegProductOptionDto> getRegProductOptionListDto() {
        return regProductOptionListDto;
    }

    public void setRegProductOptionListDto(List<RegProductOptionDto> regProductOptionListDto) {
        this.regProductOptionListDto = regProductOptionListDto;
    }
}
