package com.devcamp.tripssoda.mapper;

import com.devcamp.tripssoda.dto.TourInterestCodeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TourInterestCodeMapper {
    public int insertTourInterestCode(TourInterestCodeDto tourInterestCodeDto);

    public TourInterestCodeDto selectTourInterestCode(String tourIntrCode);

    public List<TourInterestCodeDto> selectAllTourInterestCode();

    public int updateTourInterestCode(TourInterestCodeDto tourInterestCodeDto);

    public int deleteTourInterestCode(String tourIntrCode);
}
