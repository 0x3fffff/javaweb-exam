package com.dao.impl;

import com.dao.BaseDao;
import com.dao.UserDao;
import com.entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User login(String uname, String pwd) {
        getConnection();
        User user = new User();
        try {
            String sql = "select * from user where ACCOUNT = ? and PASSWORD = ?";
            ResultSet rs = selectSql(sql,new Object[]{uname,pwd});
            while (rs.next()){
                user.setUid(rs.getInt("ID"));
                user.setUname(rs.getString("ACCOUNT"));
                user.setUpwd(rs.getString("PASSWORD"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        closeConnection();
        return user;
    }

    @Override
    public int addUser(User user) {
        int res=-1;
        getConnection();
        String sql = "insert into user(ACCOUNT,PASSWORD) values(?,?)";
        res=saveUData(sql,new Object[]{user.getUname(),user.getUpwd()});
        closeConnection();
        return res;
    }

    @Override
    public User getUserByUname(String uname) {
        getConnection();
        User user = new User();
        try {
            String sql = "select * from user where ACCOUNT = ?";
            ResultSet rs = selectSql(sql,new Object[]{uname});
            while (rs.next()){
                user.setUid(rs.getInt("ID"));
                user.setUname(rs.getString("ACCOUNT"));
                user.setUpwd(rs.getString("PASSWORD"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        closeConnection();
        return user;
    }

    @Override
    public int editUserPwd(User user) {
        int res=-1;
        getConnection();
        String sql = "update user set PASSWORD = ? where ID = ?";
        res=editSql(sql,new Object[]{user.getUpwd(),user.getUid()});
        closeConnection();
        return res;
    }

}
