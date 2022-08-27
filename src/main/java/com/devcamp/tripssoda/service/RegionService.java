package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.RegionDto;

public interface RegionService {

    public int insertContinent(RegionDto regionDto) throws Exception;

    public int insertCountry(RegionDto regionDto) throws Exception;

    public int insertCity(RegionDto regionDto) throws Exception;

    public int updateCity(String cityCode1, String cityCode2) throws Exception;

}