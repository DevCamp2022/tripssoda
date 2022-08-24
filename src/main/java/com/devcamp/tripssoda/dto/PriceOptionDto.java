package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Map;

@Alias("PriceOptionDto")
public class PriceOptionDto {
    private String optionId;
    private String optionName;
    private String optionContent;
    private String optionPrice;

    public String getOptionId() {
        return optionId;
    }

    public void setOptionId(String optionId) {
        this.optionId = optionId;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }

    public String getOptionContent() {
        return optionContent;
    }

    public void setOptionContent(String optionContent) {
        this.optionContent = optionContent;
    }

    public String getOptionPrice() {
        return optionPrice;
    }

    public void setOptionPrice(String optionPrice) {
        this.optionPrice = optionPrice;
    }

    @Override
    public String toString() {
        return "PriceOptionDto{" +
                "optionId='" + optionId + '\'' +
                ", optionName='" + optionName + '\'' +
                ", optionContent='" + optionContent + '\'' +
                ", optionPrice='" + optionPrice + '\'' +
                '}';
    }
}
