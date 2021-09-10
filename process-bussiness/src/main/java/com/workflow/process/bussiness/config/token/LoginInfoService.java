package com.workflow.process.bussiness.config.token;


import com.workflow.process.center.domain.LoginUser;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: 土豆仙
 * @Date: 2021/6/27 19:55
 * @Description: 获取登录相关信息
 */
public interface LoginInfoService {

    LoginUser getLoginUser(String token);

    //获取登录用户信息
    LoginUser getLoginUser();

    LoginUser getLoginUser(HttpServletRequest request);
}
