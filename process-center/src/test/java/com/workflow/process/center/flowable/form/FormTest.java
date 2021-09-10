package com.workflow.process.center.flowable.form;

import org.flowable.engine.RuntimeService;


public class FormTest {

    private RuntimeService runtimeService;

    public void getForm() {
        // 流程开始表单
        //ProcessDefinition.hasStartFormKey();
        //获取开始流程表单
        //ProcessDefinition pd = repositoryService
        //        .createProcessDefinitionQuery()
        //        .processDefinitionKey(code)
        //        .latestVersion()
        //        .singleResult();
        //StartFormData form = formService.getStartFormData(pd.getId());
        //FormInfo info = formRepositoryService.getFormModelByKey(form.getFormKey());
        //info.getFormModel();

        // 流程中表单
        //Task.getFormKey();

        //获取流程中用户需要填写的表单
        //TaskFormData form = formService.getTaskFormData(taskId);

        //填写开始表单
        //runtimeService.startProcessInstanceWithForm
        //formService.submitStartFormData

        //填写任务表单
        //TaskService.completeTaskWithForm(String taskId,
        //                                 String formDefinitionId,
        //                                 String outcome, Map variables)

    }


}
