package com.springapp.mvc.controller;

import com.springapp.mvc.data.ImageRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HTTPErrorController {

    @RequestMapping(value="/errors/404.html")
    public String handle404() {
        System.out.println("We encountered a 404 error.");
        return "errorPageTemplate";
    }

    @RequestMapping(value="/errors/500.html")
    public String handle500(ModelMap model) {
        System.out.println("We encountered a 500 error.");
        model.addAttribute("heading", "My fault!");
        model.addAttribute("message", "My sincere apologize. Server fault - silly me!");
        model.addAttribute("errorCode", "500");
        return "errorPageTemplate";
    }
}
