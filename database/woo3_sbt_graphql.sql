/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : woo3_graphql

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 10/03/2023 16:05:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clubs
-- ----------------------------
DROP TABLE IF EXISTS `clubs`;
CREATE TABLE `clubs`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `chain_id` int(11) NOT NULL DEFAULT 137 COMMENT '137 matic 210425 lat',
  `contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合约地址',
  `contract_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合约名称',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `twitter_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `twitter_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discord_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `telegram_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `multisig_wallet_address` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '绑定的多签钱包地址',
  `multisig_wallet_owners` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '多签钱包的owners信息 json字符串',
  `logo_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'normal' COMMENT 'nft normal',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'club logo',
  `created_uid` int(11) NOT NULL COMMENT '创建人id',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `unique_url_code` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '自定义唯一Url',
  `anncmnt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'announcement 最新公告',
  `fans_count` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'club粉丝/会员总数',
  `max_fans_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0代表无上限',
  `bg_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `button_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `icon_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `font_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `join_condition_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `created_at` timestamp(0) NOT NULL,
  `updated_at` timestamp(0) NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_code`(`unique_url_code`) USING BTREE,
  UNIQUE INDEX `unique_cid`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_collections
-- ----------------------------
DROP TABLE IF EXISTS `sbt_collections`;
CREATE TABLE `sbt_collections`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据id(hash)',
  `arweave_tx` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本行记录最新一次更新的Arweave交易txid',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sbt 名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'single\\variable\\numberic',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo img 可以为空',
  `issuer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发行方名称（dao名称）',
  `issuer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发行方id（dao的唯一id）',
  `managers` json NULL COMMENT '管理者\r\n 保留字段暂时无用',
  `max_amount` int(11) NULL DEFAULT NULL COMMENT '最大发行量',
  `issued_amount` int(11) NOT NULL DEFAULT 0 COMMENT '已发行量',
  `destroyed_amount` int(11) NOT NULL DEFAULT 0 COMMENT '已销毁量',
  `distribute_amount` int(11) NOT NULL DEFAULT 0 COMMENT '分发数量，已发行<=分发数量',
  `no_end_time` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否无结束时间',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `get_rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '获取规则',
  `owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `validity_period` int(11) NOT NULL DEFAULT 0 COMMENT '有效期 以天为单位\r\n',
  `membership_tag` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Membership 标记，一个dao 只有一种',
  `to_discord_role` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否同步到discordRole',
  `to_discord_role_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'create' COMMENT 'create 或 associate',
  `init_score` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '初始分值，仅numeric 类型有值',
  `data_source` json NULL COMMENT 'numeric类型数据源',
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '状态 0已销毁',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_collections_destroyed
-- ----------------------------
DROP TABLE IF EXISTS `sbt_collections_destroyed`;
CREATE TABLE `sbt_collections_destroyed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collections_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `arweave_tx` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `destroy_time` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_collections_level
-- ----------------------------
DROP TABLE IF EXISTS `sbt_collections_level`;
CREATE TABLE `sbt_collections_level`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属的DAO id',
  `collections_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属的SBT Collections id',
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级标识',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级标题',
  `issued_amount` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0 COMMENT '当前等级最大数量',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `grade` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级,值越大等级越高',
  `task_data` json NULL COMMENT '任务信息',
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '销毁状态 0销毁  1正常',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '等级描述',
  `created_at` timestamp(0) NOT NULL,
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`id`, `key`, `collections_id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `collections_id`(`collections_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可成长型SBT 合集 任务数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_issued_list
-- ----------------------------
DROP TABLE IF EXISTS `sbt_issued_list`;
CREATE TABLE `sbt_issued_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collections_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属的SBT集合（类型）id',
  `collections_arweave_tx` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `block_height` int(11) NULL DEFAULT NULL COMMENT 'ar区块高度',
  `eth_block_height` int(11) NULL DEFAULT NULL COMMENT 'eth区块高度',
  `arweave_tx` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发放时sb_metada数据存储Arweave 返回txid ',
  `eth_chain_id` int(11) NOT NULL DEFAULT 137,
  `eth_tx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sbt 发放的链上交易hash',
  `issuer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发行方名称 即DAO 名称',
  `issuer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发行方id 即DAO id',
  `to_address` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `token_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'tokenId',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'sbt 名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'single、variable、numeric',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sbt logo',
  `status` enum('1','0','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '销毁状态 0销毁  1正常',
  `display` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'yes' COMMENT 'yes 显示  no隐藏',
  `expiry_timestamp` bigint(20) NULL DEFAULT NULL COMMENT '到期日时间戳',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'sbt 的描述',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `level_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仅variable 类型有值',
  `to_discord_role` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否需要同步dc 角色',
  `done_discord_role` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否已完成同步',
  `eth_contract` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1740 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_issued_list_destroyed
-- ----------------------------
DROP TABLE IF EXISTS `sbt_issued_list_destroyed`;
CREATE TABLE `sbt_issued_list_destroyed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collections_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token_id` int(11) NULL DEFAULT NULL,
  `eth_chain_id` int(11) NOT NULL DEFAULT 137,
  `eth_tx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `destroy_time` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_issued_numeric_data
-- ----------------------------
DROP TABLE IF EXISTS `sbt_issued_numeric_data`;
CREATE TABLE `sbt_issued_numeric_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issued_list_id` int(11) NOT NULL,
  `collections_id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '销毁状态 0销毁  1正常',
  `score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数值型 sbt 分值',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数值型 sbt  的 分数值 数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_issued_numeric_grow_up_log
-- ----------------------------
DROP TABLE IF EXISTS `sbt_issued_numeric_grow_up_log`;
CREATE TABLE `sbt_issued_numeric_grow_up_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` int(11) NOT NULL COMMENT 'sbt_issued_numeric_data 的id',
  `eth_tx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `eth_chain_id` int(11) NOT NULL DEFAULT 137,
  `arweave_tx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型记录',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '增长原因描述',
  `add_score` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本次增长得分数',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数值型 sbt  的 分数值 数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_issued_variable_data
-- ----------------------------
DROP TABLE IF EXISTS `sbt_issued_variable_data`;
CREATE TABLE `sbt_issued_variable_data`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issued_list_id` int(11) NOT NULL,
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '销毁状态 0销毁  1正常',
  `collections_id` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '可成长型 sbt 当前等级key',
  `level_grade` int(11) NULL DEFAULT NULL COMMENT '可成长型 sbt 当前等级value',
  `level_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `promoted` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否已被管理员提升到一个等级',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `issued_list_id`) USING BTREE,
  UNIQUE INDEX `issued_list_id`(`issued_list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可成长型等级 SBT 等级数据记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sbt_issued_variable_data_upgrade_log
-- ----------------------------
DROP TABLE IF EXISTS `sbt_issued_variable_data_upgrade_log`;
CREATE TABLE `sbt_issued_variable_data_upgrade_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `issued_list_id` int(11) NOT NULL,
  `from_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '可成长型 sbt 原等级key',
  `to_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可成长型 sbt 当前等级key',
  `arweave_tx` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `eth_tx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `eth_chain_id` int(11) NOT NULL DEFAULT 137,
  `send_data` json NULL,
  `tags_data` json NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '可成长型等级 SBT 等级升级数据记录表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
