/*
 Navicat Premium Data Transfer

 Source Server         : localhost本机
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : workflow_system

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 10/09/2021 21:25:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-06-18 06:21:18', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', 'cykj123456', 'Y', 'admin', '2021-06-18 06:21:18', 'admin', '2021-06-25 06:28:50', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-06-18 06:21:18', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `area_id` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属区域',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0,100', '土豆科技', 0, '钟明晓', '15888888888', '17757144205@163.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-18 15:40:21');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100,101', '杭州总公司', 1, '钟明晓', '15888888888', '17757144205@163.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-18 15:40:54');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100,102', '上海分公司', 2, '钟明晓', '15888888888', '17757144205@163.om', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-18 15:42:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101,103', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101,104', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101,105', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101,106', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101,107', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102,108', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102,109', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', NULL, '0', 'admin', '2021-06-18 06:21:15', '', NULL);
INSERT INTO `sys_dept` VALUES (110, 100, '0,100,110', '调解机构一', 1, '刘燕', '15056565656', '15056565656@163.com', '0', NULL, '0', 'admin', '2021-08-04 01:54:44', '', NULL);
INSERT INTO `sys_dept` VALUES (111, 100, '0,100,111', '调解机构二', 2, '钟明晓', '15757575757', '15757575757@163.com', '0', NULL, '0', 'admin', '2021-08-04 01:55:16', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-06-18 06:21:18', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-06-18 06:21:17', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_district
-- ----------------------------
DROP TABLE IF EXISTS `sys_district`;
CREATE TABLE `sys_district`  (
  `district_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行政区划ID',
  `district_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行政区划编号',
  `district_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '行政区划名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父ID',
  `poltype` smallint(6) NOT NULL COMMENT '行政级别（POLTYPE）',
  `order_no` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`district_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区划' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-06-18 06:21:18', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-06-18 06:21:18', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-06-18 06:21:18', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 944 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '10.10.70.142', '0', '登录成功', '2021-06-18 09:03:44');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 03:00:54');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 04:58:34');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 05:31:53');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 06:34:20');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 07:03:50');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '172.31.2.118', '1', '用户密码错误', '2021-06-21 10:33:07');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '172.31.2.118', '1', '用户密码错误', '2021-06-21 10:33:11');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '172.31.2.118', '1', '用户密码错误', '2021-06-21 10:33:15');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 10:33:31');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '172.31.2.118', '1', '用户密码错误', '2021-06-21 11:01:04');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '172.31.2.118', '1', '用户密码错误', '2021-06-21 11:31:42');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-21 11:31:56');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-22 04:18:35');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '172.31.2.118', '1', '用户密码错误', '2021-06-23 02:13:08');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-23 02:14:28');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '172.31.2.118', '0', '登录成功', '2021-06-23 02:15:29');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-24 01:28:02');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-24 01:28:15');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-24 02:56:50');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-24 02:57:01');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '47.96.74.120', '0', '退出成功', '2021-06-24 07:13:00');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-24 07:14:43');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-24 10:01:19');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-24 11:53:49');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-24 14:16:27');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-25 01:16:12');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-25 06:25:39');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-25 06:28:13');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '47.96.74.120', '0', '退出成功', '2021-06-25 06:36:20');
INSERT INTO `sys_logininfor` VALUES (130, 'cs', '47.96.74.120', '1', '用户密码错误', '2021-06-25 06:36:39');
INSERT INTO `sys_logininfor` VALUES (131, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 06:36:47');
INSERT INTO `sys_logininfor` VALUES (132, 'cs', '47.96.74.120', '0', '退出成功', '2021-06-25 06:38:09');
INSERT INTO `sys_logininfor` VALUES (133, 'cs', '47.96.74.120', '1', '用户密码不在指定范围', '2021-06-25 06:57:47');
INSERT INTO `sys_logininfor` VALUES (134, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 06:58:50');
INSERT INTO `sys_logininfor` VALUES (135, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 07:01:19');
INSERT INTO `sys_logininfor` VALUES (136, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 07:07:19');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-25 07:17:26');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-25 07:18:46');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-25 07:20:32');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-25 07:22:56');
INSERT INTO `sys_logininfor` VALUES (141, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 07:27:43');
INSERT INTO `sys_logininfor` VALUES (142, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 07:27:48');
INSERT INTO `sys_logininfor` VALUES (143, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 07:28:06');
INSERT INTO `sys_logininfor` VALUES (144, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 07:28:40');
INSERT INTO `sys_logininfor` VALUES (145, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 08:01:49');
INSERT INTO `sys_logininfor` VALUES (146, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 08:12:13');
INSERT INTO `sys_logininfor` VALUES (147, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 08:15:33');
INSERT INTO `sys_logininfor` VALUES (148, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 08:20:17');
INSERT INTO `sys_logininfor` VALUES (149, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 08:51:18');
INSERT INTO `sys_logininfor` VALUES (150, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 09:09:28');
INSERT INTO `sys_logininfor` VALUES (151, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 09:11:13');
INSERT INTO `sys_logininfor` VALUES (152, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 09:11:51');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-25 09:11:57');
INSERT INTO `sys_logininfor` VALUES (154, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 09:16:17');
INSERT INTO `sys_logininfor` VALUES (155, 'cs', '47.96.74.120', '0', '登录成功', '2021-06-25 09:23:24');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-25 14:00:50');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-25 14:00:55');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-26 02:22:39');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-28 01:32:08');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-28 01:34:24');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-28 01:53:06');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-28 06:47:42');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-29 01:44:14');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-29 01:50:17');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-29 11:50:47');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 01:47:04');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 02:29:20');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 07:00:31');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '47.96.74.120', '1', '用户密码错误', '2021-06-30 09:03:15');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 09:03:32');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '47.96.74.120', '0', '退出成功', '2021-06-30 09:22:27');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 09:34:09');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 11:10:30');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 12:39:34');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '47.96.74.120', '0', '退出成功', '2021-06-30 13:12:35');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '47.96.74.120', '0', '登录成功', '2021-06-30 13:19:08');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-01 01:26:50');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-01 07:16:11');
INSERT INTO `sys_logininfor` VALUES (179, 'cs', '47.96.74.120', '0', '登录成功', '2021-07-02 01:56:15');
INSERT INTO `sys_logininfor` VALUES (180, 'cs', '47.96.74.120', '0', '退出成功', '2021-07-02 01:56:33');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-02 01:56:34');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-02 14:09:47');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-03 10:46:46');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-05 01:40:00');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-05 06:43:19');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-06 01:51:52');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '47.96.74.120', '0', '登录成功', '2021-07-06 02:00:34');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-06 04:35:25');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-06 05:11:10');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-06 05:11:31');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-06 06:40:08');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-07 01:04:26');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-07 01:39:02');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-08 01:31:44');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-08 03:02:28');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-08 05:38:15');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-08 05:38:25');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-08 05:41:42');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-08 07:08:56');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-08 07:54:16');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-09 01:40:16');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-09 01:57:06');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-09 07:39:46');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-11 02:42:05');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-12 02:24:48');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-12 02:27:41');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-12 02:27:51');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-12 02:28:02');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-12 07:10:08');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-12 07:30:19');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-13 01:45:00');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-13 03:24:28');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-13 07:54:43');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-13 10:21:17');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 01:35:45');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 01:35:53');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 03:03:41');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-14 04:05:16');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 04:05:25');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 05:41:47');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 06:21:36');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-14 06:32:08');
INSERT INTO `sys_logininfor` VALUES (223, 'cs', '47.105.165.206', '0', '登录成功', '2021-07-14 08:50:49');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 02:31:27');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-15 02:34:36');
INSERT INTO `sys_logininfor` VALUES (226, 'yckj', '47.105.165.206', '1', '用户密码不在指定范围', '2021-07-15 02:34:46');
INSERT INTO `sys_logininfor` VALUES (227, 'yckj', '47.105.165.206', '1', '用户密码不在指定范围', '2021-07-15 02:34:54');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-15 02:35:08');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 02:35:21');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-15 02:35:54');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-15 02:36:20');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 02:36:30');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-15 02:36:56');
INSERT INTO `sys_logininfor` VALUES (234, 'yckj', '47.105.165.206', '0', '登录成功', '2021-07-15 02:37:05');
INSERT INTO `sys_logininfor` VALUES (235, 'yckj', '47.105.165.206', '0', '退出成功', '2021-07-15 02:44:12');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-15 02:44:16');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 02:44:24');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-15 02:46:41');
INSERT INTO `sys_logininfor` VALUES (239, 'yckj', '47.105.165.206', '1', '用户密码错误', '2021-07-15 02:46:48');
INSERT INTO `sys_logininfor` VALUES (240, 'yckj', '47.105.165.206', '0', '登录成功', '2021-07-15 02:46:57');
INSERT INTO `sys_logininfor` VALUES (241, 'yckj', '47.105.165.206', '0', '退出成功', '2021-07-15 02:48:07');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 02:48:17');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-15 02:49:07');
INSERT INTO `sys_logininfor` VALUES (244, 'yckj', '47.105.165.206', '0', '登录成功', '2021-07-15 02:49:21');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 02:59:23');
INSERT INTO `sys_logininfor` VALUES (246, 'yckj', '47.105.165.206', '0', '退出成功', '2021-07-15 03:40:26');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 03:40:39');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 04:30:52');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 04:44:57');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-15 05:15:47');
INSERT INTO `sys_logininfor` VALUES (251, 'yckj', '47.105.165.206', '0', '登录成功', '2021-07-15 05:16:07');
INSERT INTO `sys_logininfor` VALUES (252, 'yckj', '47.105.165.206', '0', '退出成功', '2021-07-15 05:17:48');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 05:18:02');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 06:02:38');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 06:38:27');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 08:09:59');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 08:10:22');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 08:10:38');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 08:27:47');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 09:48:35');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-15 13:12:25');
INSERT INTO `sys_logininfor` VALUES (262, 'cs', '47.105.165.206', '0', '登录成功', '2021-07-16 01:31:14');
INSERT INTO `sys_logininfor` VALUES (263, 'cs', '47.105.165.206', '0', '退出成功', '2021-07-16 01:31:31');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 01:31:38');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 01:32:20');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 02:09:13');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 02:38:11');
INSERT INTO `sys_logininfor` VALUES (268, 'cs', '47.105.165.206', '0', '登录成功', '2021-07-16 02:38:35');
INSERT INTO `sys_logininfor` VALUES (269, 'cs', '47.105.165.206', '0', '退出成功', '2021-07-16 02:38:42');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 02:38:45');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 06:17:58');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-16 10:07:15');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-17 01:12:06');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-17 10:29:37');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-19 01:40:29');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-19 01:46:35');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-19 04:17:00');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-19 04:43:02');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-19 06:38:47');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-19 07:52:30');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-19 09:59:40');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 01:32:27');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 02:40:45');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 05:35:06');
INSERT INTO `sys_logininfor` VALUES (285, 'cs', '47.105.165.206', '0', '登录成功', '2021-07-20 05:42:00');
INSERT INTO `sys_logininfor` VALUES (286, 'cs', '47.105.165.206', '0', '退出成功', '2021-07-20 05:42:06');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 05:42:09');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-20 06:56:55');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 06:57:01');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 07:13:57');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 07:15:15');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-20 07:20:00');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 07:20:18');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 09:00:00');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-20 11:34:04');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 01:45:49');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 01:59:46');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 02:46:26');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-21 03:24:53');
INSERT INTO `sys_logininfor` VALUES (300, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-21 03:24:56');
INSERT INTO `sys_logininfor` VALUES (301, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-21 03:25:06');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 03:25:09');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-21 03:25:42');
INSERT INTO `sys_logininfor` VALUES (304, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-21 03:25:44');
INSERT INTO `sys_logininfor` VALUES (305, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-21 05:01:37');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 06:07:35');
INSERT INTO `sys_logininfor` VALUES (307, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-21 07:02:53');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 07:02:55');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 08:13:24');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 08:24:44');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '183.129.154.138', '0', '登录成功', '2021-07-21 08:29:36');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '183.129.154.138', '0', '登录成功', '2021-07-21 08:31:05');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 08:33:36');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 10:00:52');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-21 10:35:02');
INSERT INTO `sys_logininfor` VALUES (316, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-21 10:35:05');
INSERT INTO `sys_logininfor` VALUES (317, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-21 10:35:10');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 10:35:13');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-21 10:36:02');
INSERT INTO `sys_logininfor` VALUES (320, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-21 10:36:05');
INSERT INTO `sys_logininfor` VALUES (321, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-21 10:48:03');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 10:48:06');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-21 10:51:53');
INSERT INTO `sys_logininfor` VALUES (324, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-21 10:51:56');
INSERT INTO `sys_logininfor` VALUES (325, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-21 14:42:11');
INSERT INTO `sys_logininfor` VALUES (326, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-21 15:42:15');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-21 15:42:19');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 01:14:14');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 06:22:07');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 06:33:58');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 06:47:20');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 06:50:59');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 06:54:59');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-22 07:05:11');
INSERT INTO `sys_logininfor` VALUES (335, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-22 07:05:14');
INSERT INTO `sys_logininfor` VALUES (336, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-22 07:17:34');
INSERT INTO `sys_logininfor` VALUES (337, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-22 07:18:04');
INSERT INTO `sys_logininfor` VALUES (338, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-22 07:18:07');
INSERT INTO `sys_logininfor` VALUES (339, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-22 07:18:38');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 07:18:41');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 08:10:01');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-22 14:00:14');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 01:25:31');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 01:30:35');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 02:47:18');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 03:23:25');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-23 09:29:27');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 09:29:37');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 09:37:10');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 10:20:30');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-23 14:18:43');
INSERT INTO `sys_logininfor` VALUES (352, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-23 14:18:47');
INSERT INTO `sys_logininfor` VALUES (353, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-23 14:19:59');
INSERT INTO `sys_logininfor` VALUES (354, 'xujiu', '47.105.165.206', '0', '登录成功', '2021-07-23 14:20:02');
INSERT INTO `sys_logininfor` VALUES (355, 'xujiu', '47.105.165.206', '0', '退出成功', '2021-07-23 14:20:23');
INSERT INTO `sys_logininfor` VALUES (356, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-23 14:20:26');
INSERT INTO `sys_logininfor` VALUES (357, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-23 14:21:12');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 14:21:14');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-23 14:30:23');
INSERT INTO `sys_logininfor` VALUES (360, 'zhaoliu', '47.105.165.206', '0', '登录成功', '2021-07-23 14:30:26');
INSERT INTO `sys_logininfor` VALUES (361, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-23 15:02:13');
INSERT INTO `sys_logininfor` VALUES (362, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-23 15:03:09');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 15:03:11');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-23 15:03:37');
INSERT INTO `sys_logininfor` VALUES (365, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-23 15:03:39');
INSERT INTO `sys_logininfor` VALUES (366, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-23 15:05:09');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 15:05:12');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-23 15:05:35');
INSERT INTO `sys_logininfor` VALUES (369, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-23 15:05:43');
INSERT INTO `sys_logininfor` VALUES (370, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-23 15:06:35');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-23 15:06:37');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 06:42:25');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 07:56:22');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 08:20:24');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 08:46:41');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 08:46:54');
INSERT INTO `sys_logininfor` VALUES (377, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 08:46:56');
INSERT INTO `sys_logininfor` VALUES (378, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 08:47:21');
INSERT INTO `sys_logininfor` VALUES (379, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-24 08:47:23');
INSERT INTO `sys_logininfor` VALUES (380, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-24 08:47:56');
INSERT INTO `sys_logininfor` VALUES (381, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 08:47:59');
INSERT INTO `sys_logininfor` VALUES (382, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 08:48:19');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 08:48:22');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 08:49:15');
INSERT INTO `sys_logininfor` VALUES (385, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 08:49:17');
INSERT INTO `sys_logininfor` VALUES (386, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 08:57:02');
INSERT INTO `sys_logininfor` VALUES (387, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-24 08:57:05');
INSERT INTO `sys_logininfor` VALUES (388, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-24 08:57:29');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 08:57:31');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 08:59:00');
INSERT INTO `sys_logininfor` VALUES (391, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 08:59:02');
INSERT INTO `sys_logininfor` VALUES (392, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:13:10');
INSERT INTO `sys_logininfor` VALUES (393, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-24 09:13:12');
INSERT INTO `sys_logininfor` VALUES (394, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-24 09:13:36');
INSERT INTO `sys_logininfor` VALUES (395, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:13:39');
INSERT INTO `sys_logininfor` VALUES (396, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:13:50');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 09:13:55');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 09:14:15');
INSERT INTO `sys_logininfor` VALUES (399, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:14:18');
INSERT INTO `sys_logininfor` VALUES (400, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:15:34');
INSERT INTO `sys_logininfor` VALUES (401, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-24 09:15:37');
INSERT INTO `sys_logininfor` VALUES (402, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-24 09:16:12');
INSERT INTO `sys_logininfor` VALUES (403, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:16:14');
INSERT INTO `sys_logininfor` VALUES (404, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:22:13');
INSERT INTO `sys_logininfor` VALUES (405, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-24 09:22:16');
INSERT INTO `sys_logininfor` VALUES (406, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-24 09:22:46');
INSERT INTO `sys_logininfor` VALUES (407, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:22:49');
INSERT INTO `sys_logininfor` VALUES (408, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:22:58');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 09:23:03');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 09:30:18');
INSERT INTO `sys_logininfor` VALUES (411, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:30:20');
INSERT INTO `sys_logininfor` VALUES (412, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:32:21');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 09:32:26');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 09:35:40');
INSERT INTO `sys_logininfor` VALUES (415, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:35:42');
INSERT INTO `sys_logininfor` VALUES (416, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:36:04');
INSERT INTO `sys_logininfor` VALUES (417, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-24 09:36:06');
INSERT INTO `sys_logininfor` VALUES (418, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-24 09:36:20');
INSERT INTO `sys_logininfor` VALUES (419, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 09:36:23');
INSERT INTO `sys_logininfor` VALUES (420, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 09:36:40');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 09:36:42');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-24 13:51:35');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-24 13:51:41');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 14:20:00');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-24 14:27:53');
INSERT INTO `sys_logininfor` VALUES (426, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-24 14:28:13');
INSERT INTO `sys_logininfor` VALUES (427, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-24 14:29:01');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-24 14:29:13');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-25 01:02:40');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-25 01:06:58');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-25 01:47:13');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-25 05:09:02');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-25 10:10:38');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 01:24:03');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 04:17:24');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-26 05:06:05');
INSERT INTO `sys_logininfor` VALUES (437, 'zhangsan', '47.105.165.206', '1', '用户密码错误', '2021-07-26 05:06:17');
INSERT INTO `sys_logininfor` VALUES (438, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-26 05:06:40');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 06:40:40');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-26 06:44:40');
INSERT INTO `sys_logininfor` VALUES (441, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-26 06:44:52');
INSERT INTO `sys_logininfor` VALUES (442, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-26 06:47:01');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 06:47:04');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 07:45:43');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 07:45:56');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-26 09:00:53');
INSERT INTO `sys_logininfor` VALUES (447, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-26 09:00:56');
INSERT INTO `sys_logininfor` VALUES (448, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-07-26 09:01:15');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 09:01:33');
INSERT INTO `sys_logininfor` VALUES (450, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-07-26 09:01:33');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 09:01:35');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-26 12:23:05');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-27 01:39:58');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-27 01:40:15');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-27 01:40:28');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-27 02:09:26');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-07-27 04:03:16');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 01:53:12');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 02:13:18');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 03:07:13');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 05:31:42');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 07:23:02');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 13:51:57');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-28 14:04:40');
INSERT INTO `sys_logininfor` VALUES (465, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-28 14:04:44');
INSERT INTO `sys_logininfor` VALUES (466, 'lisi', '47.105.165.206', '0', '退出成功', '2021-07-28 14:09:02');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-28 14:09:05');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '47.105.165.206', '0', '退出成功', '2021-07-28 14:15:21');
INSERT INTO `sys_logininfor` VALUES (469, 'lisi', '47.105.165.206', '0', '登录成功', '2021-07-28 14:15:24');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-29 01:57:08');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-29 10:09:57');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-30 02:30:59');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-30 08:48:54');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-31 01:12:31');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '47.105.165.206', '0', '登录成功', '2021-07-31 08:18:34');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 01:31:08');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:07:13');
INSERT INTO `sys_logininfor` VALUES (478, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-08-02 08:39:21');
INSERT INTO `sys_logininfor` VALUES (479, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-08-02 08:40:27');
INSERT INTO `sys_logininfor` VALUES (480, 'lisi', '47.105.165.206', '0', '登录成功', '2021-08-02 08:40:29');
INSERT INTO `sys_logininfor` VALUES (481, 'lisi', '47.105.165.206', '0', '退出成功', '2021-08-02 08:40:55');
INSERT INTO `sys_logininfor` VALUES (482, 'wangwu', '47.105.165.206', '0', '登录成功', '2021-08-02 08:40:58');
INSERT INTO `sys_logininfor` VALUES (483, 'wangwu', '47.105.165.206', '0', '退出成功', '2021-08-02 08:45:41');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:45:44');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:47:58');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:48:01');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:48:49');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:48:52');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:49:23');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:49:25');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:50:30');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:50:33');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:51:00');
INSERT INTO `sys_logininfor` VALUES (494, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:51:03');
INSERT INTO `sys_logininfor` VALUES (495, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:54:39');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:54:42');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:56:12');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 08:56:37');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-02 08:57:05');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 09:54:36');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-02 13:47:20');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 01:18:48');
INSERT INTO `sys_logininfor` VALUES (503, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-03 01:21:04');
INSERT INTO `sys_logininfor` VALUES (504, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 01:21:25');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-03 01:27:18');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 01:27:22');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 02:11:27');
INSERT INTO `sys_logininfor` VALUES (508, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-03 03:55:42');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 05:40:21');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 06:22:07');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 07:16:44');
INSERT INTO `sys_logininfor` VALUES (512, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-03 13:44:18');
INSERT INTO `sys_logininfor` VALUES (513, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 01:24:53');
INSERT INTO `sys_logininfor` VALUES (514, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 01:53:20');
INSERT INTO `sys_logininfor` VALUES (515, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 02:27:01');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 05:41:13');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 05:41:17');
INSERT INTO `sys_logininfor` VALUES (518, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 06:16:34');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 06:22:46');
INSERT INTO `sys_logininfor` VALUES (520, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 06:22:54');
INSERT INTO `sys_logininfor` VALUES (521, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 06:23:13');
INSERT INTO `sys_logininfor` VALUES (522, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-04 06:24:11');
INSERT INTO `sys_logininfor` VALUES (523, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 06:24:31');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 06:24:35');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 07:31:29');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 08:45:51');
INSERT INTO `sys_logininfor` VALUES (527, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-04 10:14:08');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 11:20:11');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 11:20:26');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-04 11:48:27');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-05 01:32:35');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-05 02:40:43');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-05 05:39:13');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-05 05:40:32');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-05 12:04:48');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-05 12:05:09');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-06 01:20:02');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-06 01:28:11');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-06 02:08:42');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-06 02:08:49');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '47.105.165.206', '1', '用户/密码必须填写', '2021-08-06 03:30:23');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '47.105.165.206', '1', '用户/密码必须填写', '2021-08-06 03:34:33');
INSERT INTO `sys_logininfor` VALUES (543, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-06 03:37:10');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-06 06:06:24');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-06 10:12:38');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 01:29:11');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 03:40:14');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 05:32:20');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 05:55:32');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 06:29:53');
INSERT INTO `sys_logininfor` VALUES (551, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 06:54:18');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 07:38:39');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 07:39:53');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 07:54:52');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 08:27:03');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-09 09:01:29');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 01:24:12');
INSERT INTO `sys_logininfor` VALUES (558, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 01:24:19');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 05:57:14');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 06:07:09');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 06:29:57');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 07:12:51');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 07:26:09');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-10 08:03:31');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 02:01:14');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 03:32:58');
INSERT INTO `sys_logininfor` VALUES (567, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-11 06:29:28');
INSERT INTO `sys_logininfor` VALUES (568, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 06:31:52');
INSERT INTO `sys_logininfor` VALUES (569, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 06:49:37');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 06:52:34');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 06:54:31');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 06:56:51');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 06:58:20');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 07:07:50');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 07:26:27');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 07:40:27');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 07:41:40');
INSERT INTO `sys_logininfor` VALUES (578, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 07:44:07');
INSERT INTO `sys_logininfor` VALUES (579, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 07:51:17');
INSERT INTO `sys_logininfor` VALUES (580, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 07:51:18');
INSERT INTO `sys_logininfor` VALUES (581, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-11 07:56:00');
INSERT INTO `sys_logininfor` VALUES (582, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 07:56:12');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 08:05:49');
INSERT INTO `sys_logininfor` VALUES (584, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 08:24:23');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 08:28:45');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 08:32:25');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:14:15');
INSERT INTO `sys_logininfor` VALUES (588, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:14:24');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:30:04');
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:33:22');
INSERT INTO `sys_logininfor` VALUES (591, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:33:43');
INSERT INTO `sys_logininfor` VALUES (592, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:36:03');
INSERT INTO `sys_logininfor` VALUES (593, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:39:55');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:42:47');
INSERT INTO `sys_logininfor` VALUES (595, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:42:56');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:43:28');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:43:40');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:44:33');
INSERT INTO `sys_logininfor` VALUES (599, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:45:15');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:46:50');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-11 09:47:23');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 01:22:03');
INSERT INTO `sys_logininfor` VALUES (603, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 02:24:04');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 02:59:48');
INSERT INTO `sys_logininfor` VALUES (605, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 05:48:52');
INSERT INTO `sys_logininfor` VALUES (606, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 12:54:05');
INSERT INTO `sys_logininfor` VALUES (607, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 13:13:12');
INSERT INTO `sys_logininfor` VALUES (608, 'cs', '47.105.165.206', '0', '登录成功', '2021-08-12 13:57:12');
INSERT INTO `sys_logininfor` VALUES (609, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 13:58:24');
INSERT INTO `sys_logininfor` VALUES (610, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-12 13:59:27');
INSERT INTO `sys_logininfor` VALUES (611, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 13:59:32');
INSERT INTO `sys_logininfor` VALUES (612, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-08-12 13:59:52');
INSERT INTO `sys_logininfor` VALUES (613, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 14:01:09');
INSERT INTO `sys_logininfor` VALUES (614, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 14:02:08');
INSERT INTO `sys_logininfor` VALUES (615, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-12 14:06:03');
INSERT INTO `sys_logininfor` VALUES (616, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 01:24:48');
INSERT INTO `sys_logininfor` VALUES (617, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 01:56:32');
INSERT INTO `sys_logininfor` VALUES (618, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 02:01:18');
INSERT INTO `sys_logininfor` VALUES (619, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 02:36:55');
INSERT INTO `sys_logininfor` VALUES (620, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 05:52:57');
INSERT INTO `sys_logininfor` VALUES (621, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 09:42:51');
INSERT INTO `sys_logininfor` VALUES (622, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-13 14:06:41');
INSERT INTO `sys_logininfor` VALUES (623, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-15 08:50:41');
INSERT INTO `sys_logininfor` VALUES (624, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-16 01:38:50');
INSERT INTO `sys_logininfor` VALUES (625, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-16 01:38:56');
INSERT INTO `sys_logininfor` VALUES (626, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-16 01:39:02');
INSERT INTO `sys_logininfor` VALUES (627, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-16 03:59:32');
INSERT INTO `sys_logininfor` VALUES (628, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-16 05:52:20');
INSERT INTO `sys_logininfor` VALUES (629, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-16 08:13:18');
INSERT INTO `sys_logininfor` VALUES (630, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-16 09:11:20');
INSERT INTO `sys_logininfor` VALUES (631, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-17 01:19:48');
INSERT INTO `sys_logininfor` VALUES (632, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-17 01:31:22');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-17 02:22:58');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-17 08:21:44');
INSERT INTO `sys_logininfor` VALUES (635, 'wangwu', '47.105.165.206', '0', '登录成功', '2021-08-17 08:21:48');
INSERT INTO `sys_logininfor` VALUES (636, 'wangwu', '47.105.165.206', '0', '退出成功', '2021-08-17 09:05:50');
INSERT INTO `sys_logininfor` VALUES (637, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-17 09:05:54');
INSERT INTO `sys_logininfor` VALUES (638, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-17 09:41:11');
INSERT INTO `sys_logininfor` VALUES (639, 'wangwu', '47.105.165.206', '0', '登录成功', '2021-08-17 09:41:15');
INSERT INTO `sys_logininfor` VALUES (640, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-17 09:55:01');
INSERT INTO `sys_logininfor` VALUES (641, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-18 08:28:16');
INSERT INTO `sys_logininfor` VALUES (642, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-18 08:35:09');
INSERT INTO `sys_logininfor` VALUES (643, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-18 08:35:20');
INSERT INTO `sys_logininfor` VALUES (644, 'wangwu', '47.105.165.206', '0', '登录成功', '2021-08-18 08:35:24');
INSERT INTO `sys_logininfor` VALUES (645, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 03:48:45');
INSERT INTO `sys_logininfor` VALUES (646, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 04:00:00');
INSERT INTO `sys_logininfor` VALUES (647, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-19 04:00:01');
INSERT INTO `sys_logininfor` VALUES (648, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-08-19 04:00:20');
INSERT INTO `sys_logininfor` VALUES (649, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-08-19 04:00:21');
INSERT INTO `sys_logininfor` VALUES (650, 'lisi', '47.105.165.206', '0', '登录成功', '2021-08-19 04:01:49');
INSERT INTO `sys_logininfor` VALUES (651, 'lisi', '47.105.165.206', '0', '退出成功', '2021-08-19 04:01:49');
INSERT INTO `sys_logininfor` VALUES (652, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-19 04:44:46');
INSERT INTO `sys_logininfor` VALUES (653, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 04:44:55');
INSERT INTO `sys_logininfor` VALUES (654, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 05:34:46');
INSERT INTO `sys_logininfor` VALUES (655, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-19 05:34:58');
INSERT INTO `sys_logininfor` VALUES (656, 'wangwu', '47.105.165.206', '0', '登录成功', '2021-08-19 05:35:02');
INSERT INTO `sys_logininfor` VALUES (657, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 05:38:49');
INSERT INTO `sys_logininfor` VALUES (658, 'wangwu', '47.105.165.206', '0', '退出成功', '2021-08-19 05:51:00');
INSERT INTO `sys_logininfor` VALUES (659, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 05:51:03');
INSERT INTO `sys_logininfor` VALUES (660, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 06:49:36');
INSERT INTO `sys_logininfor` VALUES (661, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-19 08:56:40');
INSERT INTO `sys_logininfor` VALUES (662, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-20 05:38:39');
INSERT INTO `sys_logininfor` VALUES (663, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-20 05:45:38');
INSERT INTO `sys_logininfor` VALUES (664, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-20 06:25:51');
INSERT INTO `sys_logininfor` VALUES (665, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-20 08:04:05');
INSERT INTO `sys_logininfor` VALUES (666, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-21 05:47:39');
INSERT INTO `sys_logininfor` VALUES (667, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-21 07:34:34');
INSERT INTO `sys_logininfor` VALUES (668, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-21 07:37:30');
INSERT INTO `sys_logininfor` VALUES (669, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-23 01:36:42');
INSERT INTO `sys_logininfor` VALUES (670, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-23 02:24:47');
INSERT INTO `sys_logininfor` VALUES (671, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-23 02:24:51');
INSERT INTO `sys_logininfor` VALUES (672, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-23 02:43:43');
INSERT INTO `sys_logininfor` VALUES (673, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-23 09:54:02');
INSERT INTO `sys_logininfor` VALUES (674, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 01:17:20');
INSERT INTO `sys_logininfor` VALUES (675, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 01:37:00');
INSERT INTO `sys_logininfor` VALUES (676, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 03:41:52');
INSERT INTO `sys_logininfor` VALUES (677, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 05:34:48');
INSERT INTO `sys_logininfor` VALUES (678, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 06:30:56');
INSERT INTO `sys_logininfor` VALUES (679, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 07:54:06');
INSERT INTO `sys_logininfor` VALUES (680, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-24 09:49:54');
INSERT INTO `sys_logininfor` VALUES (681, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 01:33:53');
INSERT INTO `sys_logininfor` VALUES (682, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 03:08:15');
INSERT INTO `sys_logininfor` VALUES (683, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 05:58:45');
INSERT INTO `sys_logininfor` VALUES (684, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 06:47:57');
INSERT INTO `sys_logininfor` VALUES (685, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 07:39:21');
INSERT INTO `sys_logininfor` VALUES (686, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 08:01:00');
INSERT INTO `sys_logininfor` VALUES (687, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 08:08:47');
INSERT INTO `sys_logininfor` VALUES (688, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-25 08:16:15');
INSERT INTO `sys_logininfor` VALUES (689, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-25 08:42:40');
INSERT INTO `sys_logininfor` VALUES (690, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-08-25 08:42:42');
INSERT INTO `sys_logininfor` VALUES (691, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-25 10:38:37');
INSERT INTO `sys_logininfor` VALUES (692, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 01:44:38');
INSERT INTO `sys_logininfor` VALUES (693, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 02:04:16');
INSERT INTO `sys_logininfor` VALUES (694, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 02:19:20');
INSERT INTO `sys_logininfor` VALUES (695, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 02:59:00');
INSERT INTO `sys_logininfor` VALUES (696, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 03:45:38');
INSERT INTO `sys_logininfor` VALUES (697, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 05:20:20');
INSERT INTO `sys_logininfor` VALUES (698, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 06:13:57');
INSERT INTO `sys_logininfor` VALUES (699, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 09:12:22');
INSERT INTO `sys_logininfor` VALUES (700, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 09:13:22');
INSERT INTO `sys_logininfor` VALUES (701, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-26 13:16:01');
INSERT INTO `sys_logininfor` VALUES (702, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 01:34:30');
INSERT INTO `sys_logininfor` VALUES (703, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-27 01:54:57');
INSERT INTO `sys_logininfor` VALUES (704, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 01:55:05');
INSERT INTO `sys_logininfor` VALUES (705, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-27 02:02:34');
INSERT INTO `sys_logininfor` VALUES (706, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 02:03:06');
INSERT INTO `sys_logininfor` VALUES (707, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 03:41:27');
INSERT INTO `sys_logininfor` VALUES (708, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 03:48:10');
INSERT INTO `sys_logininfor` VALUES (709, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-08-27 05:49:36');
INSERT INTO `sys_logininfor` VALUES (710, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 05:49:44');
INSERT INTO `sys_logininfor` VALUES (711, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 05:50:02');
INSERT INTO `sys_logininfor` VALUES (712, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 06:19:00');
INSERT INTO `sys_logininfor` VALUES (713, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 06:47:08');
INSERT INTO `sys_logininfor` VALUES (714, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 06:51:01');
INSERT INTO `sys_logininfor` VALUES (715, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 10:03:50');
INSERT INTO `sys_logininfor` VALUES (716, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-27 13:37:04');
INSERT INTO `sys_logininfor` VALUES (717, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-28 08:29:21');
INSERT INTO `sys_logininfor` VALUES (718, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-28 14:13:07');
INSERT INTO `sys_logininfor` VALUES (719, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-28 14:13:24');
INSERT INTO `sys_logininfor` VALUES (720, 'lisi', '47.105.165.206', '0', '登录成功', '2021-08-28 14:13:27');
INSERT INTO `sys_logininfor` VALUES (721, 'lisi', '47.105.165.206', '0', '退出成功', '2021-08-28 14:17:53');
INSERT INTO `sys_logininfor` VALUES (722, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-28 14:17:57');
INSERT INTO `sys_logininfor` VALUES (723, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-28 14:19:18');
INSERT INTO `sys_logininfor` VALUES (724, 'lisi', '47.105.165.206', '0', '登录成功', '2021-08-28 14:19:21');
INSERT INTO `sys_logininfor` VALUES (725, 'lisi', '47.105.165.206', '0', '退出成功', '2021-08-28 14:21:44');
INSERT INTO `sys_logininfor` VALUES (726, 'wangwu', '47.105.165.206', '0', '登录成功', '2021-08-28 14:21:48');
INSERT INTO `sys_logininfor` VALUES (727, 'wangwu', '47.105.165.206', '0', '退出成功', '2021-08-28 14:22:15');
INSERT INTO `sys_logininfor` VALUES (728, 'zhaoliu', '47.105.165.206', '0', '登录成功', '2021-08-28 14:22:20');
INSERT INTO `sys_logininfor` VALUES (729, 'zhaoliu', '47.105.165.206', '0', '退出成功', '2021-08-28 14:22:38');
INSERT INTO `sys_logininfor` VALUES (730, 'chenqi', '47.105.165.206', '0', '登录成功', '2021-08-28 14:22:43');
INSERT INTO `sys_logininfor` VALUES (731, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-29 05:30:27');
INSERT INTO `sys_logininfor` VALUES (732, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-29 05:34:52');
INSERT INTO `sys_logininfor` VALUES (733, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-29 05:35:23');
INSERT INTO `sys_logininfor` VALUES (734, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-29 05:37:25');
INSERT INTO `sys_logininfor` VALUES (735, 'zhangsan', '47.105.165.206', '0', '登录成功', '2021-08-29 05:37:34');
INSERT INTO `sys_logininfor` VALUES (736, 'zhangsan', '47.105.165.206', '0', '退出成功', '2021-08-29 05:37:53');
INSERT INTO `sys_logininfor` VALUES (737, 'lisi', '47.105.165.206', '0', '登录成功', '2021-08-29 05:37:56');
INSERT INTO `sys_logininfor` VALUES (738, 'lisi', '47.105.165.206', '0', '退出成功', '2021-08-29 05:38:29');
INSERT INTO `sys_logininfor` VALUES (739, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-29 05:38:32');
INSERT INTO `sys_logininfor` VALUES (740, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-30 01:21:18');
INSERT INTO `sys_logininfor` VALUES (741, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-30 05:39:34');
INSERT INTO `sys_logininfor` VALUES (742, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-30 10:04:00');
INSERT INTO `sys_logininfor` VALUES (743, 'admin', '47.105.165.206', '0', '退出成功', '2021-08-30 10:11:18');
INSERT INTO `sys_logininfor` VALUES (744, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-30 10:12:27');
INSERT INTO `sys_logininfor` VALUES (745, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-30 11:48:54');
INSERT INTO `sys_logininfor` VALUES (746, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-31 01:16:57');
INSERT INTO `sys_logininfor` VALUES (747, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-31 01:27:49');
INSERT INTO `sys_logininfor` VALUES (748, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-31 01:53:03');
INSERT INTO `sys_logininfor` VALUES (749, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-31 03:49:53');
INSERT INTO `sys_logininfor` VALUES (750, 'admin', '47.105.165.206', '0', '登录成功', '2021-08-31 04:00:18');
INSERT INTO `sys_logininfor` VALUES (751, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-01 02:20:55');
INSERT INTO `sys_logininfor` VALUES (752, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-01 05:56:07');
INSERT INTO `sys_logininfor` VALUES (753, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-01 08:05:00');
INSERT INTO `sys_logininfor` VALUES (754, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 01:32:04');
INSERT INTO `sys_logininfor` VALUES (755, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 01:43:50');
INSERT INTO `sys_logininfor` VALUES (756, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 02:05:47');
INSERT INTO `sys_logininfor` VALUES (757, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 02:42:04');
INSERT INTO `sys_logininfor` VALUES (758, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 03:20:35');
INSERT INTO `sys_logininfor` VALUES (759, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 03:49:52');
INSERT INTO `sys_logininfor` VALUES (760, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 05:48:03');
INSERT INTO `sys_logininfor` VALUES (761, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 06:04:42');
INSERT INTO `sys_logininfor` VALUES (762, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 06:54:29');
INSERT INTO `sys_logininfor` VALUES (763, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 07:17:50');
INSERT INTO `sys_logininfor` VALUES (764, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 07:32:17');
INSERT INTO `sys_logininfor` VALUES (765, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 09:07:38');
INSERT INTO `sys_logininfor` VALUES (766, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 09:27:29');
INSERT INTO `sys_logininfor` VALUES (767, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-02 09:42:44');
INSERT INTO `sys_logininfor` VALUES (768, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 01:58:40');
INSERT INTO `sys_logininfor` VALUES (769, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 02:12:27');
INSERT INTO `sys_logininfor` VALUES (770, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 03:16:32');
INSERT INTO `sys_logininfor` VALUES (771, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 07:22:05');
INSERT INTO `sys_logininfor` VALUES (772, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 08:46:47');
INSERT INTO `sys_logininfor` VALUES (773, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 09:24:10');
INSERT INTO `sys_logininfor` VALUES (774, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-09-03 09:39:29');
INSERT INTO `sys_logininfor` VALUES (775, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-09-03 09:39:39');
INSERT INTO `sys_logininfor` VALUES (776, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-09-03 09:40:43');
INSERT INTO `sys_logininfor` VALUES (777, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-03 10:22:47');
INSERT INTO `sys_logininfor` VALUES (778, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-03 10:23:02');
INSERT INTO `sys_logininfor` VALUES (779, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-03 10:23:13');
INSERT INTO `sys_logininfor` VALUES (780, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 10:23:23');
INSERT INTO `sys_logininfor` VALUES (781, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-03 10:24:01');
INSERT INTO `sys_logininfor` VALUES (782, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-03 10:24:12');
INSERT INTO `sys_logininfor` VALUES (783, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 13:15:58');
INSERT INTO `sys_logininfor` VALUES (784, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 13:23:14');
INSERT INTO `sys_logininfor` VALUES (785, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-03 14:27:25');
INSERT INTO `sys_logininfor` VALUES (786, 'yckj', '47.105.165.206', '0', '登录成功', '2021-09-03 14:27:30');
INSERT INTO `sys_logininfor` VALUES (787, 'yckj', '47.105.165.206', '0', '退出成功', '2021-09-03 14:35:03');
INSERT INTO `sys_logininfor` VALUES (788, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-03 14:35:06');
INSERT INTO `sys_logininfor` VALUES (789, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-03 14:36:25');
INSERT INTO `sys_logininfor` VALUES (790, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-03 14:36:45');
INSERT INTO `sys_logininfor` VALUES (791, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-09-03 14:47:28');
INSERT INTO `sys_logininfor` VALUES (792, 'cs', '47.105.165.206', '1', '用户密码错误', '2021-09-03 14:47:33');
INSERT INTO `sys_logininfor` VALUES (793, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-03 14:47:43');
INSERT INTO `sys_logininfor` VALUES (794, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-03 14:48:43');
INSERT INTO `sys_logininfor` VALUES (795, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 02:42:25');
INSERT INTO `sys_logininfor` VALUES (796, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-04 02:45:43');
INSERT INTO `sys_logininfor` VALUES (797, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 02:45:58');
INSERT INTO `sys_logininfor` VALUES (798, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-04 02:53:48');
INSERT INTO `sys_logininfor` VALUES (799, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 02:53:51');
INSERT INTO `sys_logininfor` VALUES (800, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 04:03:45');
INSERT INTO `sys_logininfor` VALUES (801, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 04:07:10');
INSERT INTO `sys_logininfor` VALUES (802, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 04:08:52');
INSERT INTO `sys_logininfor` VALUES (803, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 04:22:32');
INSERT INTO `sys_logininfor` VALUES (804, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 05:11:31');
INSERT INTO `sys_logininfor` VALUES (805, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 05:25:32');
INSERT INTO `sys_logininfor` VALUES (806, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 05:27:03');
INSERT INTO `sys_logininfor` VALUES (807, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 05:30:45');
INSERT INTO `sys_logininfor` VALUES (808, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 05:33:31');
INSERT INTO `sys_logininfor` VALUES (809, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 06:05:33');
INSERT INTO `sys_logininfor` VALUES (810, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:09:21');
INSERT INTO `sys_logininfor` VALUES (811, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:11:30');
INSERT INTO `sys_logininfor` VALUES (812, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:13:39');
INSERT INTO `sys_logininfor` VALUES (813, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-04 06:18:26');
INSERT INTO `sys_logininfor` VALUES (814, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:18:32');
INSERT INTO `sys_logininfor` VALUES (815, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:42:02');
INSERT INTO `sys_logininfor` VALUES (816, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:51:22');
INSERT INTO `sys_logininfor` VALUES (817, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 06:51:51');
INSERT INTO `sys_logininfor` VALUES (818, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 09:04:05');
INSERT INTO `sys_logininfor` VALUES (819, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 09:09:10');
INSERT INTO `sys_logininfor` VALUES (820, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 09:09:54');
INSERT INTO `sys_logininfor` VALUES (821, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 14:00:13');
INSERT INTO `sys_logininfor` VALUES (822, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 14:36:09');
INSERT INTO `sys_logininfor` VALUES (823, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 14:54:25');
INSERT INTO `sys_logininfor` VALUES (824, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-04 15:11:58');
INSERT INTO `sys_logininfor` VALUES (825, 'yckj', '47.105.165.206', '0', '登录成功', '2021-09-04 15:12:00');
INSERT INTO `sys_logininfor` VALUES (826, 'yckj', '47.105.165.206', '0', '退出成功', '2021-09-04 15:15:35');
INSERT INTO `sys_logininfor` VALUES (827, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 15:15:37');
INSERT INTO `sys_logininfor` VALUES (828, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-04 15:17:21');
INSERT INTO `sys_logininfor` VALUES (829, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-04 15:17:29');
INSERT INTO `sys_logininfor` VALUES (830, 'cs', '47.105.165.206', '1', '用户密码错误', '2021-09-04 15:17:32');
INSERT INTO `sys_logininfor` VALUES (831, 'cs', '47.105.165.206', '1', '用户密码错误', '2021-09-04 15:17:34');
INSERT INTO `sys_logininfor` VALUES (832, 'yckj', '47.105.165.206', '0', '登录成功', '2021-09-04 15:17:36');
INSERT INTO `sys_logininfor` VALUES (833, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 15:31:22');
INSERT INTO `sys_logininfor` VALUES (834, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-04 16:05:00');
INSERT INTO `sys_logininfor` VALUES (835, 'admin', '47.105.165.206', '1', '用户密码错误', '2021-09-04 16:05:08');
INSERT INTO `sys_logininfor` VALUES (836, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 16:05:14');
INSERT INTO `sys_logininfor` VALUES (837, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-04 16:12:02');
INSERT INTO `sys_logininfor` VALUES (838, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 16:12:05');
INSERT INTO `sys_logininfor` VALUES (839, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-04 16:12:19');
INSERT INTO `sys_logininfor` VALUES (840, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-04 16:12:36');
INSERT INTO `sys_logininfor` VALUES (841, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-04 16:13:45');
INSERT INTO `sys_logininfor` VALUES (842, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-05 11:36:26');
INSERT INTO `sys_logininfor` VALUES (843, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-05 12:14:00');
INSERT INTO `sys_logininfor` VALUES (844, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-05 12:15:33');
INSERT INTO `sys_logininfor` VALUES (845, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-05 12:15:48');
INSERT INTO `sys_logininfor` VALUES (846, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-05 12:16:00');
INSERT INTO `sys_logininfor` VALUES (847, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-05 12:27:31');
INSERT INTO `sys_logininfor` VALUES (848, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-05 12:34:45');
INSERT INTO `sys_logininfor` VALUES (849, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-05 12:34:51');
INSERT INTO `sys_logininfor` VALUES (850, 'admin', '47.105.165.206', '0', '退出成功', '2021-09-05 12:48:39');
INSERT INTO `sys_logininfor` VALUES (851, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-05 12:48:43');
INSERT INTO `sys_logininfor` VALUES (852, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-05 14:56:05');
INSERT INTO `sys_logininfor` VALUES (853, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-06 01:25:05');
INSERT INTO `sys_logininfor` VALUES (854, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 01:31:18');
INSERT INTO `sys_logininfor` VALUES (855, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 01:31:46');
INSERT INTO `sys_logininfor` VALUES (856, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 02:20:52');
INSERT INTO `sys_logininfor` VALUES (857, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 02:21:00');
INSERT INTO `sys_logininfor` VALUES (858, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 02:23:21');
INSERT INTO `sys_logininfor` VALUES (859, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 02:25:32');
INSERT INTO `sys_logininfor` VALUES (860, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 02:29:25');
INSERT INTO `sys_logininfor` VALUES (861, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 03:50:09');
INSERT INTO `sys_logininfor` VALUES (862, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 05:31:14');
INSERT INTO `sys_logininfor` VALUES (863, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 05:33:00');
INSERT INTO `sys_logininfor` VALUES (864, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 05:43:10');
INSERT INTO `sys_logininfor` VALUES (865, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-06 05:47:47');
INSERT INTO `sys_logininfor` VALUES (866, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 05:47:54');
INSERT INTO `sys_logininfor` VALUES (867, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-06 05:49:29');
INSERT INTO `sys_logininfor` VALUES (868, 'lisi', '47.105.165.206', '1', '用户密码错误', '2021-09-06 05:50:05');
INSERT INTO `sys_logininfor` VALUES (869, '5', '47.105.165.206', '1', '用户名不在指定范围', '2021-09-06 05:50:09');
INSERT INTO `sys_logininfor` VALUES (870, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 05:50:23');
INSERT INTO `sys_logininfor` VALUES (871, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 05:54:17');
INSERT INTO `sys_logininfor` VALUES (872, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 06:06:17');
INSERT INTO `sys_logininfor` VALUES (873, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 06:16:14');
INSERT INTO `sys_logininfor` VALUES (874, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 06:34:42');
INSERT INTO `sys_logininfor` VALUES (875, 'admin', '47.105.165.206', '0', '登录成功', '2021-09-06 06:47:42');
INSERT INTO `sys_logininfor` VALUES (876, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 07:00:59');
INSERT INTO `sys_logininfor` VALUES (877, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 07:01:14');
INSERT INTO `sys_logininfor` VALUES (878, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 07:01:43');
INSERT INTO `sys_logininfor` VALUES (879, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-06 07:18:10');
INSERT INTO `sys_logininfor` VALUES (880, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 09:08:58');
INSERT INTO `sys_logininfor` VALUES (881, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-06 09:54:24');
INSERT INTO `sys_logininfor` VALUES (882, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-06 10:03:08');
INSERT INTO `sys_logininfor` VALUES (883, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 10:06:12');
INSERT INTO `sys_logininfor` VALUES (884, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 10:10:00');
INSERT INTO `sys_logininfor` VALUES (885, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-06 14:12:22');
INSERT INTO `sys_logininfor` VALUES (886, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 01:18:05');
INSERT INTO `sys_logininfor` VALUES (887, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 02:15:49');
INSERT INTO `sys_logininfor` VALUES (888, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 02:22:13');
INSERT INTO `sys_logininfor` VALUES (889, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 02:55:57');
INSERT INTO `sys_logininfor` VALUES (890, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 05:46:22');
INSERT INTO `sys_logininfor` VALUES (891, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 05:47:20');
INSERT INTO `sys_logininfor` VALUES (892, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 06:12:11');
INSERT INTO `sys_logininfor` VALUES (893, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:44:30');
INSERT INTO `sys_logininfor` VALUES (894, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:44:31');
INSERT INTO `sys_logininfor` VALUES (895, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:44:44');
INSERT INTO `sys_logininfor` VALUES (896, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:45:08');
INSERT INTO `sys_logininfor` VALUES (897, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:45:44');
INSERT INTO `sys_logininfor` VALUES (898, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:46:38');
INSERT INTO `sys_logininfor` VALUES (899, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:47:15');
INSERT INTO `sys_logininfor` VALUES (900, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 08:54:14');
INSERT INTO `sys_logininfor` VALUES (901, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 09:58:55');
INSERT INTO `sys_logininfor` VALUES (902, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 11:48:06');
INSERT INTO `sys_logininfor` VALUES (903, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 12:46:19');
INSERT INTO `sys_logininfor` VALUES (904, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 14:42:17');
INSERT INTO `sys_logininfor` VALUES (905, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-07 14:42:39');
INSERT INTO `sys_logininfor` VALUES (906, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 01:13:55');
INSERT INTO `sys_logininfor` VALUES (907, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 01:16:46');
INSERT INTO `sys_logininfor` VALUES (908, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:06:45');
INSERT INTO `sys_logininfor` VALUES (909, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:16:44');
INSERT INTO `sys_logininfor` VALUES (910, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:36:14');
INSERT INTO `sys_logininfor` VALUES (911, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:39:22');
INSERT INTO `sys_logininfor` VALUES (912, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:40:04');
INSERT INTO `sys_logininfor` VALUES (913, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:45:09');
INSERT INTO `sys_logininfor` VALUES (914, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:51:44');
INSERT INTO `sys_logininfor` VALUES (915, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:54:44');
INSERT INTO `sys_logininfor` VALUES (916, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 02:59:26');
INSERT INTO `sys_logininfor` VALUES (917, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 03:13:16');
INSERT INTO `sys_logininfor` VALUES (918, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 03:20:13');
INSERT INTO `sys_logininfor` VALUES (919, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 03:57:15');
INSERT INTO `sys_logininfor` VALUES (920, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 04:17:56');
INSERT INTO `sys_logininfor` VALUES (921, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 04:20:55');
INSERT INTO `sys_logininfor` VALUES (922, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 05:32:42');
INSERT INTO `sys_logininfor` VALUES (923, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 06:21:33');
INSERT INTO `sys_logininfor` VALUES (924, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 06:21:39');
INSERT INTO `sys_logininfor` VALUES (925, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 07:12:55');
INSERT INTO `sys_logininfor` VALUES (926, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 07:47:00');
INSERT INTO `sys_logininfor` VALUES (927, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 07:52:06');
INSERT INTO `sys_logininfor` VALUES (928, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 07:52:37');
INSERT INTO `sys_logininfor` VALUES (929, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 07:55:28');
INSERT INTO `sys_logininfor` VALUES (930, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 08:01:49');
INSERT INTO `sys_logininfor` VALUES (931, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 08:06:08');
INSERT INTO `sys_logininfor` VALUES (932, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-08 08:07:26');
INSERT INTO `sys_logininfor` VALUES (933, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 08:15:51');
INSERT INTO `sys_logininfor` VALUES (934, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 08:29:33');
INSERT INTO `sys_logininfor` VALUES (935, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 08:44:14');
INSERT INTO `sys_logininfor` VALUES (936, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 09:47:32');
INSERT INTO `sys_logininfor` VALUES (937, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 10:11:51');
INSERT INTO `sys_logininfor` VALUES (938, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-08 11:43:01');
INSERT INTO `sys_logininfor` VALUES (939, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-09 03:33:35');
INSERT INTO `sys_logininfor` VALUES (940, 'cs', '47.105.165.206', '0', '退出成功', '2021-09-09 03:36:27');
INSERT INTO `sys_logininfor` VALUES (941, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-09 03:36:31');
INSERT INTO `sys_logininfor` VALUES (942, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-09 05:35:32');
INSERT INTO `sys_logininfor` VALUES (943, 'cs', '47.105.165.206', '0', '登录成功', '2021-09-09 06:53:37');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2249 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 7, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-23 06:28:40', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 7, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-23 06:28:34', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-23 06:28:30', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-06-18 06:21:15', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-06-18 06:21:15', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-06-18 06:21:15', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-06-18 06:21:16', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-06-18 06:21:16', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-06-18 06:21:16', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-06-18 06:21:16', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 9, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-06-18 06:21:16', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 10, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-06-18 06:21:16', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-06-18 06:21:16', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-06-18 06:21:16', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', 1, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2021-06-18 06:21:16', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', 1, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2021-06-18 06:21:16', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-06-18 06:21:16', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 2143, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-06-18 06:21:16', 'admin', '2021-08-10 07:15:23', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-06-18 06:21:16', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-06-18 06:21:16', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2021-06-18 06:21:16', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2021-06-18 06:21:16', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-06-18 06:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '引擎元信息', 0, 4, 'process', NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2021-06-18 09:15:39', 'admin', '2021-08-25 09:15:44', '');
INSERT INTO `sys_menu` VALUES (2001, '流程历史记录', 2000, 1, 'history', '', 1, 0, 'M', '0', '0', '', 'message', 'admin', '2021-06-18 09:18:42', 'admin', '2021-06-18 10:11:17', '');
INSERT INTO `sys_menu` VALUES (2002, '流程节点历史记录', 2001, 1, 'actinst', 'processmanager/actinst/index', 1, 0, 'C', '0', '0', 'processmanager:actinst:list', '#', 'admin', '2021-06-18 10:06:04', 'admin', '2021-06-18 15:27:11', '流程活动节点历史记录菜单');
INSERT INTO `sys_menu` VALUES (2003, '流程活动节点历史记录查询', 2002, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:actinst:query', '#', 'admin', '2021-06-18 10:06:04', 'admin', '2021-06-18 15:27:21', '');
INSERT INTO `sys_menu` VALUES (2004, '流程活动节点历史记录新增', 2002, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:actinst:add', '#', 'admin', '2021-06-18 10:06:04', 'admin', '2021-06-18 15:27:28', '');
INSERT INTO `sys_menu` VALUES (2005, '流程活动节点历史记录修改', 2002, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:actinst:edit', '#', 'admin', '2021-06-18 10:06:04', 'admin', '2021-06-18 15:27:36', '');
INSERT INTO `sys_menu` VALUES (2006, '流程活动节点历史记录删除', 2002, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:actinst:remove', '#', 'admin', '2021-06-18 10:06:04', 'admin', '2021-06-18 15:27:44', '');
INSERT INTO `sys_menu` VALUES (2007, '流程活动节点历史记录导出', 2002, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:actinst:export', '#', 'admin', '2021-06-18 10:06:04', 'admin', '2021-06-18 15:27:53', '');
INSERT INTO `sys_menu` VALUES (2008, '历史流程实例', 2001, 1, 'procinst', 'processmanager/procinst/index', 1, 0, 'C', '0', '0', 'processmanager:procinst:list', '#', 'admin', '2021-06-18 14:44:59', '', NULL, '历史流程实例菜单');
INSERT INTO `sys_menu` VALUES (2009, '历史流程实例查询', 2008, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:procinst:query', '#', 'admin', '2021-06-18 14:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '历史流程实例新增', 2008, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:procinst:add', '#', 'admin', '2021-06-18 14:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '历史流程实例修改', 2008, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:procinst:edit', '#', 'admin', '2021-06-18 14:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '历史流程实例删除', 2008, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:procinst:remove', '#', 'admin', '2021-06-18 14:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '历史流程实例导出', 2008, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:procinst:export', '#', 'admin', '2021-06-18 14:44:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '历史任务记录', 2001, 1, 'taskinst', 'processmanager/taskinst/index', 1, 0, 'C', '0', '0', 'processmanager:taskinst:list', '#', 'admin', '2021-06-18 15:12:21', '', NULL, '历史任务记录菜单');
INSERT INTO `sys_menu` VALUES (2015, '历史任务记录查询', 2014, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:taskinst:query', '#', 'admin', '2021-06-18 15:12:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '历史任务记录新增', 2014, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:taskinst:add', '#', 'admin', '2021-06-18 15:12:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '历史任务记录修改', 2014, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:taskinst:edit', '#', 'admin', '2021-06-18 15:12:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '历史任务记录删除', 2014, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:taskinst:remove', '#', 'admin', '2021-06-18 15:12:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '历史任务记录导出', 2014, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:taskinst:export', '#', 'admin', '2021-06-18 15:12:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '历史附件', 2001, 1, 'attachment', 'processmanager/attachment/index', 1, 0, 'C', '0', '0', 'processmanager:attachment:list', '#', 'admin', '2021-06-18 15:23:43', '', NULL, '历史附件菜单');
INSERT INTO `sys_menu` VALUES (2021, '历史附件查询', 2020, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:attachment:query', '#', 'admin', '2021-06-18 15:23:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '历史附件新增', 2020, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:attachment:add', '#', 'admin', '2021-06-18 15:23:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '历史附件修改', 2020, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:attachment:edit', '#', 'admin', '2021-06-18 15:23:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '历史附件删除', 2020, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:attachment:remove', '#', 'admin', '2021-06-18 15:23:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '历史附件导出', 2020, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:attachment:export', '#', 'admin', '2021-06-18 15:23:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '历史意见', 2001, 1, 'comment', 'processmanager/comment/index', 1, 0, 'C', '0', '0', 'processmanager:comment:list', '#', 'admin', '2021-06-18 15:24:00', '', NULL, '历史意见菜单');
INSERT INTO `sys_menu` VALUES (2027, '历史意见查询', 2026, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:comment:query', '#', 'admin', '2021-06-18 15:24:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '历史意见新增', 2026, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:comment:add', '#', 'admin', '2021-06-18 15:24:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '历史意见修改', 2026, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:comment:edit', '#', 'admin', '2021-06-18 15:24:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '历史意见删除', 2026, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:comment:remove', '#', 'admin', '2021-06-18 15:24:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '历史意见导出', 2026, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:comment:export', '#', 'admin', '2021-06-18 15:24:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '流程运行中的细节信息历史记录', 2001, 1, 'detail', 'processmanager/detail/index', 1, 0, 'C', '0', '0', 'processmanager:detail:list', '#', 'admin', '2021-06-19 02:22:55', '', NULL, '流程运行中的细节信息历史记录菜单');
INSERT INTO `sys_menu` VALUES (2033, '流程运行中的细节信息历史记录查询', 2032, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:detail:query', '#', 'admin', '2021-06-19 02:22:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '流程运行中的细节信息历史记录新增', 2032, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:detail:add', '#', 'admin', '2021-06-19 02:22:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '流程运行中的细节信息历史记录修改', 2032, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:detail:edit', '#', 'admin', '2021-06-19 02:22:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '流程运行中的细节信息历史记录删除', 2032, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:detail:remove', '#', 'admin', '2021-06-19 02:22:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '流程运行中的细节信息历史记录导出', 2032, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:detail:export', '#', 'admin', '2021-06-19 02:22:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '实体类关联历史记录', 2001, 1, 'entitylink', 'processmanager/entitylink/index', 1, 0, 'C', '0', '0', 'processmanager:entitylink:list', '#', 'admin', '2021-06-19 02:23:12', '', NULL, '实体类关联历史记录菜单');
INSERT INTO `sys_menu` VALUES (2039, '实体类关联历史记录查询', 2038, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:entitylink:query', '#', 'admin', '2021-06-19 02:23:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '实体类关联历史记录新增', 2038, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:entitylink:add', '#', 'admin', '2021-06-19 02:23:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '实体类关联历史记录修改', 2038, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:entitylink:edit', '#', 'admin', '2021-06-19 02:23:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '实体类关联历史记录删除', 2038, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:entitylink:remove', '#', 'admin', '2021-06-19 02:23:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '实体类关联历史记录导出', 2038, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:entitylink:export', '#', 'admin', '2021-06-19 02:23:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '流程参与者历史记录', 2001, 1, 'identitylink', 'processmanager/identitylink/index', 1, 0, 'C', '0', '0', 'processmanager:identitylink:list', '#', 'admin', '2021-06-19 02:23:28', '', NULL, '流程参与者历史记录菜单');
INSERT INTO `sys_menu` VALUES (2045, '流程参与者历史记录查询', 2044, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:identitylink:query', '#', 'admin', '2021-06-19 02:23:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '流程参与者历史记录新增', 2044, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:identitylink:add', '#', 'admin', '2021-06-19 02:23:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '流程参与者历史记录修改', 2044, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:identitylink:edit', '#', 'admin', '2021-06-19 02:23:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '流程参与者历史记录删除', 2044, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:identitylink:remove', '#', 'admin', '2021-06-19 02:23:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '流程参与者历史记录导出', 2044, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:identitylink:export', '#', 'admin', '2021-06-19 02:23:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '流程任务实例日志历史记录', 2001, 1, 'log', 'processmanager/log/index', 1, 0, 'C', '0', '0', 'processmanager:log:list', '#', 'admin', '2021-06-19 02:23:42', '', NULL, '流程任务实例日志历史记录菜单');
INSERT INTO `sys_menu` VALUES (2051, '流程任务实例日志历史记录查询', 2050, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:log:query', '#', 'admin', '2021-06-19 02:23:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '流程任务实例日志历史记录新增', 2050, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:log:add', '#', 'admin', '2021-06-19 02:23:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '流程任务实例日志历史记录修改', 2050, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:log:edit', '#', 'admin', '2021-06-19 02:23:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '流程任务实例日志历史记录删除', 2050, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:log:remove', '#', 'admin', '2021-06-19 02:23:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '流程任务实例日志历史记录导出', 2050, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:log:export', '#', 'admin', '2021-06-19 02:23:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '历史变量', 2001, 1, 'varinst', 'processmanager/varinst/index', 1, 0, 'C', '0', '0', 'processmanager:varinst:list', '#', 'admin', '2021-06-19 02:23:55', '', NULL, '历史变量菜单');
INSERT INTO `sys_menu` VALUES (2057, '历史变量查询', 2056, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:varinst:query', '#', 'admin', '2021-06-19 02:23:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '历史变量新增', 2056, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:varinst:add', '#', 'admin', '2021-06-19 02:23:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '历史变量修改', 2056, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:varinst:edit', '#', 'admin', '2021-06-19 02:23:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '历史变量删除', 2056, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:varinst:remove', '#', 'admin', '2021-06-19 02:23:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '历史变量导出', 2056, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:varinst:export', '#', 'admin', '2021-06-19 02:23:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '流程运行时信息', 2000, 2, 'runtime', NULL, 1, 0, 'M', '0', '0', NULL, 'dashboard', 'admin', '2021-06-19 05:05:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '运行时节点信息', 2062, 1, 'ruActinst', 'processmanager/ruActinst/index', 1, 0, 'C', '0', '0', 'processmanager:ruActinst:list', '#', 'admin', '2021-06-19 05:37:22', '', NULL, '运行时节点信息菜单');
INSERT INTO `sys_menu` VALUES (2064, '运行时节点信息查询', 2063, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruActinst:query', '#', 'admin', '2021-06-19 05:37:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '运行时节点信息新增', 2063, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruActinst:add', '#', 'admin', '2021-06-19 05:37:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '运行时节点信息修改', 2063, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruActinst:edit', '#', 'admin', '2021-06-19 05:37:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '运行时节点信息删除', 2063, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruActinst:remove', '#', 'admin', '2021-06-19 05:37:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '运行时节点信息导出', 2063, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruActinst:export', '#', 'admin', '2021-06-19 05:37:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '作业死信信息', 2062, 1, 'ruDeadletterJob', 'processmanager/ruDeadletterJob/index', 1, 0, 'C', '0', '0', 'processmanager:ruDeadletterJob:list', '#', 'admin', '2021-06-19 05:37:38', '', NULL, '作业死信信息菜单');
INSERT INTO `sys_menu` VALUES (2070, '作业死信信息查询', 2069, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruDeadletterJob:query', '#', 'admin', '2021-06-19 05:37:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '作业死信信息新增', 2069, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruDeadletterJob:add', '#', 'admin', '2021-06-19 05:37:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '作业死信信息修改', 2069, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruDeadletterJob:edit', '#', 'admin', '2021-06-19 05:37:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '作业死信信息删除', 2069, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruDeadletterJob:remove', '#', 'admin', '2021-06-19 05:37:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '作业死信信息导出', 2069, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruDeadletterJob:export', '#', 'admin', '2021-06-19 05:37:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '运行时实体类关联', 2062, 1, 'ruEntitylink', 'processmanager/ruEntitylink/index', 1, 0, 'C', '0', '0', 'processmanager:ruEntitylink:list', '#', 'admin', '2021-06-19 05:37:51', '', NULL, '运行时实体类关联菜单');
INSERT INTO `sys_menu` VALUES (2076, '运行时实体类关联查询', 2075, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEntitylink:query', '#', 'admin', '2021-06-19 05:37:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '运行时实体类关联新增', 2075, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEntitylink:add', '#', 'admin', '2021-06-19 05:37:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '运行时实体类关联修改', 2075, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEntitylink:edit', '#', 'admin', '2021-06-19 05:37:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '运行时实体类关联删除', 2075, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEntitylink:remove', '#', 'admin', '2021-06-19 05:37:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '运行时实体类关联导出', 2075, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEntitylink:export', '#', 'admin', '2021-06-19 05:37:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '运行时事件订阅', 2062, 1, 'ruEventSubscr', 'processmanager/ruEventSubscr/index', 1, 0, 'C', '0', '0', 'processmanager:ruEventSubscr:list', '#', 'admin', '2021-06-19 05:38:04', '', NULL, '运行时事件订阅菜单');
INSERT INTO `sys_menu` VALUES (2082, '运行时事件订阅查询', 2081, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEventSubscr:query', '#', 'admin', '2021-06-19 05:38:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '运行时事件订阅新增', 2081, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEventSubscr:add', '#', 'admin', '2021-06-19 05:38:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '运行时事件订阅修改', 2081, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEventSubscr:edit', '#', 'admin', '2021-06-19 05:38:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '运行时事件订阅删除', 2081, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEventSubscr:remove', '#', 'admin', '2021-06-19 05:38:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '运行时事件订阅导出', 2081, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruEventSubscr:export', '#', 'admin', '2021-06-19 05:38:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '流程实例与分支执行', 2062, 1, 'ruExecution', 'processmanager/ruExecution/index', 1, 0, 'C', '0', '0', 'processmanager:ruExecution:list', '#', 'admin', '2021-06-19 05:38:19', '', NULL, '流程实例与分支执行菜单');
INSERT INTO `sys_menu` VALUES (2088, '流程实例与分支执行查询', 2087, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExecution:query', '#', 'admin', '2021-06-19 05:38:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '流程实例与分支执行新增', 2087, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExecution:add', '#', 'admin', '2021-06-19 05:38:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '流程实例与分支执行修改', 2087, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExecution:edit', '#', 'admin', '2021-06-19 05:38:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '流程实例与分支执行删除', 2087, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExecution:remove', '#', 'admin', '2021-06-19 05:38:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '流程实例与分支执行导出', 2087, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExecution:export', '#', 'admin', '2021-06-19 05:38:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2093, '作业任务额外信息', 2062, 1, 'ruExternalJob', 'processmanager/ruExternalJob/index', 1, 0, 'C', '0', '0', 'processmanager:ruExternalJob:list', '#', 'admin', '2021-06-19 05:38:30', '', NULL, '作业任务额外信息菜单');
INSERT INTO `sys_menu` VALUES (2094, '作业任务额外信息查询', 2093, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExternalJob:query', '#', 'admin', '2021-06-19 05:38:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2095, '作业任务额外信息新增', 2093, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExternalJob:add', '#', 'admin', '2021-06-19 05:38:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '作业任务额外信息修改', 2093, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExternalJob:edit', '#', 'admin', '2021-06-19 05:38:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '作业任务额外信息删除', 2093, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExternalJob:remove', '#', 'admin', '2021-06-19 05:38:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '作业任务额外信息导出', 2093, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruExternalJob:export', '#', 'admin', '2021-06-19 05:38:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '运行时作业历史记录', 2062, 1, 'ruHistoryJob', 'processmanager/ruHistoryJob/index', 1, 0, 'C', '0', '0', 'processmanager:ruHistoryJob:list', '#', 'admin', '2021-06-19 05:38:43', '', NULL, '运行时作业历史记录菜单');
INSERT INTO `sys_menu` VALUES (2100, '运行时作业历史记录查询', 2099, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruHistoryJob:query', '#', 'admin', '2021-06-19 05:38:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '运行时作业历史记录新增', 2099, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruHistoryJob:add', '#', 'admin', '2021-06-19 05:38:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '运行时作业历史记录修改', 2099, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruHistoryJob:edit', '#', 'admin', '2021-06-19 05:38:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '运行时作业历史记录删除', 2099, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruHistoryJob:remove', '#', 'admin', '2021-06-19 05:38:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '运行时作业历史记录导出', 2099, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruHistoryJob:export', '#', 'admin', '2021-06-19 05:38:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '运行时任务执行人的信息', 2062, 1, 'ruIdentitylink', 'processmanager/ruIdentitylink/index', 1, 0, 'C', '0', '0', 'processmanager:ruIdentitylink:list', '#', 'admin', '2021-06-19 05:38:55', '', NULL, '运行时任务执行人的信息菜单');
INSERT INTO `sys_menu` VALUES (2106, '运行时任务执行人的信息查询', 2105, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruIdentitylink:query', '#', 'admin', '2021-06-19 05:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '运行时任务执行人的信息新增', 2105, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruIdentitylink:add', '#', 'admin', '2021-06-19 05:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '运行时任务执行人的信息修改', 2105, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruIdentitylink:edit', '#', 'admin', '2021-06-19 05:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '运行时任务执行人的信息删除', 2105, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruIdentitylink:remove', '#', 'admin', '2021-06-19 05:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '运行时任务执行人的信息导出', 2105, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruIdentitylink:export', '#', 'admin', '2021-06-19 05:38:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '作业信息', 2062, 1, 'ruJob', 'processmanager/ruJob/index', 1, 0, 'C', '0', '0', 'processmanager:ruJob:list', '#', 'admin', '2021-06-19 05:39:07', '', NULL, '作业信息菜单');
INSERT INTO `sys_menu` VALUES (2112, '作业信息查询', 2111, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruJob:query', '#', 'admin', '2021-06-19 05:39:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2113, '作业信息新增', 2111, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruJob:add', '#', 'admin', '2021-06-19 05:39:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '作业信息修改', 2111, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruJob:edit', '#', 'admin', '2021-06-19 05:39:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '作业信息删除', 2111, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruJob:remove', '#', 'admin', '2021-06-19 05:39:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '作业信息导出', 2111, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruJob:export', '#', 'admin', '2021-06-19 05:39:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '暂停作业', 2062, 1, 'ruSuspendedJob', 'processmanager/ruSuspendedJob/index', 1, 0, 'C', '0', '0', 'processmanager:ruSuspendedJob:list', '#', 'admin', '2021-06-19 05:39:20', '', NULL, '暂停作业菜单');
INSERT INTO `sys_menu` VALUES (2118, '暂停作业查询', 2117, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruSuspendedJob:query', '#', 'admin', '2021-06-19 05:39:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '暂停作业新增', 2117, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruSuspendedJob:add', '#', 'admin', '2021-06-19 05:39:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '暂停作业修改', 2117, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruSuspendedJob:edit', '#', 'admin', '2021-06-19 05:39:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '暂停作业删除', 2117, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruSuspendedJob:remove', '#', 'admin', '2021-06-19 05:39:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '暂停作业导出', 2117, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruSuspendedJob:export', '#', 'admin', '2021-06-19 05:39:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '运行时任务实例', 2062, 1, 'ruTask', 'processmanager/ruTask/index', 1, 0, 'C', '0', '0', 'processmanager:ruTask:list', '#', 'admin', '2021-06-19 05:49:33', '', NULL, '运行时任务实例菜单');
INSERT INTO `sys_menu` VALUES (2124, '运行时任务实例查询', 2123, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTask:query', '#', 'admin', '2021-06-19 05:49:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '运行时任务实例新增', 2123, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTask:add', '#', 'admin', '2021-06-19 05:49:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '运行时任务实例修改', 2123, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTask:edit', '#', 'admin', '2021-06-19 05:49:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '运行时任务实例删除', 2123, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTask:remove', '#', 'admin', '2021-06-19 05:49:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '运行时任务实例导出', 2123, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTask:export', '#', 'admin', '2021-06-19 05:49:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '作业定时信息表', 2062, 1, 'ruTimerJob', 'processmanager/ruTimerJob/index', 1, 0, 'C', '0', '0', 'processmanager:ruTimerJob:list', '#', 'admin', '2021-06-19 05:49:48', '', NULL, '作业定时信息表菜单');
INSERT INTO `sys_menu` VALUES (2130, '作业定时信息表查询', 2129, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTimerJob:query', '#', 'admin', '2021-06-19 05:49:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '作业定时信息表新增', 2129, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTimerJob:add', '#', 'admin', '2021-06-19 05:49:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '作业定时信息表修改', 2129, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTimerJob:edit', '#', 'admin', '2021-06-19 05:49:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '作业定时信息表删除', 2129, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTimerJob:remove', '#', 'admin', '2021-06-19 05:49:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '作业定时信息表导出', 2129, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruTimerJob:export', '#', 'admin', '2021-06-19 05:49:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '运行时变量信息', 2062, 1, 'ruVariable', 'processmanager/ruVariable/index', 1, 0, 'C', '0', '0', 'processmanager:ruVariable:list', '#', 'admin', '2021-06-19 05:50:01', '', NULL, '运行时变量信息菜单');
INSERT INTO `sys_menu` VALUES (2136, '运行时变量信息查询', 2135, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruVariable:query', '#', 'admin', '2021-06-19 05:50:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '运行时变量信息新增', 2135, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruVariable:add', '#', 'admin', '2021-06-19 05:50:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '运行时变量信息修改', 2135, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruVariable:edit', '#', 'admin', '2021-06-19 05:50:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '运行时变量信息删除', 2135, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruVariable:remove', '#', 'admin', '2021-06-19 05:50:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '运行时变量信息导出', 2135, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:ruVariable:export', '#', 'admin', '2021-06-19 05:50:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '流程用户', 2000, 3, 'processUsers', NULL, 1, 0, 'M', '0', '0', '', 'user', 'admin', '2021-06-21 06:16:54', 'admin', '2021-06-21 06:29:00', '');
INSERT INTO `sys_menu` VALUES (2142, '流程用户组', 2000, 4, 'processGroups', NULL, 1, 0, 'M', '0', '0', '', 'row', 'admin', '2021-06-21 06:18:49', 'admin', '2021-06-21 06:29:07', '');
INSERT INTO `sys_menu` VALUES (2143, '自定义表单', 0, 3, 'buildTables', NULL, 1, 0, 'M', '0', '0', '', 'form', 'admin', '2021-06-21 06:21:32', 'admin', '2021-08-25 09:16:27', '');
INSERT INTO `sys_menu` VALUES (2144, '流程引擎', 0, 2, 'processCore', NULL, 1, 0, 'M', '0', '0', '', 'drag', 'admin', '2021-06-21 06:24:28', 'admin', '2021-07-15 02:48:48', '');
INSERT INTO `sys_menu` VALUES (2146, '流程定义', 2144, 2, 'processCore/processDefinition', 'processcenter/definition/index', 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2021-06-21 06:27:41', 'admin', '2021-06-24 10:05:00', '');
INSERT INTO `sys_menu` VALUES (2148, '流程工作台', 0, 0, 'workMenu', NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2021-06-21 06:35:33', 'admin', '2021-07-15 02:44:45', '');
INSERT INTO `sys_menu` VALUES (2149, '待办个人任务', 2248, 1, 'workMenuTodo', 'workBench/todo/PersonalMission', 1, 0, 'C', '0', '0', '', 'time', 'admin', '2021-06-21 06:37:50', 'admin', '2021-09-04 16:09:23', '');
INSERT INTO `sys_menu` VALUES (2150, '已办任务', 2248, 3, 'workMenuDone', 'workBench/done/DoneMission', 1, 0, 'C', '0', '0', '', 'skill', 'admin', '2021-06-21 06:38:25', 'admin', '2021-09-04 16:09:44', '');
INSERT INTO `sys_menu` VALUES (2151, '我发起的流程', 2248, 7, 'workMenuMyProcess', 'workBench/sent/SentMission', 1, 0, 'C', '0', '0', '', 'post', 'admin', '2021-06-21 06:39:36', 'admin', '2021-09-04 16:10:32', '');
INSERT INTO `sys_menu` VALUES (2152, '我的转办', 2248, 4, 'workMenu/turnToOthers', NULL, 1, 0, 'M', '1', '0', '', 'slider', 'admin', '2021-06-21 06:43:13', 'admin', '2021-09-04 16:10:08', '');
INSERT INTO `sys_menu` VALUES (2153, '转办给我', 2248, 5, 'workMenu/turnToMe', NULL, 1, 0, 'M', '1', '0', '', 'star', 'admin', '2021-06-21 06:44:18', 'admin', '2021-09-04 16:10:16', '');
INSERT INTO `sys_menu` VALUES (2154, '限时任务', 2248, 6, 'workMenu/overTime', 'workBench/overTime/overTime', 1, 0, 'C', '0', '0', '', 'time', 'admin', '2021-06-21 06:45:23', 'admin', '2021-09-04 16:10:24', '');
INSERT INTO `sys_menu` VALUES (2158, '服务管理', 0, 1, 'workflowServiceManagement', NULL, 1, 0, 'M', '0', '0', '', 'tab', 'admin', '2021-06-21 09:19:33', 'admin', '2021-07-15 02:48:41', '');
INSERT INTO `sys_menu` VALUES (2161, '引擎系统设置', 0, 6, 'workflowConfig', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-06-23 06:23:15', 'admin', '2021-08-25 09:16:17', '');
INSERT INTO `sys_menu` VALUES (2162, '短信配置', 2161, 2, 'workflowConfig/sendMessage', NULL, 1, 0, 'M', '0', '0', NULL, 'message', 'admin', '2021-06-23 06:24:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2163, '邮件配置', 2161, 3, 'workflowConfig/sendEmail', NULL, 1, 0, 'M', '0', '0', NULL, 'email', 'admin', '2021-06-23 06:25:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2164, '表单模型', 2143, 1, 'model', 'processmanager/model/indexx', 1, 0, 'C', '0', '0', 'processmanager:model:list', '#', 'admin', '2021-06-30 10:17:14', 'admin', '2021-08-10 07:14:37', '单模型菜单');
INSERT INTO `sys_menu` VALUES (2165, '单模型查询', 2164, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:model:query', '#', 'admin', '2021-06-30 10:17:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '单模型新增', 2164, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:model:add', '#', 'admin', '2021-06-30 10:17:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2167, '单模型修改', 2164, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:model:edit', '#', 'admin', '2021-06-30 10:17:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '单模型删除', 2164, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:model:remove', '#', 'admin', '2021-06-30 10:17:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2169, '单模型导出', 2164, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:model:export', '#', 'admin', '2021-06-30 10:17:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2170, '流程分类', 2144, 1, 'processCategory', 'processmanager/processCategory/index', 1, 0, 'C', '0', '0', 'processmanager:processCategory:list', 'cascader', 'admin', '2021-06-30 10:17:31', 'admin', '2021-06-30 13:04:03', '流程分类菜单');
INSERT INTO `sys_menu` VALUES (2171, '流程分类查询', 2170, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processCategory:query', '#', 'admin', '2021-06-30 10:17:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '流程分类新增', 2170, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processCategory:add', '#', 'admin', '2021-06-30 10:17:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2173, '流程分类修改', 2170, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processCategory:edit', '#', 'admin', '2021-06-30 10:17:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2174, '流程分类删除', 2170, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processCategory:remove', '#', 'admin', '2021-06-30 10:17:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2175, '流程分类导出', 2170, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processCategory:export', '#', 'admin', '2021-06-30 10:17:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2176, '租户管理', 2161, 1, 'processTenant', 'processmanager/processTenant/index', 1, 0, 'C', '0', '0', 'processmanager:processTenant:list', 'peoples', 'admin', '2021-06-30 10:17:43', 'admin', '2021-06-30 12:57:57', '租户管理菜单');
INSERT INTO `sys_menu` VALUES (2177, '租户管理查询', 2176, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processTenant:query', '#', 'admin', '2021-06-30 10:17:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '租户管理新增', 2176, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processTenant:add', '#', 'admin', '2021-06-30 10:17:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2179, '租户管理修改', 2176, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processTenant:edit', '#', 'admin', '2021-06-30 10:17:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2180, '租户管理删除', 2176, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processTenant:remove', '#', 'admin', '2021-06-30 10:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2181, '租户管理导出', 2176, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processTenant:export', '#', 'admin', '2021-06-30 10:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2188, '流程模型', 2144, 1, 'processModelInfo', 'processmanager/processModelInfo/index', 1, 0, 'C', '0', '0', 'processmanager:processModelInfo:list', 'example', 'admin', '2021-06-30 10:46:53', 'admin', '2021-06-30 13:03:26', '流程模型基本信息菜单');
INSERT INTO `sys_menu` VALUES (2189, '流程模型基本信息查询', 2188, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processModelInfo:query', '#', 'admin', '2021-06-30 10:46:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '流程模型基本信息新增', 2188, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processModelInfo:add', '#', 'admin', '2021-06-30 10:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '流程模型基本信息修改', 2188, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processModelInfo:edit', '#', 'admin', '2021-06-30 10:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2192, '流程模型基本信息删除', 2188, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processModelInfo:remove', '#', 'admin', '2021-06-30 10:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2193, '流程模型基本信息导出', 2188, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processModelInfo:export', '#', 'admin', '2021-06-30 10:46:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2194, '服务分类', 2158, 1, 'processSerivceCategory', 'processmanager/processSerivceCategory/index', 1, 0, 'C', '0', '0', 'processmanager:processSerivceCategory:list', 'tree-table', 'admin', '2021-07-06 05:02:24', 'admin', '2021-07-06 05:47:16', '服务分类菜单');
INSERT INTO `sys_menu` VALUES (2195, '服务分类查询', 2194, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCategory:query', '#', 'admin', '2021-07-06 05:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2196, '服务分类新增', 2194, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCategory:add', '#', 'admin', '2021-07-06 05:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2197, '服务分类修改', 2194, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCategory:edit', '#', 'admin', '2021-07-06 05:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2198, '服务分类删除', 2194, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCategory:remove', '#', 'admin', '2021-07-06 05:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2199, '服务分类导出', 2194, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCategory:export', '#', 'admin', '2021-07-06 05:02:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2200, '服务收藏', 2158, 5, 'processSerivceCollect', 'processmanager/processSerivceCollect/index', 1, 0, 'C', '0', '0', 'processmanager:processSerivceCollect:list', 'star', 'admin', '2021-07-06 05:02:40', 'admin', '2021-07-06 05:48:16', '服务收藏菜单');
INSERT INTO `sys_menu` VALUES (2201, '服务收藏查询', 2200, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCollect:query', '#', 'admin', '2021-07-06 05:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2202, '服务收藏新增', 2200, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCollect:add', '#', 'admin', '2021-07-06 05:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2203, '服务收藏修改', 2200, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCollect:edit', '#', 'admin', '2021-07-06 05:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2204, '服务收藏删除', 2200, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCollect:remove', '#', 'admin', '2021-07-06 05:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2205, '服务收藏导出', 2200, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processSerivceCollect:export', '#', 'admin', '2021-07-06 05:02:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2212, '服务指南配置', 2158, 4, 'processServiceGuide', 'processmanager/processServiceGuide/index', 1, 0, 'C', '0', '0', 'processmanager:processServiceGuide:list', 'guide', 'admin', '2021-07-06 05:03:08', 'admin', '2021-07-06 05:48:03', '服务指南配置菜单');
INSERT INTO `sys_menu` VALUES (2213, '服务指南配置查询', 2212, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processServiceGuide:query', '#', 'admin', '2021-07-06 05:03:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2214, '服务指南配置新增', 2212, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processServiceGuide:add', '#', 'admin', '2021-07-06 05:03:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2215, '服务指南配置修改', 2212, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processServiceGuide:edit', '#', 'admin', '2021-07-06 05:03:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2216, '服务指南配置删除', 2212, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processServiceGuide:remove', '#', 'admin', '2021-07-06 05:03:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2217, '服务指南配置导出', 2212, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processServiceGuide:export', '#', 'admin', '2021-07-06 05:03:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2218, '服务配置', 2158, 2, 'processService', 'processmanager/processService/index', 1, 0, 'C', '0', '0', 'processmanager:processService:list', 'system', 'admin', '2021-07-06 05:03:22', 'admin', '2021-07-06 05:47:30', '服务菜单');
INSERT INTO `sys_menu` VALUES (2219, '服务查询', 2218, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processService:query', '#', 'admin', '2021-07-06 05:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2220, '服务新增', 2218, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processService:add', '#', 'admin', '2021-07-06 05:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2221, '服务修改', 2218, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processService:edit', '#', 'admin', '2021-07-06 05:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2222, '服务删除', 2218, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processService:remove', '#', 'admin', '2021-07-06 05:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2223, '服务导出', 2218, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processService:export', '#', 'admin', '2021-07-06 05:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2224, '工作台首页', 2247, 0, 'homePage', 'workBench/homePage/index', 1, 0, 'C', '0', '0', '', 'client', 'admin', '2021-07-09 02:03:52', 'admin', '2021-09-04 16:08:57', '');
INSERT INTO `sys_menu` VALUES (2225, '流程审核按钮', 2144, 4, 'processButton', 'processmanager/processButton/index', 1, 0, 'C', '0', '0', 'processmanager:processButton:list', 'button', 'admin', '2021-07-14 06:30:00', 'admin', '2021-08-25 08:18:59', '流程审核按钮管理菜单');
INSERT INTO `sys_menu` VALUES (2226, '流程审核按钮管理查询', 2225, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processButton:query', '#', 'admin', '2021-07-14 06:30:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2227, '流程审核按钮管理新增', 2225, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processButton:add', '#', 'admin', '2021-07-14 06:30:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2228, '流程审核按钮管理修改', 2225, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processButton:edit', '#', 'admin', '2021-07-14 06:30:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2229, '流程审核按钮管理删除', 2225, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processButton:remove', '#', 'admin', '2021-07-14 06:30:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2230, '流程审核按钮管理导出', 2225, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processButton:export', '#', 'admin', '2021-07-14 06:30:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2231, '发起流程', 2247, 0, 'homePageAdd', 'workBench/homePage/add', 1, 0, 'C', '1', '0', '', '#', 'admin', '2021-07-22 08:22:30', 'admin', '2021-09-05 12:19:49', '');
INSERT INTO `sys_menu` VALUES (2232, '流程模型设计器', 2144, 1, 'processModelDesign', 'processmanager/processModelDesign/index', 1, 0, 'C', '1', '0', '', 'example', 'admin', '2021-07-25 10:13:36', 'admin', '2021-08-02 07:47:18', '');
INSERT INTO `sys_menu` VALUES (2233, '表单模型设计器', 2143, 1, 'form/designModel', 'processmanager/formModelDesign/index', 1, 0, 'C', '0', '0', '', 'form', 'admin', '2021-08-04 07:44:07', 'admin', '2021-08-04 07:44:58', '');
INSERT INTO `sys_menu` VALUES (2234, '待办组任务', 2248, 2, 'workMenuGroup', 'workBench/group/GroupMission', 1, 0, 'C', '0', '0', '', 'time', 'admin', '2021-08-23 02:44:45', 'admin', '2021-09-04 16:09:37', '');
INSERT INTO `sys_menu` VALUES (2235, '流程表达式', 2144, 1, 'processExpression', 'processmanager/processExpression/index', 1, 0, 'C', '0', '0', 'processmanager:processExpression:list', 'tool', 'admin', '2021-08-24 02:17:02', 'admin', '2021-09-04 16:15:26', '流程达式菜单');
INSERT INTO `sys_menu` VALUES (2236, '流程达式查询', 2235, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processExpression:query', '#', 'admin', '2021-08-24 02:17:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2237, '流程达式新增', 2235, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processExpression:add', '#', 'admin', '2021-08-24 02:17:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2238, '流程达式修改', 2235, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processExpression:edit', '#', 'admin', '2021-08-24 02:17:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2239, '流程达式删除', 2235, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processExpression:remove', '#', 'admin', '2021-08-24 02:17:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2240, '流程达式导出', 2235, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processExpression:export', '#', 'admin', '2021-08-24 02:17:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2241, '流程监听器', 2144, 1, 'processListener', 'processmanager/processListener/index', 1, 0, 'C', '0', '0', 'processmanager:processListener:list', 'skill', 'admin', '2021-08-24 02:17:16', 'admin', '2021-09-04 16:15:56', '流程监听器菜单');
INSERT INTO `sys_menu` VALUES (2242, '流程监听器查询', 2241, 1, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processListener:query', '#', 'admin', '2021-08-24 02:17:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2243, '流程监听器新增', 2241, 2, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processListener:add', '#', 'admin', '2021-08-24 02:17:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2244, '流程监听器修改', 2241, 3, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processListener:edit', '#', 'admin', '2021-08-24 02:17:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2245, '流程监听器删除', 2241, 4, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processListener:remove', '#', 'admin', '2021-08-24 02:17:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2246, '流程监听器导出', 2241, 5, '#', '', 1, 0, 'F', '0', '0', 'processmanager:processListener:export', '#', 'admin', '2021-08-24 02:17:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2247, '个人工作台', 2148, 1, '/personal/workBench', NULL, 1, 0, 'M', '0', '0', NULL, 'tab', 'admin', '2021-09-04 16:07:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2248, '管理工作台', 2148, 2, '/management/workBench', NULL, 1, 0, 'M', '0', '0', NULL, 'table', 'admin', '2021-09-04 16:08:35', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '流程中心V1.0.0正式发布', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-06-18 06:21:18', 'admin', '2021-06-18 15:43:30', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 437 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}', 0, NULL, '2021-06-18 09:04:19');
INSERT INTO `sys_oper_log` VALUES (101, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/06/18/3f3bb43a-5d4e-482e-a0c2-88b767b10e83.jpeg\",\"code\":200}', 0, NULL, '2021-06-18 09:05:02');
INSERT INTO `sys_oper_log` VALUES (102, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623968475000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1623968475000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:05:04');
INSERT INTO `sys_oper_log` VALUES (103, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623968475000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"钟明晓\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1623968475000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:05:10');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'ACT_HI_ACTINST,ACT_HI_ATTACHMENT,ACT_HI_COMMENT,ACT_HI_DETAIL,ACT_HI_ENTITYLINK', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:13:07');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"5\",\"menuName\":\"流程引擎\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"/process\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:15:39');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"5\",\"menuName\":\"流程引擎\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:15:54');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"1\",\"menuName\":\"流程历史记录\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"process/history\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:18:42');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"1\",\"menuName\":\"流程历史记录\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"history\",\"component\":\"process/history\",\"children\":[],\"createTime\":1623979122000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:19:23');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"1\",\"menuName\":\"流程历史记录\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"history\",\"component\":\"process/history/index\",\"children\":[],\"createTime\":1623979122000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"process:history:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 09:20:13');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 09:36:03');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"1\",\"menuName\":\"流程历史记录\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"history\",\"component\":\"process/history/index\",\"children\":[],\"createTime\":1623979122000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"process:history:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 10:08:31');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"1\",\"menuName\":\"流程历史记录\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"history\",\"component\":\"\",\"children\":[],\"createTime\":1623979122000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 10:11:17');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 14:32:26');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 14:32:29');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 14:32:31');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/5', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 14:32:34');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/ACT_HI_ACTINST', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 14:33:19');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_hi_taskinst,act_hi_procinst', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 14:34:44');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 14:36:55');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 14:38:05');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:00:02');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_hi_actinst,act_hi_attachment,act_hi_comment', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:00:43');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 15:02:17');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 15:14:29');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 15:21:02');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"流程节点历史记录\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"path\":\"actinst\",\"component\":\"processmanager/actinst/index\",\"children\":[],\"createTime\":1623981964000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"processmanager:actinst:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:27:11');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"流程活动节点历史记录查询\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1623981964000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"F\",\"perms\":\"processmanager:actinst:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:27:21');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"流程活动节点历史记录新增\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1623981964000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"F\",\"perms\":\"processmanager:actinst:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:27:28');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"流程活动节点历史记录修改\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1623981964000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"F\",\"perms\":\"processmanager:actinst:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:27:36');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"流程活动节点历史记录删除\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1623981964000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"F\",\"perms\":\"processmanager:actinst:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:27:44');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"流程活动节点历史记录导出\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1623981964000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"F\",\"perms\":\"processmanager:actinst:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:27:53');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-18 15:33:09');
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623968475000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"17757144205@163.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:40:21');
INSERT INTO `sys_oper_log` VALUES (134, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"杭州总公司\",\"leader\":\"钟明晓\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623968475000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"17757144205@163.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:40:54');
INSERT INTO `sys_oper_log` VALUES (135, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"deptName\":\"上海分公司\",\"leader\":\"钟明晓\",\"deptId\":102,\"orderNum\":\"2\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1623968475000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"17757144205@163.om\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:42:01');
INSERT INTO `sys_oper_log` VALUES (136, '通知公告', 2, 'com.ruoyi.system.controller.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/notice', '127.0.0.1', '', '{\"noticeContent\":\"新版本内容\",\"createBy\":\"admin\",\"createTime\":1623968478000,\"updateBy\":\"admin\",\"noticeType\":\"2\",\"remark\":\"管理员\",\"params\":{},\"noticeId\":1,\"noticeTitle\":\"流程中心V1.0.0正式发布\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:43:30');
INSERT INTO `sys_oper_log` VALUES (137, '通知公告', 3, 'com.ruoyi.system.controller.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/notice/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:43:50');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-06-18 15:45:32');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:45:55');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-06-18 15:46:02');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-06-18 15:48:44');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:49:09');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-06-18 15:49:15');
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1623968475000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1041,1042,1043,1044,108,500,1045,1046,1047,501,1048,1049,1050,2,109,1051,1052,1053,110,1054,1055,1056,1057,1058,1059,111,112,113,3,114,115,1060,1061,1063,1062,1064,1065,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:52:00');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-18 15:52:10');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_hi_detail,act_hi_entitylink,act_hi_identitylink,act_hi_tsk_log,act_hi_varinst', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 02:13:50');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-19 02:20:24');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"dashboard\",\"orderNum\":\"2\",\"menuName\":\"流程运行时信息\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"runtime\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 05:05:02');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_ru_actinst,act_ru_deadletter_job,act_ru_entitylink,act_ru_event_subscr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 05:06:12');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_ru_execution,act_ru_external_job,act_ru_history_job,act_ru_identitylink', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 05:06:56');
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_ru_job,act_ru_suspended_job,act_ru_task,act_ru_timer_job', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 05:07:12');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'act_ru_variable', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 05:07:21');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-19 05:25:58');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-19 05:32:29');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-19 05:46:02');
INSERT INTO `sys_oper_log` VALUES (156, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623968475000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"1111@163.com\",\"nickName\":\"测试人员\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1623968475000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 06:32:08');
INSERT INTO `sys_oper_log` VALUES (157, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623968475000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"1111@163.com\",\"nickName\":\"测试人员\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1623968475000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-19 06:32:26');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"1\",\"menuName\":\"流程引擎\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 05:34:41');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 05:34:50');
INSERT INTO `sys_oper_log` VALUES (160, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/06/21/fcedbac0-8046-44f5-a531-e84ae527f407.jpeg\",\"code\":200}', 0, NULL, '2021-06-21 05:42:03');
INSERT INTO `sys_oper_log` VALUES (161, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/06/21/c8fe6a00-75a3-4773-bdf4-dd98f784d097.jpeg\",\"code\":200}', 0, NULL, '2021-06-21 05:42:31');
INSERT INTO `sys_oper_log` VALUES (162, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/06/21/642b1b7b-fe40-405a-93d5-fae82a4b0820.jpeg\",\"code\":200}', 0, NULL, '2021-06-21 06:07:49');
INSERT INTO `sys_oper_log` VALUES (163, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2021/06/21/ac35f6f3-9719-4c64-ba2c-7f425722c030.jpeg\",\"code\":200}', 0, NULL, '2021-06-21 06:11:47');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"people\",\"orderNum\":\"3\",\"menuName\":\"流程用户\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"processUsers\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:16:54');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"4\",\"menuName\":\"流程用户组\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"processGroups\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:18:49');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"3\",\"menuName\":\"流程用户\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"processUsers\",\"children\":[],\"createTime\":1624227414000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2141,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:19:05');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"自定义表单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"buildTables\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:21:32');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"3\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:21:51');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"3\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:22:00');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"2\",\"menuName\":\"流程引擎\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:22:32');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"自定义表单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"buildTables\",\"children\":[],\"createTime\":1624227692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2143,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:22:45');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"2\",\"menuName\":\"流程引擎元信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:23:22');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":\"1\",\"menuName\":\"流程引擎\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"processCore\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:24:28');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"4\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:24:39');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"4\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:24:42');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"4\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:24:46');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"流程引擎元信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:24:50');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"3\",\"menuName\":\"流程引擎元信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:25:00');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"自定义表单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"buildTables\",\"children\":[],\"createTime\":1624227692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2143,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:25:07');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/models\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:26:49');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"流程定义\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/processDefinition\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:27:41');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"2\",\"menuName\":\"自定义表单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"buildTables\",\"children\":[],\"createTime\":1624227692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2143,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:28:20');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"3\",\"menuName\":\"流程用户\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"processUsers\",\"children\":[],\"createTime\":1624227414000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2141,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:29:00');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"4\",\"menuName\":\"流程用户组\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"processGroups\",\"children\":[],\"createTime\":1624227529000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2142,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:29:07');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"流程设计器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/modelDesign\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:32:20');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"4\",\"menuName\":\"工作台\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workMenu\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:35:33');
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"5\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:35:42');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"5\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:35:47');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"5\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:35:53');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"menuName\":\"待办列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/todo\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:37:50');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"2\",\"menuName\":\"已办列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/done\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:38:25');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"3\",\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/myProcess\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:39:36');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"4\",\"menuName\":\"流程工作台\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workMenu\",\"children\":[],\"createTime\":1624228533000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:40:35');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"slider\",\"orderNum\":\"3\",\"menuName\":\"我的转办\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/turnToOthers\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:43:13');
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"5\",\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/myProcess\",\"children\":[],\"createTime\":1624228776000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2151,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:43:22');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"star\",\"orderNum\":\"4\",\"menuName\":\"转办给我\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/turnToMe\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:44:18');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"5\",\"menuName\":\"已延时\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/overTime\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:45:23');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"6\",\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/myProcess\",\"children\":[],\"createTime\":1624228776000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2151,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:45:31');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"表单模型\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"buildTable/tableModel\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:47:57');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"5\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tenants\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:50:46');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"3\",\"menuName\":\"流程工作台\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workMenu\",\"children\":[],\"createTime\":1624228533000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:50:58');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"menuName\":\"流程引擎元信息管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 06:51:05');
INSERT INTO `sys_oper_log` VALUES (203, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/user/profile/updatePwd', '183.129.154.138', '', 'zmx19920227 cykj123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2021-06-21 07:03:05');
INSERT INTO `sys_oper_log` VALUES (204, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/user/profile/updatePwd', '183.129.154.138', '', 'zmx19920227 cykj123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2021-06-21 07:03:15');
INSERT INTO `sys_oper_log` VALUES (205, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/user/profile/updatePwd', '183.129.154.138', '', '123456 cykj123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2021-06-21 07:03:21');
INSERT INTO `sys_oper_log` VALUES (206, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/user/profile/updatePwd', '183.129.154.138', '', 'admin123 cykj123456', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 07:03:28');
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"4\",\"menuName\":\"审核按钮管理\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/buttonsManagement\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 07:26:12');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":\"1\",\"menuName\":\"服务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workflowServiceManagement\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 09:19:33');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":\"0\",\"menuName\":\"服务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workflowServiceManagement\",\"children\":[],\"createTime\":1624238373000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2158,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 09:19:47');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":\"1\",\"menuName\":\"服务配置\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"workflowManagement/configuration\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 09:21:30');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tree-table\",\"orderNum\":\"2\",\"menuName\":\"服务分类\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"workflowServiceManagement/workflowServiceClassify\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-21 09:24:29');
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"6\",\"menuName\":\"流程引擎系统设置\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workflowConfig\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:23:15');
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"5\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":2161,\"isCache\":\"0\",\"path\":\"tenants\",\"children\":[],\"createTime\":1624229446000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2156,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:23:33');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"2\",\"menuName\":\"短信配置\",\"params\":{},\"parentId\":2161,\"isCache\":\"0\",\"path\":\"workflowConfig/sendMessage\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:24:55');
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"email\",\"orderNum\":\"3\",\"menuName\":\"邮件配置\",\"params\":{},\"parentId\":2161,\"isCache\":\"0\",\"path\":\"workflowConfig/sendEmail\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:25:56');
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"7\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:28:30');
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"7\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"monitor\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:28:34');
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"7\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system\",\"children\":[],\"createTime\":1623968475000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-23 06:28:40');
INSERT INTO `sys_oper_log` VALUES (219, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://47.105.165.206:9300/statics/2021/06/24/88b17bb5-1194-44c3-bbb6-a4c7e48a2e4f.jpeg\",\"code\":200}', 0, NULL, '2021-06-24 05:22:05');
INSERT INTO `sys_oper_log` VALUES (220, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '183.129.154.138', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623968475000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"$2a$10$XrcGtvGSG06P.tcmWowbuuQon38S.BakjKEVuo4aT/JZa/Xr8RfJW\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"钟明晓\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"http://47.105.165.206:9300/statics/2021/06/21/ac35f6f3-9719-4c64-ba2c-7f425722c030.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1623968475000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-24 05:22:08');
INSERT INTO `sys_oper_log` VALUES (221, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://47.105.165.206:9300/statics/2021/06/24/ff58cfc0-ead2-410f-baed-351795fce0cb.jpeg\",\"code\":200}', 0, NULL, '2021-06-24 05:26:02');
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"流程定义\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/processDefinition\",\"component\":\"processcenter/definition\",\"children\":[],\"createTime\":1624228061000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2146,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-24 10:02:54');
INSERT INTO `sys_oper_log` VALUES (223, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"流程定义\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/processDefinition\",\"component\":\"processcenter/definition/indexex\",\"children\":[],\"createTime\":1624228061000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2146,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-24 10:03:30');
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"2\",\"menuName\":\"流程定义\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/processDefinition\",\"component\":\"processcenter/definition/index\",\"children\":[],\"createTime\":1624228061000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2146,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-24 10:05:00');
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCore/models\",\"component\":\"processcenter/definition/model\",\"children\":[],\"createTime\":1624228009000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2145,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-24 10:06:59');
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"/processccenter/modelmanagement\",\"component\":\"processcenter/definition/model\",\"children\":[],\"createTime\":1624228009000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2145,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-25 01:27:22');
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"/processccenter/modelmanagement\",\"component\":\"\",\"children\":[],\"createTime\":1624228009000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2145,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-25 01:27:36');
INSERT INTO `sys_oper_log` VALUES (228, '参数管理', 2, 'com.ruoyi.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '183.129.154.138', '', '{\"configName\":\"用户管理-账号初始密码\",\"configKey\":\"sys.user.initPassword\",\"createBy\":\"admin\",\"createTime\":1623968478000,\"updateBy\":\"admin\",\"configId\":2,\"remark\":\"初始化密码 123456\",\"configType\":\"Y\",\"configValue\":\"cykj123456\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-25 06:28:50');
INSERT INTO `sys_oper_log` VALUES (229, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"password\":\"$2a$10$Hh61EFKabPSsnB2.9lemmuL2mgbuqQ1qZCi4.oF7kq4aJZt4pEUUy\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-25 06:36:11');
INSERT INTO `sys_oper_log` VALUES (230, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'cs', NULL, '/user/profile/updatePwd', '127.0.0.1', '', '123456 cykj123456', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-25 06:37:25');
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/26,27,28', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 09:58:31');
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/6,7,8,9,10,11,12,13,14,15', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 09:58:39');
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/16,17,18,19,20,21,22,23,24,25', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 09:58:44');
INSERT INTO `sys_oper_log` VALUES (234, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_category', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 09:59:09');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_tenant', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 09:59:22');
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_model_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 09:59:58');
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/31', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 10:00:31');
INSERT INTO `sys_oper_log` VALUES (238, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_form_model', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 10:01:16');
INSERT INTO `sys_oper_log` VALUES (239, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-30 10:15:06');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"表单模型\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"model\",\"component\":\"processmanager/model/index\",\"children\":[],\"createTime\":1625019434000,\"isFrame\":\"1\",\"menuId\":2164,\"menuType\":\"C\",\"perms\":\"processmanager:model:list\",\"status\":\"0\"}', '{\"msg\":\"修改菜单\'表单模型\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2021-06-30 10:36:26');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2155', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 10:36:40');
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"表单模型\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"model\",\"component\":\"processmanager/model/index\",\"children\":[],\"createTime\":1625019434000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2164,\"menuType\":\"C\",\"perms\":\"processmanager:model:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 10:37:07');
INSERT INTO `sys_oper_log` VALUES (243, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_model_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 10:40:43');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-06-30 10:45:43');
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2156', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 12:57:25');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"流程分类\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCategory\",\"component\":\"processmanager/processCategory/index\",\"children\":[],\"createTime\":1625019451000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2170,\"menuType\":\"C\",\"perms\":\"processmanager:processCategory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 12:57:40');
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"1\",\"menuName\":\"租户管理\",\"params\":{},\"parentId\":2161,\"isCache\":\"0\",\"path\":\"processTenant\",\"component\":\"processmanager/processTenant/index\",\"children\":[],\"createTime\":1625019463000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2176,\"menuType\":\"C\",\"perms\":\"processmanager:processTenant:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 12:57:57');
INSERT INTO `sys_oper_log` VALUES (248, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'admin', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1625058072917,\"remark\":\"工时上报流程\",\"id\":1,\"params\":{},\"categoryName\":\"工时上报流程\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 13:01:14');
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型基本信息\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processModelInfo\",\"component\":\"processmanager/processModelInfo/index\",\"children\":[],\"createTime\":1625021213000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2188,\"menuType\":\"C\",\"perms\":\"processmanager:processModelInfo:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 13:03:07');
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2145', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 13:03:16');
INSERT INTO `sys_oper_log` VALUES (251, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processModelInfo\",\"component\":\"processmanager/processModelInfo/index\",\"children\":[],\"createTime\":1625021213000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2188,\"menuType\":\"C\",\"perms\":\"processmanager:processModelInfo:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 13:03:26');
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"cascader\",\"orderNum\":\"1\",\"menuName\":\"流程分类\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processCategory\",\"component\":\"processmanager/processCategory/index\",\"children\":[],\"createTime\":1625019451000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2170,\"menuType\":\"C\",\"perms\":\"processmanager:processCategory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-06-30 13:04:03');
INSERT INTO `sys_oper_log` VALUES (253, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'admin', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1625058073000,\"remark\":\"工时上报流程\",\"updateTime\":1625102840106,\"id\":1,\"params\":{},\"categoryName\":\"工时上报流程\",\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-01 01:27:20');
INSERT INTO `sys_oper_log` VALUES (254, '流程模型基本信息', 1, 'com.cci.processmanager.controller.WorkFlowModelInfoController.add()', 'POST', 1, 'admin', NULL, '/processModelInfo', '183.129.154.138', '', '{\"params\":{},\"createTime\":1625118190114,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-01 05:43:10');
INSERT INTO `sys_oper_log` VALUES (255, '流程模型基本信息', 3, 'com.cci.processmanager.controller.WorkFlowModelInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/processModelInfo/2', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-01 05:43:13');
INSERT INTO `sys_oper_log` VALUES (256, '流程模型基本信息', 2, 'com.cci.processmanager.controller.WorkFlowModelInfoController.edit()', 'PUT', 1, 'admin', NULL, '/processModelInfo', '183.129.154.138', '', '{\"creator\":\"钟明晓\",\"modelId\":\"210ef5d4-d8e9-11eb-bb50-00ff222283ac\",\"updateTime\":1625118233928,\"categoryCode\":\"222\",\"modelType\":0,\"params\":{},\"modelKey\":\"测试1\",\"name\":\"流程引擎测试分类\",\"id\":\"1\",\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-01 05:43:54');
INSERT INTO `sys_oper_log` VALUES (257, '流程模型基本信息', 1, 'com.cci.processmanager.controller.WorkFlowModelInfoController.add()', 'POST', 1, 'admin', NULL, '/processModelInfo', '127.0.0.1', '', '{\"params\":{},\"createTime\":1625206273671,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-02 06:11:14');
INSERT INTO `sys_oper_log` VALUES (258, '流程模型基本信息', 3, 'com.cci.processmanager.controller.WorkFlowModelInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/processModelInfo/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-02 06:11:17');
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/29', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 04:35:45');
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/30', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 04:35:47');
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/32', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 04:35:49');
INSERT INTO `sys_oper_log` VALUES (262, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/33', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 04:35:50');
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_service,work_flow_service_category,work_flow_service_collect,work_flow_service_guide,work_flow_service_rel_category', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 04:37:38');
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-07-06 05:00:09');
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2159', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:45:01');
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2160', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:45:08');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"服务配置\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processService\",\"component\":\"processmanager/processService/index\",\"children\":[],\"createTime\":1625519002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2218,\"menuType\":\"C\",\"perms\":\"processmanager:processService:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:45:29');
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"服务配置\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processService\",\"component\":\"processmanager/processService/index\",\"children\":[],\"createTime\":1625519002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2218,\"menuType\":\"C\",\"perms\":\"processmanager:processService:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:45:42');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"服务与服务分类关联\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processServiceCategory\",\"component\":\"processmanager/processServiceCategory/index\",\"children\":[],\"createTime\":1625518975000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2206,\"menuType\":\"C\",\"perms\":\"processmanager:processServiceCategory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:45:53');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"4\",\"menuName\":\"服务指南配置\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processServiceGuide\",\"component\":\"processmanager/processServiceGuide/index\",\"children\":[],\"createTime\":1625518988000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2212,\"menuType\":\"C\",\"perms\":\"processmanager:processServiceGuide:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:45:59');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"服务收藏\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processSerivceCollect\",\"component\":\"processmanager/processSerivceCollect/index\",\"children\":[],\"createTime\":1625518960000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2200,\"menuType\":\"C\",\"perms\":\"processmanager:processSerivceCollect:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:46:09');
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tree-table\",\"orderNum\":\"1\",\"menuName\":\"服务分类\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processSerivceCategory\",\"component\":\"processmanager/processSerivceCategory/index\",\"children\":[],\"createTime\":1625518944000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2194,\"menuType\":\"C\",\"perms\":\"processmanager:processSerivceCategory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:47:16');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"服务配置\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processService\",\"component\":\"processmanager/processService/index\",\"children\":[],\"createTime\":1625519002000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2218,\"menuType\":\"C\",\"perms\":\"processmanager:processService:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:47:30');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"swagger\",\"orderNum\":\"3\",\"menuName\":\"服务与服务分类关联\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processServiceCategory\",\"component\":\"processmanager/processServiceCategory/index\",\"children\":[],\"createTime\":1625518975000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2206,\"menuType\":\"C\",\"perms\":\"processmanager:processServiceCategory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:47:41');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"4\",\"menuName\":\"服务指南配置\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processServiceGuide\",\"component\":\"processmanager/processServiceGuide/index\",\"children\":[],\"createTime\":1625518988000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2212,\"menuType\":\"C\",\"perms\":\"processmanager:processServiceGuide:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:48:03');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"switch\",\"orderNum\":\"3\",\"menuName\":\"服务与服务分类关联\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processServiceCategory\",\"component\":\"processmanager/processServiceCategory/index\",\"children\":[],\"createTime\":1625518975000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2206,\"menuType\":\"C\",\"perms\":\"processmanager:processServiceCategory:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:48:10');
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"star\",\"orderNum\":\"5\",\"menuName\":\"服务收藏\",\"params\":{},\"parentId\":2158,\"isCache\":\"0\",\"path\":\"processSerivceCollect\",\"component\":\"processmanager/processSerivceCollect/index\",\"children\":[],\"createTime\":1625518960000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2200,\"menuType\":\"C\",\"perms\":\"processmanager:processSerivceCollect:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-06 05:48:16');
INSERT INTO `sys_oper_log` VALUES (278, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'admin', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1625728351321,\"remark\":\"测试流程\",\"id\":2,\"params\":{},\"categoryName\":\"测试流程\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-08 07:12:32');
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"1\",\"menuName\":\"工作台首页\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"/workBench/homePage/index\",\"component\":\"/workBench/homePage/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-09 02:03:52');
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"1\",\"menuName\":\"工作台首页\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"homePage\",\"component\":\"/workBench/homePage/index\",\"children\":[],\"createTime\":1625767432000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2224,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-09 02:05:08');
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"工作台首页\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"homePage\",\"component\":\"/workBench/homePage/index\",\"children\":[],\"createTime\":1625767432000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2224,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-09 02:08:51');
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"0\",\"menuName\":\"工作台首页\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"homePage\",\"component\":\"workBench/homePage/index\",\"children\":[],\"createTime\":1625767432000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2224,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-12 08:15:50');
INSERT INTO `sys_oper_log` VALUES (283, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/34,35,36,37,38', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-14 06:21:58');
INSERT INTO `sys_oper_log` VALUES (284, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_button', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-14 06:22:11');
INSERT INTO `sys_oper_log` VALUES (285, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-07-14 06:26:57');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"1\",\"menuName\":\"流程审核按钮管理\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processButton\",\"component\":\"processmanager/processButton/index\",\"children\":[],\"createTime\":1626215400000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2225,\"menuType\":\"C\",\"perms\":\"processmanager:processButton:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-14 06:45:43');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2157', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-14 06:45:50');
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"4\",\"menuName\":\"流程审核按钮管理\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processButton\",\"component\":\"processmanager/processButton/index\",\"children\":[],\"createTime\":1626215400000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2225,\"menuType\":\"C\",\"perms\":\"processmanager:processButton:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-14 06:46:04');
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '183.129.154.138', '', '{\"phonenumber\":\"17757144205\",\"admin\":false,\"remark\":\"城云测试\",\"password\":\"$2a$10$8I8cKY18LMDNp4PsXUFAx.P8aoy4OP.j1MUsGVBoUTVz.tp9Mdri.\",\"postIds\":[2],\"email\":\"17757144205@163.com\",\"nickName\":\"城云测试\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"yckj\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[2],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:33:05');
INSERT INTO `sys_oper_log` VALUES (290, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '183.129.154.138', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"deptIds\":[],\"menuIds\":[2158,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,2217,2200,2201,2202,2203,2204,2205,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2146,2147,2225,2226,2227,2228,2229,2230,2143,2164,2165,2166,2167,2168,2169,2148,2224,2149,2150,2152,2153,2154,2151,2000,2001,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:34:05');
INSERT INTO `sys_oper_log` VALUES (291, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '183.129.154.138', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"17757144205\",\"admin\":false,\"remark\":\"城云测试\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"\",\"email\":\"17757144205@163.com\",\"nickName\":\"城云测试\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"yckj\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626287585000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:34:25');
INSERT INTO `sys_oper_log` VALUES (292, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '183.129.154.138', '', '{\"admin\":false,\"password\":\"$2a$10$xTs/Emk4nVYU1LB74PJPAOOjsym4C2BPBZG5mB8tPjJ/IJlu7emw6\",\"updateBy\":\"admin\",\"params\":{},\"userId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:35:45');
INSERT INTO `sys_oper_log` VALUES (293, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'yckj', NULL, '/user/profile/avatar', '183.129.154.138', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://47.105.165.206:9300/statics/2021/07/15/49f4c50c-1a26-4086-9b9f-b21961eaf352.jpeg\",\"code\":200}', 0, NULL, '2021-07-15 02:43:50');
INSERT INTO `sys_oper_log` VALUES (294, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'yckj', NULL, '/user/profile', '183.129.154.138', '', '{\"roles\":[{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"status\":\"0\"}],\"phonenumber\":\"17757144205\",\"admin\":false,\"remark\":\"城云测试\",\"delFlag\":\"0\",\"password\":\"$2a$10$xTs/Emk4nVYU1LB74PJPAOOjsym4C2BPBZG5mB8tPjJ/IJlu7emw6\",\"loginIp\":\"\",\"email\":\"17757144205@163.com\",\"nickName\":\"城云测试\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"yckj\",\"userId\":3,\"createBy\":\"admin\",\"createTime\":1626287585000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:43:57');
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"0\",\"menuName\":\"流程工作台\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workMenu\",\"children\":[],\"createTime\":1624228533000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2148,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:44:45');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2147', '183.129.154.138', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-07-15 02:45:05');
INSERT INTO `sys_oper_log` VALUES (297, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '183.129.154.138', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2158,2144,2148,2224,2149,2150,2152,2153,2154,2151,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2212,2213,2214,2215,2216,2217,2200,2201,2202,2203,2204,2205,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2146,2225,2226,2227,2228,2229,2230,2143,2164,2165,2166,2167,2168,2169,2000,2001,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:45:48');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2147', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:46:13');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":\"1\",\"menuName\":\"服务管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workflowServiceManagement\",\"children\":[],\"createTime\":1624238373000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2158,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:48:41');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"drag\",\"orderNum\":\"2\",\"menuName\":\"流程引擎\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"processCore\",\"children\":[],\"createTime\":1624227868000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2144,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:48:48');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"menuName\":\"自定义表单管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"buildTables\",\"children\":[],\"createTime\":1624227692000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2143,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-15 02:48:54');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2206', '127.0.0.1', '', NULL, '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-07-16 10:09:04');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2208', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-16 10:09:19');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2209', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-16 10:09:35');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2207', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-16 10:09:38');
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2210', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-16 10:09:44');
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2211', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-16 10:09:47');
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2206', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-16 10:10:02');
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111111\",\"admin\":false,\"password\":\"$2a$10$/pD42m5aw2/hWNdqVVuasuNjr3uxru0TA3lwXafL5WsQmWTUIq6mm\",\"postIds\":[],\"email\":\"111@163.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"zhangsan\",\"userId\":4,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:16:34');
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111111\",\"admin\":false,\"password\":\"cykj123456\",\"postIds\":[],\"nickName\":\"李四\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"lisi\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增用户\'lisi\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2021-07-20 07:16:52');
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111112\",\"admin\":false,\"password\":\"$2a$10$BHFPlzLHMg.rcbH0ic0IFO2JwXcjl4w.cl1DAj5yjo54f/ODg5/oi\",\"postIds\":[],\"nickName\":\"李四\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"lisi\",\"userId\":5,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:16:56');
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111113\",\"admin\":false,\"password\":\"$2a$10$49v8gY2hFgU450s2CS0S1OgwQiJ3Q94X1dy.wDf25Ba3zHMGA7voG\",\"postIds\":[],\"nickName\":\"王五\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"wangwu\",\"userId\":6,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:17:18');
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111114\",\"admin\":false,\"password\":\"$2a$10$uDMz8e0PiMQqn5KFGcpPM.MsEPZqEb4dxMjojhnRJst00QvEpaUaS\",\"postIds\":[],\"nickName\":\"赵六\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"zhaoliu\",\"userId\":7,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:17:37');
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111115\",\"admin\":false,\"password\":\"$2a$10$Zn.wo1/dnktYydj2ENF.2OeREN1rKZIAMLQo784y4vPhCUSaWucS.\",\"postIds\":[],\"nickName\":\"陈七\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"chenqi\",\"userId\":8,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:18:49');
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111116\",\"admin\":false,\"password\":\"$2a$10$1GtqQ2sFANaBPW7QrBkhs.Mvb5s2KaO/m7zCdPR/XuOlSCL/1QdQy\",\"postIds\":[],\"nickName\":\"谢八\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"xieba\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:19:07');
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111116\",\"admin\":false,\"password\":\"cykj123456\",\"postIds\":[],\"nickName\":\"徐九\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"xujiu\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增用户\'xujiu\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2021-07-20 07:19:28');
INSERT INTO `sys_oper_log` VALUES (317, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15011111117\",\"admin\":false,\"password\":\"$2a$10$oqFbdZCU3alzfFypMA/Ca.JSEwY9RwajRsp9onKOyqfXPJ4ftLQK.\",\"postIds\":[],\"nickName\":\"徐九\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"xujiu\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-20 07:19:35');
INSERT INTO `sys_oper_log` VALUES (318, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623968475000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"管理员\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"http://47.105.165.206:9300/statics/2021/06/24/ff58cfc0-ead2-410f-baed-351795fce0cb.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1,2],\"createTime\":1623968475000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2021-07-20 07:20:38');
INSERT INTO `sys_oper_log` VALUES (319, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111112\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"李四\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"lisi\",\"userId\":5,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736616000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 03:25:37');
INSERT INTO `sys_oper_log` VALUES (320, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'lisi', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1626849827408,\"remark\":\"测试\",\"id\":1,\"params\":{},\"categoryName\":\"株洲流程测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 06:43:48');
INSERT INTO `sys_oper_log` VALUES (321, '租户管理', 1, 'com.cci.processmanager.controller.WorkFlowTenantController.add()', 'POST', 1, 'lisi', NULL, '/processTenant', '127.0.0.1', '', '{\"params\":{},\"tennatId\":\"ZZMT\",\"tenantName\":\"0\",\"createTime\":1626850002846,\"id\":1,\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 06:46:43');
INSERT INTO `sys_oper_log` VALUES (322, '租户管理', 1, 'com.cci.processmanager.controller.WorkFlowTenantController.add()', 'POST', 1, 'lisi', NULL, '/processTenant', '127.0.0.1', '', '{\"params\":{},\"tennatId\":\"CSLC\",\"tenantName\":\"0\",\"createTime\":1626850221292,\"id\":2,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 06:50:21');
INSERT INTO `sys_oper_log` VALUES (323, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111111\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"111@163.com\",\"nickName\":\"张三\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":4,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736594000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 10:35:34');
INSERT INTO `sys_oper_log` VALUES (324, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111113\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"王五\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"wangwu\",\"userId\":6,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736638000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 10:35:40');
INSERT INTO `sys_oper_log` VALUES (325, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111114\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"赵六\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhaoliu\",\"userId\":7,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736657000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 10:35:45');
INSERT INTO `sys_oper_log` VALUES (326, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111115\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"陈七\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"chenqi\",\"userId\":8,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736729000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 10:35:49');
INSERT INTO `sys_oper_log` VALUES (327, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111116\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"谢八\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"xieba\",\"userId\":9,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736747000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 10:35:53');
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"15011111117\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"徐九\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"城云科技\",\"leader\":\"钟明晓\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"xujiu\",\"userId\":10,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1626736775000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-21 10:35:58');
INSERT INTO `sys_oper_log` VALUES (329, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"orderNum\":\"0\",\"menuName\":\"发起流程\",\"params\":{},\"parentId\":2224,\"isCache\":\"0\",\"path\":\"homePageAdd\",\"component\":\"workBench/homePage/add/add.vue\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 08:22:30');
INSERT INTO `sys_oper_log` VALUES (330, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"0\",\"menuName\":\"发起流程\",\"params\":{},\"parentId\":2224,\"isCache\":\"0\",\"path\":\"homePageAdd\",\"component\":\"workBench/homePage/add/add\",\"children\":[],\"createTime\":1626913350000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2231,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 08:25:17');
INSERT INTO `sys_oper_log` VALUES (331, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"0\",\"menuName\":\"发起流程\",\"params\":{},\"parentId\":2224,\"isCache\":\"0\",\"path\":\"homePageAdd\",\"component\":\"workBench/homePage/add\",\"children\":[],\"createTime\":1626913350000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2231,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 08:28:24');
INSERT INTO `sys_oper_log` VALUES (332, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"0\",\"menuName\":\"发起流程\",\"params\":{},\"parentId\":2224,\"isCache\":\"0\",\"path\":\"homePageAdd\",\"component\":\"workBench/homePage/add\",\"children\":[],\"createTime\":1626913350000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2231,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 08:28:58');
INSERT INTO `sys_oper_log` VALUES (333, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"0\",\"menuName\":\"发起流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"homePageAdd\",\"component\":\"workBench/homePage/add\",\"children\":[],\"createTime\":1626913350000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2231,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 08:32:03');
INSERT INTO `sys_oper_log` VALUES (334, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'admin', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1626949112783,\"remark\":\"123123\",\"id\":7,\"params\":{},\"categoryName\":\"qweqwe\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:18:32');
INSERT INTO `sys_oper_log` VALUES (335, '流程分类', 3, 'com.cci.processmanager.controller.WorkFlowCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/processCategory/7', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:18:36');
INSERT INTO `sys_oper_log` VALUES (336, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'admin', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1626949128000,\"remark\":\"123234\",\"id\":8,\"params\":{},\"categoryName\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:18:48');
INSERT INTO `sys_oper_log` VALUES (337, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'admin', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1626949131507,\"remark\":\"23452345\",\"id\":9,\"params\":{},\"categoryName\":\"234512345\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:18:51');
INSERT INTO `sys_oper_log` VALUES (338, '流程分类', 3, 'com.cci.processmanager.controller.WorkFlowCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/processCategory/8,9', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:18:57');
INSERT INTO `sys_oper_log` VALUES (339, '流程分类', 1, 'com.cci.processmanager.controller.WorkFlowCategoryController.add()', 'POST', 1, 'admin', NULL, '/processCategory', '127.0.0.1', '', '{\"createTime\":1626949246515,\"remark\":\"123123\",\"id\":10,\"params\":{},\"categoryName\":\"123123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:20:46');
INSERT INTO `sys_oper_log` VALUES (340, '流程分类', 3, 'com.cci.processmanager.controller.WorkFlowCategoryController.remove()', 'DELETE', 1, 'admin', NULL, '/processCategory/10', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-22 10:20:51');
INSERT INTO `sys_oper_log` VALUES (341, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2148,2224,2231,2149,2150,2152,2153,2154,2151,2158,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2212,2213,2214,2215,2216,2217,2200,2201,2202,2203,2204,2205,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2146,2225,2226,2227,2228,2229,2230,2143,2164,2165,2166,2167,2168,2169,2000,2001,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-23 15:03:32');
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型设计器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"process/modelDesign\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-25 10:13:36');
INSERT INTO `sys_oper_log` VALUES (343, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型设计器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"modelDesign\",\"component\":\"processmanager/processModeDesign/index\",\"children\":[],\"createTime\":1627179216000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2232,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-25 10:15:23');
INSERT INTO `sys_oper_log` VALUES (344, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型设计器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"modelDesign\",\"component\":\"processmanager/processModelDesign/index\",\"children\":[],\"createTime\":1627179216000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2232,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-25 10:16:05');
INSERT INTO `sys_oper_log` VALUES (345, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"1\",\"menuName\":\"流程模型设计器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processModelDesign\",\"component\":\"processmanager/processModelDesign/index\",\"children\":[],\"createTime\":1627179216000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2232,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-07-25 10:18:45');
INSERT INTO `sys_oper_log` VALUES (346, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"15617908450\",\"admin\":false,\"remark\":\"薛严测试使用，暂时误删\",\"password\":\"$2a$10$hIi4TobOYK83aOuE5C9il.tQOV7ip5.MQp4XvYMtDtpE6qWd7SYSy\",\"postIds\":[1,2,3,4],\"email\":\"395535065@qq.com\",\"nickName\":\"xueyan测试\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"xueyan\",\"userId\":11,\"createBy\":\"admin\",\"roleIds\":[2,3],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-02 02:22:33');
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"example\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"流程模型设计器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processModelDesign\",\"component\":\"processmanager/processModelDesign/index\",\"children\":[],\"createTime\":1627179216000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2232,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-02 07:47:19');
INSERT INTO `sys_oper_log` VALUES (348, '部门管理', 1, 'com.ruoyi.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '183.129.154.138', '', '{\"deptName\":\"调解机构一\",\"leader\":\"刘燕\",\"orderNum\":\"1\",\"pageSize\":10,\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"phone\":\"15056565656\",\"ancestors\":\"0,100\",\"email\":\"15056565656@163.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-04 01:54:44');
INSERT INTO `sys_oper_log` VALUES (349, '部门管理', 1, 'com.ruoyi.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '183.129.154.138', '', '{\"deptName\":\"调解机构二\",\"leader\":\"钟明晓\",\"orderNum\":\"2\",\"pageSize\":10,\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"phone\":\"15757575757\",\"ancestors\":\"0,100\",\"email\":\"15757575757@163.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-04 01:55:16');
INSERT INTO `sys_oper_log` VALUES (350, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '183.129.154.138', '', '{\"phonenumber\":\"15050505050\",\"admin\":false,\"pageSize\":10,\"password\":\"$2a$10$Qel7ic41kEHXyU11c7Ronumu3KubQUpVAxUX89/o8ZO4astOw4bwm\",\"postIds\":[],\"email\":\"15050505050@163.com\",\"nickName\":\"调节机构一调解员1\",\"sex\":\"1\",\"deptId\":110,\"params\":{},\"userName\":\"tjy1\",\"userId\":12,\"createBy\":\"admin\",\"roleIds\":[3],\"pageIndex\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-04 01:56:43');
INSERT INTO `sys_oper_log` VALUES (351, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '183.129.154.138', '', '{\"phonenumber\":\"14040404040\",\"admin\":false,\"pageSize\":10,\"password\":\"$2a$10$9g9Zpy5.XcS/5nTh9BSUberIKsrPaKXj1X6NLXYwDZfHMFp63NivW\",\"postIds\":[],\"email\":\"14040404040@163.com\",\"nickName\":\"调解机构二调解员2\",\"sex\":\"0\",\"deptId\":111,\"params\":{},\"userName\":\"tjy2\",\"userId\":13,\"createBy\":\"admin\",\"roleIds\":[3],\"pageIndex\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-04 01:57:36');
INSERT INTO `sys_oper_log` VALUES (352, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"表单模型设计器\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"form/designModel\",\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-04 07:44:07');
INSERT INTO `sys_oper_log` VALUES (353, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"表单模型设计器\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"form/designModel\",\"component\":\"processmanager/formModelDesign/index\",\"children\":[],\"createTime\":1628034247000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2233,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-04 07:44:58');
INSERT INTO `sys_oper_log` VALUES (354, '单模型', 1, 'com.cci.processmanager.controller.WorkFlowFormModelController.add()', 'POST', 1, 'admin', NULL, '/model', '127.0.0.1', '', '{\"modelId\":1,\"params\":{},\"createTime\":1628134032863}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-05 03:27:14');
INSERT INTO `sys_oper_log` VALUES (355, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"表单模型\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"model\",\"component\":\"processmanager/model/indexx\",\"children\":[],\"createTime\":1625019434000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2164,\"menuType\":\"C\",\"perms\":\"processmanager:model:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-10 07:14:37');
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"表单构建\",\"params\":{},\"parentId\":2143,\"isCache\":\"0\",\"path\":\"build\",\"component\":\"tool/build/index\",\"children\":[],\"createTime\":1623968476000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":114,\"menuType\":\"C\",\"perms\":\"tool:build:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-10 07:15:23');
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/todo\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:20:09');
INSERT INTO `sys_oper_log` VALUES (358, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/todo\",\"component\":\"workBench/todo\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:22:24');
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/todo\",\"component\":\"workBench/todo/index\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:24:07');
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/todo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:27:54');
INSERT INTO `sys_oper_log` VALUES (361, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"homePage/group\",\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:44:45');
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"homePage/group\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:45:24');
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/group\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:45:40');
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/group\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:46:00');
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"已办列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/done\",\"component\":\"workBench/done/DoneMission\",\"children\":[],\"createTime\":1624228705000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2150,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:01');
INSERT INTO `sys_oper_log` VALUES (366, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/group\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:14');
INSERT INTO `sys_oper_log` VALUES (367, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"pageSize\":10,\"menuName\":\"已办列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/done\",\"component\":\"workBench/done/DoneMission\",\"children\":[],\"createTime\":1624228705000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2150,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:24');
INSERT INTO `sys_oper_log` VALUES (368, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"7\",\"pageSize\":10,\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/myProcess\",\"children\":[],\"createTime\":1624228776000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2151,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:33');
INSERT INTO `sys_oper_log` VALUES (369, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"6\",\"pageSize\":10,\"menuName\":\"已延时\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/overTime\",\"children\":[],\"createTime\":1624229123000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2154,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:40');
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"star\",\"orderNum\":\"5\",\"pageSize\":10,\"menuName\":\"转办给我\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/turnToMe\",\"children\":[],\"createTime\":1624229058000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2153,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:45');
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"slider\",\"orderNum\":\"4\",\"pageSize\":10,\"menuName\":\"我的转办\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/turnToOthers\",\"children\":[],\"createTime\":1624228993000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2152,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 02:55:51');
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"7\",\"pageSize\":10,\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/myProcess\",\"component\":\"workBench/sent/SentMission\",\"children\":[],\"createTime\":1624228776000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2151,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:25:57');
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuTodo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:33:16');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuGroup\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:33:36');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"pageSize\":10,\"menuName\":\"已办列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/done\",\"component\":\"workBench/done/DoneMission\",\"children\":[],\"createTime\":1624228705000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2150,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:35:56');
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/group\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:36:07');
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/todo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:36:17');
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"待办组任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuGroup\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:36:54');
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuTodo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:37:01');
INSERT INTO `sys_oper_log` VALUES (380, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"pageSize\":10,\"menuName\":\"已办列表\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuDone\",\"component\":\"workBench/done/DoneMission\",\"children\":[],\"createTime\":1624228705000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2150,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:37:08');
INSERT INTO `sys_oper_log` VALUES (381, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"7\",\"pageSize\":10,\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuMyProcess\",\"component\":\"workBench/sent/SentMission\",\"children\":[],\"createTime\":1624228776000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2151,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-23 03:37:57');
INSERT INTO `sys_oper_log` VALUES (382, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_listener', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 01:26:40');
INSERT INTO `sys_oper_log` VALUES (383, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'work_flow_expression', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 01:26:54');
INSERT INTO `sys_oper_log` VALUES (384, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-08-24 02:10:56');
INSERT INTO `sys_oper_log` VALUES (385, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"6\",\"pageSize\":10,\"menuName\":\"已延时\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/overTime\",\"component\":\"workBench/overTime/overTime\",\"children\":[],\"createTime\":1624229123000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2154,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 02:10:59');
INSERT INTO `sys_oper_log` VALUES (386, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-08-24 02:11:21');
INSERT INTO `sys_oper_log` VALUES (387, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, 'null', 0, NULL, '2021-08-24 02:11:30');
INSERT INTO `sys_oper_log` VALUES (388, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"slider\",\"orderNum\":\"4\",\"pageSize\":10,\"menuName\":\"我的转办\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/turnToOthers\",\"children\":[],\"createTime\":1624228993000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2152,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 02:15:40');
INSERT INTO `sys_oper_log` VALUES (389, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"1\",\"icon\":\"star\",\"orderNum\":\"5\",\"pageSize\":10,\"menuName\":\"转办给我\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/turnToMe\",\"children\":[],\"createTime\":1624229058000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2153,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 02:15:44');
INSERT INTO `sys_oper_log` VALUES (390, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"5\",\"pageSize\":10,\"menuName\":\"流程监听器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"monitors\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"新增菜单\'流程监听器\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2021-08-24 02:21:09');
INSERT INTO `sys_oper_log` VALUES (391, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"5\",\"pageSize\":10,\"menuName\":\"流程监听器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"/monitors\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"新增菜单\'流程监听器\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2021-08-24 02:21:16');
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"5\",\"pageSize\":10,\"menuName\":\"流程监听器2\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"/monitors\",\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 02:21:25');
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2247', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-24 02:23:04');
INSERT INTO `sys_oper_log` VALUES (394, '租户管理', 1, 'com.cci.processmanager.controller.WorkFlowTenantController.add()', 'POST', 1, 'admin', NULL, '/processTenant', '183.129.154.138', '', '{\"params\":{},\"createTime\":1629877232393,\"id\":4,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 07:40:34');
INSERT INTO `sys_oper_log` VALUES (395, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办任务\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuTodo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 08:17:49');
INSERT INTO `sys_oper_log` VALUES (396, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"待办组任务\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuGroup\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 08:18:01');
INSERT INTO `sys_oper_log` VALUES (397, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuTodo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 08:18:42');
INSERT INTO `sys_oper_log` VALUES (398, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"4\",\"pageSize\":10,\"menuName\":\"流程审核按钮\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processButton\",\"component\":\"processmanager/processButton/index\",\"children\":[],\"createTime\":1626215400000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2225,\"menuType\":\"C\",\"perms\":\"processmanager:processButton:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 08:18:59');
INSERT INTO `sys_oper_log` VALUES (399, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"4\",\"pageSize\":10,\"menuName\":\"引擎元信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"process\",\"children\":[],\"createTime\":1623978939000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 09:15:44');
INSERT INTO `sys_oper_log` VALUES (400, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"6\",\"pageSize\":10,\"menuName\":\"引擎系统设置\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"workflowConfig\",\"children\":[],\"createTime\":1624400595000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2161,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 09:16:17');
INSERT INTO `sys_oper_log` VALUES (401, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"form\",\"orderNum\":\"3\",\"pageSize\":10,\"menuName\":\"自定义表单\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"buildTables\",\"children\":[],\"createTime\":1624227692000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2143,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 09:16:27');
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"6\",\"pageSize\":10,\"menuName\":\"限时任务\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenu/overTime\",\"component\":\"workBench/overTime/overTime\",\"children\":[],\"createTime\":1624229123000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2154,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 09:22:30');
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '183.129.154.138', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"pageSize\":10,\"menuName\":\"已办任务\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"workMenuDone\",\"component\":\"workBench/done/DoneMission\",\"children\":[],\"createTime\":1624228705000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2150,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-25 09:23:05');
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"流程表达式\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processExpression\",\"component\":\"processmanager/processExpression/index\",\"children\":[],\"createTime\":1629742622000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2235,\"menuType\":\"C\",\"perms\":\"processmanager:processExpression:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-08-26 09:09:54');
INSERT INTO `sys_oper_log` VALUES (405, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '183.129.154.138', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"pageSize\":10,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"pageIndex\":1,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":2,\"admin\":false,\"pageSize\":10,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"pageIndex\":1,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1623968475000,\"pageSize\":10,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"管理员\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"http://47.105.165.206:9300/statics/2021/06/24/ff58cfc0-ead2-410f-baed-351795fce0cb.jpeg\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"pageSize\":10,\"params\":{},\"parentId\":101,\"children\":[],\"pageIndex\":1,\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1,2],\"createTime\":1623968475000,\"pageIndex\":1,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2021-09-03 10:19:10');
INSERT INTO `sys_oper_log` VALUES (406, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '183.129.154.138', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"pageSize\":10,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"pageIndex\":1,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2148,2143,2224,2231,2149,2150,2152,2153,2154,2151,2158,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2212,2213,2214,2215,2216,2217,2200,2201,2202,2203,2204,2205,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2232,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2146,2225,2226,2227,2228,2229,2230,2164,2165,2166,2167,2168,2169,2000,2001,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2062,2063,2064,2065,2066,2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096,2097,2098,2099,2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:22:30');
INSERT INTO `sys_oper_log` VALUES (407, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '183.129.154.138', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"pageSize\":10,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"pageIndex\":1,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":2,\"admin\":false,\"pageSize\":10,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"pageIndex\":1,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1623968475000,\"pageSize\":10,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"1111@163.com\",\"nickName\":\"测试人员\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"pageSize\":10,\"params\":{},\"parentId\":101,\"children\":[],\"pageIndex\":1,\"status\":\"0\"},\"params\":{},\"userName\":\"cs\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[3],\"createTime\":1623968475000,\"pageIndex\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:23:46');
INSERT INTO `sys_oper_log` VALUES (408, '租户管理', 3, 'com.cci.processmanager.controller.WorkFlowTenantController.remove()', 'DELETE', 1, 'cs', NULL, '/processTenant/3', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:24:42');
INSERT INTO `sys_oper_log` VALUES (409, '租户管理', 3, 'com.cci.processmanager.controller.WorkFlowTenantController.remove()', 'DELETE', 1, 'cs', NULL, '/processTenant/4', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:24:45');
INSERT INTO `sys_oper_log` VALUES (410, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915755000,\"remark\":\"测试\",\"updateTime\":1630664898440,\"id\":1,\"params\":{},\"categoryName\":\"土豆1部流程测试\",\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:28:18');
INSERT INTO `sys_oper_log` VALUES (411, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915787000,\"remark\":\"测试\",\"updateTime\":1630664906383,\"id\":2,\"params\":{},\"categoryName\":\"土豆2部流程测试\",\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:28:26');
INSERT INTO `sys_oper_log` VALUES (412, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915805000,\"remark\":\"测试\",\"updateTime\":1630664914074,\"id\":3,\"params\":{},\"categoryName\":\"土豆3部流程测试\",\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:28:34');
INSERT INTO `sys_oper_log` VALUES (413, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915837000,\"remark\":\"测试\",\"updateTime\":1630664931236,\"id\":4,\"params\":{},\"categoryName\":\"土豆4部流程测试\",\"parentId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:28:51');
INSERT INTO `sys_oper_log` VALUES (414, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915863000,\"remark\":\"测试\",\"updateTime\":1630664941118,\"id\":5,\"params\":{},\"categoryName\":\"土豆5部流程测试\",\"parentId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:29:01');
INSERT INTO `sys_oper_log` VALUES (415, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915892000,\"remark\":\"测试\",\"updateTime\":1630664949787,\"id\":6,\"params\":{},\"categoryName\":\"土豆6部程测试\",\"parentId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:29:09');
INSERT INTO `sys_oper_log` VALUES (416, '流程分类', 3, 'com.cci.processmanager.controller.WorkFlowCategoryController.remove()', 'DELETE', 1, 'cs', NULL, '/processCategory/7', '183.129.154.138', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:29:13');
INSERT INTO `sys_oper_log` VALUES (417, '流程分类', 2, 'com.cci.processmanager.controller.WorkFlowCategoryController.edit()', 'PUT', 1, 'cs', NULL, '/processCategory', '183.129.154.138', '', '{\"createTime\":1626915755000,\"remark\":\"测试\",\"updateTime\":1630665209625,\"id\":1,\"params\":{},\"categoryName\":\"土豆1部流程测试1\",\"parentId\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 10:33:29');
INSERT INTO `sys_oper_log` VALUES (418, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"pageSize\":10,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"pageIndex\":1,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2148,2143,2224,2231,2149,2150,2152,2153,2154,2151,2158,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2212,2213,2214,2215,2216,2217,2200,2201,2202,2203,2204,2205,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2232,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2146,2225,2226,2227,2228,2229,2230,114,2233,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 14:35:45');
INSERT INTO `sys_oper_log` VALUES (419, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"pageSize\":10,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"pageIndex\":1,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2148,2143,2224,2231,2149,2150,2152,2153,2154,2151,2158,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2212,2213,2214,2215,2216,2217,2200,2201,2202,2203,2204,2205,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2232,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2146,2225,2226,2227,2228,2229,2230,114,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 14:36:18');
INSERT INTO `sys_oper_log` VALUES (420, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'cs', NULL, '/user/profile/updatePwd', '127.0.0.1', '', 'cykj123456 tdkj123456', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-03 14:37:18');
INSERT INTO `sys_oper_log` VALUES (421, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"pageSize\":10,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"pageIndex\":1,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2148,2158,2143,2224,2231,2149,2150,2152,2153,2154,2151,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2232,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2146,2225,2226,2227,2228,2229,2230,114,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 15:15:52');
INSERT INTO `sys_oper_log` VALUES (422, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"tab\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"个人工作台\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"/personal/workBench\",\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:07:53');
INSERT INTO `sys_oper_log` VALUES (423, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"table\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"管理工作台\",\"params\":{},\"parentId\":2148,\"isCache\":\"0\",\"path\":\"/management/workBench\",\"createBy\":\"admin\",\"children\":[],\"pageIndex\":1,\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:08:35');
INSERT INTO `sys_oper_log` VALUES (424, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"client\",\"orderNum\":\"0\",\"pageSize\":10,\"menuName\":\"工作台首页\",\"params\":{},\"parentId\":2247,\"isCache\":\"0\",\"path\":\"homePage\",\"component\":\"workBench/homePage/index\",\"children\":[],\"createTime\":1625767432000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2224,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:08:57');
INSERT INTO `sys_oper_log` VALUES (425, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"待办个人任务\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenuTodo\",\"component\":\"workBench/todo/PersonalMission\",\"children\":[],\"createTime\":1624228670000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2149,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:09:23');
INSERT INTO `sys_oper_log` VALUES (426, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"2\",\"pageSize\":10,\"menuName\":\"待办组任务\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenuGroup\",\"component\":\"workBench/group/GroupMission\",\"children\":[],\"createTime\":1629657885000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2234,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:09:37');
INSERT INTO `sys_oper_log` VALUES (427, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"3\",\"pageSize\":10,\"menuName\":\"已办任务\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenuDone\",\"component\":\"workBench/done/DoneMission\",\"children\":[],\"createTime\":1624228705000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2150,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:09:45');
INSERT INTO `sys_oper_log` VALUES (428, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"1\",\"icon\":\"slider\",\"orderNum\":\"4\",\"pageSize\":10,\"menuName\":\"我的转办\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenu/turnToOthers\",\"children\":[],\"createTime\":1624228993000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2152,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:10:08');
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"1\",\"icon\":\"star\",\"orderNum\":\"5\",\"pageSize\":10,\"menuName\":\"转办给我\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenu/turnToMe\",\"children\":[],\"createTime\":1624229058000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2153,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:10:16');
INSERT INTO `sys_oper_log` VALUES (430, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"time\",\"orderNum\":\"6\",\"pageSize\":10,\"menuName\":\"限时任务\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenu/overTime\",\"component\":\"workBench/overTime/overTime\",\"children\":[],\"createTime\":1624229123000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2154,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:10:24');
INSERT INTO `sys_oper_log` VALUES (431, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"7\",\"pageSize\":10,\"menuName\":\"我发起的流程\",\"params\":{},\"parentId\":2248,\"isCache\":\"0\",\"path\":\"workMenuMyProcess\",\"component\":\"workBench/sent/SentMission\",\"children\":[],\"createTime\":1624228776000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2151,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:10:32');
INSERT INTO `sys_oper_log` VALUES (432, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '115.192.215.27', '', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"pageSize\":10,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"0\",\"deptCheckStrictly\":true,\"createTime\":1626287645000,\"pageIndex\":1,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"lcyqcs\",\"roleName\":\"流程引擎测试\",\"menuIds\":[2158,2143,2148,2231,2247,2224,2248,2149,2234,2150,2152,2153,2154,2151,2194,2195,2196,2197,2198,2199,2218,2219,2220,2221,2222,2223,2144,2170,2171,2172,2173,2174,2175,2188,2189,2190,2191,2192,2193,2232,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2146,2225,2226,2227,2228,2229,2230,114,2161,2176,2177,2178,2179,2180,2181,2162,2163],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:13:22');
INSERT INTO `sys_oper_log` VALUES (433, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"流程表达式\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processExpression\",\"component\":\"processmanager/processExpression/index\",\"children\":[],\"createTime\":1629742622000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2235,\"menuType\":\"C\",\"perms\":\"processmanager:processExpression:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:15:26');
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"0\",\"icon\":\"skill\",\"orderNum\":\"1\",\"pageSize\":10,\"menuName\":\"流程监听器\",\"params\":{},\"parentId\":2144,\"isCache\":\"0\",\"path\":\"processListener\",\"component\":\"processmanager/processListener/index\",\"children\":[],\"createTime\":1629742636000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2241,\"menuType\":\"C\",\"perms\":\"processmanager:processListener:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-04 16:15:56');
INSERT INTO `sys_oper_log` VALUES (435, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'cs', NULL, '/user/profile/avatar', '115.192.215.27', '', '', '{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}', 0, NULL, '2021-09-04 16:20:00');
INSERT INTO `sys_oper_log` VALUES (436, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '115.192.215.27', '', '{\"visible\":\"1\",\"icon\":\"#\",\"orderNum\":\"0\",\"pageSize\":10,\"menuName\":\"发起流程\",\"params\":{},\"parentId\":2247,\"isCache\":\"0\",\"path\":\"homePageAdd\",\"component\":\"workBench/homePage/add\",\"children\":[],\"createTime\":1626913350000,\"pageIndex\":1,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2231,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-05 12:19:49');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-06-18 06:21:15', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-06-18 06:21:15', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-06-18 06:21:15', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-06-18 06:21:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-06-18 06:21:15', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-06-18 06:21:15', 'admin', '2021-06-18 15:52:00', '普通角色');
INSERT INTO `sys_role` VALUES (3, '流程引擎测试', 'lcyqcs', 0, '1', 1, 1, '0', '0', 'admin', '2021-07-15 02:34:05', 'admin', '2021-09-04 16:13:22', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (3, 114);
INSERT INTO `sys_role_menu` VALUES (3, 2143);
INSERT INTO `sys_role_menu` VALUES (3, 2144);
INSERT INTO `sys_role_menu` VALUES (3, 2146);
INSERT INTO `sys_role_menu` VALUES (3, 2148);
INSERT INTO `sys_role_menu` VALUES (3, 2149);
INSERT INTO `sys_role_menu` VALUES (3, 2150);
INSERT INTO `sys_role_menu` VALUES (3, 2151);
INSERT INTO `sys_role_menu` VALUES (3, 2152);
INSERT INTO `sys_role_menu` VALUES (3, 2153);
INSERT INTO `sys_role_menu` VALUES (3, 2154);
INSERT INTO `sys_role_menu` VALUES (3, 2158);
INSERT INTO `sys_role_menu` VALUES (3, 2161);
INSERT INTO `sys_role_menu` VALUES (3, 2162);
INSERT INTO `sys_role_menu` VALUES (3, 2163);
INSERT INTO `sys_role_menu` VALUES (3, 2170);
INSERT INTO `sys_role_menu` VALUES (3, 2171);
INSERT INTO `sys_role_menu` VALUES (3, 2172);
INSERT INTO `sys_role_menu` VALUES (3, 2173);
INSERT INTO `sys_role_menu` VALUES (3, 2174);
INSERT INTO `sys_role_menu` VALUES (3, 2175);
INSERT INTO `sys_role_menu` VALUES (3, 2176);
INSERT INTO `sys_role_menu` VALUES (3, 2177);
INSERT INTO `sys_role_menu` VALUES (3, 2178);
INSERT INTO `sys_role_menu` VALUES (3, 2179);
INSERT INTO `sys_role_menu` VALUES (3, 2180);
INSERT INTO `sys_role_menu` VALUES (3, 2181);
INSERT INTO `sys_role_menu` VALUES (3, 2188);
INSERT INTO `sys_role_menu` VALUES (3, 2189);
INSERT INTO `sys_role_menu` VALUES (3, 2190);
INSERT INTO `sys_role_menu` VALUES (3, 2191);
INSERT INTO `sys_role_menu` VALUES (3, 2192);
INSERT INTO `sys_role_menu` VALUES (3, 2193);
INSERT INTO `sys_role_menu` VALUES (3, 2194);
INSERT INTO `sys_role_menu` VALUES (3, 2195);
INSERT INTO `sys_role_menu` VALUES (3, 2196);
INSERT INTO `sys_role_menu` VALUES (3, 2197);
INSERT INTO `sys_role_menu` VALUES (3, 2198);
INSERT INTO `sys_role_menu` VALUES (3, 2199);
INSERT INTO `sys_role_menu` VALUES (3, 2218);
INSERT INTO `sys_role_menu` VALUES (3, 2219);
INSERT INTO `sys_role_menu` VALUES (3, 2220);
INSERT INTO `sys_role_menu` VALUES (3, 2221);
INSERT INTO `sys_role_menu` VALUES (3, 2222);
INSERT INTO `sys_role_menu` VALUES (3, 2223);
INSERT INTO `sys_role_menu` VALUES (3, 2224);
INSERT INTO `sys_role_menu` VALUES (3, 2225);
INSERT INTO `sys_role_menu` VALUES (3, 2226);
INSERT INTO `sys_role_menu` VALUES (3, 2227);
INSERT INTO `sys_role_menu` VALUES (3, 2228);
INSERT INTO `sys_role_menu` VALUES (3, 2229);
INSERT INTO `sys_role_menu` VALUES (3, 2230);
INSERT INTO `sys_role_menu` VALUES (3, 2231);
INSERT INTO `sys_role_menu` VALUES (3, 2232);
INSERT INTO `sys_role_menu` VALUES (3, 2234);
INSERT INTO `sys_role_menu` VALUES (3, 2235);
INSERT INTO `sys_role_menu` VALUES (3, 2236);
INSERT INTO `sys_role_menu` VALUES (3, 2237);
INSERT INTO `sys_role_menu` VALUES (3, 2238);
INSERT INTO `sys_role_menu` VALUES (3, 2239);
INSERT INTO `sys_role_menu` VALUES (3, 2240);
INSERT INTO `sys_role_menu` VALUES (3, 2241);
INSERT INTO `sys_role_menu` VALUES (3, 2242);
INSERT INTO `sys_role_menu` VALUES (3, 2243);
INSERT INTO `sys_role_menu` VALUES (3, 2244);
INSERT INTO `sys_role_menu` VALUES (3, 2245);
INSERT INTO `sys_role_menu` VALUES (3, 2246);
INSERT INTO `sys_role_menu` VALUES (3, 2247);
INSERT INTO `sys_role_menu` VALUES (3, 2248);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', 'http://47.105.165.206:9300/statics/2021/06/24/ff58cfc0-ead2-410f-baed-351795fce0cb.jpeg', '$2a$10$XrcGtvGSG06P.tcmWowbuuQon38S.BakjKEVuo4aT/JZa/Xr8RfJW', '0', '0', '127.0.0.1', '2021-06-18 06:21:15', 'admin', '2021-06-18 06:21:15', '', '2021-06-24 05:22:08', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'cs', '测试人员', '00', '1111@163.com', '15666666666', '1', '', '$2a$10$kVwBj.c/tiQOAU1EFY3HselTzASpcrKLLA8eVSpxaP93LakzrWzK6', '0', '0', '127.0.0.1', '2021-06-18 06:21:15', 'admin', '2021-06-18 06:21:15', 'admin', '2021-09-03 10:23:46', '测试员');
INSERT INTO `sys_user` VALUES (3, 100, 'yckj', '土豆测试', '00', '17757144205@163.com', '17757144205', '0', 'http://47.105.165.206:9300/statics/2021/07/15/49f4c50c-1a26-4086-9b9f-b21961eaf352.jpeg', '$2a$10$xTs/Emk4nVYU1LB74PJPAOOjsym4C2BPBZG5mB8tPjJ/IJlu7emw6', '0', '0', '', NULL, 'admin', '2021-07-15 02:33:05', 'admin', '2021-07-15 02:43:57', '城云测试');
INSERT INTO `sys_user` VALUES (4, 100, 'zhangsan', '张三', '00', '111@163.com', '15011111111', '0', '', '$2a$10$/pD42m5aw2/hWNdqVVuasuNjr3uxru0TA3lwXafL5WsQmWTUIq6mm', '0', '0', '', NULL, 'admin', '2021-07-20 07:16:34', 'admin', '2021-07-21 10:35:34', NULL);
INSERT INTO `sys_user` VALUES (5, 100, 'lisi', '李四', '00', '', '15011111112', '0', '', '$2a$10$BHFPlzLHMg.rcbH0ic0IFO2JwXcjl4w.cl1DAj5yjo54f/ODg5/oi', '0', '0', '', NULL, 'admin', '2021-07-20 07:16:56', 'admin', '2021-07-21 03:25:37', NULL);
INSERT INTO `sys_user` VALUES (6, 100, 'wangwu', '王五', '00', '', '15011111113', '0', '', '$2a$10$49v8gY2hFgU450s2CS0S1OgwQiJ3Q94X1dy.wDf25Ba3zHMGA7voG', '0', '0', '', NULL, 'admin', '2021-07-20 07:17:18', 'admin', '2021-07-21 10:35:40', NULL);
INSERT INTO `sys_user` VALUES (7, 100, 'zhaoliu', '赵六', '00', '', '15011111114', '0', '', '$2a$10$uDMz8e0PiMQqn5KFGcpPM.MsEPZqEb4dxMjojhnRJst00QvEpaUaS', '0', '0', '', NULL, 'admin', '2021-07-20 07:17:37', 'admin', '2021-07-21 10:35:45', NULL);
INSERT INTO `sys_user` VALUES (8, 100, 'chenqi', '陈七', '00', '', '15011111115', '0', '', '$2a$10$Zn.wo1/dnktYydj2ENF.2OeREN1rKZIAMLQo784y4vPhCUSaWucS.', '0', '0', '', NULL, 'admin', '2021-07-20 07:18:49', 'admin', '2021-07-21 10:35:49', NULL);
INSERT INTO `sys_user` VALUES (9, 100, 'xieba', '谢八', '00', '', '15011111116', '0', '', '$2a$10$1GtqQ2sFANaBPW7QrBkhs.Mvb5s2KaO/m7zCdPR/XuOlSCL/1QdQy', '0', '0', '', NULL, 'admin', '2021-07-20 07:19:07', 'admin', '2021-07-21 10:35:53', NULL);
INSERT INTO `sys_user` VALUES (10, 100, 'xujiu', '徐九', '00', '', '15011111117', '0', '', '$2a$10$oqFbdZCU3alzfFypMA/Ca.JSEwY9RwajRsp9onKOyqfXPJ4ftLQK.', '0', '0', '', NULL, 'admin', '2021-07-20 07:19:35', 'admin', '2021-07-21 10:35:58', NULL);
INSERT INTO `sys_user` VALUES (11, 100, 'xueyan', 'xueyan测试', '00', '395535065@qq.com', '15617908450', '0', '', '$2a$10$hIi4TobOYK83aOuE5C9il.tQOV7ip5.MQp4XvYMtDtpE6qWd7SYSy', '0', '0', '', NULL, 'admin', '2021-08-02 02:22:32', '', NULL, '薛严测试使用，暂时误删');
INSERT INTO `sys_user` VALUES (12, 110, 'tjy1', '调节机构一调解员1', '00', '15050505050@163.com', '15050505050', '1', '', '$2a$10$Qel7ic41kEHXyU11c7Ronumu3KubQUpVAxUX89/o8ZO4astOw4bwm', '0', '0', '', NULL, 'admin', '2021-08-04 01:56:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 111, 'tjy2', '调解机构二调解员2', '00', '14040404040@163.com', '14040404040', '0', '', '$2a$10$9g9Zpy5.XcS/5nTh9BSUberIKsrPaKXj1X6NLXYwDZfHMFp63NivW', '0', '0', '', NULL, 'admin', '2021-08-04 01:57:36', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 2);
INSERT INTO `sys_user_post` VALUES (11, 1);
INSERT INTO `sys_user_post` VALUES (11, 2);
INSERT INTO `sys_user_post` VALUES (11, 3);
INSERT INTO `sys_user_post` VALUES (11, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1, 2);
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 3);
INSERT INTO `sys_user_role` VALUES (6, 3);
INSERT INTO `sys_user_role` VALUES (7, 3);
INSERT INTO `sys_user_role` VALUES (8, 3);
INSERT INTO `sys_user_role` VALUES (9, 3);
INSERT INTO `sys_user_role` VALUES (10, 3);
INSERT INTO `sys_user_role` VALUES (11, 2);
INSERT INTO `sys_user_role` VALUES (11, 3);
INSERT INTO `sys_user_role` VALUES (12, 3);
INSERT INTO `sys_user_role` VALUES (13, 3);

SET FOREIGN_KEY_CHECKS = 1;
