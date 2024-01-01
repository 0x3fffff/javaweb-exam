package com.service;

import com.entity.AllTemplate;

import java.util.List;

public interface AllTemplateService {
    public List<AllTemplate> getAllTemp();
    public AllTemplate getTempByid(int id);
    public boolean editTemp(AllTemplate allTemplate);
    public List<AllTemplate> getTempByStr(String Str);
    public int deleteTempById(int id);
    public int addTemp(AllTemplate allTemplate);
    public List<AllTemplate> getTempsByid(int id);
}
