package com.workflow.process.center.flowable.core;

import com.workflow.process.center.BaseTest;
import org.flowable.engine.*;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentBuilder;
import org.flowable.engine.runtime.ProcessInstance;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class FlowableTimerTest extends BaseTest {

    private ProcessEngine processEngine;
    private TaskService taskService;
    private RuntimeService runtimeService;
    private RepositoryService repositoryService;
    private HistoryService historyService;
    private DynamicBpmnService dynamicBpmnService;
    private FormService formService;
    private IdentityService identityService;
    private ManagementService managementService;
    private ProcessEngineConfiguration processEngineConfiguration;

    @Before
    public void testProcessEngine() {
        processEngine = ProcessEngines.getDefaultProcessEngine();
        System.out.println("流程引擎类：" + processEngine);

        taskService = processEngine.getTaskService();
        System.out.println(taskService);

        runtimeService = processEngine.getRuntimeService();
        System.out.println(taskService);

        repositoryService = processEngine.getRepositoryService();
        System.out.println(repositoryService);

        historyService = processEngine.getHistoryService();
        System.out.println(historyService);

        dynamicBpmnService = processEngine.getDynamicBpmnService();
        System.out.println(dynamicBpmnService);

        formService = processEngine.getFormService();
        System.out.println(formService);

        identityService = processEngine.getIdentityService();
        System.out.println(identityService);

        managementService = processEngine.getManagementService();
        System.out.println(managementService);

        String name = processEngine.getName();
        System.out.println("流程引擎的名称： " + name);

        processEngineConfiguration = processEngine.getProcessEngineConfiguration();
        System.out.println(processEngineConfiguration);

    }

    /**
     * 关闭流程引擎
     */
    @After
    public void close(){
        processEngine.close();
    }

    /**
     * classpath方式部署
     * 涉及三张表：ACT_RE_PROCDEF,ACT_RE_DEPLOYMENT,ACT_GE_BYTEARRAY
     */
    @Test
    public void deploy(){
        DeploymentBuilder deploymentBuilder = repositoryService.createDeployment()
                .category("timer")
                .key("timer")
                .name("定时任务处理")
                .addClasspathResource("定时任务处理.bpmn20.xml");
        Deployment deploy = deploymentBuilder.deploy();

        System.out.println("定时任务处理,流程ID: " + deploy.getId());
    }

    /**
     * 启动流程实例
     * 涉及表：ACT_RU_EXECUTION,ACT_RU_TASK
     */
    @Test
    public void startProcessInstanceByKey(){
        String processDefinitionKey = "timer";
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(processDefinitionKey);

        System.out.println("流程实例ID: " +processInstance.getId());
        System.out.println("活动实例ID: " +processInstance.getActivityId());


    }


    /**
     * 完成个人任务:依次审批，对于串行任务节点
     */
    @Test
    public void complete(){
        String taskId = "70002" ;
        taskService.complete(taskId);

    }
    /**
     * 完成个人任务:依次审批，对于串行任务节点
     * @throws Exception
     */
    @Test
    public void sleep() throws Exception{
        Thread.sleep(600000);
    }
}
