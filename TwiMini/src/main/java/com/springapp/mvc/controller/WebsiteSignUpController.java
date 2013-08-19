package com.springapp.mvc.controller;

import com.springapp.mvc.data.TokenRepository;
import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.data.UserRepository;
import com.springapp.mvc.data.ValidationChecks;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@Controller
public class WebsiteSignUpController {

    private final UserRepository userRepository;
    private final TokenRepository tokenRepository;
    private final TweetRepository tweetRepository;
    private final ValidationChecks validationChecks;
    static Logger log = Logger.getLogger(UserRepository.class);

    @Autowired
    public WebsiteSignUpController(UserRepository userRepository,TweetRepository tweetRepository, ValidationChecks validationChecks, TokenRepository tokenRepository) {
        this.userRepository = userRepository;
        this.tweetRepository = tweetRepository;
        this.validationChecks = validationChecks;
        this.tokenRepository = tokenRepository;
    }

    @RequestMapping(value="MiniTwitter/Website/signUp", method= RequestMethod.POST)
    public String getUserInfoByWebsite(@RequestParam("username") String username, @RequestParam("name") String name, @RequestParam("email") String email,
                                       @RequestParam("password") String password, ModelMap model, HttpServletResponse httpServletResponse) throws IOException {
        if ((!validationChecks.isUsernameValid(username))||(!validationChecks.isPasswordValid(password))||(!validationChecks.isEmailValid(email))||(!validationChecks.isNameValid(name))){
            model.addAttribute("heading", "Play fair, mate.");
            model.addAttribute("message", "If you gotta play the game, you must obey the rules!");
            model.addAttribute("errorCode", "400");
            return "errorPageTemplate";
        }
        if ( userRepository.isUserPresent(username) ) {
            model.addAttribute("message","User already present");
            return "errorPageTemplate";
        }
        userRepository.addUser(username, encodePassword(password), name, email, "");
        String token = UUID.randomUUID().toString();
        Cookie cookie = new Cookie("token",token+"|"+username);
        cookie.setMaxAge(3600);
        cookie.setPath("/MiniTwitter");
        tokenRepository.setToken(token,username);
        httpServletResponse.addCookie(cookie);
        String redirectUrl = "/MiniTwitter/Website";
        return "redirect:" + redirectUrl;
    }



    public String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }

}
