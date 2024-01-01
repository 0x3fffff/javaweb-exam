package com.dao;

import com.entity.User;

public interface UserDao {
    public User login(String uname, String pwd);
    public int addUser(User user);
    public User getUserByUname(String uname);
    public int editUserPwd(User user);
}
