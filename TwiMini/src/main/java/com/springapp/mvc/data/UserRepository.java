package com.springapp.mvc.data;

import com.springapp.mvc.model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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

    public void modifyUser(String userName, String name, String email, String password) {
        String encodedPassword = encodePassword(password);
        jdbcTemplate.update("UPDATE users set name=?,email=?,password=? where username=?", new Object[]{name,email,encodedPassword,userName});
    }

    public void updateUserByEmail(String email, String password){
        String encodedPassword = encodePassword(password);
        jdbcTemplate.update("UPDATE users set password=? where email=?", new Object[]{encodedPassword,email});
    }

    public void deleteUser(String userName) {
        jdbcTemplate.update("DELETE from users where username=?", new Object[]{userName});
    }

    public List<User> searchForUsers(String query) {
        return jdbcTemplate.query("SELECT username from users where username LIKE '%"+query+"%'",
                new Object[]{}, new BeanPropertyRowMapper<>(User.class));
    }

    public boolean isUserValid(String userName, String password) {
        String encodedPassword = encodePassword(password);
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
        return false;
    }

    public boolean isEmailPresent(String email) {
        try{
            List<User> userList = jdbcTemplate.query("select username, name from users where email=?",
                    new Object[]{email}, new BeanPropertyRowMapper<User>());
            if(userList.size() > 0){
                return true;
            }
        }
        catch (Exception e){
            return true;
        }
        return false;
    }

    public static String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }

}

