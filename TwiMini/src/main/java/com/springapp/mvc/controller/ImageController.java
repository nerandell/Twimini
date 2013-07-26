package com.springapp.mvc.controller;

import com.springapp.mvc.data.FriendRepository;
import com.springapp.mvc.data.ImageRepository;
import com.springapp.mvc.data.TweetRepository;
import com.springapp.mvc.model.Tweet;
import com.springapp.mvc.model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.data.UserRepository;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ImageController{

    private final ImageRepository imageRepository;
    static Logger log = Logger.getLogger(ImageRepository.class);

    @Autowired
    public ImageController(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    @RequestMapping(value = "MiniTwitter/API/account/profile_image", method = RequestMethod.POST)
    @ResponseBody
    public void uploadImage(@RequestParam("path") String path, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        log.info("Uploading image for user "+username);
        imageRepository.setImage(username,path);
    }

    @RequestMapping(value = "MiniTwitter/API/account/profile_image", method = RequestMethod.PUT)
    @ResponseBody
    public void updateImage(@RequestParam("path") String path, HttpServletRequest httpServletRequest) {
        String username = httpServletRequest.getAttribute("currentUser").toString();
        log.info("Updating image for user "+username);
        imageRepository.updateImage(username,path);
    }

    @RequestMapping(value = "MiniTwitter/API/users/profile_image", method = RequestMethod.GET)
    @ResponseBody
    public byte[] getImage(@RequestParam("username") String username) {
        log.info("Getting image for user "+username);
        byte[] image = imageRepository.getImage(username);
        if(image!=null) return image;
        else {
            log.info("Image not found for user "+username);
            return imageRepository.getImage("dummy");
        }
    }
}