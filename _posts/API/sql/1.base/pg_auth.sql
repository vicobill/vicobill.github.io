-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.13 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5382
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 pg_auth 的数据库结构
CREATE DATABASE IF NOT EXISTS `pg_auth` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pg_auth`;


-- 通行证账户
CREATE TABLE IF NOT EXISTS `uaccount` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account` varchar(32) NOT NULL DEFAULT '' COMMENT '登录用用户名',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '加密后的密码',

  `sessionkey` varchar(128) NOT NULL DEFAULT '' ,
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `battlenet_account` int(10) unsigned DEFAULT NULL,
  `battlenet_index` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `uk_bnet_acc` (`battlenet_account`,`battlenet_index`),
  CONSTRAINT `fk_bnet_acc` FOREIGN KEY (`battlenet_account`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';

CREATE TABLE IF NOT EXISTS `uaccount_priv`(
  `id` int(10) unsigned NOT NULL COMMENT '账户ID',
  `name` varchar(256) COMMENT '真实名称',
  `primary_addr` varchar(128) COMMENT '首选通讯地址',
  `history_addrs` varchar(256) COMMENT '通讯地址列表',
)

-- 数据导出被取消选择。
-- 导出  表 pg_auth.account_access 结构
CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int(10) unsigned NOT NULL COMMENT '账户ID',
  `gmlevel` tinyint(3) unsigned NOT NULL COMMENT '账号等级',
  `RealmID` int(11) NOT NULL DEFAULT '-1' COMMENT '此账号权限所在服务器ID',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.account_banned 结构
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '账户ID',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '禁止日期',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束禁止日期',
  `bannedby` varchar(50) NOT NULL COMMENT '禁止来源',
  `banreason` varchar(255) NOT NULL COMMENT '禁止原因',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '此禁止是否有效',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='禁止账户列表';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.account_last_played_character 结构
CREATE TABLE IF NOT EXISTS `account_last_played_character` (
  `accountId` int(10) unsigned NOT NULL,
  `region` tinyint(3) unsigned NOT NULL,
  `battlegroup` tinyint(3) unsigned NOT NULL,
  `realmId` int(10) unsigned DEFAULT NULL,
  `characterName` varchar(12) DEFAULT NULL,
  `characterGUID` bigint(20) unsigned DEFAULT NULL,
  `lastPlayedTime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`accountId`,`region`,`battlegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户最后游玩的角色列表';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.account_muted 结构
CREATE TABLE IF NOT EXISTS `account_muted` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT '0',
  `mutetime` int(10) unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='mute List';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.autobroadcast 结构
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_accounts 结构
CREATE TABLE IF NOT EXISTS `battlenet_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(320) NOT NULL,
  `sha_pass_hash` varchar(64) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `LastCharacterUndelete` int(10) unsigned NOT NULL DEFAULT '0',
  `LoginTicket` varchar(64) DEFAULT NULL,
  `LoginTicketExpiry` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_account_bans 结构
CREATE TABLE IF NOT EXISTS `battlenet_account_bans` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_account_heirlooms 结构
CREATE TABLE IF NOT EXISTS `battlenet_account_heirlooms` (
  `accountId` int(10) unsigned NOT NULL,
  `itemId` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_account_mounts 结构
CREATE TABLE IF NOT EXISTS `battlenet_account_mounts` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `mountSpellId` int(10) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`mountSpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_account_toys 结构
CREATE TABLE IF NOT EXISTS `battlenet_account_toys` (
  `accountId` int(10) unsigned NOT NULL,
  `itemId` int(11) NOT NULL DEFAULT '0',
  `isFavourite` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_item_appearances 结构
CREATE TABLE IF NOT EXISTS `battlenet_item_appearances` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `blobIndex` smallint(5) unsigned NOT NULL,
  `appearanceMask` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_item_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battlenet_item_favorite_appearances 结构
CREATE TABLE IF NOT EXISTS `battlenet_item_favorite_appearances` (
  `battlenetAccountId` int(10) unsigned NOT NULL,
  `itemModifiedAppearanceId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`itemModifiedAppearanceId`),
  CONSTRAINT `fk_battlenet_item_favorite_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battle_pets 结构
CREATE TABLE IF NOT EXISTS `battle_pets` (
  `guid` bigint(20) NOT NULL,
  `battlenetAccountId` int(10) NOT NULL,
  `species` int(10) NOT NULL,
  `breed` smallint(5) NOT NULL,
  `level` smallint(5) NOT NULL DEFAULT '1',
  `exp` smallint(5) NOT NULL DEFAULT '0',
  `health` int(10) NOT NULL DEFAULT '1',
  `quality` tinyint(3) NOT NULL DEFAULT '0',
  `flags` smallint(5) NOT NULL DEFAULT '0',
  `name` varchar(12) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.battle_pet_slots 结构
CREATE TABLE IF NOT EXISTS `battle_pet_slots` (
  `id` tinyint(3) NOT NULL,
  `battlenetAccountId` int(10) NOT NULL,
  `battlePetGuid` bigint(20) NOT NULL,
  `locked` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`battlenetAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.ip2nation 结构
CREATE TABLE IF NOT EXISTS `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.ip2nationcountries 结构
CREATE TABLE IF NOT EXISTS `ip2nationcountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.ip_banned 结构
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.logs 结构
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1 COLLATE latin1_swedish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 pg_auth.logs_ip_actions 结构
CREATE TABLE IF NOT EXISTS `logs_ip_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` bigint(20) unsigned NOT NULL COMMENT 'Character Guid',
  `type` tinyint(3) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text COMMENT 'Notes inserted by system',
  `unixtime` int(10) unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used to log ips of individual actions';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.rbac_account_permissions 结构
CREATE TABLE IF NOT EXISTS `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.rbac_default_permissions 结构
CREATE TABLE IF NOT EXISTS `rbac_default_permissions` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'permission id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default permission to assign to different account security levels';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.rbac_linked_permissions 结构
CREATE TABLE IF NOT EXISTS `rbac_linked_permissions` (
  `id` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int(10) unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission - Linked Permission relation';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.rbac_permissions 结构
CREATE TABLE IF NOT EXISTS `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.realmcharacters 结构
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.realmlist 结构
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '26972',
  `Region` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Battlegroup` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.updates 结构
CREATE TABLE IF NOT EXISTS `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.updates_include 结构
CREATE TABLE IF NOT EXISTS `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';

-- 数据导出被取消选择。
-- 导出  表 pg_auth.uptime 结构
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
