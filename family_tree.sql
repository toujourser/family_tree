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

 Date: 04/03/2022 17:50:53
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
INSERT INTO `django_session` VALUES ('8530ug0zex4jf6ng9jylytaue493qpi6', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nQ3wt:T3gkwEkf0wTO4JsE1XkCzWMOcp4oiUDlJaZSr2rF7-o', '2022-03-18 17:10:07.863922');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of family_group
-- ----------------------------
BEGIN;
INSERT INTO `family_group` VALUES (1, '汉朝', '汉朝（公元前202年[注 1]－公元220年）是秦朝后出现的朝代，又称天汉，在中国历史上极具有代表性，具有承先启后的重要地位。', '', 'admin', '2022-03-04 13:50:13.309122', '2022-03-04 13:50:13.309151');
INSERT INTO `family_group` VALUES (2, '宋朝', '宋朝（中古汉语IPA读音：/suoŋH/，960年2月4日－1279年3月19日）是中国历史上的一个朝代，根据首都及疆域的变迁，可细分为北宋与南宋，合称两宋，共享国319年。又因国君姓赵，为区别于南北朝时期的南朝宋，故亦称“赵宋”。', 'admin', 'admin', '2022-03-04 14:01:54.903772', '2022-03-04 14:01:54.903797');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of family_member
-- ----------------------------
BEGIN;
INSERT INTO `family_member` VALUES (1, '刘邦', '吕雉', 'man', NULL, '汉高祖', 'admin', 'admin', '2022-03-04 13:51:21.812491', '2022-03-04 13:51:21.812530', 1, NULL);
INSERT INTO `family_member` VALUES (2, '刘肥', NULL, 'man', NULL, '齐悼惠王', 'admin', 'admin', '2022-03-04 13:51:57.148412', '2022-03-04 13:51:57.148454', 1, 1);
INSERT INTO `family_member` VALUES (3, '刘盈', NULL, 'man', NULL, '汉惠帝', 'admin', 'admin', '2022-03-04 13:52:33.003357', '2022-03-04 13:52:33.003388', 1, 1);
INSERT INTO `family_member` VALUES (4, '刘恒', NULL, 'man', NULL, '汉文帝', 'admin', 'admin', '2022-03-04 13:53:02.408621', '2022-03-04 13:53:02.408668', 1, 1);
INSERT INTO `family_member` VALUES (5, '刘弘', NULL, 'man', NULL, '后少帝', NULL, NULL, '2022-03-04 13:53:34.828695', '2022-03-04 13:53:34.828731', 1, 3);
INSERT INTO `family_member` VALUES (6, '刘启', NULL, 'man', NULL, '汉景帝', 'admin', 'admin', '2022-03-04 13:54:04.499808', '2022-03-04 13:54:04.499838', 1, 4);
INSERT INTO `family_member` VALUES (7, '赵朓', NULL, 'man', NULL, '宋僖祖', 'admin', 'admin', '2022-03-04 14:02:29.466035', '2022-03-04 14:02:29.466061', 2, NULL);
INSERT INTO `family_member` VALUES (8, '赵珽', NULL, 'man', NULL, '宋顺祖', 'admin', 'admin', '2022-03-04 14:02:50.129822', '2022-03-04 14:02:50.130283', 2, 7);
INSERT INTO `family_member` VALUES (9, '赵敬', NULL, 'man', NULL, '宋翼祖', 'admin', 'admin', '2022-03-04 14:03:16.462388', '2022-03-04 14:03:16.462421', 2, 8);
INSERT INTO `family_member` VALUES (10, '赵弘殷', NULL, 'man', NULL, '宋宣祖', 'admin', 'admin', '2022-03-04 14:03:35.115281', '2022-03-04 14:03:35.115362', 2, 9);
INSERT INTO `family_member` VALUES (11, '赵匡胤', NULL, 'man', NULL, '宋太祖', 'admin', 'admin', '2022-03-04 14:04:13.494930', '2022-03-04 14:04:13.494959', 2, 10);
INSERT INTO `family_member` VALUES (12, '赵炅', NULL, 'man', NULL, '宋太宗', 'admin', 'admin', '2022-03-04 14:04:29.056502', '2022-03-04 14:04:29.056535', 2, 10);
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
INSERT INTO `users` VALUES (1, 'pbkdf2_sha256$320000$5cMZBij9KhAaQ0emdzqyhU$PMriUhWTeil2Q2fj1uF2w3A8fWmxius+KyG3ckxR9SA=', '2022-03-04 17:10:07.842221', 1, 'admin', '', '', '172870541@qq.com', 1, 1, '2022-03-04 13:49:13.190232');
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
