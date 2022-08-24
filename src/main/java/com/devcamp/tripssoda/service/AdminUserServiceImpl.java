package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.mapper.PartnerMapper;
import com.devcamp.tripssoda.mapper.ProductMapper;
import com.devcamp.tripssoda.mapper.UserMapper;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService{
    private final UserMapper userMapper;
    private final ProductMapper productMapper;
    private final PartnerMapper partnerMapper;

    public AdminUserServiceImpl(UserMapper userMapper, ProductMapper productMapper, PartnerMapper partnerMapper){
        this.userMapper = userMapper;
        this.productMapper = productMapper;
        this.partnerMapper = partnerMapper;
    }

    @Override
    public int getAllUserCnt() {
        return userMapper.count();
    }

    @Override
    public List<UserDto> searchSelectUser(SearchCondition sc) {
        return userMapper.searchSelectUser(sc);
    }

    @Override
    public List<PartnerDto> searchSelectPartner(SearchCondition sc) {
        return partnerMapper.searchSelectPartner(sc);
    }

    @Override
    public List<PartnerDto> selectOnPartner(SearchCondition sc) {
        return  partnerMapper.selectOnPartner(sc);
    }

    @Override
    public List<PartnerDto> selectOnApplicant(SearchCondition sc) {
        return  partnerMapper.selectOnApplicant(sc);
    }

    @Override
    public Integer partnerApprove(Integer id) {
        return partnerMapper.updateToPartner(id);
    }

    @Override
    public PartnerDto selectPartnerInfo(Integer id) {
        return partnerMapper.selectPartnerInfo(id);
    }

    @Override
    public int getAllPartnerCnt() {
        return partnerMapper.count();
    }

    @Override
    public int getInquiryCnt() {
        return 0;
    }

    @Override
    public List<UserDto> selectInquiryList(SearchCondition sc) {
        return null;
    }


}
