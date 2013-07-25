package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.data.UserRepository;
import com.springapp.mvc.mail.GoogleMail;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 23/7/13
 * Time: 3:43 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class WebsiteForgotPasswordAndAboutController {

    private GoogleMail mailer;
    private final UserRepository userRepository;
    static Logger log = Logger.getLogger(UserRepository.class);
    GenerateRandomString grs;

    @Autowired
    public WebsiteForgotPasswordAndAboutController (UserRepository userRepository) {
        this.userRepository = userRepository;
        mailer = new GoogleMail("noreply.TwiMini.1", "qwedsamayank");
        grs = new GenerateRandomString();
    }

    @RequestMapping(value="MiniTwitter/Website/forgot", method= RequestMethod.GET)
    public String forgotPassword(ModelMap m) {
        m.addAttribute("shouldIDisplayMessage",false);
        m.addAttribute("messageOnTop","Enter the id please.");
        return "forgot";
    }

    @RequestMapping(value="MiniTwitter/Website/forgot", method= RequestMethod.POST)
    public String forgotPasswordTakeEmail(@RequestParam("email") String email, ModelMap m) {
        System.out.println("Request Password change for email: "+email);
        if (userRepository.isEmailPresent(email)){
            String newPassword = randomPasswordGenerator();
            try{
                userRepository.updateUserByEmail(email, newPassword);
            }
            catch(Exception e){
                m.addAttribute("shouldIDisplayMessage",true);
                m.addAttribute("messageOnTop","Error in fetching database. Please try again.");
                return "forgot";
            }
            try{
                sendForgotPasswordMail(email, newPassword);
            }
            catch(MessagingException e1){
                System.out.println("Encountered error while sending forgot-password mail to: "+email);
                m.addAttribute("shouldIDisplayMessage",true);
                m.addAttribute("messageOnTop","Error in sending Email. Please try again.");
                return "forgot";
            }
            String redirectUrl = "/MiniTwitter/Website/password-reset-sent";
            return "redirect:" + redirectUrl;
        }
        m.addAttribute("shouldIDisplayMessage",true);
        m.addAttribute("messageOnTop","Invalid Email id provided. Enter a valid Email id.");
        return "forgot";
    }

    @RequestMapping(value="MiniTwitter/Website/password-reset-sent", method=RequestMethod.GET)
    public String forgotPasswordSuccess(ModelMap m){
        return "forgotSuccess";
    }

    @RequestMapping(value="MiniTwitter/Website/about", method= RequestMethod.GET)
    public String aboutPage(ModelMap m) {
        m.addAttribute("message","about page..");
        return "hello";
    }

    public String randomPasswordGenerator(){
        return grs.getAlphaNumeric(10);
    }

    void sendForgotPasswordMail(String email, String password) throws MessagingException {
        mailer.Send( email, "Reset password", "There was a password reset request from your email id. \n" +
                        "Your new password is: " + password);
    }

    public static class GenerateRandomString {
        private static final String ALPHA_NUM =
                "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        public String getAlphaNumeric(int len) {
            StringBuffer sb = new StringBuffer(len);
            for (int i=0;  i<len;  i++) {
                int ndx = (int)(Math.random()*ALPHA_NUM.length());
                sb.append(ALPHA_NUM.charAt(ndx));
            }
            return sb.toString();
        }
    }
}
