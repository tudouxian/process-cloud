package com.workflow.process.center.api.feign;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.workflow.process.center.api.LoginInfoService;
import com.workflow.process.center.api.domain.LoginDTO;
import com.workflow.process.center.domain.LoginUser;
import com.workflow.process.center.common.contant.CacheConstants;
import com.workflow.process.center.common.contant.Constants;
import com.workflow.process.center.config.component.RedisService;
import com.workflow.process.center.exception.BizException;
import com.workflow.process.center.utils.SecurityUtils;
import com.workflow.process.center.utils.ServletUtils;
import com.workflow.process.center.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * token验证处理
 *
 */
@Component
public class TokenService implements LoginInfoService
{
    @Autowired
    private RedisService redisService;

    @Lazy
    @Autowired
    private RemoteAuthService remoteAuthService;

    private final static long EXPIRE_TIME = Constants.TOKEN_EXPIRE * 60;

    private final static String ACCESS_TOKEN = CacheConstants.LOGIN_TOKEN_KEY;

    protected static final long MILLIS_SECOND = 1000;


    @Override
    public Map<String, Object> createToken(LoginDTO loginDTO) {
        return remoteAuthService.loginByUserNameAndPassward(loginDTO);
    }

    @Override
    public LoginUser getLoginUser(String token) {
        if (StringUtils.isNotEmpty(token))
        {
            String userKey = getTokenKey(token);
            JSONObject cacheObject = redisService.getCacheObject(userKey);
            LoginUser loginUser = JSON.toJavaObject(cacheObject, LoginUser.class);
            //LoginUser user = redisService.getCacheObject(userKey);
            return loginUser;
        }
        return null;
    }

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public LoginUser getLoginUser()
    {
        LoginUser loginUser = getLoginUser(ServletUtils.getRequest());
        if (loginUser ==null){
            throw  new BizException("未登录！");
        }
        return loginUser;
    }

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public LoginUser getLoginUser(HttpServletRequest request)
    {
        // 获取请求携带的令牌
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token))
        {
            String userKey = getTokenKey(token);
            JSONObject cacheObject = redisService.getCacheObject(userKey);
            LoginUser loginUser = JSON.toJavaObject(cacheObject, LoginUser.class);
            //LoginUser user = redisService.getCacheObject(userKey);
            return loginUser;
        }
        return null;
    }

    /**
     * 设置用户身份信息
     */
    public void setLoginUser(LoginUser loginUser)
    {
        if (StringUtils.isNotNull(loginUser) && StringUtils.isNotEmpty(loginUser.getToken()))
        {
            refreshToken(loginUser);
        }
    }

    public void delLoginUser(String token)
    {
        if (StringUtils.isNotEmpty(token))
        {
            String userKey = getTokenKey(token);
            redisService.deleteObject(userKey);
        }
    }

    /**
     * 刷新令牌有效期
     *
     * @param loginUser 登录信息
     */
    public void refreshToken(LoginUser loginUser)
    {
        loginUser.setLoginTime(System.currentTimeMillis());
        loginUser.setExpireTime(loginUser.getLoginTime() + EXPIRE_TIME * MILLIS_SECOND);
        // 根据uuid将loginUser缓存
        String userKey = getTokenKey(loginUser.getToken());
        redisService.setCacheObject(userKey, loginUser, EXPIRE_TIME, TimeUnit.SECONDS);
    }

    private String getTokenKey(String token)
    {
        return ACCESS_TOKEN + token;
    }
}