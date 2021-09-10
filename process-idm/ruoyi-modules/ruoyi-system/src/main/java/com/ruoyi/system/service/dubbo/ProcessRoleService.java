package com.ruoyi.system.service.dubbo;

import com.ruoyi.system.mapper.ProcessIdmMapper;
import com.workflow.process.center.api.RoleService;
import com.workflow.process.center.api.domain.WorkFlowRoleDTO;
import com.workflow.process.center.common.ResultBean;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@DubboService
public class ProcessRoleService implements RoleService {

    @Autowired
    ProcessIdmMapper processIdmMapper;


    @Override
    public ResultBean<List<WorkFlowRoleDTO>> listRoles(WorkFlowRoleDTO workFlowRoleDTO) {
        List<WorkFlowRoleDTO> workFlowRoleDTOS = processIdmMapper.listRoles(workFlowRoleDTO);
        return ResultBean.ofSuccess(workFlowRoleDTOS);
    }

    @Override
    public ResultBean<WorkFlowRoleDTO> queryGroupByKey(String roleKey) {
        WorkFlowRoleDTO workFlowRoleDTO = processIdmMapper.queryGroupByRoleKey(roleKey);
        return ResultBean.ofSuccess(workFlowRoleDTO);
    }
}
