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
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_files`
--

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;
INSERT INTO `exp_assets_files` VALUES (1,1,'ee',NULL,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2_.jpg',NULL,1392137672,NULL,NULL,NULL,NULL,NULL,NULL,1392137672,'image',NULL,NULL,550846,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2_.jpg'),(2,1,'ee',NULL,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg',NULL,1392137683,NULL,NULL,NULL,NULL,NULL,NULL,1392137683,'image',NULL,NULL,550846,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg'),(3,1,'ee',NULL,1,'MAP-Los-Angeles-Listen-Carefully.jpg',NULL,1392139207,NULL,NULL,NULL,NULL,NULL,NULL,1392139207,'image',NULL,NULL,144273,'MAP-Los-Angeles-Listen-Carefully.jpg'),(4,1,'ee',NULL,1,'MAP-Vikings_Mission-IMG_6064.JPG',NULL,1392139634,NULL,NULL,NULL,NULL,NULL,NULL,1392139634,'image',NULL,NULL,161384,'MAP-Vikings_Mission-IMG_6064.JPG'),(5,1,'ee',NULL,1,'MAP-Peru_Mission-02-DSC07062.jpg',NULL,1392140188,NULL,NULL,NULL,NULL,NULL,NULL,1392140188,'image',NULL,NULL,222090,'MAP-Peru_Mission-02-DSC07062.jpg'),(6,1,'ee',NULL,1,'MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg',NULL,1392140382,NULL,NULL,NULL,NULL,NULL,NULL,1392140382,'image',NULL,NULL,145645,'MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg'),(7,1,'ee',NULL,1,'MAP-Where_We_Are_Now-India-DSC03269cc.jpg',NULL,1392140852,NULL,NULL,NULL,NULL,NULL,NULL,1392140852,'image',NULL,NULL,199133,'MAP-Where_We_Are_Now-India-DSC03269cc.jpg'),(8,1,'ee',NULL,1,'MAP-Providing_Clean_Water_in_Tanzania.jpg',NULL,1392141018,NULL,NULL,NULL,NULL,NULL,NULL,1392141018,'image',NULL,NULL,163339,'MAP-Providing_Clean_Water_in_Tanzania.jpg'),(9,1,'ee',NULL,1,'MAP-Building_a_Better_Kibera.jpg',NULL,1392142611,NULL,NULL,NULL,NULL,NULL,NULL,1392142611,'image',NULL,NULL,177213,'MAP-Building_a_Better_Kibera.jpg'),(10,1,'ee',NULL,1,'CAROUSEL-Celebrity_Film-thumb.jpg',NULL,1392143118,NULL,NULL,NULL,NULL,NULL,NULL,1392143118,'image',NULL,NULL,500531,'CAROUSEL-Celebrity_Film-thumb.jpg'),(11,1,'ee',NULL,1,'CAROUSEL-Celebrity_Film-panel.jpg',NULL,1392143132,NULL,NULL,NULL,NULL,NULL,NULL,1392143132,'image',NULL,NULL,453821,'CAROUSEL-Celebrity_Film-panel.jpg'),(12,1,'ee',NULL,1,'CAROUSEL-West_Bank_Mission-IMG_5155.jpg',NULL,1392146646,NULL,NULL,NULL,NULL,NULL,NULL,1392146646,'image',NULL,NULL,519314,'CAROUSEL-West_Bank_Mission-IMG_5155.jpg'),(13,1,'ee',NULL,1,'CAROUSEL-Philippines_Film.jpg',NULL,1392147834,NULL,NULL,NULL,NULL,NULL,NULL,1392147834,'image',NULL,NULL,986228,'CAROUSEL-Philippines_Film.jpg'),(14,1,'ee',NULL,1,'CAROUSEL-Building_a_Better_Kibera1.jpg',NULL,1392148360,NULL,NULL,NULL,NULL,NULL,NULL,1392148360,'image',NULL,NULL,775997,'CAROUSEL-Building_a_Better_Kibera1.jpg'),(15,1,'ee',NULL,1,'BillandTani.jpg',NULL,1392148470,NULL,NULL,NULL,NULL,NULL,NULL,1392148470,'image',NULL,NULL,150744,'BillandTani.jpg'),(17,1,'ee',NULL,1,'CAROUSEL-Operation_Change-thumb.jpg',NULL,1392148948,NULL,NULL,NULL,NULL,NULL,NULL,1392148948,'image',NULL,NULL,119073,'CAROUSEL-Operation_Change-thumb.jpg'),(18,1,'ee',NULL,1,'CAROUSEL-Operation_Change-panel.jpg',NULL,1392148978,NULL,NULL,NULL,NULL,NULL,NULL,1392148978,'image',NULL,NULL,395915,'CAROUSEL-Operation_Change-panel.jpg'),(19,1,'ee',NULL,1,'BLOG-Volunteerism_in_Queretaro.jpg',NULL,1392151386,NULL,NULL,NULL,NULL,NULL,NULL,1392151386,'image',NULL,NULL,240336,'BLOG-Volunteerism_in_Queretaro.jpg'),(20,1,'ee',NULL,1,'BLOG-Volunteerism_in_Queretaro1.jpg',NULL,1392152156,NULL,NULL,NULL,NULL,NULL,NULL,1392152156,'image',NULL,NULL,168641,'BLOG-Volunteerism_in_Queretaro1.jpg'),(21,1,'ee',NULL,1,'BLOG-Volunteerism_in_Queretaro-02.jpg',NULL,1392152162,NULL,NULL,NULL,NULL,NULL,NULL,1392152162,'image',NULL,NULL,168641,'BLOG-Volunteerism_in_Queretaro-02.jpg'),(22,2,'ee',NULL,2,'SHF_2012Overview_NewsRelease_FINAL1.docx',NULL,1392152482,NULL,NULL,NULL,NULL,NULL,NULL,1392152482,'word',NULL,NULL,184702,'SHF_2012Overview_NewsRelease_FINAL1.docx'),(23,1,'ee',NULL,1,'BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg',NULL,1392153484,NULL,NULL,NULL,NULL,NULL,NULL,1392153484,'image',NULL,NULL,3936128,'BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg'),(24,1,'ee',NULL,1,'DSC08418cc_edit.jpg',NULL,1392155115,NULL,NULL,NULL,NULL,NULL,NULL,1392155115,'image',NULL,NULL,1451770,'DSC08418cc_edit.jpg'),(25,1,'ee',NULL,1,'DSC02337cc3Edit.jpeg',NULL,1392156580,NULL,NULL,NULL,NULL,NULL,NULL,1392156580,'image',NULL,NULL,6729305,'DSC02337cc3Edit.jpeg'),(26,1,'ee',NULL,1,'ABClogo.jpg',NULL,1392157491,NULL,NULL,NULL,NULL,NULL,NULL,1392157491,'image',NULL,NULL,6763,'ABClogo.jpg'),(27,1,'ee',NULL,1,'ABC_tani_austin_sr_140121_16x9_608.jpg',NULL,1392157511,NULL,NULL,NULL,NULL,NULL,NULL,1392157511,'image',NULL,NULL,37016,'ABC_tani_austin_sr_140121_16x9_608.jpg'),(28,1,'ee',NULL,1,'DSC01454bb.jpg',NULL,1392157577,NULL,NULL,NULL,NULL,NULL,NULL,1392157577,'image',NULL,NULL,2828076,'DSC01454bb.jpg'),(29,1,'ee',NULL,1,'Unstoppable_Spirit_LEAD.jpg',NULL,1392222175,NULL,NULL,NULL,NULL,NULL,NULL,1392222175,'image',NULL,NULL,91286,'Unstoppable_Spirit_LEAD.jpg'),(32,1,'ee',NULL,1,'BLOG-An_Unstoppable_Spirit_01.jpg',NULL,1392223131,NULL,NULL,NULL,NULL,NULL,NULL,1392223131,'image',NULL,NULL,70852,'BLOG-An_Unstoppable_Spirit_01.jpg'),(33,1,'ee',NULL,1,'BLOG-An_Unstoppable_Spirit_02.jpg',NULL,1392223145,NULL,NULL,NULL,NULL,NULL,NULL,1392223145,'image',NULL,NULL,128784,'BLOG-An_Unstoppable_Spirit_02.jpg'),(34,1,'ee',NULL,1,'BLOG-Unstoppable_Spirit_LEAD.jpg',NULL,1392224175,NULL,NULL,NULL,NULL,NULL,NULL,1392224175,'image',NULL,NULL,185268,'BLOG-Unstoppable_Spirit_LEAD.jpg'),(35,1,'ee',NULL,1,'BLOG-Unstoppable_Spirit_LEAD-02.jpg',NULL,1392225896,NULL,NULL,NULL,NULL,NULL,NULL,1392225896,'image',NULL,NULL,283537,'BLOG-Unstoppable_Spirit_LEAD-02.jpg'),(36,1,'ee',NULL,1,'LC-10-Sec-Video-01.png',NULL,1392231681,NULL,NULL,NULL,NULL,NULL,NULL,1392231681,'image',NULL,NULL,517719,'LC-10-Sec-Video-01.png'),(37,1,'ee',NULL,1,'LC-10-Sec-Video-02.png',NULL,1392231774,NULL,NULL,NULL,NULL,NULL,NULL,1392231774,'image',NULL,NULL,348995,'LC-10-Sec-Video-02.png'),(38,2,'ee',NULL,2,'Listen-Carefully-Loudness-Wars.pdf',NULL,1392232516,NULL,NULL,NULL,NULL,NULL,NULL,1392232516,'pdf',NULL,NULL,254922,'Listen-Carefully-Loudness-Wars.pdf'),(39,1,'ee',NULL,1,'HERO-Program-Operation_Change.png',NULL,1392233125,NULL,NULL,NULL,NULL,NULL,NULL,1392233125,'image',NULL,NULL,905909,'HERO-Program-Operation_Change.png'),(40,1,'ee',NULL,1,'Operation-Change-Ray-Lewis-Film.jpg',NULL,1392233633,NULL,NULL,NULL,NULL,NULL,NULL,1392233633,'image',NULL,NULL,213322,'Operation-Change-Ray-Lewis-Film.jpg'),(41,1,'ee',NULL,1,'Operation-Change-Donna-Karan-Film.jpg',NULL,1392234023,NULL,NULL,NULL,NULL,NULL,NULL,1392234023,'image',NULL,NULL,293950,'Operation-Change-Donna-Karan-Film.jpg'),(42,2,'ee',NULL,2,'FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf',NULL,1392234275,NULL,NULL,NULL,NULL,NULL,NULL,1392234275,'pdf',NULL,NULL,2197606,'FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf'),(43,2,'ee',NULL,2,'FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf',NULL,1392234291,NULL,NULL,NULL,NULL,NULL,NULL,1392234291,'pdf',NULL,NULL,2208363,'FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf'),(44,1,'ee',NULL,1,'HERO-Hearing_Aid_Recycling.jpg',NULL,1392235274,NULL,NULL,NULL,NULL,NULL,NULL,1392235274,'image',NULL,NULL,256649,'HERO-Hearing_Aid_Recycling.jpg'),(47,1,'ee',NULL,1,'Screen_Shot_2014-02-12_at_8.59_.27_PM_.png',NULL,1392260195,NULL,NULL,NULL,NULL,NULL,NULL,1392260195,'image',64,31,4440,'Screen_Shot_2014-02-12_at_8.59_.27_PM_.png'),(48,1,'ee',NULL,1,'test_upload.png',NULL,1392260206,NULL,NULL,NULL,NULL,NULL,NULL,1392260206,'image',64,31,4440,'test_upload.png'),(49,1,'ee',NULL,1,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg',NULL,1392317488,NULL,NULL,NULL,NULL,NULL,NULL,1392317488,'image',835,525,118864,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg'),(51,1,'ee',NULL,1,'BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg',NULL,1392322963,NULL,NULL,NULL,NULL,NULL,NULL,1392322963,'image',791,525,114256,'BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg'),(52,1,'ee',NULL,1,'BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg',NULL,1392327970,NULL,NULL,NULL,NULL,NULL,NULL,1392327970,'image',787,525,109104,'BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg'),(53,1,'ee',NULL,1,'MEDIA-01.27_.14_CBS_MNLocal_TwinsBlog_.png',NULL,1392330247,NULL,NULL,NULL,NULL,NULL,NULL,1392330247,'image',939,525,682635,'MEDIA-01.27_.14_CBS_MNLocal_TwinsBlog_.png'),(54,1,'ee',NULL,1,'MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png',NULL,1392330311,NULL,NULL,NULL,NULL,NULL,NULL,1392330311,'image',939,525,682635,'MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png'),(55,1,'ee',NULL,1,'MEDIA-WCCO-LOGO.png',NULL,1392331329,NULL,NULL,NULL,NULL,NULL,NULL,1392331329,'image',103,100,19411,'MEDIA-WCCO-LOGO.png'),(56,2,'ee',NULL,2,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',NULL,1392335362,NULL,NULL,NULL,NULL,NULL,NULL,1392335362,'image',64,31,4440,'Screen_Shot_2014-02-12_at_8.59.27_PM.png'),(57,1,'ee',NULL,1,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',NULL,1392335392,NULL,NULL,NULL,NULL,NULL,NULL,1392335392,'image',64,31,4440,'Screen_Shot_2014-02-12_at_8.59.27_PM.png'),(58,1,'ee',NULL,1,'BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',NULL,1392395737,NULL,NULL,NULL,NULL,NULL,NULL,1392395737,'image',844,525,181390,'BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg'),(59,1,'ee',NULL,1,'BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',NULL,1392395754,NULL,NULL,NULL,NULL,NULL,NULL,1392395754,'image',701,525,167003,'BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg'),(60,1,'ee',NULL,1,'BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg',NULL,1392395987,NULL,NULL,NULL,NULL,NULL,NULL,1392395987,'image',835,525,133038,'BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg'),(61,1,'ee',NULL,1,'BLOG-Impacting_a_life_in_Manila-LEAD.png',NULL,1392397041,NULL,NULL,NULL,NULL,NULL,NULL,1392397041,'image',958,525,993106,'BLOG-Impacting_a_life_in_Manila-LEAD.png');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_folders`
--

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;
INSERT INTO `exp_assets_folders` VALUES (1,'ee','Image Uploads','',NULL,NULL,1),(2,'ee','File Uploads','',NULL,NULL,2);
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
  `field_id_79` text,
  `field_ft_79` tinytext,
  `field_id_80` text,
  `field_ft_80` tinytext,
  `field_id_81` int(11) DEFAULT '0',
  `field_ft_81` tinytext,
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
INSERT INTO `exp_channel_data` VALUES (2,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(3,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(4,1,1,'In 2010, we committed to providing 100,000 hearing aids a year to those in need','none','{filedir_1}HERO-Commitment_to_Action_Film.jpg','none','http://www.youtube.com/watch?v=ScjOkoueDYg','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(5,1,1,'To truly make an impact, our efforts must be sustainable','none','{filedir_1}HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg','none','http://www.youtube.com/watch?v=W50L7eNGT2U','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(6,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Celebrity_Film-thumb.jpg','none','Watch','none','Celebrity Support ','none','{filedir_1}CAROUSEL-Celebrity_Film-panel.jpg','none','http://www.youtube.com/watch?v=03KTq85Y3wM','none','','none','','none','<p>Starkey Hearing Foundation is fortunate to have hundreds of high-profile friends to help us raise awareness and generate support, and for many, their commitment also extends into the mission field.</p>\n\n<p>Watch as our celebrity ambassadors explain why they support the gift of hearing.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(7,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','Watch Now','none','Listen Carefully Goes Live','none','{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','http://www.youtube.com/watch?v=rlyH-ZcCf7o','none','Learn More','none','/programs#/programs/1','none','<p>Disney and Nickelodeon stars Chris and Kyle Massey join Grammy Award-winning songwriter/producer Dallas Austin to educate a crowd of more than 1,400 at our launch event. The music and sound experience inspired not only a dance contest but also sent the right message: <em>Hearing is fragile. Listen Carefully.&nbsp;</em></p>\n\n<p>Watch all the highlights.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(8,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','Watch Now','none','Recycling Sound','none','{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','http://www.youtube.com/watch?v=tF-9R4UUWa8','none','Learn More ','none','/programs#/programs/3','none','<p>Every year thousands of used hearing aids are donated to our Hear Now program people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Starkey Hearing Foundation.</p>\n\n<p>Watch as we take you through the recycling process.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(9,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We Are Now ','none','{filedir_1}icon_now.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(10,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','28.6','none','77.2','none','India ','none','<p>The mission team is excited to be back in India working with our Starkey India team to give the gift of hearing across four cities.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Where_We_Are_Now-India-DSC03269cc.jpg','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(11,1,2,'',NULL,'',NULL,'',NULL,' ','xhtml',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'Using Hearing as a Vehicle to Change Lives Around the World.','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(32,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(33,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(34,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(35,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(36,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(16,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Hearing Missions','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(17,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>&#8203;testing</p>','none','','xhtml','','xhtml','','xhtml','',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none',' ','xhtml',' ','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(18,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','{filedir_1}CAROUSEL-Building_a_Better_Kibera.jpg','none','','none','','none',1388468400,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(19,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Our global work developing sustainable systems of hearing care gives us a unique window into the many challenges facing people around the world. Hearing is our vehicle to change lives, but we know we can only do so much alone. In order to create real change, we must harness the power of many and develop a holistic approach to address the multitude of pressing global challenges.</p>\n\n<p>It empowers individuals to discover their passions and channel them in ways that will improve their communities and ultimately, the world. Through Operation Change we are providing the inspiration to drive engagement and develop a roadmap to create collective impact. This multimedia campaign incorporates a documentary series, a web platform and social media to encourage individual philanthropy and tap into the energy of a generation.</p>\n\n<p>We believe that the actions of a single person can create a ripple effect that will ignite a movement and change the world.</p>\n\n<p>[gallery id=\"operation-change-intro-video\"]</p>','none','<h1>Listen Carefully</h1>\n\n<p>Research shows that 1 in 8 children and teens in the United States has hearing loss, largely due to high-volume sounds in daily life. Most hearing loss among teens can be avoided if simple protective measures&ndash;such as lowering the volume&ndash;are taken.</p>\n\n<p>The program combines music and education to raise awareness about the fragility of hearing and the dangers of exposure to high decibel sounds.&nbsp;This year Starkey Hearing Foundation expanded Listen Carefully to offer educational support to more than 16,000 teachers and nearly 500,000 students nationwide.</p>\n\n<p>[gallery id=\"listen-carefully-10-second-film\"]</p>\n\n<h1>&nbsp;</h1>\n\n<h1>Make a Difference&nbsp;</h1>\n\n<p>Start with yourself. Your family. Your friends. Because you understand the transformative, interconnecting power of hearing. 1 in 5 Americans has hearing loss-meaning we&rsquo;re losing our hearing faster, today, than our parents or grandparents did.</p>\n\n<p>[gallery id=\"listencarefully2\"]</p>\n\n<p>&nbsp;</p>\n\n<h1>Educate Yourself&nbsp;</h1>\n\n<p>Loud sounds are often part of daily life. Repeat or elongated exposure to high-volume sounds&ndash;such as music pumped through headphones&ndash;harms hearing over time.</p>\n\n<p>Your ears are complex organs, but protecting them is relatively simple. Use these resources to increase your awareness. And share what you know.</p>\n\n<p>[gallery id=\"listencarefully3\"]</p>','none','<p>Starkey Hearing Foundation has provided more hearing help to people in the United States than to any other country. We do this through domestic missions and also Hear Now, our application-based program that provides hearing help to low-income Americans. Hear Now is committed to assisting U.S. residents with hearing loss, who have no resources to acquire hearing aids. Starkey Hearing Foundation provides the hearing aids and runs the program, but we count on the generosity of Hear Now providers and donors across the country to ensure its success.&nbsp;Each person we help is fit with new, top-of-the-line digital hearing aids that are customized to their hearing loss.&nbsp;</p>\n\n<p>If you or someone you know is struggling with hearing loss and unable to afford hearing aids, call 1-800-328-8602 or complete the form below, and a Hear Now representative will be in touch with you.&nbsp;</p>\n\n<p>[gallery id=\"hearnow\"]</p>','none','<p>Every year thousands of hearing aids are donated to our Hear Now program from hearing professionals and other people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation. However, the journey from donation to the mission field is an absolute labor of love.&nbsp;</p>\n\n<p>[gallery id=\"hearingaidrecycling\"]</p>\n\n<p>Send us your old hearing aids, to give the gift of hearing to those in need and contribute to a healthy environment. Any make or model, regardless of age, can be donated. All donations are tax deductible* and a letter of acknowledgment will be sent to all donors.<br />\n&nbsp;</p>\n\n<h2><strong>Ready to contribute your hearing devices? Follow these simple steps to send them in:</strong></h2>\n\n<p>1. Place the hearing aid in a crush-proof box, old pill bottle, or other secure package.</p>\n\n<p>2. Register and insure the package, if possible, to ensure that receipt of your donated device</p>\n\n<p>3. Mail to:<br />\nStarkey Hearing Foundation<br />\nATTN: Hearing Aid Recycling<br />\n6700 Washington Avenue South<br />\nEden Prairie, MN 55344<br />\n<br />\n<strong>For more information, contact us at:</strong><br />\nhearnow@starkeyfoundation.org<br />\n(866) 354-3254</p>\n\n<hr />\n<p><small>*Please note: Due to the diversity in age, make, and condition of the aids we receive, it is not possible for us to determine a tax-deductible value for each aid.<br />\nPlease consult your tax advisor.</small></p>','none','',NULL,NULL,NULL,'',NULL,'<p>Starkey Hearing Foundation&rsquo;s commitment to global hearing health begins right here at home.&nbsp;Along with our worldwide missions, our national programs contribute to an entire system of care.&nbsp;Everyone can make a difference in the lives of those across the world or just next-door. Together, we can create a movement that brings peace and understanding through the gift of hearing.</p>','none','programs@starkeyfoundation.org','none','If you have already spoken with a representative and need an application, you can download one here:','none','{filedir_2}FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf','none','{filedir_2}FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf','none',' ','xhtml',' ','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(20,1,1,'We provide more hearing help to people in the United States than to any other country','none','{filedir_1}HERO-Vikings_Mission-IMG_6312.jpg','none','http://www.starkeyhearingfoundation.org/programs/hear-now/','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(22,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','Experience More','none','Gift of Hearing in Peru ','none','{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','','none','','none','','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(48,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We were Yesterday','none','{filedir_1}icon_stories.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(31,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(38,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Program','none','{filedir_1}icon_program.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(39,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Stories','none','{filedir_1}icon_stories.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(40,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Video ','none','{filedir_1}icon_video.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(41,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Gallery','none','{filedir_1}icon_gallery.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(42,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','34.052234','none','-118.243685','none','Los Angeles, CA','none','<p><span style=\"line-height:1.6em\">Chris and Kyle Massey joined our team as we spread the word about the importance of protecting your hearing at Tony Hawk&rsquo;s 2013 Stand Up for Skateparks. W</span><span style=\"line-height:1.6em\">e were encouraged to see the message stick as </span><span style=\"line-height:1.6em\">the audience wore the hearing protection we distributed during a headlining performance by Modest Mouse.</span></p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.starkeyhearingfoundation.org/programs/listen-carefully/ ','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Los-Angeles-Listen-Carefully.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(25,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(26,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(27,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}COVER_pianoboy_cc.jpg','none','','none','','none',0,'','none','','none','Read More','none','http://www.starkeyhearingtechnologies.com/foundation.php','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(28,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','http://www.youtube.com/watch?v=VJqzdck05iA','none','','none',1389816120,'','none','','none','','none','','none','','none','false','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(29,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png','none','','none','','none',1390869960,'','none','','none','READ MORE','none','http://minnesota.cbslocal.com/2014/01/27/twins-blog-the-first-starkey-mission/','none','WCCOO','none','false','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(47,1,1,'Learn all about the homepage slider ','none','{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','www.starkey.com','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(49,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-3.867910','none','36.431122','none','Loiborsoit, Tanzania ','none','<p>Whether it&#39;s&nbsp;projects in housing, education, clean water, HIV/AIDS research or agriculture, hearing is our vehicle to do so much more. It brings us to a region to help affect greater change, but in order to do that we need strong partners.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=OJ4W9zzjgII','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Providing_Clean_Water_in_Tanzania.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(50,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}COVER_pianoboy_cc.jpg','none','Learn More ','none','Testing out the Bottom Carousel ','none','{filedir_1}COVER_pianoboy_cc.jpg','none','http://www.youtube.com/watch?v=OJ4W9zzjgII','none','Read More ','none','','none','<p>Read here to find out about starkey hearing missions&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(52,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(53,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none'),(54,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}Blog_A_Knight.jpg','none','CNN ','none','<p><span style=\"line-height:1.6em\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam diam, vitae mollis neque egestas sed. In eu tellus blandit, pellentesque mi non, venenatis velit. Phasellus malesuada tempor tellus quis rhoncus. Vivamus condimentum eget mauris at pharetra. Morbi a ipsum ornare, imperdiet justo sed, pulvinar enim. Nam sem turpis, dapibus quis felis ac, consequat dignissim odio. Morbi non hendrerit nisl, eu accumsan justo. Maecenas vel metus urna.</span></p>\n\n<p>Fusce a varius nibh, vel lacinia elit. Nulla facilisi. Nunc id sollicitudin turpis. Etiam elit nisi, volutpat eu placerat ut, volutpat vitae magna. Nunc porta et massa non sodales. Curabitur imperdiet non elit eu pellentesque. Nullam iaculis orci lobortis nisl iaculis luctus. Duis placerat dolor sed tincidunt vestibulum. Aenean lacinia dictum massa molestie iaculis. Vivamus tortor orci, pharetra at ante et, euismod mattis magna. Ut cursus arcu vitae molestie feugiat.</p>\n\n<p>Etiam hendrerit justo sem, id posuere ante pretium venenatis. Nulla et est a lectus commodo pulvinar malesuada egestas lorem. Pellentesque mauris ante, viverra ac ornare et, condimentum congue eros. Donec elementum lectus tortor. Vestibulum ante nulla, hendrerit a massa id, pretium convallis neque. Donec mauris orci, blandit vitae consectetur in, feugiat eu nulla. Donec sed ipsum aliquam, congue eros a, semper sem. Praesent vehicula sodales nisi, ac consequat dolor euismod eu.</p>\n\n<p>Duis eu diam ac turpis iaculis bibendum. Aliquam ornare diam id erat condimentum porttitor. Integer fermentum, nunc in dapibus sagittis, neque eros vestibulum felis, ac condimentum est lectus ornare risus. Nulla facilisis quam id leo porttitor vestibulum. Etiam feugiat dui non iaculis rhoncus. Aliquam felis eros, vulputate eget feugiat vitae, interdum at velit. Nam sodales lorem et risus consequat, non interdum elit malesuada. In sollicitudin commodo aliquet. Duis elementum viverra lorem a vestibulum. Sed varius leo vitae mauris ultricies consectetur. Nulla facilisi. Aliquam semper non enim eu suscipit.</p>\n\n<p>Duis eget convallis tortor. Integer augue mauris, vehicula vel justo et, semper laoreet tellus. Integer lobortis turpis eu dolor egestas, vulputate lobortis magna tempor. Proin sit amet condimentum justo. Donec dictum, elit nec interdum consequat, neque est molestie tortor, et interdum ligula nibh in leo. Morbi et aliquam ipsum, ultrices pellentesque sapien. Praesent rhoncus nibh quis urna volutpat porttitor. Sed sit amet arcu feugiat, congue turpis et, molestie elit. Fusce ut quam non augue sagittis lacinia sed eu risus. Sed venenatis nisl risus, eu cursus magna bibendum sit amet. Vivamus pulvinar sit amet augue interdum semper. Suspendisse tempor accumsan massa quis fringilla.</p>\n\n<p>Quisque quam mi, sodales ut diam id, imperdiet egestas orci. Pellentesque mattis urna vitae pulvinar facilisis. Maecenas sed lorem porttitor, tristique massa vel, semper dui. Maecenas vestibulum magna et lacus lobortis pulvinar. Aliquam erat volutpat. Nullam nisl arcu, euismod id elit in, scelerisque placerat diam. Pellentesque nec faucibus nulla.</p>\n\n<p>Nulla facilisi. Nunc eget turpis posuere, pretium lectus a, interdum arcu. Duis ultrices orci libero, non molestie mauris vulputate et. Mauris placerat pellentesque ligula, pellentesque dapibus tellus commodo sed. Nunc commodo, tellus venenatis placerat fringilla, purus urna hendrerit enim, eget euismod sapien ligula et justo. In at sem a justo fringilla semper. Sed interdum vestibulum nisi, et lacinia lorem semper eu. Aliquam ultrices ullamcorper orci malesuada aliquam. Cras a nisl molestie, volutpat sem ut, interdum lorem. Duis in iaculis diam, eget rhoncus purus. Donec ut vulputate nisi.</p>\n\n<p>Mauris blandit justo mi, id fringilla neque viverra at. Phasellus a gravida nunc. Duis posuere ipsum id ante laoreet sodales. Suspendisse auctor justo orci, et auctor urna congue sed. Nullam eget eleifend est. Nulla ac adipiscing enim. Phasellus at tincidunt nisl. Aliquam ac cursus justo. Sed pharetra nibh et eleifend tincidunt. Nam luctus, ligula at facilisis vehicula, purus lacus viverra arcu, non congue nulla dui id turpis. Nunc est mi, congue eget sem id, scelerisque egestas risus. Phasellus hendrerit est non ante mollis feugiat. Donec adipiscing enim augue. Integer tellus mauris, porta at ultrices ut, elementum eu dui</p>','none','{filedir_2}pdf_download_tes.pdf','none','press@starkeyfoundation.org','none','','none','','xhtml',0,'none'),(55,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}CAROUSEL-William_F._Austin_Legacy_Film.jpg','none','http://www.youtube.com/watch?v=CvYDRtPh46Q','none','{filedir_1}cnnlogo.png','none',1391721420,'','none','','none','','none','','none','','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(56,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BillandTani.jpg','none','','none','{filedir_1}Clinton_Foundation_Logo.png','none',1391388900,'','none','Today, as part of a 10-day trip across five African nations, President Bill Clinton and Chelsea Clinton joined the Starkey Hearing Foundation in Livinstone, Zambia, to help fit children for hearing aids. ','none','Read More ','none','http://www.clintonfoundation.org/blog/2013/08/02/starkey-executive-director-speaks-miracle-watching-patients-hear-very-first-time','none','Clinton Foundation ','none','false','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(59,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','44.881702','none','-93.400947','none','Eden Prairie, MN','none','<p>Traveling from nearby Metro Deaf School and Faribault School for the Deaf and from as far away as California, Missouri and Indiana, more than 50 patients arrived at Starkey Hearing Foundation headquarters for a joint hearing mission with the Minnesota Vikings.&nbsp;Overjoyed to meet their heroes, the children taught Vikings superstars, including&nbsp;Adrian Peterson and&nbsp;Greg Jennings, some sign language.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Vikings_Mission-IMG_6064.JPG','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(60,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-5.185310','none','-80.649003','none','Peru','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Peru_Mission-02-DSC07062.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(61,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-26.333806','none','28.390688','none','Bhubezi, South Africa','none','<p>Our Founder Bill Austin says, \"Alone we can&#39;t do much. Together we can change the world.\" We believe that by working together and building strong partnerships, we can make an even greater impact. In October 2013, we once again partnered with Sir Richard Branson and our friends at Virgin Unite to change lives at their Bhubezi Health Care Clinic in South Africa.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=VJqzdck05iA','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(62,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','31.952162','none','35.233154','none','West Bank','none','<p>Starkey Hearing Foundation&nbsp;is excited to be heading back to the West Bank soon for an upcoming hearing mission. Our work in the region has shown us how hearing brings people together and serves as a vehicle for peace and understanding.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=UakFpSGn_AA&feature=c4-overview-vl&list=PLc9R442DNsrtj12vqxhT5kbVDBSDNLpqm','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(63,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-1.292066','none','36.821946','none','Nairobi, Kenya','none','<p>Shining Hope for Communities guided us through the narrow streets of Kibera, the largest urban slum in Africa, we found enormous inspiration in the ability of the human spirit to triumph over adversity. The Clinton Global Initiative has inspired us to make a new commitment to use the power of our network and resources to mobilize partnerships and create a sustainable impact in Kibera.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=qIAXkz08aiI','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Building_a_Better_Kibera.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(64,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-William_F._Austin_Legacy_Film.jpg','none','Watch Now','none','Bill Austin Legacy','none','{filedir_1}CAROUSEL-William_F._Austin_Legacy_Film.jpg','none','http://www.youtube.com/watch?v=ZVDuN-ksyT0','none','Watch Now','none','http://www.youtube.com/watch?v=ZVDuN-ksyT0','none','<p>How did Bill Austin go from creating a one-room hearing aid repair shop to one of the largest hearing aid manufacturers in the world - and a foundation that&#39;s creating an infrastructure of hearing health globally for people in need?</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(65,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','Watch Now','none','2013 So the World May Hear Awards Gala Highlights','none','{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','http://www.youtube.com/watch?v=KD8h8zNpd48','none','Learn More','none','http://www.starkeyhearingfoundation.org/galas/the-13th-annual-awards-gala-28-2013/','none','<p>Whether it was the bald eagle soaring over the crowd as Nita Whitaker sang &ldquo;Amazing Grace,&rdquo; impassioned speeches from twin brothers Ashton and Michael Kutcher, or special surprise guests for Bill Austin, the 2013 So the World May Hear Awards Gala was an evening we will never forget. Our latest film brings you all the highlights and magic from this year&rsquo;s Gala.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(67,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Operation_Change-thumb.jpg','none','Learn More','none','Operation Change','none','{filedir_1}CAROUSEL-Operation_Change-panel.jpg','none','http://www.youtube.com/watch?v=na5j0wDq7kc','none','Learn More','none','/programs#/programs/0','none','<p>Operation Change is attempting to create a consciousness shift that brings people together to meet challenges. Rousing viewers to become a part of a movement, the documentary series takes us on a journey around the world to witness the fabric of life through stories of hope and triumph that allows us to see how connected we truly are.</p>\n\n<p>Find out more about how you can join the movement.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(74,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg','none','Hearing Missions','none',1389053460,'','none','<p>Joined by musician Michael Johns and volunteers from Impact Steel and Starkey Mexico, the team was revitalized by the warmth, joy and unforgettable smiles of the patients and families in Queretaro, Mexico. Watch our latest video blog and share in the personal and transformative experiences the volunteers on this special hearing mission will hold dear to their hearts for the rest of their lives.</p>\n\n<p>[gallery id = \"transforming-through-volunteerism-in-queretaro\"]</p>','none','Foundation Staff','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(70,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','SHF Team ','none','<h3 style=\"color:#aaa; font-style:italic\">Foundation ahead of schedule to fit one million hearing aids this decade</h3>\n\n<p>MINNEAPOLIS (February 19, 2013) &ndash; The Starkey Hearing Foundation expanded its efforts to record levels in 2012. Fitting more than 131,000 hearing aids to people in need, the foundation surpassed its Clinton Global Initiative commitment of fitting 100,000 hearing aids annually. At this rate, it is 25 percent ahead of schedule for fitting one million people this decade.</p>\n\n<p>Hearing missions are the primary way Starkey Hearing Foundation realizes its goal:&nbsp;So the World May Hear. This past year, the foundation&rsquo;s team of audiologists and staff conducted international and domestic hearing missions in 65 cities across 25 countries. The foundation changed lives with the gift of hearing in nine new countries in 2012, including Ethiopia, Lebanon, Malaysia, Papua New Guinea, China, Senegal, Ghana, Nigeria and Liberia &mdash; expanding its reach to more than 100 countries.</p>\n\n<p>Most recently, the team fit more than 100 people, including nearly 50 children, with customized, free hearing devices at two missions in New Orleans on February 1 and 2, leading up to the professional football championship game. Starkey was joined by celebrity and professional athlete volunteers, including country music superstar Garth Brooks, American Idol winner Jordin Sparks and NFL players Craig Stevens of the Tennessee Titans, Greg Jennings from the Green Bay Packers, Kyle Rudolph from the Minnesota Vikings and Brian de la Puente from the New Orleans Saints.</p>\n\n<p>&ldquo;The Starkey Hearing Foundation has done a tremendous job impacting lives, and as an athlete and role model, I try to do the same,&rdquo; said Jennings. &ldquo;Starkey is one of the best charities I know that is trying to impact lives on a daily basis, not just once or twice a year.&rdquo;</p>\n\n<p>Celebrity and professional athlete volunteers commonly assist at the foundation&rsquo;s missions where they witness the life-changing impact of this cause and support recipients as they are fitted with their new hearing aids, receive audio testing, counseling and instruction on how to care for their new devices, all courtesy of Starkey Hearing Foundation.</p>\n\n<p>Says Sparks, who also attended a mission in Rwanda in 2011, &ldquo;It was a lot of hard work, but it was really rewarding. It&rsquo;s amazing to see the foundation&rsquo;s reach is so much further than just here in the United States.&rdquo; Sparks hopes to attend another mission in the future and says, &ldquo;I&rsquo;ll always be a fan of the Starkey Foundation.&rdquo;</p>\n\n<p>The Starkey Hearing Foundation looks forward to making an even bigger impact in 2013. Missions are being planned for Mexico, Haiti, South Africa, Tanzania, Cambodia, Papua New Guinea, India, Ethiopia, Malaysia, China, Uganda, Rwanda and the Philippines.</p>\n\n<p>The foundation changes lives through more than just missions. This past year it launched the&nbsp;Listen Carefully&nbsp;teaching guide to nearly 500,000 students to educate them about hearing protection and care. The foundation also provided more than 8,500 digital hearing aids to Americans in need through&nbsp;Hear Now, a domestic program to help those in need, and recycled more than 45,000 used hearing aids.</p>\n\n<p>The foundation&rsquo;s largest fundraiser, The&nbsp;So the World May Hear&nbsp;Awards Gala, also set a new record in 2012, raising more than $7.6 million to support its work around the world.</p>\n\n<p>&ldquo;The team is excited for the new opportunities and adventures 2013 will bring,&rdquo; said Bill Austin, founder of Starkey Hearing Foundation. &ldquo;We are passionate about making a difference in people&rsquo;s lives here and around the world by showing them that we care. Watching somebody light up as they hear for the first time is an incredible experience, and sharing that moment is something you never forget.&rdquo;</p>\n\n<p>According to Starkey Hearing Foundation, hearing loss is pervasive, affecting 34 million Americans &mdash; about one in ten. Yet, with the help of a hearing device, hearing loss can often be corrected, giving an individual the opportunity to better connect with their family, the community and the world around them.</p>\n\n<p>More information about the foundation&rsquo;s work can be found at Starkey Hearing Foundation&rsquo;s&nbsp;website, as well as via Starkey Hearing Foundation&rsquo;s&nbsp;Facebook&nbsp;and&nbsp;Twitter&nbsp;pages.</p>\n\n<p>About Starkey Hearing Foundation</p>\n\n<p>Starkey Hearing Foundation uses hearing as a vehicle to reflect caring and improve the lives of individuals, families and communities around the world, by helping them reach their full potential. Hearing loss affects one in 10 Americans, and 63 million children worldwide, yet many do not have access to the hearing devices that can help them. Starkey Hearing Foundation fits and gives more than 100,000 hearing aids annually, and as a member of President Clinton&rsquo;s Global Initiative, it has pledged to fit one million hearing aids this decade. In addition to giving the gift of hearing through worldwide hearing missions, Starkey Hearing Foundation promotes hearing health awareness and education through the Listen Carefully initiative and provides hearing instruments to low-income Americans through the Hear Now program. For more information on Starkey Hearing Foundation, visit www.starkeyhearingfoundation.org.</p>','none','{filedir_2}SHF_2012Overview_NewsRelease_FINAL1.docx','none','pr@starkeyhearingfoundation.org','none','','none','','xhtml',0,'none'),(75,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Building_a_Better_Kibera.jpg','none','','none','<p>Foundation pledges hearing help to people affected by the Boston Marathon attack</p>\n\n<p>&nbsp;Minneapolis (April 18, 2013) &ndash; In response to the Boston Marathon tragedy, Starkey Hearing Foundation is offering free assistance to those who may have suffered hearing loss or tinnitus (residual ringing in the ears) as a result of the explosion.</p>\n\n<p>The Foundation believes this is a time when many should come together to extend caring hands, and people joining together to reflect light will outshine these moments of darkness. Starkey Hearing Foundation has helped people in need for more than 30 years and is hoping that by providing hearing assistance, it can play a small role in the recovery efforts in Boston.</p>\n\n<p>Individuals that think they may need hearing help should contact Starkey Hearing Foundation. The Foundation will work with local partners in the greater Boston area to make sure they receive hearing testing and care and will also provide hearing aids to the people that need them.</p>\n\n<p>For assistance, please contact:</p>\n\n<p>Starkey Hearing Foundation</p>\n\n<p>866.354.3254</p>','none','{filedir_2}SHF_2012Overview_NewsRelease_FINAL1.docx','none','info@starkeyfoundation.org','none','','none','','xhtml',0,'none'),(73,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(76,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}ABC_tani_austin_sr_140121_16x9_608.jpg','none','','none','{filedir_1}ABClogo.jpg','none',1390352040,'','none','Hearing is very emotional, Tani Austin said. It’s the road to the heart.\n','none','READ MORE','none','http://abcnews.go.com/blogs/health/2014/01/21/couple-brings-gift-of-hearing-to-impaired-across-the-globeusand/','none','ABC News ','none','false','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(77,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BLOG-Unstoppable_Spirit_LEAD.jpg','none','Hearing Missions','none',1362507480,'','none','<p>Like a typical 9-year-old girl, Maci Rowan loves the band One Direction and will proudly proclaim to anyone listening that her favorite song is&nbsp;What Makes You Beautiful. However, Maci is anything but typical. Born with cerebral palsy, she has had to overcome some significant physical obstacles in her short life. These obstacles became even more daunting last year when she began to suffer hearing loss.</p>\n\n<p>Despite her hearing loss, Maci continued to seek out ways to connect to the world and outlets for her jubilant energy and desire to learn. Unfortunately, Maci&rsquo;s normally excellent grades began to fall, and her frustration with not doing well in school and inability to connect with her peers and teachers, caused her to act out in class.&nbsp; At home, she turned to her dolls for company and connection. Her mother Christy became increasingly concerned over Maci&rsquo;s retreat into isolation. She recognized that hearing loss was to blame and reached out to Starkey Hearing Foundation for help.</p>\n\n<p>[gallery id = \"an-u\"]</p>\n\n<p>When Maci came to see us in New Orleans, her smile lit up the room, and her laughter was contagious. We had invited Maci to our Friday mission in partnership with Garth Brooks&rsquo; Super ProCamps, so that she could not only receive the gift of hearing but also participate in all the fun activities for the children. We watched in amazement as NFL stars were drawn to her boundless joy and curiosity. The Foundation team and our celebrity volunteers just couldn&rsquo;t get enough of Maci. &nbsp;Explaining her daughter&rsquo;s unique spirit, Christy said with a smile, &ldquo;She has always been this way. Once she gets you wrapped around her finger, you&rsquo;re lost. You have no chance of disciplining her.&rdquo;</p>\n\n<p>By the time she sat in Bill Austin&rsquo;s chair to receive the gift of hearing, Maci had not heard her own voice in months, but once she was fit, she beamed her irrepressible light and cried out, &ldquo;Oh! I can talk again!&rdquo;</p>\n\n<p>Able to confidently connect with the world again, Maci immediately joined the kids participating in the ProCamps cheerleading activities and won the &ldquo;Champion of the Day&rdquo; award. We know that with the gift of hearing this amazing girl will continue winning and inspire many more hearts and minds.</p>','none','SHF Staff','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(78,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(79,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(80,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg','none','Hearing Missions','none',1377811140,'','none','<p>Here&rsquo;s something to brighten your day! It certainly brightened ours. Witness the overwhelming joy and gratitude of a 96-year-old man in Trujillo, Peru reconnected to the world of sound after 40 years of silence. Praising God and everyone around him, the man sang, &ldquo;Continue to watch over me! I am here with my brothers. Please give us your grace. All my life this is how I will be. I will carry on, thanks to everyone! Thanks to God!&rdquo;</p>\n\n<p>His unbridled joy brought him to his feet in dance, as he immediately began to relish in all the sounds of life.</p>\n\n<p>[gallery id=\"blog-giving-back-the-world-in-trujillo-film\"]</p>','none','Foundation Staff','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(81,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none'),(83,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'12,000','none',' ','xhtml',3,'none'),(84,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'10000','none',' ','xhtml',1,'none'),(85,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'2323','none',' ','xhtml',2,'none'),(86,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'2433','none',' ','xhtml',4,'none'),(87,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'34534','none',' ','xhtml',5,'none'),(88,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'433','none',' ','xhtml',6,'none'),(89,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'34','none',' ','xhtml',7,'none'),(91,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL),(92,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg','none','Hearing Missions','none',1392316560,'','none','<p>International Hearing Mission Liaison Skye Girardin crisscrosses the globe dozens of times each year working to build solid partnerships that help us develop sustainable systems of hearing care. Skye works with our country coordinators and partners across Africa, Asia and South America to ensure that when the patients come to us for help, we are more than ready to meet their needs. We sat down with Skye to learn more about what it takes to prepare for phase two of a hearing mission, when we fit patients with hearing aids and give the gift of hearing.</p>\n\n<p><strong>What are the key things you need to do to prepare for a phase two hearing mission?</strong></p>\n\n<p>I need to inform our partners and keep in close contact with them to ensure that everything we need is ready. This means making sure we have exact dates, a site, tents, chairs, tables, volunteers. I also need to know any national or cultural events or holidays during our scheduled hearing mission. We need to take into account any changes in political climate or weather. I need to make sure our partners and coordinators in the field are going through their checklists over and over again to ensure everything is ready. Basically, a lot of emails, texts, phone calls, hope and crossed-fingers.</p>\n\n<p>[gallery id = \"blog-preparing-to-give-the-gift-of-hearing\"]</p>\n\n<p><strong>What are the biggest challenges you face in preparing for a hearing mission?</strong></p>\n\n<p>Trusting that the prices and everything that has been negotiated follows through and that all of the legwork has been done is a huge challenge. Because we manage much of the preparation remotely, it is difficult to ensure that what needs to happen does happen. Therefore, we rely heavily on our country coordinators and our partners to follow through. We are only as good as our partners.</p>\n\n<p><strong>What are your favorite things to do in preparation?</strong></p>\n\n<p>We focus strongly on the development of AfterCare programs. Throughout the process, we have ongoing conversations with our coordinators and partners about AfterCare strategies for after we leave. Much of the strategy and planning for this happens during preparation, but the hardcore training happens when we are there on the ground in order to enable our partners to take the program and run with it. It is exciting to be a part of their success.</p>\n\n<p>The other incredible thing is discovering great stories behind the hearing mission experience. There are always people we fit that have these amazing stories, and if we can find them ahead of time, then we can capture their story to share in the best way possible.</p>\n\n<p><strong>What do you take advantage of when you are home that you miss when you are on a hearing mission?</strong></p>\n\n<p>At home, I love not having to check in and out of a hotel and being able to just leave my stuff where I want. I love getting in my car and being able take myself somewhere. It&rsquo;s all the most basic things! To me Trader Joe&rsquo;s, some hot yoga and a shopping trip to REI &hellip;. I love it.</p>\n\n<p><strong>What do you look forward to most in the hearing mission experience?</strong></p>\n\n<p>I love setup day. Of course the hearing mission days are great, but all the planning culminates on set-up day &ndash; the day before the hearing mission. During this time we are training all of our volunteers, watching the tents go up and the chairs being set up. I want to make sure it&rsquo;s perfect. Then on the hearing mission day, I can enjoy giving the gift of hearing, knowing that all of the energy that went into the preparation was well worth it.</p>','none','Foundation Staff ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL),(93,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL),(94,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}BLOG-Impacting_a_life_in_Manila-LEAD.png','none','Hearing Missions','none',1377280500,'','none','<p>In December 2011, Manny Pacquiao joined us as a volunteer on a mission in Manila, Philippines. There he met Parisse, a young bright girl struggling with her studies because of hearing loss. He helped us give her the gift of hearing, and today, she is thriving and loves school. Watch our latest video blog to see how well she&rsquo;s doing and her very special message for Manny.</p>\n\n<p>[gallery id = \"blog-impacting-a-life-in-manila-film\"]</p>','none','Foundation Staff ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'homepage_feature_subtitle','Subtitle ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(2,1,1,'homepage_feature_splash_image','Hero Image ','W: browser width H: 600px ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(3,1,1,'homepage_feature_link','CTA Link','Insert URL that CTA will link out to, if feature is a video, insert video URL ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(4,1,2,'homepage_pictograms','homepage_pictograms','W 300px H: 180px','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(27,1,6,'homepage_map_category_title','Homepage Map Pin Category','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(5,1,3,'homepage_map_item_category','Map Pin Category','Select the pin type you want to display for this item','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI2Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7aTowO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(6,1,3,'homepage_map_item_lat','Latitude','Enter latitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(7,1,3,'homepage_map_item_lon','Longitude ','Enter Longitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,3,'homepage_map_item_location','Item Location','Enter location name if you want this to appear on map item i.e \"Los Angeles, CA\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(9,1,3,'homepage_map_item_content','Map Item Text ','Insert body copy here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',10,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(78,1,11,'press_release_contact','press_release_contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(77,1,11,'press_release_pdf_download','press_release_pdf_download','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(76,1,11,'press_release_body_text','press_release_body_text','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(75,1,11,'press_release_source','press_release_source','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(74,1,11,'press_release_image','press_release_image','W: browser width H: 525px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(73,1,10,'media_mention_body_text','Detail Page Body Text ','Input if media mention has a detail page ','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(18,1,5,'blog_featured','Blog Feature','Do you want this blog to appear in the Blog featured carousel? ','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(19,1,5,'blog_image','Blog Image ','This image will serve as the thumbnail image (W: 386px H: 230px)  as well as the header image (W: browser width H: 525px) on the blog post ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(20,1,5,'blog_category','Blog Category ','','select','News\nEvents\nHear Now\nGala\nFilms\nCelebrity\nOperation Change\nHearing Missions\nListen Carefully','n',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(21,1,5,'blog_date','Blog Date ','The post will appear to be published on the selected date ','date','','0',0,0,6,128,'y','ltr','n','n','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(48,1,1,'homepage_feature_cta','CTA Text ','Insert two to three words for CTA Text ','text','','0',0,0,6,256,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(47,1,5,'blog_related_items','Related Blog Posts ','Select related posts to appear at the bottom of this entry ','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',7,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI1Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(24,1,5,'blog_content','Blog Text ','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',7,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(25,1,5,'blog_author','Blog Author ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(26,1,2,'homepage_mission_statment','homepage_mission_statment','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(28,1,6,'homepage_map_category_image','Homepage Map Pin Icon','upload files as .pngs','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(29,1,3,'homepage_map_item_cta_link','Map Item CTA URL','Enter URL you would like to link to from Map Item','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(30,1,3,'homepage_map_item_cta_text','Map Item CTA Text ','Enter 2-3 words that will display as link out on map item i.e. \"Read More\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(56,1,8,'hear_now_form_contact','Hear Now Form Contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(46,1,3,'homepage_map_item_image','Homepage Map Item Image ','Upload Image to be displayed in map item panel W: 410px H: 378px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(33,1,7,'carousel_image','Carousel Thumb','This is the thumbnail image displayed in the carousel w: 400px h: 210 px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(34,1,7,'carousel_cta','Carousel CTA ','Enter two to three words to displayed as call to action link in carousel thumb','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(35,1,7,'carousel_panel_title','Carousel Panel Title ','W: browser width H: 560 px','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(36,1,7,'carousel_panel_image','Carousel Panel Image ','This is the main image that will display in the feature area when thumb is selected W: browser width H: 560px\n￼￼','file','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(37,1,7,'carousel_video_url','Carousel Video URL','If carousel item is a video, insert video URL here ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(38,1,7,'carousel_panel_cta','Carousel Panel CTA ','Enter two to three words to be displayed as link in in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(39,1,7,'carousel_panel_link','Carousel Panel CTA Link','Add URL that CTA will link out to in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(40,1,7,'carousel_body','Carousel Panel Text ','Insert body copy to be displayed in panel overlay ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',9,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6InkiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(41,1,8,'operation_change_content','Operation Change ','Enter text for Operation Change Tab here','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(42,1,8,'listen_carefully_content','Listen Carefully','Enter text for Listen Carefully Tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(44,1,8,'hear_now_content','Hear Now ','Enter text for Hear Now tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',4,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(45,1,8,'hearing_aid_recycling_content','Hearing Aid Recycle','Enter text for Hearing Aid Recycling tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',5,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(57,1,8,'hear_now_download_copy','Hear Now Download Copy','','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(49,1,8,'program_page_leader','Page Leader','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(71,1,10,'media_mention_source','Source ','CNN or SHF Team, etc','text','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(70,1,10,'media_mention_cta_link','CTA Link','Media Mentions Link out ','text','','0',0,0,6,500,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(69,1,10,'media_mention_cta_text','CTA Text ','For Feature Carousel: CTA for Article Media Mentions','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(68,1,10,'media_mention_quote','Article Quote ','For Feature Carousel: Uploading an article quote will create feature with blue background and quote ','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(67,1,10,'media_mention_date','Date ','','date','','0',0,0,6,128,'y','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(65,1,10,'media_mention_video_url','Video URL','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(66,1,10,'media_mention_logo','Logo','W: 100 H: 100','file','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(72,1,10,'media_mention_detail_page','Detail Page ','Does this media mention need a detail page? Otherwise media mentions will link out to external article ','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',10,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(58,1,8,'hear_now_form_download_english','Hear Now Form Download English','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6Im4iO3M6MTI6Im51bV9leGlzdGluZyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(59,1,8,'hear_now_form_download_spanish','Hear Now Form Download Spanish','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6Im4iO3M6MTI6Im51bV9leGlzdGluZyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(60,1,8,'operation_change_partnerships','Operation Change Partnerships','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',10,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(61,1,8,'listen_carefully_additional_reso','Listen Carefully Additional Resouces','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',11,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(62,1,9,'item','item','Can upload Single Image or Image and Video Combo - W: browser width H: 525px. \nMulti Image/Video Galleries - W: varies H: 525px','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(63,1,10,'media_mention_feature_carousel','Feature Carousel ','Do you want this media mention to appear in the carousel at the top of the page?','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(64,1,10,'media_mention_image','Image ','This image will appear as the Image in the feature carousel (W: browser width H: 525px) overlaying a video or as thumbnail (W: 386px H: 230px) in the gallery ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjA6IiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(79,1,12,'total_hearing_aids_provided','Hearing aids provided','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(80,1,12,'countries_visited','Countries Visited','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(81,1,12,'mm_order','Weight','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NzoiaW50ZWdlciI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9');
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
INSERT INTO `exp_channel_grid_field_60` VALUES (1,19,0,'Super Bowl Champion Ray Lewis Makes A Change','','http://www.youtube.com/watch?v=K9F21dP7Fts','Watch Video','{filedir_1}Operation-Change-Ray-Lewis-Film.jpg'),(3,19,1,'Donna Karan Taking About Change and Sustainability','','http://www.youtube.com/watch?v=tTLHRnADGXk','Watch Video','{filedir_1}Operation-Change-Donna-Karan-Film.jpg');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_61`
--

LOCK TABLES `exp_channel_grid_field_61` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_61` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_61` VALUES (1,19,1,'Fundamental Facts: Learn about hearing loss and how to prevent it.','','','http://www.starkey.com/improve-your-hearing','Learn More '),(2,19,2,'Hearing News: Are musicians at greater risk for hearing loss? ','','','http://www.starkey.com/','Learn More'),(3,19,3,'Marlee Martin: In her own words, the Oscar-winning actress explains how a hearing aid changed her life.','{filedir_1}marleemartin.jpeg','','http://www.youtube.com/watch?v=GIapKv8Pa1c&noredirect=1','Watch Video'),(4,19,0,'Loudness Wars: Does louder music compromise the listening experience? How some recorded music muddles sound and puts your hearing at risk.','','','http://www.starkeyhearingfoundation.org/Listen-Carefully-Loudness-Wars.pdf','Learn More');
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_62`
--

LOCK TABLES `exp_channel_grid_field_62` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_62` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_62` VALUES (1,25,0,'{filedir_1}Blog_Philippines_.jpg',''),(2,26,0,'{filedir_1}listencarefullygallery2.png',''),(3,31,0,'{filedir_1}HERO-Program-Operation_Change.png','http://www.youtube.com/watch?v=na5j0wDq7kc'),(9,52,0,'{filedir_1}billaustin.jpg',''),(4,32,0,'{filedir_1}listencarefully.jpg',''),(5,33,0,'{filedir_1}listencarefully2.jpg',''),(6,34,0,'{filedir_1}listencarefully3.jpg','http://www.youtube.com/watch?v=rlyH-ZcCf7o'),(7,35,0,'{filedir_1}hearnow1.jpg',''),(8,36,0,'{filedir_1}HERO-Hearing_Aid_Recycling.jpg','http://www.youtube.com/watch?v=tF-9R4UUWa8'),(10,53,0,'{filedir_1}billaustin.jpg',''),(11,53,1,'{filedir_1}Blog_A_Knight.jpg',''),(12,53,2,'{filedir_1}CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','http://www.youtube.com/watch?v=OJ4W9zzjgII'),(13,53,3,'{filedir_1}CAROUSEL-Building_a_Better_Kibera.jpg',''),(14,25,1,'{filedir_1}Blog_A_Knight.jpg',''),(15,25,2,'{filedir_1}CAROUSEL-Tony_Hawk_Event.JPG',''),(16,25,3,'',''),(19,78,0,'{filedir_1}BLOG-An_Unstoppable_Spirit_01.jpg',''),(20,78,1,'{filedir_1}BLOG-An_Unstoppable_Spirit_02.jpg',''),(18,73,0,'','http://youtu.be/lApt9XthONg'),(21,78,2,'',''),(22,79,0,'{filedir_1}LC-10-Sec-Video-02.png','http://www.youtube.com/watch?v=HXC2R5SR9aE'),(23,81,0,'','http://youtu.be/jK1lFYKgc7k'),(24,91,0,'{filedir_1}BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',''),(25,91,1,'{filedir_1}BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',''),(26,93,0,'','http://youtu.be/HVx-lUkcr38');
/*!40000 ALTER TABLE `exp_channel_grid_field_62` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_80`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_80`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_80` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_16` text,
  `col_id_17` text,
  `col_id_18` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_80`
--

LOCK TABLES `exp_channel_grid_field_80` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_80` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_80` VALUES (1,83,0,'Ethiopia','ET','100'),(2,83,1,'Malawi','ML','2000'),(3,83,2,'Nigeria','NG','1200'),(4,83,3,'South Africa','ZA','100'),(5,84,0,'California','US-CA','300'),(6,84,1,'Massachusetts','US-MA','3000'),(7,84,2,'New Jersey','US-NJ','5000'),(8,85,0,'Panama','PA','34434'),(9,86,0,'Philippines','PH','12'),(10,86,1,'Vietnam','VN','1234'),(11,87,0,'Colombia','CO','122'),(12,88,0,'Germany','DE','1212'),(13,89,0,'Australia','AU','12123');
/*!40000 ALTER TABLE `exp_channel_grid_field_80` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (2,1,4,1,NULL,'172.251.100.146','PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE','president-and-chelsea-clinton-visit-site-to-see','open','y',0,0,0,0,'y','n',1390188000,'2014','01','19',0,0,20140120033810,0,0),(3,1,4,1,NULL,'172.251.100.146','Starkey Executive Director Speaks on the \'Miracle\' of Watching Patients Hear for the Very First Time','starkey-executive-director-speaks-on-the-miracle-of-watching-patients-hear','open','y',0,0,0,0,'y','n',1390189140,'2014','01','19',0,0,20140120054413,0,0),(4,1,1,1,NULL,'167.100.118.140','Commitment to Action','commitment-to-action1','open','y',0,0,0,0,'y','n',1390237920,'2014','01','20',0,0,20140211170621,0,0),(5,1,1,1,NULL,'167.100.118.140','Building Sustainable Systems of Hearing Care','building-sustainable-systems-of-hearing-care','open','y',0,0,0,0,'y','n',1390197600,'2014','01','19',0,0,20140211165453,0,0),(6,1,7,1,NULL,'167.100.118.140','Celebrity Support','celebrity-support','open','y',0,0,0,0,'n','n',1390198920,'2014','01','19',0,0,20140211183425,0,0),(7,1,7,1,NULL,'167.100.118.140','Listen Carefully Goes Live','listen-carefully-in-schools','open','y',0,0,0,0,'n','n',1390199280,'2014','01','19',0,0,20140213185521,0,0),(8,1,7,1,NULL,'167.100.118.140','Recycling Sound','recycling-sound','open','y',0,0,0,0,'y','n',1390199700,'2014','01','19',0,0,20140213185030,0,0),(9,1,6,1,NULL,'172.251.100.146','Where We Are Now','where-we-are-now','open','y',0,0,0,0,'y','n',1390200540,'2014','01','19',0,0,20140120065030,0,0),(10,1,3,1,NULL,'167.100.118.140','Where we are now: India','where-we-are-now-india','open','y',0,0,0,0,'y','n',1390200600,'2014','01','19',0,0,20140211174749,0,0),(11,1,2,1,NULL,'167.100.118.140','Hearing Mission 1','we-use-hearing-as-a-vehicle-to-change-lives-around-the-world','open','y',0,0,0,0,'y','n',1390202040,'2014','01','19',0,0,20140214054722,0,0),(48,1,6,6,NULL,'67.53.113.42','Where we were yesterday','where-we-were-yesterday','open','y',0,0,0,0,'y','n',1391548500,'2014','02','04',0,0,20140204211619,0,0),(16,1,6,1,NULL,'76.169.36.76','Hearing Missions','hearing-missions','open','y',0,0,0,0,'y','n',1390241640,'2014','01','20',0,0,20140120181456,0,0),(17,1,10,1,NULL,'167.100.118.140','Programs','programs-2','open','y',0,0,0,0,'y','n',1390963920,'2014','01','28',0,0,20140213184603,0,0),(18,1,11,6,NULL,'208.54.64.170','Africa 2013: Day 5 Recap','africa-2013-day-5-recap','open','y',0,0,0,0,'y','n',1391028180,'2014','01','29',0,0,20140213024115,0,0),(19,1,10,6,NULL,'167.100.118.140','Programs','programs','open','y',0,0,0,0,'n','n',1391037960,'2014','01','29',0,0,20140213215358,0,0),(20,1,1,6,NULL,'167.100.118.140','Hear at Home','hear-at-home','open','y',0,0,0,0,'y','n',1391039400,'2014','01','29',0,0,20140211165704,0,0),(22,1,7,6,NULL,'67.53.113.42','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'y','n',1391122980,'2014','01','30',0,0,20140131193344,0,0),(31,1,12,6,NULL,'167.100.118.140','Operation Change Intro Video','operation-change-intro-video','open','y',0,0,0,0,'y','n',1391489640,'2014','02','03',0,0,20140212192852,0,0),(32,1,12,6,NULL,'172.251.100.146','ListenCarefully','listencarefully','open','y',0,0,0,0,'y','n',1391489940,'2014','02','03',0,0,20140204050053,0,0),(25,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery','listen-carefully-gallery','open','y',0,0,0,0,'y','n',1391200080,'2014','01','31',0,0,20140210215715,0,0),(26,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery 2','listen-carefully-gallery-2','open','y',0,0,0,0,'y','n',1391200380,'2014','01','31',0,0,20140131203441,0,0),(27,1,11,6,NULL,'67.53.113.42','Starkey Hearing Foundation','starkey-hearing-foundation','open','y',0,0,0,0,'y','n',1391287200,'2014','02','01',0,0,20140211200640,0,0),(28,1,11,6,NULL,'67.53.113.42','World Leaders, Celebrities and Athletes Attend Starkey Hearing Foundation Gala','world-leaders-celebrities-and-athletes-attend-starkey-hearing-foundation-ga','open','y',0,0,0,0,'y','n',1391287740,'2014','02','01',0,0,20140211200415,0,0),(29,1,11,6,NULL,'167.100.118.140','Twins Blog: The First Starkey Mission','twins-blog-the-first-starkey-mission','open','y',0,0,0,0,'y','n',1391288040,'2014','02','01',0,0,20140213224822,0,0),(49,1,3,6,NULL,'167.100.118.140','Partnering to Reach the World','partnering-to-reach-the-world','open','y',0,0,0,0,'n','n',1391548800,'2014','02','04',0,0,20140211175820,0,0),(33,1,12,6,NULL,'172.251.100.146','ListenCarefully2','listencarefully2','open','y',0,0,0,0,'y','n',1391490060,'2014','02','03',0,0,20140204050139,0,0),(34,1,12,6,NULL,'172.251.100.146','ListenCarefully3','listencarefully3','open','y',0,0,0,0,'y','n',1391490060,'2014','02','03',0,0,20140204050246,0,0),(35,1,12,6,NULL,'172.251.100.146','HearNow','hearnow','open','y',0,0,0,0,'y','n',1391490120,'2014','02','03',0,0,20140204050329,0,0),(36,1,12,6,NULL,'167.100.118.140','HearingAidRecycling','hearingaidrecycling','open','y',0,0,0,0,'y','n',1391490180,'2014','02','03',0,0,20140212200159,0,0),(38,1,6,6,NULL,'67.53.113.42','Program','program','open','y',0,0,0,0,'y','n',1391538480,'2014','02','04',0,0,20140204183050,0,0),(39,1,6,6,NULL,'67.53.113.42','Stories','stories','open','y',0,0,0,0,'y','n',1391538600,'2014','02','04',0,0,20140204183121,0,0),(40,1,6,6,NULL,'67.53.113.42','Video','video','open','y',0,0,0,0,'y','n',1391538660,'2014','02','04',0,0,20140204183151,0,0),(41,1,6,6,NULL,'67.53.113.42','Gallery','gallery','open','y',0,0,0,0,'y','n',1391538660,'2014','02','04',0,0,20140204183311,0,0),(42,1,3,6,NULL,'167.100.118.140','Stand Up for Skateparks Learns to Listen Carefully','stand-up-for-skateparks-learns-to-listen-carefully','open','y',0,0,0,0,'y','n',1391538780,'2014','02','04',0,0,20140211172022,0,0),(47,1,1,6,NULL,'167.100.118.140','Testing Homepage Slider','testing-homepage-slider','closed','y',0,0,0,0,'y','n',1391547960,'2014','02','04',0,0,20140211170711,0,0),(50,1,7,6,NULL,'67.53.113.42','Homepage Slider','homepage-slider','open','y',0,0,0,0,'y','n',1391549400,'2014','02','04',0,0,20140204213312,0,0),(52,1,12,6,NULL,'67.53.113.42','Testing Galleries','testing-galleries','open','y',0,0,0,0,'y','n',1391550900,'2014','02','04',0,0,20140204215623,0,0),(53,1,12,6,NULL,'67.53.113.42','Testing Gallery 2','testing-gallery-2','open','y',0,0,0,0,'y','n',1391551020,'2014','02','04',0,0,20140204220219,0,0),(54,1,13,6,NULL,'162.195.121.216','Starkey Press Release Test','starkey-press-release-test','open','y',0,0,0,0,'y','n',1391807640,'2014','02','07',0,0,20140207211620,0,0),(55,1,11,6,NULL,'67.53.113.42','CNN to Spotlight SHF','cnn-to-spotlight-shf','open','y',0,0,0,0,'y','n',1391807820,'2014','02','07',0,0,20140211200609,0,0),(56,1,11,6,NULL,'97.81.103.51','Clinton Foundation Article','shf-test-featured-mm','open','y',0,0,0,0,'y','n',1391820900,'2014','02','07',0,0,20140213004011,0,0),(87,1,14,1,NULL,'97.81.103.51','South America','south-america','open','y',0,0,0,0,'y','n',1392343860,'2014','02','13',0,0,20140214021231,0,0),(59,1,3,3,NULL,'167.100.118.140','Vikings Partner to Give the Gift of Hearing in Minnesota','vikings-partner-to-give-the-gift-of-hearing-in-minnesota','open','y',0,0,0,0,'n','n',1392139680,'2014','02','11',0,0,20140211173225,0,0),(60,1,3,3,NULL,'167.100.118.140','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'n','n',1392139920,'2014','02','11',0,0,20140211173641,0,0),(61,1,3,3,NULL,'167.100.118.140','Changing Lives with Sir Richard Branson and Virgin Unite','changing-lives-with-sir-richard-branson-and-virgin-unite','open','y',0,0,0,0,'n','n',1392140220,'2014','02','11',0,0,20140211174530,0,0),(62,1,3,3,NULL,'167.100.118.140','Building Momentum for Peace in the West Bank','building-momentum-for-peace-in-the-west-bank','open','y',0,0,0,0,'n','n',1392140460,'2014','02','11',0,0,20140211174453,0,0),(63,1,3,3,NULL,'167.100.118.140','Building a Better Kibera','building-a-better-kibera','open','y',0,0,0,0,'n','n',1392141540,'2014','02','11',0,0,20140211181656,0,0),(64,1,7,3,NULL,'167.100.118.140','Bill Austin Legacy','bill-austin-legacy','open','y',0,0,0,0,'n','n',1392143640,'2014','02','11',0,0,20140213184421,0,0),(65,1,7,3,NULL,'67.53.113.42','2013 So the World May Hear Awards Gala Highlights','2013-so-the-world-may-hear-awards-gala-highlights','open','y',0,0,0,0,'y','n',1392144180,'2014','02','11',0,0,20140213200011,0,0),(86,1,14,1,NULL,'97.81.103.51','Asia','asia','open','y',0,0,0,0,'y','n',1392343860,'2014','02','13',0,0,20140214021146,0,0),(67,1,7,3,NULL,'167.100.118.140','Operation Change','operation-change','open','y',0,0,0,0,'y','n',1392148680,'2014','02','11',0,0,20140213184716,0,0),(74,1,5,4,NULL,'167.100.118.140','Transforming through Volunteerism in Queretaro','transforming-through-volunteerism-in-queretaro','open','y',0,0,0,0,'y','n',1392156660,'2014','02','11',0,0,20140213214642,0,0),(75,1,13,6,NULL,'67.53.113.42','Starkey Hearing Foundation Offers Assistance in Boston','starkey-hearing-foundation-offers-assistance-in-boston','open','y',0,0,0,0,'y','n',1392158220,'2014','02','11',0,0,20140211223900,0,0),(70,1,13,6,NULL,'67.53.113.42','A Record-Setting Year for the Starkey Hearing Foundation','a-record-setting-year-for-the-starkey-hearing-foundation','open','y',0,0,0,0,'y','n',1392152340,'2014','02','11',0,0,20140211210226,0,0),(85,1,14,1,NULL,'97.81.103.51','Central America & Caribbean','central-america-caribbean','open','y',0,0,0,0,'y','n',1392343800,'2014','02','13',0,0,20140214022003,0,0),(83,1,14,1,NULL,'97.81.103.51','Africa','africa','open','y',0,0,0,0,'y','n',1392343200,'2014','02','13',0,0,20140214023631,0,0),(84,1,14,1,NULL,'97.81.103.51','US','us','open','y',0,0,0,0,'y','n',1392343740,'2014','02','13',0,0,20140214021003,0,0),(73,1,12,4,NULL,'167.100.118.140','BLOG-Transforming _through_Volunteerism_in_Queretaro-FILM','transforming-through-volunteerism-in-queretaro','open','y',0,0,0,0,'y','n',1392156480,'2014','02','11',0,0,20140213175112,0,0),(76,1,11,6,NULL,'167.100.118.140','Couple Brings Gift of Hearing to Impaired Across the Globe','couple-brings-gifts-of-hearing-to-impaired-across-the-globe','open','y',0,0,0,0,'y','n',1392158580,'2014','02','11',0,0,20140213230151,0,0),(77,1,5,4,NULL,'167.100.118.140','An Unstoppable Spirit','an-unstoppable-spirit','open','y',0,0,0,0,'y','n',1392221880,'2014','02','12',0,0,20140214174214,0,0),(78,1,12,4,NULL,'167.100.118.140','BLOG-An_Unstoppable_Spirit','an-u','open','y',0,0,0,0,'y','n',1392222420,'2014','02','12',0,0,20140212163927,0,0),(79,1,12,3,NULL,'167.100.118.140','Listen Carefully-10-Second-Film','listen-carefully-10-second-film','open','y',0,0,0,0,'y','n',1392228060,'2014','02','12',0,0,20140212190317,0,0),(80,1,5,4,NULL,'97.81.103.51','Giving Back the World in Trujillo','giving-back-the-world-in-trujillo','open','y',0,0,0,0,'y','n',1392322740,'2014','02','13',0,0,20140214004358,0,0),(81,1,12,4,NULL,'167.100.118.140','BLOG-Giving_Back_the_World_in_Trujillo-FILM','blog-giving-back-the-world-in-trujillo-film','open','y',0,0,0,0,'y','n',1392323580,'2014','02','13',0,0,20140213204124,0,0),(88,1,14,1,NULL,'97.81.103.51','Europe','europe','open','y',0,0,0,0,'y','n',1392343920,'2014','02','13',0,0,20140214021305,0,0),(89,1,14,1,NULL,'97.81.103.51','Australia','australia','open','y',0,0,0,0,'y','n',1392343980,'2014','02','13',0,0,20140214021341,0,0),(91,1,12,4,NULL,'167.100.118.140','BLOG-Preparing_to_give_the_gift_of_hearing','blog-preparing-to-give-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1392395640,'2014','02','14',0,0,20140214163617,0,0),(92,1,5,4,NULL,'167.100.118.140','Preparing to Give the Gift of Hearing','preparing-to-give-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1392395760,'2014','02','14',0,0,20140214164342,0,0),(93,1,12,4,NULL,'167.100.118.140','BLOG-Impacting_a_life_in_Manila-FILM','blog-impacting-a-life-in-manila-film','open','y',0,0,0,0,'y','n',1392396840,'2014','02','14',0,0,20140214165514,0,0),(94,1,5,4,NULL,'167.100.118.140','Impacting a Life in Manila','impacting-a-life-in-manila','open','y',0,0,0,0,'y','n',1392396900,'2014','02','14',0,0,20140214165831,0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'homepage_features','Homepage Hero Slider ','http://starkey.ahundredyears.com/','','en',3,0,1391039400,0,'',NULL,'open',1,1,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(2,1,'homepage_content','Homepage Mission and Pictograms ','http://starkey.ahundredyears.com/','','en',1,0,1390202040,0,'',NULL,'open',2,4,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(3,1,'homepage_map_items','Homepage Map Items','http://starkey.ahundredyears.com/',NULL,'en',8,0,1392141540,0,'',NULL,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(4,1,'media_mentions_carousel','Media Mentions Carousel','http://starkey.ahundredyears.com/','','en',2,0,1390189140,0,'',NULL,'open',NULL,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(5,1,'blog','Blog','http://starkey.ahundredyears.com/',NULL,'en',5,0,1392396900,0,'',NULL,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(6,1,'homepage_map_categories','Homepage Map Categories','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391548500,0,'',NULL,'open',6,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(7,1,'homepage_main_carousel','Homepage Bottom Carousel','http://starkey.ahundredyears.com/','','en',8,0,1392148680,0,'',NULL,'open',7,33,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(8,1,'operation_change_carousel','Operation Change Carousel','http://starkey.ahundredyears.com/','','en',0,0,0,0,'',NULL,'open',7,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(9,1,'listen_carefully','Listen Carefully','http://starkey.ahundredyears.com/',NULL,'en',0,0,0,0,'',NULL,'open',7,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(10,1,'programs','Programs','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391037960,0,'',NULL,'open',8,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(13,1,'press_releases','Press Releases','http://starkey.ahundredyears.com/',NULL,'en',3,0,1392158220,0,'',NULL,'open',11,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(11,1,'media_mentions','Media Mentions','http://starkey.ahundredyears.com/',NULL,'en',7,0,1392158580,0,'',NULL,'open',10,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(12,1,'gallery','Gallery','http://starkey.ahundredyears.com/',NULL,'en',16,0,1392396840,0,'',NULL,'open',9,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(14,1,'mission_markers','Mission Markers','http://starkey.ahundredyears.com/',NULL,'en',7,0,1392343980,0,'',1,'open',12,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'dev@100yea.rs','10.11.0.1',1389245396,'Logged in'),(2,1,1,'dev@100yea.rs','10.11.0.1',1389245511,'Site Updated&nbsp;&nbsp;Starkey Hearing Foundation'),(3,1,1,'dev@100yea.rs','10.11.0.1',1389255875,'Logged out'),(4,1,1,'dev@100yea.rs','10.11.0.1',1389306293,'Logged in'),(5,1,1,'dev@100yea.rs','67.53.113.42',1389658121,'Logged in'),(6,1,1,'dev@100yea.rs','67.53.113.42',1390001368,'Logged in'),(7,1,1,'dev@100yea.rs','67.53.113.42',1390001560,'Field Group Created:&nbsp;Homepage Features'),(8,1,1,'dev@100yea.rs','67.53.113.42',1390001825,'Field Group Created:&nbsp;Homepage Pictograms'),(9,1,1,'dev@100yea.rs','67.53.113.42',1390001855,'Field Group Created:&nbsp;Homepage Map Items'),(10,1,1,'dev@100yea.rs','67.53.113.42',1390001975,'Field Group Created:&nbsp;Media Mentions'),(11,1,1,'dev@100yea.rs','67.53.113.42',1390002133,'Field Group Created:&nbsp;Blog'),(12,1,1,'dev@100yea.rs','67.53.113.42',1390002338,'Channel Created:&nbsp;&nbsp;Homepage Features'),(13,1,1,'dev@100yea.rs','67.53.113.42',1390002360,'Channel Created:&nbsp;&nbsp;Homepage Pictograms'),(14,1,1,'dev@100yea.rs','67.53.113.42',1390002379,'Channel Created:&nbsp;&nbsp;Homepage Map Items'),(15,1,1,'dev@100yea.rs','67.53.113.42',1390002398,'Channel Created:&nbsp;&nbsp;Media Mentions'),(16,1,1,'dev@100yea.rs','67.53.113.42',1390002408,'Channel Created:&nbsp;&nbsp;Blog'),(17,1,1,'dev@100yea.rs','67.53.113.42',1390003402,'Logged in'),(18,1,1,'dev@100yea.rs','76.169.36.76',1390174434,'Logged in'),(19,1,1,'dev@100yea.rs','172.251.100.146',1390175990,'Logged in'),(20,1,1,'dev@100yea.rs','172.251.100.146',1390178704,'Logged out'),(21,1,1,'dev@100yea.rs','76.169.36.76',1390186504,'Logged in'),(22,1,1,'dev@100yea.rs','76.169.36.76',1390186888,'Field Group Created:&nbsp;Homepage Map Categories'),(23,1,1,'dev@100yea.rs','76.169.36.76',1390187000,'Channel Created:&nbsp;&nbsp;Homepage Map Categories'),(24,1,1,'dev@100yea.rs','76.169.36.76',1390187478,'Field Group Created:&nbsp;Homepage Main Carousel'),(25,1,1,'dev@100yea.rs','76.169.36.76',1390187711,'Channel Created:&nbsp;&nbsp;Main Carousel'),(26,1,1,'dev@100yea.rs','172.251.100.146',1390188000,'Logged in'),(27,1,1,'dev@100yea.rs','76.169.36.76',1390188084,'Channel Created:&nbsp;&nbsp;Operation Change'),(28,1,1,'dev@100yea.rs','76.169.36.76',1390188095,'Channel Created:&nbsp;&nbsp;Listen Carefully'),(29,1,1,'dev@100yea.rs','76.169.36.76',1390188185,'Channel Created:&nbsp;&nbsp;Programs'),(30,1,1,'dev@100yea.rs','76.169.36.76',1390188198,'Field Group Created:&nbsp;Programs'),(31,1,1,'dev@100yea.rs','76.169.36.76',1390190779,'Logged out'),(32,1,1,'dev@100yea.rs','172.251.100.146',1390192108,'Logged in'),(33,1,1,'dev@100yea.rs','172.251.100.146',1390192138,'Logged out'),(34,1,1,'dev@100yea.rs','172.251.100.146',1390192147,'Logged in'),(35,1,1,'dev@100yea.rs','76.169.36.76',1390195561,'Logged in'),(36,1,1,'dev@100yea.rs','172.251.100.146',1390196042,'Logged out'),(37,1,1,'dev@100yea.rs','172.251.100.146',1390196559,'Logged in'),(38,1,1,'dev@100yea.rs','76.169.36.76',1390197123,'Logged in'),(39,1,1,'dev@100yea.rs','76.169.36.76',1390198922,'Custom Field Deleted:&nbsp;carousel_title'),(40,1,1,'dev@100yea.rs','76.169.36.76',1390201092,'Logged in'),(41,1,1,'dev@100yea.rs','76.169.36.76',1390202448,'Custom Field Deleted:&nbsp;blog_link'),(42,1,1,'dev@100yea.rs','76.169.36.76',1390202491,'Custom Field Deleted:&nbsp;blog_source'),(43,1,1,'dev@100yea.rs','172.251.100.146',1390208228,'Logged out'),(44,1,1,'dev@100yea.rs','76.169.36.76',1390209177,'Logged out'),(45,1,1,'dev@100yea.rs','67.53.113.42',1390237918,'Logged in'),(46,1,1,'dev@100yea.rs','76.169.36.76',1390238882,'Logged in'),(47,1,1,'dev@100yea.rs','76.169.36.76',1390241230,'Logged in'),(48,1,1,'dev@100yea.rs','67.53.113.42',1390243995,'Logged out'),(49,1,1,'dev@100yea.rs','67.53.113.42',1390850253,'Logged in'),(50,1,1,'dev@100yea.rs','67.53.113.42',1390850428,'Member profile created:&nbsp;&nbsp;taylor_joseph'),(51,1,1,'dev@100yea.rs','67.53.113.42',1390850463,'Member profile created:&nbsp;&nbsp;trinh_mai'),(52,1,1,'dev@100yea.rs','67.53.113.42',1390850495,'Member profile created:&nbsp;&nbsp;laura_hetzel'),(53,1,1,'dev@100yea.rs','67.53.113.42',1390850564,'Member profile created:&nbsp;&nbsp;randall_ward'),(54,1,1,'dev@100yea.rs','67.53.113.42',1390850671,'Screen name was changed to:&nbsp;&nbsp;Trinh Mai'),(55,1,1,'dev@100yea.rs','67.53.113.42',1390864649,'Logged in'),(56,1,1,'dev@100yea.rs','67.53.113.42',1390865172,'Logged in'),(57,1,1,'dev@100yea.rs','67.53.113.42',1390865267,'Member profile created:&nbsp;&nbsp;julie@100yea.rs'),(58,1,6,'julie@100yea.rs','67.53.113.42',1390865391,'Logged in'),(59,1,6,'julie@100yea.rs','172.251.100.146',1390879909,'Logged in'),(60,1,1,'dev@100yea.rs','76.169.36.76',1390881643,'Logged in'),(61,1,1,'dev@100yea.rs','76.169.36.76',1390888793,'Logged in'),(62,1,1,'dev@100yea.rs','76.169.36.76',1390892415,'Logged out'),(63,1,6,'julie@100yea.rs','172.251.100.146',1390934637,'Logged in'),(64,1,1,'dev@100yea.rs','67.53.113.42',1390942116,'Logged in'),(65,1,1,'dev@100yea.rs','67.53.113.42',1390942173,'Logged in'),(66,1,6,'julie@100yea.rs','172.251.100.146',1390944299,'Logged out'),(67,1,6,'julie@100yea.rs','172.251.100.146',1390946652,'Logged in'),(68,1,6,'julie@100yea.rs','172.251.100.146',1390962146,'Logged in'),(69,1,1,'dev@100yea.rs','76.169.36.76',1390963929,'Logged in'),(70,1,6,'julie@100yea.rs','172.251.100.146',1390966989,'Logged out'),(71,1,6,'julie@100yea.rs','172.251.100.146',1390970002,'Logged in'),(72,1,1,'dev@100yea.rs','76.169.36.76',1390971428,'Logged in'),(73,1,6,'julie@100yea.rs','172.251.100.146',1390974780,'Logged in'),(74,1,1,'dev@100yea.rs','76.169.36.76',1390975337,'Logged in'),(75,1,1,'dev@100yea.rs','76.169.36.76',1390975463,'Member profile created:&nbsp;&nbsp;tulika_bose'),(76,1,1,'dev@100yea.rs','76.169.36.76',1390975508,'Member profile created:&nbsp;&nbsp;megan_sheley'),(77,1,6,'julie@100yea.rs','172.251.100.146',1390977916,'Logged out'),(78,1,1,'dev@100yea.rs','76.169.36.76',1390981911,'Logged out'),(79,1,1,'dev@100yea.rs','76.169.36.76',1390983433,'Logged in'),(80,1,1,'dev@100yea.rs','76.169.36.76',1390986303,'Logged in'),(81,1,1,'dev@100yea.rs','76.169.36.76',1390987040,'Logged out'),(82,1,1,'dev@100yea.rs','76.169.36.76',1390987518,'Logged in'),(83,1,1,'dev@100yea.rs','76.169.36.76',1390990723,'Logged out'),(84,1,6,'julie@100yea.rs','172.251.100.146',1391017243,'Logged in'),(85,1,1,'dev@100yea.rs','76.169.36.76',1391018846,'Logged in'),(86,1,6,'julie@100yea.rs','172.251.100.146',1391021598,'Logged in'),(87,1,1,'dev@100yea.rs','76.169.36.76',1391022070,'Logged out'),(88,1,1,'dev@100yea.rs','76.169.36.76',1391023429,'Logged in'),(89,1,6,'julie@100yea.rs','172.251.100.146',1391024368,'Logged in'),(90,1,1,'dev@100yea.rs','76.169.36.76',1391025187,'Channel Created:&nbsp;&nbsp;Media Mentions'),(91,1,6,'julie@100yea.rs','172.251.100.146',1391025819,'Logged out'),(92,1,6,'julie@100yea.rs','172.251.100.146',1391025824,'Logged in'),(93,1,1,'dev@100yea.rs','76.169.36.76',1391025894,'Logged out'),(94,1,1,'dev@100yea.rs','76.169.36.76',1391025897,'Logged in'),(95,1,6,'julie@100yea.rs','172.251.100.146',1391026118,'Logged in'),(96,1,6,'julie@100yea.rs','172.251.100.146',1391026128,'Logged in'),(97,1,6,'julie@100yea.rs','172.251.100.146',1391026387,'Logged in'),(98,1,1,'dev@100yea.rs','76.169.36.76',1391026426,'Logged in'),(99,1,1,'dev@100yea.rs','76.169.36.76',1391031302,'Logged in'),(100,1,6,'julie@100yea.rs','172.251.100.146',1391032109,'Logged in'),(101,1,1,'dev@100yea.rs','76.169.36.76',1391037048,'Logged in'),(102,1,6,'julie@100yea.rs','172.251.100.146',1391037612,'Logged out'),(103,1,6,'julie@100yea.rs','172.251.100.146',1391038002,'Logged in'),(104,1,1,'dev@100yea.rs','76.169.36.76',1391038930,'Custom Field Deleted:&nbsp;Hear Now Title'),(105,1,1,'dev@100yea.rs','76.169.36.76',1391040145,'Logged in'),(106,1,1,'dev@100yea.rs','76.169.36.76',1391042932,'Logged out'),(107,1,1,'dev@100yea.rs','76.169.36.76',1391043035,'Logged in'),(108,1,1,'dev@100yea.rs','76.169.36.76',1391048286,'Logged out'),(109,1,1,'dev@100yea.rs','76.169.36.76',1391053349,'Logged in'),(110,1,6,'julie@100yea.rs','172.251.100.146',1391063062,'Logged in'),(111,1,6,'julie@100yea.rs','172.251.100.146',1391067363,'Logged out'),(112,1,1,'dev@100yea.rs','67.53.113.42',1391105484,'Logged in'),(113,1,1,'dev@100yea.rs','67.53.113.42',1391108060,'Logged out'),(114,1,6,'julie@100yea.rs','67.53.113.42',1391108410,'Logged in'),(115,1,6,'julie@100yea.rs','67.53.113.42',1391111693,'Logged out'),(116,1,6,'julie@100yea.rs','67.53.113.42',1391122997,'Logged in'),(117,1,1,'dev@100yea.rs','76.169.36.76',1391189536,'Logged in'),(118,1,1,'dev@100yea.rs','76.169.36.76',1391192377,'Logged in'),(119,1,1,'dev@100yea.rs','76.169.36.76',1391192642,'Custom Field Deleted:&nbsp;homepage_map_item_subtitle'),(120,1,1,'dev@100yea.rs','76.169.36.76',1391193919,'Logged in'),(121,1,6,'julie@100yea.rs','67.53.113.42',1391196783,'Logged in'),(122,1,1,'dev@100yea.rs','76.169.36.76',1391198029,'Logged out'),(123,1,1,'dev@100yea.rs','76.169.36.76',1391198055,'Logged in'),(124,1,1,'dev@100yea.rs','76.169.36.76',1391198207,'Logged in'),(125,1,1,'dev@100yea.rs','76.169.36.76',1391199105,'Field Group Created:&nbsp;Gallery'),(126,1,1,'dev@100yea.rs','76.169.36.76',1391199167,'Channel Created:&nbsp;&nbsp;Gallery'),(127,1,1,'dev@100yea.rs','76.169.36.76',1391201583,'Logged out'),(128,1,6,'julie@100yea.rs','67.53.113.42',1391206034,'Logged out'),(129,1,1,'dev@100yea.rs','76.169.36.76',1391210574,'Logged in'),(130,1,1,'dev@100yea.rs','76.169.36.76',1391211049,'Logged in'),(131,1,6,'julie@100yea.rs','67.53.113.42',1391211422,'Logged in'),(132,1,6,'julie@100yea.rs','67.53.113.42',1391215453,'Logged in'),(133,1,1,'dev@100yea.rs','76.169.36.76',1391219603,'Logged in'),(134,1,6,'julie@100yea.rs','172.251.100.146',1391287070,'Logged in'),(135,1,1,'dev@100yea.rs','76.90.138.219',1391287092,'Logged in'),(136,1,1,'dev@100yea.rs','66.215.94.39',1391287166,'Logged in'),(137,1,1,'dev@100yea.rs','66.215.94.39',1391287445,'Logged in'),(138,1,1,'dev@100yea.rs','66.215.94.39',1391288259,'Logged in'),(139,1,1,'dev@100yea.rs','66.215.94.39',1391288473,'Logged in'),(140,1,1,'dev@100yea.rs','66.215.94.39',1391288998,'Logged in'),(141,1,1,'dev@100yea.rs','66.215.94.39',1391294402,'Logged out'),(142,1,1,'dev@100yea.rs','76.169.36.76',1391315976,'Logged in'),(143,1,1,'dev@100yea.rs','76.169.36.76',1391323405,'Logged in'),(144,1,6,'julie@100yea.rs','172.251.100.146',1391381453,'Logged in'),(145,1,6,'julie@100yea.rs','172.251.100.146',1391383034,'Logged out'),(146,1,6,'julie@100yea.rs','67.53.113.42',1391449436,'Logged in'),(147,1,6,'julie@100yea.rs','67.53.113.42',1391460251,'Logged in'),(148,1,6,'julie@100yea.rs','67.53.113.42',1391463344,'Logged out'),(149,1,6,'julie@100yea.rs','67.53.113.42',1391464865,'Logged in'),(150,1,6,'julie@100yea.rs','67.53.113.42',1391469120,'Logged out'),(151,1,6,'julie@100yea.rs','67.53.113.42',1391470529,'Logged in'),(152,1,6,'julie@100yea.rs','67.53.113.42',1391473159,'Logged out'),(153,1,1,'dev@100yea.rs','67.53.113.42',1391474212,'Logged in'),(154,1,6,'julie@100yea.rs','172.251.100.146',1391489653,'Logged in'),(155,1,6,'julie@100yea.rs','172.251.100.146',1391490424,'Logged in'),(156,1,6,'julie@100yea.rs','67.53.113.42',1391538264,'Logged in'),(157,1,6,'julie@100yea.rs','67.53.113.42',1391539983,'Logged in'),(158,1,6,'julie@100yea.rs','67.53.113.42',1391540284,'Logged in'),(159,1,1,'dev@100yea.rs','67.53.113.42',1391540341,'Logged in'),(160,1,1,'dev@100yea.rs','67.53.113.42',1391540362,'Logged in'),(161,1,1,'dev@100yea.rs','67.53.113.42',1391541394,'Logged in'),(162,1,1,'dev@100yea.rs','67.53.113.42',1391541873,'Logged in'),(163,1,6,'julie@100yea.rs','67.53.113.42',1391545117,'Logged out'),(164,1,1,'dev@100yea.rs','67.53.113.42',1391545801,'Logged in'),(165,1,1,'dev@100yea.rs','67.53.113.42',1391548761,'Logged in'),(166,1,6,'julie@100yea.rs','67.53.113.42',1391552090,'Logged out'),(167,1,2,'taylor_joseph','67.53.113.42',1391552108,'Logged in'),(168,1,6,'julie@100yea.rs','67.53.113.42',1391553026,'Logged in'),(169,1,6,'julie@100yea.rs','67.53.113.42',1391557367,'Logged out'),(170,1,3,'trinh_mai','167.100.118.140',1391610838,'Logged in'),(171,1,6,'julie@100yea.rs','67.53.113.42',1391715768,'Logged in'),(172,1,6,'julie@100yea.rs','67.53.113.42',1391721251,'Logged in'),(173,1,6,'julie@100yea.rs','67.53.113.42',1391725914,'Logged in'),(174,1,6,'julie@100yea.rs','67.53.113.42',1391728405,'Logged out'),(175,1,1,'dev@100yea.rs','76.169.36.76',1391791133,'Logged in'),(176,1,1,'dev@100yea.rs','76.169.36.76',1391791171,'Field Group Created:&nbsp;Media Mention'),(177,1,1,'dev@100yea.rs','76.169.36.76',1391791318,'Field group Deleted:&nbsp;&nbsp;Media Mentions'),(178,1,1,'dev@100yea.rs','76.169.36.76',1391791486,'Field Group Created:&nbsp;Press Release'),(179,1,1,'dev@100yea.rs','76.169.36.76',1391793017,'Logged in'),(180,1,1,'dev@100yea.rs','76.169.36.76',1391793048,'Channel Created:&nbsp;&nbsp;Press Releases'),(181,1,1,'dev@100yea.rs','67.53.113.42',1391800501,'Logged in'),(182,1,1,'dev@100yea.rs','67.53.113.42',1391803027,'Logged out'),(183,1,1,'dev@100yea.rs','67.53.113.42',1391805360,'Logged in'),(184,1,6,'julie@100yea.rs','162.195.121.216',1391807685,'Logged in'),(185,1,1,'dev@100yea.rs','67.53.113.42',1391807839,'Logged out'),(186,1,1,'dev@100yea.rs','76.169.36.76',1391807897,'Logged in'),(187,1,1,'dev@100yea.rs','67.53.113.42',1391810252,'Logged in'),(188,1,1,'dev@100yea.rs','67.53.113.42',1391812818,'Logged out'),(189,1,1,'dev@100yea.rs','107.214.220.202',1391815914,'Logged in'),(190,1,6,'julie@100yea.rs','172.251.100.146',1391820905,'Logged in'),(191,1,6,'julie@100yea.rs','172.251.100.146',1391997349,'Logged in'),(192,1,1,'dev@100yea.rs','67.53.113.42',1392068813,'Logged in'),(193,1,6,'julie@100yea.rs','67.53.113.42',1392069382,'Logged in'),(194,1,1,'dev@100yea.rs','67.53.113.42',1392071244,'Logged out'),(195,1,1,'dev@100yea.rs','67.53.113.42',1392072598,'Logged in'),(196,1,6,'julie@100yea.rs','67.53.113.42',1392074239,'Logged in'),(197,1,1,'dev@100yea.rs','67.53.113.42',1392075496,'Logged out'),(198,1,3,'trinh_mai','167.100.118.140',1392130151,'Logged in'),(199,1,1,'dev@100yea.rs','198.15.96.194',1392136134,'Logged in'),(200,1,1,'dev@100yea.rs','198.15.96.194',1392140054,'Logged out'),(201,1,6,'julie@100yea.rs','67.53.113.42',1392142443,'Logged in'),(202,1,1,'dev@100yea.rs','198.15.96.194',1392142502,'Logged in'),(203,1,6,'julie@100yea.rs','67.53.113.42',1392145083,'Logged out'),(204,1,6,'julie@100yea.rs','67.53.113.42',1392146545,'Logged in'),(205,1,1,'dev@100yea.rs','198.15.96.194',1392146795,'Logged out'),(206,1,1,'dev@100yea.rs','76.169.36.76',1392147496,'Logged in'),(207,1,3,'trinh_mai','167.100.118.140',1392147536,'Logged out'),(208,1,3,'trinh_mai','167.100.118.140',1392147853,'Logged in'),(209,1,6,'julie@100yea.rs','67.53.113.42',1392149146,'Logged in'),(210,1,1,'dev@100yea.rs','76.169.36.76',1392149530,'Logged in'),(211,1,1,'dev@100yea.rs','76.169.36.76',1392151150,'Logged in'),(212,1,4,'laura_hetzel','167.100.118.140',1392156335,'Logged in'),(213,1,1,'dev@100yea.rs','198.15.96.194',1392157461,'Logged in'),(214,1,4,'laura_hetzel','167.100.118.140',1392159315,'Logged out'),(215,1,6,'julie@100yea.rs','67.53.113.42',1392159497,'Logged in'),(216,1,3,'trinh_mai','167.100.118.140',1392159772,'Logged out'),(217,1,3,'trinh_mai','167.100.118.140',1392160659,'Logged in'),(218,1,6,'julie@100yea.rs','67.53.113.42',1392165432,'Logged out'),(219,1,3,'trinh_mai','167.100.118.140',1392218442,'Logged in'),(220,1,4,'laura_hetzel','167.100.118.140',1392221654,'Logged in'),(221,1,4,'laura_hetzel','167.100.118.140',1392226057,'Logged out'),(222,1,3,'trinh_mai','167.100.118.140',1392230636,'Logged out'),(223,1,3,'trinh_mai','167.100.118.140',1392231186,'Logged in'),(224,1,1,'dev@100yea.rs','76.169.36.76',1392232161,'Logged in'),(225,1,3,'trinh_mai','167.100.118.140',1392237736,'Logged out'),(226,1,3,'trinh_mai','167.100.118.140',1392240149,'Logged in'),(227,1,1,'dev@100yea.rs','67.53.113.42',1392250024,'Logged in'),(228,1,1,'dev@100yea.rs','97.81.103.51',1392250385,'Logged in'),(229,1,6,'julie@100yea.rs','67.53.113.42',1392250455,'Logged in'),(230,1,6,'julie@100yea.rs','67.53.113.42',1392253985,'Logged out'),(231,1,6,'julie@100yea.rs','67.53.113.42',1392254957,'Logged in'),(232,1,1,'dev@100yea.rs','208.54.64.170',1392256344,'Logged out'),(233,1,1,'dev@100yea.rs','208.54.64.170',1392256655,'Logged in'),(234,1,6,'julie@100yea.rs','67.53.113.42',1392257706,'Logged out'),(235,1,6,'julie@100yea.rs','67.53.113.42',1392260070,'Logged in'),(236,1,6,'julie@100yea.rs','172.251.100.146',1392274130,'Logged in'),(237,1,3,'trinh_mai','167.100.118.140',1392304945,'Logged in'),(238,1,3,'trinh_mai','167.100.118.140',1392307360,'Logged out'),(239,1,4,'laura_hetzel','167.100.118.140',1392313593,'Logged in'),(240,1,3,'trinh_mai','167.100.118.140',1392316359,'Logged in'),(241,1,3,'trinh_mai','167.100.118.140',1392320201,'Logged out'),(242,1,6,'julie@100yea.rs','67.53.113.42',1392321549,'Logged in'),(243,1,3,'trinh_mai','167.100.118.140',1392326214,'Logged in'),(244,1,4,'laura_hetzel','167.100.118.140',1392326614,'Logged out'),(245,1,4,'laura_hetzel','167.100.118.140',1392327506,'Logged in'),(246,1,6,'julie@100yea.rs','67.53.113.42',1392334516,'Logged in'),(247,1,1,'dev@100yea.rs','97.81.103.51',1392334780,'Logged in'),(248,1,1,'dev@100yea.rs','97.81.103.51',1392339877,'Logged in'),(249,1,1,'dev@100yea.rs','67.53.113.42',1392339893,'Logged in'),(250,1,1,'dev@100yea.rs','97.81.103.51',1392342075,'Field Group Created:&nbsp;Mission Markers'),(251,1,1,'dev@100yea.rs','97.81.103.51',1392343176,'Channel Created:&nbsp;&nbsp;Mission Markers'),(252,1,3,'trinh_mai','50.148.230.154',1392351328,'Logged in'),(253,1,4,'laura_hetzel','167.100.118.140',1392394012,'Logged in'),(254,1,4,'laura_hetzel','167.100.118.140',1392394259,'Logged in');
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
) ENGINE=MyISAM AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'markdown'),(4,1,'xhtml'),(5,2,'none'),(6,2,'br'),(7,2,'markdown'),(8,2,'xhtml'),(9,3,'none'),(10,3,'br'),(11,3,'markdown'),(12,3,'xhtml'),(13,4,'none'),(14,4,'br'),(15,4,'markdown'),(16,4,'xhtml'),(17,5,'none'),(18,5,'br'),(19,5,'markdown'),(20,5,'xhtml'),(21,6,'none'),(22,6,'br'),(23,6,'markdown'),(24,6,'xhtml'),(25,7,'none'),(26,7,'br'),(27,7,'markdown'),(28,7,'xhtml'),(29,8,'none'),(30,8,'br'),(31,8,'markdown'),(32,8,'xhtml'),(33,9,'none'),(34,9,'br'),(35,9,'markdown'),(36,9,'xhtml'),(309,78,'none'),(308,77,'xhtml'),(307,77,'markdown'),(306,77,'br'),(305,77,'none'),(304,76,'xhtml'),(303,76,'markdown'),(302,76,'br'),(301,76,'none'),(300,75,'xhtml'),(299,75,'markdown'),(298,75,'br'),(297,75,'none'),(296,74,'xhtml'),(295,74,'markdown'),(294,74,'br'),(293,74,'none'),(292,73,'xhtml'),(291,73,'markdown'),(290,73,'br'),(289,73,'none'),(288,72,'xhtml'),(287,72,'markdown'),(286,72,'br'),(285,72,'none'),(284,71,'xhtml'),(283,71,'markdown'),(282,71,'br'),(281,71,'none'),(280,70,'xhtml'),(279,70,'markdown'),(278,70,'br'),(69,18,'none'),(70,18,'br'),(71,18,'markdown'),(72,18,'xhtml'),(73,19,'none'),(74,19,'br'),(75,19,'markdown'),(76,19,'xhtml'),(77,20,'none'),(78,20,'br'),(79,20,'markdown'),(80,20,'xhtml'),(81,21,'none'),(82,21,'br'),(83,21,'markdown'),(84,21,'xhtml'),(191,48,'markdown'),(190,48,'br'),(189,48,'none'),(188,47,'xhtml'),(187,47,'markdown'),(186,47,'br'),(185,47,'none'),(93,24,'none'),(94,24,'br'),(95,24,'markdown'),(96,24,'xhtml'),(97,25,'none'),(98,25,'br'),(99,25,'markdown'),(100,25,'xhtml'),(101,26,'none'),(102,26,'br'),(103,26,'markdown'),(104,26,'xhtml'),(105,27,'none'),(106,27,'br'),(107,27,'markdown'),(108,27,'xhtml'),(109,28,'none'),(110,28,'br'),(111,28,'markdown'),(112,28,'xhtml'),(113,29,'none'),(114,29,'br'),(115,29,'markdown'),(116,29,'xhtml'),(117,30,'none'),(118,30,'br'),(119,30,'markdown'),(120,30,'xhtml'),(223,56,'markdown'),(222,56,'br'),(221,56,'none'),(183,46,'markdown'),(182,46,'br'),(181,46,'none'),(129,33,'none'),(130,33,'br'),(131,33,'markdown'),(132,33,'xhtml'),(133,34,'none'),(134,34,'br'),(135,34,'markdown'),(136,34,'xhtml'),(137,35,'none'),(138,35,'br'),(139,35,'markdown'),(140,35,'xhtml'),(141,36,'none'),(142,36,'br'),(143,36,'markdown'),(144,36,'xhtml'),(145,37,'none'),(146,37,'br'),(147,37,'markdown'),(148,37,'xhtml'),(149,38,'none'),(150,38,'br'),(151,38,'markdown'),(152,38,'xhtml'),(153,39,'none'),(154,39,'br'),(155,39,'markdown'),(156,39,'xhtml'),(157,40,'none'),(158,40,'br'),(159,40,'markdown'),(160,40,'xhtml'),(161,41,'none'),(162,41,'br'),(163,41,'markdown'),(164,41,'xhtml'),(165,42,'none'),(166,42,'br'),(167,42,'markdown'),(168,42,'xhtml'),(227,57,'markdown'),(226,57,'br'),(225,57,'none'),(224,56,'xhtml'),(173,44,'none'),(174,44,'br'),(175,44,'markdown'),(176,44,'xhtml'),(177,45,'none'),(178,45,'br'),(179,45,'markdown'),(180,45,'xhtml'),(184,46,'xhtml'),(192,48,'xhtml'),(193,49,'none'),(194,49,'br'),(195,49,'markdown'),(196,49,'xhtml'),(277,70,'none'),(276,69,'xhtml'),(275,69,'markdown'),(274,69,'br'),(273,69,'none'),(272,68,'xhtml'),(271,68,'markdown'),(270,68,'br'),(269,68,'none'),(268,67,'xhtml'),(267,67,'markdown'),(266,67,'br'),(265,67,'none'),(264,66,'xhtml'),(263,66,'markdown'),(262,66,'br'),(261,66,'none'),(260,65,'xhtml'),(259,65,'markdown'),(258,65,'br'),(257,65,'none'),(228,57,'xhtml'),(229,58,'none'),(230,58,'br'),(231,58,'markdown'),(232,58,'xhtml'),(233,59,'none'),(234,59,'br'),(235,59,'markdown'),(236,59,'xhtml'),(237,60,'none'),(238,60,'br'),(239,60,'markdown'),(240,60,'xhtml'),(241,61,'none'),(242,61,'br'),(243,61,'markdown'),(244,61,'xhtml'),(245,62,'none'),(246,62,'br'),(247,62,'markdown'),(248,62,'xhtml'),(249,63,'none'),(250,63,'br'),(251,63,'markdown'),(252,63,'xhtml'),(253,64,'none'),(254,64,'br'),(255,64,'markdown'),(256,64,'xhtml'),(310,78,'br'),(311,78,'markdown'),(312,78,'xhtml'),(313,79,'none'),(314,79,'br'),(315,79,'markdown'),(316,79,'xhtml'),(317,80,'none'),(318,80,'br'),(319,80,'markdown'),(320,80,'xhtml'),(321,81,'none'),(322,81,'br'),(323,81,'markdown'),(324,81,'xhtml');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Homepage Hero Slider'),(2,1,'Homepage Mission and Pictograms'),(3,1,'Homepage Map Items'),(11,1,'Press Release'),(5,1,'Blog'),(6,1,'Homepage Map Categories'),(7,1,'Homepage Bottom Carousel'),(8,1,'Programs'),(9,1,'Gallery'),(10,1,'Media Mention'),(12,1,'Mission Markers');
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
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'Clinton_Foundation_Logo.png',1,'/var/www/starkey/www/uploads/Clinton_Foundation_Logo.png','image/png','Clinton_Foundation_Logo.png',38236,NULL,NULL,NULL,1,1390196588,1,1390196588,'200 200'),(2,1,'TaniAustin.jpg',1,'/var/www/starkey/www/uploads/TaniAustin.jpg','image/jpeg','TaniAustin.jpg',69284,NULL,NULL,NULL,1,1390196612,1,1390196612,'914 1920'),(3,1,'HERO-Commitment_to_Action_Film.jpg',1,'/var/www/starkey/www/uploads/HERO-Commitment_to_Action_Film.jpg','image/jpeg','HERO-Commitment_to_Action_Film.jpg',776028,NULL,NULL,NULL,1,1390197274,1,1390197274,'863 1537'),(4,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',1,'/var/www/starkey/www/uploads/HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',593029,NULL,NULL,NULL,1,1390197738,1,1390197738,'901 1604'),(5,1,'CAROUSEL-Celebrity_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Celebrity_Film.jpg','image/jpeg','CAROUSEL-Celebrity_Film.jpg',475187,NULL,NULL,NULL,1,1390199154,1,1390199154,'932 1667'),(6,1,'CAROUSEL-Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Listen_Carefully.jpg','image/jpeg','CAROUSEL-Listen_Carefully.jpg',365844,NULL,NULL,NULL,1,1390199537,1,1390199537,'833 1484'),(7,1,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','image/jpeg','CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',670536,NULL,NULL,NULL,1,1390199867,1,1390199867,'943 1676'),(8,1,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_.jpg',472023,NULL,NULL,NULL,1,1390200146,1,1390200146,'909 1614'),(9,1,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_1.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',472023,NULL,NULL,NULL,1,1390200232,1,1390200232,'909 1614'),(10,1,'CAROUSEL-William_F._Austin_Legacy_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film.jpg',472023,NULL,NULL,NULL,1,1390200330,1,1390200332,'909 1614'),(11,1,'icon_now.png',1,'/var/www/starkey/www/uploads/icon_now.png','image/png','icon_now.png',3574,NULL,NULL,NULL,1,1390200625,1,1390200625,'56 56'),(12,1,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',497551,NULL,NULL,NULL,1,1390202028,1,1390202028,'520 936'),(13,1,'info_livesimpacted.jpg',1,'/var/www/starkey/www/uploads/info_livesimpacted.jpg','image/jpeg','info_livesimpacted.jpg',421949,NULL,NULL,NULL,1,1390202277,1,1390202277,'198 252'),(14,1,'info_livesindirectly.jpg',1,'/var/www/starkey/www/uploads/info_livesindirectly.jpg','image/jpeg','info_livesindirectly.jpg',419656,NULL,NULL,NULL,1,1390202291,1,1390202291,'198 252'),(15,1,'info_totalaids.jpg',1,'/var/www/starkey/www/uploads/info_totalaids.jpg','image/jpeg','info_totalaids.jpg',429588,NULL,NULL,NULL,1,1390202303,1,1390202303,'198 252'),(16,1,'Blog_Philippines_.jpg',1,'/var/www/starkey/www/uploads/Blog_Philippines_.jpg','image/jpeg','Blog_Philippines_.jpg',109435,NULL,NULL,NULL,1,1390202735,1,1390202735,'705 1024'),(17,1,'Dave_Fabry.jpg',1,'/var/www/starkey/www/uploads/Dave_Fabry.jpg','image/jpeg','Dave_Fabry.jpg',5586954,NULL,NULL,NULL,1,1390203283,1,1390203283,'3744 5616'),(18,1,'Blog_A_Knight.jpg',1,'/var/www/starkey/www/uploads/Blog_A_Knight.jpg','image/jpeg','Blog_A_Knight.jpg',489257,NULL,NULL,NULL,1,1390239202,1,1390239202,'1571 1992'),(19,1,'HERO-Vikings_Mission-IMG_6312.jpg',1,'/var/www/starkey/www/uploads/HERO-Vikings_Mission-IMG_6312.jpg','image/jpeg','HERO-Vikings_Mission-IMG_6312.jpg',416512,NULL,NULL,NULL,6,1391040192,6,1391040192,'496 936'),(20,1,'PeaceinWestBank.jpg',1,'/var/www/starkey/www/uploads/PeaceinWestBank.jpg','image/jpeg','PeaceinWestBank.jpg',121580,NULL,NULL,NULL,6,1391041006,6,1391041006,'680 1024'),(21,1,'September_Newsletter.jpg',1,'/var/www/starkey/www/uploads/September_Newsletter.jpg','image/jpeg','September_Newsletter.jpg',111923,NULL,NULL,NULL,6,1391064515,6,1391064515,'680 1024'),(22,1,'CAROUSEL-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Peru_Mission-02-DSC07062.jpg','image/jpeg','CAROUSEL-Peru_Mission-02-DSC07062.jpg',582871,NULL,NULL,NULL,6,1391123133,6,1391123133,'639 936'),(23,1,'westbank2.jpeg',1,'/var/www/starkey/www/uploads/westbank2.jpeg','image/jpeg','westbank2.jpeg',110244,NULL,NULL,NULL,6,1391199395,6,1391199395,'480 640'),(24,1,'special_olympics_mission.jpg',1,'/var/www/starkey/www/uploads/special_olympics_mission.jpg','image/jpeg','special_olympics_mission.jpg',20900,NULL,NULL,NULL,6,1391199945,6,1391199945,'220 330'),(25,1,'Screen_Shot_2014-01-31_at_12.29.23_PM.png',1,'/var/www/starkey/www/uploads/Screen_Shot_2014-01-31_at_12.29.23_PM.png','image/png','Screen_Shot_2014-01-31_at_12.29.23_PM.png',959232,NULL,NULL,NULL,6,1391200188,6,1391200193,'474 1440'),(26,1,'listencarefullygallery2.png',1,'/var/www/starkey/www/uploads/listencarefullygallery2.png','image/png','listencarefullygallery2.png',1155901,NULL,NULL,NULL,6,1391200463,6,1391200475,'476 1440'),(27,1,'COVER_pianoboy_cc.jpg',1,'/var/www/starkey/www/uploads/COVER_pianoboy_cc.jpg','image/jpeg','COVER_pianoboy_cc.jpg',8653599,NULL,NULL,NULL,6,1391213845,6,1391214146,'3283 5410'),(29,1,'_DSC0608cc.jpg',1,'/var/www/starkey/www/uploads/_DSC0608cc.jpg','image/jpeg','_DSC0608cc.jpg',3682161,NULL,NULL,NULL,6,1391215984,6,1391215984,'3083 4635'),(30,1,'marleemartin.jpeg',1,'/var/www/starkey/www/uploads/marleemartin.jpeg','image/jpeg','marleemartin.jpeg',24873,NULL,NULL,NULL,6,1391217284,6,1391217284,'327 320'),(31,1,'cnnlogo.png',1,'/var/www/starkey/www/uploads/cnnlogo.png','image/png','cnnlogo.png',20982,NULL,NULL,NULL,6,1391287531,6,1391287531,'225 300'),(32,1,'billaustin.jpg',1,'/var/www/starkey/www/uploads/billaustin.jpg','image/jpeg','billaustin.jpg',32328,NULL,NULL,NULL,6,1391287698,6,1391287698,'342 500'),(33,1,'CBSStarkey.jpg',1,'/var/www/starkey/www/uploads/CBSStarkey.jpg','image/jpeg','CBSStarkey.jpg',28201,NULL,NULL,NULL,6,1391288289,6,1391288289,'349 620'),(34,1,'cbslogo.png',1,'/var/www/starkey/www/uploads/cbslogo.png','image/png','cbslogo.png',3932,NULL,NULL,NULL,6,1391288322,6,1391288322,'300 300'),(35,1,'operationchange.jpg',1,'/var/www/starkey/www/uploads/operationchange.jpg','image/jpeg','operationchange.jpg',504146,NULL,NULL,NULL,6,1391489910,6,1391489910,'525 1600'),(36,1,'listencarefully.jpg',1,'/var/www/starkey/www/uploads/listencarefully.jpg','image/jpeg','listencarefully.jpg',405535,NULL,NULL,NULL,6,1391490035,6,1391490035,'525 1600'),(37,1,'listencarefully2.jpg',1,'/var/www/starkey/www/uploads/listencarefully2.jpg','image/jpeg','listencarefully2.jpg',598077,NULL,NULL,NULL,6,1391490094,6,1391490094,'525 1600'),(38,1,'listencarefully3.jpg',1,'/var/www/starkey/www/uploads/listencarefully3.jpg','image/jpeg','listencarefully3.jpg',631091,NULL,NULL,NULL,6,1391490133,6,1391490133,'525 1600'),(39,1,'hearnow1.jpg',1,'/var/www/starkey/www/uploads/hearnow1.jpg','image/jpeg','hearnow1.jpg',340204,NULL,NULL,NULL,6,1391490205,6,1391490205,'525 1600'),(40,1,'hearingaidrecycling.jpg',1,'/var/www/starkey/www/uploads/hearingaidrecycling.jpg','image/jpeg','hearingaidrecycling.jpg',257454,NULL,NULL,NULL,6,1391490240,6,1391490240,'525 1600'),(41,1,'icon_program.png',1,'/var/www/starkey/www/uploads/icon_program.png','image/png','icon_program.png',3594,NULL,NULL,NULL,6,1391538643,6,1391538643,'56 56'),(42,1,'icon_stories.png',1,'/var/www/starkey/www/uploads/icon_stories.png','image/png','icon_stories.png',3052,NULL,NULL,NULL,6,1391538677,6,1391548575,'56 56'),(43,1,'icon_video.png',1,'/var/www/starkey/www/uploads/icon_video.png','image/png','icon_video.png',2970,NULL,NULL,NULL,6,1391538708,6,1391538708,'56 56'),(44,1,'icon_gallery.png',1,'/var/www/starkey/www/uploads/icon_gallery.png','image/png','icon_gallery.png',2980,NULL,NULL,NULL,6,1391538788,6,1391538788,'56 56'),(45,1,'CAROUSEL-Tony_Hawk_Event.JPG',1,'/var/www/starkey/www/uploads/CAROUSEL-Tony_Hawk_Event.JPG','image/jpeg','CAROUSEL-Tony_Hawk_Event.JPG',131758,NULL,NULL,NULL,6,1391538876,6,1391538876,'480 640'),(46,1,'pdf_download_tes.pdf',2,'/var/www/starkey/www/uploads/files/pdf_download_tes.pdf','application/pdf','pdf_download_tes.pdf',8673,NULL,NULL,NULL,6,1391541790,6,1391541790,' '),(47,1,'PoweringInspiration_.jpg',1,'/var/www/starkey/www/uploads/PoweringInspiration_.jpg','image/jpeg','PoweringInspiration_.jpg',95744,NULL,NULL,NULL,6,1391542959,6,1391542959,'747 1024'),(48,1,'CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','image/jpeg','CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',600105,NULL,NULL,NULL,6,1391548021,6,1391548021,'947 1679'),(50,1,'CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','image/jpeg','CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',717312,NULL,NULL,NULL,6,1391548763,6,1391548925,'943 1680'),(52,1,'CAROUSEL-Building_a_Better_Kibera.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Building_a_Better_Kibera.jpg','image/jpeg','CAROUSEL-Building_a_Better_Kibera.jpg',775997,NULL,NULL,NULL,6,1391551245,6,1391551245,'908 1622'),(53,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg',1,'/var/www/starkey/www/uploads/HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg',550851,NULL,NULL,NULL,3,1392137672,3,1392137683,'600 1800'),(54,1,'MAP-Los-Angeles-Listen-Carefully.jpg',1,'/var/www/starkey/www/uploads/MAP-Los-Angeles-Listen-Carefully.jpg','image/jpeg','MAP-Los-Angeles-Listen-Carefully.jpg',144271,NULL,NULL,NULL,3,1392139207,3,1392139207,'378 410'),(55,1,'MAP-Vikings_Mission-IMG_6064.JPG',1,'/var/www/starkey/www/uploads/MAP-Vikings_Mission-IMG_6064.JPG','image/jpeg','MAP-Vikings_Mission-IMG_6064.JPG',161382,NULL,NULL,NULL,3,1392139634,3,1392139634,'378 410'),(56,1,'MAP-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/MAP-Peru_Mission-02-DSC07062.jpg','image/jpeg','MAP-Peru_Mission-02-DSC07062.jpg',222085,NULL,NULL,NULL,3,1392140188,3,1392140188,'378 410'),(57,1,'MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg',1,'/var/www/starkey/www/uploads/MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg','image/jpeg','MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg',145644,NULL,NULL,NULL,3,1392140382,3,1392140382,'378 410'),(58,1,'MAP-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/MAP-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','MAP-Where_We_Are_Now-India-DSC03269cc.jpg',199137,NULL,NULL,NULL,3,1392140852,3,1392140852,'378 410'),(59,1,'MAP-Providing_Clean_Water_in_Tanzania.jpg',1,'/var/www/starkey/www/uploads/MAP-Providing_Clean_Water_in_Tanzania.jpg','image/jpeg','MAP-Providing_Clean_Water_in_Tanzania.jpg',163338,NULL,NULL,NULL,3,1392141018,3,1392141018,'378 410'),(60,1,'MAP-Building_a_Better_Kibera.jpg',1,'/var/www/starkey/www/uploads/MAP-Building_a_Better_Kibera.jpg','image/jpeg','MAP-Building_a_Better_Kibera.jpg',177213,NULL,NULL,NULL,3,1392142611,3,1392142611,'378 410'),(61,1,'CAROUSEL-Celebrity_Film-thumb.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Celebrity_Film-thumb.jpg','image/jpeg','CAROUSEL-Celebrity_Film-thumb.jpg',500531,NULL,NULL,NULL,3,1392143118,3,1392143118,'876 1667'),(62,1,'CAROUSEL-Celebrity_Film-panel.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Celebrity_Film-panel.jpg','image/jpeg','CAROUSEL-Celebrity_Film-panel.jpg',453816,NULL,NULL,NULL,3,1392143132,3,1392148874,'778 1667'),(63,1,'CAROUSEL-West_Bank_Mission-IMG_5155.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-West_Bank_Mission-IMG_5155.jpg','image/jpeg','CAROUSEL-West_Bank_Mission-IMG_5155.jpg',519311,NULL,NULL,NULL,6,1392146646,6,1392146646,'624 936'),(64,1,'CAROUSEL-Philippines_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Philippines_Film.jpg','image/jpeg','CAROUSEL-Philippines_Film.jpg',986225,NULL,NULL,NULL,6,1392147834,6,1392147834,'915 1626'),(65,1,'CAROUSEL-Building_a_Better_Kibera1.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Building_a_Better_Kibera1.jpg','image/jpeg','CAROUSEL-Building_a_Better_Kibera1.jpg',775997,NULL,NULL,NULL,6,1392148360,6,1392148360,'908 1622'),(66,1,'BillandTani.jpg',1,'/var/www/starkey/www/uploads/BillandTani.jpg','image/jpeg','BillandTani.jpg',150743,NULL,NULL,NULL,6,1392148470,6,1392148470,'284 424'),(68,1,'CAROUSEL-Operation_Change-thumb.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Operation_Change-thumb.jpg','image/jpeg','CAROUSEL-Operation_Change-thumb.jpg',119071,NULL,NULL,NULL,3,1392148948,3,1392148948,'210 400'),(69,1,'CAROUSEL-Operation_Change-panel.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Operation_Change-panel.jpg','image/jpeg','CAROUSEL-Operation_Change-panel.jpg',395919,NULL,NULL,NULL,3,1392148978,3,1392148978,'560 1200'),(70,1,'BLOG-Volunteerism_in_Queretaro.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Volunteerism_in_Queretaro.jpg','image/jpeg','BLOG-Volunteerism_in_Queretaro.jpg',240333,NULL,NULL,NULL,3,1392151386,3,1392151386,'482 1102'),(71,1,'BLOG-Volunteerism_in_Queretaro-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Volunteerism_in_Queretaro-02.jpg','image/jpeg','BLOG-Volunteerism_in_Queretaro-02.jpg',168643,NULL,NULL,NULL,3,1392152156,3,1392152162,'322 1102'),(72,1,'SHF_2012Overview_NewsRelease_FINAL1.docx',2,'/var/www/starkey/www/uploads/files/SHF_2012Overview_NewsRelease_FINAL1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','SHF_2012Overview_NewsRelease_FINAL1.docx',184699,NULL,NULL,NULL,6,1392152482,6,1392152482,' '),(73,1,'BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg','image/jpeg','BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg',3936133,NULL,NULL,NULL,3,1392153484,3,1392153484,'1638 5616'),(74,1,'DSC08418cc_edit.jpg',1,'/var/www/starkey/www/uploads/images/DSC08418cc_edit.jpg','image/jpeg','DSC08418cc_edit.jpg',1451766,NULL,NULL,NULL,6,1392155115,6,1392155115,'789 1401'),(75,1,'DSC02337cc3Edit.jpeg',1,'/var/www/starkey/www/uploads/images/DSC02337cc3Edit.jpeg','image/jpeg','DSC02337cc3Edit.jpeg',6729308,NULL,NULL,NULL,6,1392156580,6,1392156580,'2450 3881'),(76,1,'ABClogo.jpg',1,'/var/www/starkey/www/uploads/images/ABClogo.jpg','image/jpeg','ABClogo.jpg',6758,NULL,NULL,NULL,6,1392157491,6,1392157491,'134 152'),(77,1,'ABC_tani_austin_sr_140121_16x9_608.jpg',1,'/var/www/starkey/www/uploads/images/ABC_tani_austin_sr_140121_16x9_608.jpg','image/jpeg','ABC_tani_austin_sr_140121_16x9_608.jpg',37018,NULL,NULL,NULL,6,1392157511,6,1392157511,'342 608'),(78,1,'DSC01454bb.jpg',1,'/var/www/starkey/www/uploads/images/DSC01454bb.jpg','image/jpeg','DSC01454bb.jpg',2828073,NULL,NULL,NULL,6,1392157576,6,1392322308,'3225 4694'),(79,1,'BLOG-AN_Unstoppable_Spirit_LEAD.jpg',1,'/var/www/starkey/www/uploads/images/Unstoppable_Spirit_LEAD.jpg','image/jpeg','Unstoppable_Spirit_LEAD.jpg',91290,'','','',4,1392222175,4,1392222861,'525 821'),(82,1,'BLOG-An_Unstoppable_Spirit_01.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-An_Unstoppable_Spirit_01.jpg','image/jpeg','BLOG-An_Unstoppable_Spirit_01.jpg',70851,NULL,NULL,NULL,4,1392223131,4,1392223131,'525 904'),(83,1,'BLOG-An_Unstoppable_Spirit_02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-An_Unstoppable_Spirit_02.jpg','image/jpeg','BLOG-An_Unstoppable_Spirit_02.jpg',128788,NULL,NULL,NULL,4,1392223145,4,1392223145,'525 1048'),(84,1,'BLOG-Unstoppable_Spirit_LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg','image/jpeg','BLOG-Unstoppable_Spirit_LEAD.jpg',185272,NULL,NULL,NULL,3,1392224175,3,1392224175,'377 821'),(85,1,'BLOG-Unstoppable_Spirit_LEAD-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Unstoppable_Spirit_LEAD-02.jpg','image/jpeg','BLOG-Unstoppable_Spirit_LEAD-02.jpg',283535,NULL,NULL,NULL,3,1392225896,3,1392225896,'525 1800'),(86,1,'LC-10-Sec-Video-01.png',1,'/var/www/starkey/www/uploads/images/LC-10-Sec-Video-01.png','image/png','LC-10-Sec-Video-01.png',517714,NULL,NULL,NULL,3,1392231681,3,1392231681,'380 1304'),(87,1,'LC-10-Sec-Video-02.png',1,'/var/www/starkey/www/uploads/images/LC-10-Sec-Video-02.png','image/png','LC-10-Sec-Video-02.png',349000,NULL,NULL,NULL,3,1392231774,3,1392231774,'383 1312'),(88,1,'Listen-Carefully-Loudness-Wars.pdf',2,'/var/www/starkey/www/uploads/files/Listen-Carefully-Loudness-Wars.pdf','application/pdf','Listen-Carefully-Loudness-Wars.pdf',254925,'','','',3,1392232516,3,1392232528,' '),(89,1,'HERO-Program-Operation_Change.png',1,'/var/www/starkey/www/uploads/images/HERO-Program-Operation_Change.png','image/png','HERO-Program-Operation_Change.png',905912,NULL,NULL,NULL,3,1392233125,3,1392233125,'525 1800'),(90,1,'OC-Partnerships-Change-Ray-Lewis.jpg',1,'/var/www/starkey/www/uploads/images/Operation-Change-Ray-Lewis-Film.jpg','image/jpeg','Operation-Change-Ray-Lewis-Film.jpg',213320,'','','',3,1392233633,3,1392333344,'353 639'),(91,1,'OC-Partnerships-Donna-Karan-Film.jpg',1,'/var/www/starkey/www/uploads/images/Operation-Change-Donna-Karan-Film.jpg','image/jpeg','Operation-Change-Donna-Karan-Film.jpg',293949,'','','',3,1392234023,3,1392333375,'354 638'),(92,1,'FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf',2,'/var/www/starkey/www/uploads/files/FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf','application/pdf','FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf',2197606,NULL,NULL,NULL,3,1392234275,3,1392234275,' '),(93,1,'FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf',2,'/var/www/starkey/www/uploads/files/FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf','application/pdf','FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf',2208358,NULL,NULL,NULL,3,1392234291,3,1392234291,' '),(94,1,'HERO-Hearing_Aid_Recycling.jpg',1,'/var/www/starkey/www/uploads/images/HERO-Hearing_Aid_Recycling.jpg','image/jpeg','HERO-Hearing_Aid_Recycling.jpg',256645,NULL,NULL,NULL,3,1392235274,3,1392235274,'525 1800'),(97,1,'test_upload.png',1,'/var/www/starkey/www/uploads/images/test_upload.png','image/png','test_upload.png',4444,NULL,NULL,NULL,1,1392260195,1,1392260206,'31 64'),(98,1,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg','image/jpeg','BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg',118866,NULL,NULL,NULL,4,1392317487,4,1392317487,'525 835'),(100,1,'BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg','image/jpeg','BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg',114258,NULL,NULL,NULL,4,1392322963,4,1392322963,'525 791'),(101,1,'BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg','image/jpeg','BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg',109107,NULL,NULL,NULL,4,1392327970,4,1392327970,'525 787'),(102,1,'MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png',1,'/var/www/starkey/www/uploads/images/MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png','image/png','MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png',682639,NULL,NULL,NULL,4,1392330247,4,1392330311,'525 939'),(103,1,'MEDIA-WCCO-LOGO.png',1,'/var/www/starkey/www/uploads/images/MEDIA-WCCO-LOGO.png','image/png','MEDIA-WCCO-LOGO.png',19415,NULL,NULL,NULL,4,1392331329,4,1392331329,'100 103'),(104,1,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',2,'/var/www/starkey/www/uploads/files/Screen_Shot_2014-02-12_at_8.59.27_PM.png','image/png','Screen_Shot_2014-02-12_at_8.59.27_PM.png',4444,NULL,NULL,NULL,1,1392335362,1,1392335362,'31 64'),(105,1,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',1,'/var/www/starkey/www/uploads/images/Screen_Shot_2014-02-12_at_8.59.27_PM.png','image/png','Screen_Shot_2014-02-12_at_8.59.27_PM.png',4444,NULL,NULL,NULL,1,1392335376,1,1392335392,'31 64'),(106,1,'BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg','image/jpeg','BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',181391,NULL,NULL,NULL,4,1392395737,4,1392395737,'525 844'),(107,1,'BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg','image/jpeg','BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',167004,NULL,NULL,NULL,4,1392395754,4,1392395754,'525 701'),(108,1,'BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg','image/jpeg','BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg',133038,NULL,NULL,NULL,4,1392395987,4,1392395987,'525 835'),(109,1,'BLOG-Impacting_a_life_in_Manila-LEAD.png',1,'/var/www/starkey/www/uploads/images/BLOG-Impacting_a_life_in_Manila-LEAD.png','image/png','BLOG-Impacting_a_life_in_Manila-LEAD.png',993106,NULL,NULL,NULL,4,1392397041,4,1392397041,'525 958');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
INSERT INTO `exp_freeform_params` VALUES (69,1392334770,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),(70,1392338680,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}');
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_grid_columns`
--

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;
INSERT INTO `exp_grid_columns` VALUES (1,4,'channel',0,'file','slot_1','slot_1','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(2,4,'channel',1,'file','slot_2','slot_2','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(3,4,'channel',2,'file','slot_3','slot_3','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(4,60,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(5,60,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(6,60,'channel',4,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(7,60,'channel',3,'text','Call to Action','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(8,61,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(9,61,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(10,61,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(11,61,'channel',4,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(12,61,'channel',3,'text','Call to Action','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(13,60,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(14,62,'channel',0,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(15,62,'channel',1,'text','Video','video','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(16,80,'channel',0,'text','Name','name','','n','n',50,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(17,80,'channel',1,'text','Abbreviation','abbreviation','','n','n',25,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(18,80,'channel',2,'text','Total Hearing Aids Provided','hearing_aids','','n','n',25,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
INSERT INTO `exp_layout_publish` VALUES (1,1,1,14,'a:2:{s:7:\"publish\";a:10:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:79;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:80;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:81;a:4:{s:7:\"visible\";s:4:\"true\";s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}');
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
INSERT INTO `exp_members` VALUES (1,1,'dev@100yea.rs','100YRS','a8a7b03cba67d17d2ab5be34c9079ba33d1a1cb6cb864a9aa5007ac25bd8b059d76a2f75350ac5f1bedcff3b71dd878f1be88dcfbdf5d3cab855dcf5187212a7','EkVtF:M>jnMhU/SMX(=q$*5gN28)NItXmg?K)|yJg7_H.Wi;4-`Ut<L1Wiu:dse}x;m/pqhGbh1aEGVlN2^%V{;=)FA6\'uOPR?mEDy5Nxu2Wax2v(knj(:eG>8BP\\\\,=','9f103e0f65ebdd0f0071291566aa0b4ec2c0ce3a','efa1131cff05bf5812eeffa169757ded10ce276e',NULL,'dev@100yea.rs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'10.11.0.1',1383699021,1392260206,1392346229,18,0,0,0,1392344021,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18','',NULL,'n',0,'y',0),(2,1,'taylor_joseph','Taylor Joseph','d20885cf421ceae1fa04b3a1a3992b8dc6c42ca802a1180d8b032923319c9fb433baa5efeadd919f690f34add079a66f87a270c782ffe4b738122ae382313d13','^.~=fwa3Cemv@z:=#BSGn+iU-sVH$k8L8_6k|S6~@_lCql3fjB86rE1!u&DF6-FTo:kn/.\\4,$8RgD<v/_`K7K\\/\\\'GMq@7EAMp\'bO%Z\'[r\\]lY){pRW2R[KBat%dTX;','0f194eb9cb74f4354d309168b2cf28f22b33035a','ff6cfdb53f105bf771eebde3464924b440931c4a',NULL,'Taylor_Joseph@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850428,1391552108,1391552108,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'trinh_mai','Trinh Mai','6e3879eac348edef0a99a006f8d275bbb444646390e359e348c6e357581c8003d5df6d7b14fa0ee3af88db8473e0722a8217db46faa41d984070611a6dd4ace3','}$`<N6_\"VYN@IGHzjDY7Rec1@hk\'ZWq5HCRMJoHFvfqljn3IOwnm!6+4r6M0*~]0H[o?$!dWhBWTzLr+lR2PE4ocCHKQxRj>UwvHU(\'(?APR&iXL\'|S<(\'_q~y2`\\hJ(','2a35c0eb5685fb2a80c82f6cf386813ccc5ebfec','7f16667d0fc7fa3c9cda673b2372442193108e2c',NULL,'Trinh_Mai@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850463,1392335557,1392357662,9,0,0,0,1392352994,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'laura_hetzel','Laura Hetzel','f31af15e4df9066600604e5241f9dcd4871ae789f67ade5d94d30ad98326beacd09e6a8fe61408c639d0ba0fd6bc65f63254b20342d50d9d052c5003a712c6bf','*q{*<U!9;t1[fdpy[8t4w]P<045n}5*\"hw]*,bZQo&zUoywdYSRT\\8z0KO5$mT\'Uj~u#2,Z&\"J]Xp5FCfJH3|LWFI7!}VyijN98},k40n7A*:?kK)fN)n(bTJ&r?H\\#c','968d5b7895b7e24e58be8e3575dd2d6c134fc476','332b1fb5073f09dbf7468e1a2b0d65bc8a56af92',NULL,'Laura_Hetzel@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850495,1392333453,1392399529,10,0,0,0,1392397111,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'randall_ward','Randall Ward','4ff34fe515b1476d91a1ab21fd22609af97f7c6c969320c18b49367dbd27c7ae9b227e2cee9ac01e4d8bfe00f3f9ee7b76383031c9eb10ede0ef177767f0d0e6','#$.Ln^2*0E}w#0pmZU\'JvCv\\:US04A5e#,_7?\'jQ/=z:\"`|EuoB6\"(L9QuOh/6nbtDrkeN7ST4O|\'zL[;+:!Mdl\\scJvO,t+?AN^}zyem@f(%W-@:?ph<xl%uVD{WDTE','0ea2c818353df42c5f031017b53739481035fb6a','0c30f8fcd22592abb65ce9399db9e0e0feede1bd',NULL,'Randall_Ward@starkeyhearingfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850564,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'julie@100yea.rs','Julie','2c1165ca027fa015339d532b45aac4472419a40f1cdcccac7db78ae4f7a7575c9b705301695a54265f2143ccd0aa1ea1e03d62f24f3a26bb50645b729a917ca9',']y\\X@r{`sR^Jh=#r#Q-9BW!}DD(yT6_x<$,\"N/xro:M`v}(:ui;TDePq!]_]dhx`~<.\\g_4x=^&\\:h}Xied@auH0\"g&KUTWDb\\hHM}@?Etk;E{,b6wHrh^B_m;G!bK|J','9444d23d017fe0fb04505a0d6c41e8ec9275578a','a86408905268b712456c93cc4b374b2293ab63a9',NULL,'julie@100yea.rs','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390865267,1392322066,1392341961,32,0,0,0,1392158695,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(7,5,'tulika_bose','Tulika Bose','b4326e7a34c0875c944e4c8f8fe242d78d1ba805a53b3307053ca5efa1430c2965207a465552c874f9d71875b3e829551d0cd65e741d5cd3ea37651f35fa8a86','I]$m=VBBlaB*+n\'`7,K1x?YhI,~t}qao0GN%^2_\'N@\'!\\DO\"Skmiu\'s{]:L)+g\"|&}JYyf1n:)t7{$w:jQzAl-Oi0.}\\9.]\\|Uq*8&y^>Bv\'dV3G;.i4hsjC]T:uA.ij','9ad103500d30fb95dede1cd734acfd2c566c34a6','f852d5c7028ebacdeed5f2442afad2d7cfc0da29',NULL,'Tulika_Bose@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(8,5,'megan_sheley','Megan Sheley','a8d94a9de0e8eaaeea268469640a73ba4d81930f6d4bfb5ca913861871a62fa9d89de6b08a1b7d4bb881519855e7ba4da3e16d41e3b7e7a8ba67e9ba99e4af7a','NQAOe2\"V<=~g}:~wBsF~B4Oy4$^NOj-CdW4+iRsoo-~2~6XE-@nBy0Ee4H7QW\\U^V.}AP3eX,~XO9J|z:g_*[xPhT(wzJ.YrMzRCdg6uus\"a]aAZt7YE\'3*+=6AY]G\\z','959e59ff8c8d14aec02135972b2757dbb5f08611','c134aecae31953d508b66a656cbe5632d6e77728',NULL,'Megan_Sheley@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975508,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0);
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
INSERT INTO `exp_message_folders` VALUES (1,'InBox','Sent','','','','','','','',''),(6,'InBox','Sent','','','','','','','',''),(3,'InBox','Sent','','','','','','','','');
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
INSERT INTO `exp_password_lockout` VALUES (10,1392249984,'67.53.113.42','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36','dev@100yea.rs');
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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
INSERT INTO `exp_relationships` VALUES (30,10,9,5,0,0,0,0),(23,42,16,5,0,0,0,0),(33,49,40,5,0,0,0,0),(25,59,16,5,0,0,0,0),(26,60,16,5,0,0,0,0),(29,61,40,5,0,0,0,0),(28,62,40,5,0,0,0,0),(35,63,40,5,0,0,0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=16100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (16099,1392399783,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','244f774c8e5e36ef45147e1377e8318084353eca',0),(16098,1392399782,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','7066dd0ba531eb9dc4c5869d63d34ca16211fd93',0),(16097,1392399770,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','1e057ffbae411f7b372b3f79ce881c1f9872e5cf',0),(16096,1392399770,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','549fd9f620ecac8817bf1080206f7404df237363',0),(16095,1392399769,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','8f13a16811da3922b632b9a1691154ecbb3da797',0),(16094,1392399741,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','e83defa06d002bbf28e39598ca977eb505215ff1',0),(16093,1392399740,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','13272edf23761df68a94d7ac8b6a2ddb26bb7620',0),(16092,1392399735,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','16615536ef443a05a59971e7bc24943e04591559',0),(16091,1392399734,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','92b8675c3ecc0c2f2329a86d0019e6bdbe9d1397',0),(16090,1392399731,'0','5fa98ae0f752d0d11a2d44bcc7685d7da5df85d3',0),(16089,1392399731,'0','6a9ebf6d19609d8b989f9a57fe7a9bc24bd8065b',0),(16088,1392399731,'0','398ccb9b5dcaff0b903417552d1593d672e74606',0),(16087,1392399729,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','2aedfd8af361f7bb0509c412b47d54624ff5f2e2',0),(16086,1392399728,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','ad4d1939e8dc9f38f994b8032d2c99682de02c60',0),(16085,1392399727,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','5b92aef7bdeb788b17875e2543f87beff6f50fef',0),(16084,1392399726,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','73bfb4808f6fae12b50a2a8eb06291d535c0ab3e',1),(16083,1392399697,'0','c0def95c903eeafe6638e6a81c813fe63a03c2dd',0),(16082,1392399697,'0','23c96fe223c9e277d50c01a5b7c5a1e17b400b1a',0),(16081,1392399697,'0','e70703a5c609c4993b96cd4b9216145316778608',0),(16080,1392399680,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','8b55559d3798b76d26df436c1807bdce560363be',0),(16079,1392399674,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','612d2a01cc73013b495cfa7947e52456382512a1',0),(16078,1392399674,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','c37a70981196b2e46705ac43427db4e0ad1729e8',0),(16077,1392399672,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','97eb4ffdef872301ff391e81054cb05e52ca26a9',0),(16076,1392399656,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','ec1c716b1c0eae71889050440d6921328cd04f4a',0),(16075,1392399652,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','a651c350b8e18e8b0678391594378842308d75a9',0),(16074,1392399651,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','d402ff856eb7ad2e4be66ef49a6b17de769dadf5',0),(16073,1392399651,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','e9a9126cb9ecb074db03db44e86453ce7131b41b',0),(16072,1392399649,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','fbbdf27f9af88aadcbeea8867a965ea6583dce10',0),(16071,1392399634,'0','72cb5b00573d0c13948e9e27c08593f5192801af',0),(16070,1392399631,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','19990b92a5e81429526586c150e4a37a4d4dc182',0),(16069,1392399630,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','f004e6484308d99020dc3d55194e05a7fff38a8e',0),(16068,1392399626,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','a838d888ce133024c42452a629f7e2e79b0c8fd4',1),(16067,1392399546,'d7a8464da565f30df7f6f57edf68c00ef8df69d9','bfa0324348d07f35f87f3bd3723f3beac249a0da',1),(16066,1392399529,'6df3dab428d6eee40a255e83198e92cde37356f1','d22967dfcd83be6ff3412c30393ea93975f9f7e0',0),(16065,1392399529,'6df3dab428d6eee40a255e83198e92cde37356f1','bd3a58ae785324e85d9fbd4a9640b5fc5f67ef75',0),(16064,1392397161,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','891e8fa6324368ffec40feb21a478b258e95576a',0),(16063,1392397138,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','a4b8b66836a8c551dc69ff56c3ab880ce6e4a927',0),(16062,1392397119,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','0db8dc2730023a273c3f872c085ce9077a7109cf',0),(16061,1392397111,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','1dbdb948b9cbde8ac75d2db26a0af02123970323',0),(16060,1392397111,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','3520e7fd573fe1f4a13fa847fa6bdd6c63909ce5',0),(16059,1392397107,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','37df8f5180a49f4e579f2a831864cfdfa6a67463',1),(16058,1392397044,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','d4a6021c8fabf165e6bf54fcca39ea0dcba8ce6d',1),(16057,1392397043,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','3bcc561faae2768b8be62f5fdf61e5f6376dc600',1),(16056,1392397043,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','8dc0f3d7d21cb9f15e06350eed7aa6d4a4a4a896',0),(16055,1392397041,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','13601a044bcc77469f4e7aec4e22c70f6af37a00',0),(16054,1392397029,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','c9e1dbef57d2f55ac4aa50574ab8ca9c72b5d97c',1),(16053,1392397027,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','5180bd9123e94f9dc3a6df429d3ffcab2641d736',1),(16052,1392396925,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','5986a9a28776da0488982f5447c5d1a566cd3643',0),(16051,1392396925,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','c23fb81482a98c733954d653573de95b97e36725',0),(16050,1392396925,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','3b4bc4548d9962db1e2cded7cccd388df423b1df',0),(16049,1392396924,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','e331d11c2f9f57c4308deb68c5d2ccbca54fbcf9',0),(16048,1392396923,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','8a37d66753a6c3cb205915810d8345c5aa9384cc',1),(16047,1392396915,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','55a3b75f4e2261c700291dd7efbf258f8407a74a',0),(16046,1392396914,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','abbe4713c213322f5a30633df31f5f7e1df00af4',0),(16045,1392396854,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','fc60a52e57be0c727f9ec2464ec83753b18784d8',0),(16044,1392396854,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','fc789fd0a49084a8a9b4c1395d8135d9237e45c5',0),(16043,1392396854,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','9afbe3b96013e28e51d9a110f5dec9d25c6c8865',0),(16042,1392396854,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','7fd5fd503501cbf9f452d0b0058ba896289d9beb',0),(16041,1392396853,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','379f05605219b8f712e15e8c0c653088e2763b54',1),(16040,1392396299,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','9ae0d9f359fd4b3bcaca1aabbf3bf5789b0f1265',0),(16039,1392396243,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','cd5d3b8ceafc4ce250d68a40f34a1ce832c77ba0',0),(16038,1392396237,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','75d33614c2681bc585bc3f1468f49bb0aa520f4a',0),(16037,1392396236,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','afbd8e84bdb995943192f86d9000bc17d012bd14',0),(16036,1392396223,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','fd86a0740a289494068fa410a8c6eede22b19996',0),(16035,1392396222,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','0d89de420c9069a5cc88eb0d30914734f537211b',0),(16034,1392396065,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','cbe0fd9aebbd2e5099e3aa2acb820ec05410b243',1),(16033,1392395988,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','d90160bd2a2f77377153cbdbc94322e9ccd106cc',0),(16032,1392395988,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','baefbbc17195296bd6f15025d65ecb72ec95436e',1),(16031,1392395987,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','bcd031fca0a932b1f80904406b538ce1a1bc9d1a',0),(16030,1392395981,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','65e92120a56fdf90936cfe71cc430a854e50dbb5',1),(16029,1392395980,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','bf975de5ea7515018a1f724c8c044f04514879c5',0),(16028,1392395930,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','a48ac32bfeb941b509c44ce31edb085fb75fdfc9',0),(16027,1392395915,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','45f6b74f4851c0d88b9396b3a0b95b07c38a2d00',0),(16026,1392395915,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','0455929029e4779b11b0d7f8fd507e9ed96639a4',1),(16025,1392395913,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','f3da8106a9d090d835bf2caab77bcb644b1f5554',1),(16024,1392395797,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','6d92752779842fd607a4bcb1f4791f960efd3c67',0),(16023,1392395797,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','87f34891fe3be27008800d0cdd047b465bac5fe4',0),(16022,1392395796,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','0a2c477283c293eef1b6a835ca8af16389b8c3ab',0),(16021,1392395796,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','f4ae6a4d0cbee1fff229454eda367b739a127a79',0),(16020,1392395795,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','1cf7c5682272d76f97aed2c8618db0488f6738c7',1),(16019,1392395777,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','f17025730a595641f8d59acb47fbb2d912e35036',0),(16018,1392395777,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','ef925b99c53b103e9c3f38dcd3a97702b0c3fee7',0),(16017,1392395755,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','6e4dff03df5238f417482d5a9e2fa4dfb3ce1a8c',0),(16016,1392395755,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','7e7d883dfb8cfa51140e1a3f11c4d98b4e44e91d',1),(16015,1392395754,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','e7c8e36b3827eee6587c75f2319292a2d178f0e4',0),(16014,1392395747,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','830b6633b96b4533714316d6912c0c27dd97b80f',1),(16013,1392395746,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','102b104ada56fbc80671940f788b142e479817bf',1),(16012,1392395740,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','700399babab676fa1f30a034bd720949dc130601',0),(16011,1392395740,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','fc1bb4ae0b881d590945818a12998b1ce5fdcc3c',1),(16010,1392395737,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','b1f92645852f087848ed638c73cdee23767cb0c4',0),(16009,1392395721,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','094d34ca1425b47526a08154b75879846428ec09',1),(16008,1392395712,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','e58aa52a24c49d367413af993dbc9240878e341b',1),(16007,1392395662,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','031b42f1ec9ce66549a7fce6670940e596b92c9e',0),(16006,1392395662,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','8ea09d914cddb3478411c8ee60e271418bbbb3c4',0),(16005,1392395661,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','9302e6472138e5ca8e3752a81ebaae08967b81c2',0),(16004,1392395660,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','0ccc0ff4f77fb6f54a1212556d1caa4812701677',0),(16003,1392395656,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','ecd93980067483ac00716fbd335b02cb097857d4',1),(16002,1392395368,'6df3dab428d6eee40a255e83198e92cde37356f1','bc5647f1032e86c78c32e5a0d8d31797c5f3a9ff',0),(16001,1392395368,'6df3dab428d6eee40a255e83198e92cde37356f1','fc5521f66700d388f51a87da17952d2a8b8b355e',0),(16000,1392395361,'6df3dab428d6eee40a255e83198e92cde37356f1','d0d1d4ce00d82baa462ab791392fc6624e8a0220',0),(15999,1392394753,'6df3dab428d6eee40a255e83198e92cde37356f1','0a61e2b73c87327e10cd9bf510e7997222d1aedb',0),(15998,1392394753,'6df3dab428d6eee40a255e83198e92cde37356f1','1c61fc5ff798608f8273fd1ad07972e1990f4be6',0),(15997,1392394737,'6df3dab428d6eee40a255e83198e92cde37356f1','1389a1d8e54fc48e374f6c0262a15241fe4432cc',0),(15996,1392394736,'6df3dab428d6eee40a255e83198e92cde37356f1','d22c457aa7ae874702d5b82c9e3e28396e6c3e5f',0),(15995,1392394386,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','29ce6ea9b292674887d33bb0c1e0cc1a0dd82d57',0),(15994,1392394259,'aa97232f427ca68d8baa5660b42fd4a484b5b11c','b31aaa3a1c515fd2c25872635dc588e9605a6d73',0),(15993,1392394259,'0','69017eb77812c9b8bfceefde32cbe5a603fe487f',0),(15992,1392394225,'0','077958ab4fff1c50cd44b5815162df39a8259001',1),(15991,1392394225,'0','ca2e61a551681886b8672dfaa37c2931e085b073',0),(15990,1392394197,'0','2a30977c778dd18f4b52a5c613a367f785d4684c',1),(15989,1392394196,'0','2870e6f3ea8f6170383013be6874bdad083e76fc',0),(15988,1392394126,'0','15cbd8f0d8ba2e9b5da2e28ea7a7c7b7f087a7fd',1),(15987,1392394126,'0','253ee6162f6b2d55b616d2cfb5aee8defe14c1ac',0),(15986,1392394099,'0','80dc8127130c3d6cea841023a56e5cc06443f54c',1),(15985,1392394099,'0','1e5ad5da9865d42141522b1722686c6bf5fb39e4',0),(15984,1392394032,'0','18f360e7c1c9def1f725d8df7d7cd57f3a119fc9',1),(15983,1392394032,'0','7db798767ed9c8293dc1e61c5ba966af21233ba1',0),(15982,1392394012,'6df3dab428d6eee40a255e83198e92cde37356f1','88994e584229890cc49fdb8b0c5ebb15007dec33',0),(15981,1392394012,'0','f05ea4280c7e6d254647cfab7e5fbaf4ddd34965',0),(15980,1392394001,'0','8930026d62be3bd0ead984e388463ebe8fbade25',0),(15979,1392394000,'0','146fb5ee2dc6b7315aa2ba58b5925268dd37ab03',1),(15978,1392394000,'0','358a55fc069a71d54bcfd6b7ec2232802ec98901',0),(15977,1392394000,'0','53ee37db0bdc60190d7e386e02ea9e431b418d94',0),(15976,1392393984,'0','371dd91f8f1be648c2ae2f7a5297e2b192da38c9',0),(15975,1392393979,'0','2550654568ac34749583a1848a410adb5e2896e6',0),(15974,1392393979,'0','2c6a6fc63a24c89e05fcc00898e46e42e1516f60',0),(15973,1392393978,'0','953720bf761c13ccd62894ddb0c278d75a65ab00',0),(15972,1392393973,'0','4f3e5bd39d13d42e7bbcd21598b616583581d812',1),(15971,1392393973,'0','ff115c8ce596f775329d11ed4564cd357e3f5066',0),(15970,1392393973,'0','3b1963d405784c242666a0ccd033e68749c1ad1a',0),(15969,1392393950,'0','a4c8f2d1c263ef835c96e6ea3e1b916134fa4874',0),(15968,1392393950,'0','90b051d60e314dc692d0516a3833778149418b04',0),(15967,1392393947,'0','59607b46655f2431424369038445d31bf18919b4',0),(15966,1392357686,'0','f5e8c64b88882cecddb47ba804200762f2f4c060',0),(15965,1392357684,'9e172ad039774a9eaab74718debe334aea8ec796','921d2fdd0d2c13924d2e9b0d7ad3dd1575246a74',0),(15964,1392357670,'9e172ad039774a9eaab74718debe334aea8ec796','a553f0bbdcca406e166f9671eb61fc088eaebd87',0),(15963,1392357670,'9e172ad039774a9eaab74718debe334aea8ec796','a9706565f6a39d647eb44c2ffa5de818952a0c1e',0),(15962,1392357670,'9e172ad039774a9eaab74718debe334aea8ec796','727c605b5343fd928c19100eeb0b4a6db3f74929',0),(15961,1392357666,'9e172ad039774a9eaab74718debe334aea8ec796','310b09cd7d77e2b7355f0fd09d241e66edb16821',0),(15960,1392357666,'9e172ad039774a9eaab74718debe334aea8ec796','87aecb9e27c8e3fdd59e2f58e79cd7e7b2a1d333',0),(15959,1392357662,'9e172ad039774a9eaab74718debe334aea8ec796','25da7eb9ba299621db90843223ee62394352f615',0),(15958,1392357662,'9e172ad039774a9eaab74718debe334aea8ec796','13d9454fccf90bc3ed470b346ba5c7b2615481bf',0),(15957,1392357662,'9e172ad039774a9eaab74718debe334aea8ec796','7970a2794f45780aae1a9321c8d8739e4cf18d77',0),(15956,1392357407,'9e172ad039774a9eaab74718debe334aea8ec796','179432fe77b49901e933d76b185fce0ee1cf45fc',0),(15955,1392357406,'9e172ad039774a9eaab74718debe334aea8ec796','7da8b7ea109470bab2b2e0d4aa48633ed0c7d560',0),(15954,1392357367,'0','fbfd70929435732170d8c90c2b3e9ee63c57112f',0),(15953,1392357367,'0','08afe6dfe65fb3f67d4646ac5529907625cc9f34',0),(15952,1392357364,'0','831808a7627b8f950665c361bf5d4ea4e2e51e47',0),(15951,1392357363,'0','0da1df26e19d6853230cbbbc5fca1cb40c8849d7',0),(15950,1392357312,'9e172ad039774a9eaab74718debe334aea8ec796','ea48e2b5b46e25a83c2dc87666352c69b0d6ca00',0),(15949,1392357311,'9e172ad039774a9eaab74718debe334aea8ec796','511e801c161f5964f820a8358c742ffee79ac93e',0),(15948,1392357311,'9e172ad039774a9eaab74718debe334aea8ec796','37e71018835708dbedc0d20b1e360018f06e4619',0),(15947,1392357311,'9e172ad039774a9eaab74718debe334aea8ec796','fc18b92f664b3a40e1da6e783662524d94f2f3e5',0),(15946,1392357309,'9e172ad039774a9eaab74718debe334aea8ec796','1e19212a56a422c2984cf1ff37604a5150d0c489',0),(15945,1392357263,'9e172ad039774a9eaab74718debe334aea8ec796','d9e7fc8cfc115bd1f2e790c4c73190ac83a49cd9',0),(15944,1392357263,'9e172ad039774a9eaab74718debe334aea8ec796','436fd455617c945f7a4c29c8e4d8a875c722df2f',0),(15943,1392357263,'9e172ad039774a9eaab74718debe334aea8ec796','527e9694c5c515daaa40fea13154d8cdb1f50317',0),(15942,1392357259,'9e172ad039774a9eaab74718debe334aea8ec796','70bbe92882010f5e64e246282379cd78a666a155',0),(15941,1392357257,'9e172ad039774a9eaab74718debe334aea8ec796','a9463b0e6f6640a15522dca8b560f209fe801586',0),(15940,1392357244,'9e172ad039774a9eaab74718debe334aea8ec796','165ef54511e114e4111963811e5271e10799f1a5',0),(15939,1392357244,'9e172ad039774a9eaab74718debe334aea8ec796','a7cc8b796da29ea58e8b37d5a51aedfb7db5e25e',0),(15938,1392357244,'9e172ad039774a9eaab74718debe334aea8ec796','84a3e9b1dd6e78281b45668742451e948253cff1',0),(15937,1392357233,'9e172ad039774a9eaab74718debe334aea8ec796','1274e0f06d260116725059b495eaa62a4fe985b3',0),(15936,1392357232,'9e172ad039774a9eaab74718debe334aea8ec796','1fb3afda11cfd4c7c41c267376851d67f3b0aac0',0),(15935,1392356986,'9e172ad039774a9eaab74718debe334aea8ec796','fe87402ed6fa0be5834f0a1291a5ce00581377a2',0),(15934,1392356986,'9e172ad039774a9eaab74718debe334aea8ec796','9589234cf72f1a6a22866912d11af1372bfef3e5',0),(15933,1392356985,'9e172ad039774a9eaab74718debe334aea8ec796','03587d90f6270b657fe092c8b6a1aa8040af249e',0),(15932,1392356921,'9e172ad039774a9eaab74718debe334aea8ec796','64b33a768c1071f77eb6b9101dd3664542c348f7',0),(15931,1392356921,'9e172ad039774a9eaab74718debe334aea8ec796','6cfdeb5bed60872caa9c6f394c3d77a23e715876',0),(15930,1392356911,'9e172ad039774a9eaab74718debe334aea8ec796','6654b8d30e8d599c3bd55fb07e6edfd08d9d8561',0),(15929,1392356911,'9e172ad039774a9eaab74718debe334aea8ec796','8ee91930c24f24c34e601a0bee4d02906f691a48',0),(15928,1392356911,'9e172ad039774a9eaab74718debe334aea8ec796','221e53b7322b7fe95285a498f8613ff0b76b08aa',0),(15927,1392356909,'9e172ad039774a9eaab74718debe334aea8ec796','d9144602423faac9216b8a852f9fc3671f00a0c8',0),(15926,1392356909,'9e172ad039774a9eaab74718debe334aea8ec796','b3ddce829e31df979c33bc63c3f37e1c94c343dd',0),(15925,1392356909,'9e172ad039774a9eaab74718debe334aea8ec796','4dac23ee2b961e3bda7af19334d4693670378479',0),(15924,1392356908,'9e172ad039774a9eaab74718debe334aea8ec796','c337680a1f86763aba6fa16db3429aae684b7f9a',0),(15923,1392356905,'9e172ad039774a9eaab74718debe334aea8ec796','0bcb7b6f0acdaad7e80e591f638c6ba3b86a9820',0),(15922,1392356905,'9e172ad039774a9eaab74718debe334aea8ec796','f86a03a6b4ba22da40393f87e31ce62d8a6b5e51',0),(15921,1392356905,'9e172ad039774a9eaab74718debe334aea8ec796','a078816cfe23ee7273c7295fa5c194dd36d71ac2',0),(15920,1392356905,'9e172ad039774a9eaab74718debe334aea8ec796','4705b667716af77463676840a737a16dd10f1c5d',0),(15919,1392356905,'9e172ad039774a9eaab74718debe334aea8ec796','76a2d28cb5af89cf00aa5ac439f8c1a551c58214',0),(15918,1392356905,'9e172ad039774a9eaab74718debe334aea8ec796','505536c7b38efd5f6acb6cb87f877a31efac8391',0),(15917,1392356903,'9e172ad039774a9eaab74718debe334aea8ec796','cc8a12e037e2d636854bccae8c5f41953b029682',0),(15916,1392356848,'9e172ad039774a9eaab74718debe334aea8ec796','65a6b9f6f149cd29f12e32b5556805ba19753d3e',0),(15915,1392356848,'9e172ad039774a9eaab74718debe334aea8ec796','d4b96b6aef24c037354dbabd30ae7888f5a40180',0),(15914,1392356847,'9e172ad039774a9eaab74718debe334aea8ec796','2db13f98de1d97efd96301fcc3cfc32d365d9061',0),(15913,1392356842,'9e172ad039774a9eaab74718debe334aea8ec796','114c8c611e97efba7010076a681a2a0351acf300',0),(15912,1392356842,'9e172ad039774a9eaab74718debe334aea8ec796','bb7525e9a12cc22a034e8b9032406667969f0d34',0),(15911,1392355553,'9e172ad039774a9eaab74718debe334aea8ec796','8793a4c4e476cb11ad87332f9111dc550071d037',0),(15910,1392355553,'9e172ad039774a9eaab74718debe334aea8ec796','dd635efea61098c9803190761287cb94439bb1d0',0),(15909,1392355552,'9e172ad039774a9eaab74718debe334aea8ec796','aa4faa3cbfb3ad10fd87b6eab643e3cc4afb9900',0),(15908,1392355552,'9e172ad039774a9eaab74718debe334aea8ec796','7e393cc4e563230d2c9352a6b37ffa16a9c951ab',1),(15907,1392355549,'9e172ad039774a9eaab74718debe334aea8ec796','7183e7a465f2974364e23730cc9771e2e8e078f4',0),(15906,1392355541,'9e172ad039774a9eaab74718debe334aea8ec796','f4b76ab08a912986996fa00edf2ace993360f17c',0),(15905,1392355536,'9e172ad039774a9eaab74718debe334aea8ec796','ace4170526ae6e094992e958ee67237b19ca1c34',0),(15904,1392355536,'9e172ad039774a9eaab74718debe334aea8ec796','b68844bd351c63d48343d7e52964d94785178d79',0),(15903,1392355535,'9e172ad039774a9eaab74718debe334aea8ec796','e91f2ec3ee0fc39c673537789d7290f22a585768',0),(15902,1392355535,'9e172ad039774a9eaab74718debe334aea8ec796','3ac2d195fe00fb10d092ae60fd2c782aa489bb56',0),(15901,1392355199,'9e172ad039774a9eaab74718debe334aea8ec796','80b880dbdd2ae7e3a3e859eda87b8958e915f045',0),(15900,1392355199,'9e172ad039774a9eaab74718debe334aea8ec796','8d4f3a14d9b73c30a80f5824f3bd6cd9cca4e776',0),(15899,1392355198,'9e172ad039774a9eaab74718debe334aea8ec796','9ade99e504792bd194c459904342372590c506f5',0),(15898,1392355198,'9e172ad039774a9eaab74718debe334aea8ec796','332a2129675ce46c5399577b6d08cb3266de2def',0),(15897,1392354679,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','f862a95022a2249a9e90a6a4b6ceb9e203ce2f75',0),(15896,1392354631,'0','30980360b02eda4f15bc7be7ef1ee786b8d36051',0),(15895,1392354630,'0','3f4152f2920854fcffeed0438d1e9b52b40f5f2e',0),(15894,1392354629,'0','cfa721be257719115581676a51a572c024e0115f',0),(15893,1392354503,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','71ab67d68a05490c7eda6a29db9fc66b37990a51',0),(15892,1392354503,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','12d018cf2d90b5d5d56bdc4f2ab4088001a0c74d',0),(15891,1392354501,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','3f836595a68dbb2d774da3dc00e82736f1bb9918',0),(15890,1392354429,'0','89e9955b9c3a408114327af2ac63f0803f7a0c54',0),(15889,1392354428,'0','9d5dd606cc42b5c8ad671e97c1f2416a61b6f0d8',0),(15888,1392354391,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','cc49693b66173e457d221fffec02e3efd2a9c2e0',0),(15887,1392354391,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','3a0b0b2dd54bfe85652f7e7b6c7fdbf301a2bc7a',0),(15886,1392353961,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','c5f7760e0ec70379ccec97ba90eb56135a0f5f5a',0),(15885,1392353961,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','cbd065dddeb4cfd591bd6913132ca36a7d92905d',0),(15884,1392353960,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','9181e64a66081660ec4e5aeb2ce53caab3857515',0),(15883,1392353959,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','d775e260c36f00267316ba8c19e0747178945b26',0),(15882,1392353952,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','c382a5a5d1861454ce5848eb73a272644abad077',0),(15881,1392353951,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','8456bade21fb01f9ac443f33f9adcd0e2020cc37',0),(15880,1392353950,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','0624235c58e1905e4258ecd2564125c5dbd4641b',0),(15879,1392353950,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','2f1537034595029423952a1293139ddb02078fdf',0),(15878,1392353950,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','610704ad993a11d491c250eeca7c6c57397cf9b7',0),(15877,1392353873,'0','95b0f5549910686c418842e98aa4dd4527c54e0d',0),(15876,1392353855,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','a1e19f87b7d2fd1cd6fa9ac435d38b8e45e4c495',0),(15875,1392353741,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','3bfb78bfcffa56070026f252aaa6cae7ad4f1b6b',0),(15874,1392353740,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','d3decfb7c5c968e36ddfcf894eb1538308be0038',0),(15873,1392353723,'0','c4888f315979fb98e18187f323db95198f59c5aa',0),(15872,1392353722,'0','e7d7dbdc259ced10d906642955132b054d40141b',0),(15871,1392353242,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','b926e0b446619eb02c5c232e5f67bb65e1644891',0),(15870,1392353236,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','2618ef592e9f33fca933f060eb52a7231c5b0ba6',0),(15869,1392353219,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','f27183f997c98be8b49807364d0c872c913bddb0',0),(15868,1392353210,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','ebce300181c3631045f26ad96743043a0d58a85b',0),(15867,1392353189,'0','591af13472fa728523b1d4fda462e96abd1d99f9',0),(15866,1392353188,'0','a9f6f38647513e32ce949d97d75ab10c7a83bc38',0),(15865,1392353178,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','04dc23db8850605b61e28591b2245828ecee73ff',0),(15864,1392353177,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','ff11ad74b6c94a144c5fa485ad3f3f042a2ba7e4',0),(15863,1392353085,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','82fc9231648d186cc8b7b5394f0d2ab6d6e6ade4',0),(15862,1392353085,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','43d55ba7adbc3de3b84d8b9f68b9c59e38532d54',0),(15861,1392353076,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','65aa81d37382ca76db26950b22fa34bb13a7893c',0),(15860,1392353017,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','591715073deefccb5ea4c11470278bd422a324ca',0),(15859,1392353016,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','7397e82011a3c208b5b7a490eb3f086a5a52c36b',0),(15858,1392353014,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','cebc85b3ce45e351bff096a6fd6375281ba85b52',1),(15857,1392353002,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','60df94c4723bfde3e9770ffa361b75c34504390e',1),(15856,1392352994,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','c61126bbccfe16af83b6f6556d2506b19fd8b8f7',0),(15855,1392352994,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','fd47958dbda7d77d3b38bc94917e0385c2b24b64',0),(15854,1392352987,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','9b746b6c47865ffbe1cbb306c5cabe3c4d9b64b2',0),(15853,1392352987,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','0be2a429cd00b5b3f89cdc2aca2d7b75f8e711fe',0),(15852,1392352986,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','361191f1dd6508488a7e2350f3c407cdb4cd59c9',0),(15851,1392352986,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','0183e513c7120d970c9d32edd6a9757f4055e3a5',1),(15850,1392352975,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','306d1682e1b363a6f9af5ded39c25b59c53c33d1',0),(15849,1392352954,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','389864ef9cad943c0b72589b126b9936fc7d1390',0),(15848,1392352950,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','765caaa063294be60078b4a368293ea4b96faed6',0),(15847,1392352827,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','ecdf261236969d78814f26e741abada1744b288d',0),(15846,1392352685,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','8b1c3c1afa128f8b198a4868405b3a726f1da65b',0),(15845,1392352685,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','8300a8709e23e3a6445a1f859b776946763c0df8',0),(15844,1392352685,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','b662c06c544bb6199ca3afae86d8dcbbc87863bc',0),(15843,1392352684,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','7d609f1d2a2c41a41aeee8064b7d6da769da5324',0),(15842,1392352684,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','3a02e14e75b2ecdf1205aaa866094e914d8ce679',0),(15841,1392352684,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','e9d8829a9a6e08876e74f2003adc13f770b5f10c',0),(15840,1392352684,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','1102541e139e918bb183dc68f1863c669baaa199',0),(15839,1392352534,'0','4b1f373a0e5e40ff9f3de9ce8dddb157a1d493d8',0),(15838,1392352534,'0','798a6066e52c1fed0e9980e6ad4bfb70fda339b7',0),(15837,1392352521,'0','3b7926da13eba8b417dfe8bb319c86acbb1efa67',0),(15836,1392351980,'0','ed9a43107d4363243416f67246975cbc8d25703e',0),(15835,1392351979,'0','baacd31eabb1b6cb4ce1587213caa290333bc7fc',0),(15834,1392351786,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','361763f848473e81000f7aa60cef6d5a3f1a4628',0),(15833,1392351785,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','ba0bbf333108fd0b3990ef7507abdcdc08ec2714',0),(15832,1392351785,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','235bfdd43099829211e6df39c69ea85b222d3654',0),(15831,1392351784,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','25ea089add43c513675d1ad2b2478004f12f9e51',0),(15830,1392351781,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','67dffb1cf75458606dbb63c20a3c3616be124c13',0),(15829,1392351764,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','b01a2ee3dab69170bf46dd3beca5f4d537301ba2',0),(15828,1392351590,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','7fd4cbea987309d516513bffd436744d2830b2b6',0),(15827,1392351574,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','c35e21210bbaebfeb619af97bda7cc8fe3efa561',0),(15826,1392351455,'0','abfea083be3b43e5e7714b21fe61b7cc400ef799',0),(15825,1392351455,'0','8a628b7b72a277c06b27f1292060789da67f6ec4',0),(15824,1392351446,'0','ce28de38880be418c13c6f990657b38548a13cc3',0),(15823,1392351446,'0','06894d409ee4abad129c29ca69e17216ff0dc2cf',0),(15822,1392351442,'0','06ae2c984a62ecd7fd35e1c2937853754bd3d7a4',0),(15821,1392351440,'0','6f232af9ad6a2afe148e406e45df0588ef3bcc0f',0),(15820,1392351440,'0','6ddefaccbdcdbe68e8a3a3a27cfa4e7bb247ceec',0),(15819,1392351336,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','06140464defafbf87e3370137e95a66624b97635',0),(15818,1392351336,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','37a1792a4c6d54021d4ac03901e8020514625395',0),(15817,1392351333,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','8a02c94169c6abdd8a13cccc4a79d0369da32d72',0),(15816,1392351330,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','b805db0f945be4b0293741f7f3bcff5f6ca383d3',0),(15815,1392351328,'3304ba88c9e13c1a6cd6ce7c4afa124d2ddfc578','a3a20cfffee68505c5b49c8fb540fac12272182a',0),(15814,1392351328,'0','e8f028189aab297cd55d21b11b0896d11ea038cd',0),(15813,1392351317,'0','12785ca6a1d91e989a19cf4712d40ee7ce4ee3e8',0),(15812,1392351316,'0','d017812c61434b00236764308821137b814680c4',1),(15811,1392346339,'278717017eb0e46cf928cb3a20e477db894d17c7','ee2a194dee434da3fc20e5171125cf354622bbb2',0),(15810,1392346338,'278717017eb0e46cf928cb3a20e477db894d17c7','c19bb8d874915d8e3dd6f36113e2ff0d69fef956',0),(15809,1392346337,'278717017eb0e46cf928cb3a20e477db894d17c7','5e63735dee0cdafe1eb324e33f79d6e674924493',0),(15808,1392346337,'278717017eb0e46cf928cb3a20e477db894d17c7','0581fb944e199262841ead967490f2d2956354f2',0),(15807,1392346336,'278717017eb0e46cf928cb3a20e477db894d17c7','e65ff6f370d943046d0d8d8726727627ba0813f9',0),(15806,1392346334,'278717017eb0e46cf928cb3a20e477db894d17c7','78a3c96638bc5b922f0da06911ab54cf58c3efcc',0),(15805,1392346332,'278717017eb0e46cf928cb3a20e477db894d17c7','bf7082579e5125bebdf446d90d64fa9d069aa32c',0),(15804,1392346327,'278717017eb0e46cf928cb3a20e477db894d17c7','fed3da413cb81cbbfd3eb4d085c5e6deaf8af977',0),(15803,1392346292,'278717017eb0e46cf928cb3a20e477db894d17c7','5ef4fe9924c6dfed328965b12a3bc15df68c4395',0),(15802,1392346291,'278717017eb0e46cf928cb3a20e477db894d17c7','97ece2965640c85ab8351b31a85227250c85ebd9',0),(15801,1392346255,'278717017eb0e46cf928cb3a20e477db894d17c7','2ccbf0e8a8e81749125baca20ab16c139a563480',0),(15800,1392346232,'278717017eb0e46cf928cb3a20e477db894d17c7','4ea05be3df7d23dd17f02181806686f05ba0f439',0),(15799,1392346229,'278717017eb0e46cf928cb3a20e477db894d17c7','b3ffa9adcf92821c4c52873eaaece02228531c91',0),(15798,1392345697,'278717017eb0e46cf928cb3a20e477db894d17c7','8aa674d0b76d0dabe06c750b1a9ad724e4b493d1',0),(15797,1392345696,'278717017eb0e46cf928cb3a20e477db894d17c7','8c150498a9522a17fcac4b8be904836bc340fdf4',0),(15796,1392345391,'278717017eb0e46cf928cb3a20e477db894d17c7','b1f4bee8fadf2770b420d91f95c4cc0f521cfd3b',0),(15795,1392345391,'278717017eb0e46cf928cb3a20e477db894d17c7','b059081c65e1b142c1f8e3b21b1db462f15a8daf',0),(15794,1392345376,'278717017eb0e46cf928cb3a20e477db894d17c7','a9ab657cd943002a2d33fac8def8a4565b6571e2',0),(15793,1392345375,'278717017eb0e46cf928cb3a20e477db894d17c7','9a3f0e0bb19d065590f562e0fb23b392350cdd66',0),(15792,1392345368,'278717017eb0e46cf928cb3a20e477db894d17c7','f2328cb4007b68b250d4407054b77ffc56f8628a',0),(15791,1392345367,'278717017eb0e46cf928cb3a20e477db894d17c7','7615c7157d275712791bcd94bdc41202c818d10a',0),(15790,1392345367,'278717017eb0e46cf928cb3a20e477db894d17c7','cca172ec4c9b3918e803e6691ad7c6a9b61ba0cb',0),(15789,1392345367,'278717017eb0e46cf928cb3a20e477db894d17c7','e6a7eb96a4ffa38e4c6d90b3a7e002a0fd78a9c2',1),(15788,1392345364,'278717017eb0e46cf928cb3a20e477db894d17c7','75cc72b3d037a47daf3aed5c6f47fbf532a5491d',0),(15787,1392345364,'278717017eb0e46cf928cb3a20e477db894d17c7','12a3844f22d681304acc1d26358cc02b318da7fb',0),(15786,1392344896,'278717017eb0e46cf928cb3a20e477db894d17c7','831f602a6a28323d3b837a48672e183699e76a1e',0),(15785,1392344896,'278717017eb0e46cf928cb3a20e477db894d17c7','84931b0067388f7e82f3bd7482f2064de0bd5226',0),(15784,1392344895,'278717017eb0e46cf928cb3a20e477db894d17c7','75c0ba581c76377698806b5017dd5bd22a2dfca8',0),(15783,1392344895,'278717017eb0e46cf928cb3a20e477db894d17c7','e278c3ad934a086b1cc3cab32245f72399cd1a4f',1),(15782,1392344717,'278717017eb0e46cf928cb3a20e477db894d17c7','25ed153ad918d7108d1cce72a2069b64645c2013',0),(15781,1392344715,'278717017eb0e46cf928cb3a20e477db894d17c7','16ee08a43c64eca5238f06ea766b26e90a70c9fe',1),(15780,1392344706,'278717017eb0e46cf928cb3a20e477db894d17c7','12ede4605231652ebc7a40dfafdab9cbc6f90966',0),(15779,1392344706,'278717017eb0e46cf928cb3a20e477db894d17c7','6af5d6aade278d329fae2d9700dd54325e273554',0),(15778,1392344705,'278717017eb0e46cf928cb3a20e477db894d17c7','7f9e9baefd41319302be251ca7b76f51109e86c2',0),(15777,1392344705,'278717017eb0e46cf928cb3a20e477db894d17c7','9a096914f2abac6663bd795955f3d22e48767a2f',0),(15776,1392344571,'278717017eb0e46cf928cb3a20e477db894d17c7','4f5cadc8a4c14b28115422d049c4b6fc7be78982',0),(15775,1392344567,'278717017eb0e46cf928cb3a20e477db894d17c7','97da0d1a4011b64a40aa203bc355d2d24cfdcde2',0),(15774,1392344563,'278717017eb0e46cf928cb3a20e477db894d17c7','b8f5d094c7dcddf58d17d723b05ff506c7f21816',0),(15773,1392344549,'278717017eb0e46cf928cb3a20e477db894d17c7','e437d440a88b1ede0785ec71f55c729fd787ec0d',0),(15772,1392344546,'278717017eb0e46cf928cb3a20e477db894d17c7','0dc324b018c54bbdae0f33f27dd1b36eea2e0b92',1),(15771,1392344406,'278717017eb0e46cf928cb3a20e477db894d17c7','aa945bfe956694c539858db06fd830b3d871306b',0),(15770,1392344405,'278717017eb0e46cf928cb3a20e477db894d17c7','0c61cea47874c647b1a7c21bb702cf74a7ad45f6',0),(15769,1392344403,'278717017eb0e46cf928cb3a20e477db894d17c7','ccc4d15d06128d31d8f6b3ed140434eb12d49bb3',0),(15768,1392344403,'278717017eb0e46cf928cb3a20e477db894d17c7','de3538d9902e0eba9ed441ba0622d4fbdcd20142',0),(15767,1392344398,'278717017eb0e46cf928cb3a20e477db894d17c7','d64d6116633c5b23afd619bd4434090ce9acd173',0),(15766,1392344398,'278717017eb0e46cf928cb3a20e477db894d17c7','6dabe874427c704cb11e70e4f8b0410d0c624d56',0),(15765,1392344398,'278717017eb0e46cf928cb3a20e477db894d17c7','4b75712155d5f0c7caa121afb8f24d2a6d4eb8e0',0),(15764,1392344397,'278717017eb0e46cf928cb3a20e477db894d17c7','dcd8f8ef2aea91c984f29aa23173d31e62738aba',1),(15763,1392344395,'278717017eb0e46cf928cb3a20e477db894d17c7','baccd5273ab7ae2cd6862322dd6414dd5a2c35b3',0),(15762,1392344381,'278717017eb0e46cf928cb3a20e477db894d17c7','243985e9456967e20842b4a92fe34503347b144e',0),(15761,1392344380,'278717017eb0e46cf928cb3a20e477db894d17c7','0adac8c431fbd1f0ce772c9de0070843761257b6',0),(15760,1392344377,'278717017eb0e46cf928cb3a20e477db894d17c7','194f6e6096b449f3f6a81a6a1607c39ff8b92c12',0),(15759,1392344319,'278717017eb0e46cf928cb3a20e477db894d17c7','0828777b13e0a4c2f48d3ac489e7d65cae2114ba',0),(15758,1392344293,'278717017eb0e46cf928cb3a20e477db894d17c7','8ed7b6302d12a00d1fd440ed5b7b748ee2e6ece7',0),(15757,1392344292,'278717017eb0e46cf928cb3a20e477db894d17c7','bf0741d4aa7b7bc292ad3afa5518b5457a81bc60',0),(15756,1392344282,'278717017eb0e46cf928cb3a20e477db894d17c7','03691b22db39ff2fc7002f2c96928d11741606dc',0),(15755,1392344279,'278717017eb0e46cf928cb3a20e477db894d17c7','90cc6bf47d1201c9b54aa82a38b1f89e97904d9b',0),(15754,1392344263,'278717017eb0e46cf928cb3a20e477db894d17c7','7ccc643127a4c564b8e25fec798486828db15aab',0),(15753,1392344262,'278717017eb0e46cf928cb3a20e477db894d17c7','dc9df8e9252f19cc1deb3486ede471826e0c8258',0),(15752,1392344260,'278717017eb0e46cf928cb3a20e477db894d17c7','51ffb776ecc6f1cb7ab4e047734633e56cf5ad29',0),(15751,1392344260,'278717017eb0e46cf928cb3a20e477db894d17c7','9e8ee46ee3261a398485ae3ff18f84d03650063c',0),(15750,1392344258,'278717017eb0e46cf928cb3a20e477db894d17c7','f0cc1bf3f3e69809ea48c4d66dbcd1dd788d33de',1),(15749,1392344254,'278717017eb0e46cf928cb3a20e477db894d17c7','b5bfc11034b944e86fa56edce76c5ff37bb7287b',0),(15748,1392344254,'278717017eb0e46cf928cb3a20e477db894d17c7','fe4ba5610817cac4b1cb3dc01229820146ba3aea',0),(15747,1392344245,'278717017eb0e46cf928cb3a20e477db894d17c7','9d97ba54f20f8eb919a045384db8baed30e1a182',1),(15746,1392344224,'278717017eb0e46cf928cb3a20e477db894d17c7','57dedd4c5194421c4746fe7e8819fe6c0f49be32',0),(15745,1392344223,'278717017eb0e46cf928cb3a20e477db894d17c7','386c87c8f7995d4183bd885e797073e42b0a0d93',0),(15744,1392344218,'278717017eb0e46cf928cb3a20e477db894d17c7','95c8aceaf608e50c74c321c4f50a5a975eea9b4d',0),(15743,1392344216,'278717017eb0e46cf928cb3a20e477db894d17c7','89675943e69c9964c095e9f34b83a9dcd90cc7aa',0),(15742,1392344215,'278717017eb0e46cf928cb3a20e477db894d17c7','ed5a3e40a76b51ecb4633d83bd8c7ae832533669',0),(15741,1392344214,'278717017eb0e46cf928cb3a20e477db894d17c7','488b32a725642bb0265e57b7a882bb8d2f5effac',0),(15740,1392344212,'278717017eb0e46cf928cb3a20e477db894d17c7','d73a2a8dc9d5dd620ff7693f39c9b391c8555ab3',0),(15739,1392344025,'278717017eb0e46cf928cb3a20e477db894d17c7','425f6b1a456ccccababe8015773628d616532843',0),(15738,1392344021,'278717017eb0e46cf928cb3a20e477db894d17c7','e0c57673aa502b5b642eb93b83941ecf55265390',0),(15737,1392344021,'278717017eb0e46cf928cb3a20e477db894d17c7','017f3bf8e9062a8e50c0833e35e6143fb0f7b072',0),(15736,1392343991,'278717017eb0e46cf928cb3a20e477db894d17c7','56988ecf2d176d6270a22ee1bc9b5b5e9e2e8180',0),(15735,1392343990,'278717017eb0e46cf928cb3a20e477db894d17c7','f955dab4bf0f754aebc8c074a4a6921d16c393b3',0),(15734,1392343990,'278717017eb0e46cf928cb3a20e477db894d17c7','f626b5eb074292426061bf029a1080200c1052b7',0),(15733,1392343990,'278717017eb0e46cf928cb3a20e477db894d17c7','92184fdce6f5fe7f24f645b16585edfb951f4864',1),(15732,1392343986,'278717017eb0e46cf928cb3a20e477db894d17c7','dd91cd8ef260e3f4b2b741667cfe4e655afd2d9f',0),(15731,1392343985,'278717017eb0e46cf928cb3a20e477db894d17c7','87c9b5df42d17bc9ac94758a912cfdb32fb2f806',0),(15730,1392343958,'278717017eb0e46cf928cb3a20e477db894d17c7','edd18a5c84a8cb0734063f34c6702335404a8aca',0),(15729,1392343958,'278717017eb0e46cf928cb3a20e477db894d17c7','b4f5bceca86779b83e29f2c96d08554786a63564',0),(15728,1392343958,'278717017eb0e46cf928cb3a20e477db894d17c7','fd76c315fa3ab1bba080e56be15fa9e299382876',0),(15727,1392343957,'278717017eb0e46cf928cb3a20e477db894d17c7','86ff5512b8b2670a7688aa184963f98a7a246fd9',1),(15726,1392343951,'278717017eb0e46cf928cb3a20e477db894d17c7','b38b0f86ba34a505741427a90b9e34f6de7c356b',0),(15725,1392343951,'278717017eb0e46cf928cb3a20e477db894d17c7','a1a086e524fb30645c460bd9222a9616e3c424cf',0),(15724,1392343919,'278717017eb0e46cf928cb3a20e477db894d17c7','332c08dd19f06286adff75724dfb5f2fac831455',0),(15723,1392343919,'278717017eb0e46cf928cb3a20e477db894d17c7','22c54c8e8ae36e7f0b4b5533feb597db61f6489c',0),(15722,1392343919,'278717017eb0e46cf928cb3a20e477db894d17c7','f7301b0f17caf8ee1aef504a8882f929815f85d9',0),(15721,1392343918,'278717017eb0e46cf928cb3a20e477db894d17c7','279b9fd191cf4e9fb73edd8df30f49dd85f800d4',1),(15720,1392343907,'278717017eb0e46cf928cb3a20e477db894d17c7','ef18fe9f5131beb4b90113f1b1384de0e6e68304',0),(15719,1392343906,'278717017eb0e46cf928cb3a20e477db894d17c7','ad411753dbbcb640195e050b5bb32ebc68dcabde',0),(15718,1392343870,'278717017eb0e46cf928cb3a20e477db894d17c7','bdaba7474d3e03ed02d1980e345a7b738fe3b682',0),(15717,1392343870,'278717017eb0e46cf928cb3a20e477db894d17c7','cba9e49973eb07909ecb211518ab99d5aea5111f',0),(15716,1392343869,'278717017eb0e46cf928cb3a20e477db894d17c7','9d1fce051de632f0592973cac80e2d7deee435e3',0),(15715,1392343869,'278717017eb0e46cf928cb3a20e477db894d17c7','7803a0dbd4c369d9fe997e59ddea8ba22039107a',1),(15714,1392343836,'278717017eb0e46cf928cb3a20e477db894d17c7','16491fed2dae91294b2621a9aabc2ae923b75225',0),(15713,1392343836,'278717017eb0e46cf928cb3a20e477db894d17c7','8700e49f9385ac8ef1374ca76b2256ec3f8cfca4',0),(15712,1392343808,'278717017eb0e46cf928cb3a20e477db894d17c7','43d9d1b6a777a75e12ae7b51e320c09d4eed6c80',0),(15711,1392343808,'278717017eb0e46cf928cb3a20e477db894d17c7','f5b489e6fbebf534058ced4379031f2327e4a26c',0),(15710,1392343808,'278717017eb0e46cf928cb3a20e477db894d17c7','fae9b483ca44b4e5ddf7e8fcd829eda0362a026f',0),(15709,1392343807,'278717017eb0e46cf928cb3a20e477db894d17c7','cabaa89cec182d9a9765779d88907aae48804dff',1),(15708,1392343804,'278717017eb0e46cf928cb3a20e477db894d17c7','a6900310a89712621a1f9d747213fcac3e5af772',0),(15707,1392343803,'278717017eb0e46cf928cb3a20e477db894d17c7','b3074b83a951d8d9853d75726d3bd1c415b2bd84',0),(15706,1392343741,'278717017eb0e46cf928cb3a20e477db894d17c7','a7fc5fcf10556f95f2281735404fa04e39426444',0),(15705,1392343740,'278717017eb0e46cf928cb3a20e477db894d17c7','5e4c3597a70f887ce81f8a9bbe9e806ce564e00c',0),(15704,1392343740,'278717017eb0e46cf928cb3a20e477db894d17c7','5a7ea4bac528029b963121c0c7272ebd60e3453b',0),(15703,1392343740,'278717017eb0e46cf928cb3a20e477db894d17c7','bb97f5e60239992e9e5b6afc4edb1bbacc093bd6',1),(15702,1392343735,'278717017eb0e46cf928cb3a20e477db894d17c7','8be3b7b87588b702049489c1c63a64e9d323556e',0),(15701,1392343735,'278717017eb0e46cf928cb3a20e477db894d17c7','24a0a81fcdfa53e80e8da0c3640e0ef72306d84c',0),(15700,1392343674,'278717017eb0e46cf928cb3a20e477db894d17c7','75937dbebe3238169e0d8f970e515011c0bcba13',0),(15699,1392343674,'278717017eb0e46cf928cb3a20e477db894d17c7','554bfda0c8ed8863db74dec626cd01e251068740',0),(15698,1392343674,'278717017eb0e46cf928cb3a20e477db894d17c7','73e441e502f9411718fda8c9dd0603ca58d43ba3',0),(15697,1392343673,'278717017eb0e46cf928cb3a20e477db894d17c7','cdb0c4bb936a9a67646a5c6064efd57721478263',1),(15696,1392343672,'278717017eb0e46cf928cb3a20e477db894d17c7','89fe245a1851459a12721307fe09e3452a3eee27',0),(15695,1392343665,'278717017eb0e46cf928cb3a20e477db894d17c7','76a26403713fd65f6fea65404888c71febb72da3',0),(15694,1392343665,'278717017eb0e46cf928cb3a20e477db894d17c7','c01f6a9d9574a0730976a1ce563565311bc5a76a',0),(15693,1392343642,'278717017eb0e46cf928cb3a20e477db894d17c7','52a878a8b7fb8199e7b189930657f7b325e0d661',1),(15692,1392343641,'278717017eb0e46cf928cb3a20e477db894d17c7','e2946a12658be5c88eb545b0886718dd526b160a',0),(15691,1392343637,'278717017eb0e46cf928cb3a20e477db894d17c7','bb947fe4fe4daf642073402ac16892a34437f38a',0),(15690,1392343301,'f6f22724a0f1851339f813d51968596ff6b91efb','ae006755a9f0fb5e11d1d80210af84c33975156f',0),(15689,1392343301,'f6f22724a0f1851339f813d51968596ff6b91efb','5b82a416cb3cca2fd69064c44a74eb7e312b7d9b',0),(15688,1392343301,'f6f22724a0f1851339f813d51968596ff6b91efb','405326a6b516b13235bf4ca874e5161344f7c633',0),(15687,1392343300,'f6f22724a0f1851339f813d51968596ff6b91efb','57d57ad452ae5506859a2f80fb7c839e56ce0eff',0),(15686,1392343285,'f6f22724a0f1851339f813d51968596ff6b91efb','b3b8f4e756b6979a863bf804a93e56b842494412',0),(15685,1392343285,'f6f22724a0f1851339f813d51968596ff6b91efb','ec4f36e5778a84910efcb147a80b6fbe46f4aee6',0),(15684,1392343222,'f6f22724a0f1851339f813d51968596ff6b91efb','1579762927e3a015c8a4ad2009f124a04931f024',0),(15683,1392343222,'f6f22724a0f1851339f813d51968596ff6b91efb','1c1b04359b4fc2fc2354509441ab54ff40e25242',0),(15682,1392343222,'f6f22724a0f1851339f813d51968596ff6b91efb','f14011053391f5d972b540067d939167a4e66d78',0),(15681,1392343221,'f6f22724a0f1851339f813d51968596ff6b91efb','44334b36f9cab2d5af6b42eb18fe0221a22e7b5e',1),(15680,1392343218,'f6f22724a0f1851339f813d51968596ff6b91efb','4195c3a826282d613da55deb990729bf78a3090e',0),(15679,1392343182,'f6f22724a0f1851339f813d51968596ff6b91efb','2ba027b75a823572ac03109860b56fe4da191e36',0),(15678,1392343182,'f6f22724a0f1851339f813d51968596ff6b91efb','6f413b614578b34d83dce667ba517b07d2dd594e',0),(15677,1392343182,'f6f22724a0f1851339f813d51968596ff6b91efb','16291c9ce740d1d7fbdedebb66ce7576f5026419',0),(15676,1392343181,'f6f22724a0f1851339f813d51968596ff6b91efb','434ef57068b9cebdbe3f04c845aff040585316eb',1),(15675,1392343177,'f6f22724a0f1851339f813d51968596ff6b91efb','d9a5c576876382223aa31a7caa22ed01d2910d8a',0),(15674,1392343176,'f6f22724a0f1851339f813d51968596ff6b91efb','6d3fc507c1cd593076be7d99c097e6b135a6aee7',0),(15673,1392343145,'f6f22724a0f1851339f813d51968596ff6b91efb','bf885b35f4f5525f10b8a48cc924aef280a7a626',1),(15672,1392343139,'f6f22724a0f1851339f813d51968596ff6b91efb','30f81e30cd7896817b134cb12fa505e5eac04674',0),(15671,1392343123,'f6f22724a0f1851339f813d51968596ff6b91efb','03c80a58ac56fe64f208eb63ca919c9663dfd38d',0),(15670,1392343123,'f6f22724a0f1851339f813d51968596ff6b91efb','ada9388ac43434a50d8de15446f9beb76ce24b01',0),(15669,1392343056,'f6f22724a0f1851339f813d51968596ff6b91efb','b4d0df13ce1b947ba83172733a89001e4cd54720',1),(15668,1392343050,'f6f22724a0f1851339f813d51968596ff6b91efb','5684ff38ab973c7fc91d28475ee464daf5de44bc',0),(15667,1392343049,'f6f22724a0f1851339f813d51968596ff6b91efb','d532dfdf7af8b11730e359dc80e8de33c561aff6',0),(15666,1392342097,'f6f22724a0f1851339f813d51968596ff6b91efb','f7ebcde7e87cf82040721950a5de157860bc51b2',0),(15665,1392342091,'f6f22724a0f1851339f813d51968596ff6b91efb','b43f491714b836836d33cb8b0cd99d195566679c',0),(15664,1392342091,'f6f22724a0f1851339f813d51968596ff6b91efb','b7159db87bf27cc88e122189c78cb234b0f89f25',0),(15663,1392342091,'f6f22724a0f1851339f813d51968596ff6b91efb','546acd3b8747857344e6b713b4812e54424f819f',0),(15662,1392342091,'f6f22724a0f1851339f813d51968596ff6b91efb','1dd58be524cf195c124dc5f5f589046e23ecdb16',0),(15661,1392342091,'f6f22724a0f1851339f813d51968596ff6b91efb','4b803b5a44809a7b788378edc4e586f96637b79e',0),(15660,1392342090,'f6f22724a0f1851339f813d51968596ff6b91efb','8d6098f3812d23afef0e9efa85170905d77abeb8',0),(15659,1392342090,'f6f22724a0f1851339f813d51968596ff6b91efb','5085d99531dd708f09a53576001bad02899c7fc0',0),(15658,1392342090,'f6f22724a0f1851339f813d51968596ff6b91efb','1fc57282f2599072ce8e002744e09e912ee45d8a',0),(15657,1392342090,'f6f22724a0f1851339f813d51968596ff6b91efb','6f3983a117054604740d9f6092ebbf5af0b3eca4',0),(15656,1392342089,'f6f22724a0f1851339f813d51968596ff6b91efb','5d4335124805fa8e5cb84663e950ecbfa1659b6b',0),(15655,1392342089,'f6f22724a0f1851339f813d51968596ff6b91efb','c46c02da71b9377efe7c6a23f85072511d1a7980',0),(15654,1392342089,'f6f22724a0f1851339f813d51968596ff6b91efb','fc104211b1b3e3d3a59bcd1bc95870d97e03f3cc',0),(15653,1392342081,'f6f22724a0f1851339f813d51968596ff6b91efb','1a6d99bce63e4a0340169e6a7b36321e3fb0e61b',1),(15652,1392342079,'f6f22724a0f1851339f813d51968596ff6b91efb','682409b3aa235ad96ebdb7a3ff12b8b429d11722',0),(15651,1392342075,'f6f22724a0f1851339f813d51968596ff6b91efb','6748664a4eb1bc3d85c8626475918ca2a44a918f',0),(15650,1392342075,'f6f22724a0f1851339f813d51968596ff6b91efb','40e707a8f7ef4321489c35afeaf61bc1d098f692',0),(15649,1392342070,'f6f22724a0f1851339f813d51968596ff6b91efb','763fac984914b80f800b2acec5d958699aac9acf',1),(15648,1392342068,'f6f22724a0f1851339f813d51968596ff6b91efb','0565f357d7148e8eee1c35b43ead0d8150a214b9',0),(15647,1392341964,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','f83f2761e0c41d744d2ad35fc88731af0ca3f70c',0),(15646,1392341963,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','e8009f6808dfa7793943ff754d2e5d4138c3cd3f',0),(15645,1392341963,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','9ccbadcb8a69cad43898c80983cca5c6ecce42f5',0),(15644,1392341963,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','dd416830226f51bcf4edb1a501f1e053ade0f279',0),(15643,1392341961,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','69bbc05c28b31736d638f4f696a7fec276664364',0),(15642,1392340707,'f6f22724a0f1851339f813d51968596ff6b91efb','8631ce98b37533ef6d74c704c30c217e94d43d2c',0),(15641,1392340706,'f6f22724a0f1851339f813d51968596ff6b91efb','6e8f7e398f80c705a167e2e5991263c4c31a0bf9',0),(15640,1392340075,'896b511e6644edd98afb09158233798d682f4bf6','87d74dd20de4f80bf34a27beca544ab592b1dc08',0),(15639,1392340075,'896b511e6644edd98afb09158233798d682f4bf6','f16eeaed9e5d2e4f24da2cd50469a75b163c7c18',0),(15638,1392340075,'896b511e6644edd98afb09158233798d682f4bf6','ef00c766b75ce166b3efebf2cc6b8ff9d1512f49',0),(15637,1392340065,'896b511e6644edd98afb09158233798d682f4bf6','3d23dbfa4068fa7fd4727e55b58fd5c2218c2e09',0),(15636,1392340065,'896b511e6644edd98afb09158233798d682f4bf6','7e058d6af4050d1dd378a76cb85a3083c5bc32ee',0),(15635,1392340065,'896b511e6644edd98afb09158233798d682f4bf6','ed46d5b9f08a74b32a6099981b0ac69538c52100',0),(15634,1392340064,'896b511e6644edd98afb09158233798d682f4bf6','608844c962365ff16872ff2951468c66238986c7',0),(15633,1392340045,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','2247270f69ad9314c862b8e5bba40113688b9ee1',0),(15632,1392340045,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','938efe8cc8fc76e2258016fe54041f616d45b286',0),(15631,1392339894,'896b511e6644edd98afb09158233798d682f4bf6','eecd18155741c43343c96feb306411479cdc9d58',0),(15630,1392339894,'896b511e6644edd98afb09158233798d682f4bf6','50b8a89714322d41265e138dddd8c9bacf08ab35',0),(15629,1392339893,'896b511e6644edd98afb09158233798d682f4bf6','4245903d12d31e727754a81e6007ede5cb0e5d44',0),(15628,1392339893,'896b511e6644edd98afb09158233798d682f4bf6','1aff1cab2eb99b0e771edd521d611fd8baf2a931',0),(15627,1392339893,'0','772d8b4b22d94db24c83ccc0005adfaec9f4504d',0),(15626,1392339888,'0','c0f8b7bebbaeb4904a237a40ff904f1f3d3ce964',1),(15625,1392339888,'0','a906a5bc0bd2e3ab24ef3617b02bbf123f2127b9',0),(15624,1392339879,'f6f22724a0f1851339f813d51968596ff6b91efb','af020c74cf450269e822a99407916c3b806300ae',0),(15623,1392339878,'f6f22724a0f1851339f813d51968596ff6b91efb','ac1ad21a32028c274239a82ca718e46e6790eb05',0),(15622,1392339878,'f6f22724a0f1851339f813d51968596ff6b91efb','c35af216cce0ceaf8d7f7e0605dca415a205583e',0),(15621,1392339877,'f6f22724a0f1851339f813d51968596ff6b91efb','ba7c0d4770014a6acfedcbec6d332b606c51756b',0),(15620,1392339877,'0','21b3f60c4249ab3478ffcce90819b9ee30d6ce22',0),(15619,1392339862,'0','6a65ccb7be57b8895f99cc7542ce7222a7dccf9c',1),(15618,1392339862,'0','7d55c8d3182ac4c2b459b225c305910c07cabdf6',0),(15617,1392339851,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','b484a0c4e4f9010177588bc6d842cf00fa7121c5',0),(15616,1392339851,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','6856c08e71cdfa6830211c9a802165d21c9ec7f0',0),(15615,1392339851,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','5d5eb679d2f36d9bcc41af8b789c93a5e0c51cd5',0),(15614,1392339851,'d2d6c4ae4c7e3f2b3a50b0c4a9bb18202b00a26d','898dcedd63b3c8f33500a9670b286395bdddc4f0',0),(15613,1392339748,'64b2997ff4faec48be9dbd399af27079c7c779fe','3e2f80ce2e2656eb671b0e2c52ad596488269327',0),(15612,1392339748,'64b2997ff4faec48be9dbd399af27079c7c779fe','8121ada6d283fbc7e16f8ff027a34869411f49e3',0),(15611,1392339738,'64b2997ff4faec48be9dbd399af27079c7c779fe','2a5cb59f83ecc6b2db3b0c1ffe334af25ac92d82',0),(15610,1392339737,'64b2997ff4faec48be9dbd399af27079c7c779fe','e1af2244b760b9f6e264358b04932a8771fbbe42',0),(15609,1392339399,'64b2997ff4faec48be9dbd399af27079c7c779fe','58a856f370a9c469a35abe7f37821783613fdd03',0),(15608,1392339399,'64b2997ff4faec48be9dbd399af27079c7c779fe','80976601515e58d1aa0f8300b057445fbb0ff847',0),(15607,1392339399,'64b2997ff4faec48be9dbd399af27079c7c779fe','46bc8df9dbc0921f63624e5c65442a4f06fc271e',0),(15606,1392339399,'64b2997ff4faec48be9dbd399af27079c7c779fe','ec901c944a2b7826d63ae09b2c064296b3b8a9e6',0),(15605,1392339398,'64b2997ff4faec48be9dbd399af27079c7c779fe','d720896b3489466d83c405419513ee84351a9c9e',0),(15604,1392339398,'64b2997ff4faec48be9dbd399af27079c7c779fe','9ebca1762706c0c190713be6844e3c9c6d755755',0),(15603,1392339200,'64b2997ff4faec48be9dbd399af27079c7c779fe','60399bf14ba8b537ef6c922801b8764b5425745a',0),(15602,1392339200,'64b2997ff4faec48be9dbd399af27079c7c779fe','9085978546103fc2444bcdb3df854527e4c083f9',0),(15601,1392339199,'64b2997ff4faec48be9dbd399af27079c7c779fe','38b465249391c0ef3e26cbd0cfb330d775b36820',0),(15600,1392339189,'64b2997ff4faec48be9dbd399af27079c7c779fe','351248c33c52092c615939e43a17b6c25873b6ad',0),(15599,1392339189,'64b2997ff4faec48be9dbd399af27079c7c779fe','2de0a027447fd8aebdb49471e00e49e25609ae71',0),(15598,1392339189,'64b2997ff4faec48be9dbd399af27079c7c779fe','c386f396ecd64c9f7ab28248f20808ff133396fc',0),(15597,1392338920,'0','1f7e85334a96b2dabcf84f024a47cd5c470e97eb',0),(15596,1392338920,'0','3a4fda92bcf6bd74a4665b5a68a2daa5dd01c0f9',0),(15595,1392338920,'0','662cc36ee72dec187fa207d28f2c7c2cbd297f16',0),(15594,1392338917,'0','9be7f77cd3328656a8649ba3fe822d94374fe74b',0),(15593,1392338893,'64b2997ff4faec48be9dbd399af27079c7c779fe','22ec0a4edfb5469356d1a5e10f2151482b3d0e0b',0),(15592,1392338893,'64b2997ff4faec48be9dbd399af27079c7c779fe','65eb9fb020ae249476607fac2f84c6b2b900989f',0),(15591,1392338893,'64b2997ff4faec48be9dbd399af27079c7c779fe','827bb1081074becdb7168bfeb05cfb1c3ddfb1cf',0),(15590,1392338886,'64b2997ff4faec48be9dbd399af27079c7c779fe','63481d81d195bb38e7234ea362ea786406d2d6d0',0),(15589,1392338886,'64b2997ff4faec48be9dbd399af27079c7c779fe','763501d9963af8fd51252cbf8f400a5b898cb668',0),(15588,1392338886,'64b2997ff4faec48be9dbd399af27079c7c779fe','5f7da82bbf8cf67b1ab09844c96a2d5596598028',0),(15587,1392338886,'64b2997ff4faec48be9dbd399af27079c7c779fe','b386296a605e50acd4c592eb2591498073a5a05e',0),(15586,1392338886,'64b2997ff4faec48be9dbd399af27079c7c779fe','34ca75fe719b2adbc009321adc6d8187de9965a8',0),(15585,1392338886,'64b2997ff4faec48be9dbd399af27079c7c779fe','1a7da946c3c5c465dab089d45b35067aa10110e0',0),(15584,1392338881,'64b2997ff4faec48be9dbd399af27079c7c779fe','74aba0fb4c2b83138011841dad53d367777fb345',0),(15583,1392338880,'64b2997ff4faec48be9dbd399af27079c7c779fe','caa2b50ea2b0ab214de11aa69abbd6fe93665330',0),(15582,1392338880,'64b2997ff4faec48be9dbd399af27079c7c779fe','88b19f7d5181b0326f272eecce46f06a1a18e792',0),(15581,1392338880,'64b2997ff4faec48be9dbd399af27079c7c779fe','97291e57860804243c7d410cc0c74025beb3ab5f',0),(15580,1392338880,'64b2997ff4faec48be9dbd399af27079c7c779fe','f0c106be803728af2594e7e9fcc1b1e9098f5e65',0),(15579,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','0c30f3f6d87a7b868b2e3b693be1c8e22ba679e9',0),(15578,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','0c945f3f1fe84f37f4acbfa323ab6b579ed9b4b6',0),(15577,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','806911b6e40a1449f704ddd65ad4b5ddd000cb31',0),(15576,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','18e45bfcec2256020be41e7519a9fe2b9a385f79',0),(15575,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','e7bfc559a0e81628c851565e62f1f437a9ab00e8',0),(15574,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','af3395c35faac12188e75fd514f84921be2fe010',0),(15573,1392338879,'64b2997ff4faec48be9dbd399af27079c7c779fe','fb33435a5c34ea65bebcc3e502844e5ddaa0562e',0),(15572,1392338879,'0','5f4c052de820e40e7bb5bfaeb9de6949976da07c',0),(15571,1392338879,'0','47e67ac548a27e115a1b6ffd20eb653a424ff9e9',0),(15570,1392338879,'0','860cb7dfb15c3dcdf57832590c8552f5280dea41',0),(15569,1392338871,'0','66771bfa3f73e951fc0dc15153e9a4a924294fa2',0),(15568,1392338870,'0','d1d80a15922cd25c902dc0df2b9f755ca92c29ff',0),(15567,1392338861,'0','5727fcfaafe4407f3c2eaddbd8a954003873c785',0),(15566,1392338861,'0','2d5a6f5a4b9da8306305f8d6fc4f9a46a20c6784',0),(15565,1392338860,'0','2b0a07868e57037223443e9e57c883c59cd26944',0),(15564,1392338843,'64b2997ff4faec48be9dbd399af27079c7c779fe','e403e8a62922aa2e571ee7c8ac32daecd464b0e8',0),(15563,1392338843,'0','d869664eaffbcf9cb1df6c48c3657a7364338917',0),(15562,1392338842,'0','58b03280bef4c91bd17c2dd1c4b720091966145f',0),(15561,1392338842,'0','19da7ebecd0071c2eb636bef85b60c53fc1aa70b',0),(15560,1392338842,'0','8f3c193f9a60585172cb7858e4db089a5618a564',0),(15559,1392338831,'64b2997ff4faec48be9dbd399af27079c7c779fe','475b5192905e826f8a80e74fa4c3b90e994323ad',0),(15558,1392338831,'64b2997ff4faec48be9dbd399af27079c7c779fe','e591ef0dbea4804f295b673b9b1624002a093c34',0),(15557,1392338831,'64b2997ff4faec48be9dbd399af27079c7c779fe','9ec5fd31565f106b4fa5d2433586ac1cbcd45239',0),(15556,1392338830,'64b2997ff4faec48be9dbd399af27079c7c779fe','938d2456254b0b767d6239ce6c43fad8fe82b823',0),(15555,1392338686,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','e415f8dad103a831840e5541ba0f53ea1cafa5d2',0),(15554,1392338686,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','3f6fc7370306e3fcdeabe2505ebd6eee77e28806',0),(15553,1392338686,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','1086e924191cf4b2d1ca466655e805e11c11abca',0),(15552,1392338685,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','c46bc13e26290459528b2a4972ca10461442f234',0),(15551,1392338685,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','ba809031f8fd601b9c27def094bec3092d3b8192',0),(15550,1392338685,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','417f2d411584fe9df62d99b151d7db1f0a4d6477',0),(15549,1392338682,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','a437b7544421fb3948d4726fe6d9f1e7b8c029da',0),(15548,1392338682,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','d602c26390a4ea6153b0e98c64cd11f0823b9d3b',0),(15547,1392338682,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','84279160a9d1875320a1bd107561ab64dd2bf5a3',0),(15546,1392338681,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','559d732ed5735758f66f6e0971f2f3a3cb40c9d7',0),(15545,1392338681,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','cbbf3fa8b23397a7d6829ce96f8b9062e97eceb5',0),(15544,1392338680,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','39ceef4845e0d3314ae9f0ab4b43d68e2cce6b76',0),(15543,1392338680,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','306376c6df01f323aecc4817bd6d57fe664b703d',0),(15542,1392338679,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','afadfd973b96a1ec81c4d1d2748cac381f8b5ef4',0),(15541,1392338679,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','12f6319ba1c803a2f22320e58789fbbc494752a0',0),(15540,1392338679,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','54372f660d7dad97f1a28cbf950f2add196f0039',0),(15539,1392338679,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','4da2395ccf4ab345a31986bce1b3f27c7c7cf1d0',0),(15538,1392338674,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','e54fe7a6be40a7eab4b4234a941fa4d5214f1c12',0),(15537,1392338674,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','ebdd3bf76aafff3141140d70c8bbd8d7660754a6',0),(15536,1392338674,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','0f0e9525be79967e86b5afa0f6389f8333a7b47c',0),(15535,1392338674,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','e5f23af849d12baf05bd4a95dd6c90a1c37ac325',0),(15534,1392338674,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','170c37d1b4d156cb9b1c7310c9c7229116f536bf',0),(15533,1392338673,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','da9a1919f8bffd709e7096dde5e7da4962eb8e6c',0),(15532,1392338640,'0','e24ccd3d196934b7d2efeca2b9fe0ac878b7a2e2',0),(15531,1392338638,'64b2997ff4faec48be9dbd399af27079c7c779fe','05c5aac4f05b3be223478f9631ad4208fd6931ef',0),(15530,1392338638,'64b2997ff4faec48be9dbd399af27079c7c779fe','bbe704022bf95ed33fc58596334934ce1e8c80b1',0),(15529,1392338630,'64b2997ff4faec48be9dbd399af27079c7c779fe','a5ca9ad1bec02c9818fe63fe246e06a69a5c78de',0),(15528,1392338629,'64b2997ff4faec48be9dbd399af27079c7c779fe','313be76cd91ebb7646e54a2dce42988f7e1bdab9',0),(15527,1392338629,'64b2997ff4faec48be9dbd399af27079c7c779fe','007bfa610da300735ab60a2aac7438fc270d880b',0),(15526,1392338629,'64b2997ff4faec48be9dbd399af27079c7c779fe','7e2795bcc4d9667b8c7707185e6e3edc7192628a',1),(15525,1392338628,'64b2997ff4faec48be9dbd399af27079c7c779fe','7136ea1ee1194fe309e0f9370e4cd1901bfda8c7',0),(15524,1392338608,'64b2997ff4faec48be9dbd399af27079c7c779fe','7ecd550eac0c023681b00c753c924ef98db5cb4a',0),(15523,1392338608,'64b2997ff4faec48be9dbd399af27079c7c779fe','d8cc8d808c96c0bdf2e03ea7315b81e2114e60f1',0),(15522,1392338608,'64b2997ff4faec48be9dbd399af27079c7c779fe','ecfe18e07d548bc8fc52f58ff291c67d9d9b0c1e',0),(15521,1392338607,'64b2997ff4faec48be9dbd399af27079c7c779fe','fb04617d0f4db16bf02b1c774c0aad3661deb2d0',0),(15520,1392338604,'64b2997ff4faec48be9dbd399af27079c7c779fe','804c70f53a3d0f6f6d3e87a987e2910abf04b6d8',0),(15519,1392338603,'64b2997ff4faec48be9dbd399af27079c7c779fe','7b0a750c2845dd59ed83a29288353960ae8cd46c',0),(15518,1392338580,'64b2997ff4faec48be9dbd399af27079c7c779fe','59b31fd4c17a3811506dc0d843aefbb2b741b09f',0),(15517,1392338580,'64b2997ff4faec48be9dbd399af27079c7c779fe','a70c5ac3b8d45386eaaf40f8c690c1a917e9ccb8',0),(15516,1392338579,'64b2997ff4faec48be9dbd399af27079c7c779fe','083cf0cbe1a6cfb5c83a727b52882c3c53c21957',0),(15515,1392338579,'64b2997ff4faec48be9dbd399af27079c7c779fe','4d2b418efef345fb226b72b831a6bbd87dfa5095',1),(15514,1392338578,'64b2997ff4faec48be9dbd399af27079c7c779fe','cdc53129df6e47fe655798f3f175c9404c26c5ba',0),(15513,1392338554,'64b2997ff4faec48be9dbd399af27079c7c779fe','db6a1d22a1b4fa59d4dc2606cb225e3a78dee8b4',0),(15512,1392338554,'64b2997ff4faec48be9dbd399af27079c7c779fe','627bfd9d61a10c6d1f1c139561022564c350f73d',0),(15511,1392338554,'64b2997ff4faec48be9dbd399af27079c7c779fe','3f61b652759fb135c258f2a91aad2ec068829113',0),(15510,1392338553,'64b2997ff4faec48be9dbd399af27079c7c779fe','d3a96fb8eb8cbc3c915a66df4ee096e16828fc91',0),(15509,1392338551,'64b2997ff4faec48be9dbd399af27079c7c779fe','3dba0edef1b3b1031455dd5deb28671fee12b061',0),(15508,1392338538,'64b2997ff4faec48be9dbd399af27079c7c779fe','70a0af87b3598e443a4da624706004e957343729',0),(15507,1392338538,'64b2997ff4faec48be9dbd399af27079c7c779fe','5b0ab40045efac09558b42142adeeacb369bdae2',0),(15506,1392338538,'64b2997ff4faec48be9dbd399af27079c7c779fe','a0c8454258f5bc542390044a0ae5a4803cd6b5db',0),(15505,1392338537,'64b2997ff4faec48be9dbd399af27079c7c779fe','860ffd3baa4e54d318a801f8c65bb81e31c3d8a5',0),(15504,1392338532,'64b2997ff4faec48be9dbd399af27079c7c779fe','d9e4324957ff61d0e4aca2d8748e5d2e9cd38616',0),(15503,1392338532,'64b2997ff4faec48be9dbd399af27079c7c779fe','529cc96d2688b54f2a11c1f05e481a1e7f6f5b30',0),(15502,1392338509,'64b2997ff4faec48be9dbd399af27079c7c779fe','dfc321b91cb467881904d4ad4a9ab9bab45eb591',0),(15501,1392338509,'64b2997ff4faec48be9dbd399af27079c7c779fe','16847d11f41afee33e2c1d9c7c521ab5a1d187ef',0),(15500,1392338509,'64b2997ff4faec48be9dbd399af27079c7c779fe','92a449b2ab3e9eb293b988837d62ebc9833b642e',0),(15499,1392338508,'64b2997ff4faec48be9dbd399af27079c7c779fe','e101abcd19d9106fdb8ffc01b38d22bc9cc228cc',1),(15498,1392338507,'64b2997ff4faec48be9dbd399af27079c7c779fe','273fe4908031af242fecbfd830b8075284531b89',0),(15497,1392338498,'64b2997ff4faec48be9dbd399af27079c7c779fe','ef7d8275a629e228d08c3ecfc226eed314e3bb38',0),(15496,1392338497,'64b2997ff4faec48be9dbd399af27079c7c779fe','a2de2f18ca3a90821cd90236b4e95372125af5fb',0),(15495,1392338497,'64b2997ff4faec48be9dbd399af27079c7c779fe','88a7520e2c2219e7c551c24d64521c7dfea26a17',0),(15494,1392338497,'64b2997ff4faec48be9dbd399af27079c7c779fe','9e4881a6a85598d8ed907ab9d466ee8b0995f345',0),(15493,1392338495,'64b2997ff4faec48be9dbd399af27079c7c779fe','2952e02d1a52bd4d7aae5b6807ef393ace515071',0),(15492,1392338413,'64b2997ff4faec48be9dbd399af27079c7c779fe','edf974e81fe5e5927f39ac661a80cb94aee7906f',0),(15491,1392338413,'64b2997ff4faec48be9dbd399af27079c7c779fe','a0488f918a1ebacb3144e3bdceacab0a4378c59c',0),(15490,1392338413,'64b2997ff4faec48be9dbd399af27079c7c779fe','d9f127501c7aef27e2a9a58e222d7da93e23596f',0),(15489,1392338412,'64b2997ff4faec48be9dbd399af27079c7c779fe','a6b047a6e783a9087f43bf1baa8b4bda371f95a7',0),(15488,1392338403,'64b2997ff4faec48be9dbd399af27079c7c779fe','957db882f6eaab3d2da76cf010c448e4899d3bc4',0),(15487,1392338402,'64b2997ff4faec48be9dbd399af27079c7c779fe','8348026b910069aec38237f2a46ad72bf34cfa23',0),(15486,1392338402,'64b2997ff4faec48be9dbd399af27079c7c779fe','cb7c4b3e5429250770b084b74e4cc503d33fac0b',0),(15485,1392338402,'64b2997ff4faec48be9dbd399af27079c7c779fe','68b18315ac25dbfb07191d9ee82348f9c4759a56',0),(15484,1392338392,'64b2997ff4faec48be9dbd399af27079c7c779fe','fd7e801b21a07598b8e7691601ed3909fb919ba0',0),(15483,1392338391,'64b2997ff4faec48be9dbd399af27079c7c779fe','1b0888df055aa408b4d9c7bffc182ea9d6f14d3a',0),(15482,1392338391,'64b2997ff4faec48be9dbd399af27079c7c779fe','8904e9df43b305068ae17ebb96e5dd277fca0868',0),(15481,1392338391,'64b2997ff4faec48be9dbd399af27079c7c779fe','c4dca720a53ebce8873dffb23b8a7e56321f3ef3',0),(15480,1392338388,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','ccebfb7781dc644599f61c25279ecca09c1cf962',0),(15479,1392338388,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','446158f9827cb30aab3a9b98d3e2dd5559dcaa3f',0),(15478,1392338384,'64b2997ff4faec48be9dbd399af27079c7c779fe','2a63ce34906a5dc756fbca71d5cf51dc0d342453',0),(15477,1392338381,'64b2997ff4faec48be9dbd399af27079c7c779fe','0728f8e09d7508aba6b6cd6bdf599c0019d28158',0),(15476,1392338301,'b3309cb32c08450b1ebb54fd4893962538f23644','fe879464424a87b05cf493cb3881b932b9c75711',0),(15475,1392338301,'b3309cb32c08450b1ebb54fd4893962538f23644','e93d2ff627a1e07c85fc41416fea2d759917a5fe',0),(15474,1392338301,'b3309cb32c08450b1ebb54fd4893962538f23644','a4f2ac22ccca4ccc022972d8e5ed72b771ff9b7a',0),(15473,1392338300,'b3309cb32c08450b1ebb54fd4893962538f23644','945527f9546bf1b63722d5d9c9a1431a6e2ae319',0),(15472,1392338299,'b3309cb32c08450b1ebb54fd4893962538f23644','7a7782c545ab19ad80e8e243abfd01fb68edc755',0),(15471,1392338296,'b3309cb32c08450b1ebb54fd4893962538f23644','5d4cc13167a44e6db7ab9b5f4d7f7eb08c8425b0',0),(15470,1392338274,'b3309cb32c08450b1ebb54fd4893962538f23644','8ce872af13fd76b9d393d69d9714e11878fe4394',0),(15469,1392338274,'b3309cb32c08450b1ebb54fd4893962538f23644','0a1bf1a828c09746d07ae06f4857fd0a6366abb4',0),(15468,1392338274,'b3309cb32c08450b1ebb54fd4893962538f23644','9f8e8b699d8086c120722fc6ddf57cb7080c6545',0),(15467,1392338274,'b3309cb32c08450b1ebb54fd4893962538f23644','528fdeae33ca247fd6803576727cba6fa8a11ece',0),(15466,1392338236,'b3309cb32c08450b1ebb54fd4893962538f23644','76693124081571f089185985ffd7443668dca1ba',0),(15465,1392338236,'b3309cb32c08450b1ebb54fd4893962538f23644','14f02d43d3950ace21b70e498923f1265d08e3b9',0),(15464,1392338236,'b3309cb32c08450b1ebb54fd4893962538f23644','2a880aef2ef699dd1e2ccbfdd11ef0f4d77b05a8',0),(15463,1392338236,'b3309cb32c08450b1ebb54fd4893962538f23644','17c8e291eda55a824fc71a1d097b10070a5dedfd',0),(15462,1392338205,'b3309cb32c08450b1ebb54fd4893962538f23644','7b03f6461fc5dd07125ee4a6e9ea5c4ae6c9165b',0),(15461,1392338205,'b3309cb32c08450b1ebb54fd4893962538f23644','df8aec5829ea533bed14715265db2ddfc2d310eb',0),(15460,1392338205,'b3309cb32c08450b1ebb54fd4893962538f23644','432344847d7a8bc7522a3f61d1189fdd4519e391',0),(15459,1392338204,'b3309cb32c08450b1ebb54fd4893962538f23644','03ed0ce259a8da4b54e2df00a596284ac9492149',0),(15458,1392338201,'b3309cb32c08450b1ebb54fd4893962538f23644','0d1e1e17b176dc225077f1ec697b177cfef5f064',0),(15457,1392338201,'b3309cb32c08450b1ebb54fd4893962538f23644','a1db7bd63140791ce26d10c24a8583a3a280b441',0),(15456,1392338193,'b3309cb32c08450b1ebb54fd4893962538f23644','52ab3c1c5a484dd5f6a837019a8adec9f6b86d8a',0),(15455,1392338193,'b3309cb32c08450b1ebb54fd4893962538f23644','2f0b0efc8860e80dacc19adba217ff069f38249e',0),(15454,1392338192,'b3309cb32c08450b1ebb54fd4893962538f23644','03a9906b7d9039d7eac2b4fbac1e5593ffa04e6f',0),(15453,1392338192,'b3309cb32c08450b1ebb54fd4893962538f23644','ac37043282c811080495f3b2456fe8c605885a9f',1),(15452,1392338190,'b3309cb32c08450b1ebb54fd4893962538f23644','56446c8a7fa9b63229df93286d3143155f76337a',0),(15451,1392337782,'b3309cb32c08450b1ebb54fd4893962538f23644','caa46e83ffe6f4362e9f5c5f000de7017cbd9d2f',0),(15450,1392337782,'b3309cb32c08450b1ebb54fd4893962538f23644','554a972df4d0b076549f1fd8190ed9f4dcff8994',0),(15449,1392337782,'b3309cb32c08450b1ebb54fd4893962538f23644','72b11aaf86cf44bb063d9489614be0f161befb1b',0),(15448,1392337776,'b3309cb32c08450b1ebb54fd4893962538f23644','31d1e370fd0a7e2f9a0e74a5cb62c675a9b8baaf',0),(15447,1392337775,'b3309cb32c08450b1ebb54fd4893962538f23644','6fbef050cc10ff8947dfb22e5977c5646c6816f1',0),(15446,1392337594,'b3309cb32c08450b1ebb54fd4893962538f23644','94753228089c6d45ad2a2579dbc1e67fc924eba7',0),(15445,1392337592,'b3309cb32c08450b1ebb54fd4893962538f23644','75cb106f37d606b42fe8591c9a44487b3574af35',0),(15444,1392337575,'0','4b1bc6a22e9ecd1e1bcd32743829c4cda67bba68',0),(15443,1392337574,'0','a53352a92217c5e33b2735292c3ec9e079267827',0),(15442,1392337574,'0','13d6337c2eb82d1a9cad014fcb49ff625e10138e',0),(15441,1392337574,'0','782cb6af7067406201e8496a56d90ee48050949f',0),(15440,1392337574,'0','2df393ddf4b5b1fb061a060ffc519284ad989bff',0),(15439,1392337571,'0','94a72aa482c7929dba823859cc9ec080aebe40dc',0),(15438,1392337570,'b3309cb32c08450b1ebb54fd4893962538f23644','ff34840c7b4433f9c07412998cd6ae2822866ca6',0),(15437,1392337540,'b3309cb32c08450b1ebb54fd4893962538f23644','372c8d6b1ffa0abed188c802fd18cf43027d40a0',0),(15436,1392337539,'b3309cb32c08450b1ebb54fd4893962538f23644','cb2f5a482403f04be027beb6e8a7dd2f6b3f315c',0),(15435,1392337539,'b3309cb32c08450b1ebb54fd4893962538f23644','57482cbcc22959361a28f3dda8bfb669a22c5931',0),(15434,1392337539,'b3309cb32c08450b1ebb54fd4893962538f23644','f5034073891e679849d16e0a016b3a57bf984085',0),(15433,1392337536,'b3309cb32c08450b1ebb54fd4893962538f23644','82f53ee64da316ab1269e2983c5ab17eaf85bfbe',0),(15432,1392337533,'b3309cb32c08450b1ebb54fd4893962538f23644','625611af5617d2df8d6f7e0e3fb7c37538c5a7ea',0),(15431,1392337533,'b3309cb32c08450b1ebb54fd4893962538f23644','ddf541844337b4af196904c3af1b751d4c2abb0f',0),(15430,1392337533,'b3309cb32c08450b1ebb54fd4893962538f23644','b6e8445c718dd6ec3649bafcbf7c9bc33e132c3b',0),(15429,1392337532,'b3309cb32c08450b1ebb54fd4893962538f23644','930cf34da02f212e3db990fc3f2ddc2422067c13',0),(15428,1392337515,'b3309cb32c08450b1ebb54fd4893962538f23644','fbcd09b03d4afc204ec553f235648620efea8712',0),(15427,1392337515,'b3309cb32c08450b1ebb54fd4893962538f23644','09897efa499252f70ab341cbc14dd8c2eac6ab38',0),(15426,1392337515,'b3309cb32c08450b1ebb54fd4893962538f23644','9422ef5d295d512c1c05d9363228431d07462f46',0),(15425,1392337514,'b3309cb32c08450b1ebb54fd4893962538f23644','b1e29f02f969690f9a3d31c348ced5a9580ce0a6',0),(15424,1392337512,'b3309cb32c08450b1ebb54fd4893962538f23644','763e50a62c75223cb2f26cedd11e742c95240327',0),(15423,1392337506,'b3309cb32c08450b1ebb54fd4893962538f23644','be881c964aa8ff26cb052bcefc3394a877a76b71',0),(15422,1392337506,'b3309cb32c08450b1ebb54fd4893962538f23644','fe534c640ccb197fb9ebf2cd1a687ad414daabcf',0),(15421,1392337506,'b3309cb32c08450b1ebb54fd4893962538f23644','084180636758d7c6b10849d18908a08b31af0f85',0),(15420,1392337487,'b3309cb32c08450b1ebb54fd4893962538f23644','d737ed54cdfc34fa371981b2c5be055475313801',0),(15419,1392337487,'b3309cb32c08450b1ebb54fd4893962538f23644','da90ec620c6d1a1548bc304cb47a39da2b20cb5e',0),(15418,1392337486,'b3309cb32c08450b1ebb54fd4893962538f23644','08a958162787f01f0d3e0135b7e44303b3d584c4',0),(15417,1392337486,'b3309cb32c08450b1ebb54fd4893962538f23644','8ea690599c30559950cbe46c049097d33c2da4b2',0),(15416,1392337483,'b3309cb32c08450b1ebb54fd4893962538f23644','4a34b6bd1a81db0b08d389f56fc44361937db004',0),(15415,1392337483,'b3309cb32c08450b1ebb54fd4893962538f23644','31b708e7100e175463b0822cbd3c22d6f542c401',0),(15414,1392337483,'b3309cb32c08450b1ebb54fd4893962538f23644','431bfb4d41cb07a8758042725a4d71c8dd98f4f0',0),(15413,1392337483,'b3309cb32c08450b1ebb54fd4893962538f23644','fff1629b77b251379eb51960ccb7e89d57ae508d',0),(15412,1392337480,'b3309cb32c08450b1ebb54fd4893962538f23644','217ff8e8dee4489edd7518222d987f7e7016c3b5',0),(15411,1392337480,'b3309cb32c08450b1ebb54fd4893962538f23644','60e114080a37fc029faebb187baa4413631ed290',0),(15410,1392337480,'b3309cb32c08450b1ebb54fd4893962538f23644','a828242866e531ecfc126437926a6b0311f5c577',0),(15409,1392337480,'b3309cb32c08450b1ebb54fd4893962538f23644','afd38128470341f069eeb3fcb9b7cc14b03cde8f',0),(15408,1392337477,'b3309cb32c08450b1ebb54fd4893962538f23644','1cd0997cffcc43f1f6ec8d2aafa4d0b02f2fa6d4',0),(15407,1392337477,'b3309cb32c08450b1ebb54fd4893962538f23644','fd53402ac8e3e4f7c70f3a7875b1492c3faee4b3',0),(15406,1392337477,'b3309cb32c08450b1ebb54fd4893962538f23644','7c287655ef48c018811cfa079f7841672b25cfb4',0),(15405,1392337476,'b3309cb32c08450b1ebb54fd4893962538f23644','734dcfd8fcc6ff7731e4346b88dada51e153ee28',0),(15404,1392337473,'b3309cb32c08450b1ebb54fd4893962538f23644','d5e57f20506fa6811730b2e0f18f31730dae5505',0),(15403,1392337472,'b3309cb32c08450b1ebb54fd4893962538f23644','7f0a5430ac92648cd143a1d8fc251725e1eed420',0),(15402,1392337472,'b3309cb32c08450b1ebb54fd4893962538f23644','f690e6d9e5ab0fdf0e39712db92ddb5c57fdbfac',0),(15401,1392337472,'b3309cb32c08450b1ebb54fd4893962538f23644','eb90f9a62f77d589e39e5c5a1a44e21d8b8094ef',0),(15400,1392337464,'b3309cb32c08450b1ebb54fd4893962538f23644','c859f348e84f6ce3842b125636964e861bb8d739',0),(14973,1392330311,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','c1f5dfd663f772de2d6c3363829f6ae1185e0b2a',0),(14974,1392330318,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','20891a2f1f8afc64a6c2cfe7f96a0d8a85f4bbbf',1),(14975,1392330318,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','47ca40c2cee0c48857b261175257b88d885fb2e4',0),(14976,1392330339,'0','5c498331d2e5f2d9ec9a11199801e4f48f36e987',0),(14977,1392330339,'0','2c652090778d9fa8716df5b58591c11279a99bbb',0),(14978,1392330346,'0','3da1160dff6709f9f832c93a233199457d80245e',0),(14979,1392330346,'0','78acdfb60c1a2456042d1b3248da3c4701be3e5b',0),(14980,1392330346,'0','6cb611fd3bb3fa76d7dd91d946eece23a45c6a00',0),(14981,1392330366,'0','9e9e1f880b6b93a1dc398367a6e9efeb8e79ba39',0),(14982,1392330371,'0','5794a16b9e5587a8b1b3868df847a693d7a138f2',0),(14983,1392330371,'0','48a3cc515b34fa6cb26c2b26c9e15e945a0f83a7',0),(14984,1392330371,'0','75ad150eb9cc3619f4e803a81ba685d8b5072114',0),(14985,1392330377,'0','f4cc4e9c057a191db741c6673e63c8e6cc3d8ba2',0),(14986,1392330377,'0','77598c6f0642a8c63cc8923e1e631853ae5d4d42',0),(14987,1392330378,'0','e31864eec685f7d7741dacfe087bb01aba24c398',0),(14988,1392330378,'0','ba0a0f81e72da72f465c090b67ff46ac773f6d42',0),(14989,1392330378,'0','f4e6181a4707e825d9d39a1b115109dccd4f14a4',0),(14990,1392330378,'0','87b42b40855e5385a7225d5fca3a4d951214e7df',0),(14991,1392330388,'0','7b232ddf8fbd7880fa162817f60e00842a0e49c7',0),(14992,1392330388,'0','b8283f678d4c492082080911a37cbe59bf594db9',0),(14993,1392330388,'0','1e02481bd4cff16877c754b0192c1ba39cd18cac',0),(14994,1392330388,'0','a8c6d365456fc83f9465dea27c6244ec889124e7',0),(14995,1392330407,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','a13ad787fc1fd4820c18fecad1c6bb77c3f95eaf',1),(14996,1392330509,'0','ecd6ec22178edeeeb1027610269a80d98ea26986',0),(14997,1392330510,'0','2cb540fa50769b6c67f7571254aaa02a9257cc6d',0),(14998,1392330510,'0','a9fc6d6a3a5ab23e90258d6800d09fde7576a1d2',0),(14999,1392330510,'0','bfc2c20bc4f126e465a06a28b5fbe97044bb39b7',0),(15000,1392330510,'0','7e27505bd273260925f13a986bee1f592d93b59b',0),(15001,1392330510,'0','dc2a24a0541f908a956847da9f9ec12f4d180d96',0),(15002,1392330510,'0','4052cf49c00aaf756d2e4b92c2e14fc20ff75487',0),(15003,1392330516,'0','887d3651fbb01955f9b9c0b4fb73573b6bc66e42',0),(15004,1392330516,'0','26ca64ef79e04b3a6a949a8f34aedb09f60a053c',0),(15005,1392330516,'0','9c08d67284d98192b819fe672f04837b3055b81d',0),(15006,1392330516,'0','8a1fb05b9c571a30286142e5b45449cda07ec9a2',0),(15007,1392330518,'0','c16a21c14a4263b2f0a1b44d7baf8dac2dde6ca2',0),(15008,1392330518,'0','59e4cf8135dca4c68781743805a697a26e1d70d6',0),(15009,1392330518,'0','1a4fe28ceeb091b598c43c61914344f8f8ccc976',0),(15010,1392330518,'0','e8da7cd986d091dde49bfa365af5edf94e184d9f',0),(15011,1392330569,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b2fedd8d1902869382c022b6d233aee5dcf97a42',0),(15012,1392330587,'286d5acafc712129c0e40c2f0256b5f082dbafc0','7cb0a437c7edac3a064b7fa0433c776af2844db5',1),(15013,1392330589,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b581bddf31e1dc431e0ccfd6b10a4bcd9745b037',0),(15014,1392330736,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','23256b7788732bff45c3b4d1bf1fc32e3f543873',0),(15015,1392330736,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','546a7d72a2757d6d117b9dbeedc657b5d17f2686',0),(15016,1392330736,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','72744c84c535a52c0b9d23919ef9616b60b930ee',0),(15017,1392330739,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b8da98f4b4f114d7e72291a24d99bff4155de67e',1),(15018,1392330741,'286d5acafc712129c0e40c2f0256b5f082dbafc0','8ec2145d2d5feec53c005cb313722101eecddc77',0),(15019,1392330745,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','1ccab15f7f5faea17b8480ddc6aa2c40492ffea0',0),(15020,1392330746,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','04b58f08e6aba7e549e26fc01cceb65c32dd069e',0),(15021,1392330746,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','d9c151fc15dd9471ca76d05469aa76f462b190a7',0),(15022,1392330751,'286d5acafc712129c0e40c2f0256b5f082dbafc0','2f20368149e5759b9338d3606159eb2be1a27ac1',1),(15023,1392330751,'286d5acafc712129c0e40c2f0256b5f082dbafc0','f4d4bc277d4e63bc75f2cbafe063ae881110b36a',0),(15024,1392330752,'286d5acafc712129c0e40c2f0256b5f082dbafc0','ce6e8f56b4365ca83371028d66b64ff478c854d1',0),(15025,1392330753,'286d5acafc712129c0e40c2f0256b5f082dbafc0','500465ff57e5f0b4b4b324e47cec2c35045e96fe',1),(15026,1392330753,'286d5acafc712129c0e40c2f0256b5f082dbafc0','5769bb0f3c939834dac1f6b86f5fdc4bd331af03',1),(15027,1392330758,'286d5acafc712129c0e40c2f0256b5f082dbafc0','d6c8a865d1294a97a611a33019148a26ab8b8e4e',0),(15028,1392330804,'0','e73b312505f07a69fd3b2eda047838cdf31166a1',0),(15029,1392330804,'0','0d8f34bcd90915ba27dd4d6af6d73ba2e1dee665',0),(15030,1392330804,'0','395c416605c76d8eca18d5110a470861b78b397c',0),(15031,1392330809,'0','31c3d9b22aedac563cb99ee8a8f4666b2bee8a0f',0),(15032,1392330810,'0','5b216a46f2046484a40839a644da7109f0949b57',0),(15033,1392330810,'0','5312b3e961980dfd50b4f8625668b7add5b3005d',0),(15034,1392330817,'0','beb48811a7e59085c7eb3de8eac38e5ad683c182',0),(15035,1392330861,'0','018ae95b0474b1b2677f331c13d8e788807f763f',0),(15036,1392330862,'0','a221356cb054b007acfffcc97328c8ea28da39e7',0),(15037,1392330862,'0','b01bf88d284f6d1f8479f8f8e4a1ca81032910d0',0),(15038,1392330862,'0','73595aa23d7a37640f3b9781f43a8923e5e18799',0),(15039,1392330862,'0','56cda9cf622013b187db60b861ed34f0ebcedc11',0),(15040,1392330872,'0','7e998bed58bd4a023514100384b6fa617efe4a13',0),(15041,1392330873,'0','3134fc459da81e31ef16f1c514ffa3110c9fefd6',0),(15042,1392330873,'0','92d4cb4f3153baf96dbe0d66f4ecf70dd380592a',0),(15043,1392330879,'0','73d2d8597101ba11b114fd1b27c12db452872d14',0),(15044,1392330919,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b72ae4494f0f27e8f2c082b623231f7085b7f9b9',0),(15045,1392330922,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c8ab81b2797fd1f4a20f404d07beb42a6ed39774',0),(15046,1392330922,'286d5acafc712129c0e40c2f0256b5f082dbafc0','f0e9687e14cfa9574b5ad93fd514d8a76de42c15',0),(15047,1392330923,'286d5acafc712129c0e40c2f0256b5f082dbafc0','9a69c5c23d30f1ada1823a118345f792ac901564',0),(15048,1392330923,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b72e145c83295ed8d2e58058687c0c0fad90a294',0),(15049,1392331083,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','9b36ec9039b1a30876895aa3b189a08c44b9433c',0),(15050,1392331097,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','2ddb0cca989b11f13eb9747d356b0659226214f6',0),(15051,1392331097,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','8ed52f4a9dc42e5add80f42955ff6c6f67f6d926',0),(15052,1392331098,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','d8f72f9e721d4e980259bacfb7d64d49687268f5',0),(15053,1392331098,'c4e71b37fc62a1eed94ad1169b650eaffbcf2a57','d5141db612d4eefbc42d15bc01b26120ae6b1836',0),(15054,1392331322,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','de83b04f8d4d1b6deccd380a827af559394a6a0b',1),(15055,1392331329,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','f73d3af43d42995a3591b2c6461f793eeb81db3d',0),(15056,1392331332,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','4453f3095b51967e1609b47178a156e8f106905b',0),(15057,1392331339,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','c429469c970aa271b535f7544d24b47e8d6061de',0),(15058,1392331346,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','0e1699e812bcc4bc1eb87796b9709e1db26a65c3',0),(15059,1392331347,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','d17a2741479cf2fac7100f3e517e02ce5b00903a',0),(15060,1392331375,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','c3f072c315ffdb5a512a2cb1b1f3d983a0d86829',0),(15061,1392331376,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','e13f66fb27e29afd2c8465f66327b1d211021096',0),(15062,1392331581,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','4dafad8663aced4609d417dc92c034622065d745',0),(15063,1392331595,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','36b2bffcf22904e68dd0ce468e4b2596c857714e',0),(15064,1392331603,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','8517d146097d9f32ec2614f4a514b1b109b84101',1),(15065,1392331606,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','433571d4f6ea6bb1e41204b8ea31e61fa16b8080',0),(15066,1392331607,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','9979843df3c5a75ff0d554bddfaa0e8f3696dd86',0),(15067,1392331607,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','9cee5ede3bad53e0e04a9b64b0351f1b16830145',0),(15068,1392331614,'286d5acafc712129c0e40c2f0256b5f082dbafc0','6d3d5543481cbcfe646e723e58b1e8c4418b3293',1),(15069,1392331614,'286d5acafc712129c0e40c2f0256b5f082dbafc0','4ded997df2a8a177c0824594d312a76834a42a55',0),(15070,1392331614,'286d5acafc712129c0e40c2f0256b5f082dbafc0','555f705efaf0e89bebfa5a2c9102029cc1128e68',0),(15071,1392331628,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','22a7820771b7c6846bf88ae2dd4fccec0d7fc843',1),(15072,1392331635,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','da6aab87f14d0693e1c51232ad5f3565117a8a25',1),(15073,1392331636,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','272672bd1291560166df4be5deedc0b10da556a3',1),(15074,1392331638,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','e03c66fed4fbfca7e78d339212045e768efc2b4d',0),(15075,1392331638,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','1d20ca154200c584e8369c5839cb7b3af5ae2472',1),(15076,1392331644,'286d5acafc712129c0e40c2f0256b5f082dbafc0','02cdbacd18106960a0881b04f9d9db910b5f52d4',1),(15077,1392331702,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','443d6ff54cbd4f17cb52b0f1124399ea971b6d30',0),(15078,1392331702,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','5b8c141bc0c45c6337b6444233e0413a407e0389',0),(15079,1392331715,'286d5acafc712129c0e40c2f0256b5f082dbafc0','4075a7704e0553486bddd0fbdb935bab051599a8',0),(15080,1392331716,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','4296a82db200d22bf3f4c160c34389b760e9b2ac',0),(15081,1392331716,'286d5acafc712129c0e40c2f0256b5f082dbafc0','5de76775ef4d16989a5f889492a8d2729f4b5d72',0),(15082,1392331716,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c61d064eced13aa2cfaf070e3d1bc1eb82190563',0),(15083,1392331716,'286d5acafc712129c0e40c2f0256b5f082dbafc0','aec6b0720f3d0b2a95c1d2e2059dd31a198ad63a',0),(15084,1392331717,'286d5acafc712129c0e40c2f0256b5f082dbafc0','800525ddb6812cc0c65c1d9e1c24ba7b1e24b902',0),(15085,1392331718,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','c7c264573b1a3c67dc93867188f9d8c501945ccb',0),(15086,1392331887,'286d5acafc712129c0e40c2f0256b5f082dbafc0','6c5e79d4475c0e1ef25c0f40f6cfca527450897e',0),(15087,1392331889,'286d5acafc712129c0e40c2f0256b5f082dbafc0','febe419de822818c438ec7d248204cb6e7bba044',0),(15088,1392331889,'286d5acafc712129c0e40c2f0256b5f082dbafc0','987ac6c0315bd39e7d2b32acd3bae3965a789e76',0),(15089,1392331889,'286d5acafc712129c0e40c2f0256b5f082dbafc0','306120a2fbed2dfb3c17b13dbdcd8fcf6fcd827d',0),(15090,1392331890,'286d5acafc712129c0e40c2f0256b5f082dbafc0','a5ec1a160b8c8f909fcf64ff47f5c392c1059788',0),(15091,1392332051,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b45bb4f04f7339e567d35feb2874518365b4c6ed',0),(15092,1392332071,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','9e36fcd80f2129f5ae3271ca66057bd27d3d5f14',0),(15093,1392332075,'286d5acafc712129c0e40c2f0256b5f082dbafc0','7811b9852b06c29f8af452482e28e9a82f133a30',0),(15094,1392332076,'286d5acafc712129c0e40c2f0256b5f082dbafc0','adc336d7021eaf8b062fb0185b4cf9ff3d679a2f',0),(15095,1392332076,'286d5acafc712129c0e40c2f0256b5f082dbafc0','a3f7ad1b36d35e7818a26bd030af4e399508c9f9',0),(15096,1392332076,'286d5acafc712129c0e40c2f0256b5f082dbafc0','404fdc453569d4d385189068e417e4f6b445ad0b',0),(15097,1392332081,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','136b62102f621afe8d9f73452c4b504f77fc1613',1),(15098,1392332082,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','5f1dd18594f080a75f69926acb120d802dcc4bbb',0),(15099,1392332083,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','d124487e829c51e86c0d781a571c08ceae06ef87',0),(15100,1392332083,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','178a9eb6f175d4d4f0651fa51ca66283a7e95848',0),(15101,1392332165,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c0ba4f8dce1f443f61680d38be1e73c68b6b3484',0),(15102,1392332165,'286d5acafc712129c0e40c2f0256b5f082dbafc0','235f2b6f8823bd75fe57b82d0681baef720473e5',0),(15103,1392332166,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c08d89cef8f06168fe39fe2f50f3ea98a4025e56',0),(15104,1392332293,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','248ba43bdb9207f84afd082198472d31030244d0',1),(15105,1392332310,'286d5acafc712129c0e40c2f0256b5f082dbafc0','365a4cdba383c361a183132813d6b6c41db11c13',0),(15106,1392332315,'286d5acafc712129c0e40c2f0256b5f082dbafc0','083f63ac52a3e3eb37e09c01a0fab6ac011e3b46',0),(15107,1392332316,'286d5acafc712129c0e40c2f0256b5f082dbafc0','bc351a021fde0b0d257c589d7c759644d9d280cd',0),(15108,1392332316,'286d5acafc712129c0e40c2f0256b5f082dbafc0','87e68c93ccb4608d9a2e20d8b6b3c21bc0bde513',0),(15109,1392332316,'286d5acafc712129c0e40c2f0256b5f082dbafc0','0d48b037da0383283f1f9e1e1450fff4ecd00869',0),(15110,1392332320,'286d5acafc712129c0e40c2f0256b5f082dbafc0','bc2309c96ce0d439fa1d913925ac5e51aaf75ca5',0),(15111,1392332327,'286d5acafc712129c0e40c2f0256b5f082dbafc0','7c88107102e2ef5c1c3adec07bf1787d1e61d307',0),(15112,1392332327,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b3b4d6f9faaa25ef8ee2908089ed63b8c6b850c9',0),(15113,1392332327,'286d5acafc712129c0e40c2f0256b5f082dbafc0','04e88223da2fad950b7cf4c5c88ac78584a18957',0),(15114,1392332327,'286d5acafc712129c0e40c2f0256b5f082dbafc0','d1053ddb50b65a07a3be7fb312431be31a08e7ce',0),(15115,1392332354,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','fdb7d6de0c2c824694f5b556c2d6ca4b1972b2a0',1),(15116,1392332419,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','1c760c4aed3fac4bde923d5da8b6cde33793363c',1),(15117,1392332511,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','eff59372a791330d2a6f9ce83a171ba4e9477274',0),(15118,1392332512,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','46c8d945cd97527d1fed4db44da44b6edaec922d',0),(15119,1392332517,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','d1cdc3b0645122c1e985c46687d2153d6ecd3f16',0),(15120,1392332520,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','e47faec0ac864eea6574a377e7a21ae8bc92fba7',0),(15121,1392332716,'286d5acafc712129c0e40c2f0256b5f082dbafc0','8a463c4ad3b3d6b6a202d93ef02b2a69ec9ad977',0),(15122,1392332717,'286d5acafc712129c0e40c2f0256b5f082dbafc0','a31674a2bfe5382cfb321ff19dd2fa5bd384b62d',0),(15123,1392332718,'286d5acafc712129c0e40c2f0256b5f082dbafc0','080e95679c8cadde2eba4e1cdbdc200738cc252a',0),(15124,1392332718,'286d5acafc712129c0e40c2f0256b5f082dbafc0','bb78497cd99c34ad1c2dfa421d3ac55065c0390a',0),(15125,1392332718,'286d5acafc712129c0e40c2f0256b5f082dbafc0','f1477c7ddf3e780e245b8c6941d9de08b56e846d',0),(15126,1392332819,'286d5acafc712129c0e40c2f0256b5f082dbafc0','0115902d4e2fc91237def258411f7760a00838dd',0),(15127,1392332823,'286d5acafc712129c0e40c2f0256b5f082dbafc0','5f6720e03673669121a23cc7c69265a394ff1771',0),(15128,1392332829,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c2b57e2ef61109a7d92686f959c3d68b6f8dadf4',0),(15129,1392332829,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b8a784fb081fa8799fbbb4f023f20152ccca11eb',0),(15130,1392332829,'286d5acafc712129c0e40c2f0256b5f082dbafc0','4ce0503fa511508442498519ffc32d0ec031f071',0),(15131,1392332830,'286d5acafc712129c0e40c2f0256b5f082dbafc0','fc57d9501d54e117ad6827e6603cd27a8394f451',0),(15132,1392332839,'286d5acafc712129c0e40c2f0256b5f082dbafc0','dc6ffdc850baeee4488213c28e186313197867f9',0),(15133,1392332839,'286d5acafc712129c0e40c2f0256b5f082dbafc0','60c45808b069b474a6bd9e9a3e67364304784e3a',0),(15134,1392332839,'286d5acafc712129c0e40c2f0256b5f082dbafc0','e3f825e3cdabace405677ba62522d436d7350702',0),(15135,1392332839,'286d5acafc712129c0e40c2f0256b5f082dbafc0','19df85e48aaf9bcaa37e27534aba8043463f20f2',0),(15136,1392332885,'286d5acafc712129c0e40c2f0256b5f082dbafc0','ab2f21f614afe9237facf6169f8705a53317eaba',1),(15137,1392332887,'286d5acafc712129c0e40c2f0256b5f082dbafc0','acf3f5186dc1647e11400a5b89dc95122a3e2cb7',0),(15138,1392333071,'286d5acafc712129c0e40c2f0256b5f082dbafc0','6165b309433d68ed37387e826569cb93b3c50870',0),(15139,1392333071,'286d5acafc712129c0e40c2f0256b5f082dbafc0','ba66fda25697682eca333480fdaebbec6e0257ec',0),(15140,1392333071,'286d5acafc712129c0e40c2f0256b5f082dbafc0','a77ef78fc968ff1a4d1859ff52e6dd3bb323f49d',0),(15141,1392333071,'286d5acafc712129c0e40c2f0256b5f082dbafc0','3f5ed5c7bbda803609689151af5b6f700bab61d8',0),(15142,1392333081,'286d5acafc712129c0e40c2f0256b5f082dbafc0','46ede327ff2e3033cd4754f3b3cfcc72a0a0a62a',0),(15143,1392333087,'286d5acafc712129c0e40c2f0256b5f082dbafc0','043c2703441ea07e82e44b256f6b1b3768aaafa1',0),(15144,1392333087,'286d5acafc712129c0e40c2f0256b5f082dbafc0','fe51d74fb5e27df7ff2a6e5995020ddf48b988ae',0),(15145,1392333087,'286d5acafc712129c0e40c2f0256b5f082dbafc0','25e1160466136d0ffa12c7a0337839d3ccbd87d0',0),(15146,1392333087,'286d5acafc712129c0e40c2f0256b5f082dbafc0','17ad2f976393a0e42aebf3d5f93f2b11c3d37867',0),(15147,1392333092,'286d5acafc712129c0e40c2f0256b5f082dbafc0','0b53e7f773083f7e002addf34528e385dd904a1d',0),(15148,1392333097,'286d5acafc712129c0e40c2f0256b5f082dbafc0','59ad66f21eb655c8e8f8d8a50326eb25796f8b72',0),(15149,1392333098,'286d5acafc712129c0e40c2f0256b5f082dbafc0','950aa498571b1873dbac2117a4bc8c3c9d9b7b40',0),(15150,1392333099,'286d5acafc712129c0e40c2f0256b5f082dbafc0','f611f58b2e109dde46bc45ab2233aa4d4496d79b',0),(15151,1392333099,'286d5acafc712129c0e40c2f0256b5f082dbafc0','0748d962ca6794b0eb074fcc1465e8eaaeae5bd2',0),(15152,1392333099,'286d5acafc712129c0e40c2f0256b5f082dbafc0','19ad23e74b0f60c4cfddbe660ebefb3427c4bddd',0),(15153,1392333141,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','90491faa9f6c9d69d4f98e789fd168e44616e014',0),(15154,1392333144,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','47414769cd2500a532561c19d1de9b0322867c80',0),(15155,1392333175,'286d5acafc712129c0e40c2f0256b5f082dbafc0','f05946b9fc919ee6cf56f8e38995d6279b8c9495',0),(15156,1392333177,'286d5acafc712129c0e40c2f0256b5f082dbafc0','16ad8ece9392d09cd695a9b95361a053f6464432',0),(15157,1392333177,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c9cdd2b218671694620f68587ec7c2e89d42ad05',0),(15158,1392333177,'286d5acafc712129c0e40c2f0256b5f082dbafc0','6c883b82806fe2755e0d5f9d4e2f017c5f7403de',0),(15159,1392333177,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b2efa208a9d11e436d667e79d184013477f0d0de',0),(15160,1392333329,'286d5acafc712129c0e40c2f0256b5f082dbafc0','0f0c98198016d96a4da3334fe5d644ff8293d4fd',1),(15161,1392333344,'286d5acafc712129c0e40c2f0256b5f082dbafc0','616c89781ce8c67c21d93453a1f4d16a13b6f8cb',0),(15162,1392333345,'286d5acafc712129c0e40c2f0256b5f082dbafc0','c6db78634099fb5149f62cdfa542788e0084836e',1),(15163,1392333345,'286d5acafc712129c0e40c2f0256b5f082dbafc0','98762240343e4ea5e7c3713196e2e0e209f68e60',0),(15164,1392333345,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b8ad7cd438e9d5af70dd8c907f9f1a2b8a3770ee',0),(15165,1392333355,'286d5acafc712129c0e40c2f0256b5f082dbafc0','ff2b6fb64d9cb2c9f204401d23fe08ae0f5808a8',1),(15166,1392333357,'286d5acafc712129c0e40c2f0256b5f082dbafc0','d97971629089fb7e9357f560210e5eb08b521545',1),(15167,1392333359,'286d5acafc712129c0e40c2f0256b5f082dbafc0','8147bfcdefd7511dc818a23b793ce66664ad82cb',1),(15168,1392333362,'286d5acafc712129c0e40c2f0256b5f082dbafc0','b4d7f9272c146db9d0584295a7eb414ff4d67d62',0),(15169,1392333365,'286d5acafc712129c0e40c2f0256b5f082dbafc0','24fcc736fbc04f7a7f4e7b764a66a09d2c098d2c',1),(15170,1392333375,'286d5acafc712129c0e40c2f0256b5f082dbafc0','404ecf399182122ec8c61ec6a33dea9d60028651',0),(15171,1392333375,'286d5acafc712129c0e40c2f0256b5f082dbafc0','a0f8901cbad11a3720fce2fcb5d5cfe8c258ade8',1),(15172,1392333376,'286d5acafc712129c0e40c2f0256b5f082dbafc0','2d425f40f9654f1c523f5c23f24a101a8c24928a',0),(15173,1392333376,'286d5acafc712129c0e40c2f0256b5f082dbafc0','6528daea71a7c266bb28d6e5eb88a977b77135c1',0),(15174,1392333384,'286d5acafc712129c0e40c2f0256b5f082dbafc0','7e5c9332c23c8a100a91774f0c4bfd2682f56985',0),(15175,1392333386,'286d5acafc712129c0e40c2f0256b5f082dbafc0','e75a5f4a379cf74958a1bae220b435ddcfb289fd',1),(15176,1392333386,'286d5acafc712129c0e40c2f0256b5f082dbafc0','85c677a231ee07f2f3ac8219a4c145ec30399123',0),(15177,1392333386,'286d5acafc712129c0e40c2f0256b5f082dbafc0','22e4b9e2e4234fbd706bf4f46327e6575b1c31af',0),(15178,1392333386,'286d5acafc712129c0e40c2f0256b5f082dbafc0','182d7be35fd7146d2a991f779ca5d8157c5483ae',0),(15179,1392333396,'286d5acafc712129c0e40c2f0256b5f082dbafc0','d3936ae51fc6174fb670d6c6ad3c30810caa9aee',1),(15180,1392333400,'286d5acafc712129c0e40c2f0256b5f082dbafc0','f2118f9dcc269f31e0b58024f0a72b88e1157327',1),(15181,1392333402,'286d5acafc712129c0e40c2f0256b5f082dbafc0','2c18e22fd6ba9c654fe568df3beb67abc475e4cb',0),(15182,1392333402,'286d5acafc712129c0e40c2f0256b5f082dbafc0','dd1dd4e9fcdab50d7841894bf230fb4a07e7b83a',0),(15183,1392333410,'286d5acafc712129c0e40c2f0256b5f082dbafc0','db9d14cc5ac873f263df67df0387f8bf614cb529',1),(15184,1392333414,'286d5acafc712129c0e40c2f0256b5f082dbafc0','455f6739226cf40cb2ec49a3d300834b30e904f8',1),(15185,1392333415,'286d5acafc712129c0e40c2f0256b5f082dbafc0','782b5305e4a3bd9545bac2a59bed91b011c997cf',1),(15186,1392333415,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','af0b5afa8171e320ae53ad0e028b52c164a60f71',1),(15187,1392333417,'286d5acafc712129c0e40c2f0256b5f082dbafc0','26541e7f55b306ead98f4865b2016b49ac6ba3bf',0),(15188,1392333453,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','1b258ed1ae991f6da1b7a685ff7804f9bbc4101b',1),(15189,1392333457,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','55b7ff6306a3f9d658b8a4799a98341e0e8d6712',0),(15190,1392333457,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','263a995372fa298e4499b720fc800e7533e83690',0),(15191,1392333465,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','534f076ced13a4a9c64d22101dbcd1c24ad29bdb',0),(15192,1392333518,'fbed55c5b05ce3bcc7e8c4b70510b4b292a98d9d','1aef5125eb617c76919d550fd17c80cd7614f8c6',0),(15193,1392333750,'28bc306de20912be3ebee296aafe503c87a4d0af','f21f64be3304e3783a0ca2b13845c5a1d3b26897',0),(15194,1392333750,'28bc306de20912be3ebee296aafe503c87a4d0af','d64742d36bf4a3ac7b9ad37550ef27a996101d77',0),(15195,1392333751,'28bc306de20912be3ebee296aafe503c87a4d0af','94cf2c8f5b1abfbdd8e7796acbeb5197680e00c5',0),(15196,1392334088,'28bc306de20912be3ebee296aafe503c87a4d0af','53df183d3f0f3bf301d1c48fcc7f1f86841f384a',0),(15197,1392334091,'28bc306de20912be3ebee296aafe503c87a4d0af','78ff1ac4f97e4613055c48a6b9a9597489528e41',0),(15198,1392334091,'28bc306de20912be3ebee296aafe503c87a4d0af','d090d49de49f7ec5d273b5ceb071e66fa07ad071',0),(15199,1392334091,'28bc306de20912be3ebee296aafe503c87a4d0af','f7bd33780c64a14bd1dc539da63cca5c01dbfb29',0),(15200,1392334091,'28bc306de20912be3ebee296aafe503c87a4d0af','a5cd377940b4d73605b4e06551a9278f1e717eba',0),(15201,1392334237,'28bc306de20912be3ebee296aafe503c87a4d0af','6cd46d71708f47ed76d3e2c5d52d1138a4c38baa',0),(15202,1392334239,'28bc306de20912be3ebee296aafe503c87a4d0af','9a2415373bb17565c217b8396b93d8526c5881b1',0),(15203,1392334239,'28bc306de20912be3ebee296aafe503c87a4d0af','2c0a264e86d3b19bda0ff8c75590b5f25d7e3590',0),(15204,1392334239,'28bc306de20912be3ebee296aafe503c87a4d0af','efc8845fb8d82973c48b4f4359c0de2f12fc6858',0),(15205,1392334239,'28bc306de20912be3ebee296aafe503c87a4d0af','6da5c96d53b6418d23bca4bc97fee0912ac1232f',0),(15206,1392334450,'28bc306de20912be3ebee296aafe503c87a4d0af','7276956f39663798973ebdb882d0b21620833ac5',0),(15207,1392334451,'28bc306de20912be3ebee296aafe503c87a4d0af','043e4adc520ee7d75596d87825d28c3ad5e1525c',0),(15208,1392334452,'28bc306de20912be3ebee296aafe503c87a4d0af','7ede23dcf6d34c168174f73826bde573e3af2861',0),(15209,1392334452,'28bc306de20912be3ebee296aafe503c87a4d0af','8f16f3ac111737c3ba9a652e804b6a679ac5b8d7',0),(15210,1392334452,'28bc306de20912be3ebee296aafe503c87a4d0af','799143a4d635ae3b60c164261d15d8be8b8722e0',0),(15211,1392334506,'0','126d008282d88197973966154110d2b85280ff27',0),(15212,1392334506,'0','e2ee539f8f2632e0ba11793dddac7f2840dafbc9',1),(15213,1392334513,'28bc306de20912be3ebee296aafe503c87a4d0af','e3c1c2317c321bd842766b02c50df7aba8650d20',0),(15214,1392334513,'28bc306de20912be3ebee296aafe503c87a4d0af','49352eec3e166e0d5f51aa0670a2bafd76f505d0',0),(15215,1392334513,'28bc306de20912be3ebee296aafe503c87a4d0af','f3828e579fe1948dade7af41da9d1a50d54e7bd7',0),(15216,1392334513,'28bc306de20912be3ebee296aafe503c87a4d0af','2022c1b2127502c121700c007b06b8b80ba3a19d',0),(15217,1392334514,'28bc306de20912be3ebee296aafe503c87a4d0af','1191302621a73682d813f65c70e2467f970ea49d',0),(15218,1392334514,'28bc306de20912be3ebee296aafe503c87a4d0af','e1238576e4a99d979d014c81369ea50794bd7787',0),(15219,1392334516,'0','f17d4253f22abbe96e3a74b20715d7e1a73d829c',0),(15220,1392334516,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','f0b1866824cd8cddfbe96815acbbec8e035fe612',0),(15221,1392334550,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','611788d70b7ee554e67b90d0ce9dc9704d8bca01',0),(15222,1392334551,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','7f04b88e71db958d7d6aa382fc5d7e252e8c4bc4',0),(15223,1392334551,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','f06e56ef1fae05277c73f4d444e274dadc0746a0',0),(15224,1392334551,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','af55cb90331782d87e844fc79066d56003e853ee',0),(15225,1392334613,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','781e53097acc3d41d98a20a6c71ab045fcf9dbca',1),(15226,1392334625,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','180e0d35d0638160db876021984fa501fed6eb3e',0),(15227,1392334632,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','34b203a3f855dafea9e883a2b5718d2819782f90',0),(15228,1392334632,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','f7adbfa95602e1972669c70db01859ba2b238dd5',0),(15229,1392334632,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','24bde80ec9135fbcd28cded531ffe876f3f47f04',0),(15230,1392334632,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','e4df97549507b9de8e2a6e789d90040aa09b7254',0),(15231,1392334639,'28bc306de20912be3ebee296aafe503c87a4d0af','88052897416b8c508bf20d4db4ed82283c2035dd',0),(15232,1392334639,'28bc306de20912be3ebee296aafe503c87a4d0af','a9b8357f570764136a10585a40cf5fe013b69eef',0),(15233,1392334639,'28bc306de20912be3ebee296aafe503c87a4d0af','6890eaee7d6d3369ed13801f0a71ab827c0624b8',0),(15234,1392334639,'28bc306de20912be3ebee296aafe503c87a4d0af','9ea203d0704abb5523e85ffe46b73719a6646e25',0),(15235,1392334741,'0','5d1faa0bb85032b23e3f5b4001729e0bc8526683',0),(15236,1392334741,'0','fe1b09361fdf98df92201d250ae415752fa02a4c',0),(15237,1392334741,'0','d804127e96d5d0e1916b353356faa856ef0441b6',1),(15238,1392334742,'0','3609cab0864a7b09c5215c013f722a0ac4f8572a',0),(15239,1392334757,'0','a87c5dd02665615febefdb2e2d8faa246936211e',0),(15240,1392334757,'0','cff5989338e1cde1111eefda3651ffe26b07f16a',0),(15241,1392334757,'0','22360d335b46969c4724a2a56ee59da5addb6ebf',0),(15242,1392334770,'28bc306de20912be3ebee296aafe503c87a4d0af','0da0fbd0e0f640b4d23676d2c74795ca5e729b30',0),(15243,1392334770,'28bc306de20912be3ebee296aafe503c87a4d0af','52ece8908d482711348f2992aed5f49966c35768',0),(15244,1392334771,'28bc306de20912be3ebee296aafe503c87a4d0af','d2e262bbbca0763e84e31c5f0839c29254d045b6',0),(15245,1392334771,'28bc306de20912be3ebee296aafe503c87a4d0af','695e3e833a6bb20c2f6bc93ad729e5ae908e1921',0),(15246,1392334780,'0','aca631c33205803a0a6b7a1998300a906cf254c9',0),(15247,1392334780,'b3309cb32c08450b1ebb54fd4893962538f23644','5fd78a5b4e52b45be676d841ff918c3f656a827f',0),(15248,1392334789,'b3309cb32c08450b1ebb54fd4893962538f23644','70eece7d6bc80285e9a4b940bc45a67902e20289',0),(15249,1392334790,'b3309cb32c08450b1ebb54fd4893962538f23644','84a52f2940bcb47421eefcf022c90b88f4e547fd',0),(15250,1392334791,'b3309cb32c08450b1ebb54fd4893962538f23644','9d7082daf96b65f45306c84d54f32e120f0bb551',0),(15251,1392334791,'b3309cb32c08450b1ebb54fd4893962538f23644','a7ddc15b2ef1e84f44554f3d9c6150fb09e60321',0),(15252,1392334792,'b3309cb32c08450b1ebb54fd4893962538f23644','909ca59e8e16afbf9456ceda5469c243fe2f970d',0),(15253,1392334860,'28bc306de20912be3ebee296aafe503c87a4d0af','2af702ad1ecf13da00816272fa6a82344ad60a48',0),(15254,1392334860,'28bc306de20912be3ebee296aafe503c87a4d0af','925d53212f24b96f31a4774a831b01069bcb95df',0),(15255,1392334860,'28bc306de20912be3ebee296aafe503c87a4d0af','a2852e0c164d82d2e948586e126e3f920ffaf27e',0),(15256,1392334902,'28bc306de20912be3ebee296aafe503c87a4d0af','6b009f51535bedc9b94d29daf72dce1136c4291f',0),(15257,1392334902,'28bc306de20912be3ebee296aafe503c87a4d0af','95fa9f4ebb68fd3985a87082e1caf57134a62b5b',0),(15258,1392334902,'28bc306de20912be3ebee296aafe503c87a4d0af','39e0ade14a43f3c896f8ad80a2ac39b8c47a5467',0),(15259,1392334990,'28bc306de20912be3ebee296aafe503c87a4d0af','894d144d39697eb6fec94c65db20b7c8459881af',0),(15260,1392335103,'b3309cb32c08450b1ebb54fd4893962538f23644','b2c299e3b68795c340b5e722d1c70d0316f47494',0),(15261,1392335105,'b3309cb32c08450b1ebb54fd4893962538f23644','ba99ff99161b8194acabb42749aaefeede93b7f6',0),(15262,1392335106,'b3309cb32c08450b1ebb54fd4893962538f23644','3a61d4c1580890c5765559cd2257423de4e361d9',0),(15263,1392335106,'b3309cb32c08450b1ebb54fd4893962538f23644','839be17cd7a5ea7bc50c01ed03228524a305f0dd',0),(15264,1392335106,'b3309cb32c08450b1ebb54fd4893962538f23644','e7db6bc2dce9f2dcade36e2478315a9c9c9bb267',0),(15265,1392335110,'b3309cb32c08450b1ebb54fd4893962538f23644','b5b6661582ac185185bd322a72e4c220521f470c',1),(15266,1392335111,'b3309cb32c08450b1ebb54fd4893962538f23644','9cc37e1c8ed0d1d2c042d2e6b5a52bebfcfc28c4',0),(15267,1392335111,'b3309cb32c08450b1ebb54fd4893962538f23644','0b4e2fbae7161cac40e104fffddc6ac166d3390e',0),(15268,1392335142,'b3309cb32c08450b1ebb54fd4893962538f23644','6930e837cca9754c4344d1350bac66e66e23c866',0),(15269,1392335145,'b3309cb32c08450b1ebb54fd4893962538f23644','4651cfae0b26246debdf6a1c29d5c26b9c84eac2',0),(15270,1392335145,'b3309cb32c08450b1ebb54fd4893962538f23644','c8f118eb3f38d6dfdaafa8b29ecccdea43e5daa4',0),(15271,1392335146,'b3309cb32c08450b1ebb54fd4893962538f23644','cd240e4055a441e6590813a7eb2234546a763678',0),(15272,1392335146,'b3309cb32c08450b1ebb54fd4893962538f23644','24b4c6b7900d7da2753b6bdcf31deca02b6f5b4d',0),(15273,1392335153,'28bc306de20912be3ebee296aafe503c87a4d0af','1a92e4198e41302f15e1f29d656ef14b006591db',0),(15274,1392335153,'28bc306de20912be3ebee296aafe503c87a4d0af','9896c83044b5ba766847784183aca7d8222f13da',0),(15275,1392335154,'28bc306de20912be3ebee296aafe503c87a4d0af','91487aac70ee28f6f2d7513a9315519a2989b9d1',0),(15276,1392335154,'28bc306de20912be3ebee296aafe503c87a4d0af','80b1a32705c685d6af87137bb8b48e3a59b37828',0),(15277,1392335253,'b3309cb32c08450b1ebb54fd4893962538f23644','e6a159bf1c858e65d4b74ca30c0d24cedd73b26f',0),(15278,1392335254,'b3309cb32c08450b1ebb54fd4893962538f23644','7783f07686db10c13f7e58177b7852edff856c75',0),(15279,1392335254,'b3309cb32c08450b1ebb54fd4893962538f23644','cedaa8f1bb201386f01da5af9c59639d628122ab',0),(15280,1392335313,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','44e9c1169b31692da882177e55366e6e7470ec39',0),(15281,1392335319,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','ffceb36d9a9b836a6df535f5c0af77ef9d63bd66',0),(15282,1392335320,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','65c03af4cf3281a933bc4ce71875aae2d07871e0',0),(15283,1392335320,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','bd11d5e704022a1b0bab875270ee9b3ddf029623',0),(15284,1392335320,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','2bbc6a0e02b60a55e4b193c4efd516c9135cb96e',0),(15285,1392335347,'b3309cb32c08450b1ebb54fd4893962538f23644','19d4b959c7c26718b62c0effc29ca198151d2321',0),(15286,1392335352,'b3309cb32c08450b1ebb54fd4893962538f23644','b40b33bde486386efc9b0cf6a3b3cbb0c5c483ef',0),(15287,1392335352,'b3309cb32c08450b1ebb54fd4893962538f23644','7f9e5a15d2c9836ddf830e4c3708acda65ec07a7',0),(15288,1392335352,'b3309cb32c08450b1ebb54fd4893962538f23644','9fc07df8c865fa1bd95a60839adfc47f26c38f7a',1),(15289,1392335362,'b3309cb32c08450b1ebb54fd4893962538f23644','5a63cbb938994b13180d01a0e1ae859d6e9cfd02',0),(15290,1392335368,'b3309cb32c08450b1ebb54fd4893962538f23644','b5b82df34b8b5a70c3f3014eca55bbd3bfca02fe',1),(15291,1392335368,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','4bc03f1a4f6ab3a06cf26a08ad29c76af0e76a94',0),(15292,1392335369,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','e398e464ab49eeed8918dca9172dfc8fef341351',0),(15293,1392335369,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','05901c2bb1b6ca9ff0585237bd2fc9326c4b1195',0),(15294,1392335376,'b3309cb32c08450b1ebb54fd4893962538f23644','afeee73b9be156ec0b60180cc142cab1f2ab23f6',1),(15295,1392335379,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','8efe3689af6faad0a5695c3faaadcdbbdc6e8b36',0),(15296,1392335380,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','62a53d22c42ee2b03bd024abfc8d9dc2198e9335',0),(15297,1392335380,'b3309cb32c08450b1ebb54fd4893962538f23644','dd54ad056d2825120c8c7538695759a00d226a62',1),(15298,1392335386,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','39dddebbfc4ae922de87eb13182568e1a5205695',0),(15299,1392335386,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','d04e7c21cb1170f22625a586bd91d4181a4b27a0',0),(15300,1392335386,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','2cea0588e82c8ee219f8be84f894c4c00b242130',0),(15301,1392335390,'b3309cb32c08450b1ebb54fd4893962538f23644','210294c0c6f67371a11e4be55de1bd149de92c8c',1),(15302,1392335392,'b3309cb32c08450b1ebb54fd4893962538f23644','7abb95e816ed402a647e06e5a8abf3dbbaa10e88',0),(15303,1392335399,'b3309cb32c08450b1ebb54fd4893962538f23644','fc277c8307c2960189563b15c1679babcbbb1a04',0),(15304,1392335448,'b3309cb32c08450b1ebb54fd4893962538f23644','02cc204925c914dd2f648684c5e13b018e0372a6',0),(15305,1392335513,'b3309cb32c08450b1ebb54fd4893962538f23644','24dafdb02dc81caee46154bd0bcae6d15151bc95',0),(15306,1392335517,'b3309cb32c08450b1ebb54fd4893962538f23644','bdb83025060d6b65c3bc4a8e6a7940b48fd62f67',0),(15307,1392335522,'b3309cb32c08450b1ebb54fd4893962538f23644','132bdc0624dfbe00b476fece607db8f7eaa2263f',0),(15308,1392335536,'b3309cb32c08450b1ebb54fd4893962538f23644','2128225e4c1a894d9daeab8ceac8e1a63aaae5d8',0),(15309,1392335539,'b3309cb32c08450b1ebb54fd4893962538f23644','e631991d3b0e39ee6f79c9fd36ff5811175acb5f',0),(15310,1392335544,'b3309cb32c08450b1ebb54fd4893962538f23644','f92cbe624ea8126abfe88e86d378a01a932a23e5',0),(15311,1392335545,'b3309cb32c08450b1ebb54fd4893962538f23644','c8778127e1ecb9199897e3ed833cd14bdf6f52ac',0),(15312,1392335545,'b3309cb32c08450b1ebb54fd4893962538f23644','b941238651abc7c298ca437f1b75a7bb5331baa6',0),(15313,1392335557,'28bc306de20912be3ebee296aafe503c87a4d0af','5b23e1514fc110bbe4f76086b39116dee1762ccf',0),(15314,1392335557,'28bc306de20912be3ebee296aafe503c87a4d0af','048b5c7be260b75d9faa8bee9e02d37512990629',0),(15315,1392335557,'28bc306de20912be3ebee296aafe503c87a4d0af','6fcfcb0004002d6602fea31ecabf42afcd159208',0),(15316,1392335558,'28bc306de20912be3ebee296aafe503c87a4d0af','5dae671008b12513dc3071a9454654c50950afac',0),(15317,1392335708,'b3309cb32c08450b1ebb54fd4893962538f23644','efeac8afed0e4a432966ded2de520bd029b1d71b',1),(15318,1392335710,'b3309cb32c08450b1ebb54fd4893962538f23644','9c146f4b241681fe97bef826c53746512cfbb373',1),(15319,1392335714,'b3309cb32c08450b1ebb54fd4893962538f23644','4a43640d9a263289d8f7d0831aa114bd46727cf7',0),(15320,1392335729,'b3309cb32c08450b1ebb54fd4893962538f23644','426aff909376e9f78467a47c1a9730b6fed51ba1',0),(15321,1392335752,'b3309cb32c08450b1ebb54fd4893962538f23644','8503ff5e3722f9e4be73519a9ed95586856b50de',0),(15322,1392335754,'b3309cb32c08450b1ebb54fd4893962538f23644','4742078a31bfb55c37cc529c6881f58edcf2116c',0),(15323,1392335754,'b3309cb32c08450b1ebb54fd4893962538f23644','b6bf1c63f5b91bf1f60740902deaa024fbae9d63',0),(15324,1392335755,'b3309cb32c08450b1ebb54fd4893962538f23644','6cc34f60e8e808b8debbaff2b75b56d78cd24a25',0),(15325,1392335755,'b3309cb32c08450b1ebb54fd4893962538f23644','4f9bf6e63c3cead5bb27dd2ff1df3290168e6ca4',0),(15326,1392335900,'b3309cb32c08450b1ebb54fd4893962538f23644','a17f5c37c26eca1311eb93b07ecc1f099838a9f1',0),(15327,1392336005,'b3309cb32c08450b1ebb54fd4893962538f23644','775a17705c1ef8adad590faec61569cc0faaddbb',0),(15328,1392336005,'b3309cb32c08450b1ebb54fd4893962538f23644','cfb7f3163735d54d78808786fdfb202c71d15c99',0),(15329,1392336006,'b3309cb32c08450b1ebb54fd4893962538f23644','39e2afcd30e031a66ea4e912d6da1c516381b97a',0),(15330,1392336007,'b3309cb32c08450b1ebb54fd4893962538f23644','95396e487209d291944cc68f9223181d572b50fc',0),(15331,1392336010,'b3309cb32c08450b1ebb54fd4893962538f23644','a51594c3c683783fcebf4a31afa3d5290d7daba6',0),(15332,1392336015,'b3309cb32c08450b1ebb54fd4893962538f23644','ff259fd6209bf505333f8cc28a24295d7398b36b',0),(15333,1392336016,'b3309cb32c08450b1ebb54fd4893962538f23644','57f32bb4c734b9ff8392f23be01429fea562ab56',0),(15334,1392336069,'b3309cb32c08450b1ebb54fd4893962538f23644','2891e9de320e8850f585ef8c2abefd359303b6db',0),(15335,1392336082,'b3309cb32c08450b1ebb54fd4893962538f23644','b1ffe789cbb676ad8fc7ddf7642ae7d320b21fec',0),(15336,1392336084,'b3309cb32c08450b1ebb54fd4893962538f23644','d6e86759409afa82d50f715052e1bb043ba14117',0),(15337,1392336087,'b3309cb32c08450b1ebb54fd4893962538f23644','d68bccd25a0fdaaae4fe8c2893d9a8b1407ffa2d',0),(15338,1392336098,'b3309cb32c08450b1ebb54fd4893962538f23644','2d48e40fb4b8bc611573c2099c48af5f38db64f9',0),(15339,1392336332,'b3309cb32c08450b1ebb54fd4893962538f23644','401eb61d745e36403734c2b1c4bb76ddf8ee5800',0),(15340,1392336334,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','9c078e3199a343dd3018ad192641c07d38a34a82',0),(15341,1392336340,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','92c3688931c403bf1720c89f0602b27080caaa4c',0),(15342,1392336341,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','5f6d0fd2a6c5754c6db4da605bf14175a42cc86d',0),(15343,1392336341,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','06bff46c35dad3c85245ba063484bf04b1dc83ce',0),(15344,1392336341,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','584dee3392d5b5d35f67c96b7b2a54db097e0709',0),(15345,1392336342,'b3309cb32c08450b1ebb54fd4893962538f23644','b612152621398af1d04cef2f1d9ceecf5143f468',1),(15346,1392336343,'b3309cb32c08450b1ebb54fd4893962538f23644','7bc699f14492d722c23fe5c8f2050c705136b531',0),(15347,1392336343,'b3309cb32c08450b1ebb54fd4893962538f23644','fe0f2e979a9f474ac8a5b6f78d4d2545fb8c2d72',0),(15348,1392336343,'b3309cb32c08450b1ebb54fd4893962538f23644','a4cdc8b68bddaa35c4959729d419ddb502f86b17',0),(15349,1392336360,'b3309cb32c08450b1ebb54fd4893962538f23644','9aed5a852d4a67117e09cff9c32da20c109cb027',1),(15350,1392336361,'b3309cb32c08450b1ebb54fd4893962538f23644','421349bd22317681457760be39a95b82165d6bf4',0),(15351,1392336399,'b3309cb32c08450b1ebb54fd4893962538f23644','2b278bc787eaa5b0137b7483179172905197c185',0),(15352,1392336419,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','2bc80f44ca2c2fcd94489c63f8587fb331ac2a79',0),(15353,1392336419,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','471f25f3a4d88e19b0658263b66508c1b7f9c299',0),(15354,1392336419,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','35d023e0d3bf411fb5a40086498a0ad7d7d020e9',0),(15355,1392336420,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','90378c8d6e2aed434271fff045df87dd0feae071',0),(15356,1392336420,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','63a29eae3e47ae688f131149a3256b5195772f62',0),(15357,1392336420,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','101942b589dfe12b30554ae0b224f8c6fabc92ac',0),(15358,1392336420,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','55e2fda016d349eb29a25e5f7703e0c8e47bd64d',0),(15359,1392336429,'b3309cb32c08450b1ebb54fd4893962538f23644','38cf778071d7b6f6beeab0b0d8ce8e361dabc805',0),(15360,1392336430,'b3309cb32c08450b1ebb54fd4893962538f23644','82494beecc2f6f9754078feef31023366265b646',0),(15361,1392336430,'b3309cb32c08450b1ebb54fd4893962538f23644','ee5829d7057f7ec25b50841486289bca10e994ba',0),(15362,1392336430,'b3309cb32c08450b1ebb54fd4893962538f23644','60900dc250889232366f2b8c6a974f5890960205',0),(15363,1392336431,'b3309cb32c08450b1ebb54fd4893962538f23644','380d6af147c63693b467db12d8b1a18245e4443b',0),(15364,1392336431,'b3309cb32c08450b1ebb54fd4893962538f23644','d1d16175ebf3a1febf337393e178caa54058aca4',0),(15365,1392336431,'b3309cb32c08450b1ebb54fd4893962538f23644','2932ca4ed164f7c979114feb0d2c9ab8f11d0eb4',0),(15366,1392336431,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','7ec374749d633b6fc85388fba8c9eae9dab7bc36',0),(15367,1392336431,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','110f23684918d6ef169d96f049e5ea8f453d1e7a',0),(15368,1392336431,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','1d7f75c9e85b11ef33918cb4dbdf4c87e5dc0a81',0),(15369,1392336431,'dbc56bfb5a5902f0305e3c23157bc9331fa2e0ef','be5b4d3b4e4e90629806e7e22e4b58fc29db18a2',0),(15370,1392336558,'b3309cb32c08450b1ebb54fd4893962538f23644','1b0a4e41159362f0624ee3e939fb3ac130baebb9',0),(15371,1392336558,'b3309cb32c08450b1ebb54fd4893962538f23644','fe52bd0782cd25212a5bfc8ee5295f116d0d49e1',0),(15372,1392336559,'b3309cb32c08450b1ebb54fd4893962538f23644','82cbb140cab5d70bc29b364539a53b47f9a99c80',0),(15373,1392336559,'b3309cb32c08450b1ebb54fd4893962538f23644','923e58ca5171079f5836c5b9a1b32453bf97d1dd',0),(15374,1392336562,'b3309cb32c08450b1ebb54fd4893962538f23644','d7332be743b860dcb3aeb3b2f9fc83f30781d817',0),(15375,1392336562,'b3309cb32c08450b1ebb54fd4893962538f23644','9b1313247749fab08fd6c229cf4a6557e9ce3c5d',0),(15376,1392336563,'b3309cb32c08450b1ebb54fd4893962538f23644','d19d625896cfd05f434241c1c4eac0721c8635eb',0),(15377,1392336890,'b3309cb32c08450b1ebb54fd4893962538f23644','d37a4eeedde29074f2ebe58d860daf8f6838b2b0',0),(15378,1392336897,'b3309cb32c08450b1ebb54fd4893962538f23644','c8c04b9324bae4e35b1b1e43db249542d3a1ccc4',0),(15379,1392336915,'b3309cb32c08450b1ebb54fd4893962538f23644','edddb0821fc6fa37e57a183124b87d98af576cbc',0),(15380,1392336915,'b3309cb32c08450b1ebb54fd4893962538f23644','9601949341b3afc00dd08a00b9342400957c92e9',0),(15381,1392337005,'0','995068f91790f6b362be8484844fc97cfc0317f1',0),(15382,1392337005,'0','0ef0de5fc69e755d99761c41997844c184c0fee0',0),(15383,1392337005,'0','7a91ad7ae301ba9b7f0214edcf78324b20c0e35a',0),(15384,1392337005,'0','91c7bb43150ce79466a0bfd2ac587c0723103dee',0),(15385,1392337005,'0','26416137a6c4ac8a12e1e54dc26cb54d9254039b',0),(15386,1392337014,'0','2840dc1dd46f1dff47340909ad97725d14bb10b5',0),(15387,1392337014,'0','3043d1db17a9829007969fa12cffa38694942fc6',0),(15388,1392337014,'0','27cc4b6c7982f2adbb43b6e69760bbc6c5895d83',0),(15389,1392337100,'0','e15c3ebbe4f2cbc4a111d2693627cd71f4af7def',0),(15390,1392337100,'0','df2fc4b83ef01d6a4a263dd59a57f6091944aa2b',0),(15391,1392337100,'0','d330bed4dd8041b4851d84ec06ae5f33d2439451',0),(15392,1392337235,'b3309cb32c08450b1ebb54fd4893962538f23644','984093b7982813d62933e7d163c6c5fa2eb095fb',0),(15393,1392337238,'b3309cb32c08450b1ebb54fd4893962538f23644','45943776db6172a5c02ccb84af4d03e103fa3d3a',0),(15394,1392337239,'b3309cb32c08450b1ebb54fd4893962538f23644','8816e4caa3a11d50ddccfa6102fa89c2efe410be',0),(15395,1392337239,'b3309cb32c08450b1ebb54fd4893962538f23644','2b2663075b325754813390b80d9715f0b5d422ea',0),(15396,1392337239,'b3309cb32c08450b1ebb54fd4893962538f23644','672be807bc57e45de0f5b8105c41b8608a86b32b',0),(15397,1392337448,'b3309cb32c08450b1ebb54fd4893962538f23644','f7ab171670f939a1ea339b8bf687ab6c6929d3c4',0),(15398,1392337464,'b3309cb32c08450b1ebb54fd4893962538f23644','192a047016f1842cdfe0a88c7146a4acff5e2ae6',0),(15399,1392337464,'b3309cb32c08450b1ebb54fd4893962538f23644','83f774ff04f6c875c46f7350d78301eddd6ded8f',0);
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
INSERT INTO `exp_sessions` VALUES ('d7a8464da565f30df7f6f57edf68c00ef8df69d9',4,1,'167.100.118.140','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1','4e3bc06ba66debb5c1658ac859fde66c',1392399546,1392399783),('aa97232f427ca68d8baa5660b42fd4a484b5b11c',4,1,'167.100.118.140','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)','2a9f2acb7bd66711c702fab3d237461a',1392394259,1392397161);
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
INSERT INTO `exp_stats` VALUES (1,1,8,8,'Megan Sheley',69,0,0,0,1392396900,0,0,1383699119,1,1383699119,1392942264);
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (1,1,'pages',1,'y'),(2,1,'blog',2,'n'),(3,1,'media_mentions',3,'n'),(4,1,'programs',4,'n'),(6,1,'api',5,'n'),(7,1,'missions',6,'n');
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
INSERT INTO `exp_template_member_groups` VALUES (3,2),(3,7);
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','','',1389247785,1,'n',0,'','n','y','o',0),(2,1,2,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'blog-index-page page\'  ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n      <div class=\"outer-container\">\n      <section class=\'carousel bottom\' ng-controller=\"bottomCarouselCtrl\">\n        <thumblist-nav>\n          <div>\n            <img src=\"uploads/home/feature/building_a_better_kibera.jpg\">\n            <h4>Global Hearing Mission</h4>\n            <button ng-click=\"slide(0)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/celebrity_film.jpg\">\n            <h4>Celebrity Support</h4>\n            <button ng-click=\"slide(1)\">watch video &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/changing_lives_with_sir_richard_branson_and_virgin_unite.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(2)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/listen_carefully.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(3)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/operation_change.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(4)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/philippines_film.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(5)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/providing_clean_water_in_tanzania.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(6)\">read stories &rarr;</button>\n          </div>\n        </thumblist-nav>\n      </section>\n      </div>\n\n      <div class=\"outer-container\">\n      <div ng-controller=\"PaginationController\">\n          <div class=\"pagination-featured\">\n            <div ng-repeat=\"featuredArticle in featured\">\n              <h1></h1>\n            </div>\n          </div>\n      \n          <div class=\"pagination\">\n            <ul>\n              <li ng-class=\"{disabled: currentPage == 0}\">\n                <a href ng-click=\"prevPage()\">Prev</a>\n              </li>\n              <li ng-repeat=\"n in range(pagedArticles.length)\"\n                ng-class=\"{active: n == currentPage}\"\n                ng-click=\"setPage()\">\n                <a href ng-bind=\"n + 1\">1</a>\n              </li>\n              <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                <a href ng-click=\"nextPage()\">Next</a>\n              </li>\n            </ul>\n          </div>\n          <div class=\"spacer\"></div>\n          <div class=\"outer-container\">\n            <div class=\"pagination-articles \" ng-repeat=\"articleCol in pagedArticles[currentPage]\">\n              <div ng-repeat=\"article in articleCol\">\n                <pagination article=\"article\" lightbox=\"lightbox\" add-tag=\"addTag\" class= \"row\"></pagination>\n              </div>\n            </div>\n          </div>\n          <div class=\"center\">\n            <div class=\"pagination\">\n              <ul>\n                <li ng-class=\"{disabled: currentPage == 0}\">\n                  <a href ng-click=\"prevPage()\">Prev</a>\n                </li>\n                <li ng-repeat=\"n in range(pagedArticles.length)\"\n                  ng-class=\"{active: n == currentPage}\"\n                  ng-click=\"setPage()\">\n                  <a href ng-bind=\"n + 1\">1</a>\n                </li>\n                <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                  <a href ng-click=\"nextPage()\">Next</a>\n                </li>\n              </ul>\n            </div>\n          </div>\n      \n        <div class=\"modal fade\" ng-class=\"{in: lightbox()}\">\n          <div class=\"modal-header\">\n            <button type=\"button\" class=\"close\" ng-click=\"lightbox(false)\">×</button>\n            <h2>{{lightbox().title}}</h2>\n          </div>\n          <div class=\"modal-body\">\n            <a href=\"{{lightbox().url}}\">\n            Modal\n            </a>\n            <p>{{lightbox().desc}}</p>\n            <p>\n              <span class=\"label label-info pagination-tag\" ng-repeat=\"tag in lightbox().tags\"></span>\n            </p>\n          </div>\n          <div class=\"modal-footer\">\n            <a href=\"{{lightbox().url}}\" class=\"btn btn-primary\">Check out the App</a>\n            <a ng-show=\"lightbox().src\" href=\"{{lightbox().src}}\" class=\"btn\">View the Source</a>\n            <a ng-show=\"lightbox().info\" href=\"{{lightbox().info}}\" class=\"btn\">Read More</a>\n          </div>\n        </div>\n        <div class=\"modal-backdrop fade\" ng-class=\"{in: lightbox()}\" ng-click=\'lightbox(false)\'></div>\n      \n      </div>\n      </div>\n\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1390174301,1,'n',0,'','n','n','o',0),(3,1,3,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n  <meta charset=\"utf-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <title>Starkey Hearing Foundation</title>\n  <meta name=\"description\" content=\"\">\n  <meta name=\"viewport\" content=\"width=device-width\">\n  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n  \n  <link rel=\"stylesheet\" href=\"assets/styles/39034138.main.css\"/>\n  \n  </head>\n  <body class=\'media-mentions-page page\' ng:app=\"mediaMentionsPagesApp\" ng:controller=\"globalVideoModalCtrl\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n        <a href=\"/\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n        </a>\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n      <div ng-view></div>\n    <!-- end main content section -->\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/109209b4.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/7a1cf0cb.main.js\"></script>\n    \n    <script src=\"/assets/scripts/f7bcce96.plugins.js\"></script>\n    \n    <video-player-modal show=\'modalVideo\' width=\'90%\' height=\'90%\'></video-player-modal>\n</body>\n</html>\n','',1391805397,1,'n',0,'','n','n','o',0),(4,1,4,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n\n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'programs-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n    <section class=\'page-leader\'>\n      <h1>Our programs</h1>\n      <p>Programs overview lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dnt lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam.</p>\n    </section>\n\n    <section class=\'tabbed-content\'>\n      <nav>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.operation-change\'>Operation Change</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.listen-carefully\'>Listen Carefully</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hear-now\'>Hear Now</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hearing-aid-recycling\'>Hearing Aid Recycling</a>\n            </li>\n          </ul>\n      </nav>\n\n      <article class=\'tab-content operation-change\'>\n        <div class=\"outer-container\">\n          <h1>Operation change</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n\n        <section class=\"carousel hero\" ng-controller=\"heroCarouselCtrl\">\n          <swiper class=\"swiper\" speed=\"5000\" continuous=\"true\" auto=\"false\">\n            <div class=\"slide\">\n              <article>\n                <img src=\"uploads/home/hero/vikings_mission.jpg\" />\n              </article>\n            </div>\n          </swiper>\n        </section>\n        <br/>\n        <div class=\"outer-container\">\n          <h1>Our partnerships</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content listen-carefully\'>\n        <div class=\"outer-container\">\n          <h1>Listen Carefully</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hear-now\'>\n        <div class=\"outer-container\">\n          <h1>Hear Now</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hearing-aid-recycling\'>\n        <div class=\"outer-container\">\n          <h1>Hearing Aid Recycling</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n    </section>\n    <br/>\n\n      <p>Put production thumblist_nav here</p>\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(6,1,6,'homepage_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"coords\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"5\"}\n        [\n            {homepage_map_item_lat},\n            {homepage_map_item_lon}\n        ],\n   {/exp:channel:entries}\n   ],\n   \"meta_data\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"6\"}\n       {\n          \"title\":\"{title}\",\n          \"text\":\"{if homepage_map_item_content}{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{homepage_map_item_content}{/exp:low_replace}{/if}\",\n          \"thumbnail_url\":\"{homepage_map_item_image}\",\n          \"action_target\":\"{homepage_map_item_cta_link}\"\n       },\n    {/exp:channel:entries}\n   ]\n}\n',NULL,1391025408,1,'n',0,'','n','n','o',0),(7,1,6,'blog','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n    {exp:channel:entries channel=\"blog\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"year\": \"{entry_date format=\'%Y\'}\",\n      \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n      \"related_blog_items\": [],\n      \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n      \"title\": \"{title}\",\n      \"text\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{blog_content}{/exp:low_replace}\",\n      \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\",\n      \"image_url\": \"{if blog_image}{blog_image}{/if}\",\n      \"author\":\"{blog_author}\"\n    },\n    {/exp:channel:entries}\n]\n{if:else}\n{exp:channel:prev_entry channel=\"blog\"}\n  <? $prev_id = \"{entry_id}\"; ?>\n{/exp:channel:prev_entry}\n  <? $prev_item = (!empty($prev_id)) ? $prev_id : false; ?>\n{exp:channel:next_entry channel=\"blog\"}\n  <? $next_id = \"{entry_id}\"; ?>\n{/exp:channel:next_entry}\n  <? $next_item = (!empty($next_id)) ? $next_id : \"0\"; ?>\n{exp:channel:entries channel=\"blog\" limit=\"1\"}\n{\n  \"id\": \"{entry_id}\",\n  \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n  \"year\": \"{entry_date format=\'%Y\'}\",\n  \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n  \"related_blog_items\": [{blog_related_items backspace=\"1\"}{blog_related_items:entry_id},{/blog_related_items}],\n  \"prev_item\": \"<?=$prev_item?>\",\n  \"next_item\": \"<?=$next_item?>\",\n  \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n  \"title\": \"{title}\",\n  \"text\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{blog_content}{/exp:low_replace}\",\n  \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\",\n  \"image_url\": \"{if blog_image}{blog_image}{/if}\",\n  \"author\":\"{blog_author}\"\n}\n{/exp:channel:entries}\n{/if}\n','',1391800573,1,'n',0,'','n','y','o',0),(8,1,6,'press','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n    {exp:channel:entries channel=\"media_mentions\" backspace=\"6\"}\n    {\n      \"id\":\"{entry_id}\",\n      \"title\": \"{title}\",\n      \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n      \"year\": \"{entry_date format=\'%Y\'}\",\n      \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n      \"type\":\"{media_mention_type}\",\n      \"featured\":\"{media_mention_featured}\",\n      \"header_image_url\":\"{media_mention_splash_image}\",\n      \"logo_image_url\":\"{media_mention_icon}\",\n      \"quote\":\"{media_mention_quote}\",\n      \"call_to_action_text\":\"{media_mention_cta_text}\",\n      \"call_to_action_link\":\"{media_mention_cta_link}\",\n      \"video_link\":\"{media_mention_video_url}\"\n    },\n    {/exp:channel:entries}\n]\n{if:else}\n{exp:channel:entries channel=\"media_mentions\" limit=\"1\"}\n{\n  \"id\":\"{entry_id}\",\n  \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n  \"title\": \"{title}\",\n  \"year\": \"{entry_date format=\'%Y\'}\",\n  \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n  \"type\":\"{media_mention_type}\",\n  \"featured\":\"{media_mention_featured}\",\n  \"header_image_url\":\"{media_mention_splash_image}\",\n  \"logo_image_url\":\"{media_mention_icon}\",\n  \"quote\":\"{media_mention_quote}\",\n  \"call_to_action_text\":\"{media_mention_cta_text}\",\n  \"call_to_action_link\":\"{media_mention_cta_link}\",\n  \"video_link\":\"{media_mention_video_url}\"\n}\n{/exp:channel:entries}\n{/if}\n','',1391800610,1,'n',0,'','n','y','o',0),(9,1,6,'featured_articles','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"homepage_main_carousel\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"thumbnail_title\":\"{title}\",\n      \"thumbnail_image_url\":\"{carousel_image}\",\n      \"thumbnail_call_to_action_text\":\"{carousel_cta}\",\n      \"panel_title\":\"{carousel_panel_title}\",\n      \"panel_image_url\":\"{carousel_panel_image}\",\n      \"video_link_url\":\"{carousel_video_url}\",\n      \"panel_call_to_action_text\":\"{carousel_panel_cta}\",\n      \"panel_call_to_action_link_url\":\"{carousel_panel_link}\",\n      \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{carousel_body}{/exp:low_replace}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391043561,1,'n',0,'','n','n','o',0),(10,1,6,'program_partnerships','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{operation_change_partnerships}\n    {\n      \"id\":\"{operation_change_partnerships:row_id}\",\n      \"date\":\"{operation_change_partnerships:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{operation_change_partnerships:image}\",\n      \"thumbnail_title\":\"{operation_change_partnerships:title}\",\n      \"link_cta\":\"{operation_change_partnerships:cta}\",\n      \"link_url\":\"{operation_change_partnerships:link}\"\n    },\n    {/operation_change_partnerships}{/exp:channel:entries}\n]\n',NULL,1391210764,1,'n',0,'','n','n','o',0),(11,1,6,'program_resources','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{listen_carefully_additional_reso}\n    {\n      \"id\":\"{listen_carefully_additional_reso:row_id}\",\n      \"date\":\"{listen_carefully_additional_reso:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{listen_carefully_additional_reso:image}\",\n      \"thumbnail_title\":\"{listen_carefully_additional_reso:title}\",\n      \"link_cta\":\"{listen_carefully_additional_reso:cta}\",\n      \"link_url\":\"{listen_carefully_additional_reso:link}\"\n    },\n    {/listen_carefully_additional_reso}{/exp:channel:entries}\n]\n',NULL,1391211059,1,'n',0,'','n','n','o',0),(12,1,6,'index','y','webpage','',NULL,1391288619,1,'n',0,'','n','n','o',0),(13,1,6,'programs','n','webpage','',NULL,1391319181,1,'n',0,'','n','y','o',0),(14,1,6,'program_0','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'operation-change reveal\'>\n  <div class=\"outer-container\">\n    <h1>Operation change</h1>\n\n    {exp:hundies_shortcode}{operation_change_content}{/exp:hundies_shortcode}\n    <br/>\n    <h2>Our Partnerships</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programPartnerships\">\n      <div ng-repeat=\"article in programPartnerships\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391320660,1,'n',0,'','n','n','o',0),(15,1,6,'program_1','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'listen-carefully reveal\'>\n  <div class=\"outer-container\">\n\n    {exp:hundies_shortcode}{listen_carefully_content}{/exp:hundies_shortcode}\n\n    <br/>\n    <h2>Additional Resources</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programResources\">\n      <div ng-repeat=\"article in programResources\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391321117,1,'n',0,'','n','n','o',0),(16,1,6,'program_2','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hear-now reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hear Now</h1>\n\n    {exp:hundies_shortcode}{hear_now_content}{/exp:hundies_shortcode}\n\n    <p class=\"centered\"><a href=\"mailto:{hear_now_form_contact}\" class=\"link-with-border\">Contact us</a></p>\n\n\n    <p>{hear_now_download_copy}</p>\n\n    <div class=\"share-this-post\">\n      <ul>\n        <li><span class=\"note\">Download application</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_english}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n        <li><span class=\"note\">Descargar Solicitud</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_spanish}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n      </ul>\n    </div>\n\n    <hr class=\"separator padded\"/>\n    <br/>\n    <h1>Providers Looking to Give Back</h1>\n    <p>Help us give the gift of hearing into the lives of people in need. If you are a hearing professional, we need your help! Become a Hear Now volunteer and volunteer to fit and follow up with our Hear Now recipients. Your crucial support will help change lives forever and have a lasting impact on your community.</p>\n    <br/>\n    <hr class=\"separator padded\"/>\n    <h3><a href ng-click=\"toggle(isVisible)\" class=\"highlight\">Become a Provider</a></h3>\n    <br/>\n    <div class=\"become-a-provider-container reveal\" ng-show=\"isVisible\">\n      <br/>\n\n      {exp:freeform:form form_id=\"2\" form:id=\"become_a_provider_form\" form:class=\"flatform invert\" return=\"/#thank_you\"}\n          <ul>\n              <li class=\"leftHalf\">\n                  {freeform:field:first_name attr:placeholder=\"First Name\"}\n              </li>\n\n              <li class=\"rightHalf\">\n                  {freeform:field:last_name attr:placeholder=\"Last Name\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:practice attr:placeholder=\"Practice\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:phone attr:placeholder=\"Phone\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:fax attr:placeholder=\"FAX\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:email attr:placeholder=\"Email\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:address attr:placeholder=\"Address\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:city attr:placeholder=\"City\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:state attr:placeholder=\"State\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:zip attr:placeholder=\"Zip\"}\n              </li>\n\n              <li class=\"full\">\n                <br/>\n                  {freeform:submit attr:id=\"become_a_provider_submit\"}\n              </li>\n          </ul>\n\n      {/exp:freeform:form}\n    </div>\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322627,1,'n',0,'','n','n','o',0),(17,1,6,'program_3','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hearing-aid-recycling reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hearing Aid Recycling</h1>\n\n    {exp:hundies_shortcode}{hearing_aid_recycling_content}{/exp:hundies_shortcode}\n\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322745,1,'n',0,'','n','n','o',0),(18,1,6,'press_releases','y','webpage','{exp:http_header content_type=\"application/json\"}{\n{exp:channel:entries channel=\"press_releases\" limit=\"1\"}\n    \"id\":\"{entry_id}\",\n    \"title\": \"{title}\",\n    \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n    \"year\": \"{entry_date format=\'%Y\'}\",\n    \"type\":\"press_release\",\n    \"press_release_source\": \"{press_release_source}\",\n    \"press_release_pdf_download\": \"{press_release_pdf_download}\",\n    \"press_release_contact\": \"{press_release_contact}\",\n    \"body\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{press_release_body_text}{/exp:low_replace}\"\n{/exp:channel:entries}\n}\n',NULL,1391810580,1,'n',0,'','n','n','o',0),(19,1,6,'media_mentions','y','webpage','{exp:http_header content_type=\"application/json\"}{\n{exp:channel:entries channel=\"media_mentions\" limit=\"1\"}\n    \"id\":\"{item_id}\",\n    \"title\": \"{title}\",\n    \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n    \"year\": \"{entry_date format=\'%Y\'}\",\n    \"type\":\"media_mention\",\n    \"featured\":\"{media_mention_feature_carousel}\",\n    \"header_image_url\":\"{media_mention_image}\",\n    \"logo_image_url\":\"{media_mention_logo}\",\n    \"quote\":\"{media_mention_quote}\",\n    \"call_to_action_text\":\"{media_mention_cta_text}\",\n    \"call_to_action_link\":\"{media_mention_cta_link}\",\n    \"video_link\":\"{media_mention_video_url}\",\n    \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{media_mention_body_text}{/exp:low_replace}\"\n{/exp:channel:entries}\n}','',1392157548,1,'n',0,'','n','n','o',0),(20,1,7,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n\n  <head>\n  <meta charset=\"utf-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <title>Starkey Hearing Foundation</title>\n  <meta name=\"description\" content=\"\">\n  <meta name=\"viewport\" content=\"width=device-width\">\n  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n  \n  <link rel=\"stylesheet\" href=\"assets/styles/7cb3a6d9.main.css\"/>\n  \n  </head>\n  <body class=\'hearing-missions-page page\' ng:app=\"missionsPageApp\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n        <a href=\"/\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n        </a>\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n\n              <a href=\"{path=\'missions/index\'}\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n    <div ng-view></div>\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/a332a0e7.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/36fe27b7.main.js\"></script>\n    \n    <script src=\"/assets/scripts/f7bcce96.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1392253615,1,'n',0,'','n','n','o',0),(21,1,6,'missions_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"continents\": [\n      {exp:channel:entries channel=\"mission_markers\" dynamic=\"no\" backspace=\"8\" orderby=\"mm_order\" sort=\"asc\"}\n      {\n         \"name\": \"{exp:mah_eencode decode=\"yes\"}{title}{/exp:mah_eencode}\",\n         \"total_hearing_aids_provided\": \"{total_hearing_aids_provided}\",\n         \"countries_visited\": [\n            {countries_visited}\n            {\n               \"name\": \"{countries_visited:name}\",\n               \"abbreviation\": \"{countries_visited:abbreviation}\",\n               \"total_hearing_aids_provided\": \"{countries_visited:hearing_aids}\"\n            }{if countries_visited:count != countries_visited:total_rows},{/if}\n            {/countries_visited}\n         ]\n      },\n      {/exp:channel:entries}\n   ]\n}',NULL,1392344254,1,'n',0,'','n','n','o',0),(22,1,6,'missions','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n  {\n    \"id\": \"1\",\n    \"date\": \"February 13, 2014\",\n    \"featured\": \"true\",\n    \"title\": \"An Unstoppable Spirit\",\n    \"body\": \"Like a typical 9-year-old girl, Maci Rowan loves the band One Direction and will proudly proclaim to anyone listening that her favorite song is&nbsp;What Makes You Beautiful. However, Maci is anything but typical. Born with cerebral palsy, she has had to overcome some significant physical obstacles in her short life. These obstacles became even more daunting last year when she began to suffer hearing loss.</p>  <p>Despite her hearing loss, Maci continued to seek out ways to connect to the world and outlets for her jubilant energy and desire to learn. Unfortunately, Maci’s normally excellent grades began to fall, and her frustration with not doing well in school and inability to connect with her peers and teachers, caused her to act out in class.&nbsp; At home, she turned to her dolls for company and connection. Her mother Christy became increasingly concerned over Maci’s retreat into isolation. She recognized that hearing loss was to blame and reached out to Starkey Hearing Foundation for help.</p> <p>When Maci came to see us in New Orleans, her smile lit up the room, and her laughter was contagious. We had invited Maci to our Friday mission in partnership with Garth Brooks’ Super ProCamps, so that she could not only receive the gift of hearing but also participate in all the fun activities for the children. We watched in amazement as NFL stars were drawn to her boundless joy and curiosity. The Foundation team and our celebrity volunteers just couldn’t get enough of Maci. &nbsp;Explaining her daughter’s unique spirit, Christy said with a smile, “She has always been this way. Once she gets you wrapped around her finger, you’re lost. You have no chance of disciplining her.”</p>  <p>By the time she sat in Bill Austin’s chair to receive the gift of hearing, Maci had not heard her own voice in months, but once she was fit, she beamed her irrepressible light and cried out, “Oh! I can talk again!”</p>  <p>Able to confidently connect with the world again, Maci immediately joined the kids participating in the ProCamps cheerleading activities and won the “Champion of the Day” award. We know that with the gift of hearing this amazing girl will continue winning and inspire many more hearts and minds.</p>\",\n    \"thumbnail_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"header_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"author\": \"SHF Team\",\n    \"mission_item_category\": \"Africa\"\n  }\n]\n{if:else}\n{\n  {\n    \"id\": \"1\",\n    \"date\": \"February 13, 2014\",\n    \"featured\": \"true\",\n    \"title\": \"An Unstoppable Spirit\",\n    \"body\": \"Like a typical 9-year-old girl, Maci Rowan loves the band One Direction and will proudly proclaim to anyone listening that her favorite song is&nbsp;What Makes You Beautiful. However, Maci is anything but typical. Born with cerebral palsy, she has had to overcome some significant physical obstacles in her short life. These obstacles became even more daunting last year when she began to suffer hearing loss.</p>  <p>Despite her hearing loss, Maci continued to seek out ways to connect to the world and outlets for her jubilant energy and desire to learn. Unfortunately, Maci’s normally excellent grades began to fall, and her frustration with not doing well in school and inability to connect with her peers and teachers, caused her to act out in class.&nbsp; At home, she turned to her dolls for company and connection. Her mother Christy became increasingly concerned over Maci’s retreat into isolation. She recognized that hearing loss was to blame and reached out to Starkey Hearing Foundation for help.</p> <p>When Maci came to see us in New Orleans, her smile lit up the room, and her laughter was contagious. We had invited Maci to our Friday mission in partnership with Garth Brooks’ Super ProCamps, so that she could not only receive the gift of hearing but also participate in all the fun activities for the children. We watched in amazement as NFL stars were drawn to her boundless joy and curiosity. The Foundation team and our celebrity volunteers just couldn’t get enough of Maci. &nbsp;Explaining her daughter’s unique spirit, Christy said with a smile, “She has always been this way. Once she gets you wrapped around her finger, you’re lost. You have no chance of disciplining her.”</p>  <p>By the time she sat in Bill Austin’s chair to receive the gift of hearing, Maci had not heard her own voice in months, but once she was fit, she beamed her irrepressible light and cried out, “Oh! I can talk again!”</p>  <p>Able to confidently connect with the world again, Maci immediately joined the kids participating in the ProCamps cheerleading activities and won the “Champion of the Day” award. We know that with the gift of hearing this amazing girl will continue winning and inspire many more hearts and minds.</p>\",\n    \"thumbnail_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"header_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"author\": \"SHF Team\",\n    \"mission_item_category\": \"Africa\"\n  }\n{/if}\n',NULL,1392329491,1,'n',0,'','n','n','o',0),(23,1,6,'articles','y','webpage','{exp:channel:entries channel=\"blog\" limit=\"1\"}\n<div class=\"article-header-image\">\n  <div class=\"image\" style=\"background-image: url(\'{blog_image}\');\">\n    <ul class=\"page-nav-links\">\n      <li>\n        <a href=\"#/articles/\" ng-disabled=\"currentPosition == article.prev_item\">&larr;</a>\n      </li>\n      <li>\n        <a href=\"#/articles/\" ng-disabled=\"currentPosition == article.next_item\" >&rarr;</a>\n      </li>\n      <li>\n        <a href=\"#\">X</a>\n      </li>\n    </ul>\n    <div class=\"gradient-background\"></div>\n    <div class=\"outer-container\">\n      <div class=\"relative-container\">\n        <div class=\"banner\">\n          {if blog_category}\n            <p class=\"article-item-category\">{blog_category}</p>\n          {/if}\n          <h1  class=\"article-title\">{title}</h1>\n          <p>{{parseDate({entry_date format=\'%m %d %Y\'}) | date:\"MMMM d yyyy\"}} | {blog_author}</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<br/>\n\n{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}\n\n<div class=\"outer-container\">\n  <div class=\"share-this-post\">\n    <ul>\n      <li><span class=\"note\">Share this post</span></li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-twitter\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-fb\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-email\"></span>\n        </a>\n      </li>\n    </ul>\n  </div>\n\n</div>\n<br/>\n{/exp:channel:entries}\n',NULL,1392339200,1,'n',0,'','n','n','o',0);
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
INSERT INTO `exp_upload_prefs` VALUES (1,1,'Image Uploads','/var/www/starkey/www/uploads/images/','http://starkey.ahundredyears.com/uploads/images/','img','','','','','','','','','','',NULL),(2,1,'File Uploads','/var/www/starkey/www/uploads/files/','http://starkey.ahundredyears.com/uploads/files/','all','','','','','','','','','','',NULL);
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

-- Dump completed on 2014-02-14 17:43:17
