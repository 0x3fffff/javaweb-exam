package com.servlet.userfile;

import com.entity.AllTemplate;

import com.service.AllTemplateService;
import com.service.impl.AllTemplateServiceImpl;
import com.utils.JsonMassage;
import com.utils.Tools;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetAllTemp")
public class GetAllTempServlet extends HttpServlet {
    AllTemplateService ats = new AllTemplateServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String type = req.getParameter("type");
        if (type==null||"0".equals(type)){
            int uid = Integer.parseInt(req.getSession().getAttribute("uid").toString());
            System.out.println("uid: "+uid);
            List<AllTemplate> allTemplates = ats.getAllTemp();
            JsonMassage<AllTemplate> JSM = new JsonMassage("0", "", allTemplates);
            String json = JSM.toJSONString();
            System.out.println(json);
            resp.getWriter().write(json);
        }else {
            String Str = req.getParameter("Str");
            List<AllTemplate> allTemplates = null;
            if (Tools.isNumer(Str)) {
                allTemplates = ats.getTempsByid(Integer.parseInt(Str));
            } else {
                allTemplates = ats.getTempByStr(Str);
            }
            JsonMassage<AllTemplate> JSM = new JsonMassage("0", "", allTemplates);
            String json = JSM.toJSONString();
            System.out.println(json);
            resp.getWriter().write(json);
        }
    }
}
