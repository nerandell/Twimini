package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.data.UserRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 22/7/13
 * Time: 3:00 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
@RequestMapping("MiniTwitter/Website")
public class WebsiteController {

    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;
    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public WebsiteController(UserRepository userRepository,TweetRepository tweetRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
    }

    @RequestMapping(method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView loginPage() {
        ModelAndView modelAndView = new ModelAndView("loginPage");
        return modelAndView;
    }

    @RequestMapping(method= RequestMethod.POST)
    public String verifyUser(@RequestParam("username") String username, @RequestParam("password") String password, ModelMap model) {
        System.out.println("Verifying user.");
        System.out.println(username);
        System.out.println(password);

        if (userRepository.isUserValid(username, password)){
            model.addAttribute("message","User Verified.");
            return "hello";
        }
        model.addAttribute("message", "User Not Verified.");
        return "hello";
    }

}
