package com.workflow.process.center.api.feign;

import com.workflow.process.center.api.domain.LoginDTO;
import com.workflow.process.center.domain.LoginUser;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author: 土豆仙
 * @Date: 2021/6/27 19:55
 * @Description: 获取登录相关信息
 */
public interface LoginInfoService {

    Map<String, Object> createToken(LoginDTO loginDTO);

    //获取登录用户信息
    LoginUser getLoginUser();

    LoginUser getLoginUser(HttpServletRequest request);
}
