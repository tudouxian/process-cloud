package com.workflow.process.center.service.impl;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.workflow.process.center.service.IDynamDubbo;
import com.workflow.process.center.utils.dubbo.MyReferenceUtils;
import org.apache.dubbo.rpc.service.GenericService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.alibaba.fastjson.serializer.SerializerFeature.WriteNullStringAsEmpty;

@Component
public class DynamDubboImpl implements IDynamDubbo {

    private static final String VARCHAR = "java.lang.String";

    @Autowired
    private MyReferenceUtils myReferenceUtils;

    @SuppressWarnings("unchecked")
    @Override
    public Object invoke(String clazzName, String method, String version, String parameter) {
        GenericService genericService = myReferenceUtils.getCacheGenericServiceByKey(clazzName, version);
        return genericService.$invoke(method, new String[]{VARCHAR}, new Object[]{parameter});
    }

    @Override
    public Object invoke(String clazzName, String method, String version, Map<String, String> parameter) {
        List<String> types = new ArrayList<String>();
        List<Object> values = new ArrayList<>();
        parameter.forEach((key, value) -> {
            if (String.class.getName().equals(key)) {
                types.add(key);
                values.add(value.toString());
            } else {
                types.add(key);
                JSONObject jsonObject = JSONObject.parseObject(value);
                Map<String, Object> map = (Map<String, Object>) jsonObject;
                values.add(map);
            }
        });
        GenericService genericService = myReferenceUtils.getCacheGenericServiceByKey(clazzName, version);
        String[] dtypes = types.toArray(new String[types.size()]);
        Object result = genericService.$invoke(method, dtypes, values.toArray());
        try {
            String resultJsonStr = JSONObject.toJSONString(result, WriteNullStringAsEmpty);
            resultJsonStr = resultJsonStr.replaceAll("[,]*\"class\":\"(.+?)\"", "");
            result = JSONObject.parse(resultJsonStr);
        } catch (JSONException ignored) {
        }
        return result;
    }

    @Override
    public Object invoke(String clazzName, String method, String version, String[] parameters) {
        GenericService genericService = myReferenceUtils.getCacheGenericServiceByKey(clazzName, version);
        List<String> types = new ArrayList<String>();
        if (parameters != null && parameters.length > 0) {
            int count = parameters.length;
            for (int i = 0; i < count; i++) {
                types.add(VARCHAR);
            }
            return genericService.$invoke(method, (String[]) types.toArray(), parameters);
        }
        return null;
    }
}
