/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-02-14 21:49:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookmark
-- ----------------------------
DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE `bookmark` (
  `bookmarkid` int(11) NOT NULL AUTO_INCREMENT,
  `bookmarkname` varchar(200) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `bookmarkno` int(11) NOT NULL COMMENT '每个用户名下的书签编号',
  `url` varchar(2000) NOT NULL,
  `permission` varchar(1) NOT NULL COMMENT '访问权限：1(默认私有) 2(公开)',
  `categoryno` int(11) NOT NULL COMMENT '小分类ID',
  `usetimes` int(11) DEFAULT NULL COMMENT '访问次数',
  `pinyin` varchar(100) DEFAULT NULL,
  `pinyinhead` varchar(1) DEFAULT NULL,
  `createtime` datetime NOT NULL COMMENT '收藏时间',
  `lastusetime` datetime DEFAULT NULL COMMENT '最后一次使用时间',
  `updatetime` datetime DEFAULT NULL COMMENT '修改时间',
  `description` varchar(500) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `hot` varchar(1) DEFAULT NULL COMMENT '常用网址：1(常用) 2(不常用)',
  `deleteflg` varchar(1) NOT NULL COMMENT '0',
  `tags` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bookmarkid`),
  UNIQUE KEY `unique_user_bookmark` (`userid`,`bookmarkno`) USING BTREE COMMENT '唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
