/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : seafood

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 21/03/2020 00:48:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
BEGIN;
INSERT INTO `flyway_schema_history` VALUES (1, '3.2', 'update', 'SQL', 'V3.2__update.sql', -53734780, 'root', '2020-03-07 16:48:21', 21, 1);
COMMIT;

-- ----------------------------
-- Table structure for mto_channel
-- ----------------------------
DROP TABLE IF EXISTS `mto_channel`;
CREATE TABLE `mto_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_channel
-- ----------------------------
BEGIN;
INSERT INTO `mto_channel` VALUES (1, 'fish', '鱼类', 0, '', 3);
INSERT INTO `mto_channel` VALUES (2, 'bei', '贝类', 0, '', 2);
INSERT INTO `mto_channel` VALUES (3, 'jotting', '虾蟹类', 0, '', 1);
INSERT INTO `mto_channel` VALUES (4, 'share', '头足类', 0, '', 0);
INSERT INTO `mto_channel` VALUES (5, 'zao', '藻类', 0, '', 0);
INSERT INTO `mto_channel` VALUES (6, 'other', '其他', 0, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for mto_comment
-- ----------------------------
DROP TABLE IF EXISTS `mto_comment`;
CREATE TABLE `mto_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_POST_ID` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_comment
-- ----------------------------
BEGIN;
INSERT INTO `mto_comment` VALUES (1, 1, '这是什么啊', '2020-03-07 20:28:10', 0, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for mto_favorite
-- ----------------------------
DROP TABLE IF EXISTS `mto_favorite`;
CREATE TABLE `mto_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_USER_ID` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_favorite
-- ----------------------------
BEGIN;
INSERT INTO `mto_favorite` VALUES (1, '2020-03-07 17:47:28', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for mto_links
-- ----------------------------
DROP TABLE IF EXISTS `mto_links`;
CREATE TABLE `mto_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mto_message
-- ----------------------------
DROP TABLE IF EXISTS `mto_message`;
CREATE TABLE `mto_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `event` int(11) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_message
-- ----------------------------
BEGIN;
INSERT INTO `mto_message` VALUES (1, '2020-03-07 17:47:28', 1, 1, 1, 1, 1);
INSERT INTO `mto_message` VALUES (2, '2020-03-07 20:28:10', 3, 1, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for mto_options
-- ----------------------------
DROP TABLE IF EXISTS `mto_options`;
CREATE TABLE `mto_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) DEFAULT NULL,
  `type` int(5) DEFAULT '0',
  `value` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_options
-- ----------------------------
BEGIN;
INSERT INTO `mto_options` VALUES (1, 'site_name', 0, '海产品预购');
INSERT INTO `mto_options` VALUES (2, 'site_domain', 0, 'http://mtons.com');
INSERT INTO `mto_options` VALUES (3, 'site_keywords', 0, '预购销售');
INSERT INTO `mto_options` VALUES (4, 'site_description', 0, '为海鲜产品提供预售渠道');
INSERT INTO `mto_options` VALUES (5, 'site_metas', 0, '');
INSERT INTO `mto_options` VALUES (6, 'site_copyright', 0, 'Copyright ©2020');
INSERT INTO `mto_options` VALUES (7, 'site_icp', 0, '');
INSERT INTO `mto_options` VALUES (8, 'qq_callback', 0, '');
INSERT INTO `mto_options` VALUES (9, 'qq_app_id', 0, '');
INSERT INTO `mto_options` VALUES (10, 'qq_app_key', 0, '');
INSERT INTO `mto_options` VALUES (11, 'weibo_callback', 0, '');
INSERT INTO `mto_options` VALUES (12, 'weibo_client_id', 0, '');
INSERT INTO `mto_options` VALUES (13, 'weibo_client_sercret', 0, '');
INSERT INTO `mto_options` VALUES (14, 'github_callback', 0, '');
INSERT INTO `mto_options` VALUES (15, 'github_client_id', 0, '');
INSERT INTO `mto_options` VALUES (16, 'github_secret_key', 0, '');
INSERT INTO `mto_options` VALUES (17, 'site_logo', 0, '/dist/images/logo/logo.png');
INSERT INTO `mto_options` VALUES (18, 'editor', 0, 'markdown');
INSERT INTO `mto_options` VALUES (19, 'site_favicon', 0, '/dist/images/logo/m.png');
COMMIT;

