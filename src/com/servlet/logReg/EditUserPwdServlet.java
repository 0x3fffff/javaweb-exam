package com.servlet.logReg;

import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditUserPwd")
public class EditUserPwdServlet extends HttpServlet {
    UserService us = new UserServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = (int) req.getSession().getAttribute("uid");
        String pwd = req.getParameter("pwd");
        System.out.println("id " + id + " pwd " + pwd);
        boolean check = us.editUserPwd(new User(id, pwd));
        if (check) {
            resp.getWriter().write("ok");
        }else {
            resp.getWriter().write("err");
        }
    }
}
