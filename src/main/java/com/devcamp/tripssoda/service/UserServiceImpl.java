package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.TermsDto;
import com.devcamp.tripssoda.dto.UserDto;
import com.devcamp.tripssoda.dto.UserTermsDto;
import com.devcamp.tripssoda.dto.UserTourInterestDto;
import com.devcamp.tripssoda.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;
    private UserTourInterestMapper userTourInterestMapper;

    private UserTermsMapper userTermsMapper;

    private TermsMapper termsMapper;

    private WithdrawUserMapper withdrawUserMapper;

    @Autowired
    DataSource ds;

    public UserServiceImpl(WithdrawUserMapper withdrawUserMapper, TermsMapper termsMapper, UserMapper userMapper, UserTourInterestMapper userTourInterestMapper, UserTermsMapper userTermsMapper) {
        this.userMapper = userMapper;
        this.userTourInterestMapper = userTourInterestMapper;
        this.userTermsMapper = userTermsMapper;
        this.termsMapper = termsMapper;
        this.withdrawUserMapper = withdrawUserMapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean insertUser(UserDto userDto, String firstInterest, String secondInterest, String thirdInterest,
                              int firstTermStatus, int secondTermStatus, int thirdTermStatus) throws Exception {
        // 필수 약관 동의를 하지 않았으면 메서드 종료
        if(firstTermStatus != 1 && secondTermStatus != 1)
            throw new Exception();

        // 유저의 이메일로부터 default 닉네임을 만든다.
        String userEmail = userDto.getEmail();
        String nickName = userEmail.substring(0, userEmail.indexOf('@'));

        // 닉네임을 Dto에 새로 저장하여 insert 한다.
        userDto.setNickname(nickName);

        int rowCnt1 = userMapper.insertUser(userDto);
        if(rowCnt1 != 1) {
            throw new Exception("Insert user failed");
        }

        // 유저의 id(식별자)를 가져온다
        int userId = userDto.getId();
        
        // Map에 최초등록자, 최종수정자를 저장
        Map<String, Integer> createInfo = new HashMap<>();
        createInfo.put("createdBy", userId);
        createInfo.put("userId", userId);

        Map<String, Integer> updateInfo = new HashMap<>();
        updateInfo.put("updatedBy", userId);
        updateInfo.put("userId", userId);

        // user_id를 최초등록자, 최종수정자로 등록
        int rowCnt2 = userMapper.updateCreatedBy(createInfo);
        if(rowCnt2 != 1) {
            throw new Exception("Update CreatedBy failed");
        }
        int rowCnt3 = userMapper.updateUpdatedBy(updateInfo);
        if(rowCnt3 != 1) {
            throw new Exception("Update UpdatedBy failed");
        }

        // 약관 테이블에서 유저코드(U001)에 해당하는 약관들을 가져와서 id값을 얻는다
        List<TermsDto> termsDtoList = termsMapper.selectAllTermsByCode("U001");
        Integer firstTermsId = termsDtoList.get(0).getId();
        Integer secondTermsId = termsDtoList.get(1).getId();
        Integer thirdTermsId = termsDtoList.get(2).getId();

        // insert할 UserTermsDto 객체를 만든다.
        UserTermsDto firstUserTermsDto = new UserTermsDto(userId, firstTermsId, firstTermStatus, new Date());
        UserTermsDto secondUserTermsDto = new UserTermsDto(userId, secondTermsId, secondTermStatus, new Date());
        UserTermsDto thirdUserTermsDto = new UserTermsDto();

        // 선택 약관(3번째 약관)의 동의여부에 따라 agreementAt 값을 다르게 입력함
        if(thirdTermStatus != 1) {
            thirdUserTermsDto = new UserTermsDto(userId, thirdTermsId, thirdTermStatus, null);
        } else {
            thirdUserTermsDto = new UserTermsDto(userId, thirdTermsId, thirdTermStatus, new Date());
        }

        // UserTermsDto 객체들을 user_terms 테이블에 insert한다.
        int rowCnt4 = userTermsMapper.insertUserTerms(firstUserTermsDto);
        if(rowCnt4 != 1) {
            throw new Exception("Insert first UserTerms failed");
        }
        int rowCnt5 = userTermsMapper.insertUserTerms(secondUserTermsDto);
        if(rowCnt5 != 1) {
            throw new Exception("Insert first UserTerms failed");
        }
        int rowCnt6 = userTermsMapper.insertUserTerms(thirdUserTermsDto);
        if(rowCnt6 != 1) {
            throw new Exception("Insert first UserTerms failed");
        }

        // 유저의 여행관심사 Dto를 순위에 따라 생성하고 각각 insert해준다.
        UserTourInterestDto first = new UserTourInterestDto(userId, firstInterest, 1);
        UserTourInterestDto second = new UserTourInterestDto(userId, secondInterest, 2);
        UserTourInterestDto third = new UserTourInterestDto(userId, thirdInterest, 3);

        int rowCnt7 = userTourInterestMapper.insertUserTourInterest(first);
        if(rowCnt7 != 1) {
            throw new Exception("Insert first UserTourInterest failed");
        }
        int rowCnt8 = userTourInterestMapper.insertUserTourInterest(second);
        if(rowCnt8 != 1) {
            throw new Exception("Insert second UserTourInterest failed");
        }
        int rowCnt9 = userTourInterestMapper.insertUserTourInterest(third);
        if(rowCnt9 != 1) {
            throw new Exception("Insert second UserTourInterest failed");
        }

        return true;
    }

    @Override
    public UserDto selectUser(String email) {
        return userMapper.selectUser(email);
    }

    @Override
    public boolean updateUser(UserDto userDto, HttpSession session) throws Exception {
        // 관리자가 update를 한다면 권한 체크가 필요할 수도 있음

        // 1. 유저 정보를 업데이트 한다
        int rowCnt1 = userMapper.updateUser(userDto);
        if(rowCnt1 != 1) {
            throw new Exception("Update user_info failed");
        }

        // 2. 세션으로부터 정보 수정자의 id를 가져온다.
        int updateBy = (int)session.getAttribute("id");

        // 3. 수정자의 id와 수정할 User의 id을 map에 저장한다.
        Map updateInfo = new HashMap();
        updateInfo.put("updateBy", updateBy);
        updateInfo.put("userId", userDto.getId());

        // 4. 최종수정 정보를 업데이트한다.
        int rowCnt2 = userMapper.updateUpdatedBy(updateInfo);
        if(rowCnt2 != 1) {
            throw new Exception("Update system_info failed");
        }

        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteUser(String userEmail) throws Exception {
        // user_info 테이블에서 유저 정보를 삭제하기 전에,
        // 먼저 withdraw_user 테이블에 해당 유저 정보를 저장
        UserDto withdrawUser = userMapper.selectUser(userEmail);
        int rowCnt = withdrawUserMapper.insertWithdrawUser(withdrawUser);
        if(rowCnt != 1)
            throw new Exception("Insert withdrawUser failed");
        // user_info 테이블에서 유저 정보 삭제
        int rowCnt2 = userMapper.deleteUser(userEmail);
        if(rowCnt != 1)
            throw new Exception("Delete user failed");

        return true;
    }




    // transaction 테스트

//    @Override
//    public void txTest() throws Exception {
//        UserDto userDto = new UserDto("김윤기", "1234", "abcde8@abc.com", "aaaaaaaa", "01046664272", 'M', new Date(), "U001");
//
//        PlatformTransactionManager tm = new DataSourceTransactionManager(ds);
//        DefaultTransactionDefinition txd = new DefaultTransactionDefinition();
//        txd.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//        TransactionStatus status = tm.getTransaction(txd);
//
//
//        int a = 1;
//        try {
//            userMapper.insertUser(userDto);
//            if(a == 1)
//                throw new Exception();
//            System.out.println("before commit");
//
//            tm.commit(status);
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("before rollback");
//            tm.rollback(status);
//        } finally {
//
//        }
//
//    }

}
