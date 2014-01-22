/*
Navicat MySQL Data Transfer

Source Server         : localhost_test
Source Server Version : 50535
Source Host           : localhost:3306
Source Database       : comm_sys_manager

Target Server Type    : MYSQL
Target Server Version : 50535
File Encoding         : 65001

Date: 2014-01-22 15:37:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` char(1) DEFAULT NULL COMMENT '0--表示正常、1--表示异常信息',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `opera_ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户使用操作系统、浏览器种类等代理环境',
  `request_uri` varchar(255) DEFAULT NULL,
  `method` varchar(5) DEFAULT NULL COMMENT '请求方法',
  `params` text COMMENT '请求参数',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`log_id`),
  KEY `IDX_TYPE_ID_SL` (`type_id`),
  KEY `IDX_CREATE_BY_SL` (`create_by`),
  KEY `IDX_CREATE_TIME_SL` (`create_time`),
  KEY `IDX_REQUEST_URI_SL` (`request_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `parent_ids` varchar(255) NOT NULL COMMENT '父级菜单所有的父类id组合，用逗号隔开',
  `menu_name` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `is_show` char(1) NOT NULL COMMENT '0--不显示、1--显示',
  `sort` int(11) NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_PARENT_ID_SM` (`parent_id`),
  KEY `IDX_PARENT_IDS_SM` (`parent_ids`),
  KEY `IDX_CREATE_BY_SM` (`create_by`),
  KEY `IDX_CREATE_TIME_SM` (`create_time`),
  KEY `IDX_UPDATE_BY_SM` (`update_by`),
  KEY `IDX_UPDATE_TIME_SM` (`update_time`),
  KEY `IDX_PERMISSION_SM` (`permission`),
  KEY `IDX_SORT_SM` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL COMMENT '角色备注',
  `create_by` bigint(20) DEFAULT NULL,
  `roles` varchar(200) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  KEY `IDX_ROLE_ID_SRM` (`role_id`),
  KEY `IDX_MENU_ID_SRM` (`menu_id`),
  CONSTRAINT `FK_MENU_ID_SRM` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `FK_ROLE_ID_SRM` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `nick_name` varchar(100) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `user_type` char(1) DEFAULT NULL,
  `last_login_ip` varchar(100) DEFAULT NULL COMMENT '最后一次登录的ip地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_USER_NAME_SU` (`user_name`),
  KEY `IDX_PASSWORD_SU` (`password`(255)),
  KEY `IDX_NICK_NAME_SU` (`nick_name`),
  KEY `IDX_EMAIL_SU` (`email`),
  KEY `IDX_LAST_LOGIN_IP_SU` (`last_login_ip`),
  KEY `IDX_CREATE_TIME` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  KEY `IDX_USER_ID_SUR` (`user_id`),
  KEY `IDX_ROLE_ID_SUR` (`role_id`),
  CONSTRAINT `FK_ROLE_ID_SUR` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `FK_USER_ID_SUR` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
