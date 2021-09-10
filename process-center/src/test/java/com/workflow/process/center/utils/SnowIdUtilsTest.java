package com.workflow.process.center.utils;

import org.junit.jupiter.api.Test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

class SnowIdUtilsTest {

    @Test
    void nextIdTest() {
        //==============================Test=============================================

        SnowIdUtils snowIdUtils = new SnowIdUtils(0, 0);
        for (int i = 0; i < 1000; i++) {
            long id = snowIdUtils.nextId();
            System.out.println(Long.toBinaryString(id));
            System.out.println(id);
        }
    }


    private static final Pattern DYNAMIC_FORM_PARAMETER_NAME = Pattern.compile("form:(?<formDataName>.*)$");

    @Test
    void testJson() {
       /* String json = "{\"data\":[{\"userId\":\"1\",\"deptId\":\"103\",\"deptName\":\"研发部门\",\"areaId\":null,\"userName\":\"admin\",\"nickName\":\"钟明晓\",\"email\":\"ry@163.com\",\"phonenumber\":\"15888888888\",\"sex\":\"1\",\"status\":\"0\",\"password\":\"$2a$10$XrcGtvGSG06P.tcmWowbuuQon38S.BakjKEVuo4aT/JZa/Xr8RfJW\"},{\"userId\":\"2\",\"deptId\":\"105\",\"deptName\":\"测试部门\",\"areaId\":null,\"userName\":\"cs\",\"nickName\":\"测试人员\",\"email\":\"1111@163.com\",\"phonenumber\":\"15666666666\",\"sex\":\"1\",\"status\":\"0\",\"password\":\"$2a$10$STV4d8QB8kNvrjmzw2a3luth/j8Arj3t7xwaq7Ay9iNwq6NI8vEEy\"},{\"userId\":\"3\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"yckj\",\"nickName\":\"城云测试\",\"email\":\"17757144205@163.com\",\"phonenumber\":\"17757144205\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$xTs/Emk4nVYU1LB74PJPAOOjsym4C2BPBZG5mB8tPjJ/IJlu7emw6\"},{\"userId\":\"4\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"zhangsan\",\"nickName\":\"张三\",\"email\":\"111@163.com\",\"phonenumber\":\"15011111111\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$/pD42m5aw2/hWNdqVVuasuNjr3uxru0TA3lwXafL5WsQmWTUIq6mm\"},{\"userId\":\"5\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"lisi\",\"nickName\":\"李四\",\"email\":\"\",\"phonenumber\":\"15011111112\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$BHFPlzLHMg.rcbH0ic0IFO2JwXcjl4w.cl1DAj5yjo54f/ODg5/oi\"},{\"userId\":\"6\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"wangwu\",\"nickName\":\"王五\",\"email\":\"\",\"phonenumber\":\"15011111113\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$49v8gY2hFgU450s2CS0S1OgwQiJ3Q94X1dy.wDf25Ba3zHMGA7voG\"},{\"userId\":\"7\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"zhaoliu\",\"nickName\":\"赵六\",\"email\":\"\",\"phonenumber\":\"15011111114\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$uDMz8e0PiMQqn5KFGcpPM.MsEPZqEb4dxMjojhnRJst00QvEpaUaS\"},{\"userId\":\"8\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"chenqi\",\"nickName\":\"陈七\",\"email\":\"\",\"phonenumber\":\"15011111115\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$Zn.wo1/dnktYydj2ENF.2OeREN1rKZIAMLQo784y4vPhCUSaWucS.\"},{\"userId\":\"9\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"xieba\",\"nickName\":\"谢八\",\"email\":\"\",\"phonenumber\":\"15011111116\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$1GtqQ2sFANaBPW7QrBkhs.Mvb5s2KaO/m7zCdPR/XuOlSCL/1QdQy\"},{\"userId\":\"10\",\"deptId\":\"100\",\"deptName\":\"城云科技\",\"areaId\":null,\"userName\":\"xujiu\",\"nickName\":\"徐九\",\"email\":\"\",\"phonenumber\":\"15011111117\",\"sex\":\"0\",\"status\":\"0\",\"password\":\"$2a$10$oqFbdZCU3alzfFypMA/Ca.JSEwY9RwajRsp9onKOyqfXPJ4ftLQK.\"}],\"success\":true,\"code\":\"EC00000200\",\"msg\":null,\"totalNum\":13,\"pageIndex\":1,\"pageSize\":10,\"totalPage\":2}";

        JsonPath compile = JsonPath.compile("$.code");

        Object read = compile.read(json);
        System.out.println(read);*/
       /* Map maps = (Map) JSON.parse(json);
        System.out.println("这个是用JSON类来解析JSON字符串!!!");
        for (Object map : maps.entrySet()){
            System.out.println(((Map.Entry)map).getKey()+"     " + ((Map.Entry)map).getValue());
        }*/

        String key = "1form:aaa";
        Matcher formMatcher = DYNAMIC_FORM_PARAMETER_NAME.matcher(key);

        if (formMatcher.matches()) {

            System.out.println(formMatcher.group("formDataName"));

        }

    }
}