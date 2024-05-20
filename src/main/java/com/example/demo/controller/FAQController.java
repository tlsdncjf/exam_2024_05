package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.FAQService;

@RestController
public class FAQController {

    @Autowired
    private FAQService faqService;

    @GetMapping("/usr/common/head")
    public String getAnswer(@RequestParam String question) {
        // 주어진 질문에 대한 답변을 데이터베이스에서 가져옵니다.
        String answer = faqService.getAnswerByQuestion(question);
        
        // 가져온 답변을 클라이언트에 반환합니다.
        return answer;
    }
}
