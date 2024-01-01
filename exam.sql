/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : exam

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 29/12/2023 11:01:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `BNO` int NOT NULL,
  `BNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRICE` decimal(10, 2) NULL DEFAULT NULL,
  `PUBLISHER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`BNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (9781111, '数据库原理与应用', '张三', 32.00, '清华大学出版社');
INSERT INTO `book` VALUES (9781234, '计算机网络', '赵六', 34.00, '电子工业出版社');
INSERT INTO `book` VALUES (9783456, 'Javaweb开发', '李四', 67.00, '清华大学出版社');
INSERT INTO `book` VALUES (9787878, '操作系统', '王五', 28.00, '机械工业出版社');
INSERT INTO `book` VALUES (9787979, 'C语言程序设计', '苏小红', 49.00, '高等教育出版社');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courseno` int NOT NULL,
  `coursename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classhours` int NULL DEFAULT NULL,
  `tname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `precourse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`courseno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1001, 'Javaweb开发', 72, '李磊', 'Java程序设计');
INSERT INTO `course` VALUES (1002, '数据结构', 72, '王爱萍', 'C语言程序设计');
INSERT INTO `course` VALUES (1003, '数据库系统概论', 108, '高敏', '数据结构');
INSERT INTO `course` VALUES (1101, '计算机网路', 72, '张伟', '计算机基础');
INSERT INTO `course` VALUES (1102, '操作系统', 72, '王红', '组成原理');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CNO` int NOT NULL,
  `CNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SEX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AGE` int NULL DEFAULT NULL,
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (111, '张三', '男', 30, '洛阳市洛龙区');
INSERT INTO `customer` VALUES (112, '李思', '女', 29, '郑州市金水区');
INSERT INTO `customer` VALUES (113, '王五', '男', 29, '洛阳市涧西区');
INSERT INTO `customer` VALUES (114, '赵六', '女', 28, '郑州市惠济区');
INSERT INTO `customer` VALUES (120, '李伟', '男', 27, '洛阳市西工区');

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part`  (
  `PNO` int NOT NULL,
  `PNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BRAND` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MODEL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRICE` float NULL DEFAULT NULL,
  PRIMARY KEY (`PNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES (1, '鼠标', '罗技', 'M585', 89);
INSERT INTO `part` VALUES (2, '键盘', '联想', 'M123', 129);
INSERT INTO `part` VALUES (3, 'U盘', '纽顿', '32G', 56);
INSERT INTO `part` VALUES (4, '移动硬盘', '三星', '2T', 799);
INSERT INTO `part` VALUES (5, '显卡', '华硕', '4090', 2599);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `TNO` int NOT NULL,
  `TNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PHONE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COURSE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (2111, '李建国', '13213245678', '网络工程系', '操作系统');
INSERT INTO `teacher` VALUES (2345, '刘世元', '13737798765', '软件工程系', '软件设计');
INSERT INTO `teacher` VALUES (2346, '高敏', '17537912345', '软件工程系', '数据结构');
INSERT INTO `teacher` VALUES (2487, '王淑芬', '15538865673', '计算机科学系', '数据库系统');
INSERT INTO `teacher` VALUES (2873, '张伟', '15837921234', '物联网工程系', '高级语言程序设计');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `ID` int NOT NULL,
  `ACCOUNT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin');
INSERT INTO `user` VALUES (2, '123', '123');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `WNO` int NOT NULL,
  `WNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SQUARE` double NULL DEFAULT NULL,
  `MANAGER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`WNO`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (201903, '配件库', 'A区8号', 156, '张三');
INSERT INTO `warehouse` VALUES (201904, '主机库', 'B区2号', 234, '李四');
INSERT INTO `warehouse` VALUES (201905, '打印机库', 'A区7号', 211, '王五');
INSERT INTO `warehouse` VALUES (201906, '显示器库', 'B区1号', 187, '李四');
INSERT INTO `warehouse` VALUES (201907, '杂项库', 'A区1号', 20, '王五');

SET FOREIGN_KEY_CHECKS = 1;
