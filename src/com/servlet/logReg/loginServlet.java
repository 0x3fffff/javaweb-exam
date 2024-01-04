package com.servlet.logReg;

import com.dao.TableConfig;
import com.entity.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import com.utils.ExamTemp;
import com.utils.JsonMassage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/login")
public class loginServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    TableConfig tableConfig = new TableConfig();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ExamTemp.switchSys("course"); //默认系统
        tableConfig.init(ExamTemp.tableName,ExamTemp.id);
        String uname = req.getParameter("uname");
        String upwd = req.getParameter("upwd");
        String captcha = (String) req.getSession().getAttribute("captcha");
        String tcaptcha = req.getParameter("captcha");
        //System.out.println("uname "+uname+" upwd "+upwd);
        User user = userService.login(uname,upwd);
        //System.out.println(user);
        //System.out.println("aaa");
        String json = "";

        if (captcha == null || !captcha.equalsIgnoreCase(tcaptcha)){
            JsonMassage<User> JSM = new JsonMassage("302", "验证码错误", user);
            json = JSM.toJSONString();
            PrintWriter out = resp.getWriter();
            out.write(json);
            return;
        }
        if(user.getUid()!=null){
            HttpSession session=req.getSession();
            session.setAttribute("user",user);
            session.setAttribute("uname",uname);
            session.setAttribute("uid",user.getUid());
            JsonMassage<User> JSM = new JsonMassage("300", "登录成功", user);
            json = JSM.toJSONString();
            PrintWriter out = resp.getWriter();
            //System.out.println(json);

            System.out.println("登录:"+user);
            out.write(json);
        }else{
            JsonMassage<User> JSM = new JsonMassage("301", "登录失败", user);
            json = JSM.toJSONString();
            PrintWriter out = resp.getWriter();
            out.write(json);
        }

    }
}
