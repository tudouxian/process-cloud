package com.ruoyi.system.service.dubbo;


import com.workflow.process.center.api.LoginInfoService;
import com.workflow.process.center.api.domain.LoginDTO;
import com.workflow.process.center.domain.LoginUser;
import org.apache.dubbo.config.annotation.DubboService;

import java.util.Map;


@DubboService
public class ProcessLoginInfoService implements LoginInfoService {

    @Override
    public Map<String, Object> createToken(LoginDTO loginDTO) {

        // 获取登录token
        return null;
    }

    @Override
    public LoginUser getLoginUser(String token) {

        return null;
    }


}
