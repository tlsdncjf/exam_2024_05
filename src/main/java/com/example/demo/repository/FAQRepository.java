package com.example.demo.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FAQRepository {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public String findAnswerByQuestion(String question) {
        String sql = "SELECT answer FROM FAQ WHERE question = ?";
        return jdbcTemplate.queryForObject(sql, String.class, question);
    }
}
