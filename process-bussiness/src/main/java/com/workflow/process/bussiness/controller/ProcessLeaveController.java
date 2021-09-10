package com.workflow.process.bussiness.controller;

import com.workflow.process.bussiness.common.enums.NodeEnum;
import com.workflow.process.bussiness.config.process.ProcessLeaveProperties;
import com.workflow.process.bussiness.config.token.LoginInfoService;
import com.workflow.process.bussiness.domain.entity.BussinessLeave;
import com.workflow.process.center.api.TaskService;
import com.workflow.process.center.api.WorkBenchService;
import com.workflow.process.center.common.ResultBean;
import com.workflow.process.center.domain.dto.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 申请流程服务及流转
 *
 * @author 土豆仙
 * @since 2021-08-27 10:57:57
 */
@Api(tags = "请假申请流程服务")
@RestController
@RequestMapping("/processLeave")
public class ProcessLeaveController {


    @Autowired
    private ProcessLeaveProperties processLeaveProperties;

    @Autowired
    private LoginInfoService loginInfoService;

    @DubboReference
    private WorkBenchService workBenchService;

    @DubboReference
    private TaskService taskService;


    @ApiOperation("发起请假流程")
    @GetMapping("/startLeave")
    public ResultBean<String> startLeave( @RequestParam(value = "businessKey") String businessKey) {
        StartProcessServiceDTO startProcessServiceDTO = new StartProcessServiceDTO();
        //参数校验

        //租户
        startProcessServiceDTO.setTenantId(processLeaveProperties.getTenantId());
        //发起请假对应服务编码
        startProcessServiceDTO.setServiceCode(processLeaveProperties.getServiceCode());
        //业务Key-流程双向绑定
        startProcessServiceDTO.setBusinessKey(businessKey);
        //申请人信息-从
        startProcessServiceDTO.setUserId(loginInfoService.getLoginUser().getUserid().toString());
        startProcessServiceDTO.setUserName(loginInfoService.getLoginUser().getNickName());
        //流程变量-可不填
        //startProcessServiceDTO.setVariables();

        workBenchService.startProcessService(startProcessServiceDTO);

        return ResultBean.ofSuccess("请假提交成功！");
    }


    @ApiOperation("查询我发起的请假流程")
    @GetMapping("/findMyStartLeave")
    public ResultBean<List<ProcessInstanceDTO>> findMyStartLeave(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                          @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        //参数校验
        ProcessInstanceQueryDTO processInstanceQueryDTO = new ProcessInstanceQueryDTO();

        //过滤条件
        //租户
        processInstanceQueryDTO.setTenantId(processLeaveProperties.getTenantId());
        //服务编码-请假
        processInstanceQueryDTO.setServiceCode(processLeaveProperties.getServiceCode());
        //用户ID
        processInstanceQueryDTO.setUserId(loginInfoService.getLoginUser().getUserid().toString());
        processInstanceQueryDTO.setPageIndex(pageIndex);
        processInstanceQueryDTO.setPageSize(pageSize);

        ResultBean<List<ProcessInstanceDTO>> myProcessinstances = workBenchService.findMyProcessinstances(processInstanceQueryDTO);

        //获取BussinessKey组装业务数据-暂时直接返回

        return myProcessinstances;
    }

    @ApiOperation("查询请假流程中-我的组任务待办")
    @GetMapping("/findMyToDoGroupInLeave")
    public ResultBean<List<TaskDTO>> findMyToDoGroupInLeave(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        //参数校验
        TaskQueryDTO taskQueryDTO = new TaskQueryDTO();

        //过滤条件
        //租户
        taskQueryDTO.setTenantId(processLeaveProperties.getTenantId());
        //服务编码-请假
        taskQueryDTO.setServiceCode(processLeaveProperties.getServiceCode());
        //用户ID
        taskQueryDTO.setUserId(loginInfoService.getLoginUser().getUserid().toString());
        taskQueryDTO.setPageIndex(pageIndex);
        taskQueryDTO.setPageSize(pageSize);

        ResultBean<List<TaskDTO>> myToDoTasks = workBenchService.findMyToDoGroupTasks(taskQueryDTO);

        //获取BussinessKey组装业务数据-暂时直接返回

        return myToDoTasks;
    }


    @ApiOperation("查询请假流程中-我的待办")
    @GetMapping("/findMyTodoInLeave")
    public ResultBean<List<TaskDTO>> findMyTodoInLeave(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                            @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        //参数校验
        TaskQueryDTO taskQueryDTO = new TaskQueryDTO();

        //过滤条件
        //租户
        taskQueryDTO.setTenantId(processLeaveProperties.getTenantId());
        //服务编码-请假
        taskQueryDTO.setServiceCode(processLeaveProperties.getServiceCode());
        //用户ID
        taskQueryDTO.setUserId(loginInfoService.getLoginUser().getUserid().toString());
        taskQueryDTO.setPageIndex(pageIndex);
        taskQueryDTO.setPageSize(pageSize);

        ResultBean<List<TaskDTO>> myToDoTasks = workBenchService.findMyToDoTasks(taskQueryDTO);

        //获取BussinessKey组装业务数据-暂时直接返回
        //这里有三种对接方式
        //1.以bussinessKey为唯一标识 组装业务  =》适合 整个流程只有一张表单的情况。例如请假单
        //2.以节点taskDefKey为唯一标识  建立节点枚举  组装节点对应业务数据  =》适合各个节点表单不一的情况
        //3.在流程引擎中注册表单，即可从TaskDTO获取节点对应FormKey集合。（待开发）


        return myToDoTasks;
    }

    @ApiOperation("查询请假流程中-我的已办")
    @GetMapping("/findMyDoneInLeave")
    public ResultBean<List<TaskDTO>> findMyDoneInLeave(@RequestParam(value = "pageIndex", defaultValue = "1") Integer pageIndex,
                                                       @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        //参数校验
        TaskQueryDTO taskQueryDTO = new TaskQueryDTO();

        //过滤条件
        //租户
        taskQueryDTO.setTenantId(processLeaveProperties.getTenantId());
        //服务编码-请假
        taskQueryDTO.setServiceCode(processLeaveProperties.getServiceCode());
        //用户ID
        taskQueryDTO.setUserId(loginInfoService.getLoginUser().getUserid().toString());
        taskQueryDTO.setPageIndex(pageIndex);
        taskQueryDTO.setPageSize(pageSize);

        ResultBean<List<TaskDTO>> myToDoTasks = workBenchService.findMyDoneTasks(taskQueryDTO);

        //获取BussinessKey组装业务数据-暂时直接返回
        //这里有三种对接方式
        //1.以bussinessKey为唯一标识 组装业务  =》适合 整个流程只有一张表单的情况。例如请假单


        //2.以节点taskDefKey为唯一标识  建立节点枚举  组装节点对应业务数据  =》适合各个节点表单不一的情况
        /*if (myToDoTasks !=null && myToDoTasks.getData() !=null){
            myToDoTasks.getData().stream()
                    .forEach(_taskDTO ->{
                        NodeEnum enumByCode = NodeEnum.getEnumByCode(_taskDTO.getTaskDefKey());
                        //组装业务
                    });
        }*/

        //3.在流程引擎中注册表单，即可从TaskDTO获取节点对应FormKey集合。（待开发）
        return myToDoTasks;
    }


}
