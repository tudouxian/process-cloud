package com.workflow.process.bussiness.common.enums;

import java.io.Serializable;

/**
*   @Author: 土豆仙
*   @Date: 2021/6/27 16:26
*   @Description: 节点映射
*/
public enum NodeEnum implements Serializable {

    NODE1("node1", "节点1"),
    NODE2("node2", "节点2"),
    NODE3("node3", "节点3");

    // 类型
    private String code;
    // 描述
    private String description;

    private NodeEnum(String code, String description) {
        this.code = code;
        this.description = description;
    }

    public static NodeEnum getEnumByCode(String code) {
        for (NodeEnum e : NodeEnum.values()) {
            if (e.getCode().equals(code)) {
                return e;
            }
        }
        return null;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
