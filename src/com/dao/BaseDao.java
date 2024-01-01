package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class BaseDao {
    public Connection conn=null;
    public PreparedStatement ps=null;
    private static  String driver;
    private static String url;
    private static String uname;
    private static String upwd;
    static{
        InputStream is=BaseDao.class.getClassLoader().getResourceAsStream("com/config/jdbc.properties");
        Properties properties=new Properties();
        try {
            properties.load(is);
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            uname = properties.getProperty("uname");
            upwd = properties.getProperty("upwd");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void getConnection() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url,uname,upwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void closeConnection(){
        try {
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet selectSql(String sql,Object[] objs){
        ResultSet rs = null;
        if (conn!=null){
            try {
                ps = conn.prepareStatement(sql);
                if (objs!=null){
                    for (int i=0;i<objs.length;i++){
                        ps.setObject(i+1,objs[i]);
                    }
                }
                rs=ps.executeQuery();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rs;
    }

    public int editSql(String sql,Object[] objs){
        int rs=0;
        if (conn!=null){
            try{
                ps = conn.prepareStatement(sql);
                if (objs!=null){
                    for (int i=0;i<objs.length;i++){
                        ps.setObject(i+1,objs[i]);
                    }
                }
                rs=ps.executeUpdate();
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return rs;
    }

    public int saveUData(String sql,Object[] objs){
        int rs=0,unum=-1;
        if (conn!=null){
            try{
                ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
                if (objs!=null){
                    for (int i=0;i<objs.length;i++){
                        ps.setObject(i+1,objs[i]);
                    }
                }
                rs=ps.executeUpdate();
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    unum=generatedKeys.getInt(1);
                }
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return unum;
    }
}
