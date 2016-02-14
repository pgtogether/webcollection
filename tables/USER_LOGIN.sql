/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-02-14 21:49:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `userid` varchar(20) NOT NULL,
  `loginname` varchar(255) DEFAULT NULL COMMENT '登录名',
  `logpsw` varchar(64) DEFAULT NULL COMMENT '登录密码MD5加密',
  `logintime` datetime DEFAULT NULL,
  `loginip` varchar(20) DEFAULT NULL,
  `loginerrorcnt` int(11) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
