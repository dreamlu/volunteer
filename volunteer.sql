/*
Navicat MySQL Data Transfer

Source Server         : volunteer
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : volunteer

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2017-04-23 12:49:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(50) NOT NULL,
  `user_realname` varchar(50) default NULL,
  `password` varchar(50) NOT NULL,
  `user_love` int(11) unsigned zerofill NOT NULL,
  `user_identify` varchar(50) default NULL,
  `user_phone` varchar(50) default NULL,
  `user_college` varchar(50) default NULL,
  `user_college_sdept` varchar(50) default NULL,
  `user_classroom` varchar(50) default NULL,
  `user_introduce` varchar(255) default NULL,
  `user_picture` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10023 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('10002', 'lu', '鹿成', '123456', '00000000055', '340122199610141717', '15869190407', '新媒体学院', '', '15信管2班', '我就是我', 'uploada92060c8-dc34-44b1-9560-81c07e67474e.jpg');
INSERT INTO `client` VALUES ('10007', 'cheng', '成', '1234', '00000000000', '340122199710151618', '18069868082', '新媒体学院', null, '14网工2班', '咦，咦！', 'uploadd4815d95-507b-4a3b-92ea-8ad4d3a5cc46.gif');
INSERT INTO `client` VALUES ('10008', 'lc', '鹿成', '123456', '00000000000', '', '', '', null, '', '', 'upload201f5cfa-b805-4224-8ea9-0b6bfe4d5e71.jpg');
INSERT INTO `client` VALUES ('10013', 'b', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10014', 'c', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10015', 'e', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10016', 'm', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10017', 'root', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10019', '12', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10020', 'ch', null, '1', '00000000000', null, null, '浙江大学', null, null, null, null);
INSERT INTO `client` VALUES ('10021', 'white', 'ly', '123', '00000000000', '678-987-678', 'dsfs', 'xnm', '播音学院', 'fdsaf', 'sdfs', null);
INSERT INTO `client` VALUES ('10022', 'haha', null, '11', '00000000000', null, null, '浙江大学', null, null, null, null);

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `user_name` varchar(50) NOT NULL,
  `volunteer_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`user_name`,`volunteer_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('ch', 'hahahaha2');
INSERT INTO `collection` VALUES ('lc', '帮助老人');
INSERT INTO `collection` VALUES ('lc', '敬老院陪伴计划');
INSERT INTO `collection` VALUES ('lu', 'hahahaha');
INSERT INTO `collection` VALUES ('lu', '圆梦小组关爱白血病儿童');
INSERT INTO `collection` VALUES ('lu', '帮助儿童');
INSERT INTO `collection` VALUES ('lu', '敬老院陪伴计划');
INSERT INTO `collection` VALUES ('lu', '童心墙绘活动');
INSERT INTO `collection` VALUES ('white', 'hahahaha2');

-- ----------------------------
-- Table structure for collection_project
-- ----------------------------
DROP TABLE IF EXISTS `collection_project`;
CREATE TABLE `collection_project` (
  `user_name` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`user_name`,`project_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection_project
-- ----------------------------
INSERT INTO `collection_project` VALUES ('lu', 'dsadsf');
INSERT INTO `collection_project` VALUES ('lu', 'v');
INSERT INTO `collection_project` VALUES ('lu', '”美丽中国“乡村支教计划');
INSERT INTO `collection_project` VALUES ('lu', '移动三角架志愿服务队');

-- ----------------------------
-- Table structure for entry_form
-- ----------------------------
DROP TABLE IF EXISTS `entry_form`;
CREATE TABLE `entry_form` (
  `root_name` varchar(50) NOT NULL,
  `volunteer_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL default '0',
  `user_select_time` varchar(50) default NULL,
  `user_isselect` varchar(2) default NULL,
  PRIMARY KEY  (`volunteer_name`,`root_name`,`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of entry_form
-- ----------------------------
INSERT INTO `entry_form` VALUES ('admin', '圆梦小组关爱白血病儿童', 'lu', null, '是');
INSERT INTO `entry_form` VALUES ('admin', '敬老院陪伴计划', 'cheng', '默认时间', '是');
INSERT INTO `entry_form` VALUES ('admin', '敬老院陪伴计划', 'lu', null, '是');
INSERT INTO `entry_form` VALUES ('admin', '社区栏杆改造计划', 'lu', null, null);
INSERT INTO `entry_form` VALUES ('admin', '童心墙绘活动', 'cheng', null, '是');
INSERT INTO `entry_form` VALUES ('root', '给老人表演节目', 'cheng', null, null);
INSERT INTO `entry_form` VALUES ('admin', '帮助老人', 'lc', null, null);
INSERT INTO `entry_form` VALUES ('admin', '敬老院陪伴计划', 'lc', null, '');
INSERT INTO `entry_form` VALUES ('admin', 'hahahaha2', 'white', '8:00-12:00', null);
INSERT INTO `entry_form` VALUES ('admin', 'hahahaha', 'ch', 'he', null);
INSERT INTO `entry_form` VALUES ('admin', '梦里个梦', 'lu', 'xxx', null);
INSERT INTO `entry_form` VALUES ('admin', 'hahahaha_2', 'lu', '2017.4.10', null);

-- ----------------------------
-- Table structure for publishandsum
-- ----------------------------
DROP TABLE IF EXISTS `publishandsum`;
CREATE TABLE `publishandsum` (
  `volunteer_name` varchar(50) NOT NULL,
  `vo_title` varchar(50) default NULL,
  `vo_flag` tinyint(4) NOT NULL,
  `vo_content` varchar(255) default NULL,
  `vo_picture_path` varchar(255) default NULL,
  PRIMARY KEY  (`volunteer_name`,`vo_flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publishandsum
-- ----------------------------
INSERT INTO `publishandsum` VALUES ('好好看看很好看', '萌萌哒', '0', '呵呵哒', 'upload2367f432-58dc-440f-ba7c-fd4294a3e665.jpg');
INSERT INTO `publishandsum` VALUES ('敬老院陪伴计划', 'hesdaf', '0', 'sadfadf', 'upload4495aa8b-5f9d-4f0f-9773-27bb8c794dbd.jpg');
INSERT INTO `publishandsum` VALUES ('敬老院陪伴计划', 'sdfasd', '1', 'asdfasddadgadgfdgfd', 'upload86cd5a02-2b37-4d4b-99d3-8e35f74e5fc9.jpg');
INSERT INTO `publishandsum` VALUES ('好好看看很好看', '好好看的猫啊', '1', '好阿富汗打开', 'uploade580d81e-c335-4c67-b1a4-593ed5df8732.jpg');

-- ----------------------------
-- Table structure for publishproject
-- ----------------------------
DROP TABLE IF EXISTS `publishproject`;
CREATE TABLE `publishproject` (
  `project_name` varchar(50) NOT NULL,
  `project_organization` varchar(50) default NULL,
  `project_contact` varchar(50) default NULL,
  `project_classify` varchar(50) default NULL,
  `project_picture_path` varchar(255) default NULL,
  `project_logo_path` varchar(255) default NULL,
  `project_introduce` varchar(1000) default NULL,
  PRIMARY KEY  (`project_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publishproject
-- ----------------------------
INSERT INTO `publishproject` VALUES ('圆梦小组——热血救天使', 'xx学校xx学院', 'xx', '关爱白血病儿童、组织献血', 'uploadde93c5c9-af05-4f4f-b848-30ee5e230462.png', 'uploadd4fb8362-ab4a-4eaa-8933-c1239fa4506d.jpg', '“圆梦小组——热血救天使”服务队是xx学院首批专业志愿服务队，自2010年成立初就与浙江省血液中心开展合作，承办一年4次血液车进校园、在杭高校无偿献血启动仪式，普及无偿献血相关知识，发动在校师生加入无偿献血行列。截止2015年11月，共组织血液车进校园13次，累计组织献血1033人次，献血量近500000ml。\r\n\r\n      此外，“圆梦小组”长期开展关爱白血病儿童系列活动，我们在杭州各大地铁站、吴山广场等人群密集处发放宣传单页、制作白血病儿童展板、拍摄宣传视频、前往省儿保医院看望慰问白血病儿童并为他们举办慈善晚会，2013年我们还受邀前往浙江省人民大会堂参加“成分血、救天使”活动，制作的展板引得很多市民驻足观看。目前，“圆梦小组”的活动已经被新华社、人民网、《青年时报》、《钱江晚报》、网易等数十家主流媒体报道。');
INSERT INTO `publishproject` VALUES ('移动三角架志愿服务队', 'xx学校xx学院', 'xxx', 'xxxxxxx', 'upload39fb9bdb-9e95-48fa-be1e-5795d910165a.jpg', 'uploadd4fb8362-ab4a-4eaa-8933-c1239fa4506d.jpg', 'xxxx');
INSERT INTO `publishproject` VALUES ('”美丽中国“乡村支教计划', '美丽中国', 'wly', '指教', 'upload16fc06a8-a3ad-4b13-8a3c-911619b6da22.jpg', 'uploadd4fb8362-ab4a-4eaa-8933-c1239fa4506d.jpg', '支教');
INSERT INTO `publishproject` VALUES ('s', 's', 's', 's', 'upload83e56287-36c2-4068-8e6f-a378fe8dea18.jpg', 'upload13b04a23-182b-4258-b66d-8e9a59c507b2.jpg', 's');
INSERT INTO `publishproject` VALUES ('d', 'd', 'dd', 'd', 'upload9020b505-9668-41c0-ae45-7d69bf7ed8ca.jpg', 'upload7f24a18d-ad10-4998-ad3a-e6344b2dba66.jpg', 'd');
INSERT INTO `publishproject` VALUES ('dsadsf', 'as', 'asd', 'sadf', 'uploadc4bda11f-0d92-4157-be1d-0a5fc88dd052.jpg', 'upload5fb13294-3ca2-4d76-ba44-bf09c20910c4.jpg', 'fd');
INSERT INTO `publishproject` VALUES ('v', 'v', 'vv', 'v', 'upload267b96af-2617-40f8-8d3c-37fe68961034.jpg', 'upload3ff68c1a-ad31-41f2-a945-c30b78f750b4.jpg', 'v');

-- ----------------------------
-- Table structure for root_info
-- ----------------------------
DROP TABLE IF EXISTS `root_info`;
CREATE TABLE `root_info` (
  `root_id` int(11) NOT NULL auto_increment,
  `root_name` varchar(50) default NULL,
  `root_password` varchar(50) default NULL,
  PRIMARY KEY  (`root_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of root_info
-- ----------------------------
INSERT INTO `root_info` VALUES ('100001', 'root', 'root');
INSERT INTO `root_info` VALUES ('100002', 'admin', 'admin');

-- ----------------------------
-- Table structure for volunteer_activity
-- ----------------------------
DROP TABLE IF EXISTS `volunteer_activity`;
CREATE TABLE `volunteer_activity` (
  `volunteer_id` int(11) NOT NULL auto_increment,
  `root_name` varchar(50) NOT NULL,
  `volunteer_name` varchar(50) default NULL,
  `project_name` varchar(50) default NULL,
  `volunteer_place` varchar(50) default NULL,
  `volunteer_time` varchar(50) default NULL,
  `volunteer_picture_path` varchar(255) default NULL,
  `activity_volunteer_number` varchar(50) default NULL,
  `activity_introduce` varchar(255) default NULL,
  `activity_content` varchar(255) default NULL,
  `volunteer_num` int(11) unsigned zerofill NOT NULL,
  `volunteer_look_num` int(11) unsigned zerofill NOT NULL,
  PRIMARY KEY  (`volunteer_id`),
  UNIQUE KEY `volunteer_name` (`volunteer_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10071 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of volunteer_activity
-- ----------------------------
INSERT INTO `volunteer_activity` VALUES ('10065', 'admin', 'hahahaha2', null, 'xldkd', '2017.4.10', 'uploadf309684e-25fe-47b6-b6d1-6c4125135251.jpg', '30', 'dajiahao', 'fuwu', '00000000001', '00000000003');
INSERT INTO `volunteer_activity` VALUES ('10064', 'admin', 'hahahaha', null, 'xldkd', '2017.4.10', 'uploadf309684e-25fe-47b6-b6d1-6c4125135251.jpg', '30', 'dajiahao', 'fuwu', '00000000001', '00000000002');
INSERT INTO `volunteer_activity` VALUES ('10047', 'root', '给老人表演节目', null, 'XXX敬老院', '2017年6月', 'upload404010e4-06aa-49ee-801b-2bcacefc8567.jpg', '6人', '萌萌哒', '萌萌哒', '00000000000', '00000000001');
INSERT INTO `volunteer_activity` VALUES ('10049', 'admin', '社区栏杆改造计划', null, '小营街道', '2017年5月', 'uploadcb0212d7-298c-4efe-b577-961c63f22d5d.jpg', 'null', '身份和和归属感和', '饭店打工皇帝个', '00000000000', '00000000004');
INSERT INTO `volunteer_activity` VALUES ('10052', 'admin', '圆梦小组关爱白血病儿童', null, '儿保医院', '2017年5月', 'uploadd2bafbc4-612f-4026-9beb-92ac11323503.gif', null, null, null, '00000000000', '00000000002');
INSERT INTO `volunteer_activity` VALUES ('10053', 'admin', '童心墙绘活动', null, '星河幼儿园', '2017年5月', 'upload781e2004-4d81-4aa0-ae55-33d5dc43ad64.jpg', 'null', '', 'null', '00000000000', '00000000001');
INSERT INTO `volunteer_activity` VALUES ('10055', 'admin', '敬老院陪伴计划', null, '拱墅区上塘敬老院', '2017年5月', 'uploadcf1a5626-86a2-4539-8d7a-a95eb0e71de8.jpg', '士大夫', '豆腐干', '风格的方式感到十分', '00000000000', '00000000014');
INSERT INTO `volunteer_activity` VALUES ('10060', 'admin', '好好看看很好看', null, 'g', 'fgd', 'uploade67e9d39-834f-4d99-b3b7-5aeb2c1b5b45.jpg', 'a', 'a', 'a', '00000000000', '00000000022');
INSERT INTO `volunteer_activity` VALUES ('10059', 'admin', '呵呵呵恶化', null, '共和国', '2017年5月', 'uploadff076d9d-113f-4719-b5fe-c4089b7b4012.jpg', '3人', '法国法国发方法是高手高高手是个地地道道', '你说开户数大幅杀跌开发', '00000000000', '00000000019');
INSERT INTO `volunteer_activity` VALUES ('10061', 'root', 'a', null, 'a', '2017年6月', 'upload7721f30a-d154-481b-8c9a-c468bdf3b213.jpg', '6人', 'a', 'a', '00000000000', '00000000003');
INSERT INTO `volunteer_activity` VALUES ('10066', 'admin', '梦里个梦', '圆梦小组——热血救天使', 'xxx', 'xxx', 'uploadc37b6480-0df9-4b29-9280-aba06a3bce35.jpg', 'xxx', 'xx', 'xx', '00000000001', '00000000033');
INSERT INTO `volunteer_activity` VALUES ('10067', 'admin', '梦里个梦_2', '', 'xxx', 'xxx', 'upload198328ed-77c6-4134-ad52-67bacfeb651b.jpg', 'xxx', 'xx', 'xx', '00000000000', '00000000000');
INSERT INTO `volunteer_activity` VALUES ('10068', 'admin', '梦里个梦_3', '', 'xxx', 'xxx', 'upload198328ed-77c6-4134-ad52-67bacfeb651b.jpg', 'xxx', 'xx', 'xx', '00000000000', '00000000000');
INSERT INTO `volunteer_activity` VALUES ('10069', 'admin', 'hahahaha_1', '', 'xldkd', '2017.4.10', 'upload198328ed-77c6-4134-ad52-67bacfeb651b.jpg', '30', 'dajiahao', 'fuwu', '00000000001', '00000000001');
INSERT INTO `volunteer_activity` VALUES ('10070', 'admin', 'hahahaha_2', '', 'xldkd', '2017.4.10', 'upload198328ed-77c6-4134-ad52-67bacfeb651b.jpg', '30', 'dajiahao', 'fuwu', '00000000001', '00000000008');
