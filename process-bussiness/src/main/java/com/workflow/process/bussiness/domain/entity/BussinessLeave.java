package com.workflow.process.bussiness.domain.entity;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;


/**
 * 请假单(BussinessLeave)表实体类
 *
 * @author 土豆仙
 * @since 2021-08-27 10:57:49
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("请假单")
public class BussinessLeave implements Serializable {

    private static final long serialVersionUID = -52287425096766622L;

    /**
     * 主键
     */
    @ApiModelProperty(value = "主键")
    @TableId(type = IdType.ASSIGN_UUID)
    @TableField("id")
    private String id;

    /**
     * 流程实例ID
     */
    @ApiModelProperty(value = "流程实例ID")
    @TableField("process_ins_id")
    private String processInsId;

    /**
     * 申请用户ID
     */
    @ApiModelProperty(value = "申请用户ID")
    @TableField("applyer_user_id")
    private String applyerUserId;

    /**
     * 标题
     */
    @ApiModelProperty(value = "标题")
    @TableField("title")
    private String title;

    /**
     * 类型
     */
    @ApiModelProperty(value = "类型")
    @TableField("type")
    private String type;

    /**
     * 天数
     */
    @ApiModelProperty(value = "天数")
    @TableField("days")
    @NotBlank(message = "请假天数不能为空！")
    private Object days;

    /**
     * 请假开始时间
     */
    @ApiModelProperty(value = "请假开始时间")
    @TableField("start_time")
    private Date startTime;

    /**
     * 请假结束时间
     */
    @ApiModelProperty(value = "请假结束时间")
    @TableField("end_time")
    private Date endTime;

    @TableField("dept_id")
    private String deptId;

    @TableField("dept_name")
    private String deptName;

    @TableField("note")
    private String note;

    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    @TableField("creator")
    private String creator;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间")
    @TableField("create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间")
    @TableField("update_time")
    private Date updateTime;

    /**
     * 更新人
     */
    @ApiModelProperty(value = "更新人")
    @TableField("updator")
    private String updator;

    /**
     * 删除标识0表示删除1表示存在
     */
    @ApiModelProperty(value = "删除标识0表示删除1表示存在")
    @TableField("del_flag")
    private Integer delFlag;

}
