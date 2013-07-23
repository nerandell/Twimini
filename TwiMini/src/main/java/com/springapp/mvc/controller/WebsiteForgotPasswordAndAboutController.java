package com.springapp.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value="MiniTwitter/Website/forgot", method= RequestMethod.GET)
    @ResponseBody
    public ModelAndView forgotPassword(ModelMap m) {
        ModelAndView modelAndView = new ModelAndView("forgot");
        return modelAndView;
    }

    @RequestMapping(value="MiniTwitter/Website/about", method= RequestMethod.GET)
    public String aboutPage(ModelMap m) {
        m.addAttribute("message","about page..");
        return "hello";
    }

}
