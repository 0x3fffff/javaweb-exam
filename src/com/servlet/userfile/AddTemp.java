package com.servlet.userfile;

import com.entity.AllTemplate;
import com.service.AllTemplateService;
import com.service.impl.AllTemplateServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addTemp")
public class AddTemp extends HttpServlet {
    AllTemplateService ats = new AllTemplateServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String b = req.getParameter("b");
        String c = req.getParameter("c");
        String d = req.getParameter("d");
        String e = req.getParameter("e");
        int res = ats.addTemp(new AllTemplate(0,b,c,d,e));
        if (res>0){
            resp.getWriter().write("ok");
        }else resp.getWriter().write("err");
    }
}
