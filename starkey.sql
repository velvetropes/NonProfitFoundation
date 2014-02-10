-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: starkey
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exp_accessories`
--

DROP TABLE IF EXISTS `exp_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_accessories`
--

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` VALUES (1,'Expressionengine_info_acc','1|5','addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities','1.0'),(2,'Freeform_acc','1|5','addons_accessories|tools_data|tools_logs|design|addons_modules|content_publish|admin_system|tools_communicate|content_files|addons_fieldtypes|content_edit|tools_utilities|members|content_files_modal|addons|sites|homepage|admin_content|content|myaccount|tools|addons_extensions|addons_plugins','4.1.3');
/*!40000 ALTER TABLE `exp_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Comment','insert_new_comment',0),(2,'Comment_mcp','delete_comment_notification',0),(3,'Comment','comment_subscribe',0),(4,'Comment','edit_comment',0),(5,'Email','send_email',0),(6,'Search','do_search',0),(7,'Channel','submit_entry',0),(8,'Channel','filemanager_endpoint',0),(9,'Channel','smiley_pop',0),(10,'Channel','combo_loader',0),(11,'Member','registration_form',0),(12,'Member','register_member',0),(13,'Member','activate_member',0),(14,'Member','member_login',0),(15,'Member','member_logout',0),(16,'Member','send_reset_token',0),(17,'Member','process_reset_password',0),(18,'Member','send_member_email',0),(19,'Member','update_un_pw',0),(20,'Member','member_search',0),(21,'Member','member_delete',0),(22,'Rte','get_js',0),(23,'Freeform','save_form',0),(24,'Assets_mcp','upload_file',0),(25,'Assets_mcp','get_files_view_by_folders',0),(26,'Assets_mcp','get_props',0),(27,'Assets_mcp','save_props',0),(28,'Assets_mcp','get_ordered_files_view',0),(29,'Assets_mcp','get_session_id',0),(30,'Assets_mcp','start_index',0),(31,'Assets_mcp','perform_index',0),(32,'Assets_mcp','finish_index',0),(33,'Assets_mcp','get_s3_buckets',0),(34,'Assets_mcp','get_gc_buckets',0),(35,'Assets_mcp','get_rs_containers',0),(36,'Assets_mcp','move_folder',0),(37,'Assets_mcp','rename_folder',0),(38,'Assets_mcp','create_folder',0),(39,'Assets_mcp','delete_folder',0),(40,'Assets_mcp','view_file',0),(41,'Assets_mcp','move_file',0),(42,'Assets_mcp','delete_file',0),(43,'Assets_mcp','view_thumbnail',0),(44,'Assets_mcp','build_sheet',0),(45,'Assets_mcp','get_selected_files',0);
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_files`
--

DROP TABLE IF EXISTS `exp_assets_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned NOT NULL,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `source_id` int(10) unsigned DEFAULT NULL,
  `filedir_id` int(4) unsigned DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` int(10) unsigned DEFAULT NULL,
  `alt_text` tinytext,
  `caption` tinytext,
  `author` tinytext,
  `desc` text,
  `location` tinytext,
  `keywords` text,
  `date_modified` int(10) unsigned DEFAULT NULL,
  `kind` varchar(5) DEFAULT NULL,
  `width` int(2) DEFAULT NULL,
  `height` int(2) DEFAULT NULL,
  `size` int(3) DEFAULT NULL,
  `search_keywords` text,
  PRIMARY KEY (`file_id`),
  UNIQUE KEY `unq_folder_id__file_name` (`folder_id`,`file_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_files`
--

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_folders`
--

DROP TABLE IF EXISTS `exp_assets_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_folders` (
  `folder_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `folder_name` varchar(255) NOT NULL,
  `full_path` varchar(255) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  `filedir_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `unq_source_type__source_id__filedir_id__parent_id__folder_name` (`source_type`,`source_id`,`filedir_id`,`parent_id`,`folder_name`),
  UNIQUE KEY `unq_source_type__source_id__filedir_id__full_path` (`source_type`,`source_id`,`filedir_id`,`full_path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_folders`
--

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_index_data`
--

DROP TABLE IF EXISTS `exp_assets_index_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_index_data` (
  `session_id` char(36) DEFAULT NULL,
  `source_type` varchar(2) NOT NULL DEFAULT 'ee',
  `source_id` int(10) unsigned DEFAULT NULL,
  `offset` int(10) unsigned DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  `type` enum('file','folder') DEFAULT NULL,
  `record_id` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `unq__session_id__source_type__source_id__offset` (`session_id`,`source_type`,`source_id`,`offset`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_index_data`
--

LOCK TABLES `exp_assets_index_data` WRITE;
/*!40000 ALTER TABLE `exp_assets_index_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_index_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_rackspace_access`
--

DROP TABLE IF EXISTS `exp_assets_rackspace_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_rackspace_access` (
  `connection_key` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `storage_url` varchar(255) NOT NULL,
  `cdn_url` varchar(255) NOT NULL,
  PRIMARY KEY (`connection_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_rackspace_access`
--

LOCK TABLES `exp_assets_rackspace_access` WRITE;
/*!40000 ALTER TABLE `exp_assets_rackspace_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_rackspace_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_selections`
--

DROP TABLE IF EXISTS `exp_assets_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_selections` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(6) unsigned DEFAULT NULL,
  `col_id` int(6) unsigned DEFAULT NULL,
  `row_id` int(10) unsigned DEFAULT NULL,
  `var_id` int(6) unsigned DEFAULT NULL,
  `element_id` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `sort_order` int(4) unsigned DEFAULT NULL,
  `is_draft` tinyint(1) unsigned DEFAULT '0',
  KEY `file_id` (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `col_id` (`col_id`),
  KEY `row_id` (`row_id`),
  KEY `var_id` (`var_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_selections`
--

LOCK TABLES `exp_assets_selections` WRITE;
/*!40000 ALTER TABLE `exp_assets_selections` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_assets_sources`
--

DROP TABLE IF EXISTS `exp_assets_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_assets_sources` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_type` varchar(2) NOT NULL DEFAULT 's3',
  `name` varchar(255) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_sources`
--

LOCK TABLES `exp_assets_sources` WRITE;
/*!40000 ALTER TABLE `exp_assets_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_assets_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_captcha`
--

LOCK TABLES `exp_captcha` WRITE;
/*!40000 ALTER TABLE `exp_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_field_data`
--

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_fields`
--

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_posts`
--

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` varchar(8) DEFAULT NULL,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_18` text,
  `field_ft_18` tinytext,
  `field_id_19` text,
  `field_ft_19` tinytext,
  `field_id_20` text,
  `field_ft_20` tinytext,
  `field_id_21` int(10) DEFAULT '0',
  `field_dt_21` varchar(50) DEFAULT NULL,
  `field_ft_21` tinytext,
  `field_id_24` text,
  `field_ft_24` tinytext,
  `field_id_25` text,
  `field_ft_25` tinytext,
  `field_id_26` text,
  `field_ft_26` tinytext,
  `field_id_27` text,
  `field_ft_27` tinytext,
  `field_id_28` text,
  `field_ft_28` tinytext,
  `field_id_29` text,
  `field_ft_29` tinytext,
  `field_id_30` text,
  `field_ft_30` tinytext,
  `field_id_33` text,
  `field_ft_33` tinytext,
  `field_id_34` text,
  `field_ft_34` tinytext,
  `field_id_35` text,
  `field_ft_35` tinytext,
  `field_id_36` text,
  `field_ft_36` tinytext,
  `field_id_37` text,
  `field_ft_37` tinytext,
  `field_id_38` text,
  `field_ft_38` tinytext,
  `field_id_39` text,
  `field_ft_39` tinytext,
  `field_id_40` text,
  `field_ft_40` tinytext,
  `field_id_41` text,
  `field_ft_41` tinytext,
  `field_id_42` text,
  `field_ft_42` tinytext,
  `field_id_44` text,
  `field_ft_44` tinytext,
  `field_id_45` text,
  `field_ft_45` tinytext,
  `field_id_46` text,
  `field_ft_46` tinytext,
  `field_id_47` varchar(8) DEFAULT NULL,
  `field_ft_47` tinytext,
  `field_id_48` text,
  `field_ft_48` tinytext,
  `field_id_49` text,
  `field_ft_49` tinytext,
  `field_id_56` text,
  `field_ft_56` tinytext,
  `field_id_57` text,
  `field_ft_57` tinytext,
  `field_id_58` text,
  `field_ft_58` tinytext,
  `field_id_59` text,
  `field_ft_59` tinytext,
  `field_id_60` text,
  `field_ft_60` tinytext,
  `field_id_61` text,
  `field_ft_61` tinytext,
  `field_id_62` text,
  `field_ft_62` tinytext,
  `field_id_63` text,
  `field_ft_63` tinytext,
  `field_id_64` text,
  `field_ft_64` tinytext,
  `field_id_65` text,
  `field_ft_65` tinytext,
  `field_id_66` text,
  `field_ft_66` tinytext,
  `field_id_67` int(10) DEFAULT '0',
  `field_dt_67` varchar(50) DEFAULT NULL,
  `field_ft_67` tinytext,
  `field_id_68` text,
  `field_ft_68` tinytext,
  `field_id_69` text,
  `field_ft_69` tinytext,
  `field_id_70` text,
  `field_ft_70` tinytext,
  `field_id_71` text,
  `field_ft_71` tinytext,
  `field_id_72` text,
  `field_ft_72` tinytext,
  `field_id_73` text,
  `field_ft_73` tinytext,
  `field_id_74` text,
  `field_ft_74` tinytext,
  `field_id_75` text,
  `field_ft_75` tinytext,
  `field_id_76` text,
  `field_ft_76` tinytext,
  `field_id_77` text,
  `field_ft_77` tinytext,
  `field_id_78` text,
  `field_ft_78` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data`
--

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
INSERT INTO `exp_channel_data` VALUES (2,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(3,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(4,1,1,'In 2010, we committed to providing 100,000 hearing aids a year to those in need','none','{filedir_1}HERO-Commitment_to_Action_Film.jpg','none','http://www.youtube.com/watch?v=ScjOkoueDYg','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(5,1,1,'To truly make an impact, our efforts must be sustainable','none','{filedir_1}HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','none','http://www.youtube.com/watch?v=W50L7eNGT2U','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(6,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Celebrity_Film.jpg','none','Watch','none','Celebrity Support ','none','{filedir_1}CAROUSEL-Celebrity_Film.jpg','none','http://www.youtube.com/watch?v=03KTq85Y3wM','none','','none','','none','<p>Starkey Hearing Foundation is fortunate to have hundreds of high-profile friends to help us raise awareness and generate support for the gift of hearing.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(7,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','Watch ','none','Listen Carefully in Schools','none','{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','http://www.youtube.com/watch?v=rlyH-ZcCf7o','none','','none','','none','<p>Disney and Nickelodeon stars Chris and Kyle Massey joined Grammy Award-winning songwriter/producer Dallas Austin to educate a crowd of more than 1,400 students at our launch event. The music and sound experience inspired not only a dance contest but also sent the right message: Your hearing is fragile. So don’t listen loudly. Listen Carefully.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(8,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','See the Process ','none','Recycling Sound','none','{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','http://www.youtube.com/watch?v=tF-9R4UUWa8','none','Learn More ','none','http://www.starkeyhearingfoundation.org/programs/recycle-hearing-aids/','none','<p>Every year thousands of used hearing aids are donated to our Hear Now program people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(9,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We Are Now ','none','{filedir_1}icon_now.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(10,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','28.6','none','77.2','none','India ','none','<p>The mission team is excited to be back in India working with our Starkey India team to give the gift of hearing across four cities.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(11,1,2,'',NULL,'',NULL,'',NULL,' ','xhtml',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'Hearing Mission Statement Here. ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(13,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_Philippines_.jpg','none','Hearing Missions','none',1387524240,'','none','<p><b>Caring for Our Friends in the Philippines</b></p>\n\n<p>&nbsp; Over 35 days, four countries and 10 cities, the hearing mission team finished the year strong, fitting more than 12,000 people. Crisscrossing Asia, we brought the gift of hearing to India, Cambodia, China and completed our tour with an impactful, four-city hearing mission in the Philippines.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; Typhoon Haiyan struck the Philippines three weeks before our long-scheduled hearing mission was set to take place. For a second after that tragedy, we paused to consider how to help, and we decided that the best thing we could do was go, as planned, to give the gift of hearing. Joined by boxing champion Manny Pacquiao, fresh from his victory in China, and singer Jessica Sanchez, we brought our love and care to more than 5,000 people in need.</p>\n\n<p>&nbsp; Excited to be as hands-on as possible with the patients, Sanchez worked and traveled with the team for the entire hearing mission. Her first day on the job she helped reconnect 88-year-old Maria Solis Sogon with her 12 children, 20 grandchildren and 5 great-grandchildren. Overwhelmed with gratitude, Maria broke into song to Sanchez’s delight. By the end of the hearing mission, it was Sanchez who was moved to song by all of the incredible people and lives she was able to help change. She performed for a captivated audience, giving many of them their first experience of music.</p>\n\n<p>&nbsp; From General Santos to Lipa City to Batangas to Manila, the team was inspired by the resilience of the Philippines. While many may have been knocked down by the impact of Typhoon Haiyan, from what we experienced, their spirit has not been broken. It will not take long for the Philippines to be just as strong, if not stronger than it was before.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; <b>Happy Holidays!</b></p>\n\n<p>&nbsp; With the holidays upon us, the team is busy preparing for another year of changing lives, while also spending some quality time with the people we love. From the Starkey Hearing Foundation family to yours, we wish you all love, light and peace this holiday season. Thank you for all you do to support our efforts around the world. May 2014 bring you inspiration and adventure!</p>\n\n<p>&nbsp; As you spend time with your friends and families this holiday season, remember the connecting power of hearing.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; <a href=\"https://action.starkeyhearingfoundation.org/\" title=\"\">Pledge your support</a> today and help us give that same connection to thousands of families around the world in 2014.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(14,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}Dave_Fabry.jpg','none','Hearing Missions','none',1388215620,'','none','<p>Dave Fabry, Ph.D. audiologist and Starkey Hearing Technologies&rsquo; Vice President of Audiology and Professional Services, has dedicated his life to hearing care. As a young man in college he was a pre-veterinary medicine major, and his love of animals led him to a hearing lab where scientists were studying the damage from noise exposure in chinchillas. There he found his calling. Since then Fabry has earned a doctorate in audiology from the University of Minnesota, published more than 50 articles and been a leader in the field for more than 30 years. However, he has never let go of his interest in noise exposure and raising awareness on how to prevent hearing loss. He has channeled this passion into our Listen Carefully campaign, and we sat down with him to gain a deeper understanding of the challenges and solutions surrounding preventable hearing loss.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>How important is hearing protection?</strong></p>\n\n<p>Hearing protection is critical for all age groups. Look at the history of OSHA and hearing protection in the workplace &ndash; we have done a very good job with occupational noise exposure in the workplace. However, recreational noise exposure has become an increasing problem for both adults and children, which could include anything from concerts to loud restaurants and bars to firearms.</p>\n\n<p>We don&rsquo;t often think of children as being at risk for noise exposure, but in fact, it is a huge concern and an emerging problem in the United States with upwards of 20 percent of teens estimated to suffer from measurable hearing loss. We have to do better at protecting kids from preventable hearing loss.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Most of us have been told to wear hearing protection at concerts or to turn down the volume on our headphones to protect our hearing, but what are some of the lesser-known areas where hearing protection should be used?</strong></p>\n\n<p>When looking at dangerous levels of noise exposure, it is all about the intensity of the sound and the duration of exposure. Any sound that is in excess of 85 dB, with extended exposure, will harm your hearing.</p>\n\n<p><span style=\"line-height:1.6em\">There are some really strange places that we don&rsquo;t often think of where dangerous levels of noise exposure can occur. Dentists, for example, are at high risk for noise exposure, due to the sound of the high-frequency drills they use daily. Likewise, the barista at your local coffee shop is at risk for noise exposure due to the sound of the grinder and the high-frequency sound of many cappuccino machines.</span></p>\n\n<p>In terms of teenagers, one of the places we don&rsquo;t often think of is the school band. The students playing in those bands could be at risk for noise exposure, particularly percussionists and piccolo players and those positioned near them. Violinists are also at a high risk for hearing loss because as they play they place their ears directly against the instrument.</p>\n\n<p>It is important for all of us to take active measures to protect against preventable hearing loss. In my own life I use noise-cancelling headphones on airplanes when I travel to protect against the sounds produced during take off and landing. I also use musicians earplugs when I go to concerts to reduce the sound across the entire frequency spectrum without impacting the sound of the music. I wear those same earplugs when I ride my motorcycle so I can adequately hear other motorists around me while also protecting my hearing. In addition, whenever I mow the grass, I wear hearing protection.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>What are the key issues surrounding noise exposure and iPods and MP3 players?</strong></p>\n\n<p>A popular test of the volume of an iPod or MP3 player is that you should never allow the volume to go over half or two-thirds the maximum. Unfortunately, this is an oversimplification because with today&rsquo;s technology it is actually the headphones that determine the output level. I don&rsquo;t want parents and teens to be lulled into a false sense of security by keeping an iPod at or below half the maximum &ndash; that could still be a level that is damaging.</p>\n\n<p>In addition, years ago, we used to recommend that if someone could stand three feet away from you and sing along with the song you are listening to, the music is too loud. But again, due to the level of technology available for headphones, this also no longer applies.</p>\n\n<p>In an ideal world, we could measure on a simulated ear the level that someone listens to an iPod, and then set the limit, but this is not practical for real-world environments. I would encourage parents to listen to the iPod through your child&rsquo;s headphones, and then set the volume at a level that is comfortable for them and not uncomfortably loud. You can also download sound level meter apps that are pretty accurate. You can then hold your child&rsquo;s headphones up to the sound meter app to get an idea of the sound level and set the volume accordingly.</p>\n\n<p>[gallery id =&nbsp;listen-carefully-gallery]</p>\n\n<p><strong style=\"line-height:1.6em\">How do you encourage your loved ones to protect their hearing?</strong></p>\n\n<p><span style=\"line-height:1.6em\">I am very particular with the level my daughter listens to music both in the car and on headphones. I always carry hearing protection with me when I go to concerts, so either my wife or my daughter will be encouraged to wear it when they are with me. I have always tried to stress the importance of protecting their hearing against recreational noise exposure.</span></p>','none','Listen Carefully','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(32,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(33,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(34,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(35,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(36,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(15,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_A_Knight.jpg','none','Hearing Missions','none',1382632260,'','none','<p><strong>A Knight and a Prince Help Kick Off Fall Missions</strong></p>\n\n<p>&nbsp; Striving for a strong finish to a record-breaking year, the mission team began its fall by spending October giving the gift of hearing in <a href=\"http://www.starkeyhearingfoundation.org/missions/africa/south-africa-10-2013/\" title=\"\">South Africa</a>, <a href=\"http://www.starkeyhearingfoundation.org/missions/africa/lesotho-10-2013/\" title=\"\">Lesotho</a> and Kenya.</p>\n\n<p>&nbsp; The team started out in South Africa where partnered with Sir Richard Branson and <a href=\"http://www.virgin.com/unite\" title=\"\">Virgin Unite</a> for the third time to bring the gift of hearing to hundreds of people in need at Virgin Unite&rsquo;s Bhubezi Healthcare Clinic.</p>\n\n<p>&nbsp; Next, we headed to Lesotho. It was our first hearing mission in the country where we had another wonderful partner in <a href=\"http://sentebale.org/\" title=\"\">Sentebale</a>, a nonprofit organization co-founded by Prince Harry and Prince Seeiso of Lesotho, who participated in the fittings. Patients, ranging from 4 to 101 years old, traveled from all parts of the small, landlocked country to have their hearing assessed and be fitted for hearing aids. For many it was an opportunity to hear for the very first time.</p>\n\n<p>&nbsp; After being honored at the 13th Annual Starkey Hearing Foundation&rsquo;s <em>So the World May Hear Awards</em>Gala in July, Branson joined us to bring the gift of hearing to Virgin Unite&rsquo;s Bhubezi Healthcare Clinic. More than 300 patients from the surrounding Bushbruckridge community were fit with hearing aids. Branson and the Virgin Unite team worked closely with us to ensure each patient left the mission with a new connection to sound and life.</p>\n\n<p>&nbsp; Discussing his continued dedication to the work of the Foundation, Branson said, &ldquo;I admire the Starkey Hearing Foundation for its tireless effort to transform lives with the gift of hearing. I hope it will inspire others, businesses and nonprofits alike, to seek new, innovative and entrepreneurial ways of making a difference in people&rsquo;s lives.&rdquo;</p>\n\n<p>&nbsp; Once the team wrapped up a successful mission in South Africa, we headed to our first mission in Lesotho with new partner <a href=\"http://sentebale.com\">Sentebale</a>.</p>\n\n<p>&nbsp; Prince Seeiso joined the team to help fit hearing aids and open up the world of sound to many living in silence and isolation. &ldquo;I have seen children wanting to talk to each other, and their eyes tell a thousand stories,&rdquo; Prince Seeiso said. &ldquo;On behalf of myself, Prince Harry and Sentebale, a big thanks goes to Starkey Hearing Foundation.&rdquo;</p>\n\n<p>&nbsp; The team is currently in Kenya, where we have traveled from Mombasa to Eldoret to one of the largest slums in Africa, Kibera, to Meru, all the while reflecting caring and connecting communities with the gift of hearing.</p>\n\n<p>&nbsp; <strong>2013 Gala Highlights</strong></p>\n\n<p>&nbsp; Whether it was the bald eagle soaring over the crowd as Nita Whitaker sang &ldquo;AmazingGrace,&rdquo; impassioned speeches from twin brothers Ashton and Michael Kutcher, or special surprise guests for Bill Austin, the 2013 <em>So the World May Hear</em> Awards Gala was an evening we will never forget. Our latest film brings you all the highlights and magic from this year&rsquo;s Gala.</p>\n\n<p>&nbsp; <a href=\"http://youtu.be/KD8h8zNpd48\" title=\"\">Watch as the world comes together to celebrate the power of caring.</a></p>\n\n<p>&nbsp; <strong>Listen Carefully with Tony Hawk and the Minnesota Vikings</strong></p>\n\n<p><span style=\"line-height:1.6em\">&nbsp; October is National Protect Your Hearing Month, and we&rsquo;ve been encouraging people toturn down the volume and Listen Carefully with Chris and Kyle Massey at skateboarding legend Tony Hawk&rsquo;s 2013 </span><a href=\"http://standupforskateparks.org/\" style=\"line-height: 1.6em;\" title=\"\">Stand Up for Skateparks</a><span style=\"line-height:1.6em\"> and with the help of the </span><a href=\"http://www.starkeyhearingfoundation.org/vikings/\" style=\"line-height: 1.6em;\" title=\"\">Minnesota Vikings</a><span style=\"line-height:1.6em\">.</span></p>\n\n<p>&nbsp; Remember: Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; Chris and Kyle Massey joined our team as we spread the word about the importance of protecting your hearing at the 2013 Stand Up for Skateparks, and we were encouraged to see the message stick as much of the audience wore the hearing protection we distributed during a headlining performance by Modest Mouse.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; The Minnesota Vikings have teamed up with our Listen Carefully campaign to encourage fans to protect their hearing, and they are donating $500 to the Foundation for every touchdown scored this season by Adrian Peterson or Greg Jennings. Vikings fans should also be on the look out for Listen Carefully hearing protection at all home games.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(16,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Hearing Missions','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(17,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>​testing</p>','none','','xhtml','','xhtml','','xhtml','',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(18,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(19,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Our new docuseries - coming soon!&nbsp;</p>\n\n<p>[gallery id=\"testing-galleries\"]</p>','none','<h1>Listen Carefully</h1>\n\n<p>Research shows that 1 in 8 children and teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures&ndash;such as lowering the volume&ndash;are taken.</p>\n\n<p>The program combines music and education to raise awareness about the fragility of hearing and the dangers of exposure to high decibel sounds.&nbsp;This year Starkey Hearing Foundation expanded Listen Carefully to offer educational support to more than 16,000 teachers and nearly 500,000 students nationwide.</p>\n\n<p>[gallery id=\"listencarefully\"]</p>\n\n<h1>Make a Difference&nbsp;</h1>\n\n<p>Start with yourself. Your family. Your friends. Because you understand the transformative, interconnecting power of hearing. Because you know that 1 in 5 American teenagers has hearing loss-meaning we&rsquo;re losing our hearing faster, today, than our parents or grandparents did.</p>\n\n<p>[gallery id=\"listencarefully2\"]</p>\n\n<p>&nbsp;</p>\n\n<h1>Educate Yourself&nbsp;</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mollis suscipit arcu, vel congue ante dictum at. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean ac adipiscing lacus, vitae volutpat nulla. Nullam enim purus, gravida et purus placerat, pretium scelerisque dui. Donec diam turpis, consequat at feugiat at, accumsan ac libero. Vivamus aliquam imperdiet semper. Pellentesque ultricies blandit arcu ut volutpat. Sed auctor sapien massa, a facilisis sapien suscipit non.</p>\n\n<p>Pellentesque vestibulum ligula vitae sem porta lobortis. Sed vitae pharetra elit, at mattis dui. Vivamus quis sagittis lacus, ut imperdiet nunc. Sed a vulputate metus. Maecenas ac augue metus. Aliquam in lacus at ipsum scelerisque interdum quis in neque. Aliquam velit lacus, porta quis sem nec, laoreet ultricies quam. Praesent eleifend volutpat accumsan. Vivamus eu eleifend magna. Suspendisse vitae ligula non ligula accumsan molestie.</p>\n\n<p>[gallery id=\"listencarefully3\"]</p>','none','<p>Starkey Hearing Foundation has provided more hearing help to people in the United States than to any other country. We do this through domestic missions and also Hear Now, our application-based program that provides hearing help to low-income Americans. Each person we help is fit with new, top-of-the-line digital hearing aids that are customized to their hearing loss.&nbsp;</p>\n\n<p>If you or someone you know is struggling with hearing loss and unable to afford hearing aids, call 1-800-328-8602 or complete the form below, and a Hear Now representative will be in touch with you.&nbsp;</p>\n\n<p>If you have already spoken with a representative and need an application, you can download one here:</p>\n\n<p>[gallery id=\"hearnow\"]</p>','none','<p>Every year thousands of hearing aids are donated to our Hear Now program from hearing professionals and other people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation. However, the journey from donation to the mission field is an absolute labor of love.&nbsp;</p>\n\n<p>[gallery id=\"hearingaidrecycling\"]</p>','none','',NULL,NULL,NULL,'',NULL,'<p>Starkey Hearing Foundation&rsquo;s commitment to global hearing health begins right here at home.&nbsp;Along with our worldwide missions, our national programs contribute to an entire system of care.&nbsp;Everyone can make a difference in the lives of those across the world or just next-door. Together, we can create a movement that brings peace and understanding through the gift of hearing.</p>','none','programs@starkeyfoundation.org','none','','none','{filedir_2}pdf_download_tes.pdf','none','{filedir_2}pdf_download_tes.pdf','none',' ','xhtml',' ','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(20,1,1,'Hearing Foundation has provided more hearing help to people in the United States than to any other country','none','{filedir_1}HERO-Vikings_Mission-IMG_6312.jpg','none','http://www.starkeyhearingfoundation.org/programs/hear-now/)','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(21,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}September_Newsletter.jpg','none','News','none',1378791720,'','none','<p>Special Olympics Athletes Receive the Gift of Hearing</p>\n\n<p>After the team returned from fitting more than 10,000 people in&nbsp;Peru&nbsp;and&nbsp;Mexico, our campus was flooded with inspiration when 22 Special Olympics Minnesota athletes and their families arrived for a homegrown mission. The Foundation has partnered with Special Olympics Minnesota on its Healthy Hearing Athletes Initiative, and this mission kicked off what we hope will become a long and life-changing collaboration that will open up the world of sound to all Special Olympics athletes in need. Each athlete was fit with top-of-the-line, customized hearing aids that opened up the world of sound like never before.</p>\n\n<p>Discussing the significance of this mission, Bill Austin said, &ldquo;We don&rsquo;t believe in disabilities. We believe in ability. Everybody has it, and we have to find it and use it and maximize it.&rdquo;</p>\n\n<p>Former Minnesota Viking Matt Blair was also on hand to support the athletes, including his good friend Katie Timmer. She has been participating in Special Olympics for more than 30 years and met Blair at a golf tournament. Over the years, Blair has become Timmer&rsquo;s biggest fan. Unfortunately, She suffered from a hearing loss that had begun to affect her performance, but once she received the gift of hearing, she couldn&rsquo;t wait to get back out on the golf course.</p>\n\n<p>Special Olympics president, Dave Dorn, said the partnership with the Foundation would make a huge difference in each of the athlete&rsquo;s lives.</p>\n\n<p>&ldquo;It&rsquo;s a&nbsp;confidence&nbsp;builder,&rdquo; Dorn said. &ldquo;They can be engaged in conversations and hear the world around them. All of a sudden they are much more participatory and active in their surroundings because they can hear what&rsquo;s going on.&rdquo;</p>\n\n<p>The mission team is currently on its way to South Africa which will be followed by missions in Lesotho and Kenya.</p>\n\n<p>The Power of Partnerships</p>\n\n<p>President Bill Clinton and Chelsea Clinton once again joined the team on a recent mission swing through in Zambia, Tanzania and Rwanda to see our 1 million hearing aid commitment in action. Our latest film showcases the power of partnerships in providing the gift of hearing and tackling some of the world&rsquo;s most challenging issues.</p>\n\n<p>Watch as powerful organizations come together to create lasting change.</p>\n\n<p>Join us for a Hearing Protection Twitter Chat!</p>\n\n<p>October is National Protect Your Hearing Month! Research shows that 1 in 5 teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures &ndash; such as lowering the volume &ndash; are taken.</p>\n\n<p>Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</p>\n\n<p>Join us on Twitter Thursday, October 3, from 12-1 p.m. CDT as Starkey Hearing Foundation and Starkey Hearing Technologies discuss ways to protect your hearing and prevent hearing loss!</p>\n\n<p>If you&rsquo;re new to Twitter chats,&nbsp;here&rsquo;s an overview of how it works&hellip;</p>\n\n<p>Commit Today</p>\n\n<p>Pledge your support today&nbsp;and help us change a life during our upcoming missions in South Africa or Lesotho.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(22,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','Experience More','none','Gift of Hearing in Peru ','none','{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','','none','','none','','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(48,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We were Yesterday','none','{filedir_1}icon_stories.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(31,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(23,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}PeaceinWestBank.jpg','none','News','none',1381950660,'','none','<p>Starkey Hearing Foundation&nbsp;is excited to be heading back to the West Bank soon for an upcoming hearing mission. Our work in the region has shown us how hearing brings people together and serves as a vehicle for peace and understanding.</p>\n\n<p>We wanted to share some feedback from a recent mission as we currently prepare for the next one.</p>\n\n<p>&ldquo;Before the mission &ndash; my first &ndash; I was so excited and really didn&rsquo;t know what to expect. Now I can definitely&nbsp;say it was not like anything I had done before. I have lived in this conflict all my life, and today, for the first time I met my neighbors who greeted me with nothing but love. I was amazed to see all the happy faces and know that my small efforts could give someone so much joy. I hope that this mission will take us one step closer to peace, and I hope it won&rsquo;t be the last.&rdquo;</p>\n\n<p>- Chen Cohen</p>\n\n<p>Our local partners have been hard at work, completing phase one by identifying patients and taking impressions. We look forward to contributing to peace building by continuing to foster connections between people and across cultures through the gift of hearing. Check out the photos below to see the preparation.</p>\n\n<p><img alt=\"\" src=\"{filedir_1}westbank2.jpeg\" style=\"height:250px; width:333px\" />&nbsp;</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(38,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Program','none','{filedir_1}icon_program.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(39,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Stories','none','{filedir_1}icon_stories.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(40,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Video ','none','{filedir_1}icon_video.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(41,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Gallery','none','{filedir_1}icon_gallery.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(42,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','44.8546856	','none','-93.47078599999998','none','Eden Prairie, Minnesota ','none','<p>Chris and Kyle Massey joined our team as we spread the word about the importance of protecting your hearing at Tony Hawk&rsquo;s 2013 Stand Up for Skateparks.&nbsp; We were encouraged to see the message stick as the audience wore the hearing protection we distributed during a headlining performance by Modest Mouse.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.starkeyhearingfoundation.org/programs/listen-carefully/ ','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Tony_Hawk_Event.JPG','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(51,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}PoweringInspiration_.jpg','none','Hearing Missions','none',1378758960,'','none','<h2>Katie Timmer is a multi-talented fireball of energy who has been inspiring others with her athletic ability through Special Olympics for more than 30 years.</h2>\n\n<p><span style=\"line-height:1.6em\">Her aptitude&nbsp;for sports has led her to swimming, golf, bocce ball, track and field and bowling, and it has also garnered the attention of sports stars like Tiger Woods and Matt Blair. Her mother and coach Pat expressed great pride in her daughter saying, &ldquo;The minimum&nbsp;age for participating in the Special Olympics is eight, and Katie just counted down the days until her eighth birthday when she could become a part of this incredible organization.&rdquo;</span></p>\n\n<p>However, Katie&rsquo;s path to success has not been without some extraordinary challenges caused by hearing loss. Due to Katie&rsquo;s high pain tolerance, as a child she suffered many ear infections that went undetected. In addition, her love of swimming created issues with swimmer&rsquo;s ear and a recurring need for tubes in her ears. After several surgeries, Katie and her family had resigned themselves to the fact that her right ear could be treated with a hearing aid, but she would never hear out of her left ear again. Katie learned to adapt, but her mother always felt that if she could only have the use of both of her ears, she wouldn&rsquo;t have to struggle so much to excel.</p>\n\n<p><span style=\"line-height:1.6em\">At our recent Special Olympics mission in Eden Prairie, Minnesota, Bill Austin gave Katie the gift of hearing in BOTH of her ears. Shocked and overjoyed, Katie and her mother expressed their amazement and gratitude&nbsp;in a recent video. Check it out!</span></p>','none','SHF Team ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(25,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(26,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(27,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(28,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(29,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(47,1,1,'Learn all about the homepage slider ','none','{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','www.starkey.com','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(49,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','6.1731','none','35.7419','none','Dodoma, Tanzania ','none','<p>Whether its&rsquo; projects in housing, education or clean water, , hearing is our vehicle to do so much more. It brings us to a region to help affect greater change, but in order to do that we need strong partners.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=OJ4W9zzjgII','none','Watch Video ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(50,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}COVER_pianoboy_cc.jpg','none','Learn More ','none','Testing out the Bottom Carousel ','none','{filedir_1}COVER_pianoboy_cc.jpg','none','http://www.youtube.com/watch?v=OJ4W9zzjgII','none','Read More ','none','','none','<p>Read here to find out about starkey hearing missions&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(52,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(53,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none'),(54,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}Blog_A_Knight.jpg','none','CNN ','none','<p><span style=\"line-height:1.6em\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam diam, vitae mollis neque egestas sed. In eu tellus blandit, pellentesque mi non, venenatis velit. Phasellus malesuada tempor tellus quis rhoncus. Vivamus condimentum eget mauris at pharetra. Morbi a ipsum ornare, imperdiet justo sed, pulvinar enim. Nam sem turpis, dapibus quis felis ac, consequat dignissim odio. Morbi non hendrerit nisl, eu accumsan justo. Maecenas vel metus urna.</span></p>\n\n<p>Fusce a varius nibh, vel lacinia elit. Nulla facilisi. Nunc id sollicitudin turpis. Etiam elit nisi, volutpat eu placerat ut, volutpat vitae magna. Nunc porta et massa non sodales. Curabitur imperdiet non elit eu pellentesque. Nullam iaculis orci lobortis nisl iaculis luctus. Duis placerat dolor sed tincidunt vestibulum. Aenean lacinia dictum massa molestie iaculis. Vivamus tortor orci, pharetra at ante et, euismod mattis magna. Ut cursus arcu vitae molestie feugiat.</p>\n\n<p>Etiam hendrerit justo sem, id posuere ante pretium venenatis. Nulla et est a lectus commodo pulvinar malesuada egestas lorem. Pellentesque mauris ante, viverra ac ornare et, condimentum congue eros. Donec elementum lectus tortor. Vestibulum ante nulla, hendrerit a massa id, pretium convallis neque. Donec mauris orci, blandit vitae consectetur in, feugiat eu nulla. Donec sed ipsum aliquam, congue eros a, semper sem. Praesent vehicula sodales nisi, ac consequat dolor euismod eu.</p>\n\n<p>Duis eu diam ac turpis iaculis bibendum. Aliquam ornare diam id erat condimentum porttitor. Integer fermentum, nunc in dapibus sagittis, neque eros vestibulum felis, ac condimentum est lectus ornare risus. Nulla facilisis quam id leo porttitor vestibulum. Etiam feugiat dui non iaculis rhoncus. Aliquam felis eros, vulputate eget feugiat vitae, interdum at velit. Nam sodales lorem et risus consequat, non interdum elit malesuada. In sollicitudin commodo aliquet. Duis elementum viverra lorem a vestibulum. Sed varius leo vitae mauris ultricies consectetur. Nulla facilisi. Aliquam semper non enim eu suscipit.</p>\n\n<p>Duis eget convallis tortor. Integer augue mauris, vehicula vel justo et, semper laoreet tellus. Integer lobortis turpis eu dolor egestas, vulputate lobortis magna tempor. Proin sit amet condimentum justo. Donec dictum, elit nec interdum consequat, neque est molestie tortor, et interdum ligula nibh in leo. Morbi et aliquam ipsum, ultrices pellentesque sapien. Praesent rhoncus nibh quis urna volutpat porttitor. Sed sit amet arcu feugiat, congue turpis et, molestie elit. Fusce ut quam non augue sagittis lacinia sed eu risus. Sed venenatis nisl risus, eu cursus magna bibendum sit amet. Vivamus pulvinar sit amet augue interdum semper. Suspendisse tempor accumsan massa quis fringilla.</p>\n\n<p>Quisque quam mi, sodales ut diam id, imperdiet egestas orci. Pellentesque mattis urna vitae pulvinar facilisis. Maecenas sed lorem porttitor, tristique massa vel, semper dui. Maecenas vestibulum magna et lacus lobortis pulvinar. Aliquam erat volutpat. Nullam nisl arcu, euismod id elit in, scelerisque placerat diam. Pellentesque nec faucibus nulla.</p>\n\n<p>Nulla facilisi. Nunc eget turpis posuere, pretium lectus a, interdum arcu. Duis ultrices orci libero, non molestie mauris vulputate et. Mauris placerat pellentesque ligula, pellentesque dapibus tellus commodo sed. Nunc commodo, tellus venenatis placerat fringilla, purus urna hendrerit enim, eget euismod sapien ligula et justo. In at sem a justo fringilla semper. Sed interdum vestibulum nisi, et lacinia lorem semper eu. Aliquam ultrices ullamcorper orci malesuada aliquam. Cras a nisl molestie, volutpat sem ut, interdum lorem. Duis in iaculis diam, eget rhoncus purus. Donec ut vulputate nisi.</p>\n\n<p>Mauris blandit justo mi, id fringilla neque viverra at. Phasellus a gravida nunc. Duis posuere ipsum id ante laoreet sodales. Suspendisse auctor justo orci, et auctor urna congue sed. Nullam eget eleifend est. Nulla ac adipiscing enim. Phasellus at tincidunt nisl. Aliquam ac cursus justo. Sed pharetra nibh et eleifend tincidunt. Nam luctus, ligula at facilisis vehicula, purus lacus viverra arcu, non congue nulla dui id turpis. Nunc est mi, congue eget sem id, scelerisque egestas risus. Phasellus hendrerit est non ante mollis feugiat. Donec adipiscing enim augue. Integer tellus mauris, porta at ultrices ut, elementum eu dui</p>','none','{filedir_2}pdf_download_tes.pdf','none','press@starkeyfoundation.org','none'),(55,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}CAROUSEL-William_F._Austin_Legacy_Film.jpg','none','http://www.youtube.com/watch?v=CvYDRtPh46Q','none','{filedir_1}cnnlogo.png','none',1391721420,'','none','','none','','none','','none','','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(56,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_A_Knight.jpg','none','','none','{filedir_1}Clinton_Foundation_Logo.png','none',1391388900,'','none','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam diam, vitae mollis neque egestas sed. In eu tellus blandit, pellentesque mi non','none','Read More ','none','http://www.clintonfoundation.org/','none','Clinton Foundation ','none','false','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(57,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','none','http://www.youtube.com/watch?v=OJ4W9zzjgII','none','{filedir_1}cnnlogo.png','none',1391475420,'','none','','none','','none','','none','','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL);
/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'homepage_feature_subtitle','Subtitle ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(2,1,1,'homepage_feature_splash_image','Hero Image ','W: browser width H: 600px ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(3,1,1,'homepage_feature_link','CTA Link','Insert URL that CTA will link out to, if feature is a video, insert video URL ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(4,1,2,'homepage_pictograms','homepage_pictograms','W 300px H: 180px','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(27,1,6,'homepage_map_category_title','Homepage Map Pin Category','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(5,1,3,'homepage_map_item_category','Map Pin Category','Select the pin type you want to display for this item','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI2Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7aTowO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(6,1,3,'homepage_map_item_lat','Latitude','Enter latitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(7,1,3,'homepage_map_item_lon','Longitude ','Enter Longitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,3,'homepage_map_item_location','Item Location','Enter location name if you want this to appear on map item i.e \"Los Angeles, CA\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(9,1,3,'homepage_map_item_content','Map Item Text ','Insert body copy here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',10,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(78,1,11,'press_release_contact','press_release_contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(77,1,11,'press_release_pdf_download','press_release_pdf_download','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(76,1,11,'press_release_body_text','press_release_body_text','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(75,1,11,'press_release_source','press_release_source','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(74,1,11,'press_release_image','press_release_image','W: browser width H: 525px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(73,1,10,'media_mention_body_text','Detail Page Body Text ','Input if media mention has a detail page ','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(18,1,5,'blog_featured','Blog Feature','Do you want this blog to appear in the Blog featured carousel? ','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(19,1,5,'blog_image','Blog Image ','This image will serve as the thumbnail image (W: 386px H: 230px)  as well as the header image (W: browser width H: 525px) on the blog post ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(20,1,5,'blog_category','Blog Category ','','select','News\nEvents\nHear Now\nGala\nFilms\nCelebrity\nOperation Change\nHearing Missions\nListen Carefully','n',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(21,1,5,'blog_date','Blog Date ','The post will appear to be published on the selected date ','date','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(48,1,1,'homepage_feature_cta','CTA Text ','Insert two to three words for CTA Text ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(47,1,5,'blog_related_items','Related Blog Posts ','Select related posts to appear at the bottom of this entry ','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',7,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI1Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(24,1,5,'blog_content','Blog Text ','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',7,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(25,1,5,'blog_author','Blog Author ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(26,1,2,'homepage_mission_statment','homepage_mission_statment','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(28,1,6,'homepage_map_category_image','Homepage Map Pin Icon','upload files as .pngs','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(29,1,3,'homepage_map_item_cta_link','Map Item CTA URL','Enter URL you would like to link to from Map Item','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(30,1,3,'homepage_map_item_cta_text','Map Item CTA Text ','Enter 2-3 words that will display as link out on map item i.e. \"Read More\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(56,1,8,'hear_now_form_contact','Hear Now Form Contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(46,1,3,'homepage_map_item_image','Homepage Map Item Image ','Upload Image to be displayed in map item panel W: 410px H: 378px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(33,1,7,'carousel_image','Carousel Thumb','This is the thumbnail image displayed in the carousel w: 400px h: 210 px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(34,1,7,'carousel_cta','Carousel CTA ','Enter two to three words to displayed as call to action link in carousel thumb','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(35,1,7,'carousel_panel_title','Carousel Panel Title ','W: browser width H: 560 px','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(36,1,7,'carousel_panel_image','Carousel Panel Image ','This is the main image that will display in the feature area when thumb is selected W: browser width H: 560px\n￼￼','file','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(37,1,7,'carousel_video_url','Carousel Video URL','If carousel item is a video, insert video URL here ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(38,1,7,'carousel_panel_cta','Carousel Panel CTA ','Enter two to three words to be displayed as link in in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(39,1,7,'carousel_panel_link','Carousel Panel CTA Link','Add URL that CTA will link out to in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(40,1,7,'carousel_body','Carousel Panel Text ','Insert body copy to be displayed in panel overlay ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',9,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6InkiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(41,1,8,'operation_change_content','Operation Change ','Enter text for Operation Change Tab here','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(42,1,8,'listen_carefully_content','Listen Carefully','Enter text for Listen Carefully Tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(44,1,8,'hear_now_content','Hear Now ','Enter text for Hear Now tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',4,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(45,1,8,'hearing_aid_recycling_content','Hearing Aid Recycle','Enter text for Hearing Aid Recycling tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',5,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(57,1,8,'hear_now_download_copy','Hear Now Download Copy','','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(49,1,8,'program_page_leader','Page Leader','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(71,1,10,'media_mention_source','Source ','CNN or SHF Team, etc','text','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(70,1,10,'media_mention_cta_link','CTA Link','Media Mentions Link out ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(69,1,10,'media_mention_cta_text','CTA Text ','For Feature Carousel: CTA for Article Media Mentions','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(68,1,10,'media_mention_quote','Article Quote ','For Feature Carousel: Uploading an article quote will create feature with blue background and quote ','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(67,1,10,'media_mention_date','Date ','','date','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(65,1,10,'media_mention_video_url','Video URL','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(66,1,10,'media_mention_logo','Logo','W: 100 H: 100','file','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(72,1,10,'media_mention_detail_page','Detail Page ','Does this media mention need a detail page? Otherwise media mentions will link out to external article ','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',10,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(58,1,8,'hear_now_form_download_english','Hear Now Form Download English','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6Im4iO3M6MTI6Im51bV9leGlzdGluZyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(59,1,8,'hear_now_form_download_spanish','Hear Now Form Download Spanish','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6Im4iO3M6MTI6Im51bV9leGlzdGluZyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(60,1,8,'operation_change_partnerships','Operation Change Partnerships','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',10,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(61,1,8,'listen_carefully_additional_reso','Listen Carefully Additional Resouces','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',11,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(62,1,9,'item','item','Can upload Single Image or Image and Video Combo - W: browser width H: 525px. \nMulti Image/Video Galleries - W: varies H: 525px','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(63,1,10,'media_mention_feature_carousel','Feature Carousel ','Do you want this media mention to appear in the carousel at the top of the page?','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(64,1,10,'media_mention_image','Image ','This image will appear as the Image in the feature carousel (W: browser width H: 525px) overlaying a video or as thumbnail (W: 386px H: 230px) in the gallery ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czozOiJhbGwiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToibiI7czoxMjoibnVtX2V4aXN0aW5nIjtiOjA7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9');
/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_form_settings`
--

DROP TABLE IF EXISTS `exp_channel_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `require_captcha` char(1) NOT NULL DEFAULT 'n',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_form_settings`
--

LOCK TABLES `exp_channel_form_settings` WRITE;
/*!40000 ALTER TABLE `exp_channel_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_4`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_4` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_4`
--

LOCK TABLES `exp_channel_grid_field_4` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_4` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_4` VALUES (1,11,0,'{filedir_1}info_livesimpacted.jpg','{filedir_1}info_livesindirectly.jpg','{filedir_1}info_totalaids.jpg');
/*!40000 ALTER TABLE `exp_channel_grid_field_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_60`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_60` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_4` text,
  `col_id_5` varchar(60) DEFAULT '',
  `col_id_6` text,
  `col_id_7` text,
  `col_id_13` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_60`
--

LOCK TABLES `exp_channel_grid_field_60` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_60` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_60` VALUES (1,19,0,'Watch the Operation Change Docuseries ','','http://www.youtube.com/watch?v=qc6t8QE7Uxs','Watch Video','{filedir_1}COVER_pianoboy_cc.jpg'),(3,19,1,'Testing Partnerships ','','www.google.com','Read More ','{filedir_1}Blog_Philippines_.jpg');
/*!40000 ALTER TABLE `exp_channel_grid_field_60` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_61`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_61`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_61` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_8` text,
  `col_id_9` text,
  `col_id_10` varchar(60) DEFAULT '',
  `col_id_11` text,
  `col_id_12` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_61`
--

LOCK TABLES `exp_channel_grid_field_61` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_61` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_61` VALUES (1,19,0,'Fundamental Facts: Learn about hearing loss and how to prevent it.','{filedir_1}COVER_pianoboy_cc.jpg','','http://www.starkey.com/improve-your-hearing','Learn More '),(2,19,1,'Hearing News: Are musicians at greater risk for hearing loss? ','{filedir_1}_DSC0608cc.jpg','','http://www.starkey.com/','Read More '),(3,19,2,'Marlee Martin: In her own words ','{filedir_1}marleemartin.jpeg','','http://www.youtube.com/watch?v=GIapKv8Pa1c&noredirect=1','Watch Video');
/*!40000 ALTER TABLE `exp_channel_grid_field_61` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_62`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_62`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_62` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_14` text,
  `col_id_15` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_62`
--

LOCK TABLES `exp_channel_grid_field_62` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_62` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_62` VALUES (1,25,0,'{filedir_1}Screen_Shot_2014-01-31_at_12.29.23_PM.png',''),(2,26,0,'{filedir_1}listencarefullygallery2.png',''),(3,31,0,'{filedir_1}operationchange.jpg',''),(9,52,0,'{filedir_1}billaustin.jpg',''),(4,32,0,'{filedir_1}listencarefully.jpg',''),(5,33,0,'{filedir_1}listencarefully2.jpg',''),(6,34,0,'{filedir_1}listencarefully3.jpg','http://www.youtube.com/watch?v=rlyH-ZcCf7o'),(7,35,0,'{filedir_1}hearnow1.jpg',''),(8,36,0,'{filedir_1}hearingaidrecycling.jpg',''),(10,53,0,'{filedir_1}billaustin.jpg',''),(11,53,1,'{filedir_1}Blog_A_Knight.jpg',''),(12,53,2,'{filedir_1}CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','http://www.youtube.com/watch?v=OJ4W9zzjgII'),(13,53,3,'{filedir_1}CAROUSEL-Building_a_Better_Kibera.jpg','');
/*!40000 ALTER TABLE `exp_channel_grid_field_62` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_member_groups`
--

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (15,1,5,1,NULL,'172.251.100.146','October Newsletter: A Knight and a Prince Help Kick Off Fall Missions','october-newsletter-a-knight-and-a-prince-help-kick-off-fall-missions','open','y',0,0,0,0,'y','n',1390239060,'2014','01','20',0,0,20140130014619,0,0),(2,1,4,1,NULL,'172.251.100.146','PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE','president-and-chelsea-clinton-visit-site-to-see','open','y',0,0,0,0,'y','n',1390188000,'2014','01','19',0,0,20140120033810,0,0),(3,1,4,1,NULL,'172.251.100.146','Starkey Executive Director Speaks on the \'Miracle\' of Watching Patients Hear for the Very First Time','starkey-executive-director-speaks-on-the-miracle-of-watching-patients-hear','open','y',0,0,0,0,'y','n',1390189140,'2014','01','19',0,0,20140120054413,0,0),(4,1,1,1,NULL,'76.169.36.76','Commitment to Action','commitment-to-action1','open','y',0,0,0,0,'y','n',1390237920,'2014','01','20',0,0,20140120173933,0,0),(5,1,1,1,NULL,'76.169.36.76','Building Sustainable Systems of Hearing Care','building-sustainable-systems-of-hearing-care','open','y',0,0,0,0,'y','n',1390197600,'2014','01','19',0,0,20140120080637,0,0),(6,1,7,1,NULL,'172.251.100.146','Celebrity Support','celebrity-support','open','y',0,0,0,0,'y','n',1390198920,'2014','01','19',0,0,20140120064815,0,0),(7,1,7,1,NULL,'172.251.100.146','Listen Carefully in Schools','listen-carefully-in-schools','open','y',0,0,0,0,'y','n',1390199280,'2014','01','19',0,0,20140120064716,0,0),(8,1,7,1,NULL,'67.53.113.42','Recycling Sound','recycling-sound','open','y',0,0,0,0,'y','n',1390199700,'2014','01','19',0,0,20140206223235,0,0),(9,1,6,1,NULL,'172.251.100.146','Where We Are Now','where-we-are-now','open','y',0,0,0,0,'y','n',1390200540,'2014','01','19',0,0,20140120065030,0,0),(10,1,3,1,NULL,'172.251.100.146','Where we are now: India','where-we-are-now-india','open','y',0,0,0,0,'y','n',1390200600,'2014','01','19',0,0,20140120071358,0,0),(11,1,2,1,NULL,'67.53.113.42','Hearing Mission 1','we-use-hearing-as-a-vehicle-to-change-lives-around-the-world','open','y',0,0,0,0,'y','n',1390202040,'2014','01','19',0,0,20140204211358,0,0),(48,1,6,6,NULL,'67.53.113.42','Where we were yesterday','where-we-were-yesterday','open','y',0,0,0,0,'y','n',1391548500,'2014','02','04',0,0,20140204211619,0,0),(12,1,5,1,NULL,'172.251.100.146','December Newsletter: Caring for Our Friends in the Philippines','december-newsletter-caring-for-our-friends-in-the-philippines','open','y',0,0,0,0,'y','n',1390202100,'2014','01','19',0,0,20140120072346,0,0),(13,1,5,1,NULL,'76.169.36.76','December Newsletter: Caring for Our Friends in the Philippines','december-newsletter-caring-for-our-friends-in-the-philippines1','open','y',0,0,0,0,'y','n',1390202640,'2014','01','19',0,0,20140129200851,0,0),(14,1,5,1,NULL,'67.53.113.42','Dave Fabry Lives to Listen Carefully','dave-fabry-lives-to-listen-carefully','open','y',0,0,0,0,'y','n',1390202820,'2014','01','19',0,0,20140203205012,0,0),(16,1,6,1,NULL,'76.169.36.76','Hearing Missions','hearing-missions','open','y',0,0,0,0,'y','n',1390241640,'2014','01','20',0,0,20140120181456,0,0),(17,1,10,1,NULL,'76.169.36.76','Programs','programs','open','y',0,0,0,0,'y','n',1390963920,'2014','01','28',0,0,20140129025236,0,0),(18,1,11,6,NULL,'172.251.100.146','Africa 2013: Day 5 Recap','africa-2013-day-5-recap','open','y',0,0,0,0,'y','n',1391028180,'2014','01','29',0,0,20140129205002,0,0),(19,1,10,6,NULL,'67.53.113.42','Programs','programs1','open','y',0,0,0,0,'y','n',1391037960,'2014','01','29',0,0,20140204215655,0,0),(20,1,1,6,NULL,'172.251.100.146','Hear at Home','hear-at-home','open','y',0,0,0,0,'y','n',1391039400,'2014','01','29',0,0,20140130000323,0,0),(21,1,5,6,NULL,'172.251.100.146','September Newsletter: Special Olympics Athletes Receive the Gift of Hearing','september-newsletter-special-olympics-athletes-receive-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1391064120,'2014','01','29',0,0,20140130064853,0,0),(22,1,7,6,NULL,'67.53.113.42','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'y','n',1391122980,'2014','01','30',0,0,20140131193344,0,0),(23,1,5,6,NULL,'67.53.113.42','Building Momentum for Peace in the West Bank','building-momentum-for-peace-in-the-west-bank','open','y',0,0,0,0,'y','n',1391199060,'2014','01','31',0,0,20140131201931,0,0),(31,1,12,6,NULL,'67.53.113.42','OperationChange','operationchange','open','y',0,0,0,0,'y','n',1391489640,'2014','02','03',0,0,20140204191522,0,0),(32,1,12,6,NULL,'172.251.100.146','ListenCarefully','listencarefully','open','y',0,0,0,0,'y','n',1391489940,'2014','02','03',0,0,20140204050053,0,0),(25,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery','listen-carefully-gallery','open','y',0,0,0,0,'y','n',1391200080,'2014','01','31',0,0,20140131203009,0,0),(26,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery 2','listen-carefully-gallery-2','open','y',0,0,0,0,'y','n',1391200380,'2014','01','31',0,0,20140131203441,0,0),(27,1,11,6,NULL,'67.53.113.42','Starkey Hearing Foundation','starkey-hearing-foundation','open','y',0,0,0,0,'y','n',1391287200,'2014','02','01',0,0,20140206211430,0,0),(28,1,11,6,NULL,'172.251.100.146','World Leaders, Celebrities and Athletes Attend Starkey Hearing Foundation Gala','world-leaders-celebrities-and-athletes-attend-starkey-hearing-foundation-ga','open','y',0,0,0,0,'y','n',1391287740,'2014','02','01',0,0,20140201205407,0,0),(29,1,11,6,NULL,'172.251.100.146','Twins Blog: The First Starkey Mission','twins-blog-the-first-starkey-mission','open','y',0,0,0,0,'y','n',1391288040,'2014','02','01',0,0,20140201205939,0,0),(49,1,3,6,NULL,'67.53.113.42','Partnering to Reach the World','partnering-to-reach-the-world','open','y',0,0,0,0,'y','n',1391548800,'2014','02','04',0,0,20140204212224,0,0),(33,1,12,6,NULL,'172.251.100.146','ListenCarefully2','listencarefully2','open','y',0,0,0,0,'y','n',1391490060,'2014','02','03',0,0,20140204050139,0,0),(34,1,12,6,NULL,'172.251.100.146','ListenCarefully3','listencarefully3','open','y',0,0,0,0,'y','n',1391490060,'2014','02','03',0,0,20140204050246,0,0),(35,1,12,6,NULL,'172.251.100.146','HearNow','hearnow','open','y',0,0,0,0,'y','n',1391490120,'2014','02','03',0,0,20140204050329,0,0),(36,1,12,6,NULL,'172.251.100.146','HearingAidRecycling','hearingaidrecycling','open','y',0,0,0,0,'y','n',1391490180,'2014','02','03',0,0,20140204050408,0,0),(38,1,6,6,NULL,'67.53.113.42','Program','program','open','y',0,0,0,0,'y','n',1391538480,'2014','02','04',0,0,20140204183050,0,0),(39,1,6,6,NULL,'67.53.113.42','Stories','stories','open','y',0,0,0,0,'y','n',1391538600,'2014','02','04',0,0,20140204183121,0,0),(40,1,6,6,NULL,'67.53.113.42','Video','video','open','y',0,0,0,0,'y','n',1391538660,'2014','02','04',0,0,20140204183151,0,0),(41,1,6,6,NULL,'67.53.113.42','Gallery','gallery','open','y',0,0,0,0,'y','n',1391538660,'2014','02','04',0,0,20140204183311,0,0),(42,1,3,6,NULL,'67.53.113.42','Stand Up for Skateparks Learns to Listen Carefully','stand-up-for-skateparks-learns-to-listen-carefully','open','y',0,0,0,0,'y','n',1391538780,'2014','02','04',0,0,20140204184006,0,0),(47,1,1,6,NULL,'67.53.113.42','Testing Homepage Slider','testing-homepage-slider','open','y',0,0,0,0,'y','n',1391547960,'2014','02','04',0,0,20140204211434,0,0),(50,1,7,6,NULL,'67.53.113.42','Homepage Slider','homepage-slider','open','y',0,0,0,0,'y','n',1391549400,'2014','02','04',0,0,20140204213312,0,0),(51,1,5,6,NULL,'67.53.113.42','Powering Inspiration in Eden Prairie','powering-inspiration-in-eden-prairie','open','y',0,0,0,0,'y','n',1391549760,'2014','02','04',0,0,20140204213851,0,0),(52,1,12,6,NULL,'67.53.113.42','Testing Galleries','testing-galleries','open','y',0,0,0,0,'y','n',1391550900,'2014','02','04',0,0,20140204215623,0,0),(53,1,12,6,NULL,'67.53.113.42','Testing Gallery 2','testing-gallery-2','open','y',0,0,0,0,'y','n',1391551020,'2014','02','04',0,0,20140204220219,0,0),(54,1,13,6,NULL,'162.195.121.216','Starkey Press Release Test','starkey-press-release-test','open','y',0,0,0,0,'y','n',1391807640,'2014','02','07',0,0,20140207211620,0,0),(55,1,11,6,NULL,'162.195.121.216','CNN to Spotlight SHF','cnn-to-spotlight-shf','open','y',0,0,0,0,'y','n',1391807820,'2014','02','07',0,0,20140207211901,0,0),(56,1,11,6,NULL,'172.251.100.146','SHF Test Featured MM','shf-test-featured-mm','open','y',0,0,0,0,'y','n',1391820900,'2014','02','07',0,0,20140208005651,0,0),(57,1,11,6,NULL,'172.251.100.146','Media Mentions Video Test','media-mentions-video-test','open','y',0,0,0,0,'y','n',1391821020,'2014','02','07',0,0,20140208005827,0,0);
/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'homepage_features','Homepage Hero Slider ','http://starkey.ahundredyears.com/','','en',4,0,1391547960,0,'',NULL,'open',1,1,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(2,1,'homepage_content','Homepage Mission and Pictograms ','http://starkey.ahundredyears.com/','','en',1,0,1390202040,0,'',NULL,'open',2,4,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(3,1,'homepage_map_items','Homepage Map Items','http://starkey.ahundredyears.com/',NULL,'en',3,0,1391548800,0,'',NULL,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(4,1,'media_mentions_carousel','Media Mentions Carousel','http://starkey.ahundredyears.com/','','en',2,0,1390189140,0,'',NULL,'open',NULL,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(5,1,'blog','Blog','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391549760,0,'',NULL,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(6,1,'homepage_map_categories','Homepage Map Categories','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391548500,0,'',NULL,'open',6,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(7,1,'homepage_main_carousel','Homepage Bottom Carousel','http://starkey.ahundredyears.com/','','en',5,0,1391549400,0,'',NULL,'open',7,33,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(8,1,'operation_change_carousel','Operation Change Carousel','http://starkey.ahundredyears.com/','','en',0,0,0,0,'',NULL,'open',7,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(9,1,'listen_carefully','Listen Carefully','http://starkey.ahundredyears.com/',NULL,'en',0,0,0,0,'',NULL,'open',7,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(10,1,'programs','Programs','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391037960,0,'',NULL,'open',8,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(13,1,'press_releases','Press Releases','http://starkey.ahundredyears.com/',NULL,'en',1,0,1391807640,0,'',NULL,'open',11,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(11,1,'media_mentions','Media Mentions','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391821020,0,'',NULL,'open',10,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(12,1,'gallery','Gallery','http://starkey.ahundredyears.com/',NULL,'en',10,0,1391551020,0,'',NULL,'open',9,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0);
/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comment_subscriptions`
--

DROP TABLE IF EXISTS `exp_comment_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_comment_subscriptions`
--

LOCK TABLES `exp_comment_subscriptions` WRITE;
/*!40000 ALTER TABLE `exp_comment_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_comment_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comments`
--

DROP TABLE IF EXISTS `exp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_comments`
--

LOCK TABLES `exp_comments` WRITE;
/*!40000 ALTER TABLE `exp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_content_types`
--

DROP TABLE IF EXISTS `exp_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_content_types`
--

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;
INSERT INTO `exp_content_types` VALUES (1,'grid'),(2,'channel');
/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'dev@100yea.rs','10.11.0.1',1389245396,'Logged in'),(2,1,1,'dev@100yea.rs','10.11.0.1',1389245511,'Site Updated&nbsp;&nbsp;Starkey Hearing Foundation'),(3,1,1,'dev@100yea.rs','10.11.0.1',1389255875,'Logged out'),(4,1,1,'dev@100yea.rs','10.11.0.1',1389306293,'Logged in'),(5,1,1,'dev@100yea.rs','67.53.113.42',1389658121,'Logged in'),(6,1,1,'dev@100yea.rs','67.53.113.42',1390001368,'Logged in'),(7,1,1,'dev@100yea.rs','67.53.113.42',1390001560,'Field Group Created:&nbsp;Homepage Features'),(8,1,1,'dev@100yea.rs','67.53.113.42',1390001825,'Field Group Created:&nbsp;Homepage Pictograms'),(9,1,1,'dev@100yea.rs','67.53.113.42',1390001855,'Field Group Created:&nbsp;Homepage Map Items'),(10,1,1,'dev@100yea.rs','67.53.113.42',1390001975,'Field Group Created:&nbsp;Media Mentions'),(11,1,1,'dev@100yea.rs','67.53.113.42',1390002133,'Field Group Created:&nbsp;Blog'),(12,1,1,'dev@100yea.rs','67.53.113.42',1390002338,'Channel Created:&nbsp;&nbsp;Homepage Features'),(13,1,1,'dev@100yea.rs','67.53.113.42',1390002360,'Channel Created:&nbsp;&nbsp;Homepage Pictograms'),(14,1,1,'dev@100yea.rs','67.53.113.42',1390002379,'Channel Created:&nbsp;&nbsp;Homepage Map Items'),(15,1,1,'dev@100yea.rs','67.53.113.42',1390002398,'Channel Created:&nbsp;&nbsp;Media Mentions'),(16,1,1,'dev@100yea.rs','67.53.113.42',1390002408,'Channel Created:&nbsp;&nbsp;Blog'),(17,1,1,'dev@100yea.rs','67.53.113.42',1390003402,'Logged in'),(18,1,1,'dev@100yea.rs','76.169.36.76',1390174434,'Logged in'),(19,1,1,'dev@100yea.rs','172.251.100.146',1390175990,'Logged in'),(20,1,1,'dev@100yea.rs','172.251.100.146',1390178704,'Logged out'),(21,1,1,'dev@100yea.rs','76.169.36.76',1390186504,'Logged in'),(22,1,1,'dev@100yea.rs','76.169.36.76',1390186888,'Field Group Created:&nbsp;Homepage Map Categories'),(23,1,1,'dev@100yea.rs','76.169.36.76',1390187000,'Channel Created:&nbsp;&nbsp;Homepage Map Categories'),(24,1,1,'dev@100yea.rs','76.169.36.76',1390187478,'Field Group Created:&nbsp;Homepage Main Carousel'),(25,1,1,'dev@100yea.rs','76.169.36.76',1390187711,'Channel Created:&nbsp;&nbsp;Main Carousel'),(26,1,1,'dev@100yea.rs','172.251.100.146',1390188000,'Logged in'),(27,1,1,'dev@100yea.rs','76.169.36.76',1390188084,'Channel Created:&nbsp;&nbsp;Operation Change'),(28,1,1,'dev@100yea.rs','76.169.36.76',1390188095,'Channel Created:&nbsp;&nbsp;Listen Carefully'),(29,1,1,'dev@100yea.rs','76.169.36.76',1390188185,'Channel Created:&nbsp;&nbsp;Programs'),(30,1,1,'dev@100yea.rs','76.169.36.76',1390188198,'Field Group Created:&nbsp;Programs'),(31,1,1,'dev@100yea.rs','76.169.36.76',1390190779,'Logged out'),(32,1,1,'dev@100yea.rs','172.251.100.146',1390192108,'Logged in'),(33,1,1,'dev@100yea.rs','172.251.100.146',1390192138,'Logged out'),(34,1,1,'dev@100yea.rs','172.251.100.146',1390192147,'Logged in'),(35,1,1,'dev@100yea.rs','76.169.36.76',1390195561,'Logged in'),(36,1,1,'dev@100yea.rs','172.251.100.146',1390196042,'Logged out'),(37,1,1,'dev@100yea.rs','172.251.100.146',1390196559,'Logged in'),(38,1,1,'dev@100yea.rs','76.169.36.76',1390197123,'Logged in'),(39,1,1,'dev@100yea.rs','76.169.36.76',1390198922,'Custom Field Deleted:&nbsp;carousel_title'),(40,1,1,'dev@100yea.rs','76.169.36.76',1390201092,'Logged in'),(41,1,1,'dev@100yea.rs','76.169.36.76',1390202448,'Custom Field Deleted:&nbsp;blog_link'),(42,1,1,'dev@100yea.rs','76.169.36.76',1390202491,'Custom Field Deleted:&nbsp;blog_source'),(43,1,1,'dev@100yea.rs','172.251.100.146',1390208228,'Logged out'),(44,1,1,'dev@100yea.rs','76.169.36.76',1390209177,'Logged out'),(45,1,1,'dev@100yea.rs','67.53.113.42',1390237918,'Logged in'),(46,1,1,'dev@100yea.rs','76.169.36.76',1390238882,'Logged in'),(47,1,1,'dev@100yea.rs','76.169.36.76',1390241230,'Logged in'),(48,1,1,'dev@100yea.rs','67.53.113.42',1390243995,'Logged out'),(49,1,1,'dev@100yea.rs','67.53.113.42',1390850253,'Logged in'),(50,1,1,'dev@100yea.rs','67.53.113.42',1390850428,'Member profile created:&nbsp;&nbsp;taylor_joseph'),(51,1,1,'dev@100yea.rs','67.53.113.42',1390850463,'Member profile created:&nbsp;&nbsp;trinh_mai'),(52,1,1,'dev@100yea.rs','67.53.113.42',1390850495,'Member profile created:&nbsp;&nbsp;laura_hetzel'),(53,1,1,'dev@100yea.rs','67.53.113.42',1390850564,'Member profile created:&nbsp;&nbsp;randall_ward'),(54,1,1,'dev@100yea.rs','67.53.113.42',1390850671,'Screen name was changed to:&nbsp;&nbsp;Trinh Mai'),(55,1,1,'dev@100yea.rs','67.53.113.42',1390864649,'Logged in'),(56,1,1,'dev@100yea.rs','67.53.113.42',1390865172,'Logged in'),(57,1,1,'dev@100yea.rs','67.53.113.42',1390865267,'Member profile created:&nbsp;&nbsp;julie@100yea.rs'),(58,1,6,'julie@100yea.rs','67.53.113.42',1390865391,'Logged in'),(59,1,6,'julie@100yea.rs','172.251.100.146',1390879909,'Logged in'),(60,1,1,'dev@100yea.rs','76.169.36.76',1390881643,'Logged in'),(61,1,1,'dev@100yea.rs','76.169.36.76',1390888793,'Logged in'),(62,1,1,'dev@100yea.rs','76.169.36.76',1390892415,'Logged out'),(63,1,6,'julie@100yea.rs','172.251.100.146',1390934637,'Logged in'),(64,1,1,'dev@100yea.rs','67.53.113.42',1390942116,'Logged in'),(65,1,1,'dev@100yea.rs','67.53.113.42',1390942173,'Logged in'),(66,1,6,'julie@100yea.rs','172.251.100.146',1390944299,'Logged out'),(67,1,6,'julie@100yea.rs','172.251.100.146',1390946652,'Logged in'),(68,1,6,'julie@100yea.rs','172.251.100.146',1390962146,'Logged in'),(69,1,1,'dev@100yea.rs','76.169.36.76',1390963929,'Logged in'),(70,1,6,'julie@100yea.rs','172.251.100.146',1390966989,'Logged out'),(71,1,6,'julie@100yea.rs','172.251.100.146',1390970002,'Logged in'),(72,1,1,'dev@100yea.rs','76.169.36.76',1390971428,'Logged in'),(73,1,6,'julie@100yea.rs','172.251.100.146',1390974780,'Logged in'),(74,1,1,'dev@100yea.rs','76.169.36.76',1390975337,'Logged in'),(75,1,1,'dev@100yea.rs','76.169.36.76',1390975463,'Member profile created:&nbsp;&nbsp;tulika_bose'),(76,1,1,'dev@100yea.rs','76.169.36.76',1390975508,'Member profile created:&nbsp;&nbsp;megan_sheley'),(77,1,6,'julie@100yea.rs','172.251.100.146',1390977916,'Logged out'),(78,1,1,'dev@100yea.rs','76.169.36.76',1390981911,'Logged out'),(79,1,1,'dev@100yea.rs','76.169.36.76',1390983433,'Logged in'),(80,1,1,'dev@100yea.rs','76.169.36.76',1390986303,'Logged in'),(81,1,1,'dev@100yea.rs','76.169.36.76',1390987040,'Logged out'),(82,1,1,'dev@100yea.rs','76.169.36.76',1390987518,'Logged in'),(83,1,1,'dev@100yea.rs','76.169.36.76',1390990723,'Logged out'),(84,1,6,'julie@100yea.rs','172.251.100.146',1391017243,'Logged in'),(85,1,1,'dev@100yea.rs','76.169.36.76',1391018846,'Logged in'),(86,1,6,'julie@100yea.rs','172.251.100.146',1391021598,'Logged in'),(87,1,1,'dev@100yea.rs','76.169.36.76',1391022070,'Logged out'),(88,1,1,'dev@100yea.rs','76.169.36.76',1391023429,'Logged in'),(89,1,6,'julie@100yea.rs','172.251.100.146',1391024368,'Logged in'),(90,1,1,'dev@100yea.rs','76.169.36.76',1391025187,'Channel Created:&nbsp;&nbsp;Media Mentions'),(91,1,6,'julie@100yea.rs','172.251.100.146',1391025819,'Logged out'),(92,1,6,'julie@100yea.rs','172.251.100.146',1391025824,'Logged in'),(93,1,1,'dev@100yea.rs','76.169.36.76',1391025894,'Logged out'),(94,1,1,'dev@100yea.rs','76.169.36.76',1391025897,'Logged in'),(95,1,6,'julie@100yea.rs','172.251.100.146',1391026118,'Logged in'),(96,1,6,'julie@100yea.rs','172.251.100.146',1391026128,'Logged in'),(97,1,6,'julie@100yea.rs','172.251.100.146',1391026387,'Logged in'),(98,1,1,'dev@100yea.rs','76.169.36.76',1391026426,'Logged in'),(99,1,1,'dev@100yea.rs','76.169.36.76',1391031302,'Logged in'),(100,1,6,'julie@100yea.rs','172.251.100.146',1391032109,'Logged in'),(101,1,1,'dev@100yea.rs','76.169.36.76',1391037048,'Logged in'),(102,1,6,'julie@100yea.rs','172.251.100.146',1391037612,'Logged out'),(103,1,6,'julie@100yea.rs','172.251.100.146',1391038002,'Logged in'),(104,1,1,'dev@100yea.rs','76.169.36.76',1391038930,'Custom Field Deleted:&nbsp;Hear Now Title'),(105,1,1,'dev@100yea.rs','76.169.36.76',1391040145,'Logged in'),(106,1,1,'dev@100yea.rs','76.169.36.76',1391042932,'Logged out'),(107,1,1,'dev@100yea.rs','76.169.36.76',1391043035,'Logged in'),(108,1,1,'dev@100yea.rs','76.169.36.76',1391048286,'Logged out'),(109,1,1,'dev@100yea.rs','76.169.36.76',1391053349,'Logged in'),(110,1,6,'julie@100yea.rs','172.251.100.146',1391063062,'Logged in'),(111,1,6,'julie@100yea.rs','172.251.100.146',1391067363,'Logged out'),(112,1,1,'dev@100yea.rs','67.53.113.42',1391105484,'Logged in'),(113,1,1,'dev@100yea.rs','67.53.113.42',1391108060,'Logged out'),(114,1,6,'julie@100yea.rs','67.53.113.42',1391108410,'Logged in'),(115,1,6,'julie@100yea.rs','67.53.113.42',1391111693,'Logged out'),(116,1,6,'julie@100yea.rs','67.53.113.42',1391122997,'Logged in'),(117,1,1,'dev@100yea.rs','76.169.36.76',1391189536,'Logged in'),(118,1,1,'dev@100yea.rs','76.169.36.76',1391192377,'Logged in'),(119,1,1,'dev@100yea.rs','76.169.36.76',1391192642,'Custom Field Deleted:&nbsp;homepage_map_item_subtitle'),(120,1,1,'dev@100yea.rs','76.169.36.76',1391193919,'Logged in'),(121,1,6,'julie@100yea.rs','67.53.113.42',1391196783,'Logged in'),(122,1,1,'dev@100yea.rs','76.169.36.76',1391198029,'Logged out'),(123,1,1,'dev@100yea.rs','76.169.36.76',1391198055,'Logged in'),(124,1,1,'dev@100yea.rs','76.169.36.76',1391198207,'Logged in'),(125,1,1,'dev@100yea.rs','76.169.36.76',1391199105,'Field Group Created:&nbsp;Gallery'),(126,1,1,'dev@100yea.rs','76.169.36.76',1391199167,'Channel Created:&nbsp;&nbsp;Gallery'),(127,1,1,'dev@100yea.rs','76.169.36.76',1391201583,'Logged out'),(128,1,6,'julie@100yea.rs','67.53.113.42',1391206034,'Logged out'),(129,1,1,'dev@100yea.rs','76.169.36.76',1391210574,'Logged in'),(130,1,1,'dev@100yea.rs','76.169.36.76',1391211049,'Logged in'),(131,1,6,'julie@100yea.rs','67.53.113.42',1391211422,'Logged in'),(132,1,6,'julie@100yea.rs','67.53.113.42',1391215453,'Logged in'),(133,1,1,'dev@100yea.rs','76.169.36.76',1391219603,'Logged in'),(134,1,6,'julie@100yea.rs','172.251.100.146',1391287070,'Logged in'),(135,1,1,'dev@100yea.rs','76.90.138.219',1391287092,'Logged in'),(136,1,1,'dev@100yea.rs','66.215.94.39',1391287166,'Logged in'),(137,1,1,'dev@100yea.rs','66.215.94.39',1391287445,'Logged in'),(138,1,1,'dev@100yea.rs','66.215.94.39',1391288259,'Logged in'),(139,1,1,'dev@100yea.rs','66.215.94.39',1391288473,'Logged in'),(140,1,1,'dev@100yea.rs','66.215.94.39',1391288998,'Logged in'),(141,1,1,'dev@100yea.rs','66.215.94.39',1391294402,'Logged out'),(142,1,1,'dev@100yea.rs','76.169.36.76',1391315976,'Logged in'),(143,1,1,'dev@100yea.rs','76.169.36.76',1391323405,'Logged in'),(144,1,6,'julie@100yea.rs','172.251.100.146',1391381453,'Logged in'),(145,1,6,'julie@100yea.rs','172.251.100.146',1391383034,'Logged out'),(146,1,6,'julie@100yea.rs','67.53.113.42',1391449436,'Logged in'),(147,1,6,'julie@100yea.rs','67.53.113.42',1391460251,'Logged in'),(148,1,6,'julie@100yea.rs','67.53.113.42',1391463344,'Logged out'),(149,1,6,'julie@100yea.rs','67.53.113.42',1391464865,'Logged in'),(150,1,6,'julie@100yea.rs','67.53.113.42',1391469120,'Logged out'),(151,1,6,'julie@100yea.rs','67.53.113.42',1391470529,'Logged in'),(152,1,6,'julie@100yea.rs','67.53.113.42',1391473159,'Logged out'),(153,1,1,'dev@100yea.rs','67.53.113.42',1391474212,'Logged in'),(154,1,6,'julie@100yea.rs','172.251.100.146',1391489653,'Logged in'),(155,1,6,'julie@100yea.rs','172.251.100.146',1391490424,'Logged in'),(156,1,6,'julie@100yea.rs','67.53.113.42',1391538264,'Logged in'),(157,1,6,'julie@100yea.rs','67.53.113.42',1391539983,'Logged in'),(158,1,6,'julie@100yea.rs','67.53.113.42',1391540284,'Logged in'),(159,1,1,'dev@100yea.rs','67.53.113.42',1391540341,'Logged in'),(160,1,1,'dev@100yea.rs','67.53.113.42',1391540362,'Logged in'),(161,1,1,'dev@100yea.rs','67.53.113.42',1391541394,'Logged in'),(162,1,1,'dev@100yea.rs','67.53.113.42',1391541873,'Logged in'),(163,1,6,'julie@100yea.rs','67.53.113.42',1391545117,'Logged out'),(164,1,1,'dev@100yea.rs','67.53.113.42',1391545801,'Logged in'),(165,1,1,'dev@100yea.rs','67.53.113.42',1391548761,'Logged in'),(166,1,6,'julie@100yea.rs','67.53.113.42',1391552090,'Logged out'),(167,1,2,'taylor_joseph','67.53.113.42',1391552108,'Logged in'),(168,1,6,'julie@100yea.rs','67.53.113.42',1391553026,'Logged in'),(169,1,6,'julie@100yea.rs','67.53.113.42',1391557367,'Logged out'),(170,1,3,'trinh_mai','167.100.118.140',1391610838,'Logged in'),(171,1,6,'julie@100yea.rs','67.53.113.42',1391715768,'Logged in'),(172,1,6,'julie@100yea.rs','67.53.113.42',1391721251,'Logged in'),(173,1,6,'julie@100yea.rs','67.53.113.42',1391725914,'Logged in'),(174,1,6,'julie@100yea.rs','67.53.113.42',1391728405,'Logged out'),(175,1,1,'dev@100yea.rs','76.169.36.76',1391791133,'Logged in'),(176,1,1,'dev@100yea.rs','76.169.36.76',1391791171,'Field Group Created:&nbsp;Media Mention'),(177,1,1,'dev@100yea.rs','76.169.36.76',1391791318,'Field group Deleted:&nbsp;&nbsp;Media Mentions'),(178,1,1,'dev@100yea.rs','76.169.36.76',1391791486,'Field Group Created:&nbsp;Press Release'),(179,1,1,'dev@100yea.rs','76.169.36.76',1391793017,'Logged in'),(180,1,1,'dev@100yea.rs','76.169.36.76',1391793048,'Channel Created:&nbsp;&nbsp;Press Releases'),(181,1,1,'dev@100yea.rs','67.53.113.42',1391800501,'Logged in'),(182,1,1,'dev@100yea.rs','67.53.113.42',1391803027,'Logged out'),(183,1,1,'dev@100yea.rs','67.53.113.42',1391805360,'Logged in'),(184,1,6,'julie@100yea.rs','162.195.121.216',1391807685,'Logged in'),(185,1,1,'dev@100yea.rs','67.53.113.42',1391807839,'Logged out'),(186,1,1,'dev@100yea.rs','76.169.36.76',1391807897,'Logged in'),(187,1,1,'dev@100yea.rs','67.53.113.42',1391810252,'Logged in'),(188,1,1,'dev@100yea.rs','67.53.113.42',1391812818,'Logged out'),(189,1,1,'dev@100yea.rs','107.214.220.202',1391815914,'Logged in'),(190,1,6,'julie@100yea.rs','172.251.100.146',1391820905,'Logged in'),(191,1,6,'julie@100yea.rs','172.251.100.146',1391997349,'Logged in');
/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_search_index`
--

DROP TABLE IF EXISTS `exp_cp_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_search_index`
--

LOCK TABLES `exp_cp_search_index` WRITE;
/*!40000 ALTER TABLE `exp_cp_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_cp_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_developer_log`
--

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache`
--

LOCK TABLES `exp_email_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_mg`
--

LOCK TABLES `exp_email_cache_mg` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_mg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_ml`
--

LOCK TABLES `exp_email_cache_ml` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_console_cache`
--

LOCK TABLES `exp_email_console_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_console_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_console_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_tracker`
--

DROP TABLE IF EXISTS `exp_email_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_tracker`
--

LOCK TABLES `exp_email_tracker` WRITE;
/*!40000 ALTER TABLE `exp_email_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_versioning`
--

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),(2,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y'),(3,'Assets_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.2.2','y'),(4,'Assets_ext','file_after_save','file_after_save','',9,'2.2.2','y'),(5,'Assets_ext','files_after_delete','files_after_delete','',8,'2.2.2','y');
/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_formatting`
--

DROP TABLE IF EXISTS `exp_field_formatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=313 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'markdown'),(4,1,'xhtml'),(5,2,'none'),(6,2,'br'),(7,2,'markdown'),(8,2,'xhtml'),(9,3,'none'),(10,3,'br'),(11,3,'markdown'),(12,3,'xhtml'),(13,4,'none'),(14,4,'br'),(15,4,'markdown'),(16,4,'xhtml'),(17,5,'none'),(18,5,'br'),(19,5,'markdown'),(20,5,'xhtml'),(21,6,'none'),(22,6,'br'),(23,6,'markdown'),(24,6,'xhtml'),(25,7,'none'),(26,7,'br'),(27,7,'markdown'),(28,7,'xhtml'),(29,8,'none'),(30,8,'br'),(31,8,'markdown'),(32,8,'xhtml'),(33,9,'none'),(34,9,'br'),(35,9,'markdown'),(36,9,'xhtml'),(309,78,'none'),(308,77,'xhtml'),(307,77,'markdown'),(306,77,'br'),(305,77,'none'),(304,76,'xhtml'),(303,76,'markdown'),(302,76,'br'),(301,76,'none'),(300,75,'xhtml'),(299,75,'markdown'),(298,75,'br'),(297,75,'none'),(296,74,'xhtml'),(295,74,'markdown'),(294,74,'br'),(293,74,'none'),(292,73,'xhtml'),(291,73,'markdown'),(290,73,'br'),(289,73,'none'),(288,72,'xhtml'),(287,72,'markdown'),(286,72,'br'),(285,72,'none'),(284,71,'xhtml'),(283,71,'markdown'),(282,71,'br'),(281,71,'none'),(280,70,'xhtml'),(279,70,'markdown'),(278,70,'br'),(69,18,'none'),(70,18,'br'),(71,18,'markdown'),(72,18,'xhtml'),(73,19,'none'),(74,19,'br'),(75,19,'markdown'),(76,19,'xhtml'),(77,20,'none'),(78,20,'br'),(79,20,'markdown'),(80,20,'xhtml'),(81,21,'none'),(82,21,'br'),(83,21,'markdown'),(84,21,'xhtml'),(191,48,'markdown'),(190,48,'br'),(189,48,'none'),(188,47,'xhtml'),(187,47,'markdown'),(186,47,'br'),(185,47,'none'),(93,24,'none'),(94,24,'br'),(95,24,'markdown'),(96,24,'xhtml'),(97,25,'none'),(98,25,'br'),(99,25,'markdown'),(100,25,'xhtml'),(101,26,'none'),(102,26,'br'),(103,26,'markdown'),(104,26,'xhtml'),(105,27,'none'),(106,27,'br'),(107,27,'markdown'),(108,27,'xhtml'),(109,28,'none'),(110,28,'br'),(111,28,'markdown'),(112,28,'xhtml'),(113,29,'none'),(114,29,'br'),(115,29,'markdown'),(116,29,'xhtml'),(117,30,'none'),(118,30,'br'),(119,30,'markdown'),(120,30,'xhtml'),(223,56,'markdown'),(222,56,'br'),(221,56,'none'),(183,46,'markdown'),(182,46,'br'),(181,46,'none'),(129,33,'none'),(130,33,'br'),(131,33,'markdown'),(132,33,'xhtml'),(133,34,'none'),(134,34,'br'),(135,34,'markdown'),(136,34,'xhtml'),(137,35,'none'),(138,35,'br'),(139,35,'markdown'),(140,35,'xhtml'),(141,36,'none'),(142,36,'br'),(143,36,'markdown'),(144,36,'xhtml'),(145,37,'none'),(146,37,'br'),(147,37,'markdown'),(148,37,'xhtml'),(149,38,'none'),(150,38,'br'),(151,38,'markdown'),(152,38,'xhtml'),(153,39,'none'),(154,39,'br'),(155,39,'markdown'),(156,39,'xhtml'),(157,40,'none'),(158,40,'br'),(159,40,'markdown'),(160,40,'xhtml'),(161,41,'none'),(162,41,'br'),(163,41,'markdown'),(164,41,'xhtml'),(165,42,'none'),(166,42,'br'),(167,42,'markdown'),(168,42,'xhtml'),(227,57,'markdown'),(226,57,'br'),(225,57,'none'),(224,56,'xhtml'),(173,44,'none'),(174,44,'br'),(175,44,'markdown'),(176,44,'xhtml'),(177,45,'none'),(178,45,'br'),(179,45,'markdown'),(180,45,'xhtml'),(184,46,'xhtml'),(192,48,'xhtml'),(193,49,'none'),(194,49,'br'),(195,49,'markdown'),(196,49,'xhtml'),(277,70,'none'),(276,69,'xhtml'),(275,69,'markdown'),(274,69,'br'),(273,69,'none'),(272,68,'xhtml'),(271,68,'markdown'),(270,68,'br'),(269,68,'none'),(268,67,'xhtml'),(267,67,'markdown'),(266,67,'br'),(265,67,'none'),(264,66,'xhtml'),(263,66,'markdown'),(262,66,'br'),(261,66,'none'),(260,65,'xhtml'),(259,65,'markdown'),(258,65,'br'),(257,65,'none'),(228,57,'xhtml'),(229,58,'none'),(230,58,'br'),(231,58,'markdown'),(232,58,'xhtml'),(233,59,'none'),(234,59,'br'),(235,59,'markdown'),(236,59,'xhtml'),(237,60,'none'),(238,60,'br'),(239,60,'markdown'),(240,60,'xhtml'),(241,61,'none'),(242,61,'br'),(243,61,'markdown'),(244,61,'xhtml'),(245,62,'none'),(246,62,'br'),(247,62,'markdown'),(248,62,'xhtml'),(249,63,'none'),(250,63,'br'),(251,63,'markdown'),(252,63,'xhtml'),(253,64,'none'),(254,64,'br'),(255,64,'markdown'),(256,64,'xhtml'),(310,78,'br'),(311,78,'markdown'),(312,78,'xhtml');
/*!40000 ALTER TABLE `exp_field_formatting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Homepage Hero Slider'),(2,1,'Homepage Mission and Pictograms'),(3,1,'Homepage Map Items'),(11,1,'Press Release'),(5,1,'Blog'),(6,1,'Homepage Map Categories'),(7,1,'Homepage Bottom Carousel'),(8,1,'Programs'),(9,1,'Gallery'),(10,1,'Media Mention');
/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'grid','1.0','YTowOnt9','n'),(7,'multi_select','1.0','YTowOnt9','n'),(8,'checkboxes','1.0','YTowOnt9','n'),(9,'radio','1.0','YTowOnt9','n'),(10,'relationship','1.0','YTowOnt9','n'),(11,'rte','1.0','YTowOnt9','n'),(12,'wygwam','3.2.2','YTowOnt9','y'),(13,'freeform','4.1.3','YTowOnt9','n'),(14,'assets','2.2.2','YTowOnt9','y');
/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_categories`
--

LOCK TABLES `exp_file_categories` WRITE;
/*!40000 ALTER TABLE `exp_file_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_dimensions`
--

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_watermarks`
--

LOCK TABLES `exp_file_watermarks` WRITE;
/*!40000 ALTER TABLE `exp_file_watermarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_watermarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'Clinton_Foundation_Logo.png',1,'/var/www/starkey/www/uploads/Clinton_Foundation_Logo.png','image/png','Clinton_Foundation_Logo.png',38236,NULL,NULL,NULL,1,1390196588,1,1390196588,'200 200'),(2,1,'TaniAustin.jpg',1,'/var/www/starkey/www/uploads/TaniAustin.jpg','image/jpeg','TaniAustin.jpg',69284,NULL,NULL,NULL,1,1390196612,1,1390196612,'914 1920'),(3,1,'HERO-Commitment_to_Action_Film.jpg',1,'/var/www/starkey/www/uploads/HERO-Commitment_to_Action_Film.jpg','image/jpeg','HERO-Commitment_to_Action_Film.jpg',776028,NULL,NULL,NULL,1,1390197274,1,1390197274,'863 1537'),(4,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',1,'/var/www/starkey/www/uploads/HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',593029,NULL,NULL,NULL,1,1390197738,1,1390197738,'901 1604'),(5,1,'CAROUSEL-Celebrity_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Celebrity_Film.jpg','image/jpeg','CAROUSEL-Celebrity_Film.jpg',475187,NULL,NULL,NULL,1,1390199154,1,1390199154,'932 1667'),(6,1,'CAROUSEL-Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Listen_Carefully.jpg','image/jpeg','CAROUSEL-Listen_Carefully.jpg',365844,NULL,NULL,NULL,1,1390199537,1,1390199537,'833 1484'),(7,1,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','image/jpeg','CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',670536,NULL,NULL,NULL,1,1390199867,1,1390199867,'943 1676'),(8,1,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_.jpg',472023,NULL,NULL,NULL,1,1390200146,1,1390200146,'909 1614'),(9,1,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_1.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',472023,NULL,NULL,NULL,1,1390200232,1,1390200232,'909 1614'),(10,1,'CAROUSEL-William_F._Austin_Legacy_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film.jpg',472023,NULL,NULL,NULL,1,1390200330,1,1390200332,'909 1614'),(11,1,'icon_now.png',1,'/var/www/starkey/www/uploads/icon_now.png','image/png','icon_now.png',3574,NULL,NULL,NULL,1,1390200625,1,1390200625,'56 56'),(12,1,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',497551,NULL,NULL,NULL,1,1390202028,1,1390202028,'520 936'),(13,1,'info_livesimpacted.jpg',1,'/var/www/starkey/www/uploads/info_livesimpacted.jpg','image/jpeg','info_livesimpacted.jpg',421949,NULL,NULL,NULL,1,1390202277,1,1390202277,'198 252'),(14,1,'info_livesindirectly.jpg',1,'/var/www/starkey/www/uploads/info_livesindirectly.jpg','image/jpeg','info_livesindirectly.jpg',419656,NULL,NULL,NULL,1,1390202291,1,1390202291,'198 252'),(15,1,'info_totalaids.jpg',1,'/var/www/starkey/www/uploads/info_totalaids.jpg','image/jpeg','info_totalaids.jpg',429588,NULL,NULL,NULL,1,1390202303,1,1390202303,'198 252'),(16,1,'Blog_Philippines_.jpg',1,'/var/www/starkey/www/uploads/Blog_Philippines_.jpg','image/jpeg','Blog_Philippines_.jpg',109435,NULL,NULL,NULL,1,1390202735,1,1390202735,'705 1024'),(17,1,'Dave_Fabry.jpg',1,'/var/www/starkey/www/uploads/Dave_Fabry.jpg','image/jpeg','Dave_Fabry.jpg',5586954,NULL,NULL,NULL,1,1390203283,1,1390203283,'3744 5616'),(18,1,'Blog_A_Knight.jpg',1,'/var/www/starkey/www/uploads/Blog_A_Knight.jpg','image/jpeg','Blog_A_Knight.jpg',489257,NULL,NULL,NULL,1,1390239202,1,1390239202,'1571 1992'),(19,1,'HERO-Vikings_Mission-IMG_6312.jpg',1,'/var/www/starkey/www/uploads/HERO-Vikings_Mission-IMG_6312.jpg','image/jpeg','HERO-Vikings_Mission-IMG_6312.jpg',416512,NULL,NULL,NULL,6,1391040192,6,1391040192,'496 936'),(20,1,'PeaceinWestBank.jpg',1,'/var/www/starkey/www/uploads/PeaceinWestBank.jpg','image/jpeg','PeaceinWestBank.jpg',121580,NULL,NULL,NULL,6,1391041006,6,1391041006,'680 1024'),(21,1,'September_Newsletter.jpg',1,'/var/www/starkey/www/uploads/September_Newsletter.jpg','image/jpeg','September_Newsletter.jpg',111923,NULL,NULL,NULL,6,1391064515,6,1391064515,'680 1024'),(22,1,'CAROUSEL-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Peru_Mission-02-DSC07062.jpg','image/jpeg','CAROUSEL-Peru_Mission-02-DSC07062.jpg',582871,NULL,NULL,NULL,6,1391123133,6,1391123133,'639 936'),(23,1,'westbank2.jpeg',1,'/var/www/starkey/www/uploads/westbank2.jpeg','image/jpeg','westbank2.jpeg',110244,NULL,NULL,NULL,6,1391199395,6,1391199395,'480 640'),(24,1,'special_olympics_mission.jpg',1,'/var/www/starkey/www/uploads/special_olympics_mission.jpg','image/jpeg','special_olympics_mission.jpg',20900,NULL,NULL,NULL,6,1391199945,6,1391199945,'220 330'),(25,1,'Screen_Shot_2014-01-31_at_12.29.23_PM.png',1,'/var/www/starkey/www/uploads/Screen_Shot_2014-01-31_at_12.29.23_PM.png','image/png','Screen_Shot_2014-01-31_at_12.29.23_PM.png',959232,NULL,NULL,NULL,6,1391200188,6,1391200193,'474 1440'),(26,1,'listencarefullygallery2.png',1,'/var/www/starkey/www/uploads/listencarefullygallery2.png','image/png','listencarefullygallery2.png',1155901,NULL,NULL,NULL,6,1391200463,6,1391200475,'476 1440'),(27,1,'COVER_pianoboy_cc.jpg',1,'/var/www/starkey/www/uploads/COVER_pianoboy_cc.jpg','image/jpeg','COVER_pianoboy_cc.jpg',8653599,NULL,NULL,NULL,6,1391213845,6,1391214146,'3283 5410'),(29,1,'_DSC0608cc.jpg',1,'/var/www/starkey/www/uploads/_DSC0608cc.jpg','image/jpeg','_DSC0608cc.jpg',3682161,NULL,NULL,NULL,6,1391215984,6,1391215984,'3083 4635'),(30,1,'marleemartin.jpeg',1,'/var/www/starkey/www/uploads/marleemartin.jpeg','image/jpeg','marleemartin.jpeg',24873,NULL,NULL,NULL,6,1391217284,6,1391217284,'327 320'),(31,1,'cnnlogo.png',1,'/var/www/starkey/www/uploads/cnnlogo.png','image/png','cnnlogo.png',20982,NULL,NULL,NULL,6,1391287531,6,1391287531,'225 300'),(32,1,'billaustin.jpg',1,'/var/www/starkey/www/uploads/billaustin.jpg','image/jpeg','billaustin.jpg',32328,NULL,NULL,NULL,6,1391287698,6,1391287698,'342 500'),(33,1,'CBSStarkey.jpg',1,'/var/www/starkey/www/uploads/CBSStarkey.jpg','image/jpeg','CBSStarkey.jpg',28201,NULL,NULL,NULL,6,1391288289,6,1391288289,'349 620'),(34,1,'cbslogo.png',1,'/var/www/starkey/www/uploads/cbslogo.png','image/png','cbslogo.png',3932,NULL,NULL,NULL,6,1391288322,6,1391288322,'300 300'),(35,1,'operationchange.jpg',1,'/var/www/starkey/www/uploads/operationchange.jpg','image/jpeg','operationchange.jpg',504146,NULL,NULL,NULL,6,1391489910,6,1391489910,'525 1600'),(36,1,'listencarefully.jpg',1,'/var/www/starkey/www/uploads/listencarefully.jpg','image/jpeg','listencarefully.jpg',405535,NULL,NULL,NULL,6,1391490035,6,1391490035,'525 1600'),(37,1,'listencarefully2.jpg',1,'/var/www/starkey/www/uploads/listencarefully2.jpg','image/jpeg','listencarefully2.jpg',598077,NULL,NULL,NULL,6,1391490094,6,1391490094,'525 1600'),(38,1,'listencarefully3.jpg',1,'/var/www/starkey/www/uploads/listencarefully3.jpg','image/jpeg','listencarefully3.jpg',631091,NULL,NULL,NULL,6,1391490133,6,1391490133,'525 1600'),(39,1,'hearnow1.jpg',1,'/var/www/starkey/www/uploads/hearnow1.jpg','image/jpeg','hearnow1.jpg',340204,NULL,NULL,NULL,6,1391490205,6,1391490205,'525 1600'),(40,1,'hearingaidrecycling.jpg',1,'/var/www/starkey/www/uploads/hearingaidrecycling.jpg','image/jpeg','hearingaidrecycling.jpg',257454,NULL,NULL,NULL,6,1391490240,6,1391490240,'525 1600'),(41,1,'icon_program.png',1,'/var/www/starkey/www/uploads/icon_program.png','image/png','icon_program.png',3594,NULL,NULL,NULL,6,1391538643,6,1391538643,'56 56'),(42,1,'icon_stories.png',1,'/var/www/starkey/www/uploads/icon_stories.png','image/png','icon_stories.png',3052,NULL,NULL,NULL,6,1391538677,6,1391548575,'56 56'),(43,1,'icon_video.png',1,'/var/www/starkey/www/uploads/icon_video.png','image/png','icon_video.png',2970,NULL,NULL,NULL,6,1391538708,6,1391538708,'56 56'),(44,1,'icon_gallery.png',1,'/var/www/starkey/www/uploads/icon_gallery.png','image/png','icon_gallery.png',2980,NULL,NULL,NULL,6,1391538788,6,1391538788,'56 56'),(45,1,'CAROUSEL-Tony_Hawk_Event.JPG',1,'/var/www/starkey/www/uploads/CAROUSEL-Tony_Hawk_Event.JPG','image/jpeg','CAROUSEL-Tony_Hawk_Event.JPG',131758,NULL,NULL,NULL,6,1391538876,6,1391538876,'480 640'),(46,1,'pdf_download_tes.pdf',2,'/var/www/starkey/www/uploads/files/pdf_download_tes.pdf','application/pdf','pdf_download_tes.pdf',8673,NULL,NULL,NULL,6,1391541790,6,1391541790,' '),(47,1,'PoweringInspiration_.jpg',1,'/var/www/starkey/www/uploads/PoweringInspiration_.jpg','image/jpeg','PoweringInspiration_.jpg',95744,NULL,NULL,NULL,6,1391542959,6,1391542959,'747 1024'),(48,1,'CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','image/jpeg','CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',600105,NULL,NULL,NULL,6,1391548021,6,1391548021,'947 1679'),(50,1,'CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','image/jpeg','CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',717312,NULL,NULL,NULL,6,1391548763,6,1391548925,'943 1680'),(52,1,'CAROUSEL-Building_a_Better_Kibera.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Building_a_Better_Kibera.jpg','image/jpeg','CAROUSEL-Building_a_Better_Kibera.jpg',775997,NULL,NULL,NULL,6,1391551245,6,1391551245,'908 1622');
/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_composer_layouts`
--

DROP TABLE IF EXISTS `exp_freeform_composer_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_composer_layouts` (
  `composer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composer_data` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `preview` char(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`composer_id`),
  KEY `preview` (`preview`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_composer_layouts`
--

LOCK TABLES `exp_freeform_composer_layouts` WRITE;
/*!40000 ALTER TABLE `exp_freeform_composer_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_composer_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_composer_templates`
--

DROP TABLE IF EXISTS `exp_freeform_composer_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_composer_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `template_name` varchar(150) NOT NULL DEFAULT 'default',
  `template_label` varchar(150) NOT NULL DEFAULT 'default',
  `template_description` text,
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_data` text,
  `param_data` text,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_composer_templates`
--

LOCK TABLES `exp_freeform_composer_templates` WRITE;
/*!40000 ALTER TABLE `exp_freeform_composer_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_composer_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_fields`
--

DROP TABLE IF EXISTS `exp_freeform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_fields` (
  `field_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `field_name` varchar(150) NOT NULL DEFAULT 'default',
  `field_label` varchar(150) NOT NULL DEFAULT 'default',
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `settings` text,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `required` char(1) NOT NULL DEFAULT 'n',
  `submissions_page` char(1) NOT NULL DEFAULT 'y',
  `moderation_page` char(1) NOT NULL DEFAULT 'y',
  `composer_use` char(1) NOT NULL DEFAULT 'y',
  `field_description` text,
  PRIMARY KEY (`field_id`),
  KEY `field_name` (`field_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_fields`
--

LOCK TABLES `exp_freeform_fields` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fields` DISABLE KEYS */;
INSERT INTO `exp_freeform_fields` VALUES (1,1,'first_name','First Name','text','{\"field_length\":150,\"field_content_type\":\"any\"}',1,1390977359,0,'n','y','y','y','This field contains the user\'s first name.'),(2,1,'last_name','Last Name','text','{\"field_length\":150,\"field_content_type\":\"any\"}',1,1390977359,0,'n','y','y','y','This field contains the user\'s last name.'),(3,1,'email','Email','text','{\"field_length\":150,\"field_content_type\":\"email\"}',1,1390977359,0,'n','y','y','y','A basic email field for collecting stuff like an email address.'),(4,1,'user_message','Message','textarea','{\"field_ta_rows\":6}',1,1390977359,0,'n','y','y','y','This field contains the user\'s message.'),(5,1,'practice','Practice','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189576,0,'n','y','y','y','Practice'),(6,1,'fax','Fax','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189583,0,'n','y','y','y',''),(7,1,'address','Address','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189593,0,'n','y','y','y',''),(8,1,'city','City','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189606,0,'n','y','y','y',''),(9,1,'state','State','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189612,0,'n','y','y','y',''),(10,1,'zip','Zip','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189619,0,'n','y','y','y',''),(11,1,'phone','Phone','text','{\"field_length\":\"150\",\"field_content_type\":\"any\",\"disallow_html_rendering\":\"y\"}',1,1391189701,0,'n','y','y','y','');
/*!40000 ALTER TABLE `exp_freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_fieldtypes`
--

DROP TABLE IF EXISTS `exp_freeform_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_fieldtypes` (
  `fieldtype_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldtype_name` varchar(250) DEFAULT NULL,
  `settings` text,
  `default_field` char(1) NOT NULL DEFAULT 'n',
  `version` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`fieldtype_id`),
  KEY `fieldtype_name` (`fieldtype_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_fieldtypes`
--

LOCK TABLES `exp_freeform_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_freeform_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_freeform_fieldtypes` VALUES (1,'checkbox','[]','n','4.1.3'),(2,'checkbox_group','[]','n','4.1.3'),(3,'country_select','[]','n','4.1.3'),(4,'file_upload','[]','n','4.1.3'),(5,'hidden','[]','n','4.1.3'),(6,'mailinglist','[]','n','4.1.3'),(7,'multiselect','[]','n','4.1.3'),(8,'province_select','[]','n','4.1.3'),(9,'radio','[]','n','4.1.3'),(10,'select','[]','n','4.1.3'),(11,'state_select','[]','n','4.1.3'),(12,'text','[]','n','4.1.3'),(13,'textarea','[]','n','4.1.3');
/*!40000 ALTER TABLE `exp_freeform_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_file_uploads`
--

DROP TABLE IF EXISTS `exp_freeform_file_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_file_uploads` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `server_path` varchar(750) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `filesize` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `field_id` (`field_id`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_file_uploads`
--

LOCK TABLES `exp_freeform_file_uploads` WRITE;
/*!40000 ALTER TABLE `exp_freeform_file_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_file_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_form_entries_1`
--

DROP TABLE IF EXISTS `exp_freeform_form_entries_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_form_entries_1` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `complete` varchar(1) NOT NULL DEFAULT 'y',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `form_field_1` text,
  `form_field_2` text,
  `form_field_3` text,
  `form_field_4` text,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_form_entries_1`
--

LOCK TABLES `exp_freeform_form_entries_1` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` DISABLE KEYS */;
INSERT INTO `exp_freeform_form_entries_1` VALUES (1,1,0,'y','127.0.0.1',1390977359,0,'pending','Jake','Solspace','support@solspace.com','Welcome to Freeform. We hope that you will enjoy Solspace software.');
/*!40000 ALTER TABLE `exp_freeform_form_entries_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_form_entries_2`
--

DROP TABLE IF EXISTS `exp_freeform_form_entries_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_form_entries_2` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `complete` varchar(1) NOT NULL DEFAULT 'y',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  `form_field_1` text,
  `form_field_2` text,
  `form_field_3` text,
  `form_field_5` text,
  `form_field_6` text,
  `form_field_7` text,
  `form_field_8` text,
  `form_field_9` text,
  `form_field_10` text,
  `form_field_11` text,
  PRIMARY KEY (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_form_entries_2`
--

LOCK TABLES `exp_freeform_form_entries_2` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_2` DISABLE KEYS */;
INSERT INTO `exp_freeform_form_entries_2` VALUES (1,1,6,'y','172.251.100.146',1391491413,0,'pending','Julie','H','test@1007yea.rs','100yrs','1234567891','810 S Santa Fe','Los Angeles','CA','90027','1234567891');
/*!40000 ALTER TABLE `exp_freeform_form_entries_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_forms`
--

DROP TABLE IF EXISTS `exp_freeform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_forms` (
  `form_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_name` varchar(150) NOT NULL DEFAULT 'default',
  `form_label` varchar(150) NOT NULL DEFAULT 'default',
  `default_status` varchar(150) NOT NULL DEFAULT 'default',
  `notify_user` char(1) NOT NULL DEFAULT 'n',
  `notify_admin` char(1) NOT NULL DEFAULT 'n',
  `user_email_field` varchar(150) NOT NULL DEFAULT '',
  `user_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_id` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_notification_email` text,
  `form_description` text,
  `field_ids` text,
  `field_order` text,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `composer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_date` int(10) unsigned NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`form_id`),
  KEY `form_name` (`form_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_forms`
--

LOCK TABLES `exp_freeform_forms` WRITE;
/*!40000 ALTER TABLE `exp_freeform_forms` DISABLE KEYS */;
INSERT INTO `exp_freeform_forms` VALUES (1,1,'contact','Contact','pending','n','y','',0,1,'dev@100yea.rs','This is a basic contact form.','1|2|3|4',NULL,0,0,1,1390977359,0,NULL),(2,1,'become_a_provider','Become a Provider','pending','n','n','',0,0,'dev@100yea.rs','','1|2|3|5|6|7|8|9|10|11','1|2|5|11|6|3|7|8|9|10',0,0,1,1391189690,1391189737,NULL);
/*!40000 ALTER TABLE `exp_freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_multipage_hashes`
--

DROP TABLE IF EXISTS `exp_freeform_multipage_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_multipage_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `edit` char(1) NOT NULL DEFAULT 'n',
  `data` text,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`),
  KEY `ip_address` (`ip_address`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_multipage_hashes`
--

LOCK TABLES `exp_freeform_multipage_hashes` WRITE;
/*!40000 ALTER TABLE `exp_freeform_multipage_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_multipage_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_notification_templates`
--

DROP TABLE IF EXISTS `exp_freeform_notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_notification_templates` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `notification_name` varchar(150) NOT NULL DEFAULT 'default',
  `notification_label` varchar(150) NOT NULL DEFAULT 'default',
  `notification_description` text,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `allow_html` char(1) NOT NULL DEFAULT 'n',
  `from_name` varchar(150) NOT NULL DEFAULT '',
  `from_email` varchar(250) NOT NULL DEFAULT '',
  `reply_to_email` varchar(250) NOT NULL DEFAULT '',
  `email_subject` varchar(128) NOT NULL DEFAULT 'default',
  `include_attachments` char(1) NOT NULL DEFAULT 'n',
  `template_data` text,
  PRIMARY KEY (`notification_id`),
  KEY `notification_name` (`notification_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_notification_templates`
--

LOCK TABLES `exp_freeform_notification_templates` WRITE;
/*!40000 ALTER TABLE `exp_freeform_notification_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_params`
--

DROP TABLE IF EXISTS `exp_freeform_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_params` (
  `params_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`params_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
INSERT INTO `exp_freeform_params` VALUES (51,1391544424,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),(52,1391547453,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),(53,1391550527,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),(54,1391550566,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}');
/*!40000 ALTER TABLE `exp_freeform_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_preferences`
--

DROP TABLE IF EXISTS `exp_freeform_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_preferences` (
  `preference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preference_name` varchar(80) DEFAULT NULL,
  `preference_value` text,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`preference_id`),
  KEY `preference_name` (`preference_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_preferences`
--

LOCK TABLES `exp_freeform_preferences` WRITE;
/*!40000 ALTER TABLE `exp_freeform_preferences` DISABLE KEYS */;
INSERT INTO `exp_freeform_preferences` VALUES (1,'ffp','y',0);
/*!40000 ALTER TABLE `exp_freeform_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_freeform_user_email`
--

DROP TABLE IF EXISTS `exp_freeform_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_freeform_user_email` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(40) NOT NULL DEFAULT '0',
  `entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entry_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_count` int(10) unsigned NOT NULL DEFAULT '0',
  `email_addresses` text,
  PRIMARY KEY (`email_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_user_email`
--

LOCK TABLES `exp_freeform_user_email` WRITE;
/*!40000 ALTER TABLE `exp_freeform_user_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_freeform_user_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_global_variables`
--

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_grid_columns`
--

DROP TABLE IF EXISTS `exp_grid_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_grid_columns`
--

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;
INSERT INTO `exp_grid_columns` VALUES (1,4,'channel',0,'file','slot_1','slot_1','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(2,4,'channel',1,'file','slot_2','slot_2','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(3,4,'channel',2,'file','slot_3','slot_3','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(4,60,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(5,60,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(6,60,'channel',4,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(7,60,'channel',3,'text','Call to Action','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(8,61,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(9,61,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(10,61,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(11,61,'channel',4,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(12,61,'channel',3,'text','Call to Action','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(13,60,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(14,62,'channel',0,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(15,62,'channel',1,'text','Video','video','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}');
/*!40000 ALTER TABLE `exp_grid_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_html_buttons`
--

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` VALUES (1,1,0,'b','<strong>','</strong>','b',1,'1','btn_b'),(2,1,0,'i','<em>','</em>','i',2,'1','btn_i'),(3,1,0,'blockquote','<blockquote>','</blockquote>','q',3,'1','btn_blockquote'),(4,1,0,'a','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','btn_a'),(5,1,0,'img','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','btn_img');
/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_bulletin_board`
--

LOCK TABLES `exp_member_bulletin_board` WRITE;
/*!40000 ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_data`
--

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_fields`
--

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_groups`
--

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` VALUES (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','n','y','y');
/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_homepage`
--

DROP TABLE IF EXISTS `exp_member_homepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_homepage`
--

LOCK TABLES `exp_member_homepage` WRITE;
/*!40000 ALTER TABLE `exp_member_homepage` DISABLE KEYS */;
INSERT INTO `exp_member_homepage` VALUES (1,'l',1,'l',2,'n',0,'r',1,'n',0,'r',2,'r',0,'l',0),(2,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(3,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(4,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(5,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(6,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(7,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0),(8,'l',0,'l',0,'n',0,'r',0,'n',0,'r',0,'r',0,'n',0);
/*!40000 ALTER TABLE `exp_member_homepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_search`
--

LOCK TABLES `exp_member_search` WRITE;
/*!40000 ALTER TABLE `exp_member_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_members`
--

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` VALUES (1,1,'dev@100yea.rs','100YRS','a8a7b03cba67d17d2ab5be34c9079ba33d1a1cb6cb864a9aa5007ac25bd8b059d76a2f75350ac5f1bedcff3b71dd878f1be88dcfbdf5d3cab855dcf5187212a7','EkVtF:M>jnMhU/SMX(=q$*5gN28)NItXmg?K)|yJg7_H.Wi;4-`Ut<L1Wiu:dse}x;m/pqhGbh1aEGVlN2^%V{;=)FA6\'uOPR?mEDy5Nxu2Wax2v(knj(:eG>8BP\\\\,=','9f103e0f65ebdd0f0071291566aa0b4ec2c0ce3a','efa1131cff05bf5812eeffa169757ded10ce276e',NULL,'dev@100yea.rs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'10.11.0.1',1383699021,1391795073,1391815914,15,0,0,0,1391540438,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18','',NULL,'n',0,'y',0),(2,1,'taylor_joseph','Taylor Joseph','d20885cf421ceae1fa04b3a1a3992b8dc6c42ca802a1180d8b032923319c9fb433baa5efeadd919f690f34add079a66f87a270c782ffe4b738122ae382313d13','^.~=fwa3Cemv@z:=#BSGn+iU-sVH$k8L8_6k|S6~@_lCql3fjB86rE1!u&DF6-FTo:kn/.\\4,$8RgD<v/_`K7K\\/\\\'GMq@7EAMp\'bO%Z\'[r\\]lY){pRW2R[KBat%dTX;','0f194eb9cb74f4354d309168b2cf28f22b33035a','ff6cfdb53f105bf771eebde3464924b440931c4a',NULL,'Taylor_Joseph@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850428,1391552108,1391552108,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'trinh_mai','Trinh Mai','4af7e123cfd0eb006ff307e029e60d84a9605df47460ee2e9f8603c69d4ba6862e6cc7b311b91d59ddbc9a234dc738292fdd5424dc395d8722f637894f069533','fUd)AD)k(|_rjDR/bWfLOR%}?Kov_~\'q3Y\'~Skf?sYWZ`;Z4.agpI%+&l:I0C@S},}xzN/BI`O6*fCFlgR2pXh%C<X_NqS[^6$&,v8YeGuP7S>MU~Sc-8\'rp8cq93S5_','2a35c0eb5685fb2a80c82f6cf386813ccc5ebfec','7f16667d0fc7fa3c9cda673b2372442193108e2c',NULL,'Trinh_Mai@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850463,1391610838,1391610838,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'laura_hetzel','Laura Hetzel','f31af15e4df9066600604e5241f9dcd4871ae789f67ade5d94d30ad98326beacd09e6a8fe61408c639d0ba0fd6bc65f63254b20342d50d9d052c5003a712c6bf','*q{*<U!9;t1[fdpy[8t4w]P<045n}5*\"hw]*,bZQo&zUoywdYSRT\\8z0KO5$mT\'Uj~u#2,Z&\"J]Xp5FCfJH3|LWFI7!}VyijN98},k40n7A*:?kK)fN)n(bTJ&r?H\\#c','968d5b7895b7e24e58be8e3575dd2d6c134fc476','332b1fb5073f09dbf7468e1a2b0d65bc8a56af92',NULL,'Laura_Hetzel@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850495,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'randall_ward','Randall Ward','4ff34fe515b1476d91a1ab21fd22609af97f7c6c969320c18b49367dbd27c7ae9b227e2cee9ac01e4d8bfe00f3f9ee7b76383031c9eb10ede0ef177767f0d0e6','#$.Ln^2*0E}w#0pmZU\'JvCv\\:US04A5e#,_7?\'jQ/=z:\"`|EuoB6\"(L9QuOh/6nbtDrkeN7ST4O|\'zL[;+:!Mdl\\scJvO,t+?AN^}zyem@f(%W-@:?ph<xl%uVD{WDTE','0ea2c818353df42c5f031017b53739481035fb6a','0c30f8fcd22592abb65ce9399db9e0e0feede1bd',NULL,'Randall_Ward@starkeyhearingfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850564,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'julie@100yea.rs','Julie','2c1165ca027fa015339d532b45aac4472419a40f1cdcccac7db78ae4f7a7575c9b705301695a54265f2143ccd0aa1ea1e03d62f24f3a26bb50645b729a917ca9',']y\\X@r{`sR^Jh=#r#Q-9BW!}DD(yT6_x<$,\"N/xro:M`v}(:ui;TDePq!]_]dhx`~<.\\g_4x=^&\\:h}Xied@auH0\"g&KUTWDb\\hHM}@?Etk;E{,b6wHrh^B_m;G!bK|J','9444d23d017fe0fb04505a0d6c41e8ec9275578a','a86408905268b712456c93cc4b374b2293ab63a9',NULL,'julie@100yea.rs','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390865267,1391821277,1391998707,33,0,0,0,1391821107,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(7,5,'tulika_bose','Tulika Bose','b4326e7a34c0875c944e4c8f8fe242d78d1ba805a53b3307053ca5efa1430c2965207a465552c874f9d71875b3e829551d0cd65e741d5cd3ea37651f35fa8a86','I]$m=VBBlaB*+n\'`7,K1x?YhI,~t}qao0GN%^2_\'N@\'!\\DO\"Skmiu\'s{]:L)+g\"|&}JYyf1n:)t7{$w:jQzAl-Oi0.}\\9.]\\|Uq*8&y^>Bv\'dV3G;.i4hsjC]T:uA.ij','9ad103500d30fb95dede1cd734acfd2c566c34a6','f852d5c7028ebacdeed5f2442afad2d7cfc0da29',NULL,'Tulika_Bose@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(8,5,'megan_sheley','Megan Sheley','a8d94a9de0e8eaaeea268469640a73ba4d81930f6d4bfb5ca913861871a62fa9d89de6b08a1b7d4bb881519855e7ba4da3e16d41e3b7e7a8ba67e9ba99e4af7a','NQAOe2\"V<=~g}:~wBsF~B4Oy4$^NOj-CdW4+iRsoo-~2~6XE-@nBy0Ee4H7QW\\U^V.}AP3eX,~XO9J|z:g_*[xPhT(wzJ.YrMzRCdg6uus\"a]aAZt7YE\'3*+=6AY]G\\z','959e59ff8c8d14aec02135972b2757dbb5f08611','c134aecae31953d508b66a656cbe5632d6e77728',NULL,'Megan_Sheley@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975508,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0);
/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_attachments`
--

LOCK TABLES `exp_message_attachments` WRITE;
/*!40000 ALTER TABLE `exp_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_copies`
--

LOCK TABLES `exp_message_copies` WRITE;
/*!40000 ALTER TABLE `exp_message_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_data`
--

LOCK TABLES `exp_message_data` WRITE;
/*!40000 ALTER TABLE `exp_message_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_folders`
--

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;
INSERT INTO `exp_message_folders` VALUES (1,'InBox','Sent','','','','','','','',''),(6,'InBox','Sent','','','','','','','','');
/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_listed`
--

LOCK TABLES `exp_message_listed` WRITE;
/*!40000 ALTER TABLE `exp_message_listed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_listed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_module_member_groups`
--

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Comment','2.3.1','y','n'),(2,'Email','2.0','n','n'),(3,'Emoticon','2.0','n','n'),(4,'Jquery','1.0','n','n'),(5,'Pages','2.2','y','y'),(6,'Rss','2.0','n','n'),(7,'Search','2.2.1','n','n'),(8,'Channel','2.0.1','n','n'),(9,'Member','2.1','n','n'),(10,'Stats','2.0','n','n'),(11,'Rte','1.0.1','y','n'),(12,'Wygwam','3.2.2','y','n'),(13,'Freeform','4.1.3','y','n'),(14,'Assets','2.2.2','y','n'),(15,'Query','2.0','n','n');
/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
INSERT INTO `exp_online_users` VALUES (1,1,0,'n','','10.11.0.1',1383699119,'');
/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_pages_configuration`
--

DROP TABLE IF EXISTS `exp_pages_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_pages_configuration`
--

LOCK TABLES `exp_pages_configuration` WRITE;
/*!40000 ALTER TABLE `exp_pages_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_pages_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
INSERT INTO `exp_relationships` VALUES (2,10,9,5,0,0,0,0),(16,14,12,47,0,0,0,1),(10,15,12,47,0,0,0,2),(9,15,14,47,0,0,0,1),(11,23,14,47,0,0,0,1),(12,23,12,47,0,0,0,2),(17,42,38,5,0,0,0,0),(18,49,40,5,0,0,0,0),(19,51,14,47,0,0,0,1);
/*!40000 ALTER TABLE `exp_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_remember_me`
--

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_reset_password`
--

LOCK TABLES `exp_reset_password` WRITE;
/*!40000 ALTER TABLE `exp_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_revision_tracker`
--

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_tools`
--

DROP TABLE IF EXISTS `exp_rte_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_tools`
--

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;
INSERT INTO `exp_rte_tools` VALUES (1,'Blockquote','Blockquote_rte','y'),(2,'Bold','Bold_rte','y'),(3,'Headings','Headings_rte','y'),(4,'Image','Image_rte','y'),(5,'Italic','Italic_rte','y'),(6,'Link','Link_rte','y'),(7,'Ordered List','Ordered_list_rte','y'),(8,'Underline','Underline_rte','y'),(9,'Unordered List','Unordered_list_rte','y'),(10,'View Source','View_source_rte','y');
/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_toolsets`
--

DROP TABLE IF EXISTS `exp_rte_toolsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_toolsets`
--

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;
INSERT INTO `exp_rte_toolsets` VALUES (1,0,'Default','3|2|5|1|9|7|6|4|10','y');
/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search`
--

LOCK TABLES `exp_search` WRITE;
/*!40000 ALTER TABLE `exp_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search_log`
--

LOCK TABLES `exp_search_log` WRITE;
/*!40000 ALTER TABLE `exp_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  `used` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=10115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (9546,1391731958,'0','eb1bbe4265c0be908cd76a26c2bf9447e593228e',0),(9545,1391728421,'0','e7f886ed406011cac055676cc6d8e8b1caf455a5',0),(9544,1391728421,'0','596e653f0674ca4f5493772f245d648111d18cb7',0),(9543,1391728405,'0','7f40bf9ce073a0ca3f671f91e8004401c2b4d8ab',0),(9542,1391728405,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','0e5793350c32f9465f92735bfa7ffb65171397ae',0),(9541,1391726026,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','6cca85d20ef0594fb40915d7f41cc132cfce572d',0),(9540,1391726021,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','d425f9f4131312f6e1d7b3799c445e43cbee4d66',0),(9539,1391726021,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','36d35f7a60c34783f0269d41f489d6b438d36b89',0),(9538,1391726020,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','18142a785f9b42709fcdda0c90a5af3655fd88ce',0),(9537,1391726007,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','bb4150cf0b805c1c62aca8b2b1eaa4ca71d7f696',0),(9536,1391726007,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','1b7f2bc160decbcd4f378d4345f7c3a41ce13b02',0),(9535,1391726004,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','976dd23f19bccd6b828ddcfe5172b69c69b74d42',0),(9534,1391725957,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','d5b7eeaafc9aca73a654ae650984a516fd104da4',0),(9533,1391725955,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','82589780267a4034338a5c0a0ba940e633312ca0',0),(9532,1391725922,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','b28a09f26963c6fca03f72e9ebb282afc403a609',0),(9531,1391725922,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','1881c167d5d55ad04623fcf327301ddf4dc900e2',0),(9530,1391725921,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','ce1fcede266ca8062c356f65d0efd9ea828fd7cc',0),(9529,1391725919,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','2eda302f69bb83f5ccaaaa211dd90f784b9a4b33',1),(9528,1391725914,'1749c3d707976a3f3ad6a1a69e1f272873302b4a','248f62c35db060922a5a70f9655c2d47d4f18084',0),(9527,1391725914,'0','2160f231d9bdd4edfc994483d5ae963ef01677a4',0),(9526,1391725908,'0','b467c2df8d69a45a2432a4027da73ce1980d6692',1),(9525,1391725908,'0','07df03d71eb3d52ecb70181909d49018c6e591fb',0),(9524,1391725880,'0','2454e64f3754295f757046d3e6629c159e2148da',0),(9523,1391725875,'0','df03241242a3f8b0a33c60222a0c285ec39b1ab3',0),(9522,1391725875,'0','182766cec90741e91037e2430da67f17110d387f',0),(9521,1391725871,'0','60809d0ec631daba066161430b940cfd25f7a3a3',0),(10114,1392052795,'0','fff90f99a7ba041fc8ec6cdf49fb08d14dd87272',0),(10112,1392052793,'0','4d445e7309b8a2e6d1d7a9d60a7d3d3b46195aff',0),(10113,1392052795,'0','32aa48f6d706679b22fdc2d824a4680972d61d41',0),(10111,1391998813,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','dae659fb03806acd93c8a8b944348e7babbf2b1e',0),(10110,1391998801,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','56f57d81e7feffbf927d3e2d0e1e1e2de1a9a02a',0),(10109,1391998801,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','56370ef66a3536ea828d87be6be8f428de84fe37',0),(10108,1391998779,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','3bc31d8371b82d196a38a01610d354cb7a3bcc60',1),(10107,1391998775,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','2065584772ece72a55adbb7ce5000f2f762338f3',0),(10106,1391998775,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','aa68c4393b97baa7ed81309fa65088ee6a1f2bec',0),(10105,1391998715,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','cbd4ae29f34bc0c1bc5a34191ea606c32a904901',1),(10104,1391998707,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','3ec2b52e8713354a56231f604c3d5d51d84f5b96',0),(10103,1391998707,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','6adbf6fb0bb59dbc56c8496eeeaed2a93ede955f',0),(10102,1391998690,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','efe24ed02574b3bf6a740c1503fa0994e9753ad2',1),(10101,1391998687,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','25db07121d432c227686253ae3dc604d59c6db2c',0),(10100,1391998686,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','c2c93a4ecd71f58816d1e80e7c14af91020ced4d',0),(10099,1391998676,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','988f93de554fa719b57d444216f3852cda281f09',1),(10098,1391998671,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','c7fb74eb6139da692818cae62034f3b0cf362ab7',0),(10097,1391998670,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','5295e62bb48798f8c950fc127c7fcc00fd4953bb',0),(10096,1391998626,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','cd88621ac62c839c1b1e4724e0596d4829dc9d14',1),(10095,1391998623,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','b88e2083cf53e03abea6d614eb6fca317dee4c41',0),(10094,1391998623,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1e1dade327895a21b9e19db9d848ac6f313413cb',0),(10093,1391998578,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','78867eae90e3fd0696261ef74ad7ef075e5fcb6d',1),(10092,1391998574,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','4787d239a2ddf8abb46362d017c1feed1cf434a4',0),(10091,1391998574,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','ccb383d371220bc04acf1b004d3fe33315d2de75',0),(10090,1391998569,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','744dddea16fb7e579be0eb383e68495cbf7f0e1b',1),(10089,1391998564,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','b6c53f3564e722577efba49f5eddaf61b17929d6',0),(10088,1391998564,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','7a78c0f8c284fb6045f27b3f9f3101bbf35403bc',0),(10087,1391998524,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','6fad5f02ad29ddfa2096108c3fcdbfc9fa961f10',1),(10086,1391998522,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','89b5dc4009f7671acca0133aa616d60518302f74',0),(10085,1391998521,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','3173ae2f165acd43ccd9ef0ac1d35cfc4b3a4930',0),(10084,1391998513,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','4d4d40a1e793569bc878cc8cd9e38f24b2fa1611',1),(10083,1391998510,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','4ea9cf0f5e2e4b916e8563d13b5421362b529cd2',0),(10082,1391998510,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','4081437e4d1884c1292c82d93e7485f5fd937df6',0),(10081,1391998429,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1348b48348556eb3082062bae26460783944bc7c',1),(10080,1391998426,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','6cbc7506b32a2b02c7646512cca90a9e5a861223',0),(10079,1391998426,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','39fe8c3c2735d02d309937752f17e8ec1d93aab9',0),(10078,1391998393,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','cb8249cc1c8bf11838f485941a28bf74bf347842',1),(10077,1391998309,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','b8e9fddc3c29cb1fcb67a6d2e503b7310a7f402c',0),(10076,1391998306,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','f82ec2ada728b6cd20b688dffe2fb89f230812d8',0),(10075,1391998306,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1a82762039739dd4b407844286399f66abe7566e',0),(10074,1391998263,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','595e6ee90de82e9b24b21135565499f02df38f7c',1),(10073,1391998259,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','b3468db823c7bec00d5fe547a51786df10b8e5ae',0),(10072,1391998254,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','0ef0ecc9b75d4582e5b1d459c8f456cf2b1147f5',0),(10071,1391998221,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','33bcab6390d88f2e387aed8abe0a030ea5f33357',0),(10070,1391998159,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','3440f0fadc065a941cf7ebbbc5be101ae3c9845c',0),(10069,1391998156,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','032be10a46fff50413f7e260d02702c638cddf67',0),(10068,1391998141,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','70330c3fbf920387542d6e7087819827b4915edd',0),(10067,1391998141,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1df4f83e4db1372387c3cf92a17ee85755252401',0),(10066,1391998125,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','b9394ef6ca10da8b8df45f1be1aa77961b5cdaec',1),(10065,1391998122,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','fa03e1b9a39bfbf1eb8234d9d19134079c3f7033',0),(10064,1391998116,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','a84d76b0d9a44dfe7f745ad7e4012f48243c4c4a',0),(10063,1391998042,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','2896ef00d265a274fcbce41d0a66fd373723a229',0),(10062,1391998042,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','d162bacdef0c72ee510ca1328babd1b4f8b9cc2d',0),(10061,1391997962,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','7a750b35900570498e6f9d133ddfafa1d99262f8',1),(10060,1391997959,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','923ac168cafe3b38a9165d250b759af131c78a05',0),(10059,1391997956,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','c5445066b1cc6aef380f73c7b9e98ab79fec850c',0),(10058,1391997891,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','69883b8a4575956b8d186ab14f8b90fdd14fcb7c',0),(10057,1391997891,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','68bdd68d2e9c937f2fbb947f984419c5fbe76c92',0),(10056,1391997848,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','d2b4c97a6e2d139780d40f3c56338823c5147db4',1),(10055,1391997841,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','27d9c5d17e6ecfcb863d4e50faf58ae38e6e1575',0),(10054,1391997839,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','0fb9149cfc112a47320ab8caa179d9e768300d9a',0),(10053,1391997822,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','9e13ac7730eef426d1a90c86feeb09db16cbe8bf',0),(10052,1391997818,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','eb114f50836dd09bc52bc5d0c5503a99308bf1f1',0),(10051,1391997811,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','293fc6328f4f24d2502b03f1a6e62b2aba82cc39',0),(10050,1391997807,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1c5c66d5384c5d26cfb38f8e917e7af2c36db874',0),(10049,1391997789,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','90b8862d827c40c6ba31faac58fe39a7312189c5',0),(10048,1391997783,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','d8ab8f88e873115b08b122c249925b9c71bcd621',0),(10047,1391997783,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','11b9863c5f9785e12b497b84577c292286eac480',0),(10046,1391997761,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','f518254c1861c3db055e2f778e30e3bff502d696',1),(10045,1391997753,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','d51601d33dc0aad0523245c95b1835450916a411',0),(10044,1391997751,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','8154809bb0104e5344c31d826cf983c52bbe47a7',0),(10043,1391997739,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','a0005da78665b1e9122eb1ab6ca6e4ee16c3262b',0),(10042,1391997712,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','a1055169a3ad5e599a8abffc353d52fa694af35f',0),(10041,1391997712,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','d66862db58ab254ed4a265c706074ca06f1e97ea',0),(10040,1391997699,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','5186a814eaa5bc3b9553a1efca0ec2f560f850b9',1),(10039,1391997694,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','60359c7c4e05817ef1824ea58cf28d0084d1811d',0),(10038,1391997687,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','212c8e4f86ca34a95a39513bf47040b4941aa9c1',0),(10037,1391997641,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','22df09a68ed02ffd61a358c03a4844ccea6552d3',0),(10036,1391997641,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','ff237bf7b7ab7fa58ef4d642ff89bfc1d28bc56d',0),(10035,1391997624,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','c6402a72e33d1add0e25422546ecd5c81589da23',1),(10034,1391997614,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','8904c33d49a46cb5ecd6cb4f074aa47c2c5bd686',0),(10033,1391997607,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','0406e2bf5258d3a133b62ae538325432aa8fc3ca',0),(10032,1391997582,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','38506b123e85dd892ae75022769d588c39943108',0),(10031,1391997566,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','8b5a89e95ccbb488cdc9fe4799df949b7e5fd4ea',0),(10030,1391997566,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','dd4b1f023385d2840e257d982ca600485cd82f01',0),(10029,1391997532,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','42772ca023e57ef9f3e576a9b04aa9cb05adaf48',1),(10028,1391997527,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','eeb2fa9d770a92146a7bd8031e1ff0e95893e9ce',0),(10027,1391997527,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','cef7e02beec74fb36f75733114cc20e9f8baaa7a',0),(10026,1391997479,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','fe87a15d6d516322151729a57cd3a20cffcf7391',1),(10025,1391997474,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','270c08d9baaf8dd7b49b3104b5ddd024a82fb107',0),(10024,1391997457,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','a3f5bd1c0eeb278555af7dba9eb89bf8bca4d0b5',0),(10023,1391997447,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','7d3c549195f73197ea8ef4b3f8172705c98be8b8',0),(10022,1391997438,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','3bce4deaa1815a58290e3209211d1f04e43b4123',0),(10021,1391997438,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','dd496a3d0392f4d9aa9a083deaaa3d3bbf296dbb',0),(10020,1391997393,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','8e3d4283e626ae72ce55a53fd3460db903141a7a',1),(10019,1391997390,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1e9e81e9b389912e32e0eeff3415cae20a9bfb0f',0),(10018,1391997385,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','1804785d99b7fe7458fc2c87e4b616ac5340d1d9',0),(10017,1391997360,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','a7a2576c5f8c211ad4835569444bbf105e3b41c8',0),(10016,1391997360,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','ec3663a12e509a2cda5cad365cf0841b416c0c6f',0),(10015,1391997360,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','abde29237be3698b50a1c3924d8b55312c384e2b',0),(10014,1391997359,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','5bf4cf4bc85db56d331c55befe7f9d060bc8303f',0),(10013,1391997350,'7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a','8bba84c7561a95cee0489c34d7606621036c3b8d',0),(10012,1391997349,'0','2112d1c37726f89ec877b89543aed3fe45eb27c3',0),(10011,1391997342,'0','d9af96f04bd3f57f9b8a635bd82cd5e20bf22c54',1),(10010,1391997342,'0','831d6ab969e659f02425ded0651eb2c30559b5f3',0),(10009,1391997342,'0','db42f9fc89b125152654498c248799cc1432c085',0),(10008,1391996652,'0','fb81b27bef4305a9cbf04d71a098803d2a70c600',0),(10007,1391996652,'0','2cd94e332ba486b08c71eac304e271779654e038',0),(10006,1391996650,'0','b626da3324ad0c8b2add59d290af01e6854f8b65',0),(10005,1391838491,'0','65462d722fb348262ee982d18d4138d2c1ad8792',0),(10004,1391838491,'0','ffa77dfd7e59ab8e829fe494cdca20f116ff0af1',0),(10003,1391838491,'0','4838848e444cf491c9a3b6788b9b0f01c41370c5',0),(10002,1391838489,'0','583c6c80b05ca6c2b32d48c382c9f453d9d1e3a4',0),(10001,1391821279,'e706cd5f9134db66657c47a72540afaa83ea2440','38835f799b2ba77b235be78f4577b16a2a97e5f1',0),(10000,1391821279,'e706cd5f9134db66657c47a72540afaa83ea2440','5cebedea8644a5490897928d2bec22ab6de7f6b4',0),(9999,1391821279,'e706cd5f9134db66657c47a72540afaa83ea2440','0d2cf623d78c6d50eeab10ac56cde58ddf61f605',0),(9998,1391821277,'e706cd5f9134db66657c47a72540afaa83ea2440','a8b4fba622bb1da8d75575326c49cd9b8ad00b8f',0),(9997,1391821187,'e706cd5f9134db66657c47a72540afaa83ea2440','77304cda064e66bdcb78c15e015330a57a3ff20a',0),(9996,1391821185,'e706cd5f9134db66657c47a72540afaa83ea2440','05bf0bb762bd1648ca2637e743b7e4fd11b80d5d',0),(9995,1391821185,'e706cd5f9134db66657c47a72540afaa83ea2440','3ed36378d5c15ca6363c48cad58fb5338f47b397',0),(9994,1391821185,'e706cd5f9134db66657c47a72540afaa83ea2440','8fb558d13d175b3a223fbecfc2720991c29650e9',0),(9993,1391821182,'e706cd5f9134db66657c47a72540afaa83ea2440','2bdba4230c7dc371be10664118962c25086ecba6',0),(9992,1391821180,'e706cd5f9134db66657c47a72540afaa83ea2440','cd6626e5c873bb377055530be66b379428c26173',0),(9991,1391821180,'e706cd5f9134db66657c47a72540afaa83ea2440','cf92720ea57aec995c2d8872e671a81d3af66269',0),(9990,1391821180,'e706cd5f9134db66657c47a72540afaa83ea2440','d828c803b875debda42c1b875a14301417baafb7',0),(9989,1391821178,'e706cd5f9134db66657c47a72540afaa83ea2440','d13545f58349e97245e8c14fe60c00fc25e58ac1',0),(9988,1391821178,'e706cd5f9134db66657c47a72540afaa83ea2440','b3adcdad74031651c4537839b817ab66376067c1',0),(9987,1391821178,'e706cd5f9134db66657c47a72540afaa83ea2440','1fabf53be69c1d3cc986fa35ef54bbc2f1cb72cf',0),(9986,1391821171,'e706cd5f9134db66657c47a72540afaa83ea2440','5f6eb0a54f34a12cc3d8cddc18fbe1aec80e24c2',0),(9985,1391821171,'e706cd5f9134db66657c47a72540afaa83ea2440','59825490053d9715aed2ea2f4ea264b73e81f6f9',0),(9984,1391821168,'e706cd5f9134db66657c47a72540afaa83ea2440','eb6a197e6c23f04bcbeb15441a8b62ae8aa63cce',0),(9983,1391821167,'e706cd5f9134db66657c47a72540afaa83ea2440','1c9e5b38d7d990ff3dd41ddef7f20e198ae7773b',0),(9982,1391821167,'e706cd5f9134db66657c47a72540afaa83ea2440','dc93d52d51de0a886d660627008a032bba0efa49',0),(9981,1391821161,'e706cd5f9134db66657c47a72540afaa83ea2440','11a2793523e624569b23687b108ff197d5aecfb2',0),(9980,1391821161,'e706cd5f9134db66657c47a72540afaa83ea2440','d89eae36a11ed013b6b77364eb04075ea6e61b9a',0),(9979,1391821161,'e706cd5f9134db66657c47a72540afaa83ea2440','38d32ffc9803dce6553cbf570eb00ff376e18cdd',0),(9978,1391821158,'e706cd5f9134db66657c47a72540afaa83ea2440','719b639984d8a6bfca1ef4632a61877b26196a44',0),(9977,1391821158,'e706cd5f9134db66657c47a72540afaa83ea2440','f2dbc693bc8336533e213c93f81ba60e80f6f4f9',0),(9975,1391821148,'e706cd5f9134db66657c47a72540afaa83ea2440','57ed3c7bcb528a5e7aefe3c092c559265ae25c2d',0),(9976,1391821158,'e706cd5f9134db66657c47a72540afaa83ea2440','dd2c88e11031a6492f535079b9fb10d30bcbf76b',0),(9974,1391821148,'e706cd5f9134db66657c47a72540afaa83ea2440','b9bb82fa2fddc446888ede981bf7cda25cab96e8',0),(9973,1391821148,'e706cd5f9134db66657c47a72540afaa83ea2440','2ed1878844efeb1c079d7be3c297031f91a9803d',0),(9972,1391821144,'e706cd5f9134db66657c47a72540afaa83ea2440','13ff3147231a46587a450b019632d7aa2e36db42',0),(9971,1391821143,'e706cd5f9134db66657c47a72540afaa83ea2440','e1c1d9fbe89213287458fa45d248722cc0215544',0),(9970,1391821116,'e706cd5f9134db66657c47a72540afaa83ea2440','963271e384ae128a3447f2172c9bd2ee38bc0980',0),(9969,1391821116,'e706cd5f9134db66657c47a72540afaa83ea2440','c360a0d22c17bee54e620d0cf24ee53408624304',0),(9968,1391821115,'e706cd5f9134db66657c47a72540afaa83ea2440','43c5604876ac3380216afc6023ef413a9fc928a5',0),(9967,1391821107,'e706cd5f9134db66657c47a72540afaa83ea2440','7ec95f7cd219d5b6f0f0ed2fc0514a611306d082',0),(9966,1391821107,'e706cd5f9134db66657c47a72540afaa83ea2440','efc4754aa76b49d07b58aecd0e56e62c643c4ed9',0),(9965,1391821101,'e706cd5f9134db66657c47a72540afaa83ea2440','6bbe7dd71c6e4ae6a90d6305fe3acbbf8f0139f9',1),(9964,1391821065,'e706cd5f9134db66657c47a72540afaa83ea2440','d7041b6073f12c32e5fe883d2c61d16ca8fedd7d',1),(9963,1391821064,'e706cd5f9134db66657c47a72540afaa83ea2440','700bd4c4cf21b3ee9f7a4b9d5fc4fb498a73de14',0),(9962,1391821063,'e706cd5f9134db66657c47a72540afaa83ea2440','dd62aebdbba249261b5049129b5cec6414bed2ce',1),(9961,1391821063,'e706cd5f9134db66657c47a72540afaa83ea2440','eed33447d6c225643d5859b8c58c8c54c2cd2024',1),(9960,1391821058,'e706cd5f9134db66657c47a72540afaa83ea2440','2807041089a3f17a646f146a1d6ed7553faba6b9',1),(9959,1391821058,'e706cd5f9134db66657c47a72540afaa83ea2440','7b4497dfc2a3a49504ea3119e1c5807339a5aea7',0),(9958,1391821055,'e706cd5f9134db66657c47a72540afaa83ea2440','6eca09cd3a18b4220900d8279bfdf98e7f6da666',1),(9957,1391821052,'e706cd5f9134db66657c47a72540afaa83ea2440','5fd91cb5efe3f9be34ddd8c5b8bd1fa402c6b702',1),(9956,1391821036,'e706cd5f9134db66657c47a72540afaa83ea2440','54a930e9eac5147165a86266b650ab569ea96224',0),(9955,1391821035,'e706cd5f9134db66657c47a72540afaa83ea2440','14045c6a64b7e0838c3c43ec92e1ff198102528c',0),(9954,1391821035,'e706cd5f9134db66657c47a72540afaa83ea2440','e3ee326fa13c6c0bfddb192f89394bc2a019fb47',0),(9953,1391821035,'e706cd5f9134db66657c47a72540afaa83ea2440','1fab41f6fbf587ec4762e05af4e099dd7f0c909c',1),(9952,1391821017,'e706cd5f9134db66657c47a72540afaa83ea2440','1592c8effff2a11b0456a1a62e3281fb226dfe26',0),(9951,1391821017,'e706cd5f9134db66657c47a72540afaa83ea2440','1495da55fd8e1f334fca28eba9c797520481d7ee',0),(9950,1391821016,'e706cd5f9134db66657c47a72540afaa83ea2440','7408dc55612f52def49681931a1617f36124d204',0),(9949,1391821011,'e706cd5f9134db66657c47a72540afaa83ea2440','25bbe90e74541b539707c1a72dae9ed01ac57adc',0),(9948,1391821011,'e706cd5f9134db66657c47a72540afaa83ea2440','ddd07af76aa6b45599d2c28b4db991d52d48709c',0),(9947,1391820970,'e706cd5f9134db66657c47a72540afaa83ea2440','eb80af01f749f0d4b3848874ae8f077638cc4d33',1),(9946,1391820936,'e706cd5f9134db66657c47a72540afaa83ea2440','5d0608cf55ea3c34f6b9ac9a20e1477335846613',1),(9945,1391820936,'e706cd5f9134db66657c47a72540afaa83ea2440','f509881b55496b4331c1b8d1100a663fc39eeabc',0),(9944,1391820934,'e706cd5f9134db66657c47a72540afaa83ea2440','fe799b800e088f5e36a68ad8a6c8a90c1d3fee74',1),(9943,1391820934,'e706cd5f9134db66657c47a72540afaa83ea2440','6f6a02d67f79b6fa72c4f43c758add0408813bb7',1),(9942,1391820933,'e706cd5f9134db66657c47a72540afaa83ea2440','412a66919a5eaf0a6c6318d8efc01b3d832a1ad2',1),(9941,1391820932,'e706cd5f9134db66657c47a72540afaa83ea2440','fd3ccda07d042278ded1c0910d6be6d54b2c119c',1),(9940,1391820931,'e706cd5f9134db66657c47a72540afaa83ea2440','620698bc962ff7be4c791ba485e5e8e04e84e601',1),(9939,1391820931,'e706cd5f9134db66657c47a72540afaa83ea2440','b5f26cca9c65325a53302c3bf8cd976a6324f4c8',1),(9938,1391820924,'e706cd5f9134db66657c47a72540afaa83ea2440','5d5f5515ff556100e1d1b89cb63e1db78aba8be3',1),(9937,1391820924,'e706cd5f9134db66657c47a72540afaa83ea2440','005b655595543fe70d4cfdd36690ae01bca216cb',0),(9936,1391820922,'e706cd5f9134db66657c47a72540afaa83ea2440','6bee1479904b3ad14dc4ab257f791e0bc2629ccf',1),(9935,1391820919,'e706cd5f9134db66657c47a72540afaa83ea2440','f33bceabe39d51dfd8609ba26582b4ffa9ee75b1',1),(9934,1391820906,'e706cd5f9134db66657c47a72540afaa83ea2440','575263d275b4d1953fcdecb4bc0f866e448a0b69',0),(9933,1391820906,'e706cd5f9134db66657c47a72540afaa83ea2440','92c791f1824983a93c8df07a19855ce003b32872',0),(9932,1391820906,'e706cd5f9134db66657c47a72540afaa83ea2440','f349579f9c8949612274eebd74d871505bb6f429',0),(9931,1391820905,'e706cd5f9134db66657c47a72540afaa83ea2440','92dd59cbd6090e185b7fa740c091868309eabd6d',1),(9930,1391820905,'0','09a9d3d6f73894450e9fc96edae7c6101eca51bd',0),(9928,1391820900,'0','4f7c0db69c8891c54ac68324609c14782fcaeefb',0),(9929,1391820900,'0','427ec294252ab33270fe88cade491c8a4c49ed5f',1),(9927,1391820839,'0','61b55a01b380374afea7efe2e87b392df553256b',0),(9925,1391820837,'0','efc0226736447d48f2150ee903db18e828c828cf',0),(9926,1391820838,'0','e4f11aa436c0d6bded6d5077a4821322a94028ca',0),(9924,1391819447,'0','8e76317d223794145f6e215140f927bb465bf908',0),(9922,1391819446,'0','bc3e1ca67b134b525abba55060dd6fd73cbe60b5',0),(9923,1391819446,'0','e8c41395587749cb15d9a19ee7410ffd7195836e',0),(9921,1391819441,'0','676924740231a791da9768675c88d6567f77100b',0),(9919,1391819430,'0','f5f8715a4e294111bee7835bf0138c30102fd000',0),(9920,1391819441,'0','aba5f69acfd5574afeeedc018d78196d15cab8cd',0),(9918,1391819426,'0','2ce1273666656837b4a521acbdf3d68f06cab067',0),(9916,1391819424,'0','2bad32b1420bbc1082aac3fec45b6de837e83b71',0),(9917,1391819426,'0','5df37be360b9ee838e0d3ce31ad5786f4790a8c4',0),(9915,1391818973,'0','5a7f1dc001a05db09d5dc96f94513bb347aaa9a6',0),(9913,1391818973,'0','84e1f160f8452a43819e57969ebe212406f27012',0),(9914,1391818973,'0','088f236dafb3f3ed3499d93eed1ea4d1a0e915f1',0),(9912,1391818973,'0','493022601e52074c1977c7a789d03e89668629c7',0),(9910,1391818926,'0','858d49796b940861c3216566a53db317a6a3017c',0),(9911,1391818927,'0','2ad83a79bae2b16e6a5aff976770f09e1697aa42',0),(9909,1391818926,'0','4377d4ba2475b841cb848682f0f61285c7fae879',0),(9907,1391818911,'0','6088cbd090145f4f596dfd645c7d7641d43a5284',0),(9908,1391818911,'0','fba3305d944c43fb47b8a6daf748b4bfe3e7a146',0),(9906,1391818911,'0','3c2b80dc4b743e588193b8ba423bbec81796f279',0),(9904,1391818906,'0','e1988ed3f61dfc6b4c80773359b97be66d032b2d',0),(9905,1391818906,'0','105850e96db7caa0da8790e3fbf31c32da5faeca',0),(9903,1391818905,'0','300a2a1d5dc2d707cd397632cbe8b182c6cd71ab',0),(9901,1391817055,'0','5027e59705b8153a13bc1f112435346704afe844',0),(9902,1391818900,'0','fee1252e3fe2d78d55031e2cf48c1a2c08b154f1',0),(9900,1391817055,'0','1e8337e1c7f783b8bbc5ff7e5c539ae0a19c0098',0),(9898,1391817049,'0','4ed0d8e678683ba0f0d14bbd9039af91dca2443e',0),(9899,1391817049,'0','f352ecc51030dd3c1ad26832e4226ef884a99010',0),(9897,1391817045,'0','4a5662995624d0003f10c791a6232b1d8a14e3cc',0),(9896,1391816137,'0','a265349bc12f0fcb05f22be0fd56f9010b39f4ef',0),(9895,1391815943,'f95fbed20decfbe156928fe7983e29aae5828452','0e39f01dad3e8020e8cf7b63f06ec759d80469c8',0),(9894,1391815933,'f95fbed20decfbe156928fe7983e29aae5828452','3279d37b07c8579ad7f23fc658ef8b4531beef08',0),(9893,1391815933,'f95fbed20decfbe156928fe7983e29aae5828452','4a0536aacd48df3ab3c3306a44a2739a8831d647',0),(9892,1391815928,'f95fbed20decfbe156928fe7983e29aae5828452','d3f2b8aa1daa46aff2ef980efdf8ac206da8aeaa',0),(9890,1391815926,'f95fbed20decfbe156928fe7983e29aae5828452','5d3f07a75501d3abe5463dacf710e6bd08ff325b',1),(9891,1391815928,'f95fbed20decfbe156928fe7983e29aae5828452','59862a04101dcbec5a3a60441899f1904f3c3f39',0),(9889,1391815926,'f95fbed20decfbe156928fe7983e29aae5828452','6870f234e2157f6109e46c817d91883468fc06c2',0),(9888,1391815923,'f95fbed20decfbe156928fe7983e29aae5828452','7e9020c0ab3492235a4247452d953f433a7c3a1e',0),(9887,1391815914,'f95fbed20decfbe156928fe7983e29aae5828452','f130b9ec8e324c1379539d392c995f3ab2bc8043',0),(9886,1391815914,'0','dfc3d3b8be5f5fa7455f236fe873c68c94aa6da5',0),(9885,1391815911,'0','252793239403f3d57f3bcc678a7bf063f5273256',1),(9884,1391815911,'0','ad36b093e3ec6c8ceed958b51214564f89ab772b',0),(9883,1391815911,'0','f5f9bc6fdbb918be69a436a2ac3009cffad1ee9c',0),(9882,1391815904,'0','4e617c74abcd7ce70e146e866a5edb5648f71f9e',0),(9881,1391815904,'0','0733e233a2b697222e328c21197bff96a44fef05',0),(9880,1391815903,'0','f9a5a0a4b6c38f4ddbb92a8818e736f71c2e976a',0),(9879,1391815635,'0','b3ad36e14e9ce047df02346a15909b54b3ed92c4',0),(9878,1391815635,'0','04a6c428be7559d55865dd3eda5134a1a5a6807a',0),(9877,1391815635,'0','0fd9168e4e109cc6f27623982079658334f22976',0),(9876,1391815635,'0','c8477dac486ce4a42888f4984d9596fa5d7ca1c3',0),(9875,1391815635,'0','dfa4276c098f20924f3ae488d139b4ca8b65f152',0),(9874,1391815634,'0','25c51f2bbf1006ec95b383b9aeefaaa84e674ebf',0),(9873,1391815634,'0','3268ff5b81100f383ecb3e95d4e8d2d41032a842',0),(9872,1391815634,'0','827ff46964bbf250c8659b8f58d0b4b7ae037ab4',0),(9871,1391815634,'0','83f16042dec04e65c589dcf63a10c5007b754a8b',0),(9870,1391815634,'0','5fd30852214e7ea4c1619ec65756828f0af35be5',0),(9869,1391812835,'0','d670591ad13740403cb25529497361ec4e00f5d6',0),(9868,1391812834,'0','0039dcaf4d7096ed5ac1a62852eabe80ade98578',0),(9867,1391812819,'0','329c15176b4bb6b1653d76ee28078841ab89c8ef',0),(9866,1391812818,'a317e45576947017c360802a7ef241ba3c4cd5bf','1f1121c8eeaf07fb37acad4ee86dd2d742af1c28',0),(9865,1391810684,'a317e45576947017c360802a7ef241ba3c4cd5bf','2e2ebca7e9aa09f563cf05ca7f96dd72189ecf17',0),(9864,1391810580,'a317e45576947017c360802a7ef241ba3c4cd5bf','beb8777737710e2bea91352f053cc1e8d2341666',0),(9863,1391810573,'a317e45576947017c360802a7ef241ba3c4cd5bf','595550ad50602dd42397425bf8c05dc779f8cb0a',0),(9862,1391810441,'a317e45576947017c360802a7ef241ba3c4cd5bf','69e6b60d097ccdea56e5c2d33bf77620a52268de',0),(9861,1391810430,'a317e45576947017c360802a7ef241ba3c4cd5bf','220e4e17b51c5263d94147e743f15f6b89cff96a',0),(9860,1391810418,'a317e45576947017c360802a7ef241ba3c4cd5bf','f4ac5569281ab18ae034a0bd7f42515297fcabfc',0),(9859,1391810416,'a317e45576947017c360802a7ef241ba3c4cd5bf','1cdf361adc9d91fc119726085a945d5ef4f259bb',0),(9858,1391810413,'a317e45576947017c360802a7ef241ba3c4cd5bf','042e88c94696fa217364125278919560d4a7fc1a',0),(9857,1391810367,'a317e45576947017c360802a7ef241ba3c4cd5bf','6bf7d3e5d299cad0dd16b27e1b6c1ae45b1a2c0e',0),(9856,1391810358,'a317e45576947017c360802a7ef241ba3c4cd5bf','d854abb8ae3f7f504b9c451d8a8d15ebd2f989c9',0),(9855,1391810356,'a317e45576947017c360802a7ef241ba3c4cd5bf','87a932444ac968436f9cbaeddc1b652f31896474',0),(9854,1391810350,'a317e45576947017c360802a7ef241ba3c4cd5bf','a7b63cea77bac88b7bc0e510f71c99248a9d3f9c',0),(9853,1391810348,'a317e45576947017c360802a7ef241ba3c4cd5bf','449c599d061c5d83e2d5bbe1b6a41d0dd0673379',0),(9852,1391810260,'a317e45576947017c360802a7ef241ba3c4cd5bf','1702461372d801bb12bb3b56db0a3332eaa7e2a8',0),(9851,1391810257,'a317e45576947017c360802a7ef241ba3c4cd5bf','d10f140b2a293e9e58f08b283397215d1649e700',0),(9849,1391810252,'0','4b4f573f925651d44547865cc5ab68f18f39cd64',0),(9850,1391810252,'a317e45576947017c360802a7ef241ba3c4cd5bf','36b7663d8062738049eec73d24e4e905e2b0de1f',0),(9848,1391807942,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','64445147247e69e54776b2ad4dcd8a89e5208d33',0),(9847,1391807941,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','584857b7c51d56dddaf928912d80e6d97f092df9',0),(9846,1391807938,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','ab3e3147b12b771791eee56faa02a542780f7ef8',1),(9845,1391807926,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','ecc1a92b2e7ce6d2eb63317e9fec12955b2ddf9b',1),(9844,1391807926,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','8fb1d3341efdd2f910e9e6940409c227abdd4f57',0),(9843,1391807926,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','b0ae987df96f7a9ad0ecff1778361988078b510c',0),(9842,1391807923,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','6aa0cacc1e9f47e9ceec7ef344b0f122652774c3',1),(9841,1391807920,'ac5b53e1e7c0334a015b19fa6965bdcc1bd1f601','bcd60a52e66bc7931bc333910d50332f5825824a',0),(9840,1391807912,'ac5b53e1e7c0334a015b19fa6965bdcc1bd1f601','f31b4d8db6e7d786e271b82b5ec3d1d1a610158a',0),(9839,1391807908,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','4fbdb0e7f29c09dae8a8231e3ffeceaafec1b4c2',1),(9838,1391807908,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','3e6fc2defd064b5f742f56a0b0c5b99dd37655b7',0),(9837,1391807908,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','6f89a2efc8d34568af5c3b961498ae8094650185',1),(9836,1391807908,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','c7e7d71fb4a52de688753304939a318b881d4a1d',0),(9835,1391807908,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','ea1e13f5f62ed967e424fb9879e3a825d5ee16f3',0),(9834,1391807904,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','9024e0d2386eeeb8afa442ea6cd30a447e87711d',1),(9833,1391807899,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','f415f67ddff92613d90ec135ea65c4946cd0b548',1),(9831,1391807897,'0','3bf1f641107f13b9f45b4698cc8120186fa69524',0),(9832,1391807897,'ac5b53e1e7c0334a015b19fa6965bdcc1bd1f601','bf57b51ecd84bb4d990d3ef8555cef56f5adeda1',0),(9830,1391807890,'0','c25d1b46f43c6db1928c39df6bda7251898dbd62',1),(9828,1391807889,'0','5ed04ea368b3f74a4895cc0c2836d7401400794f',0),(9829,1391807890,'0','078dacf6775a8ef45b57cc8d13d70c64099a0b6a',0),(9827,1391807886,'0','1abab9e55113bd39c96bc872e5d32ada6a30517a',0),(9825,1391807885,'0','61275bd10382fc2a1051bf7c1a05dfa7fb481f5a',0),(9826,1391807886,'0','8c62bf8adf6101c09eb542a7157a915592680ed4',0),(9824,1391807874,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','d205f31819220050c87e2be582e5d422990f3e3c',0),(9823,1391807874,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','4143ee0da5dbd4d5f800837f9f6bef2b687a3ab2',0),(9822,1391807873,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','ca4cf13b26b9da94ef39d88b37acd248c40e8c4f',0),(9821,1391807873,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','acb02d3c17ee5574dcbd54bc758db42d59875271',1),(9820,1391807855,'0','92f434712d8a8c4100f9aca0765f9532dd35ad2f',1),(9818,1391807839,'0','82dbca3cc43d07d2f19917d34f83557d0c2eb7ee',0),(9819,1391807855,'0','9962fdad4da626e911c6725992914033e180bb0b',0),(9817,1391807839,'9bf56961721454da75b01fb0a6f1c1565df62075','318c23dc531794eb09b52feed34953eb900694ab',0),(9816,1391807809,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','2ad2ae77cb3a6781746b43c81aacf9356cbc1380',0),(9815,1391807809,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','5959b337e946b571958dc40a1cd12a78f79ef90e',0),(9814,1391807799,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','86a24c1d7fe4061a1d450368bfd2a42ead7383c5',0),(9813,1391807799,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','d610c0c9bf6231449a04e35754c4addc86730b7f',0),(9812,1391807798,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','e00cfa10216b485920b3e92132717293d766d5ce',0),(9811,1391807781,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','72beafc28101d87d55ce492dbf26010787bed218',0),(9810,1391807780,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','0058a35722dbbc293d7f195030f449fcee8ccdac',0),(9809,1391807767,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','362cbbb9ddaae783a0e736eb62bcda631f2858b7',1),(9808,1391807766,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','d29cd9e2a1b34afedaf81a32f0abcfceb6147990',0),(9807,1391807763,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','7e3ed2a4b29d9a85694519cd10a6193852912d4b',1),(9806,1391807754,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','14943a6bfc16411492c95ca99d7644b1a50ddc3b',1),(9805,1391807706,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','cf3fed5b79c40c5f00526dcc7a3119253a0c5b11',1),(9804,1391807706,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','bd499055b1fba6a0749d94dd3df3a288fe53d733',0),(9803,1391807705,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','1f16f68eaa17de5fd30081995fdd2529b5cf74b4',1),(9802,1391807692,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','4b9695924ac5741cd6e3afea8d5f9c2ca746a0ee',0),(9801,1391807692,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','774a22c7209799b5e72745bfb81d131759daf19a',0),(9800,1391807692,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','5ce2f292748193216d96f9ee24bb9a2ceb86619c',0),(9799,1391807691,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','22350afc23d080f4070060b0490c2784d02ecfd3',1),(9797,1391807685,'0','cb5664443449b1c000180b558824f1cf49e3c838',0),(9798,1391807685,'823298a9e3539041d3c51ee88fbc9a7ca915fd79','ca53f7ca34bf2620bee7ca9ebab325ebf1d54d72',0),(9796,1391807679,'0','20fbf0cd9bf4289f27a42b6c6a40d3e83e4f71e1',1),(9794,1391807678,'0','f162066925c51bec65f844e64eb6d1afe8e3d16c',0),(9795,1391807679,'0','75fede0a9b6eda53cb5b2a15499202f7ff2b674b',0),(9793,1391805433,'9bf56961721454da75b01fb0a6f1c1565df62075','0eaeab05b8bfdc7cc15f98f94d7e66672a770e6f',0),(9792,1391805433,'9bf56961721454da75b01fb0a6f1c1565df62075','3371bb802106ffff89a2d03e51204510ca2e2137',0),(9791,1391805408,'9bf56961721454da75b01fb0a6f1c1565df62075','f33abbcf28f46d4477e4bee76e1c6498dd9d0870',0),(9790,1391805401,'9bf56961721454da75b01fb0a6f1c1565df62075','e7e70108b624ca5554590bb3fb70045c5b08a46a',0),(9789,1391805400,'9bf56961721454da75b01fb0a6f1c1565df62075','98a2398ebe9659e5aea74be5093490a984e12f5b',0),(9788,1391805397,'9bf56961721454da75b01fb0a6f1c1565df62075','7c1575c67bd06f5269777aba2351d6c9e373695a',0),(9787,1391805397,'9bf56961721454da75b01fb0a6f1c1565df62075','710ac73654839a249bb8757929a5a754533e5818',0),(9786,1391805396,'9bf56961721454da75b01fb0a6f1c1565df62075','a57bed516a2a86af49335ca718cdf2e503bd5a36',1),(9785,1391805381,'9bf56961721454da75b01fb0a6f1c1565df62075','038d7d5c51c4325da5bb53a7c083b11497a10d78',1),(9784,1391805381,'9bf56961721454da75b01fb0a6f1c1565df62075','7d50905779d5f3838f87e6ffa2eba6902fc126a7',0),(9783,1391805378,'9bf56961721454da75b01fb0a6f1c1565df62075','1639a5b3ed68d2f477beba3d1864dd876142028d',1),(9782,1391805373,'9bf56961721454da75b01fb0a6f1c1565df62075','8db157eb749397ce60257529e01c2b94a37fcaa8',1),(9781,1391805372,'9bf56961721454da75b01fb0a6f1c1565df62075','268254b6fecc10003676ac0bc2e23986ea6c55e2',0),(9780,1391805368,'9bf56961721454da75b01fb0a6f1c1565df62075','ffe385e2df73a9d4f2a0a3f8294a9fb50ec5db58',0),(9779,1391805366,'9bf56961721454da75b01fb0a6f1c1565df62075','141a21271f69f4ded2e3ca234df26444e661d569',0),(9778,1391805360,'9bf56961721454da75b01fb0a6f1c1565df62075','2fa02ddc3ec0123ce32da335fa786d6b96ee7514',0),(9777,1391805360,'0','962e6a349e04c90d74559bbd7ff55d7dd03897cc',0),(9776,1391805324,'0','1d188d2bed26b3eb1f1cd99eac050664d25107e5',0),(9775,1391805323,'0','2f56b9400f04329cc2a985be8ae2ccd2cddb7a79',0),(9774,1391805262,'0','3009b33dfab5ced15a6c64abeb8a05261623f149',0),(9773,1391805255,'0','f115dd50466ed369d904bf7c362b522b124aafdc',0),(9772,1391805255,'0','541091d4791a943cdc5faa88d1d799da38b956ec',0),(9771,1391805252,'0','a1eb4cc15db23ce321ce282c3eb8095f67f45611',0),(9770,1391805246,'0','d2bece9eba1fdd4c55185e5403ef4f2464a4c8b3',0),(9769,1391805242,'0','47c80ea786efdb1377095f2a37eee282abc29d67',0),(9768,1391805242,'0','5f701f11458fea3c587dc503ca20942c935c3480',0),(9767,1391805242,'0','72ac3290617bd205af9f0acc7dea02afd8404cb1',0),(9766,1391805240,'0','41dad5b32cd62fa349c3ae34bde066043f95c3ec',0),(9765,1391805240,'0','1f18ac4937cf83a156072ed089c435e02dc692b6',0),(9764,1391805240,'0','7a30eeb703cc4ad81549aacc173fd1142626c78b',0),(9763,1391805239,'0','a2551a912edc2210c877f8c8cff737453fbbd438',0),(9762,1391803043,'0','bcecf8d9cf219bf5d863afe899947712023874d1',1),(9761,1391803043,'0','e52d98e990b0c9c1d6b6c87527c71645a826b064',0),(9760,1391803027,'0','930f0442dc94cb7ea532b329ce924e8d86f9c06c',0),(9759,1391803027,'26ff27b684d0972225551c21b57e73eef601bcc6','c8aeecbb47a179923553019bfdb1babbe5a80ddd',0),(9758,1391800875,'26ff27b684d0972225551c21b57e73eef601bcc6','f922be83b0def015b148bc95804265a7afa66b47',0),(9757,1391800839,'26ff27b684d0972225551c21b57e73eef601bcc6','093da1bd26fd59cac28b17cd3cf36989ea3371e5',0),(9756,1391800839,'26ff27b684d0972225551c21b57e73eef601bcc6','02008ecbf28a07a0965344e9f55e4885ff90c9ab',0),(9755,1391800839,'26ff27b684d0972225551c21b57e73eef601bcc6','4272672831161cc48b4b4d12e24f05eb2d683d6b',0),(9754,1391800834,'26ff27b684d0972225551c21b57e73eef601bcc6','a57480cc1ea52ef2c41361a308c7daedb37a3681',0),(9753,1391800833,'26ff27b684d0972225551c21b57e73eef601bcc6','77e4cf591d4f0e95edfdce38571583447c619a38',0),(9752,1391800833,'26ff27b684d0972225551c21b57e73eef601bcc6','af12c370cdfaf6b292d867711a2e7cd359acb28f',0),(9751,1391800833,'26ff27b684d0972225551c21b57e73eef601bcc6','325c671796796a1aae453b7b0532287eb8f629f0',0),(9750,1391800829,'26ff27b684d0972225551c21b57e73eef601bcc6','147950a23f2d6f79d28056cadde7fcbad9290f49',0),(9749,1391800815,'26ff27b684d0972225551c21b57e73eef601bcc6','8ec28f45d804bf4d610c99b1e135243186cd8189',0),(9748,1391800815,'26ff27b684d0972225551c21b57e73eef601bcc6','f383f8c56cb35f1f7125b72da0af8c0cc1e63345',0),(9747,1391800815,'26ff27b684d0972225551c21b57e73eef601bcc6','31c74fc6c9b91aa999a8cc86a786e056fcaa9e7e',0),(9746,1391800811,'26ff27b684d0972225551c21b57e73eef601bcc6','4a8a5f962eddfa73ce37039e75d220f8339c907d',0),(9745,1391800801,'26ff27b684d0972225551c21b57e73eef601bcc6','7c09eeae2ee4fd00725af0867615e3ca1ca54f08',0),(9744,1391800801,'26ff27b684d0972225551c21b57e73eef601bcc6','347b25daf97a0459238689547b09e5bedc975b1e',0),(9743,1391800801,'26ff27b684d0972225551c21b57e73eef601bcc6','b8e80681fb783977d15595495f5783902659c357',0),(9742,1391800799,'26ff27b684d0972225551c21b57e73eef601bcc6','968b55015a6c2a536e78508b1c8c961f95dce08a',0),(9741,1391800795,'26ff27b684d0972225551c21b57e73eef601bcc6','3461a1d024d546fb6d00bb039b28175840565141',0),(9740,1391800795,'26ff27b684d0972225551c21b57e73eef601bcc6','f8ce7f1f657fe70afdc7c10225f71672d1237870',0),(9739,1391800795,'26ff27b684d0972225551c21b57e73eef601bcc6','4b59065d4f36f8d9cd3451c16d7f24b25e2c538c',0),(9738,1391800793,'26ff27b684d0972225551c21b57e73eef601bcc6','c1a5f3576c6a0d25f8a80cfc458b64b860a1c857',0),(9737,1391800793,'0','848c736b968881ca4b90af142be5a68f1a1ccaff',0),(9736,1391800792,'0','4d685f7ab3b1ead120ff1aa9a3d45062b7f01f94',0),(9735,1391800781,'0','0d8b05fa8fda9217c9acb2053e05d5969997bebc',0),(9734,1391800780,'0','b50eb299d84d76fd45f1fc233062b4cd7eeb59c5',0),(9733,1391800780,'0','6f805b199f31bb86f9c8edaf7e818c805153ef45',0),(9732,1391800780,'0','9a54ac75ad4cc31563c55bbb26374d0adf74d5d7',0),(9731,1391800740,'26ff27b684d0972225551c21b57e73eef601bcc6','a6d344d48ce14168509255177437ee5ce5ff0582',0),(9730,1391800740,'26ff27b684d0972225551c21b57e73eef601bcc6','053bb21c60e5d8a9b985341c4379938525a26110',0),(9729,1391800740,'26ff27b684d0972225551c21b57e73eef601bcc6','9d745f2538ab679359563cd071eda2da4989281c',0),(9728,1391800739,'26ff27b684d0972225551c21b57e73eef601bcc6','e2f1a603e5788f974ec8024818fc87c4aaddd92a',0),(9727,1391800725,'26ff27b684d0972225551c21b57e73eef601bcc6','575e3ee1796288833de126b25e54e0caa6df4077',0),(9726,1391800725,'26ff27b684d0972225551c21b57e73eef601bcc6','59dc75d5a1d98ec9ba32a88429d6694cec874f4e',0),(9725,1391800725,'26ff27b684d0972225551c21b57e73eef601bcc6','38115cdba123b6dd44803535d98e78a98fc9ec3e',0),(9724,1391800721,'26ff27b684d0972225551c21b57e73eef601bcc6','07fb6b2d5999650738cb856e4d253e7f28e60437',0),(9723,1391800721,'26ff27b684d0972225551c21b57e73eef601bcc6','1e957a6ba07955fa1d3a744a12cefadb04d31c5e',0),(9722,1391800721,'26ff27b684d0972225551c21b57e73eef601bcc6','59dd9404483be048519cdaf3849f526cac336340',0),(9721,1391800715,'26ff27b684d0972225551c21b57e73eef601bcc6','5d544b26a8297babde440a42824948a034216409',0),(9720,1391800710,'26ff27b684d0972225551c21b57e73eef601bcc6','8da6b7cbb6fbfb11aa6ff09a9478a404d2bb080f',0),(9719,1391800710,'26ff27b684d0972225551c21b57e73eef601bcc6','fdbbbff692e8e441d68296dbd86eb9898f045d8e',0),(9718,1391800710,'26ff27b684d0972225551c21b57e73eef601bcc6','445b163abe820a8c91a4176fdee29efbcbe20d25',0),(9717,1391800707,'26ff27b684d0972225551c21b57e73eef601bcc6','13f3ff4573a3bd555d70e9ae1c05cb47f9f840a1',0),(9716,1391800707,'26ff27b684d0972225551c21b57e73eef601bcc6','21376bf886da8fe961b4a47c559329820ce7069a',0),(9715,1391800707,'26ff27b684d0972225551c21b57e73eef601bcc6','16d739567dd49ed59f7ea56736244efb91d23361',0),(9714,1391800702,'26ff27b684d0972225551c21b57e73eef601bcc6','3fd6ad1145361a1d6f11c5f0eebd7ab69dc229f6',0),(9713,1391800702,'26ff27b684d0972225551c21b57e73eef601bcc6','433b454121e4accf40b5bbe063da2671f6b94f90',0),(9712,1391800660,'26ff27b684d0972225551c21b57e73eef601bcc6','b2b8bb9506de53cc97135d494e357099d7fbed61',0),(9711,1391800660,'26ff27b684d0972225551c21b57e73eef601bcc6','42c4680192c0b3fe653e435fea68bd5097bbaf89',0),(9710,1391800660,'26ff27b684d0972225551c21b57e73eef601bcc6','904c180a83361336ad46afd8b1af1fcb1a4e579c',0),(9709,1391800610,'26ff27b684d0972225551c21b57e73eef601bcc6','62b5a22dab821ba6b7bf73c082226fb003d622f3',0),(9708,1391800610,'26ff27b684d0972225551c21b57e73eef601bcc6','f9d5a3948eabdfb23257da0451e62b52e2113aeb',0),(9707,1391800608,'26ff27b684d0972225551c21b57e73eef601bcc6','a694197fdfd13b2c0f107bb1b910a4152240deea',1),(9706,1391800588,'26ff27b684d0972225551c21b57e73eef601bcc6','ac26629bc7b3b024c2f63c6bab7c8c25c078943a',1),(9705,1391800577,'26ff27b684d0972225551c21b57e73eef601bcc6','cdd56049f40d0a236a27d7d88ff38987e8fdd31d',0),(9704,1391800573,'26ff27b684d0972225551c21b57e73eef601bcc6','b04c0a4c07996338fca589f4532bcf3e472b7d22',0),(9703,1391800573,'26ff27b684d0972225551c21b57e73eef601bcc6','dd4ec1aa6b06da2f7cbb6c91a31de64b0d5ea2e6',0),(9702,1391800570,'26ff27b684d0972225551c21b57e73eef601bcc6','cc01baa74bdd8c1f83aa5c611f6223de1dd9069f',1),(9701,1391800549,'26ff27b684d0972225551c21b57e73eef601bcc6','c5191d3525d6c513c0608ca769574fcd96bfa38b',1),(9700,1391800544,'26ff27b684d0972225551c21b57e73eef601bcc6','033eb13f27f49f8c55c788972cd71618a110af66',0),(9699,1391800541,'26ff27b684d0972225551c21b57e73eef601bcc6','baca918430499c0b2ff0012e4f396fd8a1c0ec8f',0),(9698,1391800537,'26ff27b684d0972225551c21b57e73eef601bcc6','d1188a005e6c35857314ca142c38e06b2a72d705',0),(9697,1391800535,'26ff27b684d0972225551c21b57e73eef601bcc6','11ea68a06948cf16ad62cf3f5879ec9fd6d631c3',0),(9696,1391800501,'26ff27b684d0972225551c21b57e73eef601bcc6','ce1209f9cd9d93d47a6d18e1d41a8755383c837b',0),(9695,1391800501,'0','515edc1c7de52c114fe63e9fc3a31efa0a6875d6',0),(9694,1391800457,'0','51f934b958e82954a8936c750cc971f8e73c8973',1),(9693,1391800457,'0','4a04e1088c7c5747df1a66c09aeafe36cd3fae22',0),(9692,1391800457,'0','77ac111400f1631759e90941f65c9a97283a8108',0),(9691,1391800451,'0','a3eb7e3ac13db5c91c9b5c1ad081998c5f27e956',0),(9690,1391800451,'0','aea789b99e8d696c644658fd9310d1bc3a82e933',0),(9689,1391800447,'0','dcb3f710893ed8a11fc3855bf673e874420faa5e',0),(9688,1391796547,'0','78f7a2a2598fef4aaf1c17c139b50acd989253ce',0),(9687,1391796547,'0','dbc4315562dfe8df2b731051da2a17a02d9e35dc',0),(9686,1391796546,'0','2c215fde38f9aeca9226b13da80619e2f87c26ab',0),(9685,1391795151,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','5829e4eb2e56b16118b34a9c48549f2ae0c0b975',0),(9684,1391795088,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','017b64ce7ff0e95230696aa7fd7848d4f3649e1d',0),(9683,1391795073,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','d64308a6a18b28b67565c6f59625b023580c7d89',0),(9682,1391793048,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','98d343dfa795161ecb5ecb7bd6dc6c055dcb19ce',0),(9681,1391793048,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','e0ddb2a7cc359a289a8a384fc7ead6018ab74081',0),(9680,1391793038,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','24e30922073afe8ba8cb8f2352a30470f8b6c148',1),(9679,1391793033,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','9a12c3770d3c1e6c11d4bc165f80b75ae1a15764',0),(9678,1391793033,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','70c36c1c3070f9922da580311ddffc73209bdf83',0),(9677,1391793028,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','d9579696fc5d568fef6d5dfd71aba51dd8fcd11b',1),(9676,1391793020,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','e47e976794d0ce0880514b980b6956be85098f79',0),(9675,1391793017,'d584d520141a9fe1f9f4273ae6add24bbe8d1938','0dcf1c035721acd7ca18e8f8e59e80956b4f9ae8',0),(9674,1391793017,'0','fade059b96b211b7ca52320fc99ac623f6575f8e',0),(9673,1391793009,'0','9ebc703b23bd4849c7197651b8037e9bec486fc5',1),(9672,1391793008,'0','db90039b8dd3c98153f7bf45d7555c8e819ad49a',0),(9671,1391793008,'0','66999e162ef4fa52064436e33278c6cc4a320106',0),(9670,1391793006,'dfb000510ba397428694e504f9ed418eb366cdd9','1320ae188b37d3e16e4247fc0f42efd5286907a4',0),(9669,1391793006,'dfb000510ba397428694e504f9ed418eb366cdd9','3da7dfa806b65de32d3cce9e2cf4951c382c7f6e',0),(9668,1391793005,'dfb000510ba397428694e504f9ed418eb366cdd9','1213a63c4fb1cf0a4c3cd39e54db478df6c28d32',0),(9667,1391792090,'dfb000510ba397428694e504f9ed418eb366cdd9','0f19c66e99867bcf9d5be4476eb1cee5dab44be0',0),(9666,1391792085,'0','2a140529d6402612af53c982483eaa26becc4362',0),(9665,1391792085,'0','7e696e11525debbbb3b71b05ee5af1f3c0f6d833',0),(9664,1391792085,'0','987be22a522a7a0375bdde4b037db2f49e4cd01b',0),(9663,1391791570,'dfb000510ba397428694e504f9ed418eb366cdd9','df0d8d0dffc5ac8cb8d6958e98b5bb1a4f3ca7e7',0),(9662,1391791570,'dfb000510ba397428694e504f9ed418eb366cdd9','a39b41c79b877c6308473a61226ebf8dd38ccfac',0),(9661,1391791558,'dfb000510ba397428694e504f9ed418eb366cdd9','dc4b64126660d23967d125626803b0530800af03',1),(9660,1391791556,'dfb000510ba397428694e504f9ed418eb366cdd9','932e84c30a2513b6fd6397e22d554773e79bdf96',0),(9659,1391791555,'dfb000510ba397428694e504f9ed418eb366cdd9','b45dd49fbad0ad168ef07939273d2e1db638d2f6',0),(9658,1391791542,'dfb000510ba397428694e504f9ed418eb366cdd9','260a454560f9c3db1eb2746f0e8d4b772e42a5fc',1),(9657,1391791538,'dfb000510ba397428694e504f9ed418eb366cdd9','c14ba1d299be1f38ee1b951966f13b60276d7a7b',0),(9656,1391791538,'dfb000510ba397428694e504f9ed418eb366cdd9','b6ad9423deb40788844bfa229fd11a2cbbbed419',0),(9655,1391791523,'dfb000510ba397428694e504f9ed418eb366cdd9','4526be0c9c348be93010ce18ed23d18a30ceb991',1),(9654,1391791519,'dfb000510ba397428694e504f9ed418eb366cdd9','555f497442b4163906cfc4f191378d8e9bc0cab9',0),(9653,1391791519,'dfb000510ba397428694e504f9ed418eb366cdd9','76f445fd90905fa7c5aceecf9557850d6638ed00',0),(9652,1391791510,'dfb000510ba397428694e504f9ed418eb366cdd9','2b0e1d77cfe3179a81220fb03f7a517af7e16693',1),(9651,1391791507,'dfb000510ba397428694e504f9ed418eb366cdd9','91aca47805d0d3c3f09d4eba65bdc62a49b58b54',0),(9650,1391791507,'dfb000510ba397428694e504f9ed418eb366cdd9','f97ec849a889f0d75939c777623d735bb2acd992',0),(9649,1391791492,'dfb000510ba397428694e504f9ed418eb366cdd9','8dc24f4c1e9246888a80a93975a0c4b07d7aecac',1),(9648,1391791490,'dfb000510ba397428694e504f9ed418eb366cdd9','343cb032ee00b83ab37d5684a857ac55a1d970af',0),(9647,1391791486,'dfb000510ba397428694e504f9ed418eb366cdd9','afabbd163f26f6d63267f3131b3c91ade68d3913',0),(9646,1391791486,'dfb000510ba397428694e504f9ed418eb366cdd9','d21d5c203e00e670afecf9aaa23e7257ebef4666',0),(9645,1391791479,'dfb000510ba397428694e504f9ed418eb366cdd9','d4d874746a75699e0c37353836c521ada36bc0fb',1),(9644,1391791477,'dfb000510ba397428694e504f9ed418eb366cdd9','a4ad6bfc76633ab4ece9e6edcfccd08c63e0ff8c',0),(9643,1391791473,'dfb000510ba397428694e504f9ed418eb366cdd9','21f22764dde47b82b1572cd2cdebbed454214ea5',0),(9642,1391791473,'dfb000510ba397428694e504f9ed418eb366cdd9','00f5dad7fd2d67d8cf75b8c0ae51713554066064',0),(9641,1391791464,'dfb000510ba397428694e504f9ed418eb366cdd9','194235c6646aee082ecbdb93f7c1d09b8f26e376',1),(9640,1391791460,'dfb000510ba397428694e504f9ed418eb366cdd9','dfdc3fe7be909dec72574341bcd97ac355dfbf8b',0),(9639,1391791460,'dfb000510ba397428694e504f9ed418eb366cdd9','3d95e185b1c631c51ae8452a6074e48c945c7c07',0),(9638,1391791441,'dfb000510ba397428694e504f9ed418eb366cdd9','2d98f2a5489fe62cb61ea2c6732e72576f94ba1c',1),(9637,1391791438,'dfb000510ba397428694e504f9ed418eb366cdd9','c40e8375d587ddb2142598b46796e6841aebf0c1',0),(9636,1391791438,'dfb000510ba397428694e504f9ed418eb366cdd9','b383453d2eb5f0baaebf695e454bb18d564b081d',0),(9635,1391791430,'dfb000510ba397428694e504f9ed418eb366cdd9','c23da22a6d48495a08ef195cfa587bae7ef55e1a',1),(9634,1391791427,'dfb000510ba397428694e504f9ed418eb366cdd9','2fcfa6404d2a2c01bb214b7bff07364cc3e3e642',0),(9633,1391791427,'dfb000510ba397428694e504f9ed418eb366cdd9','716ca0374e7861650e0308e7688787f86e6afb01',0),(9632,1391791421,'dfb000510ba397428694e504f9ed418eb366cdd9','f08632c6ce81273065170624a379a19af48b12eb',1),(9631,1391791417,'dfb000510ba397428694e504f9ed418eb366cdd9','5d68d6363669e17ab259d8d1a515fe58a4a12360',0),(9630,1391791417,'dfb000510ba397428694e504f9ed418eb366cdd9','3de5f35c2befa955481474fd868a154e7ca2f499',0),(9629,1391791389,'dfb000510ba397428694e504f9ed418eb366cdd9','7c7bad475fb146588e5d938789a09259ae13e967',1),(9628,1391791387,'dfb000510ba397428694e504f9ed418eb366cdd9','31200a153f9cb4cd1c064c944b557b9962b69b4e',0),(9627,1391791387,'dfb000510ba397428694e504f9ed418eb366cdd9','25bbb6eea5ba433d809e26853dba8424a81be04e',0),(9626,1391791375,'dfb000510ba397428694e504f9ed418eb366cdd9','e613c2403d3480cc653edfea467ee9ffe383b491',1),(9625,1391791371,'dfb000510ba397428694e504f9ed418eb366cdd9','246a128331b732b08b245d2710a256ad99417742',0),(9624,1391791370,'dfb000510ba397428694e504f9ed418eb366cdd9','6b6051384c54deb7192a0752feb7b4dd4c323824',0),(9623,1391791359,'dfb000510ba397428694e504f9ed418eb366cdd9','e29f61ff98c80e19c657d2d1de19dfbded8f39fd',1),(9622,1391791357,'dfb000510ba397428694e504f9ed418eb366cdd9','4fe47b7fd5d70a35f367d3153b7c26f08fcf06d1',0),(9621,1391791357,'dfb000510ba397428694e504f9ed418eb366cdd9','8a2013e69e674db829ac9c9ec83afa32d751d214',0),(9620,1391791343,'dfb000510ba397428694e504f9ed418eb366cdd9','adce60fa0cbf3d24614f47065e358f9b7217a232',1),(9619,1391791338,'dfb000510ba397428694e504f9ed418eb366cdd9','d6c1165fa3c2a9ce70eaad2ac3a5dbaed443e4f6',0),(9618,1391791338,'dfb000510ba397428694e504f9ed418eb366cdd9','a218e7860fcdfefbd8e3aeae929376511268855a',0),(9617,1391791328,'dfb000510ba397428694e504f9ed418eb366cdd9','a33478ae1b06f5489bdff4a875ef75845b4bb2c8',1),(9616,1391791321,'dfb000510ba397428694e504f9ed418eb366cdd9','4d33a4413fee6305a39562cee0e6f7c469ebc863',0),(9615,1391791318,'dfb000510ba397428694e504f9ed418eb366cdd9','344a79e6176ccde4a3daf4e53140ec78c99756d0',0),(9614,1391791318,'dfb000510ba397428694e504f9ed418eb366cdd9','c2c17c59a3e318897cb9160a4b852f1193c5cf39',0),(9613,1391791316,'dfb000510ba397428694e504f9ed418eb366cdd9','949d4baa6022f3fb0cd56e1f0dd01dc4f686873a',1),(9612,1391791311,'dfb000510ba397428694e504f9ed418eb366cdd9','917964796f6cf0df99b653b0b06cd1d7564bba9d',0),(9611,1391791309,'dfb000510ba397428694e504f9ed418eb366cdd9','13412b8b62448babe20a09941f64298e6274715e',0),(9610,1391791298,'dfb000510ba397428694e504f9ed418eb366cdd9','f4d9cb4c4ede996bdc5bf7ed5fdcdd69a8c0c540',0),(9609,1391791288,'dfb000510ba397428694e504f9ed418eb366cdd9','b27a1aef0e8156baa0591cc40a5e21880ee7d736',1),(9608,1391791284,'dfb000510ba397428694e504f9ed418eb366cdd9','f39ba4aa05e7315b0188c5e67f578cd74fe332f0',0),(9607,1391791284,'dfb000510ba397428694e504f9ed418eb366cdd9','3ec3162d48644b986211b11ce157dcebf44518dd',0),(9606,1391791275,'dfb000510ba397428694e504f9ed418eb366cdd9','e5bc637a26f61740000be9fe319fc0c25bab863b',1),(9605,1391791273,'dfb000510ba397428694e504f9ed418eb366cdd9','09594bfbe7f7b122e0e9bb5324e589b0cb94c35b',0),(9604,1391791273,'dfb000510ba397428694e504f9ed418eb366cdd9','e79357f13c9c0d4f9642c8a63e096c86df8cda84',0),(9603,1391791230,'dfb000510ba397428694e504f9ed418eb366cdd9','4d7e0419ef6dbd3f867bb18cef5de4223ad0d970',1),(9602,1391791227,'dfb000510ba397428694e504f9ed418eb366cdd9','24102ff3ede4137075907c6157b67636a648a575',0),(9601,1391791227,'dfb000510ba397428694e504f9ed418eb366cdd9','07f21bf01fdafaa8d01a1b71c1eab448426638ab',0),(9600,1391791179,'dfb000510ba397428694e504f9ed418eb366cdd9','3f7479ba1c3d2c965f681ca8a4a76b0603742137',1),(9599,1391791175,'dfb000510ba397428694e504f9ed418eb366cdd9','474956b243780e285a6c4f01b9ff08c16820a006',0),(9598,1391791172,'dfb000510ba397428694e504f9ed418eb366cdd9','a629bac5ede28f0e2b74bbf92d637c2a6fc0ee98',0),(9597,1391791171,'dfb000510ba397428694e504f9ed418eb366cdd9','9410942789181dcaaa2683e1736f91e706a97360',0),(9596,1391791158,'dfb000510ba397428694e504f9ed418eb366cdd9','68902ef5931a1321bd08dcc41b4ca50d438d3e4d',1),(9595,1391791143,'dfb000510ba397428694e504f9ed418eb366cdd9','9c3c295e31170fa2a3199f1795711e72c4f2cb94',0),(9594,1391791138,'dfb000510ba397428694e504f9ed418eb366cdd9','4d09d1cda02475d4d8d5479cfbf145d45cf8d196',0),(9593,1391791133,'dfb000510ba397428694e504f9ed418eb366cdd9','cd46d2438ac7bfb007452efacdf680df5304a202',0),(9592,1391791133,'0','8efe2930893bedafd2c094f4db2823286dd9ed81',0),(9591,1391791128,'0','6d04b916223bb06bfd7b6f98d5dd6eb21118d70d',1),(9590,1391791128,'0','72e0ba947f029cf6a4fed7f47fbc2c510e0d5b8a',0),(9589,1391791128,'0','494d1f2ddd40a7316f5e4dcbf9f574e7bf13af7b',0),(9588,1391791124,'0','1cc5d6c03cd07b772b5589527a3749e565ecc76a',0),(9587,1391791121,'0','e6807ff77cde00e0d666c5ca1b78f6e6e6ffb60d',0),(9586,1391791121,'0','644d442f9c68d67f6ee294ba6ece2e59cfc19b3d',0),(9585,1391791120,'0','a9425af30443774e1cb8bb908d63504a84ae6aef',0),(9584,1391737913,'0','8a69a779be973292e0c162d106b0d2bc06e56aa6',0),(9583,1391737910,'0','233cd7056e305394290c0bf7912cc401fd688a8f',0),(9582,1391737828,'0','c7ef3039f0830f65fcc719832df0b9421c6fd790',0),(9581,1391737808,'0','1e08415e8224b42a5610be9f694cf36d93ac6a40',0),(9580,1391737808,'0','9b634816cbe600b040229821efd3d5cd2938c811',0),(9579,1391737807,'0','85a722ac3c76b51d4965e92cc95b261679879a9a',0),(9578,1391736419,'0','7b6a0fa7cfe26e610629cff56931b0e7d7528d9f',0),(9577,1391736417,'0','d1ff80d5ccddafc77ea022ef283b7c6d2bdcb8c2',0),(9576,1391735605,'0','61ad0a012834197435f642b6a5b6c2694299d410',0),(9575,1391735604,'0','21bd5a2d3e42340718f2ef9530bbcfdace563937',0),(9574,1391735596,'0','b703768aa203637e157c56e9ff8cabb71dd679d3',0),(9573,1391735590,'0','34906a70266b93919ceeb4114074962fb271eef8',0),(9572,1391735590,'0','c514668557c7e331af16bf1f79c7c3c1a1f7ff53',0),(9571,1391735590,'0','63d6b5c1bc030589adfb3e840928e5edd0b9da71',0),(9570,1391735586,'0','b05b9d82884b70fec4108f2c56f29ee9e656db5f',0),(9569,1391735585,'0','ecca90b9fe193b93e7a2255bed5ad5ceecbb0993',0),(9568,1391735573,'0','d6f207ed5733386cdc1b7637ffbe04687a3344b6',0),(9567,1391735572,'0','fd57ab073ca21bf9f90aecf0c591861d808250bd',0),(9566,1391735530,'0','c31d7e8c5b954489dc78abed54a59c8e4a5dd581',0),(9565,1391735529,'0','df7fc18a4202eb4f457c5eaf462baf09fe532e56',0),(9564,1391735519,'0','7bf239cc633cce5bba6c41993f6b72554429b69f',0),(9563,1391735518,'0','d45fa3b61030e5bb0fc0eedbf4840d02bfb543fe',0),(9562,1391735450,'0','8afcd899d1a784e1cd19a3e435ad37bf748c9ab2',0),(9561,1391735449,'0','c760f58281b4d7cbef2d1b4f99d10092b0ee7124',0),(9560,1391735449,'0','b951b6a96967b4a32933de1f130c46de66c4eec4',0),(9559,1391735444,'0','3e080d0cd06cfc91df8b16c5edf740f5c27d481c',0),(9558,1391735444,'0','c2eeb4711f711f307dbabe8922e279130aa8b633',0),(9557,1391735444,'0','42cf2b2dc0502d370c8280bf9c3edaf1bac3feef',0),(9556,1391735443,'0','7135bb849e12b6ee41f529df8e0eafa5f38c205d',0),(9555,1391735443,'0','88803cafb041a8ddb7c2f3ec9895ac7f37d654ec',0),(9554,1391735443,'0','2c45eee26aaf473d7eeb2934da8ea0a7c17da9da',0),(9553,1391735438,'0','f08846e5b2751865507521f676ba5f750adc1529',0),(9552,1391735438,'0','02e9e841ccd23deb9a87780ced66eecffd028b27',0),(9551,1391735437,'0','e90d485ee4e509764c30fe3db1689ab26dd3daa2',0),(9550,1391735429,'0','ea659f1b718d8e57152d164261ea2d7fe1668dbc',0),(9549,1391735428,'0','5cd5d7a2c4ce5105acdbfb36ec4e7cce78333148',0),(9548,1391735418,'0','02535840acb16639cd111999b22b74160b939699',0),(9547,1391735417,'0','d0ca248829b769cece348002a7a973579a08322a',0);
/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sessions`
--

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
INSERT INTO `exp_sessions` VALUES ('7c7ad9ebce08bba3b7b8d5ae5210370b04ef7e4a',6,1,'172.251.100.146','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36','858b37d4f62629b3f9868fcf161067f0',1391997349,1391998813);
/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sites`
--

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` VALUES (1,'Starkey Hearing Foundation','default_site','','YTo4ODp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MjE6Imh0dHA6Ly9zdGFya2V5LmxvY2FsLyI7czoxNjoidGhlbWVfZm9sZGVyX3VybCI7czoyODoiaHR0cDovL3N0YXJrZXkubG9jYWwvdGhlbWVzLyI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjEzOiJkZXZAMTAweWVhLnJzIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czo0NjoiaHR0cDovL2V4cHJlc3Npb25lbmdpbmUubG9jYWwvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjQ2OiIvdmFyL3d3dy9leHByZXNzaW9uZW5naW5lL3d3dy9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTc6ImVuYWJsZV9kYl9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE4OiJ0ZW1wbGF0ZV9kZWJ1Z2dpbmciO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czowOiIiO3M6MTc6InVzZXJfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTg6ImFkbWluX3Nlc3Npb25fdHlwZSI7czoyOiJjcyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MTM6ImxvZ19yZWZlcnJlcnMiO3M6MToibiI7czoxMzoibWF4X3JlZmVycmVycyI7czozOiI1MDAiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6InVzIjtzOjEzOiJzZXJ2ZXJfb2Zmc2V0IjtzOjA6IiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjE5OiJBbWVyaWNhL0xvc19BbmdlbGVzIjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czo4OiJjcF90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjIxOiJlbWFpbF9tb2R1bGVfY2FwdGNoYXMiO3M6MToibiI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjEyOiJzZWN1cmVfZm9ybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjQ1OiJodHRwOi8vZXhwcmVzc2lvbmVuZ2luZS5sb2NhbC9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToibiI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6Mjk6Ii92YXIvd3d3L3N0YXJrZXkvd3d3Ly90aGVtZXMvIjtzOjEwOiJpc19zaXRlX29uIjtzOjE6InkiO3M6MTE6InJ0ZV9lbmFibGVkIjtzOjE6InkiO3M6MjI6InJ0ZV9kZWZhdWx0X3Rvb2xzZXRfaWQiO3M6MToiMSI7fQ==','YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==','YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDU6Imh0dHA6Ly9leHByZXNzaW9uZW5naW5lLmxvY2FsL2ltYWdlcy9hdmF0YXJzLyI7czoxMToiYXZhdGFyX3BhdGgiO3M6NDU6Ii92YXIvd3d3L2V4cHJlc3Npb25lbmdpbmUvd3d3L2ltYWdlcy9hdmF0YXJzLyI7czoxNjoiYXZhdGFyX21heF93aWR0aCI7czozOiIxMDAiO3M6MTc6ImF2YXRhcl9tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMzoiYXZhdGFyX21heF9rYiI7czoyOiI1MCI7czoxMzoiZW5hYmxlX3Bob3RvcyI7czoxOiJuIjtzOjk6InBob3RvX3VybCI7czo1MToiaHR0cDovL2V4cHJlc3Npb25lbmdpbmUubG9jYWwvaW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjEwOiJwaG90b19wYXRoIjtzOjUxOiIvdmFyL3d3dy9leHByZXNzaW9uZW5naW5lL3d3dy9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTU6InBob3RvX21heF93aWR0aCI7czozOiIxMDAiO3M6MTY6InBob3RvX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEyOiJwaG90b19tYXhfa2IiO3M6MjoiNTAiO3M6MTY6ImFsbG93X3NpZ25hdHVyZXMiO3M6MToieSI7czoxMzoic2lnX21heGxlbmd0aCI7czozOiI1MDAiO3M6MjE6InNpZ19hbGxvd19pbWdfaG90bGluayI7czoxOiJuIjtzOjIwOiJzaWdfYWxsb3dfaW1nX3VwbG9hZCI7czoxOiJuIjtzOjExOiJzaWdfaW1nX3VybCI7czo1OToiaHR0cDovL2V4cHJlc3Npb25lbmdpbmUubG9jYWwvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czo1OToiL3Zhci93d3cvZXhwcmVzc2lvbmVuZ2luZS93d3cvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo1MjoiL3Zhci93d3cvZXhwcmVzc2lvbmVuZ2luZS93d3cvaW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==','YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJ5IjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJuIjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czozNDoiL3Zhci93d3cvc3RhcmtleS9zaGFyZWQvdGVtcGxhdGVzLyI7fQ==','YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=','YToxOntzOjMwOiIvdmFyL3d3dy9zdGFya2V5L3d3dy9pbmRleC5waHAiO3M6MzI6ImNhNzUyMTI0ZDUyNzIyNWIzN2U3N2EzMGQxNTk2ODZjIjt9','YToxOntpOjE7YTozOntzOjM6InVybCI7czozMzoiaHR0cDovL3N0YXJrZXkuYWh1bmRyZWR5ZWFycy5jb20vIjtzOjQ6InVyaXMiO2E6MDp7fXM6OToidGVtcGxhdGVzIjthOjA6e319fQ==');
/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_snippets`
--

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_specialty_templates`
--

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` VALUES (1,1,'y','offline_template','','<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody { \nbackground-color: #ffffff; \nmargin:              50px; \nfont-family:        Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:           11px;\ncolor:               #000;\nbackground-color:    #fff;\n}\n\na {\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:     bold;\nletter-spacing:      .09em;\ntext-decoration:    none;\ncolor:             #330099;\nbackground-color:   transparent;\n}\n  \na:visited {\ncolor:                #330099;\nbackground-color: transparent;\n}\n\na:hover {\ncolor:                #000;\ntext-decoration: underline;\nbackground-color:   transparent;\n}\n\n#content  {\nborder:             #999999 1px solid;\npadding:            22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:     bold;\nfont-size:           14px;\ncolor:               #000;\nmargin-top:      0;\nmargin-bottom:      14px;\n}\n\np {\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:           12px;\nfont-weight:         normal;\nmargin-top:        12px;\nmargin-bottom:       14px;\ncolor:               #000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),(2,1,'y','message_template','','<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody { \nbackground-color:    #ffffff; \nmargin:              50px; \nfont-family:        Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:           11px;\ncolor:               #000;\nbackground-color:    #fff;\n}\n\na {\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:      .09em;\ntext-decoration:    none;\ncolor:             #330099;\nbackground-color:   transparent;\n}\n  \na:visited {\ncolor:                #330099;\nbackground-color: transparent;\n}\n\na:active {\ncolor:               #ccc;\nbackground-color:    transparent;\n}\n\na:hover {\ncolor:                #000;\ntext-decoration: underline;\nbackground-color:   transparent;\n}\n\n#content  {\nborder:             #000 1px solid;\nbackground-color:  #DEDFE3;\npadding:          22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:     bold;\nfont-size:           14px;\ncolor:               #000;\nmargin-top:      0;\nmargin-bottom:      14px;\n}\n\np {\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:           12px;\nfont-weight:         normal;\nmargin-top:        12px;\nmargin-bottom:       14px;\ncolor:               #000;\n}\n\nul {\nmargin-bottom:        16px;\n}\n\nli {\nlist-style:           square;\nfont-family:       Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:           12px;\nfont-weight:         normal;\nmargin-top:        8px;\nmargin-bottom:        8px;\ncolor:                #000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),(3,1,'y','admin_notify_reg','Notification of new member registration','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),(4,1,'y','admin_notify_entry','A new channel entry has been posted','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit: \n{entry_url}\n'),(5,1,'y','admin_notify_mailinglist','Someone has subscribed to your mailing list','A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),(6,1,'y','admin_notify_comment','You have just received a comment','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at: \n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),(7,1,'y','mbr_activation_instructions','Enclosed is your activation code','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),(8,1,'y','forgot_password_instructions','Login information','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),(9,1,'y','validated_member_notify','Your membership account has been activated','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),(10,1,'y','decline_member_validation','Your membership account has been declined','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),(11,1,'y','mailinglist_activation_instructions','Email Confirmation','Thank you for joining the \"{mailing_list}\" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),(12,1,'y','comment_notification','Someone just responded to your comment','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),(13,1,'y','comments_opened_notification','New comments have been added','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment} \n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),(14,1,'y','private_message_notification','Someone has sent you a Private Message','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),(15,1,'y','pm_inbox_full','Your private message mailbox is full','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');
/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stats`
--

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` VALUES (1,1,8,8,'Megan Sheley',49,0,0,0,1391821020,0,0,1383699119,1,1383699119,1392336758);
/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_groups`
--

DROP TABLE IF EXISTS `exp_status_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_groups`
--

LOCK TABLES `exp_status_groups` WRITE;
/*!40000 ALTER TABLE `exp_status_groups` DISABLE KEYS */;
INSERT INTO `exp_status_groups` VALUES (1,1,'Statuses');
/*!40000 ALTER TABLE `exp_status_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_no_access`
--

LOCK TABLES `exp_status_no_access` WRITE;
/*!40000 ALTER TABLE `exp_status_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_status_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_statuses`
--

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` VALUES (1,1,1,'open',1,'009933'),(2,1,1,'closed',2,'990000');
/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (1,1,'pages',1,'y'),(2,1,'blog',2,'n'),(3,1,'media_mentions',3,'n'),(4,1,'programs',4,'n'),(6,1,'api',5,'n');
/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_member_groups`
--

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;
INSERT INTO `exp_template_member_groups` VALUES (3,2);
/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_no_access`
--

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','','',1389247785,1,'n',0,'','n','y','o',0),(2,1,2,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'blog-index-page page\'  ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n      <div class=\"outer-container\">\n      <section class=\'carousel bottom\' ng-controller=\"bottomCarouselCtrl\">\n        <thumblist-nav>\n          <div>\n            <img src=\"uploads/home/feature/building_a_better_kibera.jpg\">\n            <h4>Global Hearing Mission</h4>\n            <button ng-click=\"slide(0)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/celebrity_film.jpg\">\n            <h4>Celebrity Support</h4>\n            <button ng-click=\"slide(1)\">watch video &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/changing_lives_with_sir_richard_branson_and_virgin_unite.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(2)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/listen_carefully.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(3)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/operation_change.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(4)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/philippines_film.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(5)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/providing_clean_water_in_tanzania.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(6)\">read stories &rarr;</button>\n          </div>\n        </thumblist-nav>\n      </section>\n      </div>\n\n      <div class=\"outer-container\">\n      <div ng-controller=\"PaginationController\">\n          <div class=\"pagination-featured\">\n            <div ng-repeat=\"featuredArticle in featured\">\n              <h1></h1>\n            </div>\n          </div>\n      \n          <div class=\"pagination\">\n            <ul>\n              <li ng-class=\"{disabled: currentPage == 0}\">\n                <a href ng-click=\"prevPage()\">Prev</a>\n              </li>\n              <li ng-repeat=\"n in range(pagedArticles.length)\"\n                ng-class=\"{active: n == currentPage}\"\n                ng-click=\"setPage()\">\n                <a href ng-bind=\"n + 1\">1</a>\n              </li>\n              <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                <a href ng-click=\"nextPage()\">Next</a>\n              </li>\n            </ul>\n          </div>\n          <div class=\"spacer\"></div>\n          <div class=\"outer-container\">\n            <div class=\"pagination-articles \" ng-repeat=\"articleCol in pagedArticles[currentPage]\">\n              <div ng-repeat=\"article in articleCol\">\n                <pagination article=\"article\" lightbox=\"lightbox\" add-tag=\"addTag\" class= \"row\"></pagination>\n              </div>\n            </div>\n          </div>\n          <div class=\"center\">\n            <div class=\"pagination\">\n              <ul>\n                <li ng-class=\"{disabled: currentPage == 0}\">\n                  <a href ng-click=\"prevPage()\">Prev</a>\n                </li>\n                <li ng-repeat=\"n in range(pagedArticles.length)\"\n                  ng-class=\"{active: n == currentPage}\"\n                  ng-click=\"setPage()\">\n                  <a href ng-bind=\"n + 1\">1</a>\n                </li>\n                <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                  <a href ng-click=\"nextPage()\">Next</a>\n                </li>\n              </ul>\n            </div>\n          </div>\n      \n        <div class=\"modal fade\" ng-class=\"{in: lightbox()}\">\n          <div class=\"modal-header\">\n            <button type=\"button\" class=\"close\" ng-click=\"lightbox(false)\">×</button>\n            <h2>{{lightbox().title}}</h2>\n          </div>\n          <div class=\"modal-body\">\n            <a href=\"{{lightbox().url}}\">\n            Modal\n            </a>\n            <p>{{lightbox().desc}}</p>\n            <p>\n              <span class=\"label label-info pagination-tag\" ng-repeat=\"tag in lightbox().tags\"></span>\n            </p>\n          </div>\n          <div class=\"modal-footer\">\n            <a href=\"{{lightbox().url}}\" class=\"btn btn-primary\">Check out the App</a>\n            <a ng-show=\"lightbox().src\" href=\"{{lightbox().src}}\" class=\"btn\">View the Source</a>\n            <a ng-show=\"lightbox().info\" href=\"{{lightbox().info}}\" class=\"btn\">Read More</a>\n          </div>\n        </div>\n        <div class=\"modal-backdrop fade\" ng-class=\"{in: lightbox()}\" ng-click=\'lightbox(false)\'></div>\n      \n      </div>\n      </div>\n\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1390174301,1,'n',0,'','n','n','o',0),(3,1,3,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n  <meta charset=\"utf-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <title>Starkey Hearing Foundation</title>\n  <meta name=\"description\" content=\"\">\n  <meta name=\"viewport\" content=\"width=device-width\">\n  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n  \n  <link rel=\"stylesheet\" href=\"assets/styles/39034138.main.css\"/>\n  \n  </head>\n  <body class=\'media-mentions-page page\' ng:app=\"mediaMentionsPagesApp\" ng:controller=\"globalVideoModalCtrl\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n        <a href=\"/\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n        </a>\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n      <div ng-view></div>\n    <!-- end main content section -->\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/109209b4.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/7a1cf0cb.main.js\"></script>\n    \n    <script src=\"/assets/scripts/f7bcce96.plugins.js\"></script>\n    \n    <video-player-modal show=\'modalVideo\' width=\'90%\' height=\'90%\'></video-player-modal>\n</body>\n</html>\n','',1391805397,1,'n',0,'','n','n','o',0),(4,1,4,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n\n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'programs-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n    <section class=\'page-leader\'>\n      <h1>Our programs</h1>\n      <p>Programs overview lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dnt lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam.</p>\n    </section>\n\n    <section class=\'tabbed-content\'>\n      <nav>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.operation-change\'>Operation Change</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.listen-carefully\'>Listen Carefully</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hear-now\'>Hear Now</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hearing-aid-recycling\'>Hearing Aid Recycling</a>\n            </li>\n          </ul>\n      </nav>\n\n      <article class=\'tab-content operation-change\'>\n        <div class=\"outer-container\">\n          <h1>Operation change</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n\n        <section class=\"carousel hero\" ng-controller=\"heroCarouselCtrl\">\n          <swiper class=\"swiper\" speed=\"5000\" continuous=\"true\" auto=\"false\">\n            <div class=\"slide\">\n              <article>\n                <img src=\"uploads/home/hero/vikings_mission.jpg\" />\n              </article>\n            </div>\n          </swiper>\n        </section>\n        <br/>\n        <div class=\"outer-container\">\n          <h1>Our partnerships</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content listen-carefully\'>\n        <div class=\"outer-container\">\n          <h1>Listen Carefully</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hear-now\'>\n        <div class=\"outer-container\">\n          <h1>Hear Now</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hearing-aid-recycling\'>\n        <div class=\"outer-container\">\n          <h1>Hearing Aid Recycling</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n    </section>\n    <br/>\n\n      <p>Put production thumblist_nav here</p>\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(6,1,6,'homepage_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"coords\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"5\"}\n        [\n            {homepage_map_item_lat},\n            {homepage_map_item_lon}\n        ],\n   {/exp:channel:entries}\n   ],\n   \"meta_data\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"6\"}\n       {\n          \"title\":\"{title}\",\n          \"text\":\"{if homepage_map_item_content}{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{homepage_map_item_content}{/exp:low_replace}{/if}\",\n          \"thumbnail_url\":\"{homepage_map_item_image}\",\n          \"action_target\":\"{homepage_map_item_cta_link}\"\n       },\n    {/exp:channel:entries}\n   ]\n}\n',NULL,1391025408,1,'n',0,'','n','n','o',0),(7,1,6,'blog','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n    {exp:channel:entries channel=\"blog\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"year\": \"{entry_date format=\'%Y\'}\",\n      \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n      \"related_blog_items\": [],\n      \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n      \"title\": \"{title}\",\n      \"text\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{blog_content}{/exp:low_replace}\",\n      \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\",\n      \"image_url\": \"{if blog_image}{blog_image}{/if}\",\n      \"author\":\"{blog_author}\"\n    },\n    {/exp:channel:entries}\n]\n{if:else}\n{exp:channel:prev_entry channel=\"blog\"}\n  <? $prev_id = \"{entry_id}\"; ?>\n{/exp:channel:prev_entry}\n  <? $prev_item = (!empty($prev_id)) ? $prev_id : false; ?>\n{exp:channel:next_entry channel=\"blog\"}\n  <? $next_id = \"{entry_id}\"; ?>\n{/exp:channel:next_entry}\n  <? $next_item = (!empty($next_id)) ? $next_id : \"0\"; ?>\n{exp:channel:entries channel=\"blog\" limit=\"1\"}\n{\n  \"id\": \"{entry_id}\",\n  \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n  \"year\": \"{entry_date format=\'%Y\'}\",\n  \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n  \"related_blog_items\": [{blog_related_items backspace=\"1\"}{blog_related_items:entry_id},{/blog_related_items}],\n  \"prev_item\": \"<?=$prev_item?>\",\n  \"next_item\": \"<?=$next_item?>\",\n  \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n  \"title\": \"{title}\",\n  \"text\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{blog_content}{/exp:low_replace}\",\n  \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\",\n  \"image_url\": \"{if blog_image}{blog_image}{/if}\",\n  \"author\":\"{blog_author}\"\n}\n{/exp:channel:entries}\n{/if}\n','',1391800573,1,'n',0,'','n','y','o',0),(8,1,6,'press','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n    {exp:channel:entries channel=\"media_mentions\" backspace=\"6\"}\n    {\n      \"id\":\"{entry_id}\",\n      \"title\": \"{title}\",\n      \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n      \"year\": \"{entry_date format=\'%Y\'}\",\n      \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n      \"type\":\"{media_mention_type}\",\n      \"featured\":\"{media_mention_featured}\",\n      \"header_image_url\":\"{media_mention_splash_image}\",\n      \"logo_image_url\":\"{media_mention_icon}\",\n      \"quote\":\"{media_mention_quote}\",\n      \"call_to_action_text\":\"{media_mention_cta_text}\",\n      \"call_to_action_link\":\"{media_mention_cta_link}\",\n      \"video_link\":\"{media_mention_video_url}\"\n    },\n    {/exp:channel:entries}\n]\n{if:else}\n{exp:channel:entries channel=\"media_mentions\" limit=\"1\"}\n{\n  \"id\":\"{entry_id}\",\n  \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n  \"title\": \"{title}\",\n  \"year\": \"{entry_date format=\'%Y\'}\",\n  \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n  \"type\":\"{media_mention_type}\",\n  \"featured\":\"{media_mention_featured}\",\n  \"header_image_url\":\"{media_mention_splash_image}\",\n  \"logo_image_url\":\"{media_mention_icon}\",\n  \"quote\":\"{media_mention_quote}\",\n  \"call_to_action_text\":\"{media_mention_cta_text}\",\n  \"call_to_action_link\":\"{media_mention_cta_link}\",\n  \"video_link\":\"{media_mention_video_url}\"\n}\n{/exp:channel:entries}\n{/if}\n','',1391800610,1,'n',0,'','n','y','o',0),(9,1,6,'featured_articles','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"homepage_main_carousel\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"thumbnail_title\":\"{title}\",\n      \"thumbnail_image_url\":\"{carousel_image}\",\n      \"thumbnail_call_to_action_text\":\"{carousel_cta}\",\n      \"panel_title\":\"{carousel_panel_title}\",\n      \"panel_image_url\":\"{carousel_panel_image}\",\n      \"video_link_url\":\"{carousel_video_url}\",\n      \"panel_call_to_action_text\":\"{carousel_panel_cta}\",\n      \"panel_call_to_action_link_url\":\"{carousel_panel_link}\",\n      \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{carousel_body}{/exp:low_replace}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391043561,1,'n',0,'','n','n','o',0),(10,1,6,'program_partnerships','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{operation_change_partnerships}\n    {\n      \"id\":\"{operation_change_partnerships:row_id}\",\n      \"date\":\"{operation_change_partnerships:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{operation_change_partnerships:image}\",\n      \"thumbnail_title\":\"{operation_change_partnerships:title}\",\n      \"link_cta\":\"{operation_change_partnerships:cta}\",\n      \"link_url\":\"{operation_change_partnerships:link}\"\n    },\n    {/operation_change_partnerships}{/exp:channel:entries}\n]\n',NULL,1391210764,1,'n',0,'','n','n','o',0),(11,1,6,'program_resources','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{listen_carefully_additional_reso}\n    {\n      \"id\":\"{listen_carefully_additional_reso:row_id}\",\n      \"date\":\"{listen_carefully_additional_reso:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{listen_carefully_additional_reso:image}\",\n      \"thumbnail_title\":\"{listen_carefully_additional_reso:title}\",\n      \"link_cta\":\"{listen_carefully_additional_reso:cta}\",\n      \"link_url\":\"{listen_carefully_additional_reso:link}\"\n    },\n    {/listen_carefully_additional_reso}{/exp:channel:entries}\n]\n',NULL,1391211059,1,'n',0,'','n','n','o',0),(12,1,6,'index','y','webpage','',NULL,1391288619,1,'n',0,'','n','n','o',0),(13,1,6,'programs','n','webpage','',NULL,1391319181,1,'n',0,'','n','y','o',0),(14,1,6,'program_0','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'operation-change reveal\'>\n  <div class=\"outer-container\">\n    <h1>Operation change</h1>\n\n    {exp:hundies_shortcode}{operation_change_content}{/exp:hundies_shortcode}\n    <br/>\n    <h2>Our Partnerships</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programPartnerships\">\n      <div ng-repeat=\"article in programPartnerships\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391320660,1,'n',0,'','n','n','o',0),(15,1,6,'program_1','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'listen-carefully reveal\'>\n  <div class=\"outer-container\">\n\n    {exp:hundies_shortcode}{listen_carefully_content}{/exp:hundies_shortcode}\n\n    <br/>\n    <h2>Additional Resources</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programResources\">\n      <div ng-repeat=\"article in programResources\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391321117,1,'n',0,'','n','n','o',0),(16,1,6,'program_2','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hear-now reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hear Now</h1>\n\n    {exp:hundies_shortcode}{hear_now_content}{/exp:hundies_shortcode}\n\n    <p class=\"centered\"><a href=\"mailto:{hear_now_form_contact}\" class=\"link-with-border\">Contact us</a></p>\n\n\n    <p>{hear_now_download_copy}</p>\n\n    <div class=\"share-this-post\">\n      <ul>\n        <li><span class=\"note\">Download application</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_english}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n        <li><span class=\"note\">Descargar Solicitud</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_spanish}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n      </ul>\n    </div>\n\n    <hr class=\"separator padded\"/>\n    <br/>\n    <h1>Providers Looking to Give Back</h1>\n    <p>Help us give the gift of hearing into the lives of people in need. If you are a hearing professional, we need your help! Become a Hear Now volunteer and volunteer to fit and follow up with our Hear Now recipients. Your crucial support will help change lives forever and have a lasting impact on your community.</p>\n    <br/>\n    <hr class=\"separator padded\"/>\n    <h3><a href ng-click=\"toggle(isVisible)\" class=\"highlight\">Become a Provider</a></h3>\n    <br/>\n    <div class=\"become-a-provider-container reveal\" ng-show=\"isVisible\">\n      <br/>\n\n      {exp:freeform:form form_id=\"2\" form:id=\"become_a_provider_form\" form:class=\"flatform invert\" return=\"/#thank_you\"}\n          <ul>\n              <li class=\"leftHalf\">\n                  {freeform:field:first_name attr:placeholder=\"First Name\"}\n              </li>\n\n              <li class=\"rightHalf\">\n                  {freeform:field:last_name attr:placeholder=\"Last Name\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:practice attr:placeholder=\"Practice\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:phone attr:placeholder=\"Phone\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:fax attr:placeholder=\"FAX\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:email attr:placeholder=\"Email\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:address attr:placeholder=\"Address\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:city attr:placeholder=\"City\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:state attr:placeholder=\"State\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:zip attr:placeholder=\"Zip\"}\n              </li>\n\n              <li class=\"full\">\n                <br/>\n                  {freeform:submit attr:id=\"become_a_provider_submit\"}\n              </li>\n          </ul>\n\n      {/exp:freeform:form}\n    </div>\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322627,1,'n',0,'','n','n','o',0),(17,1,6,'program_3','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hearing-aid-recycling reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hearing Aid Recycling</h1>\n\n    {exp:hundies_shortcode}{hearing_aid_recycling_content}{/exp:hundies_shortcode}\n\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322745,1,'n',0,'','n','n','o',0),(18,1,6,'press_releases','y','webpage','{exp:http_header content_type=\"application/json\"}{\n{exp:channel:entries channel=\"press_releases\" limit=\"1\"}\n    \"id\":\"{entry_id}\",\n    \"title\": \"{title}\",\n    \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n    \"year\": \"{entry_date format=\'%Y\'}\",\n    \"type\":\"press_release\",\n    \"press_release_source\": \"{press_release_source}\",\n    \"press_release_pdf_download\": \"{press_release_pdf_download}\",\n    \"press_release_contact\": \"{press_release_contact}\",\n    \"body\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{press_release_body_text}{/exp:low_replace}\"\n{/exp:channel:entries}\n}\n',NULL,1391810580,1,'n',0,'','n','n','o',0),(19,1,6,'media_mentions','y','webpage','{exp:http_header content_type=\"application/json\"}{\n{exp:channel:entries channel=\"media_mentions\" limit=\"1\"}\n    \"id\":\"{entry_id}\",\n    \"title\": \"{title}\",\n    \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n    \"year\": \"{entry_date format=\'%Y\'}\",\n    \"type\":\"media_mention\",\n    \"featured\":\"{media_mention_feature_carousel}\",\n    \"thumbnail_image_url\":\"{media_mention_image}\",\n    \"logo_image_url\":\"{media_mention_logo}\",\n    \"quote\":\"{media_mention_quote}\",\n    \"call_to_action_text\":\"{media_mention_cta_text}\",\n    \"call_to_action_link\":\"{media_mention_cta_link}\",\n    \"video_link\":\"{media_mention_video_url}\",\n    \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{media_mention_body_text}{/exp:low_replace}\"\n{/exp:channel:entries}\n}\n',NULL,1391810684,1,'n',0,'','n','n','o',0);
/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_throttle`
--

LOCK TABLES `exp_throttle` WRITE;
/*!40000 ALTER TABLE `exp_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_no_access`
--

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
INSERT INTO `exp_upload_prefs` VALUES (1,1,'Image Uploads','/var/www/starkey/www/uploads/','http://starkey.ahundredyears.com/uploads/','img','','','','','','','','','','',NULL),(2,1,'File Uploads','/var/www/starkey/www/uploads/files/','http://starkey.ahundredyears.com/uploads/files/','all','','','','','','','','','','',NULL);
/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_wygwam_configs`
--

DROP TABLE IF EXISTS `exp_wygwam_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_wygwam_configs` (
  `config_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(32) DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_wygwam_configs`
--

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;
INSERT INTO `exp_wygwam_configs` VALUES (1,'Basic','YTo3OntzOjc6InRvb2xiYXIiO2E6ODp7aTowO3M6NDoiQm9sZCI7aToxO3M6NjoiSXRhbGljIjtpOjI7czo5OiJVbmRlcmxpbmUiO2k6MztzOjEyOiJOdW1iZXJlZExpc3QiO2k6NDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NTtzOjQ6IkxpbmsiO2k6NjtzOjY6IlVubGluayI7aTo3O3M6NjoiQW5jaG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czo5OiJwYXJzZV9jc3MiO2I6MDtzOjEzOiJyZXN0cmljdF9odG1sIjtzOjE6InkiO3M6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),(2,'Full','YTo3OntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6MzoiQ3V0IjtpOjI7czo0OiJDb3B5IjtpOjM7czo1OiJQYXN0ZSI7aTo0O3M6OToiUGFzdGVUZXh0IjtpOjU7czoxMzoiUGFzdGVGcm9tV29yZCI7aTo2O3M6NDoiVW5kbyI7aTo3O3M6NDoiUmVkbyI7aTo4O3M6NToiU2NheXQiO2k6OTtzOjQ6IkJvbGQiO2k6MTA7czo2OiJJdGFsaWMiO2k6MTE7czo2OiJTdHJpa2UiO2k6MTI7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjEzO3M6MTI6Ik51bWJlcmVkTGlzdCI7aToxNDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6MTU7czo3OiJPdXRkZW50IjtpOjE2O3M6NjoiSW5kZW50IjtpOjE3O3M6MTA6IkJsb2NrcXVvdGUiO2k6MTg7czo0OiJMaW5rIjtpOjE5O3M6NjoiVW5saW5rIjtpOjIwO3M6NjoiQW5jaG9yIjtpOjIxO3M6NToiSW1hZ2UiO2k6MjI7czo1OiJUYWJsZSI7aToyMztzOjE0OiJIb3Jpem9udGFsUnVsZSI7aToyNDtzOjExOiJTcGVjaWFsQ2hhciI7aToyNTtzOjg6IlJlYWRNb3JlIjtpOjI2O3M6NjoiU3R5bGVzIjtpOjI3O3M6NjoiRm9ybWF0IjtpOjI4O3M6ODoiTWF4aW1pemUiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjk6InBhcnNlX2NzcyI7YjowO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7czoxMDoidXBsb2FkX2RpciI7czowOiIiO30=');
/*!40000 ALTER TABLE `exp_wygwam_configs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-10 17:47:48
