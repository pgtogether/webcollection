/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2015-11-11 23:24:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookmark_category
-- ----------------------------
DROP TABLE IF EXISTS `bookmark_category`;
CREATE TABLE `bookmark_category` (
  `categoryid` varchar(20) NOT NULL,
  `categoryname` varchar(40) NOT NULL,
  `categorytype` varchar(1) NOT NULL COMMENT '分类类型：1大分类，2:小分类',
  `parentcategoryid` varchar(20) DEFAULT NULL COMMENT '小分类属于的大分类ID',
  `categorypermission` varchar(1) DEFAULT NULL COMMENT '1(默认显示)  2(隐私分类:访问需要密码)',
  `categorypsw` varchar(16) DEFAULT NULL COMMENT '隐私分类查看密码',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
