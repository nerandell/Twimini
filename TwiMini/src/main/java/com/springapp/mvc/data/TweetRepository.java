package com.springapp.mvc.data;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/11/13
 * Time: 8:22 PM
 * To change this template use File | Settings | File Templates.
 */

import com.springapp.mvc.model.Tweet;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Repository
public class TweetRepository {
    static Logger log = Logger.getLogger(TweetRepository.class);
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TweetRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Tweet> fetchTweets(String username){
        return jdbcTemplate.query("select * from tweets where username=? order by timestamp desc",
                new Object[]{username}, new BeanPropertyRowMapper<>(Tweet.class));

    }

    public Tweet fetchTweet(Long tweetId) {
        return jdbcTemplate.queryForObject("select * from tweets where id=?",
                new Object[]{tweetId}, new BeanPropertyRowMapper<>(Tweet.class));
    }

    public List<Tweet> fetchUserTimeline(String username, long offset) {
        return jdbcTemplate.query("select * from tweets where username=? ORDER by timestamp DESC LIMIT 10 OFFSET ?",
                new Object[]{username,offset*10}, new BeanPropertyRowMapper<>(Tweet.class));
    }

    public List<Tweet> fetchHomeTimeline(String username,long offset) {
        return jdbcTemplate.query("select DISTINCT username,tweet,id,tweet_timestamp as timestamp from " +
                "(select username,follower,tweet,id,tweets.timestamp as tweet_timestamp, following.timestamp as following_timestamp from " +
                "tweets inner join following on tweets.username = following.following) as mergedTable where " +
                "((mergedTable.following_timestamp is not NULL and mergedTable.tweet_timestamp<mergedTable.following_timestamp) or mergedTable.following_timestamp is NULL) and " +
                "(mergedTable.follower=? or mergedTable.username=?) ORDER by timestamp DESC LIMIT 10 OFFSET ?",
                new Object[]{username,username,offset*10}, new BeanPropertyRowMapper<>(Tweet.class));
    }

    public long addTweet(String username, String status) {
        Timestamp timestamp = new Timestamp(new Date().getTime());
        log.info("Inserting new tweet " + status + " by user " + username);
        long id = jdbcTemplate.queryForInt("INSERT into tweets (username, tweet, timestamp ) VALUES ('" + username + "','" + status + "','" + timestamp + "') RETURNING id");
        detectAndInsertHashTags(id, status);
        return id;
    }

    public List<Tweet> searchTweets(String searchQuery) {
        log.info("SELECT * from tweets where to_tsvector(\'english\',tweet) @@ to_tsquery(\'english\','\""+ searchQuery +"\"')");
        return jdbcTemplate.query("SELECT * from tweets where to_tsvector(\'english\',tweet) @@ plainto_tsquery(\'english\','\""+ searchQuery +"\"')",
                new Object[]{}, new BeanPropertyRowMapper<>(Tweet.class));
    }

    public List<Tweet> fetchRandomTweets() {
        return jdbcTemplate.query("SELECT * FROM tweets ORDER BY RANDOM() LIMIT 20",
                new Object[]{} , new BeanPropertyRowMapper<>(Tweet.class));
    }

    public void detectAndInsertHashTags(long id,String status) {
        log.info("In HashTag regex function for status : "+status);
        Pattern p = Pattern.compile("#\\w+");
        Matcher m = p.matcher(status);
        while(m.find()){
            String hashtag = m.group().substring(1);
            jdbcTemplate.update("insert into hashtags values(?,?)", new Object[]{id,hashtag});
        }
    }
}

