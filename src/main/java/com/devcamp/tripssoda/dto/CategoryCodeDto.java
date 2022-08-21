package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("CategoryCodeDto")
public class CategoryCodeDto {
//    private String C001; //에디터픽
//    private String C002; //프라이빗투어
//    private String C003; //소규모데이투어
//    private String C004; //버스데이투어
//    private String C005; //이색투어

    private String categoryCode;
    private String name;

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryCodeDto{" +
                "categoryCode='" + categoryCode + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
