package com.service.impl;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.entity.User;
import com.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao UD = new UserDaoImpl();
    @Override
    public User login(String uname, String pwd) {
        return UD.login(uname, pwd);
    }

    @Override
    public int addUser(User user) {
        int res = UD.addUser(user);
        return res;
    }

    @Override
    public boolean getUserByUname(String uname) {
        User user = UD.getUserByUname(uname);
        return user.getUid() != null;
    }

    @Override
    public boolean editUserPwd(User user) {
        return UD.editUserPwd(user) > 0;
    }
}
