package com.springapp.mvc.controller;

import com.springapp.mvc.data.UserRepository;
import com.springapp.mvc.mail.GoogleMail;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * Created with IntelliJ IDEA.
 * User: mayday
 * Date: 23/7/13
 * Time: 3:43 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class WebsiteForgotPasswordAndAboutController {

    public static GoogleMail mailer;
    private final UserRepository userRepository;
    private static Logger log = Logger.getLogger(UserRepository.class);
    private GenerateRandomString grs;
    private int noOfThreads = 10;
    private ExecutorService exService;

    @Autowired
    public WebsiteForgotPasswordAndAboutController (UserRepository userRepository) {
        this.userRepository = userRepository;
        mailer = new GoogleMail("noreply.TwiMini.1", "qwedsamayank");
        grs = new GenerateRandomString();
        exService = Executors.newFixedThreadPool(noOfThreads);
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

            System.out.println("Email is present in the database.");
            String newPassword = randomPasswordGenerator();
            System.out.println("New random password:"+ newPassword);
            String oldEncryptedPassword = userRepository.getPasswordByEmail(email);
            System.out.println("Old encrypted password got.");

            try{
                userRepository.updateUserByEmail(email, newPassword);
            }
            catch(Exception e){
                m.addAttribute("shouldIDisplayMessage",true);
                m.addAttribute("messageOnTop","Error in fetching database. Please try again.");
                return "forgot";
            }

            // calling email in a separate thread
            System.out.println("Calling email in a separate thread.");
            exService.submit(new SendEmailRunnableThread(email, newPassword, oldEncryptedPassword, userRepository));

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
    public String aboutPage() {
        return "about";
    }

    public String randomPasswordGenerator(){
        return grs.getAlphaNumeric(10);
    }

    public static void sendForgotPasswordMail(String email, String password) throws MessagingException {
        mailer.Send( email, "Reset password", "There was a password reset request from your email id. \n" +
                "Your new password is: " + password);
    }

    public static class GenerateRandomString {
        private static final String ALPHA_NUM =
                "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_";
        public String getAlphaNumeric(int len) {
            StringBuffer sb = new StringBuffer(len);
            for (int i=0;  i<len;  i++) {
                int ndx = (int)(Math.random()*ALPHA_NUM.length());
                sb.append(ALPHA_NUM.charAt(ndx));
            }
            return sb.toString();
        }
    }

    // Callable thread
    public static class SendEmailRunnableThread implements Runnable{

        private String email;
        private String newPassword;
        private String oldEncryptedPassword;
        private UserRepository userRepository;

        public SendEmailRunnableThread(String email, String newPassword, String oldEncryptedPassword, UserRepository userRepository){
            this.email = email;
            this.newPassword = newPassword;
            this.oldEncryptedPassword = oldEncryptedPassword;
            this.userRepository = userRepository;
        }

        @Override
        public void run(){
            try{
                System.out.println("Starting to Send forgot-password mail to: "+email);
                WebsiteForgotPasswordAndAboutController.sendForgotPasswordMail(email, newPassword);
                System.out.println("Sent forgot-password mail to: "+email);
            }
            catch(MessagingException e1){
                System.out.println("Encountered error while sending forgot-password mail to: "+email);
                userRepository.updateEncryptedPasswordUserByEmail(email, oldEncryptedPassword);
                System.out.println("Password restored to original password.");
            }
        }
    }
}
