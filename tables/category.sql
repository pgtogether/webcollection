/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : myweb

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2016-02-14 21:49:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(40) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `categoryno` int(11) NOT NULL,
  `categorytype` varchar(1) NOT NULL COMMENT '分类类型：1大分类，2:小分类',
  `parentcategoryno` int(11) DEFAULT NULL COMMENT '小分类属于的大分类ID',
  `categorypermission` varchar(1) DEFAULT NULL COMMENT '1(默认显示)  2(隐私分类:访问需要密码)',
  `categorypsw` varchar(16) DEFAULT NULL COMMENT '隐私分类查看密码',
  `createtime` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `colno` varchar(10) DEFAULT NULL COMMENT '分类所属栏位',
  `pinyin` varchar(100) DEFAULT NULL,
  `pinyinhead` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `unique_user_category` (`userid`,`categoryno`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;
