package com.springapp.mvc.interceptors;


import com.springapp.mvc.data.TokenRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class CheckAuthorizedInterceptor implements HandlerInterceptor {
    private final TokenRepository tokenRepository;
    static Logger log = Logger.getLogger(CheckAuthorizedInterceptor.class);


    @Autowired
    public CheckAuthorizedInterceptor(TokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }

    boolean checkCredentials(String username,String token) throws UnsupportedEncodingException {
        log.info("Checking credentials");
        return tokenRepository.verifyToken(token, username);
    }

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o) throws Exception {
        System.out.println("Pre handling");
        Cookie cookie = WebUtils.getCookie(httpServletRequest,"token");
        String username = cookie.getValue().split("\\|")[1];
        log.info(username);
        String token = cookie.getValue().split("\\|")[0];
        log.info(token);
        log.info(username + " " + token);
        if(username==null || token==null) {
            System.out.println("Null value encountered");
            return false;
        }
        if(checkCredentials(username,token)) {
            System.out.println("Current user verified :" + username);
            httpServletRequest.setAttribute("currentUser",username);
            return true;
        }
        else return false;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
