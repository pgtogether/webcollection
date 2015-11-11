/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2015-11-11 23:23:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookmark
-- ----------------------------
DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE `bookmark` (
  `bookmarkid` varchar(20) NOT NULL,
  `bookmarkname` varchar(200) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `permission` varchar(1) NOT NULL COMMENT '访问权限：1(默认私有) 2(公开)',
  `categoryid` varchar(20) NOT NULL COMMENT '小分类ID',
  `usetimes` int(11) DEFAULT NULL COMMENT '访问次数',
  `fastletters` varchar(20) DEFAULT NULL,
  `pinyinhead` varchar(1) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '收藏时间',
  `lastusetime` datetime DEFAULT NULL COMMENT '最后一次使用时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `description` varchar(500) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `hot` varchar(1) DEFAULT NULL COMMENT '常用网址：1(常用) 2(不常用)',
  `deleteflg` varchar(1) DEFAULT NULL COMMENT '1(正常) 2(被删除)',
  PRIMARY KEY (`bookmarkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
