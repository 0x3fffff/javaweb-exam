package com.servlet.logReg;

import com.alibaba.fastjson.JSONObject;
import com.dao.TableConfig;
import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import com.utils.JsonMassage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class registerServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();
    static {
        TableConfig tableConfig = new TableConfig();
        tableConfig.init("USER","ID");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String json = "";
        if ("getUserByUname".equals(action)) {
            String uname = req.getParameter("uname");
            boolean check = userService.getUserByUname(uname);
            PrintWriter out = resp.getWriter();
            if (check) {
                out.write("err");
            } else {
                out.write("ok");
            }
        } else if ("reg".equals(action)) {
            String uname = req.getParameter("uname");
            String upwd = req.getParameter("upwd");
            User user = new User();
            user.setUname(uname);
            user.setUpwd(upwd);
            int res = -1;
            if (!userService.getUserByUname(uname)) {
                res = userService.addUser(user);
            }
            if (res != -1) {
                user.setUid(res);
                JsonMassage<User> JSM = new JsonMassage("200", "注册成功", user);
                req.getSession().setAttribute("uid", res);
                System.out.println("注册:" + user);
                json = JSM.toJSONString();
            } else {
                JsonMassage<User> JSM = new JsonMassage("201", "注册失败", user);
                json = JSM.toJSONString();
            }
            PrintWriter out = resp.getWriter();
            //System.out.println(user);
            out.write(json);
        }
    }
}