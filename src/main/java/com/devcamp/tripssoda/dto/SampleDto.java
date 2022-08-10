package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("SampleDto")
public class SampleDto {
    public String id;
    public String sample;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSample() {
        return sample;
    }

    public void setSample(String sample) {
        this.sample = sample;
    }

    @Override
    public String toString() {
        return "SampleDto{" +
                "id='" + id + '\'' +
                ", sample='" + sample + '\'' +
                '}';
    }
}
