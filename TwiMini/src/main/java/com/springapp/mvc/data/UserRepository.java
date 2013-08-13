package com.springapp.mvc.data;

import com.springapp.mvc.model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepository {

    private final JdbcTemplate jdbcTemplate;
    private final RedisTemplate< String, Object > template;

    @Autowired
    public UserRepository(JdbcTemplate jdbcTemplate, RedisTemplate< String, Object > template) {
        this.template = template;
        this.jdbcTemplate = jdbcTemplate;
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public String getEmailFromName(String name) throws EmptyResultDataAccessException, CannotGetJdbcConnectionException  {
        System.out.println("starting getEmailByName.");
        String email;
        String query = "SELECT email from users where name="+name;
        if (template.opsForValue().get(query) == null){
            System.out.println("Cache is empty. Filling Cache.");
            email = jdbcTemplate.queryForObject("SELECT email from users where name=?", String.class, name);
            template.opsForValue().set(query, email);
            return email;
        }
        System.out.println("Replying from the cache..");
        return (String) template.opsForValue().get(query);
//        return jdbcTemplate.queryForObject("SELECT email from users where name=?", String.class, name);
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    public User fetchUser(String username) throws CannotGetJdbcConnectionException {
        return jdbcTemplate.queryForObject("select username, name, email,description from users where username=?",
                new Object[]{username}, new BeanPropertyRowMapper<>(User.class));
    }

    public List<User> findUsers() throws CannotGetJdbcConnectionException {
        return jdbcTemplate.query("select username,name,password,email from users",
                new Object[]{}, new BeanPropertyRowMapper<>(User.class));
    }

    public void addUser(String username, String password, String name, String email,String description) throws CannotGetJdbcConnectionException {
        jdbcTemplate.update("INSERT INTO users values (?,?,?,?)",new Object[]{username,name,email,encodePassword(password),description});
    }

    public void modifyUser(String userName, String name, String email, String password) throws CannotGetJdbcConnectionException {
        //To change body of created methods use File | Settings | File Templates.
        String encodedPassword = encodePassword(password);
        jdbcTemplate.update("UPDATE users set name=?,email=?,password=? where username=?", new Object[]{name,email,encodedPassword,userName});
    }

    public void updateUserByEmail(String email, String password) throws CannotGetJdbcConnectionException {
        String encodedPassword = encodePassword(password);
        jdbcTemplate.update("UPDATE users set password=? where email=?", new Object[]{encodedPassword,email});
    }

    public void updateEncryptedPasswordUserByEmail(String email, String password) throws CannotGetJdbcConnectionException {
        jdbcTemplate.update("UPDATE users set password=? where email=?", new Object[]{password,email});
    }

    public void deleteUser(String userName) throws CannotGetJdbcConnectionException {
        jdbcTemplate.update("DELETE from users where username=?", new Object[]{userName});
    }

    public List<User> searchForUsers(String query) throws CannotGetJdbcConnectionException {
        return jdbcTemplate.query("SELECT username from users where username LIKE '%"+query+"%'",
                new Object[]{}, new BeanPropertyRowMapper<>(User.class));
    }

    public boolean isUserValid(String userName, String password) throws CannotGetJdbcConnectionException {
        String encodedPassword = encodePassword(password);
        System.out.println("Checking if user is valid");
        String pass;
        try{
            pass= jdbcTemplate.queryForObject("select password from users where username=?",String.class, userName);
        }
        catch(EmptyResultDataAccessException e){
            System.out.println("--> Caught exception:" + e);
            return false;
        }
        System.out.println("Checked if user is valid");
        if(pass.equals(encodedPassword)){
            return true;
        }
        return false;
    }

    public String getPasswordByEmail(String email) throws EmptyResultDataAccessException, CannotGetJdbcConnectionException  {
        System.out.println("starting getpasswordByEmail.");
        return jdbcTemplate.queryForObject("SELECT password from users where email=?", String.class, email);
    }

    public boolean isUserPresent(String username) throws CannotGetJdbcConnectionException {
        try{
            List<User> userList = jdbcTemplate.query("select username, name from users where username=?",
                    new Object[]{username}, new BeanPropertyRowMapper<User>());
            if(userList.size() > 0){
                return true;
            }
            return false;
        }
        catch (Exception e){
            return true;
        }
    }

    public boolean isEmailPresent(String email) throws CannotGetJdbcConnectionException {
        try{
            List<User> userList = jdbcTemplate.query("select username, name from users where email=?",
                    new Object[]{email}, new BeanPropertyRowMapper<User>());
            if(userList.size() > 0){
                return true;
            }
            return false;
        }
        catch (Exception e){
            return true;
        }
    }

    public void updatePasswordByUsername(String username, String password) throws CannotGetJdbcConnectionException {
        String encodedPassword = encodePassword(password);
        jdbcTemplate.update("UPDATE users set password=? where username=?", new Object[]{encodedPassword,username});
    }

    public void updateNameByUsername(String username, String name) throws CannotGetJdbcConnectionException{
        jdbcTemplate.update("UPDATE users set name=? where username=?", new Object[]{name, username});
    }

    public void updateDescriptionByUsername(String username, String description) throws CannotGetJdbcConnectionException{
        jdbcTemplate.update("UPDATE users set description=? where username=?", new Object[]{description, username});
    }

    public static String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }
}

