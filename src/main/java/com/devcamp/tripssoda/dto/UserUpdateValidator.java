package com.devcamp.tripssoda.dto;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Date;
import java.util.regex.Pattern;

public class UserUpdateValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz); // clazz가 UserDto 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserDto userDto = (UserDto)target;

        String pwd = userDto.getPwd();
        String tel = userDto.getTel();
        String nickname = userDto.getNickname();


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required.pwd");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwdConfirm", "required.pwdConfirm");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nickname", "required.nickname");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel", "required.tel");


        // 비밀번호 양식 검증 (8~12자리 문자,숫자,특수문자 혼합)
        if(!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,12}$", pwd)) {
            errors.rejectValue("pwd", "invalid.pwd");
        }

        // 비밀번호와 비밀번호 확인값이 다른지 검증
        if(!userDto.getPwdConfirm().equals(userDto.getPwd())) {
            errors.rejectValue("pwdConfirm", "different.pwd");
        }

        // 휴대폰 번호 검증(01xxxxxxxxx)
        if(!Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", tel)) {
            errors.rejectValue("tel", "invalid.tel");
        }

        // 닉네임 검증 (4~12자리 영대소문자와 숫자 조합)
        if(!Pattern.matches("^[a-zA-Z0-9]{4,12}$", nickname)) {
            errors.rejectValue("tel", "invalid.nickname");
        }
    }

    // 생일이 올바른 범위안의 날짜인지 체크하는 메서드
    private boolean birthdayCheck(Date birthday) {
        Date startDate = new Date(0, 0, 1);
        Date endDate = new Date();

        // 생일이 1900-01-01 보다 늦고, 오늘보다 이전인지 확인
        return birthday.after(startDate) && birthday.before(endDate);
    }
}
