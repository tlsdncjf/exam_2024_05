package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FAQRepository;

@Service
public class FAQService {
    
    @Autowired
    private FAQRepository faqRepository;

    public String getAnswerByQuestion(String question) {
        // 주어진 질문에 대한 답변을 데이터베이스에서 가져옵니다.
        String answer = faqRepository.findAnswerByQuestion(question);
        
        return answer != null ? answer : "해당 질문에 대한 답변이 없습니다.";
    }
}
