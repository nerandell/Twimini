package com.springapp.mvc.controller;

import com.springapp.mvc.data.FriendRepository;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class FriendController {

    private final FriendRepository friendRepository;
    static Logger log = Logger.getLogger(FriendRepository.class);

    @Autowired
    public FriendController(FriendRepository friendRepository) {
        this.friendRepository = friendRepository;
    }

    @RequestMapping(value = "MiniTwitter/friends/lists", method = RequestMethod.GET)
    @ResponseBody
    public List<User> fetchFollowing(@RequestParam("username") String userName) {
        log.info("Fetching User Details for: " + userName);
        return friendRepository.fetchFollowing(userName);
    }

    @RequestMapping(value = "MiniTwitter/followers/lists", method = RequestMethod.GET)
    @ResponseBody
    public List<User> fetchFollowers(@RequestParam("username") String userName) {
        log.info("Fetching User Details for: " + userName);
        return friendRepository.fetchFollowers(userName);
    }

    @RequestMapping(value = "MiniTwitter/friendships/create", method = RequestMethod.POST)
    @ResponseBody
    public void createFriendShip(@RequestParam("username") String toFollow, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        friendRepository.addFriend(username,toFollow);
        log.info("Add new follower: " + toFollow + " for user " + username);
    }

    @RequestMapping(value = "MiniTwitter/friendships/destroy", method = RequestMethod.POST)
    @ResponseBody
    public void destroyFriendShip(@RequestParam("username") String toUnfollow, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        friendRepository.deleteFollower(username,toUnfollow);
        log.info("Unfollow follower: " + toUnfollow + " for user " + username);
    }

}