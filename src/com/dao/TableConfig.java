package com.dao;

public class TableConfig extends BaseDao{
    public void init(String tableName,String id){
        getConnection();
        String sql = "alter table "+tableName+" modify "+id+" int auto_increment;";
        int res=editSql(sql,new Object[]{});
        closeConnection();
        return;
    }
}
