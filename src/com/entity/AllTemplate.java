package com.entity;

public class AllTemplate {
    private Integer id;
    private String b,c,d,e;

    public AllTemplate() {
    }


    public AllTemplate(int id, String b, String c, String d, String e) {
        this.id = id;
        this.b = b;
        this.c = c;
        this.d = d;
        this.e = e;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

    public String getD() {
        return d;
    }

    public void setD(String d) {
        this.d = d;
    }

    public String getE() {
        return e;
    }

    public void setE(String e) {
        this.e = e;
    }

    @Override
    public String toString() {
        return "AllTemplate{" +
                "id=" + id +
                ", b='" + b + '\'' +
                ", c='" + c + '\'' +
                ", d='" + d + '\'' +
                ", e='" + e + '\'' +
                '}';
    }
}
