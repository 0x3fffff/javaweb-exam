package com.entity;

public class UData {
    private Integer unum,uid,utype;
    private String upwd,utime,upath;

    public UData() {
    }
    public UData(String upwd, String utime,String upath) {
        this.upwd = upwd;
        this.utime = utime;
        this.upath = upath;
    }
    public UData(String upwd, String utime,String upath,int utype) {
        this.upwd = upwd;
        this.utime = utime;
        this.upath = upath;
        this.utype = utype;
    }
    public UData(String upwd, String utime,String upath,int utype,int uid) {
        this.upwd = upwd;
        this.utime = utime;
        this.upath = upath;
        this.utype = utype;
        this.uid = uid;
    }
    public UData(int unum,String upwd, String utime,String upath) {
        this.unum = unum;
        this.upwd = upwd;
        this.utime = utime;
        this.upath = upath;
    }

    public void setUnum(Integer unum) {
        this.unum = unum;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getUtype() {
        return utype;
    }

    public void setUtype(Integer utype) {
        this.utype = utype;
    }

    public Integer getUnum() {
        return unum;
    }

    public void setUnum(int unum) {
        this.unum = unum;
    }

    public String getUpwd() {
        return upwd;
    }

    public String getUtime() {
        return utime;
    }

    public String getUpath() {
        return upath;
    }

    public void setUpath(String upath) {
        this.upath = upath;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public void setUtime(String utime) {
        this.utime = utime;
    }

    @Override
    public String toString() {
        return "UData{" +
                "unum=" + unum +
                ", uid=" + uid +
                ", utype=" + utype +
                ", upwd='" + upwd + '\'' +
                ", utime='" + utime + '\'' +
                ", upath='" + upath + '\'' +
                '}';
    }
}
