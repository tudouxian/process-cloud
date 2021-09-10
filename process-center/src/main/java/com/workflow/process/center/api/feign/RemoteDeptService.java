package com.workflow.process.center.api.feign;

import com.workflow.process.center.api.domain.WorkFlowDeptDTO;
import com.workflow.process.center.common.ResultBean;
import com.workflow.process.center.common.contant.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: 土豆仙
 * @Date: 2021/6/23 15:32
 * @Description: 部门服务
 */
@FeignClient(contextId = "remoteDeptService", value = ServiceNameConstants.SYSTEM_SERVICE)
public interface RemoteDeptService {

    /**
     * 获取部门列表
     */
    @GetMapping(value = "/dept/listDepts")
    ResultBean<List<WorkFlowDeptDTO>> listDepts(WorkFlowDeptDTO workFlowDeptDTO);

    /**
     * 根据部门key获取部门信息
     */
    @GetMapping(value = "/dept/queryGroupByKey")
    ResultBean<WorkFlowDeptDTO> queryGroupByKey(@RequestParam(value = "groupKey", required = true) String groupKey);
}
