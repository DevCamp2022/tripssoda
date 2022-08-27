package com.devcamp.tripssoda.dto;

public class RegionDto {
    private String continentCode;
    private String countryCode;
    private String cityCode;
    private String continentName;
    private String countryName;
    private String cityName;

    public RegionDto() {}
    public RegionDto(String continentCode, String continentName) {
        this.continentCode = continentCode;
        this.continentName = continentName;
    }

//    public RegionDto(String countryCode, String countryName, String continentCode) {
//        this.continentCode = continentCode;
//        this.countryCode = countryCode;
//        this.countryName = countryName;
//    }
    public RegionDto(String cityCode, String cityName, String countryCode) {
        this.cityCode = cityCode;
        this.cityName = cityName;
        this.countryCode = countryCode;
    }



    public String getContinentName() {
        return continentName;
    }

    public void setContinentName(String continentName) {
        this.continentName = continentName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getContinentCode() {
        return continentCode;
    }

    public void setContinentCode(String continentCode) {
        this.continentCode = continentCode;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    @Override
    public String toString() {
        return "RegionDto{" +
                "continentCode=" + continentCode +
                ", countryCode=" + countryCode +
                ", cityCode=" + cityCode +
                ", continentName='" + continentName + '\'' +
                ", countryName='" + countryName + '\'' +
                ", cityName='" + cityName + '\'' +
                '}';
    }
}
