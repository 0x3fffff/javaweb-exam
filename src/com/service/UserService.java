package com.service;

import com.entity.User;

public interface UserService {
    public User login(String uname, String pwd);
    public int addUser(User user);
    public boolean  getUserByUname(String uname);
    public boolean editUserPwd(User user);
}
