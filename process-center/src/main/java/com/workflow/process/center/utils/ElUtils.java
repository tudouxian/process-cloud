package com.workflow.process.center.utils;

/**
*   @Author: 土豆仙
*   @Date: 2021/7/1 15:42
*   @Description: EL表达式工具类
*/
public class ElUtils {

    public static String getOriginalValue(String elStr) {
        if (elStr.indexOf("${") != -1) {
            elStr = elStr.substring(elStr.lastIndexOf("${") + 2, elStr.length() - 1);
            elStr = elStr.trim();
        }
        return elStr;
    }

    public static String getSpotValue(String elStr) {
        if (elStr.indexOf(".") != -1) {
            elStr = elStr.substring(0, elStr.indexOf("."));
            elStr = elStr.trim();
        }
        return elStr;
    }


    public static void main(String[] args) {
        String originalValue = ElUtils.getSpotValue("line.sfdsf");
        System.out.println(originalValue);
    }
}
