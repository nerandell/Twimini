package com.springapp.mvc.model;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/10/13
 * Time: 8:58 PM
 * To change this template use File | Settings | File Templates.
 */

public class User {

    public String username;
    @JsonIgnore
    public String password;
    public String name;
    public String email;


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String userName) {
        this.username = userName;
    }

    //@JsonIgnore
    public String getPassword() {
        return password;
    }

    //@JsonIgnore
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName(){
        return name;
    }
    public void setName(String name){
        this.name = name;
    }
}
