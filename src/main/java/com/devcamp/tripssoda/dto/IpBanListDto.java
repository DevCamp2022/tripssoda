package com.devcamp.tripssoda.dto;

import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("IpBanListDto")
public class IpBanListDto {

    private String ip;
    private Date bandate;

    public IpBanListDto() {
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getBandate() {
        return bandate;
    }

    public void setBandate(Date bandate) {
        this.bandate = bandate;
    }

    @Override
    public String toString() {
        return "IpBanList{" +
                "ip='" + ip + '\'' +
                ", bandate=" + bandate +
                '}';
    }
}
