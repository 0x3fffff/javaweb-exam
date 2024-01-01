package com.service.impl;

import com.dao.AllTemplateDao;
import com.dao.impl.AllTemplateDaoImpl;
import com.entity.AllTemplate;
import com.service.AllTemplateService;

import java.util.List;

public class AllTemplateServiceImpl implements AllTemplateService {
    AllTemplateDao atd = new AllTemplateDaoImpl();
    @Override
    public List<AllTemplate> getAllTemp() {
        return atd.getAllTemp();
    }

    @Override
    public AllTemplate getTempByid(int id) {
        return atd.getTempByid(id);
    }

    @Override
    public boolean editTemp(AllTemplate allTemplate) {
        return atd.editTemp(allTemplate)==1;
    }

    @Override
    public List<AllTemplate> getTempByStr(String Str) {
        return atd.getTempByStr(Str);
    }

    @Override
    public int deleteTempById(int id) {
        return atd.deleteTempById(id);
    }

    @Override
    public int addTemp(AllTemplate allTemplate) {
        return atd.addTemp(allTemplate);
    }

    @Override
    public List<AllTemplate> getTempsByid(int id) {
        return atd.getTempsByid(id);
    }
}
