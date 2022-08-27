package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.RegionDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface RegionMapper {
    public int insertContinent(RegionDto dto) throws Exception;
    public int insertCountry(RegionDto dto) throws Exception;
    public int insertCity(RegionDto dto) throws Exception;
    public int updateCity(Map map) throws Exception;
}

