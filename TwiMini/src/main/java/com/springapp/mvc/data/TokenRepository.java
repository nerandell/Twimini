package com.springapp.mvc.data;

import com.springapp.mvc.model.Tweet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springapp.mvc.model.User;
import org.apache.log4j.Logger;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public class TokenRepository{
    static Logger log = Logger.getLogger(TweetRepository.class);
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TokenRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void setToken(UUID token, String username) {
        jdbcTemplate.execute("insert into session_tokens(username,token) values (\'"+username+"\',\'"+token+"\')");
    }

    public int verifyToken(UUID token, String username) {
        log.debug("Verifying token");
        return jdbcTemplate.queryForObject("select count(*) from session_tokens where username=? and token=?",
                new Object[]{username,token}, new BeanPropertyRowMapper<>(int.class));
    }
}

