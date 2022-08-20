package com.devcamp.tripssoda.dto;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Date;
import java.util.regex.Pattern;

public class UserValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz); // clazz가 UserDto 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserDto userDto = (UserDto)target;

        String email = userDto.getEmail();
        String pwd = userDto.getPwd();
        String name = userDto.getName();
        String tel = userDto.getTel();
        Character gender = userDto.getGender();
        Date birthday = userDto.getBirthday();

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",  "required.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required.pwd");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwdConfirm", "required.pwdConfirm");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel", "required.tel");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "required.gender");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthday", "required.birthday");


        // 이메일 양식 검증
        if(!Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", email)) {
            errors.rejectValue("email", "invalid.email");
        }
        // 비밀번호 양식 검증 (8~12자리 문자,숫자,특수문자 혼합)
        if(!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,12}$", pwd)) {
            errors.rejectValue("pwd", "invalid.pwd");
        }

        // 비밀번호와 비밀번호 확인값이 다른지 검증
        if(!userDto.getPwdConfirm().equals(userDto.getPwd())) {
            errors.rejectValue("pwdConfirm", "different.pwd");
        }

        // 이름 양식 검증 (2~6자리 한글)
        if(!Pattern.matches("^[가-힣]{2,6}$", name)) {
            errors.rejectValue("name", "invalid.name");
        }
        // 휴대폰 번호 검증(01xxxxxxxxx)
        if(!Pattern.matches("^01(?:0|1|[6-9])(?:\\d{3}|\\d{4})\\d{4}$", tel)) {
            errors.rejectValue("tel", "invalid.tel");
        }
        // 성별 검증
        if(!('M'==gender || 'F'==gender)) {
            errors.rejectValue("gender", "invalid.gender");
        }

        // 생일 검증
        if(!birthdayCheck(birthday)) {
            errors.rejectValue("birthday", "invalid.birthday");
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
