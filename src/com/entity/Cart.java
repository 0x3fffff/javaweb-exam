package com.entity;

public class Cart {
    private Integer id;
    private String foodname;
    private Integer num;
    private Integer totalm;
    private Integer money;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFoodname() {
        return foodname;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }


    public Integer getTotalm() {
        return totalm;
    }

    public void setTotalm(Integer totalm) {
        this.totalm = totalm;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", foodname='" + foodname + '\'' +
                ", num=" + num +
                ", totalm=" + totalm +
                ", money=" + money +
                '}';
    }
}
