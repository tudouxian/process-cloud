package com.workflow.process.center.flowable.core;

import com.workflow.process.center.BaseTest;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.*;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.history.HistoricActivityInstance;
import org.flowable.engine.history.HistoricProcessInstance;
import org.flowable.engine.history.HistoricProcessInstanceQuery;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentBuilder;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.engine.runtime.Execution;
import org.flowable.engine.runtime.ProcessInstance;
import org.flowable.engine.runtime.ProcessInstanceQuery;
import org.flowable.image.ProcessDiagramGenerator;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.*;
import java.util.*;

public class FlowableCoreTest extends BaseTest {

   /* @Autowired
    private ProcessEngine processEngine;


    //1.部署流程定义（BPMN文件），获取流程定义文件对象
    public void test1() {
        // resouce：BPMN文件路径，inputStream：该文件的字节流
        DeploymentBuilder deploymentBuilder = processEngine.getRepositoryService()
                .createDeployment()
                .addInputStream(resource, inputStream);
        // 根据参数设置流程部署构建器,parameter ：部署参数，一个Map<String, Object>
        deploymentBuilder
                .category(parameter.get("flowType"))
                .name(parameter.get("flowName"))
                .key(parameter.get("flowKey"))
                .tenantId(parameter.get("flowTenantId"));
        // 并获取流程定义部署对象
        Deployment deployment = deploymentBuilder.deploy();
        String deploymentId = deployment.getId();
        ProcessDefinition processDefinition = processEngine.getRepositoryService()
                .createProcessDefinitionQuery()
                .deploymentId(deploymentId)
                .singleResult();
        // 流程定义ID
        String processDefinitionId = processDefinition.getId();
        // 流程定义Key
        String processDefinitionKey = processDefinition.getKey();
    }

    //2.挂起与恢复流程定义，挂起后发起流程实例就会抛出异常
    public void test2() {
        // 挂起
        processEngine.getRepositoryService()
                .suspendProcessDefinitionById(processDefinitionId);
        processEngine.getRepositoryService()
                .suspendProcessDefinitionByKey(processDefinitionKey);
        // 恢复
        processEngine.getRepositoryService()
                .activateProcessDefinitionById(processDefinitionId);
        processEngine.getRepositoryService()
                .activateProcessDefinitionByKey(processDefinitionKey);
    }

    //3.启动流程实例，并获取流程实例对象
    public void test3() {
        // variables：流程变量，Map<String, Object>类型
        ProcessInstance processInstance = processEngine.getRuntimeService()
                .startProcessInstanceById(processDefinitionId, variables);
        ProcessInstance processInstance2 = processEngine.getRuntimeService()
                .startProcessInstanceByKey(processDefinitionKey, variables);
        // 将流程实例与发起人绑定
        processEngine.getIdentityService()
                .setAuthenticatedUserId(userId);

        //4.对流程实例的操做
        // 流程实例ID
        String processInstanceId = processInstance.getId();
        // 判断流程是否结束
        processInstance.isEnded();
        // 判断流程是否挂起
        processInstance.isSuspended();
        // 获取流程的发起人ID
        String startUserId = processInstance.getStartUserId();
    }

    public void test5() {
        // 该流程的执行对象查询
        List<Execution> executionList = processEngine.getRuntimeService()
                .createExecutionQuery()
                .processInstanceId(processInstanceId)
                .list();
        Execution execution = processEngine.getRuntimeService()
                .createExecutionQuery()
                .processInstanceId(processInstanceId)
                .singleResult();
        // 该流程实例下的全部活动实例
        List<Execution> executions = processEngine.getRuntimeService()
                .createExecutionQuery()
                .parentId(processInstanceId)
                .list();
        // 更改多个活动实例的状态节点为指定节点 activityId ，好比结束节点终止流程
        processEngine.getRuntimeService()
                .createChangeActivityStateBuilder()
                .moveExecutionsToSingleActivityId(executionIds, activityId)
                .changeState();
        // 挂起流程实例
        processEngine.getRuntimeService()
                .suspendProcessInstanceById(processInstanceId);
        // 恢复挂起的流程实例
        processEngine.getRuntimeService()
                .activateProcessInstanceById(processInstanceId);
        // 删除一个正在流转的流程 deleteReason：删除缘由
        HistoricTaskInstanceQuery query = processEngine.getHistoryService()
                .createHistoricTaskInstanceQuery()
                .processInstanceId(processInstanceId);
        // 获取该流程实例下的任务数量
        long count = query.count();
        // 任务数量大于1，则流程已经启动了，不能撤回
        if (count > 1) {
            throw new FlowException(ResultEnum.EX_INSTANCE_BEGIN);
        }
        processEngine.getRuntimeService()
                .deleteProcessInstance(processInstanceId, deleteReason);
        // 获取流程实例的查询对象
        ProcessInstanceQuery instanceQuery = processEngine.getRuntimeService()
                .createProcessInstanceQuery();
        // 与某个用户相关的
        instanceQuery.involvedUser(userId);
        // 某个用户开启的
        instanceQuery.startedBy(userId);
        // 或者查询条件 .or().endOr() ==> (xx or  xx or ... ... or xx)，等于包裹内容的两括号
        instanceQuery.or().endOr();
        // 挂起的流程
        instanceQuery.suspended();
        // 在某个时间点以后开始
        instanceQuery.startedAfter(Date date);
        // 在某个时间点以前开始
        instanceQuery.startedBefore(Date date);
        // 获取正在流转的一个指定的流程实例
        instanceQuery.processInstanceId(processInstanceId);
        // 单个的流程实例
        ProcessInstance processInstance = instanceQuery.singleResult();
        // 多个流程实例 begin : 从第几个开始 ； max : 展现多少个
        List<ProcessInstance> processInstances = instanceQuery
                .list();
        List<ProcessInstance> processInstances2 = instanceQuery
                .listPage( int begin, int max);
        // 流程实例的数量
        long count2 = instanceQuery.count();
    }

    public void test6() {
        // 获取历史流程实例查询对象
        HistoricProcessInstanceQuery historicProcessInstanceQuery = processEngine.getHistoryService()
                .createHistoricProcessInstanceQuery();
        // 已完成的
        historicProcessInstanceQuery
                .finished();
        // 未完成的
        historicProcessInstanceQuery
                .unfinished();
        // 删除的
        historicProcessInstanceQuery
                .deleted();
        // 没有删除的
        historicProcessInstanceQuery
                .notDeleted();
        // 在某个时间点以后结束
        historicProcessInstanceQuery
                .finishedAfter(Date date);
        // 在某个时间点以前结束
        historicProcessInstanceQuery
                .finishedBefore(Date date);
        // 指定父流程ID的流程实例
        historicProcessInstanceQuery
                .superProcessInstanceId(processInstanceId)
        // 历史流程实例
        HistoricProcessInstance processInstance = historicProcessInstanceQuery
                .processInstanceId(processInstanceId).singleResult();
        // 删除该流程的历史记录
        processEngine.getHistoryService()
                .deleteHistoricProcessInstance(processInstanceId);
    }

    //5.任务服务的操做
    public void test7() {
        // 任务基础查询对象
        TaskQuery taskQuery = processEngine.getTaskService()
                .createTaskQuery();
        // 某个任务
        taskQuery.taskId(taskId);
        // 某个经办人的任务
        taskQuery.taskAssignee(userId);
        // 某个委托人的任务
        taskQuery.taskOwner(userId);
        // 某个或多个流程实例的任务
        taskQuery.processInstanceId(String processInstanceId);
        taskQuery.processInstanceIdIn(List < String > processInstanceIds);
        // 某个或多个部署实例的任务
        taskQuery.deploymentId(String deploymentId);
        taskQuery.deploymentIdIn(List < String > deploymentIds);
        // 某个活动实例的任务
        taskQuery.executionId(String executionId);
        // 按照任务建立时间倒序
        taskQuery.orderByTaskCreateTime().desc();
        // 存活的任务
        taskQuery.active();
        // 挂起的任务
        taskQuery.suspended();
        // 没有 删除缘由 的任务
        taskQuery.taskWithoutDeleteReason();
        // 没有签收的任务
        taskQuery.taskUnassigned();
        // 单个的任务对象
        Task task = taskQuery.singleResult();
        // 多个任务对象 begin : 从第几个开始 ； max : 展现多少个
        List<Task> tasks = taskQuery.list();
        List<Task> tasks2 = taskQuery.listPage( int begin, int max);
        // 任务的数量
        long count = taskQuery.count();
    }

    //变量的设值与取值
    public void test8() {
        // 任务ID
        String taskId = task.getId();
        // 设置全局变量
        processEngine.getTaskService().setVariable(taskId, "key1", "value1");
        // 设置局部变量
        processEngine.getTaskService().setVariableLocal(taskId, "key2", "value2");
        // 获取全局变量
        Map<String, Object> a = processEngine.getTaskService().getVariables(taskId);
        // 获取局部变量
        Map<String, Object> b = processEngine.getTaskService().getVariablesLocal(taskId);
        // 流程启动后获取变量（全局变量）
        Map<String, Object> variables = processEngine.getRuntimeService()
                .getVariables(processInstanceId);
        // 设置变量（全局变量）
        processEngine.getRuntimeService()
                .setVariable(processInstanceId, "key", "value");
    }

    //任务的流转
    public void test9() {
        // 任务的执行（委托人）
        processEngine.getTaskService()
                .resolveTask(taskId);
        processEngine.getTaskService()
                .complete(taskId);
        // 任务的执行（经办人） variables : 下次任务所须要的参数 localScope : 变量的存储范围(true:做用范围为当前任务,false:表示这个变量是全局的)
        // 博客：https://blog.csdn.net/u013026207/article/details/53405265
        processEngine.getTaskService().complete(taskId);
        processEngine.getTaskService().complete(String taskId, Map < String, Object > variables);
        processEngine.getTaskService().complete(String taskId, Map < String, Object > variables, boolean localScope);
        // 添加和删除候选人
        processEngine.getTaskService().addCandidateUser(taskId, userId);
        processEngine.getTaskService().deleteCandidateUser(taskId, userId);
        // 签收
        processEngine.getTaskService().claim(taskId, userId);
        // 委派
        processEngine.getTaskService().delegateTask(taskId, acceptUserId);
        // 转发
        processEngine.getTaskService().setAssignee(taskId, acceptUserId);
        // 驳回 currTaskKeys : 该任务的节点 ； activityId : 上一个节点ID
        List<String> currTaskKeys = new ArrayList<>();
        List<Task> tasks = processEngine.getTaskService()
                .createTaskQuery()
                .processInstanceId(processInstanceId).list();
        for (Task task : tasks) {
            currTaskKeys.add(task.getTaskDefinitionKey());
        }
        processEngine.getRuntimeService()
                .createChangeActivityStateBuilder()
                .processInstanceId(processInstanceId)
                .moveActivityIdsToSingleActivityId(currTaskKeys, activityId)
                .changeState();
        // 删除任务
        processEngine.getTaskService().deleteTask(taskId, deleteReason);
        processEngine.getTaskService().deleteTasks(List < String > taskIds, deleteReason);
    }

    //根据流程实例ID获取流程图（流程图在服务器上的访问地址）
    public void test10() {
              // 1.获取流程实例
        ProcessInstance pi = processEngine.getRuntimeService()
                .createProcessInstanceQuery()
                .processInstanceId(instanceId)
                .singleResult();
        // 2.根据流程实例ID获取该实例全部的历史轨迹对象
        List<HistoricActivityInstance> historyProcess = processEngine.getHistoryService()
                .createHistoricActivityInstanceQuery()
                .processInstanceId(instanceId)
                .finished()
                .list();
        // 全部的历史轨迹对象
        Map<String, HistoricActivityInstance> hisActivityMap = new HashMap<>(16);
        historyProcess.forEach(historicActivityInstance -> {
            if (!hisActivityMap.containsKey(historicActivityInstance.getActivityId())) {
                hisActivityMap.put(historicActivityInstance.getActivityId(), historicActivityInstance);
            }
        });
        // 流程定义ID
        String processDefinitionId;
        // 节点ID的集合
        List<String> activityIds = new ArrayList<>();
        // 3.获取高亮显示的节点ID和流程定义ID
        if (pi == null) {
            // 若是流程已经走完了，则从历史记录查询 historyService
            HistoricProcessInstance historicProcessInstance = processEngine.getHistoryService()
                    .createHistoricProcessInstanceQuery()
                    .processInstanceId(instanceId)
                    .singleResult();
            processDefinitionId = historicProcessInstance.getProcessDefinitionId();
            // 获取该流程的结束节点高亮显示
            String endActivityId = historicProcessInstance.getEndActivityId();
            activityIds.add(endActivityId);
        } else {
            // 若是流程没有走完，则从运行记录查询 runtimeService
            processDefinitionId = pi.getProcessDefinitionId();
            activityIds = processEngine.getRuntimeService()
                    .getActiveActivityIds(instanceId);
        }
        // 4.获取流程图
        BpmnModel bpmnModel = processEngine.getRepositoryService()
                .getBpmnModel(processDefinitionId);
        // 5.获取流程定义的全部节点信息
        Map<String, FlowElement> activityMap = new HashMap<>(16);
        List<Process> processes = bpmnModel.getProcesses();
        for (org.flowable.bpmn.model.Process process : processes) {
            Collection<FlowElement> flowElements = process.getFlowElements();
            for (FlowElement flowElement : flowElements) {
                if (flowElement != null) {
                    String flowElementId = flowElement.getId();
                    activityMap.put(flowElementId, flowElement);
                }
            }
        }
        // 6.获取高亮显示的连线集合
        List<String> flows = new ArrayList<>();
        // 递归获取高亮连线
        for (String activityId : activityIds) {
            this.getHighLightedFlows(activityMap, hisActivityMap, activityId, flows, activityId);
        }
        // 获取流程引擎配置
        ProcessEngineConfiguration engConf = processEngine.getProcessEngineConfiguration();
        // 定义流程画布生成器
        ProcessDiagramGenerator processDiagramGenerator = engConf
                .getProcessDiagramGenerator();
        // 获取流程图字节流
        InputStream in = processDiagramGenerator
                .generateDiagram(bpmnModel, FlowableConstants.PNG, activityIds, flows, engConf.getActivityFontName(), engConf.getLabelFontName(), engConf.getAnnotationFontName(), engConf.getClassLoader(), 1.0, true);
        // 流程图文件名
        String fileName = instanceId.replace("-", "");
        // 将流程图保存到本地，并返回流程图在服务器上的访问地址

        //return FileUtil.writeFile(in, filePath, fileName, FlowableConstants.PNG);
    }

    private void getHighLightedFlows(Map<String, FlowElement> flowNodeMap, Map<String, HistoricActivityInstance> hisActivityMap, String
            activeActivityId, List<String> highLightedFlows, String oldActivityId) {
        // 获取有效节点的节点信息
        FlowElement flowElement = flowNodeMap.get(activeActivityId);
        FlowNode flowNode = (FlowNode) flowElement;
        // 获取连线信息集合
        List<SequenceFlow> incomingFlows = flowNode.getIncomingFlows();
        for (SequenceFlow sequenceFlow : incomingFlows) {
            // 获取连线ID
            String sourceRefId = sequenceFlow.getSourceRef();
            if (hisActivityMap.containsKey(sourceRefId) && !oldActivityId.equals(sourceRefId)) {
                highLightedFlows.add(sequenceFlow.getId());
                this.getHighLightedFlows(flowNodeMap, hisActivityMap, sourceRefId, highLightedFlows, oldActivityId);
            } else {
                if (hisActivityMap.containsKey(sourceRefId)) {
                    highLightedFlows.add(sequenceFlow.getId());
                }
                break;
            }
        }
    }

    //根据流程定义ID获取流程图（流程图在服务器的访问路径）
    public void test11() {
        // 获取流程图
        BpmnModel bpmnModel = processEngine.getRepositoryService()
                .getBpmnModel(processDefinitionId);
        // 获取流程引擎配置
        ProcessEngineConfiguration engConf = processEngine.getProcessEngineConfiguration();
        // 定义流程画布生成器
        ProcessDiagramGenerator processDiagramGenerator = engConf
                .getProcessDiagramGenerator();
        InputStream inputStream = processDiagramGenerator
                .generateDiagram(bpmnModel, FlowableConstants.PNG, engConf.getActivityFontName(), engConf.getLabelFontName(), engConf.getAnnotationFontName(), engConf.getClassLoader(), 1.0, true);
        // 流程图文件名
        String fileName = bpmnModel.getTargetNamespace();
        if (fileName == null || "".equals(fileName)) {
            fileName = processDefinitionId.substring(0, processDefinitionId.indexOf(":")).replace("-", "");
        }
        // 将流程图保存到本地
        // return FileUtil.writeFile(inputStream, filePath, fileName, FlowableConstants.PNG);

    }

    public void test12() {

    }

    //保存文件并返回保存文件的路径
    public static String writeFile(InputStream inputStream, String path, String fileName, String fileType) throws IOException {
        OutputStream out = null;
        // 按照文件类型分目录存放
        String folderPath = path + "/" + fileType + "/";
        File file = new File(folderPath);
        // 判断目录是否存在
        if (!file.exists()) {
            file.mkdirs();
        }
        // 完整文件名
        String fileNames = fileName + "." + fileType;
        // 文件存放路径
        String filePath = folderPath + fileNames;
        File image = new File(filePath);
        image.createNewFile();
        byte[] bytes = new byte[1024];
        int length = 0;
        try {
            out = new FileOutputStream(image);
            while ((length = inputStream.read(bytes)) != -1) {
                out.write(bytes, 0, length);
            }
            return fileType + "/" + fileNames;
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }*/

}
