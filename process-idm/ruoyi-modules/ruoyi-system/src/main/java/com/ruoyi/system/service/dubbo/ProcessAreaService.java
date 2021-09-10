package com.ruoyi.system.service.dubbo;

import com.ruoyi.system.mapper.ProcessIdmMapper;
import com.workflow.process.center.api.AreaService;
import com.workflow.process.center.api.domain.WorkFlowAreaDTO;
import com.workflow.process.center.common.ResultBean;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@DubboService
public class ProcessAreaService implements AreaService {

/*    @Autowired
    private DistrictService districtService;*/


    @Autowired
    ProcessIdmMapper processIdmMapper;


    @Override
    public ResultBean<List<WorkFlowAreaDTO>> listAreas(WorkFlowAreaDTO workFlowAreaDTO) {
        List<WorkFlowAreaDTO> list = processIdmMapper.listAreas(workFlowAreaDTO);
        return ResultBean.ofSuccess(list);
    }

    @Override
    public ResultBean<WorkFlowAreaDTO> queryGroupByKey(String areaKey) {
        return ResultBean.ofSuccess(processIdmMapper.queryGroupByAreaKey(areaKey));
    }
}
