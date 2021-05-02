/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : seckill

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 02/05/2021 11:08:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '商品1', 20, 100);
INSERT INTO `products` VALUES (2, '商品2', 20, 100);
INSERT INTO `products` VALUES (3, '商品3', 20, 100);
INSERT INTO `products` VALUES (4, '商品4', 20, 100);
INSERT INTO `products` VALUES (5, '商品5', 20, 100);
INSERT INTO `products` VALUES (6, '商品6', 20, 100);
INSERT INTO `products` VALUES (7, '商品7', 20, 100);
INSERT INTO `products` VALUES (8, '商品8', 20, 100);
INSERT INTO `products` VALUES (9, '商品9', 20, 100);
INSERT INTO `products` VALUES (10, '商品10', 20, 100);
INSERT INTO `products` VALUES (11, '商品11', 20, 100);
INSERT INTO `products` VALUES (12, '商品12', 20, 100);
INSERT INTO `products` VALUES (13, '商品13', 20, 100);
INSERT INTO `products` VALUES (14, '商品14', 20, 100);
INSERT INTO `products` VALUES (15, '商品15', 20, 100);
INSERT INTO `products` VALUES (16, '商品16', 20, 100);
INSERT INTO `products` VALUES (17, '商品17', 20, 100);
INSERT INTO `products` VALUES (18, '商品18', 20, 100);
INSERT INTO `products` VALUES (19, '商品19', 20, 100);
INSERT INTO `products` VALUES (20, '商品20', 20, 100);
INSERT INTO `products` VALUES (21, '商品21', 20, 100);
INSERT INTO `products` VALUES (22, '商品22', 20, 100);
INSERT INTO `products` VALUES (23, '商品23', 20, 100);
INSERT INTO `products` VALUES (24, '商品24', 20, 100);
INSERT INTO `products` VALUES (25, '商品25', 20, 100);
INSERT INTO `products` VALUES (26, '商品26', 20, 100);
INSERT INTO `products` VALUES (27, '商品27', 20, 100);
INSERT INTO `products` VALUES (28, '商品28', 20, 100);
INSERT INTO `products` VALUES (29, '商品29', 20, 100);
INSERT INTO `products` VALUES (30, '商品30', 20, 100);
INSERT INTO `products` VALUES (31, '商品31', 20, 100);
INSERT INTO `products` VALUES (32, '商品32', 20, 100);
INSERT INTO `products` VALUES (33, '商品33', 20, 100);
INSERT INTO `products` VALUES (34, '商品34', 20, 100);
INSERT INTO `products` VALUES (35, '商品35', 20, 100);
INSERT INTO `products` VALUES (36, '商品36', 20, 100);
INSERT INTO `products` VALUES (37, '商品37', 20, 100);
INSERT INTO `products` VALUES (38, '商品38', 20, 100);
INSERT INTO `products` VALUES (39, '商品39', 20, 100);
INSERT INTO `products` VALUES (40, '商品40', 20, 100);
INSERT INTO `products` VALUES (41, '商品41', 20, 100);
INSERT INTO `products` VALUES (42, '商品42', 20, 100);
INSERT INTO `products` VALUES (43, '商品43', 20, 100);
INSERT INTO `products` VALUES (44, '商品44', 20, 100);
INSERT INTO `products` VALUES (45, '商品45', 20, 100);
INSERT INTO `products` VALUES (46, '商品46', 20, 100);
INSERT INTO `products` VALUES (47, '商品47', 20, 100);
INSERT INTO `products` VALUES (48, '商品48', 20, 100);
INSERT INTO `products` VALUES (49, '商品49', 20, 100);
INSERT INTO `products` VALUES (50, '商品50', 20, 100);
INSERT INTO `products` VALUES (51, '商品51', 20, 100);
INSERT INTO `products` VALUES (52, '商品52', 20, 100);
INSERT INTO `products` VALUES (53, '商品53', 20, 100);
INSERT INTO `products` VALUES (54, '商品54', 20, 100);
INSERT INTO `products` VALUES (55, '商品55', 20, 100);
INSERT INTO `products` VALUES (56, '商品56', 20, 100);
INSERT INTO `products` VALUES (57, '商品57', 20, 100);
INSERT INTO `products` VALUES (58, '商品58', 20, 100);
INSERT INTO `products` VALUES (59, '商品59', 20, 100);
INSERT INTO `products` VALUES (60, '商品60', 20, 100);
INSERT INTO `products` VALUES (61, '商品61', 20, 100);
INSERT INTO `products` VALUES (62, '商品62', 20, 100);
INSERT INTO `products` VALUES (63, '商品63', 20, 100);
INSERT INTO `products` VALUES (64, '商品64', 20, 100);
INSERT INTO `products` VALUES (65, '商品65', 20, 100);
INSERT INTO `products` VALUES (66, '商品66', 20, 100);
INSERT INTO `products` VALUES (67, '商品67', 20, 100);
INSERT INTO `products` VALUES (68, '商品68', 20, 100);
INSERT INTO `products` VALUES (69, '商品69', 20, 100);
INSERT INTO `products` VALUES (70, '商品70', 20, 100);
INSERT INTO `products` VALUES (71, '商品71', 20, 100);
INSERT INTO `products` VALUES (72, '商品72', 20, 100);
INSERT INTO `products` VALUES (73, '商品73', 20, 100);
INSERT INTO `products` VALUES (74, '商品74', 20, 100);
INSERT INTO `products` VALUES (75, '商品75', 20, 100);
INSERT INTO `products` VALUES (76, '商品76', 20, 100);
INSERT INTO `products` VALUES (77, '商品77', 20, 100);
INSERT INTO `products` VALUES (78, '商品78', 20, 100);
INSERT INTO `products` VALUES (79, '商品79', 20, 100);
INSERT INTO `products` VALUES (80, '商品80', 20, 100);
INSERT INTO `products` VALUES (81, '商品81', 20, 100);
INSERT INTO `products` VALUES (82, '商品82', 20, 100);
INSERT INTO `products` VALUES (83, '商品83', 20, 100);
INSERT INTO `products` VALUES (84, '商品84', 20, 100);
INSERT INTO `products` VALUES (85, '商品85', 20, 100);
INSERT INTO `products` VALUES (86, '商品86', 20, 100);
INSERT INTO `products` VALUES (87, '商品87', 20, 100);
INSERT INTO `products` VALUES (88, '商品88', 20, 100);
INSERT INTO `products` VALUES (89, '商品89', 20, 100);
INSERT INTO `products` VALUES (90, '商品90', 20, 100);
INSERT INTO `products` VALUES (91, '商品91', 20, 100);
INSERT INTO `products` VALUES (92, '商品92', 20, 100);
INSERT INTO `products` VALUES (93, '商品93', 20, 100);
INSERT INTO `products` VALUES (94, '商品94', 20, 100);
INSERT INTO `products` VALUES (95, '商品95', 20, 100);
INSERT INTO `products` VALUES (96, '商品96', 20, 100);
INSERT INTO `products` VALUES (97, '商品97', 20, 100);
INSERT INTO `products` VALUES (98, '商品98', 20, 100);
INSERT INTO `products` VALUES (99, '商品99', 20, 100);
INSERT INTO `products` VALUES (100, '商品100', 20, 100);


SET FOREIGN_KEY_CHECKS = 1;
