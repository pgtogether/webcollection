/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2015-11-11 23:24:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_category_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_category_bind`;
CREATE TABLE `user_category_bind` (
  `categoryid` varchar(20) NOT NULL COMMENT '大分类',
  `userid` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
