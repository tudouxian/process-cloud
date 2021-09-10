package com.workflow.process.bussiness.config.process;

import lombok.Data;

@Data
public class ProcessBaseProperties {

    //租户ID
    private String tenantId;

    //服务ID-配置请假对应服务编码
    private String serviceCode;
}
