package com.workflow.process.bussiness.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
*   @Author: 土豆仙
*   @Date: 2021/7/1 15:22
*   @Description: json工具
*/
public class FastJsonUtils {

    public static <T> List<T> jsonToList(String arrayJson, Class<T> clazz) {
        Assert.notNull(arrayJson, "Json数组不能为空!");
        List<T> list = JSON.parseArray(arrayJson, clazz);
        return list;
    }

    /**
     * 列表转化成Json数组
     *
     * @param list
     * @return
     */
    public static <T> String listToJson(List<T> list) {
        String resultStr = null;
        if (!CollectionUtils.isEmpty(list)) {
            JSONArray array = JSON.parseArray(JSON.toJSONString(list));
            resultStr = array.toJSONString();
        }
        return resultStr;
    }

    /**
     * 对象转成json
     *
     * @param t
     * @return
     * @Description:
     * @author wentaoxiang 2016年9月8日 下午6:57:43
     */
    public static <T> String objectToJson(T t) {
        Assert.notNull(t, "对象不能为空!");
        return JSON.toJSONString(t, SerializerFeature.DisableCircularReferenceDetect);
        /***
         *  Fastjson的SerializerFeature序列化属性:
         *  QuoteFieldNames———-输出key时是否使用双引号,默认为true
         *	WriteMapNullValue——–是否输出值为null的字段,默认为false
         *	WriteNullNumberAsZero—-数值字段如果为null,输出为0,而非null
         *	WriteNullListAsEmpty—–List字段如果为null,输出为[],而非null
         *	WriteNullStringAsEmpty—字符类型字段如果为null,输出为”“,而非null
         *	WriteNullBooleanAsFalse–Boolean字段如果为null,输出为false,而非null
         */
        //return JSON.toJSONString(t,SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullStringAsEmpty);
    }

    public static <T> String objectToJson(T t, SerializerFeature... features) {
        Assert.notNull(t, "对象不能为空!");
        return JSON.toJSONString(t, features);
        /***
         *  Fastjson的SerializerFeature序列化属性:
         *  QuoteFieldNames———-输出key时是否使用双引号,默认为true
         *	WriteMapNullValue——–是否输出值为null的字段,默认为false
         *	WriteNullNumberAsZero—-数值字段如果为null,输出为0,而非null
         *	WriteNullListAsEmpty—–List字段如果为null,输出为[],而非null
         *	WriteNullStringAsEmpty—字符类型字段如果为null,输出为”“,而非null
         *	WriteNullBooleanAsFalse–Boolean字段如果为null,输出为false,而非null
         */
        //return JSON.toJSONString(t,SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue,SerializerFeature.WriteNullStringAsEmpty);
    }

    /**
     * json转成对象
     *
     * @param json
     * @param t
     * @return
     * @Description:
     * @author wentaoxiang 2016年9月8日 下午6:58:00
     */
    public static <T> T jsonToObject(String json, Class<T> t) {
        Assert.notNull(json, "json字符串不能为空!");
        return JSON.parseObject(json, t);
    }

}
