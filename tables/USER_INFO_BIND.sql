/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2015-11-11 23:25:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_info_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_info_bind`;
CREATE TABLE `user_info_bind` (
  `userid` varchar(20) NOT NULL,
  `occupationid` varchar(10) DEFAULT NULL COMMENT '职业',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
