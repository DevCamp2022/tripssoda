package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.AdminEmailReceiverInfoDto;
import com.devcamp.tripssoda.dto.EmailHistoryDto;
import com.devcamp.tripssoda.mapper.AdminEmailMapper;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminEmailServiceImpl implements AdminEmailService {

    private final JavaMailSender mailSender;

    private final AdminEmailMapper adminEmailMapper;

    public AdminEmailServiceImpl(JavaMailSender mailSender, AdminEmailMapper adminEmailMapper) {
        this.mailSender = mailSender;
        this.adminEmailMapper=adminEmailMapper;
    }


    @Override
    public Integer sendMultipleEmail(Integer userId, String receiver, String title, String content) throws Exception {
        Map<String,String> receiverType = new HashMap<>();
        receiverType.put("receiver", receiver);

        System.out.println("serviceimpl receiver = " + receiver);

        List<AdminEmailReceiverInfoDto> receivers = adminEmailMapper.selectReceiverByUserCode(receiverType);
        System.out.println("receivers = " + receivers);
        System.out.println("receivers.size() = " + receivers.size());
        if (receivers.size()!=0) {
            try {
                MimeMessage mail = mailSender.createMimeMessage();
                MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

                String from = "tripssoda@soda.com";
                int successCnt = 0;
                for (int i = 0; i < receivers.size(); i++) {
                    String receiverEmail = receivers.get(i).getEmail();
                    Integer receiverId = receivers.get(i).getUserId();

                    mailHelper.setFrom(from);
                    mailHelper.setTo(receiverEmail);
                    mailHelper.setSubject(title);
                    mailHelper.setText(content, true);

                    mailSender.send(mail);

                    int rowCnt = adminEmailMapper.insertEmailHistory(new EmailHistoryDto(userId, receiverId, receiverEmail, title, content));
                    if (rowCnt!= 1){
                        throw new Exception("Error occurred while inserting email history");
                    }
                    successCnt++;
                }
                return successCnt;
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("Error on multiple email");
            }
        }
        return 0;
    }
}
