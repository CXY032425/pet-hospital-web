CREATE DATABASE IF NOT EXISTS `pet_hospital`
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE `pet_hospital`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 轮播图表
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`
(
    `banner_id` char(32)     NOT NULL COMMENT '轮播图ID',
    `image`     varchar(255) NOT NULL COMMENT '图片路径',
    `sort`      int          NOT NULL COMMENT '排序序号',
    PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '轮播图表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- 医生表
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`
(
    `doctor_id`   char(32)     NOT NULL COMMENT '医生ID',
    `name`        varchar(50)  NOT NULL COMMENT '医生姓名',
    `title`       varchar(100) NOT NULL COMMENT '医生职称',
    `specialty`   varchar(255) NOT NULL COMMENT '擅长领域',
    `photo`       varchar(255) NOT NULL COMMENT '照片路径',
    `create_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`doctor_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '医生表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- 代码生成业务表
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint   NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200)      DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500)      DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64)       DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64)       DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100)      DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200)      DEFAULT 'crud' COMMENT '使用的模板',
    `tpl_web_type`      varchar(30)       DEFAULT '' COMMENT '前端模板类型',
    `package_name`      varchar(100)      DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30)       DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30)       DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50)       DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50)       DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1)           DEFAULT '0' COMMENT '生成代码方式',
    `gen_path`          varchar(200)      DEFAULT '/' COMMENT '生成路径',
    `options`           varchar(1000)     DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64)       DEFAULT '' COMMENT '创建者',
    `create_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`         varchar(64)       DEFAULT '' COMMENT '更新者',
    `update_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`            varchar(500)      DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '代码生成业务表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 代码生成业务表字段
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint   NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint            DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200)      DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500)      DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100)      DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500)      DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200)      DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1)           DEFAULT NULL COMMENT '是否主键',
    `is_increment`   char(1)           DEFAULT NULL COMMENT '是否自增',
    `is_required`    char(1)           DEFAULT NULL COMMENT '是否必填',
    `is_insert`      char(1)           DEFAULT NULL COMMENT '是否为插入字段',
    `is_edit`        char(1)           DEFAULT NULL COMMENT '是否编辑字段',
    `is_list`        char(1)           DEFAULT NULL COMMENT '是否列表字段',
    `is_query`       char(1)           DEFAULT NULL COMMENT '是否查询字段',
    `query_type`     varchar(200)      DEFAULT 'EQ' COMMENT '查询方式',
    `html_type`      varchar(200)      DEFAULT NULL COMMENT '显示类型',
    `dict_type`      varchar(200)      DEFAULT '' COMMENT '字典类型',
    `sort`           int               DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64)       DEFAULT '' COMMENT '创建者',
    `create_time`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`      varchar(64)       DEFAULT '' COMMENT '更新者',
    `update_time`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 89
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '代码生成业务表字段'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 养宠知识表
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`
(
    `knowledge_id` char(32)     NOT NULL COMMENT '养宠知识ID',
    `title`        varchar(100) NOT NULL COMMENT '标题',
    `content`      longtext     NOT NULL COMMENT '内容',
    `create_time`  datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`knowledge_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '养宠知识表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- 预约表（已优化：字段拼写 + 索引 + 类型规范）
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`
(
    `reservation_id` char(32)     NOT NULL COMMENT '预约ID',
    `type`           varchar(30)  NOT NULL COMMENT '预约类型',
    `status`         varchar(30)  NOT NULL DEFAULT '待就诊' COMMENT '预约状态',
    `pet_name`       varchar(100) NOT NULL COMMENT '宠物名字',
    `pet_breed`      varchar(100) NOT NULL COMMENT '宠物品种',
    `pet_age`        int          NOT NULL COMMENT '宠物年龄',
    `symptom`        varchar(500) NOT NULL COMMENT '症状描述',
    `reserve_date`   date         NOT NULL COMMENT '预约日期',
    `reserve_time`   time         NOT NULL COMMENT '预约时间',
    `doctor_id`      char(32)              DEFAULT NULL COMMENT '医生ID',
    `vaccine_id`     char(32)              DEFAULT NULL COMMENT '疫苗ID',
    `user_id`        bigint       NOT NULL COMMENT '用户ID',
    `create_time`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`reservation_id`) USING BTREE,
    INDEX `idx_doctor` (`doctor_id`),
    INDEX `idx_vaccine` (`vaccine_id`),
    INDEX `idx_user` (`user_id`)
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '预约表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- 参数配置表
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int      NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100)      DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100)      DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500)      DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1)           DEFAULT 'N' COMMENT '系统内置',
    `create_by`    varchar(64)       DEFAULT '' COMMENT '创建者',
    `create_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`    varchar(64)       DEFAULT '' COMMENT '更新者',
    `update_time`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`       varchar(500)      DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '参数配置表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_config`
VALUES (1, '账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (2, '验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-04-27 15:28:17', 'admin',
        '2026-04-28 00:00:00', '是否开启验证码功能');
