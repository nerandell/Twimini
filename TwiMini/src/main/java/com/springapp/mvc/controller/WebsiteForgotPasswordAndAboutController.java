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
 * Date: 23/7/13
 * Time: 3:43 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class WebsiteForgotPasswordAndAboutController {

    private final UserRepository userRepository;
    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public WebsiteForgotPasswordAndAboutController (UserRepository userRepository,TweetRepository tweetRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping(value="MiniTwitter/Website/forgot", method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView forgotPassword(ModelMap m) {
        ModelAndView modelAndView = new ModelAndView("forgot");
        return modelAndView;
    }

    @RequestMapping(value="MiniTwitter/Website/forgot", method= RequestMethod.POST)
    public String forgotPasswordTakeEmail(@RequestParam("email") String email, ModelMap m) {
        System.out.println("Request Password change for email: "+email);
        if (userRepository.isEmailPresent(email)){
            m.addAttribute("messageOnTop","Ho gaya..");
            return "forgotSuccess";
        }
        m.addAttribute("messageOnTop","Invalid Email id provided. Enter a valid Email id.");
        return "forgot";
    }

    @RequestMapping(value="MiniTwitter/Website/about", method= RequestMethod.GET)
    public String aboutPage(ModelMap m) {
        m.addAttribute("message","about page..");
        return "hello";
    }

}
