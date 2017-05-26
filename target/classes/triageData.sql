/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50711
Source Host           : 127.0.0.1:3306
Source Database       : triage

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-04-11 00:18:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '男科', '3楼A区', '555');
INSERT INTO `dept` VALUES ('2', '外科', '1楼A区', '2222222');
INSERT INTO `dept` VALUES ('3', '信息科', '5楼B区', '132546');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', '正常', '0', 'user', '用户状态', '1', null, null);
INSERT INTO `dict` VALUES ('2', '禁用', '1', 'user', '用户状态', '2', null, null);
INSERT INTO `dict` VALUES ('4', '普通用户', '0', 'user', '用户类型', null, null, null);
INSERT INTO `dict` VALUES ('5', '会员用户', '1', 'user', '用户类型', null, null, null);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATION_CODE` varchar(50) NOT NULL COMMENT '操作编码',
  `CREATER` varchar(20) DEFAULT NULL COMMENT '操作用户名称',
  `CREATE_DATE` datetime NOT NULL COMMENT '日志生成时间',
  `TYPE` int(11) DEFAULT NULL COMMENT '日志类型: 1：安全日志 2：表示操作日志',
  `OS` varchar(20) DEFAULT NULL,
  `BROWSER` varchar(20) DEFAULT NULL COMMENT '浏览器类型',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `MAC` varchar(20) DEFAULT NULL COMMENT '物理地址',
  `EXECUTE_TIME` int(11) DEFAULT NULL COMMENT '执行时间',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '详细描述',
  `REQUEST_PARAM` varchar(500) DEFAULT NULL COMMENT '请求参数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日录资料表';

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `Id_card` varchar(45) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Urgent_phone` varchar(20) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Birthday` varchar(45) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('1', '张三', '123456', '645312', '999', '南非', '2015-03-02 00:00:00', '1');
INSERT INTO `patient` VALUES ('3', '李四', '348934', '', '', '', null, '1');
INSERT INTO `patient` VALUES ('4', '王五', '', '', '', '', null, '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT '父节点名称',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '类型:菜单or功能',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `URL` varchar(255) DEFAULT NULL,
  `PERM_CODE` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `ICON` varchar(255) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', null, '系统管理', 'F', '2', '', '', 'icon-standard-cog', '', '');
INSERT INTO `permission` VALUES ('2', '1', '角色管理', 'F', '3', 'system/role', '', 'icon-hamburg-my-account', 'closed', '');
INSERT INTO `permission` VALUES ('3', '1', '用户管理', 'F', '2', 'system/user', '', 'icon-hamburg-user', 'closed', '');
INSERT INTO `permission` VALUES ('4', '2', '添加', 'O', null, '', 'sys:role:add', '', '', '角色添加');
INSERT INTO `permission` VALUES ('5', '2', '删除', 'O', null, '', 'sys:role:delete', '', '', '角色删除');
INSERT INTO `permission` VALUES ('6', '2', '修改', 'O', null, '', 'sys:role:update', '', '', '角色修改');
INSERT INTO `permission` VALUES ('7', '3', '添加', 'O', null, '', 'sys:user:add', '', '', '用户添加');
INSERT INTO `permission` VALUES ('8', '3', '删除', 'O', null, '', 'sys:user:delete', '', '', '用户删除');
INSERT INTO `permission` VALUES ('12', '1', '权限管理', 'F', '5', 'system/permission', '', 'icon-hamburg-login', 'closed', '');
INSERT INTO `permission` VALUES ('14', '15', '数据源监控', 'F', '6', 'druid', '', 'icon-hamburg-database', '', '');
INSERT INTO `permission` VALUES ('15', null, '系统监控', 'F', '5', '', '', 'icon-hamburg-graphic', '', '');
INSERT INTO `permission` VALUES ('16', '3', '修改', 'O', null, '', 'sys:user:update', '', '', '用户修改');
INSERT INTO `permission` VALUES ('20', '15', '日志管理', 'F', '7', 'system/log', '', 'icon-hamburg-archives', '', '');
INSERT INTO `permission` VALUES ('25', '12', '添加', 'O', null, '', 'sys:perm:add', '', '', '菜单添加');
INSERT INTO `permission` VALUES ('26', '12', '修改', 'O', null, '', 'sys:perm:update', '', '', '菜单修改');
INSERT INTO `permission` VALUES ('27', '12', '删除', 'O', null, '', 'sys:perm:delete', '', '', '菜单删除');
INSERT INTO `permission` VALUES ('28', '2', '查看', 'O', null, '', 'sys:role:view', '', '', '角色查看');
INSERT INTO `permission` VALUES ('29', '3', '查看', 'O', null, '', 'sys:user:view', '', null, '用户查看');
INSERT INTO `permission` VALUES ('30', '12', '查看', 'O', null, '', 'sys:perm:view', '', null, '权限查看');
INSERT INTO `permission` VALUES ('31', '20', '删除', 'O', null, '', 'sys:log:delete', '', null, '删除日志');
INSERT INTO `permission` VALUES ('32', '20', '导出excel', 'O', null, '', 'sys:log:exportExcel', '', null, '导出日志excel');
INSERT INTO `permission` VALUES ('33', '3', '查看用户角色', 'O', null, '', 'sys:user:roleView', '', null, '查看用户角色');
INSERT INTO `permission` VALUES ('34', '2', '保存授权', 'O', null, '', 'sys:role:permUpd', '', null, '保存修改的角色权限');
INSERT INTO `permission` VALUES ('35', '3', '修改用户角色', 'O', null, '', 'sys:user:roleUpd', '', null, '修改用户拥有的角色');
INSERT INTO `permission` VALUES ('36', '2', '查看角色权限', 'O', null, '', 'sys:role:permView', '', null, '查看角色拥有的权限');
INSERT INTO `permission` VALUES ('37', '15', '定时任务管理', 'F', null, 'system/scheduleJob', '', 'icon-hamburg-full-time', null, '定时任务管理，支持集群');
INSERT INTO `permission` VALUES ('38', '15', 'cron表达式生成', 'F', null, 'system/scheduleJob/quartzCron', '', 'icon-hamburg-future', null, '');
INSERT INTO `permission` VALUES ('39', '1', '菜单管理', 'F', '4', 'system/permission/menu', '', 'icon-hamburg-old-versions', null, '');
INSERT INTO `permission` VALUES ('40', '1', '字典管理', 'F', '6', 'system/dict', null, 'icon-hamburg-address', null, '数据字典管理');
INSERT INTO `permission` VALUES ('45', '39', '修改', 'O', null, '', 'sys:perm:update', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('58', '39', '添加', 'O', null, '', 'sys:perm:add', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('59', '39', '删除', 'O', null, '', 'sys:perm:delte', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('61', '40', '添加', 'O', null, '', 'sys:dict:add', null, null, '字典管理');
INSERT INTO `permission` VALUES ('62', '40', '删除', 'O', null, '', 'sys:dict:delete', null, null, '字典管理');
INSERT INTO `permission` VALUES ('63', '40', '修改', 'O', null, '', 'sys:dict:update', null, null, '字典管理');
INSERT INTO `permission` VALUES ('68', '20', '查看', 'O', null, '', 'sys:log:view', null, null, '查看日志');
INSERT INTO `permission` VALUES ('69', '40', '查看', 'O', null, '', 'sys:dict:view', null, null, '字典管理');
INSERT INTO `permission` VALUES ('70', '39', '查看', 'O', null, '', 'sys:perm:menu:view', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('72', null, '分诊管理', 'F', '1', '', null, 'icon-hamburg-customers', null, '');
INSERT INTO `permission` VALUES ('73', '72', '科室管理', 'F', '5', 'buss/dept', null, 'icon-hamburg-sitemap', null, '');
INSERT INTO `permission` VALUES ('74', '72', '患者管理', 'F', '3', 'buss/patient', null, 'icon-hamburg-special', null, '');
INSERT INTO `permission` VALUES ('75', '72', '分诊管理', 'F', '1', 'buss/triage', null, 'icon-hamburg-exchange', null, '');
INSERT INTO `permission` VALUES ('76', '73', '添加', 'O', null, '', 'buss:dept:add', null, null, '');
INSERT INTO `permission` VALUES ('77', '73', '修改', 'O', null, '', 'buss:dept:update', null, null, '');
INSERT INTO `permission` VALUES ('78', '73', '删除', 'O', null, '', 'buss:dept:delete', null, null, '');
INSERT INTO `permission` VALUES ('79', '73', '查看', 'O', null, '', 'buss:dept:view', null, null, '');
INSERT INTO `permission` VALUES ('80', '74', '添加', 'O', null, '', 'buss:patient:add', null, null, '');
INSERT INTO `permission` VALUES ('81', '74', '修改', 'O', null, '', 'buss:patient:update', null, null, '');
INSERT INTO `permission` VALUES ('82', '74', '删除', 'O', null, '', 'buss:patient:delete', null, null, '');
INSERT INTO `permission` VALUES ('83', '74', '查看', 'O', null, '', 'buss:patient:view', null, null, '');
INSERT INTO `permission` VALUES ('84', '74', '挂号', 'O', null, '', 'buss:patient:triageView', null, null, '');
INSERT INTO `permission` VALUES ('85', '75', '添加', 'O', null, '', 'buss:triage:add', null, null, '');
INSERT INTO `permission` VALUES ('86', '75', '修改', 'O', null, '', 'buss:triage:update', null, null, '');
INSERT INTO `permission` VALUES ('87', '75', '删除', 'O', null, '', 'buss:triage:delete', null, null, '');
INSERT INTO `permission` VALUES ('88', '75', '查看', 'O', null, '', 'buss:triage:view', null, null, '');

-- ----------------------------
-- Table structure for prescription
-- ----------------------------
DROP TABLE IF EXISTS `prescription`;
CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `symptom` varchar(200) DEFAULT NULL,
  `diagnose` varchar(200) DEFAULT NULL,
  `Medicine` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prescription
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'test1', 'testgroup', '0/5 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'test1', 'testgroup', null, 'com.tianyu.jty.system.service.TaskA', '0', '1', '0', '0', 0xEFBFBDEFBFBD0005737200156F72672E71756172747A2E4A6F62446174614D6170EFBFBDEFBFBDEFBFBDE8BFA9EFBFBDEFBFBD020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D6170EFBFBDEFBFBDEFBFBDEFBFBD5D280200015A006C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D61702EEFBFBD28760AEFBFBD0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F7249007468726573686F6C6478703F4000000000000C000000100000000174000B7363686564756C654A6F6273720028636F6D2E7469616E79752E6A74792E73797374656D2E656E746974792E5363686564756C654A6F6200000000000000010200064C00636C6173734E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E004C000B6465736372697074696F6E71007E004C000567726F757071007E004C00046E616D6571007E004C000673746174757371007E007870740023636F6D2E7469616E79752E6A74792E73797374656D2E736572766963652E5461736B4174000D302F35202A202A202A202A203F7074007465737467726F75707400057465737431740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('scheduler', 'baiHoo1491840976582', '1491841127121', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'test1', 'testgroup', 'test1', 'testgroup', null, '1421206460000', '1421206455000', '5', 'PAUSED', 'CRON', '1421206412000', '0', null, '0', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `ROLE_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  `SORT` smallint(6) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', 'admin', '2', null);
INSERT INTO `role` VALUES ('5', 'guest', 'guest', 'guest', '3', null);
INSERT INTO `role` VALUES ('13', 'superadmin', 'superadmin', '超级管理员', '1', null);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `PERMISSION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PER_REFERENCE_PERMISSI` (`PERMISSION_ID`) USING BTREE,
  KEY `FK_ROLE_PER_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '2');
INSERT INTO `role_permission` VALUES ('2', '1', '1');
INSERT INTO `role_permission` VALUES ('28', '5', '1');
INSERT INTO `role_permission` VALUES ('61', '13', '1');
INSERT INTO `role_permission` VALUES ('62', '13', '3');
INSERT INTO `role_permission` VALUES ('63', '13', '16');
INSERT INTO `role_permission` VALUES ('64', '13', '7');
INSERT INTO `role_permission` VALUES ('65', '13', '2');
INSERT INTO `role_permission` VALUES ('66', '13', '4');
INSERT INTO `role_permission` VALUES ('67', '13', '5');
INSERT INTO `role_permission` VALUES ('68', '13', '6');
INSERT INTO `role_permission` VALUES ('69', '13', '12');
INSERT INTO `role_permission` VALUES ('70', '13', '25');
INSERT INTO `role_permission` VALUES ('71', '13', '26');
INSERT INTO `role_permission` VALUES ('72', '13', '27');
INSERT INTO `role_permission` VALUES ('74', '13', '15');
INSERT INTO `role_permission` VALUES ('75', '13', '14');
INSERT INTO `role_permission` VALUES ('76', '13', '20');
INSERT INTO `role_permission` VALUES ('77', '13', '8');
INSERT INTO `role_permission` VALUES ('81', '1', '3');
INSERT INTO `role_permission` VALUES ('88', '1', '12');
INSERT INTO `role_permission` VALUES ('93', '1', '15');
INSERT INTO `role_permission` VALUES ('94', '1', '14');
INSERT INTO `role_permission` VALUES ('95', '1', '20');
INSERT INTO `role_permission` VALUES ('118', '1', '28');
INSERT INTO `role_permission` VALUES ('120', '1', '30');
INSERT INTO `role_permission` VALUES ('121', '1', '31');
INSERT INTO `role_permission` VALUES ('125', '1', '33');
INSERT INTO `role_permission` VALUES ('126', '1', '36');
INSERT INTO `role_permission` VALUES ('127', '1', '35');
INSERT INTO `role_permission` VALUES ('129', '1', '34');
INSERT INTO `role_permission` VALUES ('130', '1', '32');
INSERT INTO `role_permission` VALUES ('133', '5', '15');
INSERT INTO `role_permission` VALUES ('135', '1', '37');
INSERT INTO `role_permission` VALUES ('142', '1', '38');
INSERT INTO `role_permission` VALUES ('145', '1', '40');
INSERT INTO `role_permission` VALUES ('147', '1', '29');
INSERT INTO `role_permission` VALUES ('151', '1', '61');
INSERT INTO `role_permission` VALUES ('152', '1', '62');
INSERT INTO `role_permission` VALUES ('153', '1', '63');
INSERT INTO `role_permission` VALUES ('162', '5', '39');
INSERT INTO `role_permission` VALUES ('164', '5', '58');
INSERT INTO `role_permission` VALUES ('176', '5', '40');
INSERT INTO `role_permission` VALUES ('177', '1', '39');
INSERT INTO `role_permission` VALUES ('178', '1', '58');
INSERT INTO `role_permission` VALUES ('179', '1', '59');
INSERT INTO `role_permission` VALUES ('183', '1', '4');
INSERT INTO `role_permission` VALUES ('184', '1', '6');
INSERT INTO `role_permission` VALUES ('185', '1', '26');
INSERT INTO `role_permission` VALUES ('186', '1', '27');
INSERT INTO `role_permission` VALUES ('187', '1', '5');
INSERT INTO `role_permission` VALUES ('189', '1', '25');
INSERT INTO `role_permission` VALUES ('190', '1', '45');
INSERT INTO `role_permission` VALUES ('191', '1', '7');
INSERT INTO `role_permission` VALUES ('192', '1', '8');
INSERT INTO `role_permission` VALUES ('193', '1', '16');
INSERT INTO `role_permission` VALUES ('194', '13', '28');
INSERT INTO `role_permission` VALUES ('195', '13', '34');
INSERT INTO `role_permission` VALUES ('196', '13', '36');
INSERT INTO `role_permission` VALUES ('197', '13', '29');
INSERT INTO `role_permission` VALUES ('198', '13', '33');
INSERT INTO `role_permission` VALUES ('199', '13', '35');
INSERT INTO `role_permission` VALUES ('200', '13', '30');
INSERT INTO `role_permission` VALUES ('201', '13', '39');
INSERT INTO `role_permission` VALUES ('202', '13', '45');
INSERT INTO `role_permission` VALUES ('203', '13', '58');
INSERT INTO `role_permission` VALUES ('204', '13', '59');
INSERT INTO `role_permission` VALUES ('205', '13', '40');
INSERT INTO `role_permission` VALUES ('206', '13', '61');
INSERT INTO `role_permission` VALUES ('207', '13', '62');
INSERT INTO `role_permission` VALUES ('208', '13', '63');
INSERT INTO `role_permission` VALUES ('209', '13', '31');
INSERT INTO `role_permission` VALUES ('210', '13', '32');
INSERT INTO `role_permission` VALUES ('211', '13', '37');
INSERT INTO `role_permission` VALUES ('212', '13', '38');
INSERT INTO `role_permission` VALUES ('213', '1', '69');
INSERT INTO `role_permission` VALUES ('215', '5', '69');
INSERT INTO `role_permission` VALUES ('216', '5', '20');
INSERT INTO `role_permission` VALUES ('219', '5', '68');
INSERT INTO `role_permission` VALUES ('220', '5', '38');
INSERT INTO `role_permission` VALUES ('221', '1', '70');
INSERT INTO `role_permission` VALUES ('222', '5', '70');
INSERT INTO `role_permission` VALUES ('223', '5', '3');
INSERT INTO `role_permission` VALUES ('227', '5', '29');
INSERT INTO `role_permission` VALUES ('228', '5', '33');
INSERT INTO `role_permission` VALUES ('229', '5', '35');
INSERT INTO `role_permission` VALUES ('231', '5', '2');
INSERT INTO `role_permission` VALUES ('234', '5', '28');
INSERT INTO `role_permission` VALUES ('235', '5', '45');
INSERT INTO `role_permission` VALUES ('236', '5', '59');
INSERT INTO `role_permission` VALUES ('239', '5', '36');
INSERT INTO `role_permission` VALUES ('240', '1', '68');
INSERT INTO `role_permission` VALUES ('241', '1', '72');
INSERT INTO `role_permission` VALUES ('242', '1', '73');
INSERT INTO `role_permission` VALUES ('243', '1', '74');
INSERT INTO `role_permission` VALUES ('244', '1', '75');
INSERT INTO `role_permission` VALUES ('245', '1', '76');
INSERT INTO `role_permission` VALUES ('246', '1', '79');
INSERT INTO `role_permission` VALUES ('247', '1', '78');
INSERT INTO `role_permission` VALUES ('248', '1', '77');
INSERT INTO `role_permission` VALUES ('249', '1', '80');
INSERT INTO `role_permission` VALUES ('250', '1', '81');
INSERT INTO `role_permission` VALUES ('251', '1', '82');
INSERT INTO `role_permission` VALUES ('252', '1', '83');
INSERT INTO `role_permission` VALUES ('253', '1', '84');
INSERT INTO `role_permission` VALUES ('254', '1', '85');
INSERT INTO `role_permission` VALUES ('255', '1', '86');
INSERT INTO `role_permission` VALUES ('256', '1', '87');
INSERT INTO `role_permission` VALUES ('257', '1', '88');

-- ----------------------------
-- Table structure for triage
-- ----------------------------
DROP TABLE IF EXISTS `triage`;
CREATE TABLE `triage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Urgent` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`patient_id`,`dept_id`),
  KEY `fk_triage_patient` (`patient_id`),
  KEY `fk_triage_dept1` (`dept_id`),
  CONSTRAINT `fk_triage_dept1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_triage_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of triage
