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

 Date: 11/03/2022 16:35:33
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
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (21, 'Can add ????????????', 6, 'add_groups');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (22, 'Can change ????????????', 6, 'change_groups');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (23, 'Can delete ????????????', 6, 'delete_groups');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (24, 'Can view ????????????', 6, 'view_groups');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (25, 'Can add ????????????', 7, 'add_members');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (26, 'Can change ????????????', 7, 'change_members');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (27, 'Can delete ????????????', 7, 'delete_members');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (28, 'Can view ????????????', 7, 'view_members');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (29, 'Can add ????????????', 8, 'add_users');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (30, 'Can change ????????????', 8, 'change_users');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (31, 'Can delete ????????????', 8, 'delete_users');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES (32, 'Can view ????????????', 8, 'view_users');
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
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (1, '2022-03-04 13:50:13.317047', '1', '??????', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (2, '2022-03-04 13:51:21.819373', '1', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (3, '2022-03-04 13:51:57.155166', '2', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (4, '2022-03-04 13:52:33.012209', '3', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (5, '2022-03-04 13:53:02.415081', '4', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (6, '2022-03-04 13:53:34.836199', '5', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (7, '2022-03-04 13:54:04.507792', '6', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (8, '2022-03-04 14:01:54.910934', '2', '??????', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (9, '2022-03-04 14:02:29.472534', '7', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (10, '2022-03-04 14:02:50.142579', '8', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (11, '2022-03-04 14:03:16.469018', '9', '??????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (12, '2022-03-04 14:03:35.121475', '10', '?????????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (13, '2022-03-04 14:04:13.501696', '11', '?????????', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES (14, '2022-03-04 14:04:29.063223', '12', '??????', 1, '[{\"added\": {}}]', 7, 1);
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
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (6, 'user', 'groups');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (7, 'user', 'members');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES (8, 'user', 'users');
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
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (1, 'contenttypes', '0001_initial', '2022-03-04 13:47:57.046391');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2022-03-04 13:47:57.274972');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (3, 'auth', '0001_initial', '2022-03-04 13:47:57.832544');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2022-03-04 13:47:57.967204');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2022-03-04 13:47:57.991661');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (6, 'auth', '0004_alter_user_username_opts', '2022-03-04 13:47:58.015420');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2022-03-04 13:47:58.044108');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2022-03-04 13:47:58.067080');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2022-03-04 13:47:58.095989');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2022-03-04 13:47:58.123069');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2022-03-04 13:47:58.155197');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2022-03-04 13:47:58.214228');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (13, 'auth', '0011_update_proxy_permissions', '2022-03-04 13:47:58.262843');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2022-03-04 13:47:58.294346');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (15, 'user', '0001_initial', '2022-03-04 13:47:59.390858');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (16, 'admin', '0001_initial', '2022-03-04 13:47:59.692650');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2022-03-04 13:47:59.722276');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-04 13:47:59.750451');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES (19, 'sessions', '0001_initial', '2022-03-04 13:47:59.864738');
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
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('2jb4t7w9ep59ppsmwsrb2efmr6f2qt18', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR7zR:7iv0fnIzN2llVE1wJWbJ8kIbrw0uLwfa3h5N1mSrwOw', '2022-03-21 15:41:09.964721');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('8530ug0zex4jf6ng9jylytaue493qpi6', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nQ3wt:T3gkwEkf0wTO4JsE1XkCzWMOcp4oiUDlJaZSr2rF7-o', '2022-03-18 17:10:07.863922');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('by1oh5d71paeqhjqks5hx96u202goceh', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR85r:fx7qLApSY_MKd_yh7dsgaxI2ouSmnWDY7Oyk63yXeUs', '2022-03-21 15:47:47.765050');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('cttr8dg3umauzf5qf2koluxj1505rmf8', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nSaIf:o1dn6RSM1dWv5k_cSJpM2pRiV6Ccywpzw3Xtt3x-Kis', '2022-03-25 16:07:01.727345');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('lgj6nflza4aohtafbdrygthhxaiqdcz7', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR79W:QHIE3tY5s91n433TBXoeFaX83ucFPY0MvCHCk3DkSXE', '2022-03-21 14:47:30.488097');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('mz0zbzc54fzrmd8rpp5pzge72z5ra64h', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nRCy3:rhDaFOI__hSXKRg0bnJ_igyq7qzF4JYn_C502-xTwTU', '2022-03-21 21:00:03.589594');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('n6i3qu0008hgmoer8dmot33ny061z2nf', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nSZco:vLrxjNZVTb6wMEdAhn5jEXq8eQRsU1k4qPfPmHwFaZ8', '2022-03-25 15:23:46.390800');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('t0q8k0j1u6lenf0k7y4knhpxn3gg0jz0', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nSa0T:ajzd3xPkMg21CckivND1wLTuwDOBtNoReO-JpV6cYMk', '2022-03-25 15:48:13.480547');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES ('v2n0o0jea50isxs5bcjr6ebpvae7qc4q', '.eJxVjDsOwjAQBe_iGln-4cSU9DmDtd5d4wCypTipEHeHSCmgfTPzXiLCtpa4dV7iTOIitDj9bgnwwXUHdId6axJbXZc5yV2RB-1yasTP6-H-HRTo5Vt7tBoUaiAO5ExmJqU8muDOWtvAmZ3yoyaXrfcGx4BmII-DteRUYiXeH-nXN8Y:1nR846:XDB4SIZgVLkBVxBHzYITTKvrNYik1eImEugkDBjPmUc', '2022-03-21 15:45:58.265907');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of family_group
-- ----------------------------
BEGIN;
INSERT INTO `family_group` (`id`, `name`, `remark`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES (1, '??????', '??????????????????202???[??? 1]?????????220??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????', 'admin', '', '2022-03-08 09:48:40.811489', '2022-03-08 09:48:40.811520');
INSERT INTO `family_group` (`id`, `name`, `remark`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES (2, '??????', '?????????960???2???4??????1279???3???19?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????319??????', 'admin', '', '2022-03-08 09:50:59.023838', '2022-03-08 09:52:44.269251');
INSERT INTO `family_group` (`id`, `name`, `remark`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES (11, '??????', '??????????????????????????????????????????????????????????????????????????????', 'admin', 'admin', '2022-03-11 15:50:16.146233', '2022-03-11 16:28:33.114400');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of family_member
-- ----------------------------
BEGIN;
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (3, '??????', '??????', 'man', NULL, '?????????256', '?????????195', '?????????', NULL, NULL, '2022-03-08 10:22:44.997880', '2022-03-08 10:22:44.997903', 1, NULL);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (4, '??????', '', 'man', NULL, '?????????221', '?????????189', '????????????', NULL, NULL, '2022-03-08 10:28:59.425071', '2022-03-08 10:28:59.425122', 1, 3);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (6, '??????', '', 'man', NULL, '?????????210', '?????????188', '?????????', NULL, NULL, '2022-03-08 10:33:42.683297', '2022-03-08 10:33:42.683328', 1, 3);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (7, '??????', '', 'man', NULL, '?????????202', '?????????157', '?????????', NULL, NULL, '2022-03-08 10:34:16.869345', '2022-03-08 10:34:16.869373', 1, 3);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (8, '??????', '', 'man', NULL, '?????????192', '?????????180', '?????????', NULL, NULL, '2022-03-08 10:34:58.369786', '2022-03-08 10:34:58.369816', 1, 6);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (9, '??????', '', 'man', NULL, '?????????200', '?????????177', '????????????', NULL, NULL, '2022-03-08 10:35:46.648375', '2022-03-08 10:35:46.648421', 1, 4);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (10, '??????', '', 'man', NULL, '?????????188', '?????????141', '?????????', NULL, NULL, '2022-03-08 10:39:45.452972', '2022-03-08 10:39:45.452991', 1, 7);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (11, '??????', '', 'man', NULL, '?????????167', '?????????144', '?????????', NULL, NULL, '2022-03-08 10:40:36.221535', '2022-03-08 10:40:36.221566', 1, 7);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (12, '??????', '', 'man', NULL, '??????', '?????????127', '????????????', NULL, NULL, '2022-03-08 10:42:14.712171', '2022-03-08 10:42:14.712198', 1, 10);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (13, '??????', '', 'man', NULL, '?????????157', '?????????87', '?????????\r\n', NULL, NULL, '2022-03-08 10:43:18.208371', '2022-03-08 10:43:18.208399', 1, 10);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (14, '??????', '', 'man', NULL, '??????', '?????????136', '?????????\r\n', NULL, NULL, '2022-03-08 10:44:03.170027', '2022-03-08 10:44:03.170054', 1, 11);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (15, '??????', '', 'man', NULL, '?????????128', '?????????91', '?????????\r\n', NULL, NULL, '2022-03-08 10:45:17.914152', '2022-03-08 10:45:17.914183', 1, 13);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (16, '??????', '', 'man', NULL, '??????', '?????????88', '????????????\r\n', NULL, NULL, '2022-03-08 10:45:56.607809', '2022-03-08 10:45:56.607836', 1, 13);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (17, '?????????', '', 'man', NULL, '?????????94', '?????????74', '?????????\r\n', NULL, NULL, '2022-03-08 10:47:34.779530', '2022-03-08 10:47:34.779555', 1, 13);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (18, '??????', '', 'man', NULL, '?????????113', '?????????91', '?????????\r\n', NULL, NULL, '2022-03-08 10:48:06.941390', '2022-03-08 10:48:06.941423', 1, 15);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (19, '??????', '', 'man', NULL, '?????????92', '?????????59', '?????????\r\n', NULL, NULL, '2022-03-08 10:48:37.461324', '2022-03-08 10:48:37.461365', 1, 16);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (20, '??????', '', 'man', NULL, '?????????91', '?????????48', '?????????\r\n', NULL, NULL, '2022-03-08 10:50:14.054658', '2022-03-08 10:50:14.054691', 1, 18);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (21, '??????', '', 'man', NULL, '?????????75', '?????????33', '?????????\r\n', NULL, NULL, '2022-03-08 10:51:11.840031', '2022-03-08 10:51:11.840059', 1, 20);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (22, '??????', '', 'man', NULL, '??????', '?????????25', '?????????\r\n', NULL, NULL, '2022-03-08 10:51:40.289036', '2022-03-08 10:51:40.289080', 1, 20);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (23, '??????', '', 'man', NULL, '??????', '?????????20', '????????????\r\n', NULL, NULL, '2022-03-08 10:52:20.380240', '2022-03-08 10:52:20.380265', 1, 20);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (24, '?????????', '', 'man', NULL, '900', '956', '?????????\r\n\r\n', 'admin', 'admin', '2022-03-08 10:55:45.479257', '2022-03-08 11:09:02.547555', 2, NULL);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (25, '?????????', '', 'man', NULL, '927', '976', '?????????\r\n', 'admin', NULL, '2022-03-08 11:07:36.796478', '2022-03-08 11:07:36.796509', 2, 24);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (26, '??????', '', 'man', NULL, '939', '997', '?????????\r\n', 'admin', NULL, '2022-03-08 11:08:29.100357', '2022-03-08 11:08:29.100384', 2, 24);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (27, '?????????', '', 'man', NULL, '951', '979', '?????????\r\n', 'admin', NULL, '2022-03-08 11:15:43.308972', '2022-03-08 11:15:43.309003', 2, 25);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (28, '?????????', '', 'man', NULL, '959', '981', '????????????\r\n', 'admin', NULL, '2022-03-08 11:16:07.389943', '2022-03-08 11:16:07.389976', 2, 25);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (29, '??????', '', 'man', NULL, '968', '1022', '?????????\r\n', 'admin', NULL, '2022-03-08 11:16:29.482078', '2022-03-08 11:16:29.482118', 2, 26);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (30, '?????????', '', 'man', NULL, '970', '1005', '????????????\r\n', 'admin', NULL, '2022-03-08 11:16:58.642946', '2022-03-08 11:16:58.642977', 2, 26);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (31, '?????????', '', 'man', NULL, '966', '1010', '????????????\r\n', 'admin', NULL, '2022-03-08 11:17:30.980684', '2022-03-08 11:17:30.980713', 2, 27);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (32, '?????????', '', 'man', NULL, '980', '1016', '?????????\r\n', 'admin', NULL, '2022-03-08 11:17:49.452351', '2022-03-08 11:17:49.452378', 2, 28);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (33, '??????', '', 'man', NULL, '1010', '1063', '?????????\r\n', 'admin', NULL, '2022-03-08 11:18:10.586181', '2022-03-08 11:18:10.586205', 2, 29);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (34, '?????????', '', 'man', NULL, '995', '1060', '????????????\r\n', 'admin', NULL, '2022-03-08 11:18:35.244558', '2022-03-08 11:18:35.244575', 2, 30);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (35, '?????????', '', 'man', NULL, '1010', '1038', '?????????\r\n', 'admin', NULL, '2022-03-08 11:18:58.899825', '2022-03-08 11:18:58.899849', 2, 31);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (36, '?????????', '', 'man', NULL, '1016', '1048', '?????????\r\n', 'admin', NULL, '2022-03-08 11:19:29.697786', '2022-03-08 11:19:29.697812', 2, 32);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (37, '??????', '', 'man', NULL, '', '', '?????????\r\n', 'admin', NULL, '2022-03-08 11:19:47.275274', '2022-03-08 11:19:47.275300', 2, 34);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (38, '??????', '', 'man', NULL, '1048', '1085', '?????????\r\n', 'admin', NULL, '2022-03-08 11:20:32.298570', '2022-03-08 11:20:32.298599', 2, 37);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (39, '??????', '', 'man', NULL, '1077', '1100', '?????????\r\n', 'admin', NULL, '2022-03-08 11:20:54.384933', '2022-03-08 11:20:54.384964', 2, 38);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (40, '??????', '', 'man', NULL, '1082', '1135', '?????????\r\n', 'admin', NULL, '2022-03-08 11:21:12.144753', '2022-03-08 11:21:12.144783', 2, 38);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (41, '??????', '', 'man', NULL, '1100', '1156', '?????????\r\n', 'admin', NULL, '2022-03-08 11:21:59.343051', '2022-03-08 11:21:59.343079', 2, 40);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (42, '??????', '', 'man', NULL, '1107', '1187', '?????????\r\n', 'admin', NULL, '2022-03-08 11:22:18.601354', '2022-03-08 11:22:18.601386', 2, 40);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (43, '??????', '', 'man', NULL, '1127', '1129', '????????????', 'admin', NULL, '2022-03-08 11:22:51.480600', '2022-03-08 11:22:51.480622', 2, 42);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (44, '?????????', '', 'man', NULL, '1038', '1056', '?????????\r\n', 'admin', NULL, '2022-03-08 11:23:22.335199', '2022-03-08 11:23:22.335229', 2, 35);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (45, '?????????', '', 'man', NULL, '1048', '1080', '????????????\r\n', 'admin', NULL, '2022-03-08 11:23:51.754631', '2022-03-08 11:23:51.754661', 2, 36);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (48, '??????', '', 'man', NULL, '?????????259???', '?????????210???', '?????????', 'admin', NULL, '2022-03-11 16:29:30.168391', '2022-03-11 16:29:30.168419', 11, NULL);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (49, '??????	', '', 'man', NULL, '?????????237', '?????????206', '????????????	', 'admin', NULL, '2022-03-11 16:33:06.228330', '2022-03-11 16:33:06.228357', 11, 48);
INSERT INTO `family_member` (`id`, `name`, `spouse`, `gender`, `avater`, `birthday`, `festival_day`, `introduction`, `created_by`, `updated_by`, `created_at`, `updated_at`, `group_id`, `parent_id`) VALUES (50, '??????', '', 'man', NULL, '?????????230???', '?????????207???', '?????????', 'admin', NULL, '2022-03-11 16:33:58.539190', '2022-03-11 16:33:58.539221', 11, 48);
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
INSERT INTO `users` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES (1, 'pbkdf2_sha256$320000$5cMZBij9KhAaQ0emdzqyhU$PMriUhWTeil2Q2fj1uF2w3A8fWmxius+KyG3ckxR9SA=', '2022-03-11 16:07:01.702250', 1, 'admin', '', '', '172870541@qq.com', 1, 1, '2022-03-04 13:49:13.190232');
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
