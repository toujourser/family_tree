/*
 Navicat Premium Data Transfer

 Source Server         : tencent
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 124.223.34.185:3306
 Source Schema         : family_tree

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 08/03/2022 11:28:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 族谱族群', 6, 'add_groups');
INSERT INTO `auth_permission` VALUES (22, 'Can change 族谱族群', 6, 'change_groups');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 族谱族群', 6, 'delete_groups');
INSERT INTO `auth_permission` VALUES (24, 'Can view 族谱族群', 6, 'view_groups');
INSERT INTO `auth_permission` VALUES (25, 'Can add 家族成员', 7, 'add_members');
INSERT INTO `auth_permission` VALUES (26, 'Can change 家族成员', 7, 'change_members');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 家族成员', 7, 'delete_members');
INSERT INTO `auth_permission` VALUES (28, 'Can view 家族成员', 7, 'view_members');
INSERT INTO `auth_permission` VALUES (29, 'Can add 系统用户', 8, 'add_users');
INSERT INTO `auth_permission` VALUES (30, 'Can change 系统用户', 8, 'change_users');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 系统用户', 8, 'delete_users');
INSERT INTO `auth_permission` VALUES (32, 'Can view 系统用户', 8, 'view_users');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2022-03-04 13:50:13.317047', '1', '汉朝', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2022-03-04 13:51:21.819373', '1', '刘邦', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2022-03-04 13:51:57.155166', '2', '刘肥', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2022-03-04 13:52:33.012209', '3', '刘盈', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2022-03-04 13:53:02.415081', '4', '刘恒', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2022-03-04 13:53:34.836199', '5', '刘弘', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2022-03-04 13:54:04.507792', '6', '刘启', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (8, '2022-03-04 14:01:54.910934', '2', '宋朝', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (9, '2022-03-04 14:02:29.472534', '7', '赵朓', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2022-03-04 14:02:50.142579', '8', '赵珽', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (11, '2022-03-04 14:03:16.469018', '9', '赵敬', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (12, '2022-03-04 14:03:35.121475', '10', '赵弘殷', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (13, '2022-03-04 14:04:13.501696', '11', '赵匡胤', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (14, '2022-03-04 14:04:29.063223', '12', '赵炅', 1, '[{\"added\": {}}]', 7, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (6, 'user', 'groups');
INSERT INTO `django_content_type` VALUES (7, 'user', 'members');
INSERT INTO `django_content_type` VALUES (8, 'user', 'users');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-03-04 13:47:57.046391');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2022-03-04 13:47:57.274972');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2022-03-04 13:47:57.832544');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2022-03-04 13:47:57.967204');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2022-03-04 13:47:57.991661');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2022-03-04 13:47:58.015420');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2022-03-04 13:47:58.044108');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2022-03-04 13:47:58.067080');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2022-03-04 13:47:58.095989');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2022-03-04 13:47:58.123069');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2022-03-04 13:47:58.155197');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2022-03-04 13:47:58.214228');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2022-03-04 13:47:58.262843');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2022-03-04 13:47:58.294346');
INSERT INTO `django_migrations` VALUES (15, 'user', '0001_initial', '2022-03-04 13:47:59.390858');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2022-03-04 13:47:59.692650');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2022-03-04 13:47:59.722276');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-04 13:47:59.750451');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2022-03-04 13:47:59.864738');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('2jb4t7w9ep59ppsmwsrb2efmr6f2qt18', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR7zR:7iv0fnIzN2llVE1wJWbJ8kIbrw0uLwfa3h5N1mSrwOw', '2022-03-21 15:41:09.964721');
INSERT INTO `django_session` VALUES ('8530ug0zex4jf6ng9jylytaue493qpi6', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nQ3wt:T3gkwEkf0wTO4JsE1XkCzWMOcp4oiUDlJaZSr2rF7-o', '2022-03-18 17:10:07.863922');
INSERT INTO `django_session` VALUES ('by1oh5d71paeqhjqks5hx96u202goceh', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR85r:fx7qLApSY_MKd_yh7dsgaxI2ouSmnWDY7Oyk63yXeUs', '2022-03-21 15:47:47.765050');
INSERT INTO `django_session` VALUES ('lgj6nflza4aohtafbdrygthhxaiqdcz7', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR79W:QHIE3tY5s91n433TBXoeFaX83ucFPY0MvCHCk3DkSXE', '2022-03-21 14:47:30.488097');
INSERT INTO `django_session` VALUES ('mz0zbzc54fzrmd8rpp5pzge72z5ra64h', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nRCy3:rhDaFOI__hSXKRg0bnJ_igyq7qzF4JYn_C502-xTwTU', '2022-03-21 21:00:03.589594');
INSERT INTO `django_session` VALUES ('pt4lw1wlp9nztvvvetknl0y65e3h96n7', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nRQW9:6RHzxMiKfCVX_oCXbyo-3Nybsu4Li7PX2jaba82QLxM', '2022-03-22 11:28:09.430220');
INSERT INTO `django_session` VALUES ('v2n0o0jea50isxs5bcjr6ebpvae7qc4q', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR846:XDB4SIZgVLkBVxBHzYITTKvrNYik1eImEugkDBjPmUc', '2022-03-21 15:45:58.265907');
COMMIT;

-- ----------------------------
-- Table structure for family_group
-- ----------------------------
DROP TABLE IF EXISTS `family_group`;
CREATE TABLE `family_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `remark` longtext NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `updated_by` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of family_group
-- ----------------------------
BEGIN;
INSERT INTO `family_group` VALUES (1, '汉朝', '汉朝（公元前202年[注 1]－公元220年）是秦朝后出现的朝代，又称天汉，在中国历史上极具有代表性，具有承先启后的重要地位。', 'admin', '', '2022-03-08 09:48:40.811489', '2022-03-08 09:48:40.811520');
INSERT INTO `family_group` VALUES (2, '宋朝', '宋朝（960年2月4日－1279年3月19日）是中国历史上的一个朝代，根据首都及疆域的变迁，可细分为北宋与南宋，合称两宋，共享国319年。', 'admin', '', '2022-03-08 09:50:59.023838', '2022-03-08 09:52:44.269251');
COMMIT;

-- ----------------------------
-- Table structure for family_member
-- ----------------------------
DROP TABLE IF EXISTS `family_member`;
CREATE TABLE `family_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `spouse` varchar(100) DEFAULT NULL,
  `gender` varchar(8) NOT NULL,
  `avater` varchar(500) DEFAULT NULL,
  `birthday` varchar(500) DEFAULT NULL,
  `festival_day` varchar(500) DEFAULT NULL,
  `introduction` longtext,
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `group_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `family_member_group_id_31a976c0_fk_family_group_id` (`group_id`),
  KEY `family_member_parent_id_a576d458_fk_family_member_id` (`parent_id`),
  CONSTRAINT `family_member_group_id_31a976c0_fk_family_group_id` FOREIGN KEY (`group_id`) REFERENCES `family_group` (`id`),
  CONSTRAINT `family_member_parent_id_a576d458_fk_family_member_id` FOREIGN KEY (`parent_id`) REFERENCES `family_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of family_member
-- ----------------------------
BEGIN;
INSERT INTO `family_member` VALUES (3, '刘邦', '吕雉', 'man', NULL, '公元前256', '公元前195', '汉高祖', NULL, NULL, '2022-03-08 10:22:44.997880', '2022-03-08 10:22:44.997903', 1, NULL);
INSERT INTO `family_member` VALUES (4, '刘肥', '', 'man', NULL, '公元前221', '公元前189', '齐悼惠王', NULL, NULL, '2022-03-08 10:28:59.425071', '2022-03-08 10:28:59.425122', 1, 3);
INSERT INTO `family_member` VALUES (6, '刘盈', '', 'man', NULL, '公元前210', '公元前188', '汉惠帝', NULL, NULL, '2022-03-08 10:33:42.683297', '2022-03-08 10:33:42.683328', 1, 3);
INSERT INTO `family_member` VALUES (7, '刘恒', '', 'man', NULL, '公元前202', '公元前157', '汉文帝', NULL, NULL, '2022-03-08 10:34:16.869345', '2022-03-08 10:34:16.869373', 1, 3);
INSERT INTO `family_member` VALUES (8, '刘弘', '', 'man', NULL, '公元前192', '公元前180', '后少帝', NULL, NULL, '2022-03-08 10:34:58.369786', '2022-03-08 10:34:58.369816', 1, 6);
INSERT INTO `family_member` VALUES (9, '刘章', '', 'man', NULL, '公元前200', '公元前177', '城阳景王', NULL, NULL, '2022-03-08 10:35:46.648375', '2022-03-08 10:35:46.648421', 1, 4);
INSERT INTO `family_member` VALUES (10, '刘启', '', 'man', NULL, '公元前188', '公元前141', '汉景帝', NULL, NULL, '2022-03-08 10:39:45.452972', '2022-03-08 10:39:45.452991', 1, 7);
INSERT INTO `family_member` VALUES (11, '刘武', '', 'man', NULL, '公元前167', '公元前144', '梁孝王', NULL, NULL, '2022-03-08 10:40:36.221535', '2022-03-08 10:40:36.221566', 1, 7);
INSERT INTO `family_member` VALUES (12, '刘发', '', 'man', NULL, '未详', '公元前127', '长沙定王', NULL, NULL, '2022-03-08 10:42:14.712171', '2022-03-08 10:42:14.712198', 1, 10);
INSERT INTO `family_member` VALUES (13, '刘彻', '', 'man', NULL, '公元前157', '公元前87', '汉武帝\r\n', NULL, NULL, '2022-03-08 10:43:18.208371', '2022-03-08 10:43:18.208399', 1, 10);
INSERT INTO `family_member` VALUES (14, '刘买', '', 'man', NULL, '未详', '公元前136', '梁共王\r\n', NULL, NULL, '2022-03-08 10:44:03.170027', '2022-03-08 10:44:03.170054', 1, 11);
INSERT INTO `family_member` VALUES (15, '刘据', '', 'man', NULL, '公元前128', '公元前91', '戾太子\r\n', NULL, NULL, '2022-03-08 10:45:17.914152', '2022-03-08 10:45:17.914183', 1, 13);
INSERT INTO `family_member` VALUES (16, '刘髆', '', 'man', NULL, '未详', '公元前88', '昌邑哀王\r\n', NULL, NULL, '2022-03-08 10:45:56.607809', '2022-03-08 10:45:56.607836', 1, 13);
INSERT INTO `family_member` VALUES (17, '刘弗陵', '', 'man', NULL, '公元前94', '公元前74', '汉昭帝\r\n', NULL, NULL, '2022-03-08 10:47:34.779530', '2022-03-08 10:47:34.779555', 1, 13);
INSERT INTO `family_member` VALUES (18, '刘进', '', 'man', NULL, '公元前113', '公元前91', '悼皇考\r\n', NULL, NULL, '2022-03-08 10:48:06.941390', '2022-03-08 10:48:06.941423', 1, 15);
INSERT INTO `family_member` VALUES (19, '刘贺', '', 'man', NULL, '公元前92', '公元前59', '海昏侯\r\n', NULL, NULL, '2022-03-08 10:48:37.461324', '2022-03-08 10:48:37.461365', 1, 16);
INSERT INTO `family_member` VALUES (20, '刘询', '', 'man', NULL, '公元前91', '公元前48', '汉宣帝\r\n', NULL, NULL, '2022-03-08 10:50:14.054658', '2022-03-08 10:50:14.054691', 1, 18);
INSERT INTO `family_member` VALUES (21, '刘奭', '', 'man', NULL, '公元前75', '公元前33', '汉元帝\r\n', NULL, NULL, '2022-03-08 10:51:11.840031', '2022-03-08 10:51:11.840059', 1, 20);
INSERT INTO `family_member` VALUES (22, '刘嚣', '', 'man', NULL, '未详', '公元前25', '楚孝王\r\n', NULL, NULL, '2022-03-08 10:51:40.289036', '2022-03-08 10:51:40.289080', 1, 20);
INSERT INTO `family_member` VALUES (23, '刘宇', '', 'man', NULL, '未详', '公元前20', '东平思王\r\n', NULL, NULL, '2022-03-08 10:52:20.380240', '2022-03-08 10:52:20.380265', 1, 20);
INSERT INTO `family_member` VALUES (24, '赵弘殷', '', 'man', NULL, '900', '956', '宋宣祖\r\n\r\n', 'admin', 'admin', '2022-03-08 10:55:45.479257', '2022-03-08 11:09:02.547555', 2, NULL);
INSERT INTO `family_member` VALUES (25, '赵匡胤', '', 'man', NULL, '927', '976', '宋太祖\r\n', 'admin', NULL, '2022-03-08 11:07:36.796478', '2022-03-08 11:07:36.796509', 2, 24);
INSERT INTO `family_member` VALUES (26, '赵炅', '', 'man', NULL, '939', '997', '宋太宗\r\n', 'admin', NULL, '2022-03-08 11:08:29.100357', '2022-03-08 11:08:29.100384', 2, 24);
INSERT INTO `family_member` VALUES (27, '赵德昭', '', 'man', NULL, '951', '979', '燕懿王\r\n', 'admin', NULL, '2022-03-08 11:15:43.308972', '2022-03-08 11:15:43.309003', 2, 25);
INSERT INTO `family_member` VALUES (28, '赵德芳', '', 'man', NULL, '959', '981', '秦康惠王\r\n', 'admin', NULL, '2022-03-08 11:16:07.389943', '2022-03-08 11:16:07.389976', 2, 25);
INSERT INTO `family_member` VALUES (29, '赵恒', '', 'man', NULL, '968', '1022', '宋真宗\r\n', 'admin', NULL, '2022-03-08 11:16:29.482078', '2022-03-08 11:16:29.482118', 2, 26);
INSERT INTO `family_member` VALUES (30, '赵元份', '', 'man', NULL, '970', '1005', '商恭靖王\r\n', 'admin', NULL, '2022-03-08 11:16:58.642946', '2022-03-08 11:16:58.642977', 2, 26);
INSERT INTO `family_member` VALUES (31, '赵惟吉', '', 'man', NULL, '966', '1010', '冀康孝王\r\n', 'admin', NULL, '2022-03-08 11:17:30.980684', '2022-03-08 11:17:30.980713', 2, 27);
INSERT INTO `family_member` VALUES (32, '赵惟宪', '', 'man', NULL, '980', '1016', '英国公\r\n', 'admin', NULL, '2022-03-08 11:17:49.452351', '2022-03-08 11:17:49.452378', 2, 28);
INSERT INTO `family_member` VALUES (33, '赵祯', '', 'man', NULL, '1010', '1063', '宋仁宗\r\n', 'admin', NULL, '2022-03-08 11:18:10.586181', '2022-03-08 11:18:10.586205', 2, 29);
INSERT INTO `family_member` VALUES (34, '赵允让', '', 'man', NULL, '995', '1060', '濮安懿王\r\n', 'admin', NULL, '2022-03-08 11:18:35.244558', '2022-03-08 11:18:35.244575', 2, 30);
INSERT INTO `family_member` VALUES (35, '赵守度', '', 'man', NULL, '1010', '1038', '庐江侯\r\n', 'admin', NULL, '2022-03-08 11:18:58.899825', '2022-03-08 11:18:58.899849', 2, 31);
INSERT INTO `family_member` VALUES (36, '赵从郁', '', 'man', NULL, '1016', '1048', '新兴侯\r\n', 'admin', NULL, '2022-03-08 11:19:29.697786', '2022-03-08 11:19:29.697812', 2, 32);
INSERT INTO `family_member` VALUES (37, '赵曙', '', 'man', NULL, '', '', '宋英宗\r\n', 'admin', NULL, '2022-03-08 11:19:47.275274', '2022-03-08 11:19:47.275300', 2, 34);
INSERT INTO `family_member` VALUES (38, '赵顼', '', 'man', NULL, '1048', '1085', '宋神宗\r\n', 'admin', NULL, '2022-03-08 11:20:32.298570', '2022-03-08 11:20:32.298599', 2, 37);
INSERT INTO `family_member` VALUES (39, '赵煦', '', 'man', NULL, '1077', '1100', '宋哲宗\r\n', 'admin', NULL, '2022-03-08 11:20:54.384933', '2022-03-08 11:20:54.384964', 2, 38);
INSERT INTO `family_member` VALUES (40, '赵佶', '', 'man', NULL, '1082', '1135', '宋徽宗\r\n', 'admin', NULL, '2022-03-08 11:21:12.144753', '2022-03-08 11:21:12.144783', 2, 38);
INSERT INTO `family_member` VALUES (41, '赵桓', '', 'man', NULL, '1100', '1156', '宋钦宗\r\n', 'admin', NULL, '2022-03-08 11:21:59.343051', '2022-03-08 11:21:59.343079', 2, 40);
INSERT INTO `family_member` VALUES (42, '赵构', '', 'man', NULL, '1107', '1187', '宋高宗\r\n', 'admin', NULL, '2022-03-08 11:22:18.601354', '2022-03-08 11:22:18.601386', 2, 40);
INSERT INTO `family_member` VALUES (43, '赵旉', '', 'man', NULL, '1127', '1129', '元懿太子', 'admin', NULL, '2022-03-08 11:22:51.480600', '2022-03-08 11:22:51.480622', 2, 42);
INSERT INTO `family_member` VALUES (44, '赵世括', '', 'man', NULL, '1038', '1056', '嘉国公\r\n', 'admin', NULL, '2022-03-08 11:23:22.335199', '2022-03-08 11:23:22.335229', 2, 35);
INSERT INTO `family_member` VALUES (45, '赵世将', '', 'man', NULL, '1048', '1080', '赠福国公\r\n', 'admin', NULL, '2022-03-08 11:23:51.754631', '2022-03-08 11:23:51.754661', 2, 36);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'pbkdf2_sha256$320000$5cMZBij9KhAaQ0emdzqyhU$PMriUhWTeil2Q2fj1uF2w3A8fWmxius+KyG3ckxR9SA=', '2022-03-08 11:28:09.412687', 1, 'admin', '', '', '172870541@qq.com', 1, 1, '2022-03-04 13:49:13.190232');
COMMIT;

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_users_id_group_id_83a49e68_uniq` (`users_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_users_id_1e682706_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_user_permissions`;
CREATE TABLE `users_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_users_id_permission_id_d7a00931_uniq` (`users_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_users_id_e1ed60a2_fk_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
