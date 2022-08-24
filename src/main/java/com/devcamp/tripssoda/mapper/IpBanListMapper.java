package com.devcamp.tripssoda.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IpBanListMapper {

    public List<String> findIpBanList();

    public Integer insertIpBan(Map<String,String> map);
}
