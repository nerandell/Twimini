package com.springapp.mvc.data;

import com.springapp.mvc.model.Friend;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import com.springapp.mvc.model.User;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Repository
public class ImageRepository{

    static Logger log = Logger.getLogger(ImageRepository.class);
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ImageRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void setImage(final String username,String path) {
        final File file = new File(path);
        try {
            final FileInputStream fis = new FileInputStream(file);
            String query = "insert into images values (?,?)";
            jdbcTemplate.execute(query, new PreparedStatementCallback<Boolean>() {
                @Override
                public Boolean doInPreparedStatement(PreparedStatement preparedStatement) throws SQLException, DataAccessException {
                    preparedStatement.setString(1,username);
                    preparedStatement.setBinaryStream(2, fis, (int) file.length());
                    Boolean returnVal =  preparedStatement.execute();
                    preparedStatement.close();
                    return returnVal;
                }
            });
            fis.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public byte[] getImage(String username) {
        String query = "select image from images where username='"+username+"'";
        return jdbcTemplate.query(query, new ResultSetExtractor<byte[]>() {
            @Override
            public byte[] extractData(ResultSet resultSet) throws SQLException, DataAccessException {
                while(resultSet.next()) {
                    byte[] imgBytes = resultSet.getBytes(1);
                    return imgBytes;
                }
                return null;
            }
        });
    }

    public void updateImage(final String username, String path) {
        final File file = new File(path);
        try {
            final FileInputStream fis = new FileInputStream(file);
            String query = "update images set image=? where username=?";
            jdbcTemplate.execute(query, new PreparedStatementCallback<Boolean>() {
                @Override
                public Boolean doInPreparedStatement(PreparedStatement preparedStatement) throws SQLException, DataAccessException {
                    preparedStatement.setString(2,username);
                    preparedStatement.setBinaryStream(1, fis, (int) file.length());
                    Boolean returnVal =  preparedStatement.execute();
                    preparedStatement.close();
                    return returnVal;
                }
            });
            fis.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}