package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.TourInterestCodeDto;
import com.devcamp.tripssoda.mapper.TourInterestCodeMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TourInterestCodeServiceImpl implements TourInterestCodeService {

    private TourInterestCodeMapper tourInterestCodeMapper;

    public TourInterestCodeServiceImpl(TourInterestCodeMapper tourInterestCodeMapper){
        this.tourInterestCodeMapper = tourInterestCodeMapper;
    }

    @Override
    public int insertTourInterestCode(TourInterestCodeDto tourInterestCodeDto) {
        return tourInterestCodeMapper.insertTourInterestCode(tourInterestCodeDto);
    }

    @Override
    public TourInterestCodeDto selectTourInterestCode(String tourIntrCode) {
        return tourInterestCodeMapper.selectTourInterestCode(tourIntrCode);
    }

    @Override
    public List<TourInterestCodeDto> selectAllTourInterestCode() {
        return tourInterestCodeMapper.selectAllTourInterestCode();
    }

    @Override
    public int updateTourInterestCode(TourInterestCodeDto tourInterestCodeDto) {
        return tourInterestCodeMapper.updateTourInterestCode(tourInterestCodeDto);
    }

    @Override
    public int deleteTourInterestCode(String tourIntrCode) {
        return tourInterestCodeMapper.deleteTourInterestCode(tourIntrCode);
    }

}
