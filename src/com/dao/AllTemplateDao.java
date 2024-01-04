package com.dao;

import com.entity.AllTemplate;

import java.util.List;

public interface AllTemplateDao {
    public List<AllTemplate> getAllTemp();
    public AllTemplate getTempByid(int id);
    public int editTemp(AllTemplate allTemplate);
    public List<AllTemplate> getTempByStr(String Str);
    public int deleteTempById(int id);
    public int addTemp(AllTemplate allTemplate);
    public List<AllTemplate> getTempsByid(int id);
}
