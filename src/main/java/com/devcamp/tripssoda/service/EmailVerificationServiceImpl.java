package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.EmailVerificationDto;
import com.devcamp.tripssoda.mapper.EmailVerificationMapper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Date;

@Service
public class EmailVerificationServiceImpl implements EmailVerificationService {

    private JavaMailSender mailSender;

    private EmailVerificationMapper emailVerificationMapper;

    public EmailVerificationServiceImpl(EmailVerificationMapper emailVerificationMapper, JavaMailSender mailSender) {
        this.mailSender = mailSender;
        this.emailVerificationMapper = emailVerificationMapper;
    }

    @Override
    public String sendEmail(String email){
        int ranNum = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
        // 보내는 계정이 될 메일주소
        String from = "tripssoda@soda.com";
        String to = email;
        String title = "tripssoda 이메일 인증번호 입니다.";
        String content = "[인증번호] "+ ranNum +" 입니다. <br/> 인증번호 입력란에 기입해주세요.";
        String num = "";
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(title);
            mailHelper.setText(content, true);

            mailSender.send(mail);
            num = Integer.toString(ranNum);
        } catch(Exception e) {
            num = "error";
        }
        return num;
    }

    @Override
    public EmailVerificationDto selectEmailVerification(String email) {
        return emailVerificationMapper.selectEmailVerification(email);
    }

    @Override
    public void insertEmailVerification(String email, String verfCode, Date validTime) throws Exception {
        EmailVerificationDto emailVerificationDto = new EmailVerificationDto();
        emailVerificationDto.setUserEmail(email);
        emailVerificationDto.setVerfCode(verfCode);
        // 현재 시간에서 5분을 더해서 유효시간을 설정
        Integer minutes = validTime.getMinutes();
        validTime.setMinutes(minutes + 5);
        emailVerificationDto.setValidTime(validTime);
        // 이메일, 인증코드, 유효시간이 담긴 Dto 객체를 insert
        int rowCnt = emailVerificationMapper.insertEmailVerification(emailVerificationDto);
        if(rowCnt != 1) {
            throw new Exception("이메일 인증정보 저장 실패");
        }
    }

    // 인증 상태를 업데이트하는 메서드
    @Override
    public void updateEmailVerificationStatus(EmailVerificationDto emailVerificationDto) throws Exception {
        int rowCnt = emailVerificationMapper.updateEmailVerificationStatus(emailVerificationDto);
        if(rowCnt != 1) {
            throw new Exception("이메일 인증상태 업데이트 실패");
        }
    }

    @Override
    public void updateEmailVerification(EmailVerificationDto emailVerificationDto, String verfCode) throws Exception {
        // 인증 정보를 가져와서 인증번호와 인증시간을 업데이트한다.
        emailVerificationDto.setVerfCode(verfCode);
        Date validTime = new Date();

        validTime.setMinutes(validTime.getMinutes() + 5);
        emailVerificationDto.setValidTime(validTime);

        int rowCnt = emailVerificationMapper.updateEmailVerification(emailVerificationDto);
        if(rowCnt != 1) {
            throw new Exception("이메일 인증코드 업데이트 실패");
        }
    }

    @Override
    public void deleteEmailVerification(String email) throws IllegalAccessException {
        int rowCnt = emailVerificationMapper.deleteEmailVerification(email);
        if(rowCnt != 1) {
            throw new IllegalAccessException("이메일 인증정보 삭제 실패");
        }
    }
}
