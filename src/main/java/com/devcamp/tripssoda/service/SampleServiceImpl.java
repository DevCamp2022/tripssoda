package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.mapper.SampleMapper;
import com.devcamp.tripssoda.dto.SampleDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SampleServiceImpl implements SampleService {
    private SampleMapper sampleMapper;

    public SampleServiceImpl(SampleMapper sampleMapper){
        this.sampleMapper = sampleMapper;
    }
    public List<SampleDto> selectAllSample(){
        return sampleMapper.selectAllSample();
    }
}
