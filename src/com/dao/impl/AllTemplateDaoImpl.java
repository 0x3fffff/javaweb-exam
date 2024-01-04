package com.dao.impl;

import com.dao.AllTemplateDao;
import com.dao.BaseDao;
import com.entity.AllTemplate;
import com.utils.ExamTemp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AllTemplateDaoImpl extends BaseDao implements AllTemplateDao {

    @Override
    public List<AllTemplate> getAllTemp() {
        getConnection();
        List<AllTemplate> allTemplates = new ArrayList<>();
        try {
            String sql = "select * from " + ExamTemp.tableName;
            ResultSet rs = selectSql(sql,new Object[]{});
            while (rs.next()){
                AllTemplate allTemplate = new AllTemplate();
                allTemplate.setId(rs.getInt(ExamTemp.id));
                allTemplate.setB(rs.getString(ExamTemp.b));
                allTemplate.setC(rs.getString(ExamTemp.c));
                allTemplate.setD(rs.getString(ExamTemp.d));
                allTemplate.setE(rs.getString(ExamTemp.e));
                allTemplates.add(allTemplate);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        closeConnection();
        return allTemplates;
    }

    @Override
    public AllTemplate getTempByid(int id) {
        getConnection();
        AllTemplate allTemplate = new AllTemplate();
        try {
            String sql = "select * from "+ ExamTemp.tableName+" where "+ ExamTemp.id+" = ?";
            ResultSet rs = selectSql(sql,new Object[]{id});
            while (rs.next()){
                allTemplate.setId(id);
                allTemplate.setB(rs.getString(ExamTemp.b));
                allTemplate.setC(rs.getString(ExamTemp.c));
                allTemplate.setD(rs.getString(ExamTemp.d));
                allTemplate.setE(rs.getString(ExamTemp.e));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        closeConnection();
        return allTemplate;
    }

    @Override
    public int editTemp(AllTemplate allTemplate) {
        int res=0;
        getConnection();
        String sql = "UPDATE " + ExamTemp.tableName + " SET "+ExamTemp.b+"=?,"+ExamTemp.c+"=?,"+ExamTemp.d+"=?,"+ExamTemp.e+"=? WHERE "+ExamTemp.id+" = ?";
        res=editSql(sql,new Object[]{allTemplate.getB(),allTemplate.getC(),allTemplate.getD(),allTemplate.getE(),allTemplate.getId()});
        closeConnection();
        return res;
    }

    @Override
    public List<AllTemplate> getTempByStr(String Str) {
        getConnection();
        List<AllTemplate> allTemplates = new ArrayList<>();
        try {
            String sql = "SELECT * FROM "+ExamTemp.tableName+" WHERE "+ExamTemp.b+" LIKE '%"+Str+"%';";
            ResultSet rs = selectSql(sql,new Object[]{});
            while (rs.next()){
                AllTemplate allTemplate = new AllTemplate();
                allTemplate.setId(rs.getInt(ExamTemp.id));
                allTemplate.setB(rs.getString(ExamTemp.b));
                allTemplate.setC(rs.getString(ExamTemp.c));
                allTemplate.setD(rs.getString(ExamTemp.d));
                allTemplate.setE(rs.getString(ExamTemp.e));
                allTemplates.add(allTemplate);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        closeConnection();
        return allTemplates;
    }

    @Override
    public int deleteTempById(int id) {
        int res=0;
        getConnection();
        String sql = "DELETE FROM "+ExamTemp.tableName+" WHERE "+ExamTemp.id+" = ?";
        res=editSql(sql,new Object[]{id});
        closeConnection();
        return res;
    }

    @Override
    public int addTemp(AllTemplate allTemplate) {
        int res=0;
        getConnection();
        String sql = "INSERT INTO " + ExamTemp.tableName + "("+ExamTemp.b+","+ExamTemp.c+","+ExamTemp.d+","+ExamTemp.e+")VALUES(?,?,?,?)";
        res=editSql(sql,new Object[]{allTemplate.getB(),allTemplate.getC(),allTemplate.getD(),allTemplate.getE()});
        closeConnection();
        return res;
    }

    @Override
    public List<AllTemplate> getTempsByid(int id) {
        getConnection();
        List<AllTemplate> allTemplates = new ArrayList<>();
        try {
            String sql = "SELECT * FROM "+ExamTemp.tableName+" WHERE "+ExamTemp.id+" = "+id+";";
            ResultSet rs = selectSql(sql,new Object[]{});
            while (rs.next()){
                AllTemplate allTemplate = new AllTemplate();
                allTemplate.setId(rs.getInt(ExamTemp.id));
                allTemplate.setB(rs.getString(ExamTemp.b));
                allTemplate.setC(rs.getString(ExamTemp.c));
                allTemplate.setD(rs.getString(ExamTemp.d));
                allTemplate.setE(rs.getString(ExamTemp.e));
                allTemplates.add(allTemplate);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        closeConnection();
        return allTemplates;
    }
}
