package com.workflow.process.center.api.feign;

import com.workflow.process.center.api.domain.WorkFlowRoleDTO;
import com.workflow.process.center.common.ResultBean;
import com.workflow.process.center.common.contant.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: 土豆仙
 * @Date: 2021/6/23 15:32
 * @Description: 角色服务
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE)
public interface RemoteRoleService {

    /**
     * 获取角色列表
     */
    @GetMapping(value = "/role/listGroups")
    ResultBean<List<WorkFlowRoleDTO>> listRoles(WorkFlowRoleDTO workFlowRoleDTO);

    /**
     * 根据角色key获取角色名
     */
    @GetMapping(value = "/role/queryGroupByKey")
    ResultBean<WorkFlowRoleDTO> queryGroupByKey(@RequestParam(value = "groupKey", required = true) String groupKey);

}
