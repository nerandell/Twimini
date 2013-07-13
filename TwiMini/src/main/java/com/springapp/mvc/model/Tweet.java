package com.springapp.mvc.model;

import org.codehaus.jackson.annotate.JsonIgnore;

import java.sql.Timestamp;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/11/13
 * Time: 8:09 PM
 * To change this template use File | Settings | File Templates.
 */

public class Tweet {

    public String id;
    public String username;
    public String tweet;
    public Timestamp timestamp;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTweet() {
        return tweet;
    }

    public void setTweet(String tweet) {
        this.tweet = tweet;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}
