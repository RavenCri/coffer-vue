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

 Date: 02/03/2020 13:00:44
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
-- Table structure for coll_good
-- ----------------------------
DROP TABLE IF EXISTS `coll_good`;
CREATE TABLE `coll_good`  (
  `vip_id` int(11) NULL DEFAULT NULL,
  `good_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coll_good
-- ----------------------------
INSERT INTO `coll_good` VALUES (123456, '美式咖啡', 1);
INSERT INTO `coll_good` VALUES (123456, '拿铁咖啡', 2);
INSERT INTO `coll_good` VALUES (123456, '卡布奇诺', 3);

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
-- Table structure for good_order
-- ----------------------------
DROP TABLE IF EXISTS `good_order`;
CREATE TABLE `good_order`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `vid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vipID',
  `good_num` int(11) NULL DEFAULT NULL COMMENT '货品数量',
  `money` double(11, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `fmoney` double(11, 2) NULL DEFAULT NULL COMMENT '最终支付金额',
  `created_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单创建世界',
  `good_id` int(255) NULL DEFAULT NULL COMMENT '商品ID',
  `commodity_specification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品属性',
  `order_status` int(255) NULL DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good_order
-- ----------------------------
INSERT INTO `good_order` VALUES (214, '0', 1, 18.00, 18.00, '1583053211072', 40, 'bigPlusCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (215, '0', 1, 15.00, 15.00, '1583053258821', 46, 'bigCup#middleSweet', -1);
INSERT INTO `good_order` VALUES (216, '0', 1, 18.00, 18.00, '1583053276042', 40, 'bigPlusCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (217, '0', 1, 10.00, 10.00, '1583053276061', 42, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (218, '0', 1, 15.00, 15.00, '1583053276075', 46, 'bigCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (219, '123456', 1, 10.00, 9.50, '1583053318241', 40, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (220, '123456', 2, 36.00, 34.20, '1583053366244', 40, 'bigPlusCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (221, '123456', 1, 10.00, 9.50, '1583053366260', 42, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (222, '123456', 1, 15.00, 14.25, '1583053366273', 46, 'bigCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (223, '123456', 1, 18.00, 17.10, '1583053366287', 42, 'bigPlusCup#manySweet', 1);
INSERT INTO `good_order` VALUES (224, '0', 1, 10.00, 10.00, '1583115798506', 42, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (225, '0', 1, 15.00, 15.00, '1583115798548', 46, 'bigCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (226, '0', 1, 10.00, 10.00, '1583115837689', 42, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (227, '0', 1, 15.00, 15.00, '1583115837705', 46, 'bigCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (228, '0', 1, 10.00, 10.00, '1583116122745', 42, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (229, '0', 1, 15.00, 15.00, '1583116122774', 46, 'bigCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (230, '0', 1, 10.00, 10.00, '1583116258623', 42, 'middleCup#middleSweet', 1);
INSERT INTO `good_order` VALUES (231, '0', 1, 15.00, 15.00, '1583116258654', 46, 'bigCup#middleSweet', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (0, 0, '咖啡区');
INSERT INTO `goods_type` VALUES (1, 1, '点心区');
INSERT INTO `goods_type` VALUES (2, 2, '套餐区');
INSERT INTO `goods_type` VALUES (3, 0, '果汁区');

-- ----------------------------
-- Table structure for recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `recharge_order`;
CREATE TABLE `recharge_order`  (
  `time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recharge_money` decimal(10, 0) NULL DEFAULT NULL,
  `order_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recharge_order
-- ----------------------------
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:36:51', 15, '123456', 425, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:39:51', 16, '123456', 400, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:40:55', 17, '123456', 400, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:43:59', 18, '123456', 425, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:45:57', 19, '123456', 425, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:46:54', 20, '123456', 2000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-01 23:53:30', 21, '123456', 400, 1);

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
  `vip_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vip专属ID',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES (23, 'raven', '18856975969', 0.00, 7987, NULL, '2020-02-28 12:22:35', 0, NULL, NULL, NULL, '123456');

SET FOREIGN_KEY_CHECKS = 1;
