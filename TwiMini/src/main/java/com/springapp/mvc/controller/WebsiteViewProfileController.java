package com.springapp.mvc.controller;

import com.springapp.mvc.data.FriendRepository;
import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.data.UserRepository;
import com.springapp.mvc.model.Tweet;
import com.springapp.mvc.model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
public class WebsiteViewProfileController {

    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;
    private final FriendRepository friendRepository;

    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public WebsiteViewProfileController(UserRepository userRepository, TweetRepository tweetRepository, FriendRepository friendRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
        this.friendRepository = friendRepository;
    }

    @RequestMapping(value = "MiniTwitter/Website/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView printWelcome(@PathVariable("id") String userName,HttpServletRequest httpServletRequest) {
        ModelAndView modelAndView = new ModelAndView("user_profile");
        try {
            List<Tweet> tweets = tweetRepository.fetchTweets(userName);
            modelAndView.addObject("tweets", tweets);
            modelAndView.addObject("info",userRepository.fetchUser(userName));
            modelAndView.addObject("num_followers", friendRepository.fetchFollowers(userName).size());
            modelAndView.addObject("num_following", friendRepository.fetchFollowing(userName).size());
            modelAndView.addObject("num_of_tweets", tweets.size());
            return modelAndView;
        }
        catch (Exception e) {
            log.error(e.toString());
            return new ModelAndView("errorPageTemplate");
        }
    }

    @RequestMapping(value = "MiniTwitter/Website/{id}/following", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView fetchFollowing(@PathVariable("id") String userName,HttpServletRequest httpServletRequest) {
        ModelAndView modelAndView = new ModelAndView("following");
        Object user = httpServletRequest.getAttribute("currentLoggedUser");
        if(user==null) {
            log.info("User not verified");
            modelAndView.addObject("currentLoggedUser","-1");
        }
        else {
            log.info("User at present is : " + user);
            modelAndView.addObject("currentLoggedUser",user.toString());
        }
        List<Tweet> tweets = tweetRepository.fetchTweets(userName);
        List<User> following = friendRepository.fetchFollowing(userName);
        modelAndView.addObject("info",userRepository.fetchUser(userName));
        modelAndView.addObject("num_following", following.size());
        modelAndView.addObject("num_followers", friendRepository.fetchFollowers(userName).size());
        modelAndView.addObject("num_of_tweets", tweets.size());
        modelAndView.addObject("following",following);
        return modelAndView;
    }

    @RequestMapping(value = "MiniTwitter/Website/{id}/followers", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView fetchFollowers(@PathVariable("id") String userName) {
        ModelAndView modelAndView = new ModelAndView("followers");
        List<Tweet> tweets = tweetRepository.fetchTweets(userName);
        List<User> followers = friendRepository.fetchFollowers(userName);
        modelAndView.addObject("info",userRepository.fetchUser(userName));
        modelAndView.addObject("num_following", friendRepository.fetchFollowing(userName).size());
        modelAndView.addObject("num_followers", followers.size());
        modelAndView.addObject("num_of_tweets", tweets.size());
        modelAndView.addObject("followers", followers);
        return modelAndView;
    }

    @RequestMapping(value = "MiniTwitter/Website/home", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView fetchHomeTimeLine(HttpServletRequest httpServletRequest) {
        String userName = httpServletRequest.getAttribute("currentUser").toString();
        ModelAndView modelAndView = new ModelAndView("home");
        List<Tweet> timeline = tweetRepository.fetchHomeTimeline(userName,1);
        List<User> followers = friendRepository.fetchFollowers(userName);
        User currentUser = userRepository.fetchUser(userName);
        modelAndView.addObject("info",currentUser);
        modelAndView.addObject("num_following", friendRepository.fetchFollowing(userName).size());
        modelAndView.addObject("num_followers", followers.size());
        modelAndView.addObject("num_of_tweets", tweetRepository.fetchTweets(userName).size());
        modelAndView.addObject("followers", followers);
        modelAndView.addObject("timeline",timeline);
        modelAndView.addObject("currentUser",currentUser);
        return modelAndView;
    }

    @RequestMapping(value = "MiniTwitter/Website/logout", method = RequestMethod.GET)
    public String logoutCurrentUser(HttpServletResponse httpServletResponse) {
        log.info("Logging the user out");
        Cookie cookie = new Cookie("token",null);
        cookie.setMaxAge(0);
        cookie.setPath("/MiniTwitter");
        httpServletResponse.addCookie(cookie);
        String redirectUrl = "/MiniTwitter/Website";
        return "redirect:" + redirectUrl;
    }

    @RequestMapping(value = "MiniTwitter/Website/updateInfo", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateUser(@RequestParam("password") String password, @RequestParam("name") String name, @RequestParam("description") String description, HttpServletRequest httpServletRequest){
//    public boolean updateUser(@RequestParam Map<String, String> values, HttpServletRequest httpServletRequest){
        System.out.println("In updateUser function..");
        System.out.println("password: "+ password);
        System.out.println("description: "+ description);
        System.out.println("name: "+ name);
        String userName = httpServletRequest.getAttribute("currentUser").toString();
        System.out.println("Update settings request confirmation from user: "+userName);
        if (password.length()>7){
            userRepository.updatePasswordByUsername(userName, password);
        }
        if (name.length()>0){
            userRepository.updateNameByUsername(userName, name);
        }
        userRepository.updateDescriptionByUsername(userName, description);
        return true;
    }
}
