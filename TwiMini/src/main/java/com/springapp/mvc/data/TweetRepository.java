package com.springapp.mvc.data;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/11/13
 * Time: 8:22 PM
 * To change this template use File | Settings | File Templates.
 */
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

@Repository
public class TweetRepository {
    static Logger log = Logger.getLogger(TweetRepository.class);
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TweetRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Tweet> fetchTweets(String username){
        return jdbcTemplate.query("select * from tweets where username=?",
                new Object[]{username}, new BeanPropertyRowMapper<>(Tweet.class));

    }

    public Tweet fetchTweet(Long tweetId) {
        return jdbcTemplate.queryForObject("select * from tweets where id=?",
                new Object[]{tweetId}, new BeanPropertyRowMapper<>(Tweet.class));
    }

    public List<Tweet> fetchTimeline(String username) {
        return jdbcTemplate.query("select * from tweets where username in (select following from following where follower = ?)",
                new Object[]{username}, new BeanPropertyRowMapper<>(Tweet.class));
    }

    public void addTweet(String username, String status) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        jdbcTemplate.execute("INSERT into tweets (username, tweet, timestamp ) VALUES ('" + username + "','" + status + "','" + timestamp + "')");
        log.info("Inserting new tweet " + status + " by user " + username);
    }
}

