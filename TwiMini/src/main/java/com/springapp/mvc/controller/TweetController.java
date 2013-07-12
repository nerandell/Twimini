package com.springapp.mvc.controller;

import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.data.UserRepository;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/11/13
 * Time: 8:29 PM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class TweetController {
    private final TweetRepository repository;

    @Autowired
    public TweetController(TweetRepository repository) {
        this.repository = repository;
    }

}
