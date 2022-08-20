package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

@Alias("CategoryCodeDto")
public class CategoryCodeDto {
    private String C001; //에디터픽
    private String C002; //프라이빗투어
    private String C003; //소규모데이투어
    private String C004; //버스데이투어
    private String C005; //이색투어

    public String getC001() {
        return C001;
    }

    public void setC001(String c001) {
        C001 = c001;
    }

    public String getC002() {
        return C002;
    }

    public void setC002(String c002) {
        C002 = c002;
    }

    public String getC003() {
        return C003;
    }

    public void setC003(String c003) {
        C003 = c003;
    }

    public String getC004() {
        return C004;
    }

    public void setC004(String c004) {
        C004 = c004;
    }

    public String getC005() {
        return C005;
    }

    public void setC005(String c005) {
        C005 = c005;
    }

    @Override
    public String toString() {
        return "CategoryCodeDto{" +
                "C001='" + C001 + '\'' +
                ", C002='" + C002 + '\'' +
                ", C003='" + C003 + '\'' +
                ", C004='" + C004 + '\'' +
                ", C005='" + C005 + '\'' +
                '}';
    }
}