-- ----------------------------
-- Table structure for mto_post
-- ----------------------------
DROP TABLE IF EXISTS `mto_post`;
CREATE TABLE `mto_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `favors` int(11) NOT NULL,
  `featured` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `summary` varchar(140) DEFAULT NULL,
  `tags` varchar(64) DEFAULT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `num` int(10) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`id`),
  KEY `IK_CHANNEL_ID` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_post
-- ----------------------------
BEGIN;
INSERT INTO `mto_post` VALUES (1, 1, 1, 1, '2020-03-07 16:51:48', 1, 0, 0, '商品简介：红三鱼，地方名：红衫鱼、红哥鲤、吊三鱼、拖三鱼、瓜三鱼、黄肚鱼金线、金线鲤，六齿金线鱼。 红三鱼体长而侧扁，背缘、腹缘粗壮，钝圆。眼大，唇厚、吻钝尖，口稍倾斜，头前无鳞。前腮盖骨被三行斜排的鳞片。胸鳍尖长。尾鳍分叉，尾鳍上叶不延长为丝状...', '', '/storage/thumbnails/_signature/34ESEP814T92CT5SR0JCP6KCGL.png', '野生优质红三鱼', 23, 1, 19.00, 100);
INSERT INTO `mto_post` VALUES (2, 1, 3, 0, '2020-03-07 17:04:00', 0, 1, 0, '商品简介：阿根廷红虾是阿根廷南部海域野生的虾子，红色，营养丰富，富含铁、维生素B12、蛋白质等元素，因是野生深海虾，加上全身红色，相对于国内虾来说，不管是外观还是肉质，都能得到大众的推崇。  商品详情：阿根廷南部海域，纯净无污染，水温较低，红虾在...', '', '/storage/thumbnails/_signature/IQANBQOOB0A9E2T7PVU4JDPCJ.jpeg', '阿根廷红虾', 2, 0, 1000.39, 1000);
INSERT INTO `mto_post` VALUES (3, 1, 6, 0, '2020-03-07 20:42:55', 0, 0, 0, '名称： 海参 发布者：紫鼎堂健康产品有限公司 简介：又名沙巽，是生长在海洋底层岩石或海藻上的一种棘皮动物，我国有100多种可食用的有 20多种。', '', '/storage/thumbnails/_signature/2VE6EI4T5V3023OQ7A8D9PBS1J.png', '海参', 0, 0, 1000.00, 200);
INSERT INTO `mto_post` VALUES (4, 1, 1, 0, '2020-03-07 20:43:35', 0, 0, 0, '这是刀鱼', '', '/storage/thumbnails/_signature/2EGDA608TVRATTD4S1L97M2NB5.jpg', '刀鱼', 0, 0, 100.00, 20);
INSERT INTO `mto_post` VALUES (5, 1, 1, 0, '2020-03-07 20:43:51', 0, 0, 0, '名称： 紫海胆 发布者：大连美琳科技发展有限公司 简介： 紫海胆，俗称刺锅子。大连是中国的紫海胆主产地，产量占全国同类产量的95%以上。其体呈球形，直径一般6-8厘米，高3-5厘米。大棘坚硬端尖，棘黑紫色，生活于低潮区岩石、海藻丛生或石缝中', '', '/storage/thumbnails/_signature/34KKN3DIR2A2ORNN5TS38MN4K4.jpeg', '紫海胆', 0, 0, 45.00, 100);
INSERT INTO `mto_post` VALUES (6, 1, 5, 0, '2020-03-07 20:44:49', 0, 0, 0, '新鲜清脆麻辣味海蜇丝200g 无沙香辣海蜇丝 即食海蜇丝批发 商品简介：即食海蜇丝，清脆爽口，开袋无沙 商品详情：取自远离大陆的东海海域，美味方便', '', '/storage/thumbnails/_signature/3VEK8KFEG6LUA6PKGJ8QNVMAB9.jpeg', '海蜇丝', 0, 0, 15.00, 100);
INSERT INTO `mto_post` VALUES (7, 1, 2, 0, '2020-03-07 20:46:23', 0, 0, 0, '： 干蛤蜊肉厂家批发 水产品蛏干荣成海鲜 海产品干货直销', '', '/storage/thumbnails/_signature/3AF2P79N5NF8DHIC01MURFTRRD.jpg', '蛤蜊肉', 1, 0, 20.00, 100);
INSERT INTO `mto_post` VALUES (8, 1, 3, 0, '2020-03-07 20:47:31', 0, 0, 0, '名称： 冻切梭子蟹 发布者：舟山市惠业天诚水产有限公司 简介：冻切梭子蟹 名称：梭子蟹 拉丁名称：Portunus Trituberculatus 捕捞区域：FAO61（野生海捕） 描述：清洁，块冻 规格： LLL(8-10个/kg), LL(1...', '', '/storage/thumbnails/_signature/2MTUOIO1MEC3BCNSDS4HSJUEIM.jpeg', '大闸蟹', 0, 0, 55.00, 100);
INSERT INTO `mto_post` VALUES (9, 1, 5, 0, '2020-03-07 20:48:12', 0, 0, 0, '名称： 羊栖菜(鹿尾菜)产品 发布者：温州捷禾水产食品有限公司 简介：　羊栖菜是一种天然海洋食品，有大海的矿物宝库之称，它富含平常食物中不足的食物纤维和矿物质，食物纤维比营养极高的裙带菜等还要多，钾的含量相同于晒干的丁香鱼，是牛奶的10倍，铁的含...', '', '/storage/thumbnails/_signature/1AL2UDQ84NJO3F3H7J1NU01ECH.jpeg', '海藻', 0, 0, 24.00, 10);
INSERT INTO `mto_post` VALUES (10, 1, 4, 0, '2020-03-07 20:48:49', 0, 0, 0, '名称： 鱼类、鱿鱼类等 发布者：福清市华盛水产食品有限公司 简介：冻虾、冻鱿鱼、冻章鱼、冻带鱼、冻海参、冻鱼片、冻蟹块、其它速冻水产品及风味鱼制品等', '', '/storage/thumbnails/_signature/3AVJQEU3DV7P967C10TUAF66IL.jpeg', '鱿鱼', 0, 0, 23.00, 10);
INSERT INTO `mto_post` VALUES (11, 1, 3, 0, '2020-03-07 20:49:44', 0, 0, 0, '大连特产海鲜基围虾2斤/80-100只 鲜活水产新鲜活虾大虾活鲜', '', '/storage/thumbnails/_signature/17MN888GAUJGCD6QKB2JRJQIIM.jpg', '基围虾', 2, 0, 89.00, 100);
INSERT INTO `mto_post` VALUES (12, 1, 1, 0, '2020-03-07 20:50:33', 0, 0, 0, '名称： 全国供应鲜活海鱼类多宝鱼 速冻多宝鱼水产海鲜 海鱼冷冻水产  发布者：赣榆区海头镇鹏伟水产品经营部 简介：多宝鱼学名大菱鲆鱼，属于鲽形目鲆科，俗称欧洲比目鱼，在中国称“多宝鱼”。原产于欧洲大西洋海域，是世界公认的优质比目鱼之一。多宝鱼雄性...', '', '/storage/thumbnails/_signature/2MTUOIO1MEC3BCNSDS4HSJUEIM.jpeg', '梭子蟹', 0, 0, 46.00, 100);
INSERT INTO `mto_post` VALUES (13, 1, 4, 0, '2020-03-07 20:51:13', 0, 0, 0, '名称： 批发冷冻鱿鱼头 300-400克 现货批发 发布者：深圳市雨欣冷冻食品有限责任公司 简介：鱿鱼是软体动物门头足纲管鱿目开眼亚目的动物，身体细长，呈长锥形，有十只触腕，其中两只较长。触腕前端有吸盘，吸盘内有角质齿环，捕食食物时用触腕缠住将其...', '', '/storage/thumbnails/_signature/C0HHK11GOPHIR1H2CPU4FBUFU.png', '冷冻鱿鱼头', 1, 0, 23.00, 100);
COMMIT;

-- ----------------------------
-- Table structure for mto_post_attribute
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_attribute`;
CREATE TABLE `mto_post_attribute` (
  `id` bigint(20) NOT NULL,
  `content` longtext,
  `editor` varchar(16) DEFAULT 'tinymce',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_post_attribute
-- ----------------------------
BEGIN;
INSERT INTO `mto_post_attribute` VALUES (1, '商品简介：红三鱼，地方名：红衫鱼、红哥鲤、吊三鱼、拖三鱼、瓜三鱼、黄肚鱼金线、金线鲤，六齿金线鱼。 红三鱼体长而侧扁，背缘、腹缘粗壮，钝圆。眼大，唇厚、吻钝尖，口稍倾斜，头前无鳞。前腮盖骨被三行斜排的鳞片。胸鳍尖长。尾鳍分叉，尾鳍上叶不延长为丝状。体侧有二条浅蓝色纵带和5~6条淡黄色纵带。背鳍红色，有黄色边缘。臀鳍白色，中间有一黄色条纹。尾鳍红色，上叶尖部黄色。 为广东、广西北部湾、海南、台湾等省近海底拖网渔业捕捞的鱼类，俗称“红三”和“瓜三”，是南海重要经济鱼类。鱼肉丰厚，食用价值甚高，冰鲜、腌制和干晒均可。', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (2, '	商品简介：阿根廷红虾是阿根廷南部海域野生的虾子，红色，营养丰富，富含铁、维生素B12、蛋白质等元素，因是野生深海虾，加上全身红色，相对于国内虾来说，不管是外观还是肉质，都能得到大众的推崇。\r\n\r\n商品详情：阿根廷南部海域，纯净无污染，水温较低，红虾在这种环境下自然生长，营养丰富，口感鲜嫩。出水后立即快速冷冻至零下20摄氏度以下，以锁住红虾的新鲜度和营养成分。红虾的整个储藏和运输过程始终保持在零下20摄氏度以下，确保红虾在到达消费者餐桌时，营养成分不流失。野生，海捕，低温纯净海域生长', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (3, '名称： 海参\r\n发布者：紫鼎堂健康产品有限公司\r\n简介：又名沙巽，是生长在海洋底层岩石或海藻上的一种棘皮动物，我国有100多种可食用的有 20多种。', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (4, '这是刀鱼', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (5, '名称： 紫海胆\r\n发布者：大连美琳科技发展有限公司\r\n简介： 紫海胆，俗称刺锅子。大连是中国的紫海胆主产地，产量占全国同类产量的95%以上。其体呈球形，直径一般6-8厘米，高3-5厘米。大棘坚硬端尖，棘黑紫色，生活于低潮区岩石、海藻丛生或石缝中', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (6, '新鲜清脆麻辣味海蜇丝200g 无沙香辣海蜇丝 即食海蜇丝批发\r\n商品简介：即食海蜇丝，清脆爽口，开袋无沙\r\n\r\n商品详情：取自远离大陆的东海海域，美味方便', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (7, '： 干蛤蜊肉厂家批发 水产品蛏干荣成海鲜 海产品干货直销', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (8, '名称： 冻切梭子蟹\r\n发布者：舟山市惠业天诚水产有限公司\r\n简介：冻切梭子蟹 名称：梭子蟹 拉丁名称：Portunus Trituberculatus 捕捞区域：FAO61（野生海捕） 描述：清洁，块冻 规格： LLL(8-10个/kg), LL(14-15个/kg), L(19-20个/kg), M(24-25个/kg), S(29-30 个/kg), SS(39-40个/kg) 包装：按照客户要求 储存方式：-18摄氏度以下 保质期：24个月', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (9, '名称： 羊栖菜(鹿尾菜)产品\r\n发布者：温州捷禾水产食品有限公司\r\n简介：　羊栖菜是一种天然海洋食品，有大海的矿物宝库之称，它富含平常食物中不足的食物纤维和矿物质，食物纤维比营养极高的裙带菜等还要多，钾的含量相同于晒干的丁香鱼，是牛奶的10倍，铁的含量猪肝的4倍，同时含有其它对人体有益的微量元素，具有丰富的营养及净化血液（抗高血压）、抗肿瘤的功效，尤其对肥胖者食用效果更佳。', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (10, '名称： 鱼类、鱿鱼类等\r\n发布者：福清市华盛水产食品有限公司\r\n简介：冻虾、冻鱿鱼、冻章鱼、冻带鱼、冻海参、冻鱼片、冻蟹块、其它速冻水产品及风味鱼制品等', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (11, '大连特产海鲜基围虾2斤/80-100只 鲜活水产新鲜活虾大虾活鲜\r\n![O1CN01eHP1kC26xTIi5SUFX_!!1863387728.jpg](/storage/thumbnails/_signature/121RR0FQV51TFHLCQ8PI8UUBGQ.jpg)', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (12, '	名称： 全国供应鲜活海鱼类多宝鱼 速冻多宝鱼水产海鲜 海鱼冷冻水产\r\n发布者：赣榆区海头镇鹏伟水产品经营部\r\n简介：多宝鱼学名大菱鲆鱼，属于鲽形目鲆科，俗称欧洲比目鱼，在中国称“多宝鱼”。原产于欧洲大西洋海域，是世界公认的优质比目鱼之一。多宝鱼雄性一年达到性成熟，雌鱼两年达到性成熟，自然成熟期在每年5～8月份。人工培养的亲鱼，在控温控光的条件下，全年都可获得成熟的卵子，目前进行人工繁殖采用人工授精。', 'markdown');
INSERT INTO `mto_post_attribute` VALUES (13, '名称： 批发冷冻鱿鱼头 300-400克 现货批发\r\n发布者：深圳市雨欣冷冻食品有限责任公司\r\n简介：鱿鱼是软体动物门头足纲管鱿目开眼亚目的动物，身体细长，呈长锥形，有十只触腕，其中两只较长。触腕前端有吸盘，吸盘内有角质齿环，捕食食物时用触腕缠住将其吞食。鱿鱼是乌贼的一种，目前市场看到的鱿鱼有两种：一种是躯干部较肥大的鱿鱼，喜群聚，尤其在春夏季交配产卵期。', 'markdown');
COMMIT;

-- ----------------------------
-- Table structure for mto_post_resource
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_resource`;
CREATE TABLE `mto_post_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IK_POST_ID` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_post_resource
-- ----------------------------
BEGIN;
INSERT INTO `mto_post_resource` VALUES (1, '/storage/thumbnails/_signature/121RR0FQV51TFHLCQ8PI8UUBGQ.jpg', 11, 13, 0);
COMMIT;

-- ----------------------------
-- Table structure for mto_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_post_tag`;
CREATE TABLE `mto_post_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  `weight` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IK_TAG_ID` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mto_resource
-- ----------------------------
DROP TABLE IF EXISTS `mto_resource`;
CREATE TABLE `mto_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `md5` varchar(100) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_MD5` (`md5`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_resource
-- ----------------------------
BEGIN;
INSERT INTO `mto_resource` VALUES (1, 0, NULL, '2S9V7CQ1TPH8NBPNCTR9ELAIVF', '/storage/thumbnails/_signature/2S9V7CQ1TPH8NBPNCTR9ELAIVF.jpeg', '2020-03-07 16:50:03');
INSERT INTO `mto_resource` VALUES (2, 0, NULL, '34ESEP814T92CT5SR0JCP6KCGL', '/storage/thumbnails/_signature/34ESEP814T92CT5SR0JCP6KCGL.png', '2020-03-07 16:51:29');
INSERT INTO `mto_resource` VALUES (3, 0, NULL, 'IQANBQOOB0A9E2T7PVU4JDPCJ', '/storage/thumbnails/_signature/IQANBQOOB0A9E2T7PVU4JDPCJ.jpeg', '2020-03-07 17:03:20');
INSERT INTO `mto_resource` VALUES (4, 0, NULL, '2VE6EI4T5V3023OQ7A8D9PBS1J', '/storage/thumbnails/_signature/2VE6EI4T5V3023OQ7A8D9PBS1J.png', '2020-03-07 20:42:24');
INSERT INTO `mto_resource` VALUES (5, 0, NULL, '2EGDA608TVRATTD4S1L97M2NB5', '/storage/thumbnails/_signature/2EGDA608TVRATTD4S1L97M2NB5.jpg', '2020-03-07 20:43:03');
INSERT INTO `mto_resource` VALUES (6, 0, NULL, '34KKN3DIR2A2ORNN5TS38MN4K4', '/storage/thumbnails/_signature/34KKN3DIR2A2ORNN5TS38MN4K4.jpeg', '2020-03-07 20:43:44');
INSERT INTO `mto_resource` VALUES (7, 0, NULL, '3VEK8KFEG6LUA6PKGJ8QNVMAB9', '/storage/thumbnails/_signature/3VEK8KFEG6LUA6PKGJ8QNVMAB9.jpeg', '2020-03-07 20:44:42');
INSERT INTO `mto_resource` VALUES (8, 0, NULL, '3AF2P79N5NF8DHIC01MURFTRRD', '/storage/thumbnails/_signature/3AF2P79N5NF8DHIC01MURFTRRD.jpg', '2020-03-07 20:45:02');
INSERT INTO `mto_resource` VALUES (9, 0, NULL, '2MTUOIO1MEC3BCNSDS4HSJUEIM', '/storage/thumbnails/_signature/2MTUOIO1MEC3BCNSDS4HSJUEIM.jpeg', '2020-03-07 20:46:31');
INSERT INTO `mto_resource` VALUES (10, 0, NULL, '1AL2UDQ84NJO3F3H7J1NU01ECH', '/storage/thumbnails/_signature/1AL2UDQ84NJO3F3H7J1NU01ECH.jpeg', '2020-03-07 20:47:40');
INSERT INTO `mto_resource` VALUES (11, 0, NULL, '3AVJQEU3DV7P967C10TUAF66IL', '/storage/thumbnails/_signature/3AVJQEU3DV7P967C10TUAF66IL.jpeg', '2020-03-07 20:48:19');
INSERT INTO `mto_resource` VALUES (12, 0, NULL, '17MN888GAUJGCD6QKB2JRJQIIM', '/storage/thumbnails/_signature/17MN888GAUJGCD6QKB2JRJQIIM.jpg', '2020-03-07 20:49:07');
INSERT INTO `mto_resource` VALUES (13, 1, NULL, '121RR0FQV51TFHLCQ8PI8UUBGQ', '/storage/thumbnails/_signature/121RR0FQV51TFHLCQ8PI8UUBGQ.jpg', '2020-03-07 20:49:44');
INSERT INTO `mto_resource` VALUES (14, 0, NULL, '2NRNE8FKM0A5UQPRDVG90AE71M', '/storage/thumbnails/_signature/2NRNE8FKM0A5UQPRDVG90AE71M.jpeg', '2020-03-07 20:50:40');
INSERT INTO `mto_resource` VALUES (15, 0, NULL, 'C0HHK11GOPHIR1H2CPU4FBUFU', '/storage/thumbnails/_signature/C0HHK11GOPHIR1H2CPU4FBUFU.png', '2020-03-07 20:50:55');
COMMIT;

-- ----------------------------
-- Table structure for mto_security_code
-- ----------------------------
DROP TABLE IF EXISTS `mto_security_code`;
CREATE TABLE `mto_security_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `created` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `key_` varchar(64) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `target` varchar(64) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_shxjkbkgnpxa80pnv4ts57o19` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mto_tag
-- ----------------------------
DROP TABLE IF EXISTS `mto_tag`;
CREATE TABLE `mto_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `latest_post_id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `posts` int(11) NOT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9ki38gg59bw5agwxsc4xtednf` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mto_user
-- ----------------------------
DROP TABLE IF EXISTS `mto_user`;
CREATE TABLE `mto_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT '/dist/images/ava/default.png',
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `gender` int(5) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `signature` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mto_user
-- ----------------------------
BEGIN;
INSERT INTO `mto_user` VALUES (1, 'admin', '小豆丁', '/storage/avatars/000/000/001_240.jpg', 'example@mtons.com', 'UUKHSDDI5KPA43A8VL06V0TU2', 0, '2017-08-06 17:52:41', '2017-07-26 11:08:36', '2020-03-07 20:55:35', 0, 1, 1, 13, '');
INSERT INTO `mto_user` VALUES (2, 'test', 'test', '/storage/avatars/000/000/002_240.jpg', NULL, 'UUKHSDDI5KPA43A8VL06V0TU2', 0, '2020-03-07 23:11:25', NULL, '2020-03-07 23:25:07', 0, NULL, 0, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mto_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `mto_user_oauth`;
CREATE TABLE `mto_user_oauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  `expire_in` varchar(128) DEFAULT NULL,
  `oauth_code` varchar(128) DEFAULT NULL,
  `oauth_type` int(11) DEFAULT NULL,
  `oauth_user_id` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mto_vote
-- ----------------------------
DROP TABLE IF EXISTS `mto_vote`;
CREATE TABLE `mto_vote` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_id` int(10) DEFAULT NULL,
  `u_id` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `status_str` varchar(255) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `create_str` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of mto_vote
-- ----------------------------
BEGIN;
INSERT INTO `mto_vote` VALUES (9, 1, 1, 0, 0, '已预购', '2020-03-07 20:40:34', NULL);
INSERT INTO `mto_vote` VALUES (10, 1, 2, 0, 0, '已预购', '2020-03-07 23:11:30', NULL);
INSERT INTO `mto_vote` VALUES (12, 7, 2, 0, 0, '已预购', '2020-03-07 23:24:58', NULL);
COMMIT;

-- ----------------------------
-- Table structure for shiro_permission
-- ----------------------------
DROP TABLE IF EXISTS `shiro_permission`;
CREATE TABLE `shiro_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(140) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `parent_id` bigint(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_NAME` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_permission
-- ----------------------------
BEGIN;
INSERT INTO `shiro_permission` VALUES (1, '进入后台', 'admin', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (2, '栏目管理', 'channel:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (3, '编辑栏目', 'channel:update', 2, 0, 0);
INSERT INTO `shiro_permission` VALUES (4, '删除栏目', 'channel:delete', 2, 0, 0);
INSERT INTO `shiro_permission` VALUES (5, '文章管理', 'post:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (6, '编辑文章', 'post:update', 5, 0, 0);
INSERT INTO `shiro_permission` VALUES (7, '删除文章', 'post:delete', 5, 0, 0);
INSERT INTO `shiro_permission` VALUES (8, '评论管理', 'comment:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (9, '删除评论', 'comment:delete', 8, 0, 0);
INSERT INTO `shiro_permission` VALUES (10, '用户管理', 'user:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (11, '用户授权', 'user:role', 10, 0, 0);
INSERT INTO `shiro_permission` VALUES (12, '修改密码', 'user:pwd', 10, 0, 0);
INSERT INTO `shiro_permission` VALUES (13, '激活用户', 'user:open', 10, 0, 0);
INSERT INTO `shiro_permission` VALUES (14, '关闭用户', 'user:close', 10, 0, 0);
INSERT INTO `shiro_permission` VALUES (15, '角色管理', 'role:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (16, '修改角色', 'role:update', 15, 0, 0);
INSERT INTO `shiro_permission` VALUES (17, '删除角色', 'role:delete', 15, 0, 0);
INSERT INTO `shiro_permission` VALUES (18, '主题管理', 'theme:index', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (19, '系统配置', 'options:index', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (20, '修改配置', 'options:update', 19, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for shiro_role
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role`;
CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(140) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role
-- ----------------------------
BEGIN;
INSERT INTO `shiro_role` VALUES (1, NULL, 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for shiro_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role_permission`;
CREATE TABLE `shiro_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `shiro_role_permission` VALUES (1, 1, 1);
INSERT INTO `shiro_role_permission` VALUES (2, 2, 1);
INSERT INTO `shiro_role_permission` VALUES (3, 3, 1);
INSERT INTO `shiro_role_permission` VALUES (4, 4, 1);
INSERT INTO `shiro_role_permission` VALUES (5, 5, 1);
INSERT INTO `shiro_role_permission` VALUES (6, 6, 1);
INSERT INTO `shiro_role_permission` VALUES (7, 7, 1);
INSERT INTO `shiro_role_permission` VALUES (8, 8, 1);
INSERT INTO `shiro_role_permission` VALUES (9, 9, 1);
INSERT INTO `shiro_role_permission` VALUES (10, 10, 1);
INSERT INTO `shiro_role_permission` VALUES (11, 11, 1);
INSERT INTO `shiro_role_permission` VALUES (12, 12, 1);
INSERT INTO `shiro_role_permission` VALUES (13, 13, 1);
INSERT INTO `shiro_role_permission` VALUES (14, 14, 1);
INSERT INTO `shiro_role_permission` VALUES (15, 15, 1);
INSERT INTO `shiro_role_permission` VALUES (16, 16, 1);
INSERT INTO `shiro_role_permission` VALUES (17, 17, 1);
INSERT INTO `shiro_role_permission` VALUES (18, 18, 1);
INSERT INTO `shiro_role_permission` VALUES (19, 19, 1);
INSERT INTO `shiro_role_permission` VALUES (20, 20, 1);
COMMIT;

-- ----------------------------
-- Table structure for shiro_user_role
-- ----------------------------
DROP TABLE IF EXISTS `shiro_user_role`;
CREATE TABLE `shiro_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_user_role
-- ----------------------------
BEGIN;
INSERT INTO `shiro_user_role` VALUES (1, 1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
