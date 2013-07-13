package com.springapp.mvc.data;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/10/13
 * Time: 8:56 PM
 * To change this template use File | Settings | File Templates.
 */


import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springapp.mvc.model.User;

import java.util.List;

@Repository
public class UserRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public UserRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public User fetchUser(String username){
        return jdbcTemplate.queryForObject("select username, name, email from users where username=?",
                new Object[]{username}, new BeanPropertyRowMapper<>(User.class));
    }
    public List<User> findUsers() {
        return jdbcTemplate.query("select username,name,password,email from users",
                new Object[]{}, new BeanPropertyRowMapper<>(User.class));
    }

    public void addUser(String username, String password, String name, String email) {
        jdbcTemplate.execute("INSERT INTO users values ('" + username + "', '" + name + "', '" + email + "' , '" + password + "')");
    }

    public void modifyUser(String userName, String name, String email) {
        //To change body of created methods use File | Settings | File Templates.
        jdbcTemplate.update("UPDATE users set name=?,email=? where username=?", new Object[]{name, email, userName});
    }

    public void deleteUser(String userName) {
        //To change body of created methods use File | Settings | File Templates.
        jdbcTemplate.update("DELETE from users where username=?", new Object[]{userName});
    }

    public boolean isUserValid(String userName, String password) {
        String encodedPassword = encodePassword(password);
        System.out.println("encode password = "+encodedPassword);
        User user= jdbcTemplate.queryForObject("select password from users where username=?",
                new Object[]{userName}, new BeanPropertyRowMapper<>(User.class));
        if(user.getPassword().equals(encodedPassword)){
            return true;
        }
        return false;
    }

    public boolean isUserPresent(String username) {
        try{
            List<User> userList = jdbcTemplate.query("select username, name from users where username=?",
                    new Object[]{username}, new BeanPropertyRowMapper<User>());
            if(userList.size() > 0){
                return true;
            }
        }
        catch (Exception e){
            return true;
        }
        return false;  //To change body of created methods use File | Settings | File Templates.
    }

    public static String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }

}

