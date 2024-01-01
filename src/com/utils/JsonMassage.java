package com.utils;

import com.alibaba.fastjson.JSONObject;

public class JsonMassage<E> {

    private String code;//状态码
    private String massage;//状态码描述
    private E data;//数据

    public String toJSONString(){
               JSONObject jsonObject=new JSONObject();
       return jsonObject.toJSONString(this);
    }


    public JsonMassage(String code, String massage, E data) {
        this.code = code;
        this.massage = massage;
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMassage() {
        return massage;
    }

    public void setMassage(String massage) {
        this.massage = massage;
    }

    public E getData() {
        return data;
    }

    public void setData(E data) {
        this.data = data;
    }
}
