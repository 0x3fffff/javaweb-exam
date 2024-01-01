package com.servlet.userfile;

import com.service.AllTemplateService;
import com.service.impl.AllTemplateServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelTemp")
public class DelAlltempServlet extends HttpServlet {
    AllTemplateService ats = new AllTemplateServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int res = ats.deleteTempById(id);
        if (res>0){
            resp.getWriter().write("ok");
        }else resp.getWriter().write("err");
    }
}
