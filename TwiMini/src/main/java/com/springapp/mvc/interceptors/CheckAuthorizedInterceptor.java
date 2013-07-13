package com.springapp.mvc.interceptors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import java.io.UnsupportedEncodingException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.springapp.mvc.AppConfig;
import com.springapp.mvc.data.UserRepository;
import com.springapp.mvc.model.User;

public class CheckAuthorizedInterceptor implements HandlerInterceptor {
    private final UserRepository repository;

    @Autowired
    public CheckAuthorizedInterceptor(UserRepository repository) {
        this.repository = repository;
    }

    boolean checkCredentials(String authorizationStr, HttpServletRequest request) throws UnsupportedEncodingException {

        byte[] authBytes = DatatypeConverter.parseBase64Binary(authorizationStr);
        String decodedCredentials = new String(authBytes, "UTF-8");

        String splittedCredentials[] = decodedCredentials.split(":");
        if(splittedCredentials.length  != 2){
            return false;
        }
        String username = splittedCredentials[0];
        String password = splittedCredentials[1];

        System.out.println("Username: " + username + ", Password: " + password);

        if(repository.isUserValid(username, password) ){
            request.setAttribute("currentUser", username);
            return true;
        }
        return false;
    }

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o) throws Exception {
        System.out.println("Pre-handling");

        String authorizationStr = httpServletRequest.getHeader("Authorization");

        if(authorizationStr==null ||  !authorizationStr.startsWith("Basic")){
            System.out.println("Null or not starts with basic");
            return false;
        }
        if( checkCredentials(authorizationStr.substring(6), httpServletRequest) ) {
            return true;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o, Exception e) throws Exception {
    }
}
