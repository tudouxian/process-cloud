package com.ruoyi.system.service.dubbo;

import com.workflow.process.center.api.DeptService;
import com.workflow.process.center.api.domain.WorkFlowDeptDTO;
import com.workflow.process.center.common.ResultBean;
import com.ruoyi.system.mapper.ProcessIdmMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@DubboService
public class PrcessDeptAervice implements DeptService {

    @Autowired
    ProcessIdmMapper processIdmMapper;


    @Override
    public ResultBean<List<WorkFlowDeptDTO>> listDepts(WorkFlowDeptDTO workFlowDeptDTO) {
        List<WorkFlowDeptDTO> workFlowDeptDTOS = processIdmMapper.listDepts(workFlowDeptDTO);
        return ResultBean.ofSuccess(workFlowDeptDTOS);
    }

    @Override
    public ResultBean<WorkFlowDeptDTO> queryGroupByKey(String deptKey) {
        WorkFlowDeptDTO workFlowDeptDTO = processIdmMapper.queryGroupByDeptKey(deptKey);
        return ResultBean.ofSuccess(workFlowDeptDTO);
    }
}
