/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : stumanagementbyweb

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2019-12-27 23:59:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'admin', 'admin');
INSERT INTO `login` VALUES ('2', 'Test', 'Test');
INSERT INTO `login` VALUES ('3', '10086', '10086');

-- ----------------------------
-- Table structure for `studentinfo`
-- ----------------------------
DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `id` char(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `birthday` varchar(45) NOT NULL,
  `schoolday` varchar(45) NOT NULL,
  `major` varchar(45) NOT NULL,
  `college` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of studentinfo
-- ----------------------------
INSERT INTO `studentinfo` VALUES ('0000', '菜菜', '男', '2001-06-08', '2018-09-05', '金融学', '航运经贸学院学院');
INSERT INTO `studentinfo` VALUES ('0001', '空空', '男', '2000-02-21', '2017-09-01', '物流工程', '港口与航运管理学院');
INSERT INTO `studentinfo` VALUES ('0002', '七七', '女', '1999-12-31', '2017-09-01', '电子商务（跨境电商）', '航运经贸学院学院');
INSERT INTO `studentinfo` VALUES ('0003', '沙沙', '男', '2000-02-01', '2018-09-01', '金融学', '航运经贸学院学院');
INSERT INTO `studentinfo` VALUES ('0005', '岚岚', '女', '2000-11-27', '2018-09-27', '商务英语', '外语学院');
