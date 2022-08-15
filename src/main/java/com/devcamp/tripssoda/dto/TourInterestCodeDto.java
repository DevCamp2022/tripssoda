package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Objects;

@Alias("TourInterestCodeDto")
public class TourInterestCodeDto {
    private String tourIntrCode;
    private String tourIntrKeyword;
    private String tourIntrDescription;

    // 생성자
    public TourInterestCodeDto() {}

    public TourInterestCodeDto(String tourIntrCode, String tourIntrKeyword, String tourIntrDescription) {
        this.tourIntrCode = tourIntrCode;
        this.tourIntrKeyword = tourIntrKeyword;
        this.tourIntrDescription = tourIntrDescription;
    }

    // Getter & Setter
    public String getTourIntrCode() {
        return tourIntrCode;
    }

    public void setTourIntrCode(String tourIntrCode) {
        this.tourIntrCode = tourIntrCode;
    }

    public String getTourIntrKeyword() {
        return tourIntrKeyword;
    }

    public void setTourIntrKeyword(String tourIntrKeyword) {
        this.tourIntrKeyword = tourIntrKeyword;
    }

    public String getTourIntrDescription() {
        return tourIntrDescription;
    }

    public void setTourIntrDescription(String tourIntrDescription) {
        this.tourIntrDescription = tourIntrDescription;
    }

    // equals
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TourInterestCodeDto)) return false;
        TourInterestCodeDto that = (TourInterestCodeDto) o;
        return Objects.equals(getTourIntrCode(), that.getTourIntrCode()) && Objects.equals(getTourIntrKeyword(), that.getTourIntrKeyword()) && Objects.equals(getTourIntrDescription(), that.getTourIntrDescription());
    }

    // hashCode
    @Override
    public int hashCode() {
        return Objects.hash(getTourIntrCode(), getTourIntrKeyword(), getTourIntrDescription());
    }

    // toString
    @Override
    public String toString() {
        return "TourInterestCodeDto{" +
                "tourIntrCode='" + tourIntrCode + '\'' +
                ", tourIntrKeyword='" + tourIntrKeyword + '\'' +
                ", tourIntrDescription='" + tourIntrDescription + '\'' +
                '}';
    }
}
