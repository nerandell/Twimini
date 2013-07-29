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

public class CheckIfLoggedInInterceptor implements HandlerInterceptor {
    private final TokenRepository tokenRepository;
    static Logger log = Logger.getLogger(CheckIfLoggedInInterceptor.class);


    @Autowired
    public CheckIfLoggedInInterceptor(TokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }

    boolean checkCredentials(String username,String token) throws UnsupportedEncodingException {
        log.info("Checking credentials");
        return tokenRepository.verifyToken(token, username);
    }

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse response, Object o) throws Exception {
        Cookie cookie = WebUtils.getCookie(httpServletRequest,"token");
        if(cookie==null) {
            log.info("No user logged in");
            httpServletRequest.setAttribute("currentLoggedUser",null);
            return true;
        }
        String username = cookie.getValue().split("\\|")[1];
        String token = cookie.getValue().split("\\|")[0];
        if(checkCredentials(username,token)) {
            log.info("Current user logged in :" + username);
            httpServletRequest.setAttribute("currentLoggedUser",username);
            return true;
        }
        else {
            httpServletRequest.setAttribute("currentLoggedUser",null);
            return true;
        }
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
