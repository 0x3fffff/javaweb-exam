package com.utils;

import org.apache.commons.fileupload.FileItem;

import javax.servlet.http.HttpServletRequest;
import java.util.regex.Pattern;

public class Tools {
    public static boolean isNumer(String str) {
        return str != null && str.chars().allMatch(Character::isDigit);
    }

    public static void main(String[] args) {
        System.out.println(isNumer("a"));
    }
    //获取客户端ip
    public static String getClientIP(HttpServletRequest request) {
        // X-Forwarded-For 用于获取真实 IP 地址，如果有多级代理，取第一个非 unknown 的 IP
        String xForwardedForHeader = request.getHeader("X-Forwarded-For");
        if (xForwardedForHeader != null && !xForwardedForHeader.isEmpty()) {
            String[] ips = xForwardedForHeader.split(",");
            for (String ip : ips) {
                if (!"unknown".equalsIgnoreCase(ip.trim())) {
                    return ip.trim();
                }
            }
        }
        // 如果没有设置 X-Forwarded-For 头，或者头中的 IP 都是 unknown，则使用 getRemoteAddr()
        return request.getRemoteAddr();
    }
    //获取文件大小 单位MB
    public static double getFileSizeInMB(FileItem fileItem) {
        long fileSizeInBytes = fileItem.getSize();
        double fileSizeInMB = (double) fileSizeInBytes / (1024 * 1024);
        return fileSizeInMB;
    }
}
