package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.Tweet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;


/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/11/13
 * Time: 8:29 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class TweetController {

    private final TweetRepository tweetRepository;
    static Logger log = Logger.getLogger(TweetRepository.class);

    @Autowired
    public TweetController(TweetRepository repository) {
        this.tweetRepository = repository;
    }

    @RequestMapping("MiniTwitter/tweets/{id}")
    @ResponseBody
    public Tweet fetchUser(@PathVariable("id") Long tweetId) {
        System.out.println("Fetching Tweet Details : " + tweetId);
        return tweetRepository.findTweet(tweetId);
    }

    @RequestMapping(value = "MiniTwitter/statuses/update", method = RequestMethod.POST)
    @ResponseBody
    public void addTweet(@RequestParam("status") String status,HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        tweetRepository.addTweet(username,status);
        log.info("Add tweet: " + status + " for user " + username);
    }

}
