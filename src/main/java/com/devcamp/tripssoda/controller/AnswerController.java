package com.devcamp.tripssoda.controller;

import com.devcamp.tripssoda.dto.AnswerDto;
import com.devcamp.tripssoda.dto.QuestionDto;
import com.devcamp.tripssoda.service.AnswerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class AnswerController {
    AnswerService service;

    //생성자 주입
    AnswerController(AnswerService service) {
        this.service = service;
    }

    @PatchMapping("/answers/{id}")
    public ResponseEntity<String> modify(@PathVariable Integer id, @RequestBody AnswerDto dto, HttpSession session) {
//        Integer userId = (Integer) session.getAttribute("userId");
        Integer userId = 43;
        System.out.println("userId = " + userId);
        dto.setUserId(userId);
        dto.setId(id);
        System.out.println("dto = " + dto);
        try {
            int rowCnt = service.modify(dto);
            if(rowCnt!=1)
                throw new Exception("Modify Failed");
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/answers")
    public ResponseEntity<String> write(@RequestBody AnswerDto dto, Integer questionId, HttpSession session) {
//        Integer userId = (Integer) session.getAttribute("userId");
        Integer userId = 43;
        dto.setUserId(userId);
        dto.setQuestionId(questionId);
        System.out.println("dto = " + dto);
        try {
            int rowCnt = service.write(dto);
            if(rowCnt!=1)
                throw new Exception("Write Failed");
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/answers/{id}")
    public ResponseEntity<String> remove(@PathVariable Integer id, Integer questionId, HttpSession session) {
//        Integer userId = (Integer) session.getAttribute("userId");
        Integer userId = 43;
        try {
            System.out.println("id = " + id);
            System.out.println("questionId = " + questionId);
            System.out.println("userId = " + userId);
            int rowCnt = service.remove(id, questionId, userId);
            if(rowCnt!=1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }


    @GetMapping("/answers")
    public ResponseEntity<List<AnswerDto>> list(Integer questionId) {
        List<AnswerDto> list = null;
        try {
            list = service.getList(questionId);
            return new ResponseEntity<List<AnswerDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<AnswerDto>>(HttpStatus.BAD_REQUEST);
        }
    }
}
