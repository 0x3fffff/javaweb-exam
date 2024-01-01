package com.utils;

public class ExamTemp {
    public static String id, b, c, d, e;
    public static String tid, tb, tc, td, te;
    public static String indexTitle,item;
    public static String tableName = "course";
    public static void switchSys(String tableName2){
        if (tableName2.equals("course")) {
            tableName = "course";
            indexTitle = "课程管理系统";
            System.out.println("切换为："+indexTitle);
            item = "课程";
            //sql字段
            id = "courseno";
            b = "coursename";
            c = "classhours";
            d = "tname";
            e = "precourse";
            //表头
            tid = "课程编号";
            tb = "课程名称";
            tc = "课时";
            td = "任课教师";
            te = "先修课程";
        } else if (tableName2.equals("part")) {
            indexTitle = "零件管理系统";
            System.out.println("切换为："+indexTitle);
            tableName = "part";
            item = "零件";
            //sql字段
            id = "PNO";
            b = "PNAME";
            c = "BRAND";
            d = "MODEL";
            e = "PRICE";
            //表头
            tid = "零件编号";
            tb = "零件名称";
            tc = "品牌";
            td = "型号";
            te = "价格";
        }else if (tableName2.equals("warehouse")) {
            indexTitle= "仓库管理系统";
            System.out.println("切换为："+indexTitle);
            item = "仓库";
            tableName = "warehouse";
            //sql字段
            id = "WNO";
            b = "WNAME";
            c = "LOCATION";
            d = "SQUARE";
            e = "MANAGER";
            //表头
            tid = "仓库编号";
            tb = "仓库名称";
            tc = "位置";
            td = "面积";
            te = "管理员";
        }else if (tableName2.equals("book")){
            indexTitle = "图书管理系统";
            tableName = "book";
            System.out.println("切换为："+indexTitle);
            item = "图书";
            //sql字段
            id = "BNO";
            b = "BNAME";
            c = "AUTHOR";
            d = "PRICE";
            e = "PUBLISHER";
            //表头
            tid = "图书编号";
            tb = "图书名称";
            tc = "作者";
            td = "价格";
            te = "出版社";
        }else if(tableName2.equals("customer")){
            indexTitle = "顾客管理系统";
            tableName = "customer";
            System.out.println("切换为："+indexTitle);
            item = "客户";
            //sql字段
            id = "CNO";
            b = "CNAME";
            c = "SEX";
            d = "AGE";
            e = "ADDRESS";
            //表头
            tid = "客户编号";
            tb = "客户名称";
            tc = "性别";
            td = "年龄";
            te = "地址";
        }else if(tableName2.equals("teacher")){
            indexTitle = "教师管理系统";
            tableName = "teacher";
            System.out.println("切换为："+indexTitle);
            item = "教师";
            //sql字段
            id = "TNO";
            b = "TNAME";
            c = "PHONE";
            d = "DEPT";
            e = "COURSE";
            //表头
            tid = "教师编号";
            tb = "教师名称";
            tc = "电话";
            td = "部门";
            te = "课程";
        }
    }
}
