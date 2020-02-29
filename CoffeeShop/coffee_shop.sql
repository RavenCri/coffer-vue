/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : 127.0.0.1:3300
 Source Schema         : coffee_shop

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 28/02/2020 00:00:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NULL DEFAULT NULL,
  `vid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 843 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (12.00, 15, 842, 1, NULL, 1, '小北咖啡', 12.00);

-- ----------------------------
-- Table structure for column_goods
-- ----------------------------
DROP TABLE IF EXISTS `column_goods`;
CREATE TABLE `column_goods`  (
  `id` int(255) NOT NULL,
  `column_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of column_goods
-- ----------------------------
INSERT INTO `column_goods` VALUES (0, '饮品栏目');
INSERT INTO `column_goods` VALUES (1, '糕点栏目');
INSERT INTO `column_goods` VALUES (2, '套餐栏目');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (39, '绿豆果汁', '7 8 9', 102, 3, 2, 'moDxGRdeS3', '1582719577279');
INSERT INTO `goods` VALUES (40, '美式咖啡', '10 15 18', 1250, 0, 1, 's4bOnjpd8l', '1582719545279');
INSERT INTO `goods` VALUES (42, '拿铁咖啡', '10 15 18', 668, 0, 3, 'n7vJTAZKZh', '1582719541279');
INSERT INTO `goods` VALUES (43, '草莓蛋糕', '6 10 13', 1237, 1, 4, 'uMGeGOJROY', '1582719821279');
INSERT INTO `goods` VALUES (44, '经典套餐', '18 24 28', 1275, 2, 5, 'EtotJQyf79', '1582719581201');
INSERT INTO `goods` VALUES (45, '超值套餐', '15 20 23', 666, 2, 6, 'GXTsPgT2ow', '1582719661202');
INSERT INTO `goods` VALUES (46, '卡布奇诺', '9 15 23', 547, 0, 7, 'J0XZrwARwy', '1582719551279');
INSERT INTO `goods` VALUES (47, '果冻草莓甜糕', '14 20 25', 50, 1, 8, 'KbJ3ODpIoN', '1582719731279');
INSERT INTO `goods` VALUES (48, '爱尔兰咖啡', '15 25 32', 48, 0, 10, 'qqROI9x1ov', '1582719561279');
INSERT INTO `goods` VALUES (49, '维也纳咖啡', '13 15 17', 56, 0, 11, 'kvfdGO1ueJ', '1582719571279');
INSERT INTO `goods` VALUES (50, '意大利咖啡', '16 22 26', 47, 0, 12, '9ct2eQCy64', '1582719580279');
INSERT INTO `goods` VALUES (51, '冰淇淋松饼', '12 15 18', 47, 1, 13, 'OPPDqSMrKK', '1582719565279');

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `big_column` int(255) NULL DEFAULT NULL,
  `small_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (0, 0, '咖啡区');
INSERT INTO `goods_type` VALUES (1, 1, '点心区');
INSERT INTO `goods_type` VALUES (2, 2, '套餐区');
INSERT INTO `goods_type` VALUES (3, 0, '果汁区');

-- ----------------------------
-- Table structure for goodOrder
-- ----------------------------
DROP TABLE IF EXISTS `goodOrder`;
CREATE TABLE `goodOrder`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `money` decimal(11, 2) NULL DEFAULT NULL,
  `fmoney` decimal(11, 2) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modified_time` datetime(0) NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (14, 'zxc', '6CB64CA755DF5AA8AD6E4556B1DCCC4C', 'CC249FC5-6D79-466C-AD1D-E94DFD382EFE', NULL, NULL);
INSERT INTO `user` VALUES (15, '12', 'BD41482776D0A76124DD53E4AF04EE57', '6CC5919E-9259-40CA-B15E-B77658562C76', NULL, NULL);
INSERT INTO `user` VALUES (16, '12345678', '55A8BA5B4C4674AE531CD9861D454BD6', 'E078791A-021A-4C2B-BFBE-493D2DAB085F', NULL, NULL);

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员编号',
  `vname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名',
  `vphone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员手机号',
  `vmoney` decimal(11, 2) NULL DEFAULT NULL COMMENT '会员余额',
  `credit` int(11) NULL DEFAULT NULL COMMENT '会员积分',
  `recent_time` datetime(0) NULL DEFAULT NULL COMMENT '会员最近购买时间',
  `reg_time` datetime(0) NULL DEFAULT NULL COMMENT '会员注册时间',
  `vtype` int(11) NULL DEFAULT NULL COMMENT '会员类型（0储蓄，1折扣）',
  `cost_money` decimal(11, 2) NULL DEFAULT NULL COMMENT '花费总金额',
  `exp` int(11) NULL DEFAULT NULL COMMENT '会员经验等级',
  `count` int(11) NULL DEFAULT NULL COMMENT '签到次数',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES (17, '李旭昶', '17816559722', 22268.40, NULL, NULL, '2019-12-30 10:10:36', 0, NULL, NULL, NULL);
INSERT INTO `vip` VALUES (18, '李旭', '17816559789', 1725344.00, NULL, NULL, '2019-12-30 10:10:44', 1, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
