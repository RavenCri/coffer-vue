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

 Date: 02/03/2020 19:27:15
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
INSERT INTO `good_order` VALUES (297, '123456', 1, 50.00, 3997.00, '2019-01-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (298, '123456', 1, 50.00, 61428.00, '2019-01-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (299, '123456', 1, 50.00, 8783.00, '2019-01-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (300, '123456', 1, 50.00, 49130.00, '2019-01-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (301, '123456', 1, 50.00, 85413.00, '2019-01-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (302, '123456', 1, 50.00, 40301.00, '2019-01-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (303, '123456', 1, 50.00, 31509.00, '2019-01-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (304, '123456', 1, 50.00, 40218.00, '2019-01-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (305, '123456', 1, 50.00, 37007.00, '2019-01-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (306, '123456', 1, 50.00, 32785.00, '2019-01-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (307, '123456', 1, 50.00, 85254.00, '2019-01-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (308, '123456', 1, 50.00, 95766.00, '2019-01-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (309, '123456', 1, 50.00, 23095.00, '2019-01-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (310, '123456', 1, 50.00, 32644.00, '2019-01-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (311, '123456', 1, 50.00, 29248.00, '2019-01-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (312, '123456', 1, 50.00, 62603.00, '2019-01-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (313, '123456', 1, 50.00, 73134.00, '2019-01-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (314, '123456', 1, 50.00, 88088.00, '2019-01-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (315, '123456', 1, 50.00, 91343.00, '2019-01-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (316, '123456', 1, 50.00, 70916.00, '2019-01-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (317, '123456', 1, 50.00, 16176.00, '2019-01-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (318, '123456', 1, 50.00, 44542.00, '2019-01-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (319, '123456', 1, 50.00, 73451.00, '2019-01-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (320, '123456', 1, 50.00, 85046.00, '2019-01-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (321, '123456', 1, 50.00, 8247.00, '2019-01-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (322, '123456', 1, 50.00, 10491.00, '2019-01-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (323, '123456', 1, 50.00, 28153.00, '2019-01-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (324, '123456', 1, 50.00, 72664.00, '2019-01-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (325, '123456', 1, 50.00, 41249.00, '2019-01-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (326, '123456', 1, 50.00, 75766.00, '2019-01-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (327, '123456', 1, 50.00, 83685.00, '2019-01-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (328, '123456', 1, 50.00, 16958.00, '2019-02-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (329, '123456', 1, 50.00, 1308.00, '2019-02-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (330, '123456', 1, 50.00, 37643.00, '2019-02-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (331, '123456', 1, 50.00, 47115.00, '2019-02-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (332, '123456', 1, 50.00, 22951.00, '2019-02-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (333, '123456', 1, 50.00, 88693.00, '2019-02-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (334, '123456', 1, 50.00, 3340.00, '2019-02-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (335, '123456', 1, 50.00, 67022.00, '2019-02-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (336, '123456', 1, 50.00, 43756.00, '2019-02-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (337, '123456', 1, 50.00, 29904.00, '2019-02-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (338, '123456', 1, 50.00, 7298.00, '2019-02-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (339, '123456', 1, 50.00, 65867.00, '2019-02-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (340, '123456', 1, 50.00, 80318.00, '2019-02-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (341, '123456', 1, 50.00, 58146.00, '2019-02-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (342, '123456', 1, 50.00, 67984.00, '2019-02-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (343, '123456', 1, 50.00, 12114.00, '2019-02-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (344, '123456', 1, 50.00, 73508.00, '2019-02-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (345, '123456', 1, 50.00, 46926.00, '2019-02-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (346, '123456', 1, 50.00, 39567.00, '2019-02-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (347, '123456', 1, 50.00, 95033.00, '2019-02-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (348, '123456', 1, 50.00, 56901.00, '2019-02-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (349, '123456', 1, 50.00, 96730.00, '2019-02-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (350, '123456', 1, 50.00, 29428.00, '2019-02-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (351, '123456', 1, 50.00, 80966.00, '2019-02-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (352, '123456', 1, 50.00, 41123.00, '2019-02-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (353, '123456', 1, 50.00, 53152.00, '2019-02-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (354, '123456', 1, 50.00, 68037.00, '2019-02-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (355, '123456', 1, 50.00, 52368.00, '2019-02-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (356, '123456', 1, 50.00, 609.00, '2019-03-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (357, '123456', 1, 50.00, 9384.00, '2019-03-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (358, '123456', 1, 50.00, 61169.00, '2019-03-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (359, '123456', 1, 50.00, 24695.00, '2019-03-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (360, '123456', 1, 50.00, 31978.00, '2019-03-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (361, '123456', 1, 50.00, 70902.00, '2019-03-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (362, '123456', 1, 50.00, 55845.00, '2019-03-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (363, '123456', 1, 50.00, 40934.00, '2019-03-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (364, '123456', 1, 50.00, 81169.00, '2019-03-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (365, '123456', 1, 50.00, 84817.00, '2019-03-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (366, '123456', 1, 50.00, 92442.00, '2019-03-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (367, '123456', 1, 50.00, 34095.00, '2019-03-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (368, '123456', 1, 50.00, 86247.00, '2019-03-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (369, '123456', 1, 50.00, 58633.00, '2019-03-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (370, '123456', 1, 50.00, 22861.00, '2019-03-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (371, '123456', 1, 50.00, 11792.00, '2019-03-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (372, '123456', 1, 50.00, 11939.00, '2019-03-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (373, '123456', 1, 50.00, 36996.00, '2019-03-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (374, '123456', 1, 50.00, 57385.00, '2019-03-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (375, '123456', 1, 50.00, 16674.00, '2019-03-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (376, '123456', 1, 50.00, 81525.00, '2019-03-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (377, '123456', 1, 50.00, 51513.00, '2019-03-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (378, '123456', 1, 50.00, 89284.00, '2019-03-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (379, '123456', 1, 50.00, 46700.00, '2019-03-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (380, '123456', 1, 50.00, 8643.00, '2019-03-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (381, '123456', 1, 50.00, 82277.00, '2019-03-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (382, '123456', 1, 50.00, 38078.00, '2019-03-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (383, '123456', 1, 50.00, 8388.00, '2019-03-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (384, '123456', 1, 50.00, 72757.00, '2019-03-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (385, '123456', 1, 50.00, 69320.00, '2019-03-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (386, '123456', 1, 50.00, 98888.00, '2019-03-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (387, '123456', 1, 50.00, 52533.00, '2019-04-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (388, '123456', 1, 50.00, 43251.00, '2019-04-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (389, '123456', 1, 50.00, 51022.00, '2019-04-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (390, '123456', 1, 50.00, 70174.00, '2019-04-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (391, '123456', 1, 50.00, 76434.00, '2019-04-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (392, '123456', 1, 50.00, 91386.00, '2019-04-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (393, '123456', 1, 50.00, 94263.00, '2019-04-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (394, '123456', 1, 50.00, 70820.00, '2019-04-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (395, '123456', 1, 50.00, 38227.00, '2019-04-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (396, '123456', 1, 50.00, 48927.00, '2019-04-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (397, '123456', 1, 50.00, 32978.00, '2019-04-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (398, '123456', 1, 50.00, 13447.00, '2019-04-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (399, '123456', 1, 50.00, 4148.00, '2019-04-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (400, '123456', 1, 50.00, 38061.00, '2019-04-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (401, '123456', 1, 50.00, 27426.00, '2019-04-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (402, '123456', 1, 50.00, 40168.00, '2019-04-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (403, '123456', 1, 50.00, 25706.00, '2019-04-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (404, '123456', 1, 50.00, 39754.00, '2019-04-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (405, '123456', 1, 50.00, 12053.00, '2019-04-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (406, '123456', 1, 50.00, 11858.00, '2019-04-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (407, '123456', 1, 50.00, 82078.00, '2019-04-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (408, '123456', 1, 50.00, 45507.00, '2019-04-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (409, '123456', 1, 50.00, 76396.00, '2019-04-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (410, '123456', 1, 50.00, 8465.00, '2019-04-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (411, '123456', 1, 50.00, 84406.00, '2019-04-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (412, '123456', 1, 50.00, 90143.00, '2019-04-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (413, '123456', 1, 50.00, 60790.00, '2019-04-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (414, '123456', 1, 50.00, 36386.00, '2019-04-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (415, '123456', 1, 50.00, 68273.00, '2019-04-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (416, '123456', 1, 50.00, 26002.00, '2019-04-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (417, '123456', 1, 50.00, 90279.00, '2019-05-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (418, '123456', 1, 50.00, 52331.00, '2019-05-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (419, '123456', 1, 50.00, 72098.00, '2019-05-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (420, '123456', 1, 50.00, 27097.00, '2019-05-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (421, '123456', 1, 50.00, 11667.00, '2019-05-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (422, '123456', 1, 50.00, 41083.00, '2019-05-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (423, '123456', 1, 50.00, 99979.00, '2019-05-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (424, '123456', 1, 50.00, 86386.00, '2019-05-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (425, '123456', 1, 50.00, 64836.00, '2019-05-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (426, '123456', 1, 50.00, 56086.00, '2019-05-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (427, '123456', 1, 50.00, 74543.00, '2019-05-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (428, '123456', 1, 50.00, 28870.00, '2019-05-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (429, '123456', 1, 50.00, 15532.00, '2019-05-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (430, '123456', 1, 50.00, 1260.00, '2019-05-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (431, '123456', 1, 50.00, 29924.00, '2019-05-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (432, '123456', 1, 50.00, 92115.00, '2019-05-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (433, '123456', 1, 50.00, 23381.00, '2019-05-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (434, '123456', 1, 50.00, 18997.00, '2019-05-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (435, '123456', 1, 50.00, 41999.00, '2019-05-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (436, '123456', 1, 50.00, 38282.00, '2019-05-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (437, '123456', 1, 50.00, 59263.00, '2019-05-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (438, '123456', 1, 50.00, 23320.00, '2019-05-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (439, '123456', 1, 50.00, 9859.00, '2019-05-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (440, '123456', 1, 50.00, 68362.00, '2019-05-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (441, '123456', 1, 50.00, 35200.00, '2019-05-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (442, '123456', 1, 50.00, 94219.00, '2019-05-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (443, '123456', 1, 50.00, 16472.00, '2019-05-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (444, '123456', 1, 50.00, 4561.00, '2019-05-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (445, '123456', 1, 50.00, 14979.00, '2019-05-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (446, '123456', 1, 50.00, 79696.00, '2019-05-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (447, '123456', 1, 50.00, 82569.00, '2019-05-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (448, '123456', 1, 50.00, 21071.00, '2019-06-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (449, '123456', 1, 50.00, 90246.00, '2019-06-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (450, '123456', 1, 50.00, 47208.00, '2019-06-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (451, '123456', 1, 50.00, 65036.00, '2019-06-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (452, '123456', 1, 50.00, 78040.00, '2019-06-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (453, '123456', 1, 50.00, 12609.00, '2019-06-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (454, '123456', 1, 50.00, 95896.00, '2019-06-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (455, '123456', 1, 50.00, 6324.00, '2019-06-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (456, '123456', 1, 50.00, 32850.00, '2019-06-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (457, '123456', 1, 50.00, 1927.00, '2019-06-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (458, '123456', 1, 50.00, 52099.00, '2019-06-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (459, '123456', 1, 50.00, 55535.00, '2019-06-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (460, '123456', 1, 50.00, 86951.00, '2019-06-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (461, '123456', 1, 50.00, 71227.00, '2019-06-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (462, '123456', 1, 50.00, 26019.00, '2019-06-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (463, '123456', 1, 50.00, 85192.00, '2019-06-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (464, '123456', 1, 50.00, 58135.00, '2019-06-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (465, '123456', 1, 50.00, 92635.00, '2019-06-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (466, '123456', 1, 50.00, 20374.00, '2019-06-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (467, '123456', 1, 50.00, 90543.00, '2019-06-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (468, '123456', 1, 50.00, 41834.00, '2019-06-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (469, '123456', 1, 50.00, 97531.00, '2019-06-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (470, '123456', 1, 50.00, 14206.00, '2019-06-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (471, '123456', 1, 50.00, 79399.00, '2019-06-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (472, '123456', 1, 50.00, 6865.00, '2019-06-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (473, '123456', 1, 50.00, 18978.00, '2019-06-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (474, '123456', 1, 50.00, 66005.00, '2019-06-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (475, '123456', 1, 50.00, 14672.00, '2019-06-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (476, '123456', 1, 50.00, 75709.00, '2019-06-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (477, '123456', 1, 50.00, 11704.00, '2019-06-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (478, '123456', 1, 50.00, 26579.00, '2019-07-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (479, '123456', 1, 50.00, 87756.00, '2019-07-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (480, '123456', 1, 50.00, 20314.00, '2019-07-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (481, '123456', 1, 50.00, 3157.00, '2019-07-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (482, '123456', 1, 50.00, 23227.00, '2019-07-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (483, '123456', 1, 50.00, 41768.00, '2019-07-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (484, '123456', 1, 50.00, 65290.00, '2019-07-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (485, '123456', 1, 50.00, 55958.00, '2019-07-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (486, '123456', 1, 50.00, 88983.00, '2019-07-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (487, '123456', 1, 50.00, 88834.00, '2019-07-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (488, '123456', 1, 50.00, 42829.00, '2019-07-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (489, '123456', 1, 50.00, 1001.00, '2019-07-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (490, '123456', 1, 50.00, 66412.00, '2019-07-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (491, '123456', 1, 50.00, 9702.00, '2019-07-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (492, '123456', 1, 50.00, 12663.00, '2019-07-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (493, '123456', 1, 50.00, 81968.00, '2019-07-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (494, '123456', 1, 50.00, 50326.00, '2019-07-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (495, '123456', 1, 50.00, 87193.00, '2019-07-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (496, '123456', 1, 50.00, 92062.00, '2019-07-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (497, '123456', 1, 50.00, 10722.00, '2019-07-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (498, '123456', 1, 50.00, 19158.00, '2019-07-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (499, '123456', 1, 50.00, 44604.00, '2019-07-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (500, '123456', 1, 50.00, 52675.00, '2019-07-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (501, '123456', 1, 50.00, 62810.00, '2019-07-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (502, '123456', 1, 50.00, 98241.00, '2019-07-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (503, '123456', 1, 50.00, 91522.00, '2019-07-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (504, '123456', 1, 50.00, 31373.00, '2019-07-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (505, '123456', 1, 50.00, 13368.00, '2019-07-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (506, '123456', 1, 50.00, 58762.00, '2019-07-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (507, '123456', 1, 50.00, 11928.00, '2019-07-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (508, '123456', 1, 50.00, 17767.00, '2019-07-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (509, '123456', 1, 50.00, 31846.00, '2019-08-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (510, '123456', 1, 50.00, 88692.00, '2019-08-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (511, '123456', 1, 50.00, 17562.00, '2019-08-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (512, '123456', 1, 50.00, 81251.00, '2019-08-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (513, '123456', 1, 50.00, 21140.00, '2019-08-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (514, '123456', 1, 50.00, 13532.00, '2019-08-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (515, '123456', 1, 50.00, 2283.00, '2019-08-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (516, '123456', 1, 50.00, 69703.00, '2019-08-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (517, '123456', 1, 50.00, 96648.00, '2019-08-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (518, '123456', 1, 50.00, 29627.00, '2019-08-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (519, '123456', 1, 50.00, 35845.00, '2019-08-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (520, '123456', 1, 50.00, 99006.00, '2019-08-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (521, '123456', 1, 50.00, 47620.00, '2019-08-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (522, '123456', 1, 50.00, 99847.00, '2019-08-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (523, '123456', 1, 50.00, 30352.00, '2019-08-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (524, '123456', 1, 50.00, 20408.00, '2019-08-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (525, '123456', 1, 50.00, 73335.00, '2019-08-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (526, '123456', 1, 50.00, 30615.00, '2019-08-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (527, '123456', 1, 50.00, 30195.00, '2019-08-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (528, '123456', 1, 50.00, 7016.00, '2019-08-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (529, '123456', 1, 50.00, 4000.00, '2019-08-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (530, '123456', 1, 50.00, 66487.00, '2019-08-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (531, '123456', 1, 50.00, 95237.00, '2019-08-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (532, '123456', 1, 50.00, 68684.00, '2019-08-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (533, '123456', 1, 50.00, 74962.00, '2019-08-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (534, '123456', 1, 50.00, 21579.00, '2019-08-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (535, '123456', 1, 50.00, 72125.00, '2019-08-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (536, '123456', 1, 50.00, 92397.00, '2019-08-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (537, '123456', 1, 50.00, 99241.00, '2019-08-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (538, '123456', 1, 50.00, 27846.00, '2019-08-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (539, '123456', 1, 50.00, 51040.00, '2019-08-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (540, '123456', 1, 50.00, 20666.00, '2019-09-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (541, '123456', 1, 50.00, 51456.00, '2019-09-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (542, '123456', 1, 50.00, 89007.00, '2019-09-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (543, '123456', 1, 50.00, 87704.00, '2019-09-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (544, '123456', 1, 50.00, 20769.00, '2019-09-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (545, '123456', 1, 50.00, 12571.00, '2019-09-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (546, '123456', 1, 50.00, 35559.00, '2019-09-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (547, '123456', 1, 50.00, 10891.00, '2019-09-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (548, '123456', 1, 50.00, 79640.00, '2019-09-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (549, '123456', 1, 50.00, 4742.00, '2019-09-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (550, '123456', 1, 50.00, 29168.00, '2019-09-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (551, '123456', 1, 50.00, 84778.00, '2019-09-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (552, '123456', 1, 50.00, 63087.00, '2019-09-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (553, '123456', 1, 50.00, 22550.00, '2019-09-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (554, '123456', 1, 50.00, 5043.00, '2019-09-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (555, '123456', 1, 50.00, 23074.00, '2019-09-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (556, '123456', 1, 50.00, 51332.00, '2019-09-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (557, '123456', 1, 50.00, 37732.00, '2019-09-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (558, '123456', 1, 50.00, 52608.00, '2019-09-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (559, '123456', 1, 50.00, 95586.00, '2019-09-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (560, '123456', 1, 50.00, 87378.00, '2019-09-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (561, '123456', 1, 50.00, 36160.00, '2019-09-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (562, '123456', 1, 50.00, 97345.00, '2019-09-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (563, '123456', 1, 50.00, 85486.00, '2019-09-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (564, '123456', 1, 50.00, 55915.00, '2019-09-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (565, '123456', 1, 50.00, 23843.00, '2019-09-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (566, '123456', 1, 50.00, 50315.00, '2019-09-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (567, '123456', 1, 50.00, 4588.00, '2019-09-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (568, '123456', 1, 50.00, 95474.00, '2019-09-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (569, '123456', 1, 50.00, 79975.00, '2019-09-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (570, '123456', 1, 50.00, 69735.00, '2019-10-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (571, '123456', 1, 50.00, 29710.00, '2019-10-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (572, '123456', 1, 50.00, 8627.00, '2019-10-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (573, '123456', 1, 50.00, 25168.00, '2019-10-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (574, '123456', 1, 50.00, 35794.00, '2019-10-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (575, '123456', 1, 50.00, 9716.00, '2019-10-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (576, '123456', 1, 50.00, 32358.00, '2019-10-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (577, '123456', 1, 50.00, 93001.00, '2019-10-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (578, '123456', 1, 50.00, 88303.00, '2019-10-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (579, '123456', 1, 50.00, 88558.00, '2019-10-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (580, '123456', 1, 50.00, 9069.00, '2019-10-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (581, '123456', 1, 50.00, 13866.00, '2019-10-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (582, '123456', 1, 50.00, 55216.00, '2019-10-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (583, '123456', 1, 50.00, 64678.00, '2019-10-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (584, '123456', 1, 50.00, 7458.00, '2019-10-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (585, '123456', 1, 50.00, 16068.00, '2019-10-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (586, '123456', 1, 50.00, 79908.00, '2019-10-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (587, '123456', 1, 50.00, 23878.00, '2019-10-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (588, '123456', 1, 50.00, 59076.00, '2019-10-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (589, '123456', 1, 50.00, 1260.00, '2019-10-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (590, '123456', 1, 50.00, 45039.00, '2019-10-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (591, '123456', 1, 50.00, 1533.00, '2019-10-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (592, '123456', 1, 50.00, 38870.00, '2019-10-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (593, '123456', 1, 50.00, 52077.00, '2019-10-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (594, '123456', 1, 50.00, 93475.00, '2019-10-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (595, '123456', 1, 50.00, 61859.00, '2019-10-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (596, '123456', 1, 50.00, 90932.00, '2019-10-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (597, '123456', 1, 50.00, 20002.00, '2019-10-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (598, '123456', 1, 50.00, 25832.00, '2019-10-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (599, '123456', 1, 50.00, 47036.00, '2019-10-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (600, '123456', 1, 50.00, 99791.00, '2019-10-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (601, '123456', 1, 50.00, 52541.00, '2019-11-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (602, '123456', 1, 50.00, 48381.00, '2019-11-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (603, '123456', 1, 50.00, 89585.00, '2019-11-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (604, '123456', 1, 50.00, 896.00, '2019-11-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (605, '123456', 1, 50.00, 44486.00, '2019-11-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (606, '123456', 1, 50.00, 25861.00, '2019-11-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (607, '123456', 1, 50.00, 18430.00, '2019-11-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (608, '123456', 1, 50.00, 96956.00, '2019-11-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (609, '123456', 1, 50.00, 45503.00, '2019-11-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (610, '123456', 1, 50.00, 54965.00, '2019-11-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (611, '123456', 1, 50.00, 23263.00, '2019-11-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (612, '123456', 1, 50.00, 7563.00, '2019-11-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (613, '123456', 1, 50.00, 61189.00, '2019-11-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (614, '123456', 1, 50.00, 54321.00, '2019-11-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (615, '123456', 1, 50.00, 31884.00, '2019-11-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (616, '123456', 1, 50.00, 12320.00, '2019-11-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (617, '123456', 1, 50.00, 47257.00, '2019-11-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (618, '123456', 1, 50.00, 53982.00, '2019-11-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (619, '123456', 1, 50.00, 47103.00, '2019-11-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (620, '123456', 1, 50.00, 47607.00, '2019-11-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (621, '123456', 1, 50.00, 74538.00, '2019-11-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (622, '123456', 1, 50.00, 55586.00, '2019-11-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (623, '123456', 1, 50.00, 40106.00, '2019-11-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (624, '123456', 1, 50.00, 44577.00, '2019-11-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (625, '123456', 1, 50.00, 1987.00, '2019-11-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (626, '123456', 1, 50.00, 48742.00, '2019-11-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (627, '123456', 1, 50.00, 65142.00, '2019-11-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (628, '123456', 1, 50.00, 68639.00, '2019-11-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (629, '123456', 1, 50.00, 47078.00, '2019-11-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (630, '123456', 1, 50.00, 74480.00, '2019-11-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (631, '123456', 1, 50.00, 67734.00, '2019-12-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (632, '123456', 1, 50.00, 99845.00, '2019-12-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (633, '123456', 1, 50.00, 74158.00, '2019-12-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (634, '123456', 1, 50.00, 67287.00, '2019-12-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (635, '123456', 1, 50.00, 74249.00, '2019-12-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (636, '123456', 1, 50.00, 39666.00, '2019-12-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (637, '123456', 1, 50.00, 66348.00, '2019-12-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (638, '123456', 1, 50.00, 33178.00, '2019-12-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (639, '123456', 1, 50.00, 155.00, '2019-12-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (640, '123456', 1, 50.00, 78162.00, '2019-12-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (641, '123456', 1, 50.00, 99185.00, '2019-12-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (642, '123456', 1, 50.00, 89163.00, '2019-12-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (643, '123456', 1, 50.00, 50210.00, '2019-12-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (644, '123456', 1, 50.00, 3315.00, '2019-12-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (645, '123456', 1, 50.00, 70510.00, '2019-12-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (646, '123456', 1, 50.00, 6066.00, '2019-12-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (647, '123456', 1, 50.00, 87764.00, '2019-12-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (648, '123456', 1, 50.00, 34625.00, '2019-12-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (649, '123456', 1, 50.00, 92125.00, '2019-12-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (650, '123456', 1, 50.00, 11377.00, '2019-12-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (651, '123456', 1, 50.00, 33898.00, '2019-12-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (652, '123456', 1, 50.00, 63261.00, '2019-12-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (653, '123456', 1, 50.00, 87840.00, '2019-12-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (654, '123456', 1, 50.00, 40500.00, '2019-12-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (655, '123456', 1, 50.00, 79024.00, '2019-12-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (656, '123456', 1, 50.00, 52214.00, '2019-12-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (657, '123456', 1, 50.00, 95498.00, '2019-12-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (658, '123456', 1, 50.00, 21564.00, '2019-12-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (659, '123456', 1, 50.00, 47101.00, '2019-12-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (660, '123456', 1, 50.00, 4690.00, '2019-12-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (661, '123456', 1, 50.00, 20633.00, '2019-12-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (662, '123456', 1, 50.00, 49053.00, '2020-01-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (663, '123456', 1, 50.00, 71060.00, '2020-01-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (664, '123456', 1, 50.00, 31590.00, '2020-01-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (665, '123456', 1, 50.00, 7074.00, '2020-01-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (666, '123456', 1, 50.00, 21274.00, '2020-01-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (667, '123456', 1, 50.00, 16724.00, '2020-01-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (668, '123456', 1, 50.00, 88262.00, '2020-01-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (669, '123456', 1, 50.00, 14897.00, '2020-01-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (670, '123456', 1, 50.00, 32394.00, '2020-01-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (671, '123456', 1, 50.00, 30717.00, '2020-01-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (672, '123456', 1, 50.00, 44538.00, '2020-01-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (673, '123456', 1, 50.00, 80403.00, '2020-01-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (674, '123456', 1, 50.00, 3064.00, '2020-01-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (675, '123456', 1, 50.00, 48897.00, '2020-01-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (676, '123456', 1, 50.00, 97895.00, '2020-01-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (677, '123456', 1, 50.00, 69039.00, '2020-01-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (678, '123456', 1, 50.00, 30039.00, '2020-01-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (679, '123456', 1, 50.00, 30825.00, '2020-01-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (680, '123456', 1, 50.00, 4176.00, '2020-01-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (681, '123456', 1, 50.00, 51849.00, '2020-01-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (682, '123456', 1, 50.00, 29207.00, '2020-01-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (683, '123456', 1, 50.00, 51722.00, '2020-01-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (684, '123456', 1, 50.00, 71298.00, '2020-01-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (685, '123456', 1, 50.00, 88301.00, '2020-01-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (686, '123456', 1, 50.00, 58560.00, '2020-01-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (687, '123456', 1, 50.00, 58435.00, '2020-01-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (688, '123456', 1, 50.00, 70999.00, '2020-01-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (689, '123456', 1, 50.00, 25035.00, '2020-01-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (690, '123456', 1, 50.00, 36489.00, '2020-01-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (691, '123456', 1, 50.00, 9416.00, '2020-01-30 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (692, '123456', 1, 50.00, 20278.00, '2020-01-31 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (693, '123456', 1, 50.00, 24129.00, '2020-02-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (694, '123456', 1, 50.00, 49052.00, '2020-02-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (695, '123456', 1, 50.00, 60780.00, '2020-02-03 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (696, '123456', 1, 50.00, 41440.00, '2020-02-04 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (697, '123456', 1, 50.00, 98891.00, '2020-02-05 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (698, '123456', 1, 50.00, 2943.00, '2020-02-06 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (699, '123456', 1, 50.00, 49297.00, '2020-02-07 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (700, '123456', 1, 50.00, 52456.00, '2020-02-08 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (701, '123456', 1, 50.00, 61706.00, '2020-02-09 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (702, '123456', 1, 50.00, 39431.00, '2020-02-10 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (703, '123456', 1, 50.00, 15834.00, '2020-02-11 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (704, '123456', 1, 50.00, 7617.00, '2020-02-12 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (705, '123456', 1, 50.00, 98614.00, '2020-02-13 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (706, '123456', 1, 50.00, 86518.00, '2020-02-14 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (707, '123456', 1, 50.00, 6246.00, '2020-02-15 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (708, '123456', 1, 50.00, 5782.00, '2020-02-16 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (709, '123456', 1, 50.00, 18102.00, '2020-02-17 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (710, '123456', 1, 50.00, 6613.00, '2020-02-18 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (711, '123456', 1, 50.00, 10857.00, '2020-02-19 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (712, '123456', 1, 50.00, 59046.00, '2020-02-20 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (713, '123456', 1, 50.00, 35589.00, '2020-02-21 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (714, '123456', 1, 50.00, 20275.00, '2020-02-22 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (715, '123456', 1, 50.00, 30643.00, '2020-02-23 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (716, '123456', 1, 50.00, 58552.00, '2020-02-24 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (717, '123456', 1, 50.00, 6226.00, '2020-02-25 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (718, '123456', 1, 50.00, 32865.00, '2020-02-26 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (719, '123456', 1, 50.00, 64380.00, '2020-02-27 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (720, '123456', 1, 50.00, 32503.00, '2020-02-28 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (721, '123456', 1, 50.00, 79259.00, '2020-02-29 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (722, '123456', 1, 50.00, 97098.00, '2020-03-01 12:00:00.000', 42, 'middleCup#littleSweet', 1);
INSERT INTO `good_order` VALUES (723, '123456', 1, 50.00, 8633.00, '2020-03-02 12:00:00.000', 42, 'middleCup#littleSweet', 1);

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
