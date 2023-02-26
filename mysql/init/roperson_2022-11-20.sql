# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.46)
# Database: roperson
# Generation Time: 2022-11-20 15:38:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_log
# ------------------------------------------------------------

CREATE TABLE `t_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table t_person
# ------------------------------------------------------------

CREATE TABLE `t_person` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `person_id` bigint(20) unsigned NOT NULL COMMENT '业务ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '联系方式',
  `sex` tinyint(1) unsigned NOT NULL COMMENT '性别',
  `age` tinyint(1) unsigned DEFAULT NULL COMMENT '年龄',
  `id_card` varchar(20) DEFAULT '' COMMENT '身份证',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:正常，1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人物基础表';



# Dump of table t_person_capital
# ------------------------------------------------------------

CREATE TABLE `t_person_capital` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `capital_id` int(11) unsigned NOT NULL COMMENT '业务ID',
  `person_id` int(11) unsigned NOT NULL COMMENT '拥有资本的人ID',
  `height` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '身高(cm)',
  `weight` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '体重(kg)',
  `income` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收入(元)',
  `marry_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '婚恋状态: 1=未婚,2=离异',
  `childrens` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '孩子个数',
  `professional` varchar(32) DEFAULT NULL COMMENT '职业',
  `remark` varchar(255) DEFAULT '' COMMENT '自我填写备注',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:正常，1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='个人资本表';



# Dump of table t_person_demand
# ------------------------------------------------------------

CREATE TABLE `t_person_demand` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `demand_id` bigint(20) unsigned NOT NULL COMMENT '业务ID',
  `person_id` bigint(20) unsigned NOT NULL COMMENT '需求方(提要求)的人ID',
  `field_name` int(11) DEFAULT NULL COMMENT '要求字段: t_person_capital 表的字段',
  `field_relation` int(11) DEFAULT NULL COMMENT '要求关系: =、>、 <、in、 not in',
  `field_threshold` int(11) DEFAULT NULL COMMENT '要求阀值',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:正常，1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对象要求表';



# Dump of table t_person_tag
# ------------------------------------------------------------

CREATE TABLE `t_person_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tag_id` bigint(20) unsigned NOT NULL COMMENT '业务ID',
  `person_id` bigint(20) unsigned NOT NULL COMMENT '人物ID',
  `desc` varchar(128) NOT NULL DEFAULT '' COMMENT '标签值',
  `category` varchar(16) NOT NULL DEFAULT '' COMMENT 'capital=个人品行，demand=要求品行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人物标签';



# Dump of table t_rope
# ------------------------------------------------------------

CREATE TABLE `t_rope` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rope_id` bigint(20) unsigned NOT NULL,
  `handler` bigint(20) unsigned NOT NULL COMMENT '红娘,牵头人',
  `man` bigint(20) unsigned NOT NULL COMMENT '男生',
  `woman` bigint(20) unsigned NOT NULL COMMENT '女生',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '进展: 0:未联系',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:正常，1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `t_rope` WRITE;
/*!40000 ALTER TABLE `t_rope` DISABLE KEYS */;

INSERT INTO `t_rope` (`id`, `rope_id`, `handler`, `man`, `woman`, `status`, `is_deleted`)
VALUES
	(1,0,0,0,0,255,0);

/*!40000 ALTER TABLE `t_rope` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
