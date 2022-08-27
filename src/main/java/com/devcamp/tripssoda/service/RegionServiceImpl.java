package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.RegionDto;
import com.devcamp.tripssoda.mapper.RegionMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class RegionServiceImpl implements RegionService{
    private RegionMapper regionMapper;

    public RegionServiceImpl(RegionMapper regionMapper) {
        this.regionMapper = regionMapper;
    }
    public int insertContinent(RegionDto regionDto) throws Exception {
        return regionMapper.insertContinent(regionDto);
    }
    public int insertCountry(RegionDto regionDto) throws Exception {
        return regionMapper.insertCountry(regionDto);
    }
    public int insertCity(RegionDto regionDto) throws Exception {
        return regionMapper.insertCity(regionDto);
    }
    public int updateCity(String cityCode1, String cityCode2) throws Exception {
        Map map = new HashMap();
        map.put("cityCode1", cityCode1);
        map.put("cityCode2", cityCode2);

        return regionMapper.updateCity(map);
    }
}
