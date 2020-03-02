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

 Date: 02/03/2020 19:22:24
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
  `created_time` datetime(3) NULL DEFAULT NULL COMMENT '订单创建时间',
  `good_id` int(255) NULL DEFAULT NULL COMMENT '商品ID',
  `commodity_specification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品属性',
  `order_status` int(255) NULL DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of good_order
-- ----------------------------
INSERT INTO `good_order` VALUES (234, '123456', 1, 10.00, 3.00, '2020-03-01 16:49:50.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (235, '123456', 1, 50.00, 67857.00, '2020-01-01 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (236, '123456', 1, 50.00, 27183.00, '2020-01-02 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (237, '123456', 1, 50.00, 96082.00, '2020-01-03 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (238, '123456', 1, 50.00, 68383.00, '2020-01-04 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (239, '123456', 1, 50.00, 59024.00, '2020-01-05 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (240, '123456', 1, 50.00, 26443.00, '2020-01-06 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (241, '123456', 1, 50.00, 29823.00, '2020-01-07 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (242, '123456', 1, 50.00, 62127.00, '2020-01-08 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (243, '123456', 1, 50.00, 53041.00, '2020-01-09 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (244, '123456', 1, 50.00, 85820.00, '2020-01-10 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (245, '123456', 1, 50.00, 46306.00, '2020-01-11 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (246, '123456', 1, 50.00, 59085.00, '2020-01-12 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (247, '123456', 1, 50.00, 89425.00, '2020-01-13 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (248, '123456', 1, 50.00, 84893.00, '2020-01-14 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (249, '123456', 1, 50.00, 11811.00, '2020-01-15 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (250, '123456', 1, 50.00, 47097.00, '2020-01-16 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (251, '123456', 1, 50.00, 19247.00, '2020-01-17 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (252, '123456', 1, 50.00, 41405.00, '2020-01-18 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (253, '123456', 1, 50.00, 91853.00, '2020-01-19 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (254, '123456', 1, 50.00, 59336.00, '2020-01-20 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (255, '123456', 1, 50.00, 65014.00, '2020-01-21 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (256, '123456', 1, 50.00, 59438.00, '2020-01-22 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (257, '123456', 1, 50.00, 57061.00, '2020-01-23 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (258, '123456', 1, 50.00, 14782.00, '2020-01-24 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (259, '123456', 1, 50.00, 32839.00, '2020-01-25 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (260, '123456', 1, 50.00, 98062.00, '2020-01-26 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (261, '123456', 1, 50.00, 66955.00, '2020-01-27 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (262, '123456', 1, 50.00, 59677.00, '2020-01-28 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (263, '123456', 1, 50.00, 79935.00, '2020-01-29 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (264, '123456', 1, 50.00, 29614.00, '2020-01-30 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (265, '123456', 1, 50.00, 32328.00, '2020-01-31 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (266, '123456', 1, 50.00, 27324.00, '2020-02-01 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (267, '123456', 1, 50.00, 19101.00, '2020-02-02 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (268, '123456', 1, 50.00, 23031.00, '2020-02-03 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (269, '123456', 1, 50.00, 1079.00, '2020-02-04 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (270, '123456', 1, 50.00, 52794.00, '2020-02-05 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (271, '123456', 1, 50.00, 99006.00, '2020-02-06 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (272, '123456', 1, 50.00, 20652.00, '2020-02-07 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (273, '123456', 1, 50.00, 68671.00, '2020-02-08 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (274, '123456', 1, 50.00, 31559.00, '2020-02-09 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (275, '123456', 1, 50.00, 38453.00, '2020-02-10 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (276, '123456', 1, 50.00, 85360.00, '2020-02-11 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (277, '123456', 1, 50.00, 23933.00, '2020-02-12 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (278, '123456', 1, 50.00, 50886.00, '2020-02-13 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (279, '123456', 1, 50.00, 61125.00, '2020-02-14 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (280, '123456', 1, 50.00, 13041.00, '2020-02-15 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (281, '123456', 1, 50.00, 16125.00, '2020-02-16 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (282, '123456', 1, 50.00, 17093.00, '2020-02-17 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (283, '123456', 1, 50.00, 47454.00, '2020-02-18 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (284, '123456', 1, 50.00, 76260.00, '2020-02-19 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (285, '123456', 1, 50.00, 19103.00, '2020-02-20 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (286, '123456', 1, 50.00, 92833.00, '2020-02-21 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (287, '123456', 1, 50.00, 58829.00, '2020-02-22 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (288, '123456', 1, 50.00, 91985.00, '2020-02-23 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (289, '123456', 1, 50.00, 22701.00, '2020-02-24 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (290, '123456', 1, 50.00, 20925.00, '2020-02-25 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (291, '123456', 1, 50.00, 95651.00, '2020-02-26 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (292, '123456', 1, 50.00, 99648.00, '2020-02-27 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (293, '123456', 1, 50.00, 47899.00, '2020-02-28 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (294, '123456', 1, 50.00, 8492.00, '2020-02-29 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (295, '123456', 1, 50.00, 54660.00, '2020-03-01 12:00:00.000', 42, 'test', 1);
INSERT INTO `good_order` VALUES (296, '123456', 1, 50.00, 38997.00, '2020-03-02 12:00:00.000', 42, 'test', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:29:25', 22, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:33:34', 23, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:35:59', 24, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:37:26', 25, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:39:07', 26, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:41:35', 27, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:45:25', 28, '123456', 1000001, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:48:28', 29, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 13:58:34', 30, '123456', 100000, 1);
INSERT INTO `recharge_order` VALUES ('2020-03-02 14:07:35', 31, '123456', 100000, 1);

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
  `money_disc` double(11, 2) NULL DEFAULT NULL COMMENT '打折率',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES (23, 'raven', '18856975969', 99989.50, 100090, NULL, '2020-02-28 12:22:35', 1, NULL, NULL, NULL, '123456', 0.30);

SET FOREIGN_KEY_CHECKS = 1;
