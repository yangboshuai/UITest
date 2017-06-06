/*
Navicat MySQL Data Transfer

Source Server         : 192.168.169.21
Source Server Version : 50717
Source Host           : 192.168.169.21:3306
Source Database       : mohc

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-06 14:27:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `typeValue` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `userId` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES ('10', 'password_input', 'id', 'password', '登录页-密码输入框', '1');
INSERT INTO `element` VALUES ('11', 'login_button', 'id', 'login_submit', '登录页-登录按钮', '1');
INSERT INTO `element` VALUES ('12', 'close_button', 'xpath', '//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\']', '首页弹出框关闭按钮', '1');
INSERT INTO `element` VALUES ('16', 'GF_MENU', 'partialLinkText', 'Guardian Fund', 'GuardingFund主目录链接', '1');
INSERT INTO `element` VALUES ('17', 'Deposit_Application_menu', 'partialLinkText', 'Deposit Application', null, '1');
INSERT INTO `element` VALUES ('18', 'newButton', 'id', 'btnAdd', null, '1');
INSERT INTO `element` VALUES ('19', 'depositor_textField', 'id', 'DEPOSITOR', null, '1');
INSERT INTO `element` VALUES ('20', 'CASE_NO', 'id', 'CASE_NO', null, '1');
INSERT INTO `element` VALUES ('21', 'DEPOSIT_LETTER', 'id', 'DEPOSIT_LETTER', null, '1');
INSERT INTO `element` VALUES ('22', 'LETTER_DATE', 'id', 'LETTER_DATE', null, '2');
INSERT INTO `element` VALUES ('23', 'DepositTypeselect', 'id', 'DEPOSIT_TYPE', null, '1');
INSERT INTO `element` VALUES ('24', 'AMOUNT_TEXTField', 'id', 'AMOUNT', null, '1');
INSERT INTO `element` VALUES ('25', 'SaveButton', 'id', 'btnAllSave', null, '1');
INSERT INTO `element` VALUES ('26', 'username_input', 'id', 'username', null, '1');

-- ----------------------------
-- Table structure for keyword
-- ----------------------------
DROP TABLE IF EXISTS `keyword`;
CREATE TABLE `keyword` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `element` varchar(100) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `hasparm` tinyint(1) NOT NULL COMMENT '1:true,0:false',
  `description` varchar(255) DEFAULT NULL,
  `userId` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of keyword
-- ----------------------------
INSERT INTO `keyword` VALUES ('1', 'inputUsername', 'username_input', 'sendkeys', '1', '输入用户名', '1');
INSERT INTO `keyword` VALUES ('2', 'inputPassword', 'password_input', 'sendkeys', '1', '输入密码', '1');
INSERT INTO `keyword` VALUES ('3', 'clickLogin', 'login_button', 'click', '0', '点击登录按钮', '1');
INSERT INTO `keyword` VALUES ('4', 'clickClose', 'close_button', 'click', '0', null, '1');
INSERT INTO `keyword` VALUES ('6', 'open', '', '', '1', null, '0');
INSERT INTO `keyword` VALUES ('7', 'clickGFMenu', 'GF_MENU', 'click', '0', null, '1');
INSERT INTO `keyword` VALUES ('8', 'clickDepositApplicationMenu', 'Deposit_Application_menu', 'click', '0', null, '1');
INSERT INTO `keyword` VALUES ('9', 'clickNewButton', 'newButton', 'click', '0', null, '1');
INSERT INTO `keyword` VALUES ('10', 'wait', '', '', '1', null, '0');
INSERT INTO `keyword` VALUES ('11', 'switchToFrame', '', '', '1', null, '0');
INSERT INTO `keyword` VALUES ('12', 'inputCaseNo', 'CASE_NO', 'sendkeys', '1', null, '1');
INSERT INTO `keyword` VALUES ('13', 'inputDepositorLetter', 'DEPOSIT_LETTER', 'sendkeys', '1', null, '1');
INSERT INTO `keyword` VALUES ('15', 'inputDepositor', 'depositor_textField', 'sendkeys', '1', null, '1');
INSERT INTO `keyword` VALUES ('16', 'inputDateOfDepositLetter', 'LETTER_DATE', 'sendkeys', '1', null, '1');
INSERT INTO `keyword` VALUES ('18', 'selectDepositType', 'DepositTypeselect', 'select', '1', null, '1');
INSERT INTO `keyword` VALUES ('19', 'inputAmount', 'AMOUNT_TEXTField', 'sendkeys', '1', null, '1');
INSERT INTO `keyword` VALUES ('20', 'clickSave', 'SaveButton', 'click', '0', null, '0');
INSERT INTO `keyword` VALUES ('23', 'maximize', ' ', '', '0', '', '0');
INSERT INTO `keyword` VALUES ('24', 'executeJavaScript', '', '', '1', '', '0');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'MOHC');
INSERT INTO `project` VALUES ('3', 'ITAS');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `startTime` varchar(255) NOT NULL,
  `totalCount` int(255) NOT NULL,
  `failedCount` int(255) NOT NULL,
  `errorCasesStr` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('82', '2017-06-05 17:12:46', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('83', '2017-06-05 17:35:41', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('84', '2017-06-05 17:38:18', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('85', '2017-06-05 17:46:46', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('86', '2017-06-05 17:50:18', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('87', '2017-06-05 17:53:10', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('88', '2017-06-05 17:58:14', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('89', '2017-06-05 18:00:52', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('90', '2017-06-05 18:05:17', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('91', '2017-06-05 18:06:07', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('92', '2017-06-06 09:45:36', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('93', '2017-06-06 09:48:55', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('94', '2017-06-06 09:49:19', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('95', '2017-06-06 10:23:22', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('96', '2017-06-06 10:27:45', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('97', '2017-06-06 10:31:00', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('98', '2017-06-06 10:34:06', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('99', '2017-06-06 10:35:35', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('100', '2017-06-06 10:37:50', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('101', '2017-06-06 10:38:20', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('102', '2017-06-06 10:41:10', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('103', '2017-06-06 10:54:49', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('104', '2017-06-06 10:59:29', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('105', '2017-06-06 11:02:35', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('106', '2017-06-06 11:06:56', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('107', '2017-06-06 11:08:09', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('108', '2017-06-06 11:16:54', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('109', '2017-06-06 11:18:08', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('110', '2017-06-06 11:20:09', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('111', '2017-06-06 12:44:03', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('112', '2017-06-06 12:45:53', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('113', '2017-06-06 12:46:55', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('114', '2017-06-06 12:49:17', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('115', '2017-06-06 13:46:23', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');

-- ----------------------------
-- Table structure for step
-- ----------------------------
DROP TABLE IF EXISTS `step`;
CREATE TABLE `step` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stepNo` int(10) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `caseNo` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of step
-- ----------------------------
INSERT INTO `step` VALUES ('7', '1', 'open', 'http://192.168.169.173:8080/login', '17');
INSERT INTO `step` VALUES ('8', '2', 'inputUsername', 'gfybs', '17');
INSERT INTO `step` VALUES ('13', '3', 'inputPassword', '1234a*', '17');
INSERT INTO `step` VALUES ('14', '4', 'clickLogin', '', '17');
INSERT INTO `step` VALUES ('15', '7', 'clickClose', '', '17');
INSERT INTO `step` VALUES ('16', '8', 'clickGFMenu', '', '17');
INSERT INTO `step` VALUES ('17', '9', 'clickDepositApplicationMenu', '', '17');
INSERT INTO `step` VALUES ('18', '10', 'switchToFrame', 'mainFrame', '17');
INSERT INTO `step` VALUES ('19', '11', 'clickNewButton', '', '17');
INSERT INTO `step` VALUES ('20', '12', 'wait', '5', '17');
INSERT INTO `step` VALUES ('21', '14', 'inputCaseNo', '123', '17');
INSERT INTO `step` VALUES ('22', '15', 'inputDepositor', 'abcd', '17');
INSERT INTO `step` VALUES ('23', '16', 'inputDepositorLetter', 'aaaa', '17');
INSERT INTO `step` VALUES ('24', '17', 'inputDateOfDepositLetter', '14', '17');
INSERT INTO `step` VALUES ('25', '13', 'switchToFrame', '_ax_frm_frame_', '17');
INSERT INTO `step` VALUES ('26', '21', 'wait', '5', '17');
INSERT INTO `step` VALUES ('27', '18', 'inputDateOfDepositLetter', '05', '17');
INSERT INTO `step` VALUES ('28', '19', 'inputDateOfDepositLetter', '2017', '17');
INSERT INTO `step` VALUES ('29', '20', 'selectDepositType', 'EFT', '17');
INSERT INTO `step` VALUES ('30', '22', 'inputAmount', '1000', '17');
INSERT INTO `step` VALUES ('31', '23', 'clickSave', '', '17');
INSERT INTO `step` VALUES ('37', '2', 'inputUsername', 'jr.a3', '20');
INSERT INTO `step` VALUES ('38', '3', 'inputPassword', 'aaa', '20');
INSERT INTO `step` VALUES ('39', '4', 'clickLogin', '', '20');
INSERT INTO `step` VALUES ('40', '5', 'clickClose', '', '20');
INSERT INTO `step` VALUES ('41', '1', 'open', 'http://192.168.169.173:8080/login', '20');
INSERT INTO `step` VALUES ('94', '6', 'wait', '1', '17');
INSERT INTO `step` VALUES ('95', '5', 'maximize', '', '17');

-- ----------------------------
-- Table structure for testcase
-- ----------------------------
DROP TABLE IF EXISTS `testcase`;
CREATE TABLE `testcase` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `stepCount` int(10) DEFAULT '0',
  `userId` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testcase
-- ----------------------------
INSERT INTO `testcase` VALUES ('17', 'login', '23', '1');
INSERT INTO `testcase` VALUES ('20', 'createGF', '5', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'abc', 'abc');
INSERT INTO `users` VALUES ('2', 'yangboshuai', 'yangboshuai');

-- ----------------------------
-- Procedure structure for exchangeStep
-- ----------------------------
DROP PROCEDURE IF EXISTS `exchangeStep`;
DELIMITER ;;
CREATE DEFINER=`mohc`@`%` PROCEDURE `exchangeStep`(stepIdone int,
   stepIdtwo int)
begin

	set @stepNo1=(select stepNo from step where id=stepIdone);
	set @stepNo2=(select stepNo from step where id=stepIdtwo);

  update step 
	set stepNo=@stepNo1
	where id=stepIdtwo;

  update step 
	set stepNo=@stepNo2
	where id=stepIdone;
end
;;
DELIMITER ;
