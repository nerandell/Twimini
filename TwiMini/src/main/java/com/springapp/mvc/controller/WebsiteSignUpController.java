package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.data.UserRepository;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 22/7/13
 * Time: 3:00 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class WebsiteSignUpController {

    private final UserRepository userRepository;
    private final TweetRepository tweetRepository;
    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public WebsiteSignUpController(UserRepository userRepository,TweetRepository tweetRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
    }

    @RequestMapping(value="MiniTwitter/Website/signUp", method= RequestMethod.POST)
    public String getUserInfoByWebsite(@RequestParam("username") String username, @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("password") String password, ModelMap model) {
        System.out.println("This is where I wanna be. Yo!");
        System.out.println(username);
        System.out.println(name);
        System.out.println(email);
        System.out.println(password);

        if ( userRepository.isUserPresent(username) ) {
            model.addAttribute("message","User already present");
            return "hello";
        }
        userRepository.addUser(username, encodePassword(password), name, email);
        model.addAttribute("message", "Created new user");
        return "hello";
    }

    public String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }

}
