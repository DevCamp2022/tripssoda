package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.List;

@Alias("RegProductScheduleListDto")
public class RegProductScheduleListDto implements Serializable {
    private List<RegProductScheduleDto> regProductScheduleListDto;

    public List<RegProductScheduleDto> getRegProductScheduleListDto() {
        return regProductScheduleListDto;
    }

    public void setRegProductScheduleListDto(List<RegProductScheduleDto> regProductScheduleListDto) {
        this.regProductScheduleListDto = regProductScheduleListDto;
    }
}
