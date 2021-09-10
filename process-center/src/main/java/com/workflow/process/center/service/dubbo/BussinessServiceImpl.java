package com.workflow.process.center.service.dubbo;

import com.workflow.process.center.service.BussinessService;
import org.apache.dubbo.config.annotation.DubboService;

import java.util.HashMap;
import java.util.Map;

@DubboService
public class BussinessServiceImpl implements BussinessService {
    @Override
    public Map<String, Object> findByProcessInstanceId(String processInstanceId) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("days",3);
        return map;
    }
}
