package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.Tweet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.AdviceMode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@Controller
@EnableCaching(mode = AdviceMode.ASPECTJ)
public class TweetController {

    private final TweetRepository tweetRepository;
    static Logger log = Logger.getLogger(TweetRepository.class);

    @Autowired
    public TweetController(TweetRepository repository) {
        this.tweetRepository = repository;
    }

    @RequestMapping(value = "MiniTwitter/API/statuses/show", method = RequestMethod.GET)
    @ResponseBody
    public Tweet fetchTweet(@RequestParam("id") Long id) {
        log.info("Fetching tweet with id" + id);
        return tweetRepository.fetchTweet(id);
    }

    @RequestMapping(value = "MiniTwitter/API/shuffle", method = RequestMethod.GET)
    @ResponseBody
    public List<Tweet> fetchRandomTweets() {
        log.info("Fetching random tweets");
        return tweetRepository.fetchRandomTweets();
    }

    @RequestMapping(value = "MiniTwitter/API/statuses/update", method = RequestMethod.POST)
    @ResponseBody
    public long addTweet(@ModelAttribute("status") String status,HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        return tweetRepository.addTweet(username,status);
    }

    @RequestMapping(value = "MiniTwitter/API/statuses/user_timeline", method = RequestMethod.GET)
    @ResponseBody
    @Cacheable("defaultCache")
    public List<Tweet> fetchUserTimeline(@RequestParam("username") String username,@RequestParam("offset") long offset) {
        log.info("Fetching timeline for user " + username);
        return tweetRepository.fetchUserTimeline(username, offset);
    }

    @RequestMapping(value = "MiniTwitter/API/statuses/home_timeline", method = RequestMethod.GET)
    @ResponseBody
    @Cacheable("defaultCache")
    public List<Tweet> fetchHomeTimeline(@RequestParam("offset") long offset, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        return tweetRepository.fetchHomeTimeline(username, offset);
    }

    @RequestMapping(value = "MiniTwitter/API/search/tweets", method = RequestMethod.GET)
    @ResponseBody
    public List<Tweet> searchTweets(@RequestParam("query") String searchQuery) throws UnsupportedEncodingException {
        searchQuery = URLDecoder.decode(searchQuery,"UTF-8");
        log.info("Search tweet for query string: " + searchQuery);
        return tweetRepository.searchTweets(searchQuery);
    }

    @RequestMapping(value = "MiniTwitter/API/statuses/retweet", method = RequestMethod.POST)
    @ResponseBody
    public void searchTweets(@RequestParam("id") long id,HttpServletRequest httpServletRequest) throws UnsupportedEncodingException {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        log.info("Retweet by username: " + username + " for tweet id" + id);
        tweetRepository.retweet(id,username);
    }

    @RequestMapping(value = "MiniTwitter/API/search/hashtags", method = RequestMethod.GET)
    @ResponseBody
    public List<Tweet> searchTweets(@RequestParam("query") String searchTag, @RequestParam("offset") long offset) throws UnsupportedEncodingException {
        searchTag = URLDecoder.decode(searchTag,"UTF-8");
        log.info("Search tweet for HashTag string: " + searchTag);
        return tweetRepository.searchHashTags(searchTag,offset);
    }

}
