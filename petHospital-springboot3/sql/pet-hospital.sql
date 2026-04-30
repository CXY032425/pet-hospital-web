
CREATE DATABASE IF NOT EXISTS `pet-hospital`
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE `pet-hospital`;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`
(
    `banner_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '轮播图ID',
    `image`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '图片',
    `sort`      int                                                    NOT NULL COMMENT '排序',
    PRIMARY KEY (`banner_id`) USING BTREE,
    UNIQUE INDEX `banner_id` (`banner_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '轮播图'
  ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`
(
    `doctor_id`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '医生ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '姓名',
    `title`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '职称',
    `specialty`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '擅长',
    `photo`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '照片',
    `create_time` datetime                                               NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`doctor_id`) USING BTREE,
    UNIQUE INDEX `doctor_id` (`doctor_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '医生'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`
(
    `knowledge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '养宠知识ID',
    `title`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标题',
    `content`      longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin     NOT NULL COMMENT '内容',
    `create_time`  datetime                                               NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`knowledge_id`) USING BTREE,
    UNIQUE INDEX `knowledge_id` (`knowledge_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '养宠知识'
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`
(
    `reservation_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '预约ID',
    `type`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '预约类型',
    `status`         varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL DEFAULT '待就诊' COMMENT '预约状态',
    `pet_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '宠物名字',
    `pet_breed`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '宠物品种',
    `pet_age`        int                                                    NOT NULL COMMENT '宠物年龄',
    `symptom`        varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '症状',
    `date`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '预约日期',
    `time`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '预约时间',
    `doctor_id`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '医生ID',
    `vaccine_id`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL     DEFAULT NULL COMMENT '疫苗ID',
    `user_id`        int                                                    NOT NULL COMMENT '用户ID',
    `create_time`    datetime                                               NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`reservation_id`) USING BTREE,
    UNIQUE INDEX `reservation_id` (`reservation_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '预约'
  ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int                                                    NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime                                               NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '参数配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-04-30 08:59:54', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (2, '验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-04-30 08:59:54', 'admin',
        '2026-04-30 13:30:28', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (3, '是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2026-04-30 08:59:54', 'admin',
        '2026-04-30 13:31:46', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint                                                NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint                                                NULL DEFAULT 0 COMMENT '父部门id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '部门名称',
    `order_num`   int                                                   NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin     NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin     NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                              NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                              NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 202
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '部门表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '后勤部', 0, 'cxy', '18072519583', '1946800972@qq.com', '0', '0', 'admin', '2026-04-30 08:59:53',
        'admin', '2026-04-30 10:36:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int                                                    NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                               NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '字典数据表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-04-30 08:59:54', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-04-30 08:59:54', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-04-30 08:59:54', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-04-30 08:59:54', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (100, 1, '疫苗预约', '疫苗预约', 'reservation_type', NULL, 'primary', 'N', '0', 'admin', '2026-04-30 20:24:50',
        'admin', '2026-04-30 20:24:57', NULL);
INSERT INTO `sys_dict_data`
VALUES (101, 2, '普通预约', '普通预约', 'reservation_type', NULL, 'primary', 'N', '0', 'admin', '2026-04-30 20:25:16',
        '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (102, 1, '待就诊', '待就诊', 'reservation_status', NULL, 'warning', 'N', '0', 'admin', '2026-04-30 20:25:46', '',
        NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (103, 2, '已取消', '已取消', 'reservation_status', NULL, 'danger', 'N', '0', 'admin', '2026-04-30 20:25:57', '',
        NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (104, 3, '已完成', '已完成', 'reservation_status', NULL, 'success', 'N', '0', 'admin', '2026-04-30 20:26:07', '',
        NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                               NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 102
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '字典类型表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '系统是否', 'sys_yes_no', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (100, '预约类型', 'reservation_type', '0', 'admin', '2026-04-30 20:24:30', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (101, '预约状态', 'reservation_status', '0', 'admin', '2026-04-30 20:25:31', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint                                                 NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int                                                    NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由参数',
    `route_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '路由名称',
    `is_frame`    int                                                    NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int                                                    NULL DEFAULT 1 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                               NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2043
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '菜单权限表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统管理', 0, 99, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', '系统管理', 'admin',
        '2026-04-30 08:59:54', 'admin', '2025-10-26 23:03:25', '系统管理目录');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 1, 'C', '0', '0', 'system:user:list', '用户管理',
        'admin', '2026-04-30 08:59:54', 'admin', '2025-09-01 11:20:55', '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 1, 'C', '0', '0', 'system:role:list', '角色管理',
        'admin', '2026-04-30 08:59:54', 'admin', '2025-09-01 11:26:22', '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 1, 'C', '0', '0', 'system:menu:list', '菜单管理',
        'admin', '2026-04-30 08:59:54', 'admin', '2025-09-01 11:26:28', '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 1, 'C', '0', '0', 'system:dept:list', '部门管理',
        'admin', '2026-04-30 08:59:54', 'admin', '2025-09-01 11:26:33', '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 1, 'C', '0', '0', 'system:dict:list', '字典管理',
        'admin', '2026-04-30 08:59:54', 'admin', '2025-09-01 11:26:38', '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 1, 'C', '0', '0', 'system:config:list',
        '参数设置', 'admin', '2026-04-30 08:59:54', 'admin', '2025-09-01 11:26:44', '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2026-04-30 08:59:54', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2012, '宠物医院管理', 0, 1, 'hospital', NULL, NULL, '', 1, 1, 'M', '0', '0', '', '宠物医院管理', 'admin',
        '2025-10-26 23:04:08', 'admin', '2025-10-26 23:07:29', '');
INSERT INTO `sys_menu`
VALUES (2013, '轮播图管理', 2012, 1, 'banner', 'hospital/banner/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:banner:list', '轮播图管理', 'admin', '2025-10-26 23:14:17', 'admin', '2025-10-26 23:15:25',
        '轮播图菜单');
INSERT INTO `sys_menu`
VALUES (2014, '轮播图查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:query', '#', 'admin',
        '2025-10-26 23:14:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2015, '轮播图新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:add', '#', 'admin',
        '2025-10-26 23:14:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2016, '轮播图修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:edit', '#', 'admin',
        '2025-10-26 23:14:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2017, '轮播图删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:remove', '#', 'admin',
        '2025-10-26 23:14:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2018, '轮播图导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:banner:export', '#', 'admin',
        '2025-10-26 23:14:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2019, '医生管理', 2012, 2, 'doctor', 'hospital/doctor/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:doctor:list', '医生管理', 'admin', '2026-04-30 16:42:51', 'admin', '2026-04-30 16:47:45', '医生菜单');
INSERT INTO `sys_menu`
VALUES (2020, '医生查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:query', '#', 'admin',
        '2026-04-30 16:42:51', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2021, '医生新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:add', '#', 'admin',
        '2026-04-30 16:42:51', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2022, '医生修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:edit', '#', 'admin',
        '2026-04-30 16:42:51', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2023, '医生删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:remove', '#', 'admin',
        '2026-04-30 16:42:51', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2024, '医生导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:doctor:export', '#', 'admin',
        '2026-04-30 16:42:51', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2025, '疫苗管理', 2012, 3, 'vaccine', 'hospital/vaccine/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:vaccine:list', '疫苗管理', 'admin', '2026-04-30 19:52:57', 'admin', '2026-04-30 19:56:07',
        '疫苗菜单');
INSERT INTO `sys_menu`
VALUES (2026, '疫苗查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:query', '#', 'admin',
        '2026-04-30 19:52:57', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2027, '疫苗新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:add', '#', 'admin',
        '2026-04-30 19:52:57', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2028, '疫苗修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:edit', '#', 'admin',
        '2026-04-30 19:52:57', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2029, '疫苗删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:remove', '#', 'admin',
        '2026-04-30 19:52:57', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2030, '疫苗导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:vaccine:export', '#', 'admin',
        '2026-04-30 19:52:57', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2031, '预约管理', 2012, 4, 'reservation', 'hospital/reservation/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:reservation:list', '预约管理', 'admin', '2026-04-30 20:28:58', 'admin', '2026-04-30 20:32:09',
        '预约菜单');
INSERT INTO `sys_menu`
VALUES (2032, '预约查询', 2031, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:query', '#', 'admin',
        '2026-04-30 20:28:58', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2033, '预约新增', 2031, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:add', '#', 'admin',
        '2026-04-30 20:28:58', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2034, '预约修改', 2031, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:edit', '#', 'admin',
        '2026-04-30 20:28:58', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2035, '预约删除', 2031, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:remove', '#', 'admin',
        '2026-04-30 20:28:58', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2036, '预约导出', 2031, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:reservation:export', '#', 'admin',
        '2026-04-30 20:28:58', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2037, '养宠知识管理', 2012, 5, 'knowledge', 'hospital/knowledge/index', NULL, '', 1, 1, 'C', '0', '0',
        'hospital:knowledge:list', '养宠知识管理', 'admin', '2026-04-30 15:28:16', 'admin', '2026-04-30 15:32:00',
        '养宠知识菜单');
INSERT INTO `sys_menu`
VALUES (2038, '养宠知识查询', 2037, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:query', '#', 'admin',
        '2026-04-30 15:28:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2039, '养宠知识新增', 2037, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:add', '#', 'admin',
        '2026-04-30 15:28:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2040, '养宠知识修改', 2037, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:edit', '#', 'admin',
        '2026-04-30 15:28:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2041, '养宠知识删除', 2037, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:remove', '#',
        'admin', '2026-04-30 15:28:17', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2042, '养宠知识导出', 2037, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'hospital:knowledge:export', '#',
        'admin', '2026-04-30 15:28:17', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int                                                    NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                                             NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                                             NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                               NULL DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '角色信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-04-30 08:59:54', '', NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2026-04-30 08:59:54', 'admin', '2026-04-30 10:34:10',
        '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
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
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
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
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`     bigint                                                 NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`     bigint                                                 NULL DEFAULT NULL COMMENT '部门ID',
    `user_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '用户账号',
    `nick_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '用户昵称',
    `user_type`   varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin   NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '用户邮箱',
    `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '手机号码',
    `sex`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '头像地址',
    `password`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '密码',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
    `del_flag`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime                                               NULL DEFAULT NULL COMMENT '最后登录时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                               NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '用户信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 100, 'admin', 'cxy', '00', '1946800972@qq.com', '18072519583', '1', '',
        '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-04-30 11:47:50',
        'admin', '2026-04-30 08:59:53', '', '2026-04-30 11:47:49', '管理员');
INSERT INTO `sys_user`
VALUES (104, NULL, '张三', '张三', '00', '', '', '0', '',
        '$2a$10$qYjznCEboJx10MpixiTowOMWBPznXoYhlTlRZZL52/QtkuaivuGA2', '0', '0', '127.0.0.1', '2026-04-30 23:03:40',
        '', '2026-04-30 21:16:32', '', '2026-04-30 23:03:40', NULL);

-- ----------------------------
-- Table structure for sys_user_role
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
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);

-- ----------------------------
-- Table structure for vaccine
-- ----------------------------
DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE `vaccine`
(
    `vaccine_id`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '疫苗ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  NOT NULL COMMENT '疫苗名称',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '描述',
    PRIMARY KEY (`vaccine_id`) USING BTREE,
    UNIQUE INDEX `vaccine_id` (`vaccine_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT = '疫苗'
  ROW_FORMAT = Dynamic;

