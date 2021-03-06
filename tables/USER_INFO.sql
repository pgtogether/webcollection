/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-02-14 21:49:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `userid` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `categorypsw` varchar(64) NOT NULL COMMENT '分类密码采用4位MD5加密的数字密码',
  `sex` varchar(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pswquestion` varchar(100) DEFAULT NULL COMMENT '密保问题',
  `pswanswer` varchar(100) DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
