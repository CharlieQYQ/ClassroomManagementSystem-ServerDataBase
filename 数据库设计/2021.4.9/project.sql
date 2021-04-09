/*
 Navicat Premium Data Transfer

 Source Server         : Project
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : abc.charlieqyq.top:28888
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 09/04/2021 23:02:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Classroom
-- ----------------------------
DROP TABLE IF EXISTS `Classroom`;
CREATE TABLE `Classroom`  (
  `RoomNo` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室编号',
  `RoomName` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室名称',
  `Building` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教室所在教学楼',
  `Capacity` int(20) UNSIGNED NOT NULL COMMENT '教室容量',
  PRIMARY KEY (`RoomNo`, `RoomName`) USING BTREE,
  INDEX `RoomName`(`RoomName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Classroom
-- ----------------------------
INSERT INTO `Classroom` VALUES ('1', 'N101', 'N', 100);
INSERT INTO `Classroom` VALUES ('2', 'N102', 'N', 120);
INSERT INTO `Classroom` VALUES ('3', 'S101', 'S', 50);
INSERT INTO `Classroom` VALUES ('4', 'S102', 'S', 80);

-- ----------------------------
-- Table structure for Course
-- ----------------------------
DROP TABLE IF EXISTS `Course`;
CREATE TABLE `Course`  (
  `CourseID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程ID',
  `CourseName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `CourseTeacher` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程教师',
  PRIMARY KEY (`CourseID`) USING BTREE,
  INDEX `TeacherName`(`CourseTeacher`) USING BTREE,
  INDEX `CourseName`(`CourseName`) USING BTREE,
  CONSTRAINT `TeacherName` FOREIGN KEY (`CourseTeacher`) REFERENCES `Teacher` (`TeacherName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Course
-- ----------------------------
INSERT INTO `Course` VALUES ('1', 'DaXueWuLi', 'a');
INSERT INTO `Course` VALUES ('2', 'ShuXueFenXi', 'b');
INSERT INTO `Course` VALUES ('3', 'GongChengShuXue', 'c');

-- ----------------------------
-- Table structure for Course_Arrangement
-- ----------------------------
DROP TABLE IF EXISTS `Course_Arrangement`;
CREATE TABLE `Course_Arrangement`  (
  `CourseName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `RoomName` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室名',
  `Weeks` set('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '周次',
  `Weekdays` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '星期',
  `Times` set('1','2','3','4','5','6','7','8','9','10','11','12','13','14') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '节次',
  PRIMARY KEY (`CourseName`, `RoomName`, `Weeks`, `Weekdays`) USING BTREE,
  INDEX `RoomName`(`RoomName`) USING BTREE,
  CONSTRAINT `CourseName` FOREIGN KEY (`CourseName`) REFERENCES `Course` (`CourseName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `RoomName` FOREIGN KEY (`RoomName`) REFERENCES `Classroom` (`RoomName`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Course_Arrangement
-- ----------------------------
INSERT INTO `Course_Arrangement` VALUES ('DaXueWuLi', 'N101', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '1', '1,2,13,14');
INSERT INTO `Course_Arrangement` VALUES ('DaXueWuLi', 'N102', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '1', '3,4,11,12');
INSERT INTO `Course_Arrangement` VALUES ('GongChengShuXue', 'S102', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '1', '1,2,6,7');
INSERT INTO `Course_Arrangement` VALUES ('ShuXueFenXi', 'N102', '1', '1', '3,4,11,12');
INSERT INTO `Course_Arrangement` VALUES ('ShuXueFenXi', 'S101', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16', '1', '6,7,8');

-- ----------------------------
-- Table structure for Room_Application
-- ----------------------------
DROP TABLE IF EXISTS `Room_Application`;
CREATE TABLE `Room_Application`  (
  `No` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ApplicationTime` datetime NOT NULL COMMENT '申请时间',
  `RoomName` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教室名称',
  `ApplicantID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号/教师工号',
  `Weeks` set('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '周次',
  `Weekdays` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '星期',
  `Times` set('1','2','3','4','5','6','7','8','9','10','11','12','13','14') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节次',
  `AppliedReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请理由',
  `AppliedTeacherID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请的教师工号',
  `ApplicationStatus` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请状态',
  PRIMARY KEY (`No`) USING BTREE,
  INDEX `Student_ID`(`ApplicantID`) USING BTREE,
  INDEX `Room`(`RoomName`) USING BTREE,
  INDEX `Teacher`(`AppliedTeacherID`) USING BTREE,
  CONSTRAINT `Room` FOREIGN KEY (`RoomName`) REFERENCES `Classroom` (`RoomName`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Teacher` FOREIGN KEY (`AppliedTeacherID`) REFERENCES `Teacher` (`TeacherID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Room_Application
-- ----------------------------
INSERT INTO `Room_Application` VALUES (1, '2021-04-08 13:15:57', 'N101', '2019210470', '1', '1', '4,5', 'Meeting', '2019210472', 'PASS');
INSERT INTO `Room_Application` VALUES (2, '2021-04-07 13:16:36', 'N102', '2019210471', '1', '1', '1,2,7', 'Club', '2019210473', 'FAIL');
INSERT INTO `Room_Application` VALUES (3, '2021-04-06 13:17:25', 'S101', '2019210470', '1', '1', '1,2,3,4,5', 'Study', '2019210474', 'WAIT');

-- ----------------------------
-- Table structure for Student
-- ----------------------------
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student`  (
  `StudentID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生学号',
  `StudentName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `StudentPassword` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生密码',
  PRIMARY KEY (`StudentID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Student
-- ----------------------------
INSERT INTO `Student` VALUES ('2019210470', 'LiLei', '123456');
INSERT INTO `Student` VALUES ('2019210471', 'ZhangMeiMei', '234567');

-- ----------------------------
-- Table structure for Teacher
-- ----------------------------
DROP TABLE IF EXISTS `Teacher`;
CREATE TABLE `Teacher`  (
  `TeacherID` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号',
  `TeacherName` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `TeacherPassword` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师密码',
  PRIMARY KEY (`TeacherID`) USING BTREE,
  INDEX `TeacherName`(`TeacherName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Teacher
-- ----------------------------
INSERT INTO `Teacher` VALUES ('2019210472', 'a', '123456');
INSERT INTO `Teacher` VALUES ('2019210473', 'b', '234567');
INSERT INTO `Teacher` VALUES ('2019210474', 'c', '345678');

SET FOREIGN_KEY_CHECKS = 1;
