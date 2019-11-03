
CREATE DATABASE  `iuser` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `iuser`;

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` char(32) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '登陆名',
  `pwd` varchar(32) NOT NULL COMMENT '登陆密码',
  `salt` char(4) NOT NULL COMMENT '扰码',
  `mobile` char(11) COMMENT '绑定的号码',
  `email` varchar(64) COMMENT '绑定的邮箱',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  UNIQUE KEY `uk_mobile` (`mobile`),
  UNIQUE KEY `uk_email` (`email`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `orgcode` varchar(20) NOT NULL COMMENT '机构号',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

DROP TABLE IF EXISTS `t_organ`;
CREATE TABLE `t_organ` (
  `orgcode` varchar(20) NOT NULL COMMENT '机构号',
  `name` varchar(32) NOT NULL COMMENT '机构名称',
  `phone` varchar(32) COMMENT '联系号码',
  `email` varchar(32) COMMENT '联系邮箱',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`orgcode`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';


DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_products` (
  `code` varchar(20) NOT NULL COMMENT '产品编码',
  `name` varchar(32) NOT NULL COMMENT '产品名称',
  `host` varchar(200) COMMENT '产品地址',
  `owner` char(32) NOT NULL COMMENT '产品负责人',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`code`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';


DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` char(32) NOT NULL COMMENT 'ID',
  `pid` char(32) NOT NULL COMMENT '父级ID',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `type` varchar(8) NOT NULL COMMENT '资源类型',
  `product_code` varchar(20) NOT NULL COMMENT '产品编码',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `update_time` datetime(6) NOT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_productcode` (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_user_menu` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `role_id` char(32) NOT NULL COMMENT '角色id',
  `resource_id` text COMMENT '用户拥有的资源列表',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限表';

DROP TABLE IF EXISTS `t_user_session`;
CREATE TABLE `t_login` (
  `uid` char(32) NOT NULL COMMENT '用户id',
  `token` char(32) NOT NULL COMMENT '登陆标识',
  `expire` datetime(6) NOT NULL COMMENT '过期时间',
  `login_time` datetime(6) NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`),
  KEY `idx_token` (`token`),
  KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登陆会话表';


DROP TABLE IF EXISTS `t_captcha`;
CREATE TABLE `t_captcha` (
  `id` char(32) NOT NULL COMMENT '自增id',
  `to` varchar(32) NOT NULL COMMENT '接收者: 手机号码、邮箱地址',
  `captcha` char(6) NOT NULL COMMENT '验证码',
  `type` tinyint(1) NOT NULL COMMENT '1:手机号码，2:邮箱',
  `create_time` datetime(6) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`),
  Key `idx_to` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证码表';
