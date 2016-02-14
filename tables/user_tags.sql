/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-02-14 21:50:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user_tags
-- ----------------------------
DROP TABLE IF EXISTS `user_tags`;
CREATE TABLE `user_tags` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tagno` int(11) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `tagname` varchar(50) DEFAULT NULL,
  `usetimes` int(11) DEFAULT NULL,
  `tagnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`tagid`),
  UNIQUE KEY `unique_tag` (`tagno`,`userid`),
  UNIQUE KEY `unique_tagname` (`userid`,`tagname`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
