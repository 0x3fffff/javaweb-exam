package com.entity;

public class FData {
    private Integer uid;
    private Double fsize;
    private String fname;
    private String fpath;
    private String ftime;
    private String ip;
    public FData(){}
    public FData(Integer uid, String fname, String fpath, String ftime, String ip) {
        this.uid = uid;
        this.fname = fname;
        this.fpath = fpath;
        this.ftime = ftime;
        this.ip = ip;
    }

    public FData(Integer uid, String fname, String fpath, Double fsize,String ftime, String ip) {
        this.uid = uid;
        this.fname = fname;
        this.fpath = fpath;
        this.fsize = fsize;
        this.ftime = ftime;
        this.ip = ip;
    }

    public Double getFsize() {
        return fsize;
    }

    public void setFsize(Double fsize) {
        this.fsize = fsize;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFpath() {
        return fpath;
    }

    public void setFpath(String fpath) {
        this.fpath = fpath;
    }

    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Override
    public String toString() {
        return "fdata{" +
                "uid=" + uid +
                ", fname='" + fname + '\'' +
                ", fpath='" + fpath + '\'' +
                ", ftime='" + ftime + '\'' +
                ", ip='" + ip + '\'' +
                '}';
    }
}
