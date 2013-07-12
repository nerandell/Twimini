package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.Tweet;
import com.springapp.mvc.model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.data.UserRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class UserController {

    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;

    @Autowired
    public UserController(UserRepository userRepository,TweetRepository tweetRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
    }

	@RequestMapping("MiniTwitter/showusers")
    @ResponseBody
    public List<User> printWelcome(ModelMap model) {
        return userRepository.findUsers();
	}

    @RequestMapping("MiniTwitter/{id}")
    @ResponseBody
    public HashMap fetchUser(@PathVariable("id") String userName) {
        HashMap userDetails = new HashMap();
        System.out.println("Fetching User Details for: " + userName);
        userDetails.put("tweets",tweetRepository.fetchTweets(userName));
        userDetails.put("info",userRepository.fetchUser(userName));
        return userDetails;
    }


    @RequestMapping("MiniTwitter/{id}/following")
    @ResponseBody
    public List<User> fetchFollowing(@PathVariable("id") String userName) {
        System.out.println("Fetching User Details for: " + userName);
        return userRepository.fetchFollowing(userName);
    }

    @RequestMapping("MiniTwitter/{id}/followers")
    @ResponseBody
    public List<User> fetchFollowers(@PathVariable("id") String userName) {
        System.out.println("Fetching User Details for: " + userName);
        return userRepository.fetchFollowers(userName);
    }

    @RequestMapping(value = "MiniTwitter/users", method = RequestMethod.POST)
    @ResponseBody
    public void add(@RequestBody Map<String, String> user) {
        System.out.println("Creating new user: " + user.get("username") + " " + user.get("password"));
        if ( userRepository.isUserPresent(user.get("username")) ) {
            return;
        }
        userRepository.addUser(user.get("username"), encodePassword(user.get("password")), user.get("name"), user.get("email"));
    }

    public String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }

}