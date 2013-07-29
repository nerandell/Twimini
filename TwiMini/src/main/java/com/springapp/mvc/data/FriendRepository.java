package com.springapp.mvc.data;

/**
 * Created with IntelliJ IDEA.
 * User: root
 * Date: 7/10/13
 * Time: 8:56 PM
 * To change this template use File | Settings | File Templates.
 */


import com.springapp.mvc.model.Friend;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.springapp.mvc.model.User;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Repository
public class FriendRepository {

    static Logger log = Logger.getLogger(TweetRepository.class);
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public FriendRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<User> fetchFollowing(String userName) {
        return jdbcTemplate.query("select username,name,email from users where username in (select following from following where follower=?)",
                new Object[]{userName}, new BeanPropertyRowMapper<>(User.class));
    }

    public List<User> fetchFollowers(String userName) {
        return jdbcTemplate.query("select username,name,email from users where username in (select follower from following where following=?)",
                new Object[]{userName}, new BeanPropertyRowMapper<>(User.class));
    }


    public static String encodePassword(String password) {
        return DigestUtils.sha256Hex(password);
    }

    public void addFriend(String username, String toFollow) {
        if(!username.equals(toFollow)) {
            List<Friend> list = jdbcTemplate.query("select * from following where follower=? AND following=?",
                    new Object[]{username, toFollow}, new BeanPropertyRowMapper<>(Friend.class));
            if(list.size()>0) {
                Friend friend = list.get(0);
                System.out.println(friend.getTimestamp());
                if(friend.timestamp==null) log.info("Relationship already exists");
                else {
                    jdbcTemplate.execute("update following set timestamp = null where follower = '"+ username + "' AND following = '" + toFollow + "'");
                    log.info("Resetting timestamp to null value");
                }
            }
            else jdbcTemplate.execute("INSERT into following VALUES('" + username + "','" + toFollow + "')");
        }
        else log.info("Can't follow yourself");
    }

    public void deleteFollower(String username, String toUnfollow) {
        List<Friend> list = jdbcTemplate.query("select * from following where follower=? AND following=?",
               new Object[]{username, toUnfollow}, new BeanPropertyRowMapper<>(Friend.class));
        if(list.size()==0) log.info("No record exists");
        else {
            Friend friend = list.get(0);
            if(friend.timestamp==null) {
                Timestamp timestamp = new Timestamp(new Date().getTime());
                jdbcTemplate.execute("update following set timestamp='" + timestamp + "' where follower = '"+ username + "' AND following = '" + toUnfollow + "'");
                log.info("Resetting timestamp to current time");
            }
            else log.info("Already unfollowed");
        }
    }

    public boolean existsFriendShip(String username, String following) {
        int row = jdbcTemplate.queryForInt("select count(*) from following where follower=? and following=?",new Object[]{username,following});
        return row != 0;
    }
}