package com.workflow.process.center.api.feign;

import com.workflow.process.center.api.domain.LoginDTO;
import com.workflow.process.center.common.contant.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;

/**
 * @Author: 土豆仙
 * @Date: 2021/6/23 15:32
 * @Description: 部门服务
 */
@FeignClient(contextId = "authService", value = ServiceNameConstants.AUTH_SERVICE)
public interface RemoteAuthService {

    @PostMapping("loginByUserNameAndPassward")
    Map<String, Object> loginByUserNameAndPassward(@RequestBody LoginDTO loginDTO);
}
