package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.TourInterestCodeDto;

import java.util.List;

public interface TourInterestCodeService {
    int insertTourInterestCode(TourInterestCodeDto tourInterestCodeDto);

    TourInterestCodeDto selectTourInterestCode(String tourIntrCode);

    List<TourInterestCodeDto> selectAllTourInterestCode();

    int updateTourInterestCode(TourInterestCodeDto tourInterestCodeDto);

    int deleteTourInterestCode(String tourIntrCode);
}
