package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.SampleDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SampleMapper {

    public List<SampleDto> selectAllSample();
}
