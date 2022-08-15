package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.List;

@Alias("RegProductListDto")
public class RegProductListDto {
    private List<RegProductDto> regProductDtoList;

    public List<RegProductDto> getRegProductDtoList() {
        return regProductDtoList;
    }

    public void setRegProductDtoList(List<RegProductDto> regProductDtoList) {
        this.regProductDtoList = regProductDtoList;
    }

    @Override
    public String toString() {
        return "RegProductListDto{" +
                "regProductDtoList=" + regProductDtoList +
                '}';
    }
}
