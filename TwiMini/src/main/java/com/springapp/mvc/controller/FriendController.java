package com.springapp.mvc.controller;

import com.springapp.mvc.data.FriendRepository;
import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.Tweet;
import com.springapp.mvc.model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.data.UserRepository;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class FriendController {

    private final FriendRepository friendRepository;
    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;

    static Logger log = Logger.getLogger(FriendRepository.class);

    @Autowired
    public FriendController(FriendRepository friendRepository,TweetRepository tweetRepository, UserRepository userRepository) {
        this.friendRepository = friendRepository;
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
    }

    @RequestMapping(value = "MiniTwitter/API/friends/lists", method = RequestMethod.GET)
    @ResponseBody
    public List<User> fetchFollowingAPI(@RequestParam("username") String userName) {
        log.info("Fetching User Details for: " + userName);
        return friendRepository.fetchFollowing(userName);
    }

    @RequestMapping(value = "MiniTwitter/API/followers/lists", method = RequestMethod.GET)
    @ResponseBody
    public List<User> fetchFollowersAPI(@RequestParam("username") String userName) {
        log.info("Fetching User Details for: " + userName);
        return friendRepository.fetchFollowers(userName);
    }

    @RequestMapping(value = "MiniTwitter/API/friendships/create", method = RequestMethod.POST)
    @ResponseBody
    public void createFriendShip(@RequestParam("username") String toFollow, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        friendRepository.addFriend(username,toFollow);
        log.info("Add new follower: " + toFollow + " for user " + username);
    }

    @RequestMapping(value = "MiniTwitter/API/friendships/destroy", method = RequestMethod.POST)
    @ResponseBody
    public void destroyFriendShip(@RequestParam("username") String toUnfollow, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        friendRepository.deleteFollower(username,toUnfollow);
        log.info("Unfollow follower: " + toUnfollow + " for user " + username);
    }

}