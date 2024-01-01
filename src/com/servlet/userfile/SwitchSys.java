package com.servlet.userfile;

import com.utils.ExamTemp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SwitchSys")
public class SwitchSys extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String system = req.getParameter("system");
        ExamTemp.switchSys(system);
        System.out.println("SwitchSys：" + system);
        resp.getWriter().write("ok");
    }
}
