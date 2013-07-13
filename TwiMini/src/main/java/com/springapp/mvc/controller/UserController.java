package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.Tweet;
import com.springapp.mvc.model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.data.UserRepository;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class UserController {

    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;
    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public UserController(UserRepository userRepository,TweetRepository tweetRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
    }

	@RequestMapping("showusers")
    @ResponseBody
    public List<User> printWelcome(ModelMap model) {
        return userRepository.findUsers();
	}

    @RequestMapping("MiniTwitter/users/{id}")
    @ResponseBody
    public HashMap fetchUser(@PathVariable("id") String userName) {
        HashMap userDetails = new HashMap();
        System.out.println("Fetching User Details for: " + userName);
        userDetails.put("tweets",tweetRepository.fetchTweets(userName));
        userDetails.put("info",userRepository.fetchUser(userName));
        return userDetails;
    }


    @RequestMapping(value = "MiniTwitter/friends/ids", method = RequestMethod.GET)
    @ResponseBody
    public List<User> fetchFollowing(@RequestParam("username") String userName) {
        log.info("Fetching User Details for: " + userName);
        return userRepository.fetchFollowing(userName);
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

    @RequestMapping(value = "MiniTwitter/users/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public void modify(@PathVariable("id") String userName, @RequestBody Map<String, String> values) {
        System.out.println("for user: " + userName + " Modifying name to: " + values.get("name"));
        userRepository.modifyUser(userName, values.get("name"), values.get("email"));
    }

    @RequestMapping(value = "MiniTwitter/users/{id}/timeline")
    @ResponseBody
    public List<Tweet> fetchTimeLine(@PathVariable("id") String userName) {
        return tweetRepository.fetchTimeline(userName);
    }

    public String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }


}