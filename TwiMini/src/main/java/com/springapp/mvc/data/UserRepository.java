package com.springapp.mvc.data;

import com.springapp.mvc.model.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
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

    public User fetchUser(String username) throws CannotGetJdbcConnectionException {
        return jdbcTemplate.queryForObject("select username, name, email from users where username=?",
                new Object[]{username}, new BeanPropertyRowMapper<>(User.class));
    }

    public List<User> findUsers() throws CannotGetJdbcConnectionException {
        return jdbcTemplate.query("select username,name,password,email from users",
                new Object[]{}, new BeanPropertyRowMapper<>(User.class));
    }

    public void addUser(String username, String password, String name, String email) throws CannotGetJdbcConnectionException {
        jdbcTemplate.execute("INSERT INTO users values ('" + username + "', '" + name + "', '" + email + "' , '" + password + "')");
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

    public static String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }
}

