/*
Navicat MySQL Data Transfer

Source Server         : sample
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : lims2018adb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-11-22 22:32:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `data_key`
-- ----------------------------
DROP TABLE IF EXISTS `data_key`;
CREATE TABLE `data_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `up_data_key_id` bigint(20) DEFAULT NULL,
  `data_key_type` varchar(255) NOT NULL,
  `column_number` int(11) NOT NULL,
  `data_unit` varchar(255) DEFAULT NULL,
  `column_seperator` varchar(255) NOT NULL,
  `append_parameter` varchar(255) DEFAULT NULL,
  `data_tag` varchar(255) NOT NULL,
  `dictionary_id` bigint(20) NOT NULL,
  `order_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgnosaw19330m9b74wxm8aknnf` (`up_data_key_id`),
  KEY `FKl2uqn74kg27n0as7b242b89oq` (`dictionary_id`),
  CONSTRAINT `FKgnosaw19330m9b74wxm8aknnf` FOREIGN KEY (`up_data_key_id`) REFERENCES `data_key` (`id`),
  CONSTRAINT `FKl2uqn74kg27n0as7b242b89oq` FOREIGN KEY (`dictionary_id`) REFERENCES `data_dictionary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_key
-- ----------------------------
INSERT INTO `data_key` VALUES ('1', '0', null, 'dataKeyNormal', '1', '无量纲', ',', null, '用户类库', '1', '0');
INSERT INTO `data_key` VALUES ('2', '0', '1', 'dataKeyNormal', '1', '无量纲', ',', null, '类库名称', '1', '0');
INSERT INTO `data_key` VALUES ('3', '0', '1', 'dataKeyNormal', '1', '无量纲', ',', null, '类库说明', '1', '0');
INSERT INTO `data_key` VALUES ('4', '0', null, 'dataKeyNormal', '1', '无量纲', ',', null, '用户类', '1', '0');
INSERT INTO `data_key` VALUES ('5', '0', '4', 'dataKeyNormal', '1', '无量纲', ',', null, '类名称', '1', '0');
INSERT INTO `data_key` VALUES ('6', '0', '4', 'dataKeyNormal', '1', '无量纲', ',', null, '功能说明', '1', '0');
INSERT INTO `data_key` VALUES ('7', '0', '1', 'dataKeyFile', '1', '无量纲', ',', null, '库文件', '1', '0');
INSERT INTO `data_key` VALUES ('8', '0', '4', 'dataKeyNormal', '1', '无量纲', ',', null, '输入关键字', '1', '0');
INSERT INTO `data_key` VALUES ('9', '0', '4', 'dataKeyNormal', '1', '无量纲', ',', null, '输出关键字', '1', '0');
