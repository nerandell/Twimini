package com.springapp.mvc.controller;

import com.google.gson.Gson;
import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.data.UserRepository;
import com.springapp.mvc.model.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 22/7/13
 * Time: 3:01 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class TestController {

    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;
    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public TestController(UserRepository userRepository,TweetRepository tweetRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
    }

    @RequestMapping("MiniTwitter/API/showusers")
    @ResponseBody
    public List<User> printWelcome(ModelMap model) {
        return userRepository.findUsers();
    }

    @RequestMapping("MiniTwitter/Website/test")
    @ResponseBody
    public ModelAndView printWelcome() {
        ModelAndView modelAndView = new ModelAndView("user_info");
        List<User> users = userRepository.findUsers();
        String gSON = new Gson().toJson(getUserNames(users));
        modelAndView.addObject("users",gSON);
        return modelAndView;
    }

    public static List<String> getUserNames(List<User> users) {
        List<String> userNames = new ArrayList<String>();
        for ( User user : users) userNames.add(user.getName());
        return userNames;
    }

}