INSERT INTO `sys_config`
VALUES (3, '是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2026-04-27 15:28:17', 'admin',
        '2026-04-28 00:00:00', '是否开启注册用户功能');

-- ----------------------------
-- 部门表
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint   NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint            DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50)       DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30)       DEFAULT '' COMMENT '部门名称',
    `order_num`   int               DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20)       DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11)       DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50)       DEFAULT NULL COMMENT '邮箱',
    `status`      char(1)           DEFAULT '0' COMMENT '部门状态',
    `del_flag`    char(1)           DEFAULT '0' COMMENT '删除标志',
    `create_by`   varchar(64)       DEFAULT '' COMMENT '创建者',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)       DEFAULT '' COMMENT '更新者',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 202
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '部门表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_dept`
VALUES (100, 0, '0', '后勤部', 0, 'cxy', '18072519582', '1946800972@qq.com', '0', '0', 'admin', '2026-04-27 15:28:17',
        'admin', '2026-04-28 00:00:00');

-- ----------------------------
-- 字典数据表
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint   NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int               DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100)      DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100)      DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100)      DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100)      DEFAULT NULL COMMENT '样式属性',
    `list_class`  varchar(100)      DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1)           DEFAULT 'N' COMMENT '是否默认',
    `status`      char(1)           DEFAULT '0' COMMENT '状态',
    `create_by`   varchar(64)       DEFAULT '' COMMENT '创建者',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)       DEFAULT '' COMMENT '更新者',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)      DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '字典数据表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00',
        '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00',
        '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00',
        '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (100, 1, '疫苗预约', '疫苗预约', 'reservation_type', NULL, 'primary', 'N', '0', 'admin', '2026-04-27 15:28:17',
        'admin', '2026-04-28 00:00:00', NULL);
INSERT INTO `sys_dict_data`
VALUES (101, 2, '普通预约', '普通预约', 'reservation_type', NULL, 'primary', 'N', '0', 'admin', '2026-04-27 15:28:17',
        '', '2026-04-28 00:00:00', NULL);
INSERT INTO `sys_dict_data`
VALUES (102, 1, '待就诊', '待就诊', 'reservation_status', NULL, 'warning', 'N', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', NULL);
INSERT INTO `sys_dict_data`
VALUES (103, 2, '已取消', '已取消', 'reservation_status', NULL, 'danger', 'N', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', NULL);
INSERT INTO `sys_dict_data`
VALUES (104, 3, '已完成', '已完成', 'reservation_status', NULL, 'success', 'N', '0', 'admin', '2026-04-27 15:28:17', '',
        '2026-04-28 00:00:00', NULL);

-- ----------------------------
-- 字典类型表
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint   NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100)      DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100)      DEFAULT '' COMMENT '字典类型',
    `status`      char(1)           DEFAULT '0' COMMENT '状态',
    `create_by`   varchar(64)       DEFAULT '' COMMENT '创建者',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)       DEFAULT '' COMMENT '更新者',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)      DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 102
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '字典类型表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00',
        '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '系统是否', 'sys_yes_no', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (100, '预约类型', 'reservation_type', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', NULL);