-- ----------------------------
INSERT INTO `triage` VALUES ('1', '0', '0', '1', '2', null);
INSERT INTO `triage` VALUES ('2', '0', '0', '1', '2', null);
INSERT INTO `triage` VALUES ('3', '0', '1', '1', '2', '2016-03-03 16:36:46');
INSERT INTO `triage` VALUES ('4', '0', '1', '3', '3', '2016-03-03 19:14:00');
INSERT INTO `triage` VALUES ('5', '1', '0', '4', '2', '2016-03-03 19:34:13');
INSERT INTO `triage` VALUES ('6', '0', '1', '3', '1', '2016-03-03 19:34:21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SALT` varchar(255) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `GENDER` smallint(6) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ICON` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `DESCRIPTION` text,
  `LOGIN_COUNT` int(11) DEFAULT NULL,
  `PREVIOUS_VISIT` datetime DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DEL_FLAG` varchar(1) DEFAULT NULL,
  `tittle` varchar(45) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_dept` (`dept_id`),
  CONSTRAINT `user_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '159ae5f48f14e89f3f9f54dc995f1f276d472b54', '3d06a5c14d010804', '2014-03-16 00:00:00', '1', '1327668980@qq.com', '123456789', 'aaa', '2014-03-20 14:38:57', '0', '', '136', '2016-03-02 21:44:53', '2016-03-03 15:34:55', null, '', '3');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  KEY `FK_USER_ROL_REFERENCE_USERS` (`USER_ID`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
