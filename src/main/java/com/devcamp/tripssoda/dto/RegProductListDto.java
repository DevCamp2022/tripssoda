package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.List;

@Alias("RegProductListDto")
public class RegProductListDto implements Serializable {
    private List<RegProductDto> regProductDtoList;

    public RegProductListDto() {
    }

    public RegProductListDto(List<RegProductDto> regProductDtoList) {
        this.regProductDtoList = regProductDtoList;
    }

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
