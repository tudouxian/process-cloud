CREATE TABLE `work_flow_form_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL COMMENT '分类编码',
  `category_name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级分类id',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='表单分类表'



CREATE TABLE `work_flow_form_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_info_id` int(11) DEFAULT NULL COMMENT '表单模型id',
  `form_key` varchar(200) DEFAULT NULL COMMENT '表单唯一标识Key：用于关联流程',
  `form_json` longtext COMMENT '表单配置json',
  `form_type` tinyint(1) DEFAULT '0' COMMENT '状态值-0：pc表单 1：移动端表单',
  `status` varchar(255) DEFAULT NULL COMMENT '状态1-未发布，2-已发布',
  `main_version` tinyint(1) DEFAULT '0' COMMENT '是否为主版本',
  `config_json` longtext CHARACTER SET utf8 COMMENT '表单表头字段配置',
  `release_note` varchar(255) DEFAULT NULL COMMENT '版本说明',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE KEY `idx_unique_form_key` (`form_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义表单模型表'


CREATE TABLE `work_flow_form_model_info` (
  `model_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表单模型信息主键',
  `category_id` int(11) DEFAULT NULL COMMENT '表单分类ID',
  `category_name` varchar(200) DEFAULT NULL COMMENT '表单分类名称',
  `form_name` varchar(200) DEFAULT NULL COMMENT '表单名称',
  `form_key` varchar(255) DEFAULT NULL COMMENT '主版本formKey=》用于关联工作流',
  `version` int(11) DEFAULT '1' COMMENT '主版本版本号',
  `form_model_type` tinyint(1) DEFAULT '0' COMMENT '默认：0-外部表单 1-自定义表单',
  `creator` varchar(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标识1表示删除0表示存在',
  PRIMARY KEY (`model_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='表单模型信息表'



--字典表

CREATE TABLE `dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表'

CREATE TABLE `dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='字典数据表'