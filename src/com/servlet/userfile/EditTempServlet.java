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

@WebServlet("/EditTemp")
public class EditTempServlet extends HttpServlet {
    AllTemplateService ats = new AllTemplateServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String b = req.getParameter("b");
        String c = req.getParameter("c");
        String d = req.getParameter("d");
        String e = req.getParameter("e");
        ats.editTemp(new AllTemplate(id,b,c,d,e));
    }
}
