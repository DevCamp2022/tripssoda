package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PartnerDto;
import com.devcamp.tripssoda.dto.SearchCondition;
import com.devcamp.tripssoda.dto.UserDto;

import java.util.List;

public interface AdminUserService {
    public int getAllUserCnt();

    public List<UserDto> searchSelectUser(SearchCondition sc);

    public List<PartnerDto> searchSelectPartner(SearchCondition sc);

    List<PartnerDto> selectOnPartner(SearchCondition sc);

    List<PartnerDto> selectOnApplicant(SearchCondition sc);

    Integer partnerApprove(Integer id);

    PartnerDto selectPartnerInfo(Integer id);
}