INSERT INTO `sys_dict_type`
VALUES (101, '预约状态', 'reservation_status', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', NULL);

-- ----------------------------
-- 菜单权限表
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint      NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint               DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int                  DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200)         DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255)         DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255)         DEFAULT NULL COMMENT '路由参数',
    `route_name`  varchar(50)          DEFAULT '' COMMENT '路由名称',
    `is_frame`    int                  DEFAULT 1 COMMENT '是否为外链',
    `is_cache`    int                  DEFAULT 1 COMMENT '是否缓存',
    `menu_type`   char(1)              DEFAULT '' COMMENT '菜单类型',
    `visible`     char(1)              DEFAULT '0' COMMENT '菜单状态',
    `status`      char(1)              DEFAULT '0' COMMENT '菜单状态',
    `perms`       varchar(100)         DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100)         DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64)          DEFAULT '' COMMENT '创建者',
    `create_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)         DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2043
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '菜单权限表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 99, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-04-27 15:28:17',
        'admin', '2026-04-28 00:00:00', '系统管理目录');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 1, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 1, 'C', '0', '0', 'system:role:list', 'peoples',
        'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 1, 'C', '0', '0', 'system:menu:list', 'menu',
        'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 1, 'C', '0', '0', 'system:dept:list', 'tree',
        'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 1, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 1, 'C', '0', '0', 'system:config:list',
        'config', 'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (116, '代码生成', 1, 8, 'gen', 'tool/gen/index', '', '', 1, 1, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '代码生成菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2012, '宠物医院管理', 0, 1, 'hospital', NULL, NULL, '', 1, 1, 'M', '0', '0', '', 'hospital', 'admin',
        '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2013, '轮播图管理', 2012, 1, 'banner', 'hospital/banner/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:banner:list', 'banner', 'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '轮播图菜单');
INSERT INTO `sys_menu`
VALUES (2014, '轮播图查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2015, '轮播图新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2016, '轮播图修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2017, '轮播图删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2018, '轮播图导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2019, '医生管理', 2012, 2, 'doctor', 'hospital/doctor/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:doctor:list', 'user', 'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '医生菜单');
INSERT INTO `sys_menu`
VALUES (2020, '医生查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2021, '医生新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2022, '医生修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2023, '医生删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2024, '医生导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2025, '疫苗管理', 2012, 3, 'vaccine', 'hospital/vaccine/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:vaccine:list', 'vaccine', 'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00', '疫苗菜单');
INSERT INTO `sys_menu`
VALUES (2026, '疫苗查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2027, '疫苗新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2028, '疫苗修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2029, '疫苗删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2030, '疫苗导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2031, '预约管理', 2012, 4, 'reservation', 'hospital/reservation/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:reservation:list', 'booking', 'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00',
        '预约菜单');
INSERT INTO `sys_menu`
VALUES (2032, '预约查询', 2031, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2033, '预约新增', 2031, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2034, '预约修改', 2031, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2035, '预约删除', 2031, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:remove', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2036, '预约导出', 2031, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:export', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2037, '养宠知识管理', 2012, 5, 'knowledge', 'hospital/knowledge/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:knowledge:list', 'knowledge', 'admin', '2026-10-29 15:28:16', 'admin', '2026-04-28 00:00:00',
        '养宠知识菜单');
INSERT INTO `sys_menu`
VALUES (2038, '养宠知识查询', 2037, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:query', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2039, '养宠知识新增', 2037, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:add', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2040, '养宠知识修改', 2037, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:edit', '#', 'admin',
        '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2041, '养宠知识删除', 2037, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:remove', '#',
        'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');
INSERT INTO `sys_menu`
VALUES (2042, '养宠知识导出', 2037, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:export', '#',
        'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00', '');

-- ----------------------------
-- 角色信息表
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint       NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30)  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int          NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1)               DEFAULT '1' COMMENT '数据范围',
    `menu_check_strictly` tinyint(1)            DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)            DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1)      NOT NULL COMMENT '角色状态',
    `del_flag`            char(1)               DEFAULT '0' COMMENT '删除标志',
    `create_by`           varchar(64)           DEFAULT '' COMMENT '创建者',
    `create_time`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`           varchar(64)           DEFAULT '' COMMENT '更新者',
    `update_time`         datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`              varchar(500)          DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '角色信息表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-04-27 15:28:17', '', '2026-04-28 00:00:00',
        '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2026-04-27 15:28:17', 'admin', '2026-04-28 00:00:00',
        '普通角色');

-- ----------------------------
-- 角色部门关联表
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `dept_id` bigint NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '角色和部门关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 角色菜单关联表
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '角色和菜单关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- 用户信息表
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`     bigint      NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint               DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) NOT NULL COMMENT '用户账号',
    `nick_name`   varchar(30) NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2)           DEFAULT '00' COMMENT '用户类型',
    `email`       varchar(50)          DEFAULT '' COMMENT '用户邮箱',
    `phonenumber` varchar(11)          DEFAULT '' COMMENT '手机号码',
    `sex`         char(1)              DEFAULT '0' COMMENT '用户性别',
    `avatar`      varchar(100)         DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100)         DEFAULT '' COMMENT '密码',
    `status`      char(1)              DEFAULT '0' COMMENT '账号状态',
    `del_flag`    char(1)              DEFAULT '0' COMMENT '删除标志',
    `login_ip`    varchar(128)         DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime             DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64)          DEFAULT '' COMMENT '创建者',
    `create_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_by`   varchar(64)          DEFAULT '' COMMENT '更新者',
    `update_time` datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(500)         DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '用户信息表'
  ROW_FORMAT = DYNAMIC;

INSERT INTO `sys_user`
VALUES (1, 100, 'admin', 'cxy', '00', '1946800972@qq.com', '18072519583', '0', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-4-22 11:47:50',
        'admin', '2026-04-23 08:59:53', '', '2026-04-28 00:00:00', '管理员');
INSERT INTO `sys_user`
VALUES (104, NULL, '张三', '张三', '00', '', '', '0', '',
        '$2a$10$qYjznCEboJx10MpixiTowOMWBPznXoYhlTlRZZL52/QtkuaivuGA2', '0', '0', '127.0.0.1', '2026-10-28 23:03:40',
        '', '2026-4-22 21:16:32', '', '2026-04-28 00:00:00', NULL);

-- ----------------------------
-- 用户角色关联表
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '用户和角色关联表'
  ROW_FORMAT = Dynamic;

INSERT INTO `sys_user_role`
VALUES (1, 1);

-- ----------------------------
-- 疫苗表
-- ----------------------------
DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE `vaccine`
(
    `vaccine_id`  char(32)     NOT NULL COMMENT '疫苗ID',
    `name`        varchar(50)  NOT NULL COMMENT '疫苗名称',
    `description` varchar(255) NOT NULL COMMENT '疫苗描述',
    PRIMARY KEY (`vaccine_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '疫苗表'
  ROW_FORMAT = Dynamic;


SET FOREIGN_KEY_CHECKS = 1;