/*
Navicat MySQL Data Transfer

Source Server         : 192.168.169.21
Source Server Version : 50717
Source Host           : 192.168.169.21:3306
Source Database       : mohc

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-06-13 11:17:24
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
INSERT INTO `keyword` VALUES ('1', 'inputUsername', 'username_input', 'sendkeys', '1', '输入用户名', '2');
INSERT INTO `keyword` VALUES ('2', 'inputPassword', 'password_input', 'sendkeys', '1', '输入密码', '2');
INSERT INTO `keyword` VALUES ('3', 'clickLogin', 'login_button', 'click', '0', '点击登录按钮', '2');
INSERT INTO `keyword` VALUES ('4', 'clickClose', 'close_button', 'click', '0', null, '2');
INSERT INTO `keyword` VALUES ('6', 'open', '', '', '1', '打开指定网页', '1');
INSERT INTO `keyword` VALUES ('7', 'clickGFMenu', 'GF_MENU', 'click', '0', null, '2');
INSERT INTO `keyword` VALUES ('8', 'clickDepositApplicationMenu', 'Deposit_Application_menu', 'click', '0', null, '2');
INSERT INTO `keyword` VALUES ('9', 'clickNewButton', 'newButton', 'click', '0', null, '2');
INSERT INTO `keyword` VALUES ('10', 'wait', '', '', '1', '等待几秒', '1');
INSERT INTO `keyword` VALUES ('11', 'switchToFrame', '', '', '1', '切换到指定frame', '1');
INSERT INTO `keyword` VALUES ('12', 'inputCaseNo', 'CASE_NO', 'sendkeys', '1', null, '2');
INSERT INTO `keyword` VALUES ('13', 'inputDepositorLetter', 'DEPOSIT_LETTER', 'sendkeys', '1', null, '2');
INSERT INTO `keyword` VALUES ('15', 'inputDepositor', 'depositor_textField', 'sendkeys', '1', null, '2');
INSERT INTO `keyword` VALUES ('16', 'inputDateOfDepositLetter', 'LETTER_DATE', 'sendkeys', '1', null, '2');
INSERT INTO `keyword` VALUES ('18', 'selectDepositType', 'DepositTypeselect', 'select', '1', null, '2');
INSERT INTO `keyword` VALUES ('19', 'inputAmount', 'AMOUNT_TEXTField', 'sendkeys', '1', null, '2');
INSERT INTO `keyword` VALUES ('20', 'clickSave', 'SaveButton', 'click', '0', null, '2');
INSERT INTO `keyword` VALUES ('23', 'maximize', ' ', '', '0', '最大化浏览器', '1');
INSERT INTO `keyword` VALUES ('24', 'executeJavaScript', '', '', '1', '执行指定JavaScript', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

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
INSERT INTO `result` VALUES ('116', '2017-06-06 14:45:25', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('117', '2017-06-06 14:47:34', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('118', '2017-06-07 18:06:09', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('119', '2017-06-08 10:15:40', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('120', '2017-06-08 10:20:34', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('121', '2017-06-08 10:24:03', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('122', '2017-06-08 10:31:05', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('123', '2017-06-08 12:16:23', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('124', '2017-06-08 12:19:09', '1', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('125', '2017-06-08 12:20:25', '1', '3', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('126', '2017-06-08 12:20:58', '1', '4', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('127', '2017-06-08 14:00:25', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('128', '2017-06-08 14:01:43', '1', '2', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('129', '2017-06-08 14:02:49', '1', '3', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('130', '2017-06-08 14:03:42', '1', '4', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('131', '2017-06-08 14:08:22', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('132', '2017-06-08 14:21:55', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('133', '2017-06-08 14:26:42', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('134', '2017-06-08 14:28:17', '1', '2', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('135', '2017-06-08 14:30:28', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('136', '2017-06-08 14:33:02', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('137', '2017-06-08 15:25:20', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('138', '2017-06-08 15:28:19', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('139', '2017-06-08 16:05:26', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('140', '2017-06-08 16:19:44', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('141', '2017-06-08 16:29:18', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('142', '2017-06-08 16:50:31', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('143', '2017-06-08 16:51:34', '1', '1', '{\"17\":{\"4\":\"cannot find element:Element [id=11, name=login_button, type=id, typeValue=login_submit, description=登录页-登录按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('144', '2017-06-08 16:57:52', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('145', '2017-06-08 16:58:56', '1', '1', '{\"20\":{\"4\":\"cannot find element:Element [id=11, name=login_button, type=id, typeValue=login_submit, description=登录页-登录按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('146', '2017-06-08 17:00:21', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('147', '2017-06-08 17:01:11', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('148', '2017-06-08 17:01:08', '1', '1', '{\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('149', '2017-06-08 17:01:41', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('150', '2017-06-08 17:06:37', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('151', '2017-06-08 17:10:51', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('152', '2017-06-08 17:11:14', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('153', '2017-06-08 17:12:55', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('154', '2017-06-08 17:13:16', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('155', '2017-06-08 17:17:23', '1', '1', '{\"17\":{\"8\":\"cannot find element:Element [id=16, name=GF_MENU, type=partialLinkText, typeValue=Guardian Fund, description=GuardingFund主目录链接, userId=1]\"}}');
INSERT INTO `result` VALUES ('156', '2017-06-08 17:28:13', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('157', '2017-06-08 17:32:13', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('158', '2017-06-08 17:34:47', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('159', '2017-06-08 17:41:52', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('160', '2017-06-08 17:51:07', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('161', '2017-06-08 17:56:40', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('162', '2017-06-08 18:00:35', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('163', '2017-06-08 18:06:00', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('164', '2017-06-08 18:06:45', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('165', '2017-06-08 18:07:36', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('166', '2017-06-08 18:08:06', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('167', '2017-06-08 18:08:31', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('168', '2017-06-08 18:09:36', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('169', '2017-06-08 18:11:09', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('170', '2017-06-09 09:30:40', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('171', '2017-06-09 09:33:22', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('172', '2017-06-09 09:38:08', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('173', '2017-06-09 09:39:30', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('174', '2017-06-09 09:41:53', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('175', '2017-06-09 10:04:12', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('176', '2017-06-09 10:04:58', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('177', '2017-06-09 10:05:33', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('178', '2017-06-09 10:08:27', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('179', '2017-06-09 10:08:28', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('180', '2017-06-09 10:09:24', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('181', '2017-06-09 10:09:26', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('182', '2017-06-09 10:26:02', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('183', '2017-06-09 10:25:59', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('184', '2017-06-09 10:26:48', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('185', '2017-06-09 10:26:46', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"7\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('186', '2017-06-09 10:28:53', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('187', '2017-06-12 18:05:25', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('188', '2017-06-13 10:08:28', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('189', '2017-06-13 10:12:30', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('190', '2017-06-13 10:16:47', '1', '1', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"}}');
INSERT INTO `result` VALUES ('191', '2017-06-13 10:18:54', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('192', '2017-06-13 10:19:55', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('193', '2017-06-13 10:20:29', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('194', '2017-06-13 10:20:30', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('195', '2017-06-13 10:22:30', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('196', '2017-06-13 10:22:28', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('197', '2017-06-13 10:23:13', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('198', '2017-06-13 10:32:39', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('199', '2017-06-13 10:33:20', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('200', '2017-06-13 10:35:30', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('201', '2017-06-13 10:36:29', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('202', '2017-06-13 10:36:33', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('203', '2017-06-13 10:37:47', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('204', '2017-06-13 10:38:50', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('205', '2017-06-13 10:39:13', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('206', '2017-06-13 10:39:57', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('207', '2017-06-13 10:47:51', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('208', '2017-06-13 10:47:52', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('209', '2017-06-13 11:07:25', '3', '3', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('210', '2017-06-13 11:07:28', '2', '2', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('211', '2017-06-13 11:08:21', '2', '2', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('212', '2017-06-13 11:13:11', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('213', '2017-06-13 11:13:52', '1', '1', '{\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('214', '2017-06-13 11:14:33', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('215', '2017-06-13 11:14:34', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('216', '2017-06-13 11:15:53', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');
INSERT INTO `result` VALUES ('217', '2017-06-13 11:16:02', '2', '2', '{\"20\":{\"5\":\"cannot find element:Element [id=12, name=close_button, type=xpath, typeValue=//div[@class=\'modal hide\']/div[@class=\'modal-footer\']/button[@class=\'btn ax-close\'], description=首页弹出框关闭按钮, userId=1]\"},\"17\":{\"8\":\"cannot complete the keyword:Keyword [id=7, name=clickGFMenu, element=GF_MENU, action=click, hasparm=false, description=null, userId=2]\"}}');

-- ----------------------------
-- Table structure for runsetting
-- ----------------------------
DROP TABLE IF EXISTS `runsetting`;
CREATE TABLE `runsetting` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `userId` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of runsetting
-- ----------------------------
INSERT INTO `runsetting` VALUES ('1', '服务器本地节点', '127.0.0.1', '4444', 'Chrome', 'C:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe', '1');
INSERT INTO `runsetting` VALUES ('3', '子节点', '192.168.169.21', '5555', 'Chrome', 'C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe', '1');

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
INSERT INTO `users` VALUES ('1', 'admin', 'admin');
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
