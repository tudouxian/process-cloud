/*
 Navicat Premium Data Transfer

 Source Server         : localhost本机
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : workflow_form

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 10/09/2021 21:25:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for work_flow_form_category
-- ----------------------------
DROP TABLE IF EXISTS `work_flow_form_category`;
CREATE TABLE `work_flow_form_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类编码',
  `category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '上级分类id',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表单分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for work_flow_form_model
-- ----------------------------
DROP TABLE IF EXISTS `work_flow_form_model`;
CREATE TABLE `work_flow_form_model`  (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_info_id` int(11) NULL DEFAULT NULL COMMENT '表单模型id',
  `form_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单唯一标识Key：用于关联流程',
  `form_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单配置json',
  `form_type` tinyint(1) NULL DEFAULT 0 COMMENT '状态值-0：pc表单 1：移动端表单',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态1-未发布，2-已发布',
  `main_version` tinyint(1) NULL DEFAULT 0 COMMENT '是否为主版本',
  `config_json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单表头字段配置',
  `release_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本说明',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE INDEX `idx_unique_form_key`(`form_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自定义表单模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for work_flow_form_model_info
-- ----------------------------
DROP TABLE IF EXISTS `work_flow_form_model_info`;
CREATE TABLE `work_flow_form_model_info`  (
  `model_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表单模型信息主键',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '表单分类ID',
  `category_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单分类名称',
  `form_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `form_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主版本formKey=》用于关联工作流',
  `version` int(11) NULL DEFAULT 1 COMMENT '主版本版本号',
  `form_model_type` tinyint(1) NULL DEFAULT 0 COMMENT '默认：0-外部表单 1-自定义表单',
  `creator` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标识1表示删除0表示存在',
  PRIMARY KEY (`model_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '表单模型信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
