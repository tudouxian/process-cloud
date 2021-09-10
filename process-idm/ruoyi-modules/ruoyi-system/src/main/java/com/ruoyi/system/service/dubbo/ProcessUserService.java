package com.ruoyi.system.service.dubbo;

import com.workflow.process.center.api.UserService;
import com.workflow.process.center.api.domain.WorkFlowUserDTO;
import com.workflow.process.center.common.ResultBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ruoyi.system.mapper.ProcessIdmMapper;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@DubboService
public class ProcessUserService implements UserService {

    @Autowired
    ProcessIdmMapper processIdmMapper;


    @Override
    public ResultBean<List<WorkFlowUserDTO>> listUsers(WorkFlowUserDTO workFlowUserDTO) {

        List<WorkFlowUserDTO> workFlowUserDTOS = processIdmMapper.listUsers(workFlowUserDTO);

        return ResultBean.ofSuccess(workFlowUserDTOS);
    }

    @Override
    public ResultBean<List<WorkFlowUserDTO>> selectAll(WorkFlowUserDTO workFlowUserDTO, Integer pageIndex, Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize, true);
        List<WorkFlowUserDTO> workFlowUserDTOS = processIdmMapper.listUsers(workFlowUserDTO);
        PageInfo<WorkFlowUserDTO> pageInfo = new PageInfo<>(workFlowUserDTOS);

        return ResultBean.ofSuccess(workFlowUserDTOS, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());
    }

    @Override
    public ResultBean<List<WorkFlowUserDTO>> selectUserByUserIds(List<String> list) {

        List<WorkFlowUserDTO> workFlowUserDTOS = processIdmMapper.selectUserByUserIds(list);

        return ResultBean.ofSuccess(workFlowUserDTOS);

    }

    @Override
    public ResultBean<WorkFlowUserDTO> selectUserByUserId(String userId) {

        WorkFlowUserDTO workFlowUserDTO = processIdmMapper.selectUserByUserId(userId);
        return ResultBean.ofSuccess(workFlowUserDTO);
    }

    @Override
    public ResultBean<List<WorkFlowUserDTO>> selectUserByRoleKeys(List<String> keyList, Integer pageIndex, Integer pageSize) {

        PageHelper.startPage(pageIndex, pageSize, true);
        List<WorkFlowUserDTO> list = processIdmMapper.selectUserByRoleKeys(keyList);
        PageInfo<WorkFlowUserDTO> pageInfo = new PageInfo<>(list);
        return ResultBean.ofSuccess(list, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());
    }

    @Override
    public ResultBean<List<WorkFlowUserDTO>> selectUserByDeptKeys(List<String> keyList, Integer pageIndex, Integer pageSize) {
        List<WorkFlowUserDTO> list = processIdmMapper.selectUserByDeptKeys(keyList);
        PageInfo<WorkFlowUserDTO> pageInfo = new PageInfo<>(list);
        return ResultBean.ofSuccess(list, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());

    }

    public ResultBean<List<WorkFlowUserDTO>> selectUserByAreaKeys(List<String> keyList, Integer pageIndex, Integer pageSize){
        List<WorkFlowUserDTO> list = processIdmMapper.selectUserByAreaKeys(keyList);
        PageInfo<WorkFlowUserDTO> pageInfo = new PageInfo<>(list);
        return ResultBean.ofSuccess(list, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());

    }


    @Override
    public ResultBean<List<WorkFlowUserDTO>> selectUserByAreaDeptRoleKeys(String area, String dept, String role) {
        List<WorkFlowUserDTO> list = processIdmMapper.selectUserByAreaDeptRoleKeys(area, dept, role);
        return ResultBean.ofSuccess(list);
    }

    @Override
    public ResultBean<List<WorkFlowUserDTO>> selectPageUserByAreaDeptRoleKeys(String area, String dept, String role, Integer pageIndex, Integer pageSize) {
        PageHelper.startPage(pageIndex, pageSize, true);
        List<WorkFlowUserDTO> list = processIdmMapper.selectUserByAreaDeptRoleKeys(area, dept, role);

        PageInfo<WorkFlowUserDTO> pageInfo = new PageInfo<>(list);
        return ResultBean.ofSuccess(list, pageInfo.getTotal(), pageInfo.getPageNum(), pageInfo.getPageSize());

    }

}
