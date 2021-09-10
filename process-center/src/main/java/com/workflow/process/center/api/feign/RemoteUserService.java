package com.workflow.process.center.api.feign;


import com.workflow.process.center.api.domain.WorkFlowUserDTO;
import com.workflow.process.center.common.ResultBean;
import com.workflow.process.center.common.contant.ServiceNameConstants;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Author: 土豆仙
 * @Date: 2021/6/23 15:32
 * @Description: 用户服务
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.SYSTEM_SERVICE)
public interface RemoteUserService {

    /**
     * 获取用户列表
     */
    @GetMapping(value = "/user/listUsers")
    ResultBean<List<WorkFlowUserDTO>> listUsers(WorkFlowUserDTO workFlowUserDTO);


    /**
     * 获取用户列表-分页
     */
    @GetMapping(value = "/user/selectAll")
    ResultBean<List<WorkFlowUserDTO>> selectAll(WorkFlowUserDTO workFlowUserParam,
                                                @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize);

    /**
     * 用户ids获取用户信息
     *
     * @return 结果
     */
    @GetMapping("/user/selectUserByUserIds")
    ResultBean<List<WorkFlowUserDTO>> selectUserByUserIds(@RequestParam("idList") List<String> idList);

    /**
     * 用户id获取用户信息
     *
     * @return 结果
     */
    @GetMapping("/user/selectUserByUserId")
    ResultBean<WorkFlowUserDTO> selectUserByUserId(@RequestParam(value = "userId", required = true) String userId);


    /**
     * 获取角色Key获取用户信息
     *
     * @return 结果
     */
    @GetMapping("/user/selectUserByRoleKeys")
    ResultBean<List<WorkFlowUserDTO>> selectUserByRoleKeys(@RequestParam("keyList") List<String> keyList,
                                                           @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                           @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize);

    /**
     * 获取部门Key获取用户信息
     *
     * @return 结果
     */
    @GetMapping("/user/selectUserByDeptKeys")
    ResultBean<List<WorkFlowUserDTO>> selectUserByDeptKeys(@RequestParam("keyList") List<String> keyList,
                                                           @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                           @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize);
    /**
     * 获取区域Key获取用户信息
     *
     * @return 结果
     */
    @GetMapping("/user/selectUserByAreaKeys")
    ResultBean<List<WorkFlowUserDTO>> selectUserByAreaKeys(@RequestParam("keyList") List<String> keyList,
                                                           @RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                           @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize);
    /**
     * groupKey获取用户信息
     *
     * @return 结果
     */
    @GetMapping("/user/selectUserByAreaDeptRoleKeys")
    ResultBean<List<WorkFlowUserDTO>> selectUserByAreaDeptRoleKeys(@RequestParam(value = "area") String area, @RequestParam(value = "dept") String dept,
                                                                   @RequestParam(value = "role") String role);


    /**
     * groupKey获取用户信息
     *
     * @return 结果-分页
     */
    @GetMapping("/user/selectPageUserByAreaDeptRoleKeys")
    ResultBean<List<WorkFlowUserDTO>> selectPageUserByAreaDeptRoleKeys(@RequestParam(value = "area") String area,
                                                                       @RequestParam(value = "dept") String dept,
                                                                       @RequestParam(value = "role") String role,
                                                                       @RequestParam(value = "pageIndex") Integer pageIndex,
                                                                       @RequestParam(value = "pageSize") Integer pageSize);

}
