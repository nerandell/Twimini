package com.springapp.mvc.controller;

import com.springapp.mvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.springapp.mvc.data.UserRepository;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


@Controller
public class UserController {

    private final UserRepository repository;

    @Autowired
    public UserController(UserRepository repository) {
        this.repository = repository;
    }

	@RequestMapping("MiniTwitter/showusers")
    @ResponseBody
    public List<User> printWelcome(ModelMap model) {
        return repository.findUsers();
	}

    @RequestMapping("MiniTwitter/{id}")
    @ResponseBody
    public User fetchUser(@PathVariable("id") String userName) {
        System.out.println("Fetching User Details for: " + userName);
        return repository.fetchUser(userName);
    }

    @RequestMapping("MiniTwitter/{id}/following")
    @ResponseBody
    public List<User> fetchFollowing(@PathVariable("id") String userName) {
        System.out.println("Fetching User Details for: " + userName);
        return repository.fetchFollowing(userName);
    }

    @RequestMapping(value = "MiniTwitter/users", method = RequestMethod.POST)
    @ResponseBody
    public void add(@RequestBody Map<String, String> user) {
        System.out.println("Creating new user: " + user.get("username") + " " + user.get("password"));
        if ( repository.isUserPresent(user.get("username")) ) {
            return;
        }
        repository.addUser(user.get("username"), user.get("password"), user.get("name"));
    }

}