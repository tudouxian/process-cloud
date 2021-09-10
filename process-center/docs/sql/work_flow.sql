--服务相关
CREATE TABLE `work_flow_service_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_code` varchar(50) NOT NULL COMMENT '分类编码',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级分类id',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0：关闭，1：开启',
	`icon_name` varchar(255) DEFAULT NULL COMMENT '图标名称',
	`creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	 `updator` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='服务分类表'



CREATE TABLE `work_flow_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `service_name` varchar(100) NOT NULL COMMENT '服务名称',
  `service_code` varchar(50) NOT NULL COMMENT '服务编码',
  `type` tinyint(4) DEFAULT NULL COMMENT '服务类型，1：内部表单服务；2，外部调用服务',
  `process_def_id` varchar(64) DEFAULT NULL COMMENT '流程定义id',
  `status` tinyint(4) NOT NULL COMMENT '是否发布，0：不发布，1：发布',
	 `open_way` tinyint(4) DEFAULT '0' COMMENT '打开方式,0-当前页面,1-新窗口打开',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注',
	 `tenant_id` varchar(64) DEFAULT NULL COMMENT '系统标识-租户ID',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	 `updator` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='服务表'

CREATE TABLE `work_flow_service_rel_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `service_id` int(11) DEFAULT NULL COMMENT '服务id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id',
	 `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	 `updator` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `SERVICE_ID_CATEGORY_ID` (`service_id`,`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='服务与服务分类关联表-服务可以配置在多个分类下'


CREATE TABLE `work_flow_service_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `service_id` int(11) DEFAULT NULL COMMENT '服务id',
  `service_name` varchar(50) DEFAULT NULL COMMENT '服务名称',
  `basic_info` text COMMENT '基本信息',
  `processing_info` text COMMENT '办理流程',
  `attention_info` text COMMENT '注意事项',
  `question_info` text COMMENT '注意事项',
  `consultation` text COMMENT '咨询方式',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
	 `updator` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='服务指南配置'


CREATE TABLE `work_flow_service_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `service_id` int(11) DEFAULT NULL COMMENT '服务id',
  `collect_status` tinyint(1) DEFAULT NULL COMMENT '0-未收藏,1-收藏',
	 `user_id` int(11) DEFAULT NULL COMMENT '用户id',
	  `tenant_id` varchar(64) DEFAULT NULL COMMENT '系统标识-租户ID',
 `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
	 `updator` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `SERVICE_ID_USER_ID_TENANT_ID` (`service_id`,`user_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='服务收藏表'


--自定义表单相关
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


CREATE TABLE `work_flow_form_model_info` (
  `model_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL COMMENT '表单分类id',
  `category_name` varchar(200) DEFAULT NULL COMMENT '表单分类名称',
  `form_name` varchar(200) DEFAULT NULL COMMENT '表单名称',
  `version` int(11) DEFAULT NULL COMMENT '当前版本号',
  `creator` varchar(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	 `del_flag` int(1) DEFAULT '0' COMMENT '删除标识1表示删除0表示存在',
  PRIMARY KEY (`model_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='表单模型信息表'

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
  PRIMARY KEY (`model_config_id`) USING BTREE,
  UNIQUE KEY `idx_unique_form_key` (`form_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自定义表单模型表'

--扩展流程引擎表-主要记录流程实例运行状态
CREATE TABLE `work_flow_extend_hisprocinst` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model_key` varchar(100) DEFAULT NULL COMMENT '模型key',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `process_definition_id` varchar(64) DEFAULT NULL COMMENT '流程定义ID',
  `business_key` varchar(64) DEFAULT NULL COMMENT '业务单据KEY',
  `process_name` varchar(400) DEFAULT NULL COMMENT '流程名称',
  `process_status` varchar(10) DEFAULT NULL COMMENT '流程状态',
  `tenant_id` varchar(100) DEFAULT NULL COMMENT '租户id(系统标识)',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updator` varchar(32) DEFAULT NULL COMMENT '更新人',
  `del_flag` int(1) DEFAULT '1' COMMENT '删除标识0表示删除1表示存在',
  PRIMARY KEY (`id`),
  KEY `process_instance_id_index` (`process_instance_id`) USING BTREE,
  KEY `creator_index` (`creator`) USING BTREE,
  KEY `model_key_index` (`model_key`) USING BTREE,
  KEY `process_definition_id_index` (`process_definition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程引擎扩展表-主要记录流程实例运行状态'


--历史审核记录
CREATE TABLE `work_flow_hi_comment` (
  `id` int(40) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(20) DEFAULT '' COMMENT '类型',
  `user_id` varchar(10) DEFAULT NULL COMMENT '员工工号',
	`user_name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '审批时间',
  `task_id` varchar(64) DEFAULT NULL COMMENT '任务ID',
	`task_name` varchar(64) DEFAULT NULL COMMENT '任务名称',
  `activity_id` varchar(64) DEFAULT NULL COMMENT '活动节点ID',
  `activity_name` varchar(120) DEFAULT NULL COMMENT '活动节点名称',
  `process_ins_id` varchar(64) DEFAULT NULL COMMENT '流程实例id',
  `action` varchar(40) DEFAULT NULL COMMENT '动作',
  `message` varchar(800) DEFAULT NULL COMMENT '审批意见',
	`create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `updator` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `del_flag` int(11) DEFAULT '0' COMMENT '删除标识1：删除 0:存在',
  `tenant_id` varchar(64) DEFAULT NULL COMMENT '系统标识-租户ID',
  PRIMARY KEY (`id`),
  KEY `process_ins_id_index` (`process_ins_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8


--流程上配置的表单=》流程关联表单、表单关联节点及节点拥有权限
CREATE TABLE `work_flow_model_re_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模型关联表单主键',
  `pro_def_id` varchar(64) DEFAULT NULL COMMENT '流程模型ID',
  `form_name` varchar(200) DEFAULT NULL COMMENT '表单名称',
  `form_key` varchar(255) DEFAULT NULL COMMENT '表单formKey',
	 `type` int(11) DEFAULT '0' COMMENT '表单配置类型：0-节点表单 1-全局表单',
  `creator` varchar(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标识1表示删除0表示存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程模型关联表单（先只控制到表级读写权限=》后期再扩展到表内字段的读写权限）'



CREATE TABLE `work_flow_model_re_form_re_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model_re_form_id` varchar(64) DEFAULT NULL COMMENT '模型关联表单ID',
	 `form_key` varchar(255) DEFAULT NULL COMMENT '冗余字段-表单formKey-后期关联表内字段权限',
  `activity_id` varchar(64) DEFAULT NULL COMMENT '流程模型节点ID',
  `auth_level` int(11) DEFAULT '1' COMMENT '权限级别：0-无 1-可读 2-可写',
  `creator` varchar(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标识1表示删除0表示存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='节点对流程模型关联的表单的权限'


--存储函数设计
SELECT substring_index('area_dept_role','_',1) FROM dual;
SELECT substring_index(substring_index('area_dept_role','_',-2),'_',1) FROM dual;
SELECT substring_index('area_dept_role','_',-1) FROM dual;

SELECT substring_index('_dept_role','_',1) FROM dual;
SELECT substring_index(substring_index('area__role','_',-2),'_',1) FROM dual;
SELECT substring_index('area_dept_','_',-1) FROM dual;

CREATE DEFINER=`root`@`%` FUNCTION `FuncGroupCompare`(`configGroup` varchar(20),`userGroup` varchar(20)) RETURNS int(1)
BEGIN

declare cArea varchar(100);
declare cDept varchar(100);
declare cRole varchar(100);

declare uArea varchar(100);
declare uDept varchar(100);
declare uRole varchar(100);

SET cArea = substring_index(configGroup,'_',1);
SET cDept = substring_index(substring_index(configGroup,'_',2),'_',1);
SET cRole = substring_index(configGroup,'_',-1);

SET uArea = substring_index(userGroup,'_',1);
SET uDept = substring_index(substring_index(userGroup,'_',2),'_',1);
SET uRole = substring_index(userGroup,'_',-1);

    IF
				(
				(
				(ISNULL(cArea)=1) || (LENGTH(trim(cArea))=0)
				||
				(
				((ISNULL(uArea)!=1) || (LENGTH(trim(uArea))!=0)) && STRCMP(cArea,uArea) = 0
				)
				)
				&&
				(
				(ISNULL(cDept)=1) || (LENGTH(trim(cDept))=0)
				||
				(
				((ISNULL(uDept)!=1) || (LENGTH(trim(uDept))!=0)) && 	(STRCMP(cDept,uDept) = 0)
				)
				)
				&&
				(
				(ISNULL(cRole)=1) || (LENGTH(trim(cRole))=0)
				||
				(
				((ISNULL(uRole)!=1) || (LENGTH(trim(uRole))!=0)) && (STRCMP(cRole,uRole) = 0)
				)
			)
			)
			THEN
			RETURN	 1;
	END IF;

RETURN	 0;

END

--模型设计表
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_de_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_de_databasechangelog`;
CREATE TABLE `act_de_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_databasechangelog
-- ---------------------------

-- ----------------------------
-- Table structure for act_de_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_de_databasechangeloglock`;
CREATE TABLE `act_de_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_databasechangeloglock
-- ----------------------------
INSERT INTO `act_de_databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for act_de_model
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model`;
CREATE TABLE `act_de_model` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `thumbnail` longblob,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_created` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for act_de_model_history
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model_history`;
CREATE TABLE `act_de_model_history` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `removal_date` datetime(6) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `model_id` varchar(255) NOT NULL,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_history_proc` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of act_de_model_history
-- ----------------------------

-- ----------------------------
-- Table structure for act_de_model_relation
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model_relation`;
CREATE TABLE `act_de_model_relation` (
  `id` varchar(255) NOT NULL,
  `parent_model_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relation_parent` (`parent_model_id`),
  KEY `fk_relation_child` (`model_id`),
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `act_de_model` (`id`),
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `act_de_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
