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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_accessories`
--

LOCK TABLES `exp_accessories` WRITE;
/*!40000 ALTER TABLE `exp_accessories` DISABLE KEYS */;
INSERT INTO `exp_accessories` VALUES (4,'Single_entry_acc','1|5','addons_accessories|tools_data|tools_logs|design|addons_modules|content_publish|admin_system|tools_communicate|content_files|addons_fieldtypes|content_edit|tools_utilities|members|content_files_modal|addons|sites|homepage|admin_content|content|myaccount|tools|addons_extensions|addons_plugins','1.0.5'),(2,'Freeform_acc','1|5','addons_accessories|tools_data|tools_logs|design|addons_modules|content_publish|admin_system|tools_communicate|content_files|addons_fieldtypes|content_edit|tools_utilities|members|content_files_modal|addons|sites|homepage|admin_content|content|myaccount|tools|addons_extensions|addons_plugins','4.1.3'),(3,'Health_check_acc','1|5','addons_accessories|tools_data|tools_logs|design|addons_modules|content_publish|admin_system|tools_communicate|content_files|addons_fieldtypes|content_edit|tools_utilities|members|content_files_modal|addons|sites|homepage|admin_content|content|myaccount|tools|addons_extensions|addons_plugins','0.1.4');
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
) ENGINE=MyISAM AUTO_INCREMENT=354 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_files`
--

LOCK TABLES `exp_assets_files` WRITE;
/*!40000 ALTER TABLE `exp_assets_files` DISABLE KEYS */;
INSERT INTO `exp_assets_files` VALUES (22,2,'ee',NULL,2,'SHF_2012Overview_NewsRelease_FINAL1.docx',NULL,1392152482,NULL,NULL,NULL,NULL,NULL,NULL,1392152482,'word',NULL,NULL,184702,'SHF_2012Overview_NewsRelease_FINAL1.docx'),(29,1,'ee',NULL,1,'Unstoppable_Spirit_LEAD.jpg',NULL,1392222175,NULL,NULL,NULL,NULL,NULL,NULL,1392222175,'image',821,525,91286,'Unstoppable_Spirit_LEAD.jpg'),(38,2,'ee',NULL,2,'Listen-Carefully-Loudness-Wars.pdf',NULL,1392232516,NULL,NULL,NULL,NULL,NULL,NULL,1392232516,'pdf',NULL,NULL,254922,'Listen-Carefully-Loudness-Wars.pdf'),(40,1,'ee',NULL,1,'Operation-Change-Ray-Lewis-Film.jpg',NULL,1392233633,NULL,NULL,NULL,NULL,NULL,NULL,1392233633,'image',639,353,213322,'Operation-Change-Ray-Lewis-Film.jpg'),(41,1,'ee',NULL,1,'Operation-Change-Donna-Karan-Film.jpg',NULL,1392234023,NULL,NULL,NULL,NULL,NULL,NULL,1392234023,'image',638,354,293950,'Operation-Change-Donna-Karan-Film.jpg'),(42,2,'ee',NULL,2,'FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf',NULL,1392234275,NULL,NULL,NULL,NULL,NULL,NULL,1392234275,'pdf',NULL,NULL,2197606,'FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf'),(43,2,'ee',NULL,2,'FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf',NULL,1392234291,NULL,NULL,NULL,NULL,NULL,NULL,1392234291,'pdf',NULL,NULL,2208363,'FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf'),(56,2,'ee',NULL,2,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',NULL,1392335362,NULL,NULL,NULL,NULL,NULL,NULL,1392335362,'image',64,31,4440,'Screen_Shot_2014-02-12_at_8.59.27_PM.png'),(237,9,'ee',NULL,1,'COVER_pianoboy_cc.jpg',NULL,1392701141,NULL,NULL,NULL,NULL,NULL,NULL,1392701141,'image',5410,3283,8653595,'COVER_pianoboy_cc.jpg'),(235,1,'ee',NULL,1,'ABClogo.jpg',NULL,1392157491,NULL,NULL,NULL,NULL,NULL,NULL,1392157491,NULL,152,134,6763,'ABClogo.jpg'),(236,2,'ee',NULL,2,'DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg',NULL,1392700972,NULL,NULL,NULL,NULL,NULL,NULL,1392700972,'image',5420,3988,5530452,'DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg'),(231,1,'ee',NULL,1,'MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png',NULL,1392330311,NULL,NULL,NULL,NULL,NULL,NULL,1392330311,NULL,939,525,682635,'MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png'),(232,1,'ee',NULL,1,'MEDIA-08.02_.14_CGI_Blog_.png',NULL,1392401283,NULL,NULL,NULL,NULL,NULL,NULL,1392401283,NULL,1216,525,783141,'MEDIA-08.02_.14_CGI_Blog_.png'),(228,1,'ee',NULL,1,'BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg',NULL,1392322963,NULL,NULL,NULL,NULL,NULL,NULL,1392322963,NULL,791,525,114256,'BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg'),(229,1,'ee',NULL,1,'BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg',NULL,1392395987,NULL,NULL,NULL,NULL,NULL,NULL,1392395987,NULL,835,525,133038,'BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg'),(227,1,'ee',NULL,1,'BLOG-Unstoppable_Spirit_LEAD.jpg',NULL,1392224175,NULL,NULL,NULL,NULL,NULL,NULL,1392224175,NULL,821,377,185268,'BLOG-Unstoppable_Spirit_LEAD.jpg'),(225,1,'ee',NULL,1,'BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg',NULL,1392153484,NULL,NULL,NULL,NULL,NULL,NULL,1392153484,NULL,5616,1638,3936128,'BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg'),(226,1,'ee',NULL,1,'BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg',NULL,1392327970,NULL,NULL,NULL,NULL,NULL,NULL,1392327970,NULL,787,525,109104,'BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg'),(281,1,'ee',NULL,1,'DSC03269ccKarlal_India_Day_3_Mar_31_Sun.jpg',NULL,1392681439,NULL,NULL,NULL,NULL,NULL,NULL,1392681439,'image',5493,3049,5074946,'DSC03269ccKarlal_India_Day_3_Mar_31_Sun.jpg'),(282,1,'ee',NULL,1,'DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg',NULL,1392681443,NULL,NULL,NULL,NULL,NULL,NULL,1392681443,'image',5420,3988,5530452,'DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg'),(283,1,'ee',NULL,1,'DSC03761cc3.jpg',NULL,1392681433,NULL,NULL,NULL,NULL,NULL,NULL,1392681433,'image',3344,3816,2439773,'DSC03761cc3.jpg'),(284,1,'ee',NULL,1,'DSC03822cc.jpg',NULL,1392681471,NULL,NULL,NULL,NULL,NULL,NULL,1392681471,'image',4665,2542,13778074,'DSC03822cc.jpg'),(285,1,'ee',NULL,1,'DSC05898cc.jpg',NULL,1392681448,NULL,NULL,NULL,NULL,NULL,NULL,1392681448,'image',5606,3141,3427550,'DSC05898cc.jpg'),(286,1,'ee',NULL,1,'DSC05915cc.jpg',NULL,1392681455,NULL,NULL,NULL,NULL,NULL,NULL,1392681455,'image',3111,3358,2781118,'DSC05915cc.jpg'),(287,1,'ee',NULL,1,'DSC06637cGuadalajara_Day_3_Sunday.jpg',NULL,1392681465,NULL,NULL,NULL,NULL,NULL,NULL,1392681465,'image',6000,3376,3897836,'DSC06637cGuadalajara_Day_3_Sunday.jpg'),(96,2,'ee',NULL,2,'pdf_download_tes.pdf',NULL,1391541790,NULL,NULL,NULL,NULL,NULL,NULL,1391541790,'pdf',NULL,NULL,8676,'pdf_download_tes.pdf'),(295,1,'ee',NULL,1,'MJM_5941cSantoDomingo_Day_3_Tues_Feb_12.jpg',NULL,1392681536,NULL,NULL,NULL,NULL,NULL,NULL,1392681536,'image',7004,4542,6995365,'MJM_5941cSantoDomingo_Day_3_Tues_Feb_12.jpg'),(294,1,'ee',NULL,1,'MCC_9492cNew_Orleans_Day_1_1.jpg',NULL,1392681515,NULL,NULL,NULL,NULL,NULL,NULL,1392681515,'image',5139,2922,3131792,'MCC_9492cNew_Orleans_Day_1_1.jpg'),(293,1,'ee',NULL,1,'MCC_6805cc_edit.jpg',NULL,1392681563,NULL,NULL,NULL,NULL,NULL,NULL,1392681563,'image',7250,4542,22759968,'MCC_6805cc_edit.jpg'),(292,1,'ee',NULL,1,'MCC_1444cc.jpg',NULL,1392681508,NULL,NULL,NULL,NULL,NULL,NULL,1392681508,'image',1495,1158,557710,'MCC_1444cc.jpg'),(290,1,'ee',NULL,1,'DSC08239cc.jpg',NULL,1392681471,NULL,NULL,NULL,NULL,NULL,NULL,1392681471,'image',3008,2221,1321594,'DSC08239cc.jpg'),(291,1,'ee',NULL,1,'DSC09692ccSo_Africa_Day_2_Mar_1_Fri.jpg',NULL,1392681480,NULL,NULL,NULL,NULL,NULL,NULL,1392681480,'image',1440,1165,1339389,'DSC09692ccSo_Africa_Day_2_Mar_1_Fri.jpg'),(289,1,'ee',NULL,1,'DSC07963cc.jpg',NULL,1392681469,NULL,NULL,NULL,NULL,NULL,NULL,1392681469,'image',2146,2719,1979544,'DSC07963cc.jpg'),(288,1,'ee',NULL,1,'DSC06962cc.jpg',NULL,1392681464,NULL,NULL,NULL,NULL,NULL,NULL,1392681464,'image',2748,3089,1934884,'DSC06962cc.jpg'),(102,5,'ee',NULL,1,'2013_stwmh_awards_gala_highlights.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1679,947,600107,'2013_stwmh_awards_gala_highlights.jpg'),(103,5,'ee',NULL,1,'building_a_better_kibera.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1392850347,'image',1622,908,775997,'building_a_better_kibera.jpg'),(104,5,'ee',NULL,1,'celebrity_film.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1667,932,475188,'celebrity_film.jpg'),(105,5,'ee',NULL,1,'changing_lives_with_sir_richard_branson_and_virgin_unite.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1595,899,627519,'changing_lives_with_sir_richard_branson_and_virgin_unite.jpg'),(106,5,'ee',NULL,1,'hear_now_hearing_aid_recycling_program.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1676,943,670533,'hear_now_hearing_aid_recycling_program.jpg'),(107,5,'ee',NULL,1,'listen_carefully.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1484,833,365842,'listen_carefully.jpg'),(108,5,'ee',NULL,1,'operation_change.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1680,944,941921,'operation_change.jpg'),(109,5,'ee',NULL,1,'peru_mission_02.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',936,639,582876,'peru_mission_02.jpg'),(110,5,'ee',NULL,1,'philippines_film.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1626,915,986228,'philippines_film.jpg'),(111,5,'ee',NULL,1,'providing_clean_water_in_tanzania.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1680,943,717315,'providing_clean_water_in_tanzania.jpg'),(112,5,'ee',NULL,1,'tony_hawk_event.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',640,480,131762,'tony_hawk_event.jpg'),(113,5,'ee',NULL,1,'vikings_mission.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',4000,3000,2691364,'vikings_mission.jpg'),(114,5,'ee',NULL,1,'west_bank_mission_5155.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',936,624,519314,'west_bank_mission_5155.jpg'),(115,5,'ee',NULL,1,'west_bank_mission.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1591,895,713742,'west_bank_mission.jpg'),(116,5,'ee',NULL,1,'where_we_are_now_india.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',936,520,497551,'where_we_are_now_india.jpg'),(117,5,'ee',NULL,1,'william_f_austin_legacy_film.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1614,909,472027,'william_f_austin_legacy_film.jpg'),(118,6,'ee',NULL,1,'building_sustainable_systems_of_hearing_care_02.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1604,900,826582,'building_sustainable_systems_of_hearing_care_02.jpg'),(119,6,'ee',NULL,1,'building_sustainable_systems_of_hearing_care.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1604,901,593033,'building_sustainable_systems_of_hearing_care.jpg'),(120,6,'ee',NULL,1,'commitment_to_action_film.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',1537,863,776026,'commitment_to_action_film.jpg'),(121,6,'ee',NULL,1,'vikings_mission.jpg',NULL,1389653695,NULL,NULL,NULL,NULL,NULL,NULL,1389653695,'image',936,496,416511,'vikings_mission.jpg'),(125,9,'ee',NULL,1,'ABC_tani_austin_sr_140121_16x9_608.jpg',NULL,1392157511,NULL,NULL,NULL,NULL,NULL,NULL,1392157511,'image',608,342,37016,'ABC_tani_austin_sr_140121_16x9_608.jpg'),(353,1,'ee',NULL,1,'CAROUSEL-Celebrity_Film-panel.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CAROUSEL-Celebrity_Film-panel.jpg'),(351,1,'ee',NULL,1,'operationchange.jpg',NULL,1392850822,NULL,NULL,NULL,NULL,NULL,NULL,1392850822,'image',1600,525,504147,'operationchange.jpg'),(352,1,'ee',NULL,1,'westbank2.jpeg',NULL,1392850826,NULL,NULL,NULL,NULL,NULL,NULL,1392850826,'image',640,480,110247,'westbank2.jpeg'),(350,1,'ee',NULL,1,'special_olympics_mission.jpg',NULL,1392850825,NULL,NULL,NULL,NULL,NULL,NULL,1392850825,'image',330,220,20900,'special_olympics_mission.jpg'),(230,1,'ee',NULL,1,'BLOG-Impacting_a_life_in_Manila-LEAD.png',NULL,1392397041,NULL,NULL,NULL,NULL,NULL,NULL,1392397041,NULL,958,525,993106,'BLOG-Impacting_a_life_in_Manila-LEAD.png'),(349,1,'ee',NULL,1,'marleemartin.jpeg',NULL,1392850821,NULL,NULL,NULL,NULL,NULL,NULL,1392850821,'image',320,327,24875,'marleemartin.jpeg'),(347,1,'ee',NULL,1,'listencarefully3.jpg',NULL,1392850818,NULL,NULL,NULL,NULL,NULL,NULL,1392850818,'image',1600,525,631088,'listencarefully3.jpg'),(348,1,'ee',NULL,1,'listencarefullygallery2.png',NULL,1392850821,NULL,NULL,NULL,NULL,NULL,NULL,1392850821,'image',1440,476,1155905,'listencarefullygallery2.png'),(344,1,'ee',NULL,1,'icon_video.png',NULL,1392850815,NULL,NULL,NULL,NULL,NULL,NULL,1392850815,'image',56,56,2965,'icon_video.png'),(345,1,'ee',NULL,1,'listencarefully.jpg',NULL,1392850816,NULL,NULL,NULL,NULL,NULL,NULL,1392850816,'image',1600,525,405535,'listencarefully.jpg'),(346,1,'ee',NULL,1,'listencarefully2.jpg',NULL,1392850817,NULL,NULL,NULL,NULL,NULL,NULL,1392850817,'image',1600,525,598081,'listencarefully2.jpg'),(342,1,'ee',NULL,1,'icon_stories.png',NULL,1392850815,NULL,NULL,NULL,NULL,NULL,NULL,1392850815,'image',56,56,3049,'icon_stories.png'),(343,1,'ee',NULL,1,'icon_program.png',NULL,1392850815,NULL,NULL,NULL,NULL,NULL,NULL,1392850815,'image',56,56,3594,'icon_program.png'),(340,1,'ee',NULL,1,'icon_gallery.png',NULL,1392850815,NULL,NULL,NULL,NULL,NULL,NULL,1392850815,'image',56,56,2979,'icon_gallery.png'),(341,1,'ee',NULL,1,'icon_now.png',NULL,1392850815,NULL,NULL,NULL,NULL,NULL,NULL,1392850815,'image',56,56,3571,'icon_now.png'),(338,7,'ee',NULL,1,'info_livesindirectly.jpg',NULL,1392850813,NULL,NULL,NULL,NULL,NULL,NULL,1392850813,'image',252,198,419655,'info_livesindirectly.jpg'),(339,7,'ee',NULL,1,'info_totalaids.jpg',NULL,1392850814,NULL,NULL,NULL,NULL,NULL,NULL,1392850814,'image',252,198,429587,'info_totalaids.jpg'),(337,7,'ee',NULL,1,'info_livesimpacted.jpg',NULL,1392850813,NULL,NULL,NULL,NULL,NULL,NULL,1392850813,'image',252,198,421952,'info_livesimpacted.jpg'),(336,1,'ee',NULL,1,'hearnow1.jpg',NULL,1392850809,NULL,NULL,NULL,NULL,NULL,NULL,1392850809,'image',1600,525,340205,'hearnow1.jpg'),(334,1,'ee',NULL,1,'cnnlogo.png',NULL,1392850780,NULL,NULL,NULL,NULL,NULL,NULL,1392850780,'image',300,225,20978,'cnnlogo.png'),(335,1,'ee',NULL,1,'hearingaidrecycling.jpg',NULL,1392850808,NULL,NULL,NULL,NULL,NULL,NULL,1392850808,'image',1600,525,257452,'hearingaidrecycling.jpg'),(333,1,'ee',NULL,1,'cbslogo.png',NULL,1392850779,NULL,NULL,NULL,NULL,NULL,NULL,1392850779,'image',300,300,3936,'cbslogo.png'),(331,1,'ee',NULL,1,'September_Newsletter.jpg',NULL,1392850825,NULL,NULL,NULL,NULL,NULL,NULL,1392850825,'image',1024,680,111920,'September_Newsletter.jpg'),(332,1,'ee',NULL,1,'billaustin.jpg',NULL,1392850766,NULL,NULL,NULL,NULL,NULL,NULL,1392850766,'image',500,342,32330,'billaustin.jpg'),(330,1,'ee',NULL,1,'TaniAustin.jpg',NULL,1392850826,NULL,NULL,NULL,NULL,NULL,NULL,1392850826,'image',1920,914,69288,'TaniAustin.jpg'),(329,1,'ee',NULL,1,'Screen_Shot_2014-01-31_at_12.29.23_PM.png',NULL,1392850825,NULL,NULL,NULL,NULL,NULL,NULL,1392850825,'image',1440,474,959228,'Screen_Shot_2014-01-31_at_12.29.23_PM.png'),(328,1,'ee',NULL,1,'PoweringInspiration_.jpg',NULL,1392850823,NULL,NULL,NULL,NULL,NULL,NULL,1392850823,'image',1024,747,95741,'PoweringInspiration_.jpg'),(327,1,'ee',NULL,1,'PeaceinWestBank.jpg',NULL,1392850823,NULL,NULL,NULL,NULL,NULL,NULL,1392850823,'image',1024,680,121579,'PeaceinWestBank.jpg'),(326,1,'ee',NULL,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',NULL,1392850810,NULL,NULL,NULL,NULL,NULL,NULL,1392850810,'image',1604,901,593033,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg'),(325,1,'ee',NULL,1,'Dave_Fabry.jpg',NULL,1392850807,NULL,NULL,NULL,NULL,NULL,NULL,1392850807,'image',5616,3744,5586958,'Dave_Fabry.jpg'),(323,1,'ee',NULL,1,'Clinton_Foundation_Logo.png',NULL,1392850780,NULL,NULL,NULL,NULL,NULL,NULL,1392850780,'image',200,200,38239,'Clinton_Foundation_Logo.png'),(324,1,'ee',NULL,1,'CBSStarkey.jpg',NULL,1392850779,NULL,NULL,NULL,NULL,NULL,NULL,1392850779,'image',620,349,28198,'CBSStarkey.jpg'),(322,1,'ee',NULL,1,'COVER_pianoboy_cc.jpg',NULL,1392850796,NULL,NULL,NULL,NULL,NULL,NULL,1392850796,'image',5410,3283,8653595,'COVER_pianoboy_cc.jpg'),(321,1,'ee',NULL,1,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',NULL,1392850778,NULL,NULL,NULL,NULL,NULL,NULL,1392850778,'image',1614,909,472027,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg'),(320,1,'ee',NULL,1,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg',NULL,1392850777,NULL,NULL,NULL,NULL,NULL,NULL,1392850777,'image',1614,909,472027,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg'),(318,1,'ee',NULL,1,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',NULL,1392850776,NULL,NULL,NULL,NULL,NULL,NULL,1392850776,'image',936,520,497551,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg'),(319,1,'ee',NULL,1,'CAROUSEL-William_F._Austin_Legacy_Film.jpg',NULL,1392850779,NULL,NULL,NULL,NULL,NULL,NULL,1392850779,'image',1614,909,472027,'CAROUSEL-William_F._Austin_Legacy_Film.jpg'),(317,1,'ee',NULL,1,'CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',NULL,1392850775,NULL,NULL,NULL,NULL,NULL,NULL,1392850775,'image',1680,943,717315,'CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg'),(315,1,'ee',NULL,1,'CAROUSEL-Peru_Mission-02-DSC07062.jpg',NULL,1392850773,NULL,NULL,NULL,NULL,NULL,NULL,1392850773,'image',936,639,582876,'CAROUSEL-Peru_Mission-02-DSC07062.jpg'),(316,1,'ee',NULL,1,'CAROUSEL-Tony_Hawk_Event.JPG',NULL,1392850775,NULL,NULL,NULL,NULL,NULL,NULL,1392850775,'image',640,480,131762,'CAROUSEL-Tony_Hawk_Event.JPG'),(314,1,'ee',NULL,1,'CAROUSEL-Listen_Carefully.jpg',NULL,1392850772,NULL,NULL,NULL,NULL,NULL,NULL,1392850772,'image',1484,833,365842,'CAROUSEL-Listen_Carefully.jpg'),(313,1,'ee',NULL,1,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',NULL,1392850771,NULL,NULL,NULL,NULL,NULL,NULL,1392850771,'image',1676,943,670533,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg'),(312,1,'ee',NULL,1,'CAROUSEL-Celebrity_Film.jpg',NULL,1392850770,NULL,NULL,NULL,NULL,NULL,NULL,1392850770,'image',1667,932,475188,'CAROUSEL-Celebrity_Film.jpg'),(310,1,'ee',NULL,1,'Blog_Philippines_.jpg',NULL,1392850767,NULL,NULL,NULL,NULL,NULL,NULL,1392850767,'image',1024,705,109435,'Blog_Philippines_.jpg'),(311,1,'ee',NULL,1,'CAROUSEL-Building_a_Better_Kibera.jpg',NULL,1392850769,NULL,NULL,NULL,NULL,NULL,NULL,1392850769,'image',1622,908,775997,'CAROUSEL-Building_a_Better_Kibera.jpg'),(309,1,'ee',NULL,1,'Blog_A_Knight.jpg',NULL,1392850767,NULL,NULL,NULL,NULL,NULL,NULL,1392850767,'image',1992,1571,489262,'Blog_A_Knight.jpg'),(308,1,'ee',NULL,1,'ABC_tani_austin_sr_140121_16x9_608.jpg',NULL,1392850766,NULL,NULL,NULL,NULL,NULL,NULL,1392850766,'image',608,342,37016,'ABC_tani_austin_sr_140121_16x9_608.jpg'),(307,1,'ee',NULL,1,'HERO-Commitment_to_Action_Film.jpg',NULL,1392850072,NULL,NULL,NULL,NULL,NULL,NULL,1392850072,'image',1537,863,776026,'HERO-Commitment_to_Action_Film.jpg'),(306,1,'ee',NULL,1,'HERO-Vikings_Mission-IMG_6312.jpg',NULL,1392849943,NULL,NULL,NULL,NULL,NULL,NULL,1392849943,'image',936,496,416511,'HERO-Vikings_Mission-IMG_6312.jpg'),(239,1,'ee',NULL,1,'BLOG-An_Unstoppable_Spirit_01.jpg',NULL,1392223131,NULL,NULL,NULL,NULL,NULL,NULL,1392223131,'image',904,525,70852,'BLOG-An_Unstoppable_Spirit_01.jpg'),(240,1,'ee',NULL,1,'BLOG-An_Unstoppable_Spirit_02.jpg',NULL,1392223145,NULL,NULL,NULL,NULL,NULL,NULL,1392223145,'image',1048,525,128784,'BLOG-An_Unstoppable_Spirit_02.jpg'),(241,1,'ee',NULL,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg',NULL,1392402841,NULL,NULL,NULL,NULL,NULL,NULL,1392402841,'image',774,525,187004,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg'),(242,1,'ee',NULL,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-021.jpg',NULL,1392403725,NULL,NULL,NULL,NULL,NULL,NULL,1392403725,'image',774,525,187004,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-021.jpg'),(243,1,'ee',NULL,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-022.jpg',NULL,1392403751,NULL,NULL,NULL,NULL,NULL,NULL,1392403751,'image',774,525,187004,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-022.jpg'),(244,1,'ee',NULL,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-023.jpg',NULL,1392403772,NULL,NULL,NULL,NULL,NULL,NULL,1392403772,'image',774,525,187004,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-023.jpg'),(245,1,'ee',NULL,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-03.jpg',NULL,1392402855,NULL,NULL,NULL,NULL,NULL,NULL,1392402855,'image',300,234,26911,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-03.jpg'),(246,1,'ee',NULL,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-LEAD.jpg',NULL,1392403484,NULL,NULL,NULL,NULL,NULL,NULL,1392403484,'image',762,525,149854,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-LEAD.jpg'),(247,1,'ee',NULL,1,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg',NULL,1392317488,NULL,NULL,NULL,NULL,NULL,NULL,1392317488,'image',835,525,118864,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg'),(248,1,'ee',NULL,1,'BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',NULL,1392395737,NULL,NULL,NULL,NULL,NULL,NULL,1392395737,'image',844,525,181390,'BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg'),(249,1,'ee',NULL,1,'BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',NULL,1392395754,NULL,NULL,NULL,NULL,NULL,NULL,1392395754,'image',701,525,167003,'BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg'),(250,1,'ee',NULL,1,'BLOG-Unstoppable_Spirit_LEAD-02.jpg',NULL,1392225896,NULL,NULL,NULL,NULL,NULL,NULL,1392225896,'image',1800,525,283537,'BLOG-Unstoppable_Spirit_LEAD-02.jpg'),(251,1,'ee',NULL,1,'BLOG-Volunteerism_in_Queretaro-02.jpg',NULL,1392152162,NULL,NULL,NULL,NULL,NULL,NULL,1392152162,'image',1102,322,168641,'BLOG-Volunteerism_in_Queretaro-02.jpg'),(252,1,'ee',NULL,1,'BLOG-Volunteerism_in_Queretaro.jpg',NULL,1392151386,NULL,NULL,NULL,NULL,NULL,NULL,1392151386,'image',1102,482,240336,'BLOG-Volunteerism_in_Queretaro.jpg'),(253,1,'ee',NULL,1,'BillandTani.jpg',NULL,1392148470,NULL,NULL,NULL,NULL,NULL,NULL,1392148470,'image',424,284,150744,'BillandTani.jpg'),(254,1,'ee',NULL,1,'CAROUSEL-Building_a_Better_Kibera1.jpg',NULL,1392148360,NULL,NULL,NULL,NULL,NULL,NULL,1392148360,'image',1622,908,775997,'CAROUSEL-Building_a_Better_Kibera1.jpg'),(255,1,'ee',NULL,1,'CAROUSEL-Celebrity_Film-thumb.jpg',NULL,1392143118,NULL,NULL,NULL,NULL,NULL,NULL,1392143118,'image',1667,876,500531,'CAROUSEL-Celebrity_Film-thumb.jpg'),(256,1,'ee',NULL,1,'CAROUSEL-Operation_Change-panel.jpg',NULL,1392148978,NULL,NULL,NULL,NULL,NULL,NULL,1392148978,'image',1200,560,395915,'CAROUSEL-Operation_Change-panel.jpg'),(257,1,'ee',NULL,1,'CAROUSEL-Operation_Change-thumb.jpg',NULL,1392148948,NULL,NULL,NULL,NULL,NULL,NULL,1392148948,'image',400,210,119073,'CAROUSEL-Operation_Change-thumb.jpg'),(258,1,'ee',NULL,1,'CAROUSEL-Philippines_Film.jpg',NULL,1392147834,NULL,NULL,NULL,NULL,NULL,NULL,1392147834,'image',1626,915,986228,'CAROUSEL-Philippines_Film.jpg'),(259,1,'ee',NULL,1,'CAROUSEL-West_Bank_Mission-IMG_5155.jpg',NULL,1392146646,NULL,NULL,NULL,NULL,NULL,NULL,1392146646,'image',936,624,519314,'CAROUSEL-West_Bank_Mission-IMG_5155.jpg'),(260,1,'ee',NULL,1,'DSC02337cc3Edit.jpeg',NULL,1392156580,NULL,NULL,NULL,NULL,NULL,NULL,1392156580,'image',3881,2450,6729305,'DSC02337cc3Edit.jpeg'),(261,1,'ee',NULL,1,'DSC08418cc_edit.jpg',NULL,1392155115,NULL,NULL,NULL,NULL,NULL,NULL,1392155115,'image',1401,789,1451770,'DSC08418cc_edit.jpg'),(262,1,'ee',NULL,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg',NULL,1392137683,NULL,NULL,NULL,NULL,NULL,NULL,1392137683,'image',1800,600,550846,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg'),(263,1,'ee',NULL,1,'HERO-Hearing_Aid_Recycling.jpg',NULL,1392235274,NULL,NULL,NULL,NULL,NULL,NULL,1392235274,'image',1800,525,256649,'HERO-Hearing_Aid_Recycling.jpg'),(264,1,'ee',NULL,1,'HERO-Program-Operation_Change.png',NULL,1392233125,NULL,NULL,NULL,NULL,NULL,NULL,1392233125,'image',1800,525,905909,'HERO-Program-Operation_Change.png'),(265,1,'ee',NULL,1,'LC-10-Sec-Video-01.png',NULL,1392231681,NULL,NULL,NULL,NULL,NULL,NULL,1392231681,'image',1304,380,517719,'LC-10-Sec-Video-01.png'),(266,1,'ee',NULL,1,'LC-10-Sec-Video-02.png',NULL,1392231774,NULL,NULL,NULL,NULL,NULL,NULL,1392231774,'image',1312,383,348995,'LC-10-Sec-Video-02.png'),(267,1,'ee',NULL,1,'MAP-Building_a_Better_Kibera.jpg',NULL,1392142611,NULL,NULL,NULL,NULL,NULL,NULL,1392142611,'image',410,378,177213,'MAP-Building_a_Better_Kibera.jpg'),(268,1,'ee',NULL,1,'MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg',NULL,1392140382,NULL,NULL,NULL,NULL,NULL,NULL,1392140382,'image',410,378,145645,'MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg'),(269,1,'ee',NULL,1,'MAP-Los-Angeles-Listen-Carefully.jpg',NULL,1392139207,NULL,NULL,NULL,NULL,NULL,NULL,1392139207,'image',410,378,144273,'MAP-Los-Angeles-Listen-Carefully.jpg'),(270,1,'ee',NULL,1,'MAP-Peru_Mission-02-DSC07062.jpg',NULL,1392140188,NULL,NULL,NULL,NULL,NULL,NULL,1392140188,'image',410,378,222090,'MAP-Peru_Mission-02-DSC07062.jpg'),(271,1,'ee',NULL,1,'MAP-Providing_Clean_Water_in_Tanzania.jpg',NULL,1392141018,NULL,NULL,NULL,NULL,NULL,NULL,1392141018,'image',410,378,163339,'MAP-Providing_Clean_Water_in_Tanzania.jpg'),(272,1,'ee',NULL,1,'MAP-Vikings_Mission-IMG_6064.JPG',NULL,1392139634,NULL,NULL,NULL,NULL,NULL,NULL,1392139634,'image',410,378,161384,'MAP-Vikings_Mission-IMG_6064.JPG'),(273,1,'ee',NULL,1,'MAP-Where_We_Are_Now-India-DSC03269cc.jpg',NULL,1392140852,NULL,NULL,NULL,NULL,NULL,NULL,1392140852,'image',410,378,199133,'MAP-Where_We_Are_Now-India-DSC03269cc.jpg'),(274,1,'ee',NULL,1,'MEDIA-WCCO-LOGO.png',NULL,1392331329,NULL,NULL,NULL,NULL,NULL,NULL,1392331329,'image',103,100,19411,'MEDIA-WCCO-LOGO.png'),(275,1,'ee',NULL,1,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',NULL,1392335392,NULL,NULL,NULL,NULL,NULL,NULL,1392335392,'image',64,31,4440,'Screen_Shot_2014-02-12_at_8.59.27_PM.png'),(305,1,'ee',NULL,1,'CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',NULL,1392849929,NULL,NULL,NULL,NULL,NULL,NULL,1392849929,'image',1679,947,600107,'CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg'),(277,1,'ee',NULL,1,'info_livesimpacted.jpg',NULL,1390202277,NULL,NULL,NULL,NULL,NULL,NULL,1390202277,'image',252,198,421952,'info_livesimpacted.jpg'),(278,1,'ee',NULL,1,'info_livesindirectly.jpg',NULL,1390202291,NULL,NULL,NULL,NULL,NULL,NULL,1390202291,'image',252,198,419655,'info_livesindirectly.jpg'),(279,1,'ee',NULL,1,'info_totalaids.jpg',NULL,1390202303,NULL,NULL,NULL,NULL,NULL,NULL,1390202303,'image',252,198,429587,'info_totalaids.jpg'),(280,1,'ee',NULL,1,'test_upload.png',NULL,1392260206,NULL,NULL,NULL,NULL,NULL,NULL,1392260206,'image',64,31,4440,'test_upload.png'),(296,1,'ee',NULL,1,'Main.jpg',NULL,1392681509,NULL,NULL,NULL,NULL,NULL,NULL,1392681509,'image',3946,2333,2355552,'Main.jpg'),(297,1,'ee',NULL,1,'Main_2.jpg',NULL,1392681513,NULL,NULL,NULL,NULL,NULL,NULL,1392681513,'image',6714,4265,5211133,'Main_2.jpg'),(298,1,'ee',NULL,1,'Rwanda.jpg',NULL,1392681561,NULL,NULL,NULL,NULL,NULL,NULL,1392681561,'image',3093,2533,5484707,'Rwanda.jpg'),(299,1,'ee',NULL,1,'Rwanda_Day_One_1226_edit.jpg',NULL,1392681537,NULL,NULL,NULL,NULL,NULL,NULL,1392681537,'image',3744,5616,8930944,'Rwanda_Day_One_1226_edit.jpg'),(300,1,'ee',NULL,1,'Rwanda_Day_Three_447.jpg',NULL,1392681562,NULL,NULL,NULL,NULL,NULL,NULL,1392681562,'image',5616,3744,9387054,'Rwanda_Day_Three_447.jpg'),(301,1,'ee',NULL,1,'Rwanda_Day_Two_212.jpg',NULL,1392681545,NULL,NULL,NULL,NULL,NULL,NULL,1392681545,'image',1872,2808,2481672,'Rwanda_Day_Two_212.jpg'),(302,1,'ee',NULL,1,'building_a_better_kibera.jpg',NULL,1392515437,NULL,NULL,NULL,NULL,NULL,NULL,1392515437,'image',1622,908,775997,'building_a_better_kibera.jpg'),(303,1,'ee',NULL,1,'peru_mission_02.jpg',NULL,1392515436,NULL,NULL,NULL,NULL,NULL,NULL,1392515436,'image',936,639,582876,'peru_mission_02.jpg'),(304,1,'ee',NULL,1,'west_bank_mission.jpg',NULL,1392515437,NULL,NULL,NULL,NULL,NULL,NULL,1392515437,'image',1591,895,713742,'west_bank_mission.jpg');
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_assets_folders`
--

LOCK TABLES `exp_assets_folders` WRITE;
/*!40000 ALTER TABLE `exp_assets_folders` DISABLE KEYS */;
INSERT INTO `exp_assets_folders` VALUES (1,'ee','Image Uploads','',NULL,NULL,1),(2,'ee','File Uploads','',NULL,NULL,2),(4,'ee','home','home/',1,NULL,1),(5,'ee','feature','home/feature/',4,NULL,1),(6,'ee','hero','home/hero/',4,NULL,1),(7,'ee','picto','home/picto/',4,NULL,1),(9,'ee','Missions_','Missions_/',1,NULL,1);
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
INSERT INTO `exp_assets_selections` VALUES (322,50,33,NULL,NULL,NULL,NULL,NULL,0,0),(314,7,33,NULL,NULL,NULL,NULL,NULL,0,0),(315,22,33,NULL,NULL,NULL,NULL,NULL,0,0),(313,8,33,NULL,NULL,NULL,NULL,NULL,0,0),(225,96,19,NULL,NULL,NULL,NULL,NULL,0,0),(226,74,19,NULL,NULL,NULL,NULL,NULL,0,0),(227,77,19,NULL,NULL,NULL,NULL,NULL,0,0),(228,80,19,NULL,NULL,NULL,NULL,NULL,0,0),(229,92,19,NULL,NULL,NULL,NULL,NULL,0,0),(230,94,19,NULL,NULL,NULL,NULL,NULL,0,0),(231,29,64,NULL,NULL,NULL,NULL,NULL,0,0),(232,56,64,NULL,NULL,NULL,NULL,NULL,0,0),(261,99,89,NULL,NULL,NULL,NULL,NULL,0,0),(261,100,89,NULL,NULL,NULL,NULL,NULL,0,0),(235,76,66,NULL,NULL,NULL,NULL,NULL,0,0),(255,6,33,NULL,NULL,NULL,NULL,NULL,0,0),(319,64,33,NULL,NULL,NULL,NULL,NULL,0,0),(305,65,33,NULL,NULL,NULL,NULL,NULL,0,0),(257,67,33,NULL,NULL,NULL,NULL,NULL,0,0),(353,6,36,NULL,NULL,NULL,NULL,NULL,0,0),(314,7,36,NULL,NULL,NULL,NULL,NULL,0,0),(313,8,36,NULL,NULL,NULL,NULL,NULL,0,0),(315,22,36,NULL,NULL,NULL,NULL,NULL,0,0),(322,50,36,NULL,NULL,NULL,NULL,NULL,0,0),(319,64,36,NULL,NULL,NULL,NULL,NULL,0,0),(305,65,36,NULL,NULL,NULL,NULL,NULL,0,0),(256,67,36,NULL,NULL,NULL,NULL,NULL,0,0),(307,4,2,NULL,NULL,NULL,NULL,NULL,0,0),(262,5,2,NULL,NULL,NULL,NULL,NULL,0,0),(306,20,2,NULL,NULL,NULL,NULL,NULL,0,0),(305,47,2,NULL,NULL,NULL,NULL,NULL,0,0),(341,9,28,NULL,NULL,NULL,NULL,NULL,0,0),(342,48,28,NULL,NULL,NULL,NULL,NULL,0,0),(343,38,28,NULL,NULL,NULL,NULL,NULL,0,0),(342,39,28,NULL,NULL,NULL,NULL,NULL,0,0),(344,40,28,NULL,NULL,NULL,NULL,NULL,0,0),(340,41,28,NULL,NULL,NULL,NULL,NULL,0,0),(309,54,74,NULL,NULL,NULL,NULL,NULL,0,0),(305,70,74,NULL,NULL,NULL,NULL,NULL,0,0),(311,75,74,NULL,NULL,NULL,NULL,NULL,0,0),(96,54,77,NULL,NULL,NULL,NULL,NULL,0,0),(22,70,77,NULL,NULL,NULL,NULL,NULL,0,0),(22,75,77,NULL,NULL,NULL,NULL,NULL,0,0),(316,101,101,25,1,NULL,NULL,'grid',0,0),(332,101,101,25,2,NULL,NULL,'grid',0,0),(241,101,103,29,1,NULL,NULL,'grid',0,0),(247,101,103,29,2,NULL,NULL,'grid',0,0),(337,103,106,38,1,NULL,NULL,'grid',0,0),(338,103,106,39,1,NULL,NULL,'grid',0,0),(339,103,106,40,1,NULL,NULL,'grid',0,0),(121,105,112,NULL,NULL,NULL,NULL,NULL,0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
INSERT INTO `exp_categories` VALUES (1,1,1,0,'US','us','','',1),(2,1,1,0,'Central America & Caribbean','central-america-caribbean','','',2),(3,1,1,0,'Africa','africa','','',3),(4,1,1,1,'California','california','','',1),(5,1,1,1,'Massachusetts','massachusetts','','',3),(6,1,1,1,'New Jersey','new-jersey','','',2),(7,1,1,2,'Panama','panama','','',1),(8,1,1,3,'Ethiopia','ethiopia','','',1),(9,1,1,3,'Malawi','malawi','','',2),(10,1,1,3,'Nigeria','nigeria','','',3),(11,1,1,3,'South Africa','south-africa','','',4),(12,1,1,0,'ASIA','asia','','',4),(13,1,1,12,'Philippines','philippines','','',1),(14,1,1,12,'Vietnam','vietnam','','',2),(15,1,1,0,'SOUTH AMERICA','south-america','','',5),(16,1,1,15,'Colombia','colombia','','',1),(17,1,1,0,'EUROPE','europe','','',6),(18,1,1,17,'Germany','germany','','',1),(19,1,1,0,'AUSTRALIA','australia','','',7);
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
INSERT INTO `exp_category_field_data` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
INSERT INTO `exp_category_groups` VALUES (1,1,'Countries','c',0,'all','','');
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
INSERT INTO `exp_category_posts` VALUES (99,3);
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
  `field_id_82` text,
  `field_ft_82` tinytext,
  `field_id_83` varchar(8) DEFAULT NULL,
  `field_ft_83` tinytext,
  `field_id_84` text,
  `field_ft_84` tinytext,
  `field_id_85` text,
  `field_ft_85` tinytext,
  `field_id_86` text,
  `field_ft_86` tinytext,
  `field_id_87` text,
  `field_ft_87` tinytext,
  `field_id_88` text,
  `field_ft_88` tinytext,
  `field_id_89` text,
  `field_ft_89` tinytext,
  `field_id_90` text,
  `field_ft_90` tinytext,
  `field_id_91` text,
  `field_ft_91` tinytext,
  `field_id_92` varchar(8) DEFAULT NULL,
  `field_ft_92` tinytext,
  `field_id_93` text,
  `field_ft_93` tinytext,
  `field_id_94` text,
  `field_ft_94` tinytext,
  `field_id_95` int(10) DEFAULT '0',
  `field_dt_95` varchar(50) DEFAULT NULL,
  `field_ft_95` tinytext,
  `field_id_96` text,
  `field_ft_96` tinytext,
  `field_id_97` text,
  `field_ft_97` tinytext,
  `field_id_98` text,
  `field_ft_98` tinytext,
  `field_id_99` text,
  `field_ft_99` tinytext,
  `field_id_100` text,
  `field_ft_100` tinytext,
  `field_id_101` text,
  `field_ft_101` tinytext,
  `field_id_102` text,
  `field_ft_102` tinytext,
  `field_id_103` text,
  `field_ft_103` tinytext,
  `field_id_104` text,
  `field_ft_104` tinytext,
  `field_id_105` text,
  `field_ft_105` tinytext,
  `field_id_106` text,
  `field_ft_106` tinytext,
  `field_id_107` text,
  `field_ft_107` tinytext,
  `field_id_108` text,
  `field_ft_108` tinytext,
  `field_id_109` text,
  `field_ft_109` tinytext,
  `field_id_110` varchar(8) DEFAULT NULL,
  `field_ft_110` tinytext,
  `field_id_111` int(11) DEFAULT '0',
  `field_ft_111` tinytext,
  `field_id_112` text,
  `field_ft_112` tinytext,
  `field_id_113` text,
  `field_ft_113` tinytext,
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
INSERT INTO `exp_channel_data` VALUES (2,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(3,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(4,1,1,'In 2010, we committed to providing 100,000 hearing aids a year to those in need','none','{filedir_1}HERO-Commitment_to_Action_Film.jpg','none','http://www.youtube.com/watch?v=ScjOkoueDYg','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(5,1,1,'To truly make an impact, our efforts must be sustainable','none','{filedir_1}HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg','none','http://www.youtube.com/watch?v=W50L7eNGT2U','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(6,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Celebrity_Film-thumb.jpg','none','Watch','none','Celebrity Support ','none','{filedir_1}CAROUSEL-Celebrity_Film-panel.jpg','none','http://www.youtube.com/watch?v=03KTq85Y3wM','none','','none','','none','<p>Starkey Hearing Foundation is fortunate to have hundreds of high-profile friends to help us raise awareness and generate support, and for many, their commitment also extends into the mission field.</p>\n\n<p>Watch as our celebrity ambassadors explain why they support the gift of hearing.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(7,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','Watch Now','none','Listen Carefully Goes Live','none','{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','http://www.youtube.com/watch?v=rlyH-ZcCf7o','none','Learn More','none','/programs#/programs/1','none','<p>Disney and Nickelodeon stars Chris and Kyle Massey join Grammy Award-winning songwriter/producer Dallas Austin to educate a crowd of more than 1,400 at our launch event. The music and sound experience inspired not only a dance contest but also sent the right message: <em>Hearing is fragile. Listen Carefully.&nbsp;</em></p>\n\n<p>Watch all the highlights.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(8,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','Watch Now','none','Recycling Sound','none','{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','http://www.youtube.com/watch?v=tF-9R4UUWa8','none','Learn More ','none','/programs#/programs/3','none','<p>Every year thousands of used hearing aids are donated to our Hear Now program people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Starkey Hearing Foundation.</p>\n\n<p>Watch as we take you through the recycling process.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(9,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We Are Now ','none','{filedir_1}icon_now.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(10,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','28.6','none','77.2','none','India ','none','<p>The mission team is excited to be back in India working with our Starkey India team to give the gift of hearing across four cities.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Where_We_Are_Now-India-DSC03269cc.jpg','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(11,1,2,'',NULL,'',NULL,'',NULL,' ','xhtml',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'Using Hearing as a Vehicle to Change Lives Around the World.','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(32,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(33,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(34,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(35,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(36,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(16,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Hearing Missions','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(17,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>&#8203;testing</p>','none','','xhtml','','xhtml','','xhtml','',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none',' ','xhtml',' ','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(19,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Our global work developing sustainable systems of hearing care gives us a unique window into the many challenges facing people around the world. Hearing is our vehicle to change lives, but we know we can only do so much alone. In order to create real change, we must harness the power of many and develop a holistic approach to address the multitude of pressing global challenges.</p>\n\n<p>It empowers individuals to discover their passions and channel them in ways that will improve their communities and ultimately, the world. Through Operation Change we are providing the inspiration to drive engagement and develop a roadmap to create collective impact. This multimedia campaign incorporates a documentary series, a web platform and social media to encourage individual philanthropy and tap into the energy of a generation.</p>\n\n<p>We believe that the actions of a single person can create a ripple effect that will ignite a movement and change the world.</p>\n\n<p>[gallery id=\"operation-change-intro-video\"]</p>','none','<h1>Listen Carefully</h1>\n\n<p>Research shows that 1 in 8 children and teens in the United States has hearing loss, largely due to high-volume sounds in daily life. Most hearing loss among teens can be avoided if simple protective measures&ndash;such as lowering the volume&ndash;are taken.</p>\n\n<p>The program combines music and education to raise awareness about the fragility of hearing and the dangers of exposure to high decibel sounds.&nbsp;This year Starkey Hearing Foundation expanded Listen Carefully to offer educational support to more than 16,000 teachers and nearly 500,000 students nationwide.</p>\n\n<p>[gallery id=\"listen-carefully-10-second-film\"]</p>\n\n<h1>&nbsp;</h1>\n\n<h1>Make a Difference&nbsp;</h1>\n\n<p>Start with yourself. Your family. Your friends. Because you understand the transformative, interconnecting power of hearing. 1 in 5 Americans has hearing loss-meaning we&rsquo;re losing our hearing faster, today, than our parents or grandparents did.</p>\n\n<p>[gallery id=\"listencarefully2\"]</p>\n\n<p>&nbsp;</p>\n\n<h1>Educate Yourself&nbsp;</h1>\n\n<p>Loud sounds are often part of daily life. Repeat or elongated exposure to high-volume sounds&ndash;such as music pumped through headphones&ndash;harms hearing over time.</p>\n\n<p>Your ears are complex organs, but protecting them is relatively simple. Use these resources to increase your awareness. And share what you know.</p>\n\n<p>[gallery id=\"listencarefully3\"]</p>','none','<p>Starkey Hearing Foundation has provided more hearing help to people in the United States than to any other country. We do this through domestic missions and also Hear Now, our application-based program that provides hearing help to low-income Americans. Hear Now is committed to assisting U.S. residents with hearing loss, who have no resources to acquire hearing aids. Starkey Hearing Foundation provides the hearing aids and runs the program, but we count on the generosity of Hear Now providers and donors across the country to ensure its success.&nbsp;Each person we help is fit with new, top-of-the-line digital hearing aids that are customized to their hearing loss.&nbsp;</p>\n\n<p>If you or someone you know is struggling with hearing loss and unable to afford hearing aids, call 1-800-328-8602 or complete the form below, and a Hear Now representative will be in touch with you.&nbsp;</p>\n\n<p>[gallery id=\"hearnow\"]</p>','none','<p>Every year thousands of hearing aids are donated to our Hear Now program from hearing professionals and other people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation. However, the journey from donation to the mission field is an absolute labor of love.&nbsp;</p>\n\n<p>[gallery id=\"hearingaidrecycling\"]</p>\n\n<p>Send us your old hearing aids, to give the gift of hearing to those in need and contribute to a healthy environment. Any make or model, regardless of age, can be donated. All donations are tax deductible* and a letter of acknowledgment will be sent to all donors.<br />\n&nbsp;</p>\n\n<h2><strong>Ready to contribute your hearing devices? Follow these simple steps to send them in:</strong></h2>\n\n<p>1. Place the hearing aid in a crush-proof box, old pill bottle, or other secure package.</p>\n\n<p>2. Register and insure the package, if possible, to ensure that receipt of your donated device</p>\n\n<p>3. Mail to:<br />\nStarkey Hearing Foundation<br />\nATTN: Hearing Aid Recycling<br />\n6700 Washington Avenue South<br />\nEden Prairie, MN 55344<br />\n<br />\n<strong>For more information, contact us at:</strong><br />\nhearnow@starkeyfoundation.org<br />\n(866) 354-3254</p>\n\n<hr />\n<p><small>*Please note: Due to the diversity in age, make, and condition of the aids we receive, it is not possible for us to determine a tax-deductible value for each aid.<br />\nPlease consult your tax advisor.</small></p>','none','',NULL,NULL,NULL,'',NULL,'<p>Starkey Hearing Foundation&rsquo;s commitment to global hearing health begins right here at home.&nbsp;Along with our worldwide missions, our national programs contribute to an entire system of care.&nbsp;Everyone can make a difference in the lives of those across the world or just next-door. Together, we can create a movement that brings peace and understanding through the gift of hearing.</p>','none','programs@starkeyfoundation.org','none','If you have already spoken with a representative and need an application, you can download one here:','none','{filedir_2}FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf','none','{filedir_2}FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf','none',' ','xhtml',' ','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(20,1,1,'We provide more hearing help to people in the United States than to any other country','none','{filedir_1}HERO-Vikings_Mission-IMG_6312.jpg','none','http://www.starkeyhearingfoundation.org/programs/hear-now/','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(22,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','Experience More','none','Gift of Hearing in Peru ','none','{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','','none','','none','','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(48,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We were Yesterday','none','{filedir_1}icon_stories.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(31,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(97,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','','none','','none','','none',1370460780,'','none','','none','','none','http://www.clintonfoundation.org/blog/2013/08/02/starkey-executive-director-speaks-miracle-watching-patients-hear-very-first-time','none','','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(38,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Program','none','{filedir_1}icon_program.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(39,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Stories','none','{filedir_1}icon_stories.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(40,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Video ','none','{filedir_1}icon_video.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(41,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Gallery','none','{filedir_1}icon_gallery.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(42,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','34.052234','none','-118.243685','none','Los Angeles, CA','none','<p><span style=\"line-height:1.6em\">Chris and Kyle Massey joined our team as we spread the word about the importance of protecting your hearing at Tony Hawk&rsquo;s 2013 Stand Up for Skateparks. W</span><span style=\"line-height:1.6em\">e were encouraged to see the message stick as </span><span style=\"line-height:1.6em\">the audience wore the hearing protection we distributed during a headlining performance by Modest Mouse.</span></p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.starkeyhearingfoundation.org/programs/listen-carefully/ ','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Los-Angeles-Listen-Carefully.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(25,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(26,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(29,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png','none','','none','','none',1390869960,'','none','','none','READ MORE','none','http://minnesota.cbslocal.com/2014/01/27/twins-blog-the-first-starkey-mission/','none','WCCOO','none','false','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(47,1,1,'Learn all about the homepage slider ','none','{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','www.starkey.com','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(49,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-3.867910','none','36.431122','none','Loiborsoit, Tanzania ','none','<p>Whether it&#39;s&nbsp;projects in housing, education, clean water, HIV/AIDS research or agriculture, hearing is our vehicle to do so much more. It brings us to a region to help affect greater change, but in order to do that we need strong partners.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=OJ4W9zzjgII','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Providing_Clean_Water_in_Tanzania.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(50,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}COVER_pianoboy_cc.jpg','none','Learn More ','none','Testing out the Bottom Carousel ','none','{filedir_1}COVER_pianoboy_cc.jpg','none','http://www.youtube.com/watch?v=OJ4W9zzjgII','none','Read More ','none','','none','<p>Read here to find out about starkey hearing missions&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(52,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(53,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','','none','','none','','none','','none',0,'','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(54,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}Blog_A_Knight.jpg','none','CNN ','none','<p><span style=\"line-height:1.6em\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc cursus aliquam diam, vitae mollis neque egestas sed. In eu tellus blandit, pellentesque mi non, venenatis velit. Phasellus malesuada tempor tellus quis rhoncus. Vivamus condimentum eget mauris at pharetra. Morbi a ipsum ornare, imperdiet justo sed, pulvinar enim. Nam sem turpis, dapibus quis felis ac, consequat dignissim odio. Morbi non hendrerit nisl, eu accumsan justo. Maecenas vel metus urna.</span></p>\n\n<p>Fusce a varius nibh, vel lacinia elit. Nulla facilisi. Nunc id sollicitudin turpis. Etiam elit nisi, volutpat eu placerat ut, volutpat vitae magna. Nunc porta et massa non sodales. Curabitur imperdiet non elit eu pellentesque. Nullam iaculis orci lobortis nisl iaculis luctus. Duis placerat dolor sed tincidunt vestibulum. Aenean lacinia dictum massa molestie iaculis. Vivamus tortor orci, pharetra at ante et, euismod mattis magna. Ut cursus arcu vitae molestie feugiat.</p>\n\n<p>Etiam hendrerit justo sem, id posuere ante pretium venenatis. Nulla et est a lectus commodo pulvinar malesuada egestas lorem. Pellentesque mauris ante, viverra ac ornare et, condimentum congue eros. Donec elementum lectus tortor. Vestibulum ante nulla, hendrerit a massa id, pretium convallis neque. Donec mauris orci, blandit vitae consectetur in, feugiat eu nulla. Donec sed ipsum aliquam, congue eros a, semper sem. Praesent vehicula sodales nisi, ac consequat dolor euismod eu.</p>\n\n<p>Duis eu diam ac turpis iaculis bibendum. Aliquam ornare diam id erat condimentum porttitor. Integer fermentum, nunc in dapibus sagittis, neque eros vestibulum felis, ac condimentum est lectus ornare risus. Nulla facilisis quam id leo porttitor vestibulum. Etiam feugiat dui non iaculis rhoncus. Aliquam felis eros, vulputate eget feugiat vitae, interdum at velit. Nam sodales lorem et risus consequat, non interdum elit malesuada. In sollicitudin commodo aliquet. Duis elementum viverra lorem a vestibulum. Sed varius leo vitae mauris ultricies consectetur. Nulla facilisi. Aliquam semper non enim eu suscipit.</p>\n\n<p>Duis eget convallis tortor. Integer augue mauris, vehicula vel justo et, semper laoreet tellus. Integer lobortis turpis eu dolor egestas, vulputate lobortis magna tempor. Proin sit amet condimentum justo. Donec dictum, elit nec interdum consequat, neque est molestie tortor, et interdum ligula nibh in leo. Morbi et aliquam ipsum, ultrices pellentesque sapien. Praesent rhoncus nibh quis urna volutpat porttitor. Sed sit amet arcu feugiat, congue turpis et, molestie elit. Fusce ut quam non augue sagittis lacinia sed eu risus. Sed venenatis nisl risus, eu cursus magna bibendum sit amet. Vivamus pulvinar sit amet augue interdum semper. Suspendisse tempor accumsan massa quis fringilla.</p>\n\n<p>Quisque quam mi, sodales ut diam id, imperdiet egestas orci. Pellentesque mattis urna vitae pulvinar facilisis. Maecenas sed lorem porttitor, tristique massa vel, semper dui. Maecenas vestibulum magna et lacus lobortis pulvinar. Aliquam erat volutpat. Nullam nisl arcu, euismod id elit in, scelerisque placerat diam. Pellentesque nec faucibus nulla.</p>\n\n<p>Nulla facilisi. Nunc eget turpis posuere, pretium lectus a, interdum arcu. Duis ultrices orci libero, non molestie mauris vulputate et. Mauris placerat pellentesque ligula, pellentesque dapibus tellus commodo sed. Nunc commodo, tellus venenatis placerat fringilla, purus urna hendrerit enim, eget euismod sapien ligula et justo. In at sem a justo fringilla semper. Sed interdum vestibulum nisi, et lacinia lorem semper eu. Aliquam ultrices ullamcorper orci malesuada aliquam. Cras a nisl molestie, volutpat sem ut, interdum lorem. Duis in iaculis diam, eget rhoncus purus. Donec ut vulputate nisi.</p>\n\n<p>Mauris blandit justo mi, id fringilla neque viverra at. Phasellus a gravida nunc. Duis posuere ipsum id ante laoreet sodales. Suspendisse auctor justo orci, et auctor urna congue sed. Nullam eget eleifend est. Nulla ac adipiscing enim. Phasellus at tincidunt nisl. Aliquam ac cursus justo. Sed pharetra nibh et eleifend tincidunt. Nam luctus, ligula at facilisis vehicula, purus lacus viverra arcu, non congue nulla dui id turpis. Nunc est mi, congue eget sem id, scelerisque egestas risus. Phasellus hendrerit est non ante mollis feugiat. Donec adipiscing enim augue. Integer tellus mauris, porta at ultrices ut, elementum eu dui</p>','none','{filedir_2}pdf_download_tes.pdf','none','press@starkeyfoundation.org','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(96,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg','none','Events','none',1391458080,'','none','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque eu eros quis ultrices. Integer blandit molestie felis. Nunc porttitor leo volutpat nibh elementum sollicitudin. Curabitur molestie velit at orci vulputate, at suscipit lacus mattis. Aenean eu velit lacus. In malesuada adipiscing erat ac vestibulum. Donec ultrices, est ut porta pellentesque, mi arcu gravida lorem, mollis egestas turpis turpis scelerisque felis. Ut risus massa, suscipit id orci interdum, consectetur malesuada felis. Nulla convallis elit diam, eget sollicitudin arcu fermentum et. Cras euismod vel dui sed tempus. Pellentesque egestas leo in lobortis malesuada. Curabitur cursus condimentum aliquet. Quisque non faucibus lacus. Praesent accumsan lacus sit amet urna pulvinar placerat.</p>\n\n<p>Donec id congue arcu. Duis sagittis, erat eget rhoncus volutpat, metus ipsum hendrerit lacus, ac accumsan risus orci accumsan diam. Ut ultrices nisl ante, a ultricies ligula malesuada vulputate. Vivamus aliquet enim at justo pellentesque, et scelerisque elit tincidunt. Nam consectetur, felis sit amet pretium fringilla, tortor est imperdiet augue, id aliquet velit lectus ac dui. Praesent blandit convallis nisl, et laoreet risus egestas nec. Donec aliquet tortor vitae ipsum porttitor fringilla vel non diam. Quisque fermentum egestas arcu non scelerisque. Cras nisi est, congue quis justo eget, laoreet porta nunc.</p>\n\n<p>In in lobortis sem. Nullam et sapien id turpis sodales porta. Sed pellentesque euismod nisl, vitae dictum erat faucibus at. Pellentesque blandit vehicula nisl, vel volutpat lorem fermentum quis. Duis a velit in lorem fermentum mattis. Donec interdum venenatis odio, ac volutpat elit porta vitae. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>\n\n<p>Curabitur fringilla, lacus non facilisis tincidunt, est libero viverra tellus, adipiscing eleifend leo mi eget lacus. Phasellus a urna consequat, ultricies neque at, sagittis urna. Nam ac sollicitudin erat. Maecenas vel purus quis tellus faucibus auctor. Duis accumsan justo quis ligula sollicitudin aliquam. Nulla consequat tincidunt cursus. Proin id dui tempus, mollis metus et, venenatis dui. Morbi vestibulum elit massa, eu cursus lorem commodo ut. Duis pellentesque erat justo, vitae porta turpis vulputate sed. Nulla sollicitudin mattis justo, in aliquet risus rutrum nec.</p>\n\n<p>Duis tristique velit sapien, a placerat nunc lacinia at. Fusce metus dui, vulputate molestie ullamcorper quis, eleifend eu sapien. Sed pulvinar sem id massa sagittis condimentum. Nullam fermentum tellus hendrerit nisi suscipit, et scelerisque velit interdum. Nullam nec metus urna. Praesent vestibulum ipsum diam, eu viverra justo consequat vitae. Sed quis congue lectus, quis sodales libero. Maecenas malesuada dictum massa interdum aliquam.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>[gallery id = \"testing-gallery-2\"]</p>','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(56,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}MEDIA-08.02_.14_CGI_Blog_.png','none','','none','{filedir_1}Clinton_Foundation_Logo.png','none',1391388900,'','none','Executive Director Steven Sawalich discusses the critical need for increasing access to hearing aid technology in sub-Saharan Africa, his sustainable approach to restoring children\'s sense of hearing, and the one patient he will never forget. ','none','Read More ','none','http://www.clintonfoundation.org/blog/2013/08/02/starkey-executive-director-speaks-miracle-watching-patients-hear-very-first-time','none','Clinton Global Initiative','none','false','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(59,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','44.881702','none','-93.400947','none','Eden Prairie, MN','none','<p>Traveling from nearby Metro Deaf School and Faribault School for the Deaf and from as far away as California, Missouri and Indiana, more than 50 patients arrived at Starkey Hearing Foundation headquarters for a joint hearing mission with the Minnesota Vikings.&nbsp;Overjoyed to meet their heroes, the children taught Vikings superstars, including&nbsp;Adrian Peterson and&nbsp;Greg Jennings, some sign language.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Vikings_Mission-IMG_6064.JPG','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(60,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-5.185310','none','-80.649003','none','Peru','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Peru_Mission-02-DSC07062.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(61,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-26.333806','none','28.390688','none','Bhubezi, South Africa','none','<p>Our Founder Bill Austin says, \"Alone we can&#39;t do much. Together we can change the world.\" We believe that by working together and building strong partnerships, we can make an even greater impact. In October 2013, we once again partnered with Sir Richard Branson and our friends at Virgin Unite to change lives at their Bhubezi Health Care Clinic in South Africa.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=VJqzdck05iA','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(62,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','31.952162','none','35.233154','none','West Bank','none','<p>Starkey Hearing Foundation&nbsp;is excited to be heading back to the West Bank soon for an upcoming hearing mission. Our work in the region has shown us how hearing brings people together and serves as a vehicle for peace and understanding.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=UakFpSGn_AA&feature=c4-overview-vl&list=PLc9R442DNsrtj12vqxhT5kbVDBSDNLpqm','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(63,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','-1.292066','none','36.821946','none','Nairobi, Kenya','none','<p>Shining Hope for Communities guided us through the narrow streets of Kibera, the largest urban slum in Africa, we found enormous inspiration in the ability of the human spirit to triumph over adversity. The Clinton Global Initiative has inspired us to make a new commitment to use the power of our network and resources to mobilize partnerships and create a sustainable impact in Kibera.</p>','none','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'http://www.youtube.com/watch?v=qIAXkz08aiI','none','Watch Now','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}MAP-Building_a_Better_Kibera.jpg','none',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(64,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-William_F._Austin_Legacy_Film.jpg','none','Watch Now','none','Bill Austin Legacy','none','{filedir_1}CAROUSEL-William_F._Austin_Legacy_Film.jpg','none','http://www.youtube.com/watch?v=ZVDuN-ksyT0','none','Watch Now','none','http://www.youtube.com/watch?v=ZVDuN-ksyT0','none','<p>How did Bill Austin go from creating a one-room hearing aid repair shop to one of the largest hearing aid manufacturers in the world - and a foundation that&#39;s creating an infrastructure of hearing health globally for people in need?</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(65,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','Watch Now','none','2013 So the World May Hear Awards Gala Highlights','none','{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','http://www.youtube.com/watch?v=KD8h8zNpd48','none','Learn More','none','http://www.starkeyhearingfoundation.org/galas/the-13th-annual-awards-gala-28-2013/','none','<p>Whether it was the bald eagle soaring over the crowd as Nita Whitaker sang &ldquo;Amazing Grace,&rdquo; impassioned speeches from twin brothers Ashton and Michael Kutcher, or special surprise guests for Bill Austin, the 2013 So the World May Hear Awards Gala was an evening we will never forget. Our latest film brings you all the highlights and magic from this year&rsquo;s Gala.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(67,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Operation_Change-thumb.jpg','none','Learn More','none','Operation Change','none','{filedir_1}CAROUSEL-Operation_Change-panel.jpg','none','http://www.youtube.com/watch?v=na5j0wDq7kc','none','Learn More','none','/programs#/programs/0','none','<p>Operation Change is attempting to create a consciousness shift that brings people together to meet challenges. Rousing viewers to become a part of a movement, the documentary series takes us on a journey around the world to witness the fabric of life through stories of hope and triumph that allows us to see how connected we truly are.</p>\n\n<p>Find out more about how you can join the movement.&nbsp;</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(74,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg','none','Hearing Missions','none',1389053460,'','none','<p>Joined by musician Michael Johns and volunteers from Impact Steel and Starkey Mexico, the team was revitalized by the warmth, joy and unforgettable smiles of the patients and families in Queretaro, Mexico. Watch our latest video blog and share in the personal and transformative experiences the volunteers on this special hearing mission will hold dear to their hearts for the rest of their lives.</p>\n\n<p>[gallery id = \"transforming-through-volunteerism-in-queretaro\"]</p>','none','Foundation Staff','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(70,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','none','SHF Team ','none','<h3 style=\"color:#aaa; font-style:italic\">Foundation ahead of schedule to fit one million hearing aids this decade</h3>\n\n<p>MINNEAPOLIS (February 19, 2013) &ndash; The Starkey Hearing Foundation expanded its efforts to record levels in 2012. Fitting more than 131,000 hearing aids to people in need, the foundation surpassed its Clinton Global Initiative commitment of fitting 100,000 hearing aids annually. At this rate, it is 25 percent ahead of schedule for fitting one million people this decade.</p>\n\n<p>Hearing missions are the primary way Starkey Hearing Foundation realizes its goal:&nbsp;So the World May Hear. This past year, the foundation&rsquo;s team of audiologists and staff conducted international and domestic hearing missions in 65 cities across 25 countries. The foundation changed lives with the gift of hearing in nine new countries in 2012, including Ethiopia, Lebanon, Malaysia, Papua New Guinea, China, Senegal, Ghana, Nigeria and Liberia &mdash; expanding its reach to more than 100 countries.</p>\n\n<p>Most recently, the team fit more than 100 people, including nearly 50 children, with customized, free hearing devices at two missions in New Orleans on February 1 and 2, leading up to the professional football championship game. Starkey was joined by celebrity and professional athlete volunteers, including country music superstar Garth Brooks, American Idol winner Jordin Sparks and NFL players Craig Stevens of the Tennessee Titans, Greg Jennings from the Green Bay Packers, Kyle Rudolph from the Minnesota Vikings and Brian de la Puente from the New Orleans Saints.</p>\n\n<p>&ldquo;The Starkey Hearing Foundation has done a tremendous job impacting lives, and as an athlete and role model, I try to do the same,&rdquo; said Jennings. &ldquo;Starkey is one of the best charities I know that is trying to impact lives on a daily basis, not just once or twice a year.&rdquo;</p>\n\n<p>Celebrity and professional athlete volunteers commonly assist at the foundation&rsquo;s missions where they witness the life-changing impact of this cause and support recipients as they are fitted with their new hearing aids, receive audio testing, counseling and instruction on how to care for their new devices, all courtesy of Starkey Hearing Foundation.</p>\n\n<p>Says Sparks, who also attended a mission in Rwanda in 2011, &ldquo;It was a lot of hard work, but it was really rewarding. It&rsquo;s amazing to see the foundation&rsquo;s reach is so much further than just here in the United States.&rdquo; Sparks hopes to attend another mission in the future and says, &ldquo;I&rsquo;ll always be a fan of the Starkey Foundation.&rdquo;</p>\n\n<p>The Starkey Hearing Foundation looks forward to making an even bigger impact in 2013. Missions are being planned for Mexico, Haiti, South Africa, Tanzania, Cambodia, Papua New Guinea, India, Ethiopia, Malaysia, China, Uganda, Rwanda and the Philippines.</p>\n\n<p>The foundation changes lives through more than just missions. This past year it launched the&nbsp;Listen Carefully&nbsp;teaching guide to nearly 500,000 students to educate them about hearing protection and care. The foundation also provided more than 8,500 digital hearing aids to Americans in need through&nbsp;Hear Now, a domestic program to help those in need, and recycled more than 45,000 used hearing aids.</p>\n\n<p>The foundation&rsquo;s largest fundraiser, The&nbsp;So the World May Hear&nbsp;Awards Gala, also set a new record in 2012, raising more than $7.6 million to support its work around the world.</p>\n\n<p>&ldquo;The team is excited for the new opportunities and adventures 2013 will bring,&rdquo; said Bill Austin, founder of Starkey Hearing Foundation. &ldquo;We are passionate about making a difference in people&rsquo;s lives here and around the world by showing them that we care. Watching somebody light up as they hear for the first time is an incredible experience, and sharing that moment is something you never forget.&rdquo;</p>\n\n<p>According to Starkey Hearing Foundation, hearing loss is pervasive, affecting 34 million Americans &mdash; about one in ten. Yet, with the help of a hearing device, hearing loss can often be corrected, giving an individual the opportunity to better connect with their family, the community and the world around them.</p>\n\n<p>More information about the foundation&rsquo;s work can be found at Starkey Hearing Foundation&rsquo;s&nbsp;website, as well as via Starkey Hearing Foundation&rsquo;s&nbsp;Facebook&nbsp;and&nbsp;Twitter&nbsp;pages.</p>\n\n<p>About Starkey Hearing Foundation</p>\n\n<p>Starkey Hearing Foundation uses hearing as a vehicle to reflect caring and improve the lives of individuals, families and communities around the world, by helping them reach their full potential. Hearing loss affects one in 10 Americans, and 63 million children worldwide, yet many do not have access to the hearing devices that can help them. Starkey Hearing Foundation fits and gives more than 100,000 hearing aids annually, and as a member of President Clinton&rsquo;s Global Initiative, it has pledged to fit one million hearing aids this decade. In addition to giving the gift of hearing through worldwide hearing missions, Starkey Hearing Foundation promotes hearing health awareness and education through the Listen Carefully initiative and provides hearing instruments to low-income Americans through the Hear Now program. For more information on Starkey Hearing Foundation, visit www.starkeyhearingfoundation.org.</p>','none','{filedir_2}SHF_2012Overview_NewsRelease_FINAL1.docx','none','pr@starkeyhearingfoundation.org','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(75,1,13,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Building_a_Better_Kibera.jpg','none','','none','<p>Foundation pledges hearing help to people affected by the Boston Marathon attack</p>\n\n<p>&nbsp;Minneapolis (April 18, 2013) &ndash; In response to the Boston Marathon tragedy, Starkey Hearing Foundation is offering free assistance to those who may have suffered hearing loss or tinnitus (residual ringing in the ears) as a result of the explosion.</p>\n\n<p>The Foundation believes this is a time when many should come together to extend caring hands, and people joining together to reflect light will outshine these moments of darkness. Starkey Hearing Foundation has helped people in need for more than 30 years and is hoping that by providing hearing assistance, it can play a small role in the recovery efforts in Boston.</p>\n\n<p>Individuals that think they may need hearing help should contact Starkey Hearing Foundation. The Foundation will work with local partners in the greater Boston area to make sure they receive hearing testing and care and will also provide hearing aids to the people that need them.</p>\n\n<p>For assistance, please contact:</p>\n\n<p>Starkey Hearing Foundation</p>\n\n<p>866.354.3254</p>','none','{filedir_2}SHF_2012Overview_NewsRelease_FINAL1.docx','none','info@starkeyfoundation.org','none','','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(73,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(76,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}ABC_tani_austin_sr_140121_16x9_608.jpg','none','','none','{filedir_1}ABClogo.jpg','none',1390352040,'','none','Hearing is very emotional, Tani Austin said. It’s the road to the heart.\n','none','READ MORE','none','http://abcnews.go.com/blogs/health/2014/01/21/couple-brings-gift-of-hearing-to-impaired-across-the-globeusand/','none','ABC News ','none','false','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(77,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BLOG-Unstoppable_Spirit_LEAD.jpg','none','Hearing Missions','none',1362507480,'','none','<p>Like a typical 9-year-old girl, Maci Rowan loves the band One Direction and will proudly proclaim to anyone listening that her favorite song is&nbsp;What Makes You Beautiful. However, Maci is anything but typical. Born with cerebral palsy, she has had to overcome some significant physical obstacles in her short life. These obstacles became even more daunting last year when she began to suffer hearing loss.</p>\n\n<p>Despite her hearing loss, Maci continued to seek out ways to connect to the world and outlets for her jubilant energy and desire to learn. Unfortunately, Maci&rsquo;s normally excellent grades began to fall, and her frustration with not doing well in school and inability to connect with her peers and teachers, caused her to act out in class.&nbsp; At home, she turned to her dolls for company and connection. Her mother Christy became increasingly concerned over Maci&rsquo;s retreat into isolation. She recognized that hearing loss was to blame and reached out to Starkey Hearing Foundation for help.</p>\n\n<p>[gallery id = \"an-u\"]</p>\n\n<p>When Maci came to see us in New Orleans, her smile lit up the room, and her laughter was contagious. We had invited Maci to our Friday mission in partnership with Garth Brooks&rsquo; Super ProCamps, so that she could not only receive the gift of hearing but also participate in all the fun activities for the children. We watched in amazement as NFL stars were drawn to her boundless joy and curiosity. The Foundation team and our celebrity volunteers just couldn&rsquo;t get enough of Maci. &nbsp;Explaining her daughter&rsquo;s unique spirit, Christy said with a smile, &ldquo;She has always been this way. Once she gets you wrapped around her finger, you&rsquo;re lost. You have no chance of disciplining her.&rdquo;</p>\n\n<p>By the time she sat in Bill Austin&rsquo;s chair to receive the gift of hearing, Maci had not heard her own voice in months, but once she was fit, she beamed her irrepressible light and cried out, &ldquo;Oh! I can talk again!&rdquo;</p>\n\n<p>Able to confidently connect with the world again, Maci immediately joined the kids participating in the ProCamps cheerleading activities and won the &ldquo;Champion of the Day&rdquo; award. We know that with the gift of hearing this amazing girl will continue winning and inspire many more hearts and minds.</p>','none','SHF Staff','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(78,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(79,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(80,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg','none','Hearing Missions','none',1377811140,'','none','<p>Here&rsquo;s something to brighten your day! It certainly brightened ours. Witness the overwhelming joy and gratitude of a 96-year-old man in Trujillo, Peru reconnected to the world of sound after 40 years of silence. Praising God and everyone around him, the man sang, &ldquo;Continue to watch over me! I am here with my brothers. Please give us your grace. All my life this is how I will be. I will carry on, thanks to everyone! Thanks to God!&rdquo;</p>\n\n<p>His unbridled joy brought him to his feet in dance, as he immediately began to relish in all the sounds of life.</p>\n\n<p>[gallery id=\"blog-giving-back-the-world-in-trujillo-film\"]</p>','none','Foundation Staff','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(81,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml',0,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(83,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'12,000','none',' ','xhtml',3,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','0','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(95,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(84,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'10000','none',' ','xhtml',1,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','1','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(85,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'2323','none',' ','xhtml',2,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(86,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'2433','none',' ','xhtml',4,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(87,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'34534','none',' ','xhtml',5,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(88,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'433','none',' ','xhtml',6,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','0','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(89,1,14,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'34','none',' ','xhtml',7,'none','','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(91,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(92,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg','none','Hearing Missions','none',1392316560,'','none','<p>International Hearing Mission Liaison Skye Girardin crisscrosses the globe dozens of times each year working to build solid partnerships that help us develop sustainable systems of hearing care. Skye works with our country coordinators and partners across Africa, Asia and South America to ensure that when the patients come to us for help, we are more than ready to meet their needs. We sat down with Skye to learn more about what it takes to prepare for phase two of a hearing mission, when we fit patients with hearing aids and give the gift of hearing.</p>\n\n<p><strong>What are the key things you need to do to prepare for a phase two hearing mission?</strong></p>\n\n<p>I need to inform our partners and keep in close contact with them to ensure that everything we need is ready. This means making sure we have exact dates, a site, tents, chairs, tables, volunteers. I also need to know any national or cultural events or holidays during our scheduled hearing mission. We need to take into account any changes in political climate or weather. I need to make sure our partners and coordinators in the field are going through their checklists over and over again to ensure everything is ready. Basically, a lot of emails, texts, phone calls, hope and crossed-fingers.</p>\n\n<p>[gallery id = \"blog-preparing-to-give-the-gift-of-hearing\"]</p>\n\n<p><strong>What are the biggest challenges you face in preparing for a hearing mission?</strong></p>\n\n<p>Trusting that the prices and everything that has been negotiated follows through and that all of the legwork has been done is a huge challenge. Because we manage much of the preparation remotely, it is difficult to ensure that what needs to happen does happen. Therefore, we rely heavily on our country coordinators and our partners to follow through. We are only as good as our partners.</p>\n\n<p><strong>What are your favorite things to do in preparation?</strong></p>\n\n<p>We focus strongly on the development of AfterCare programs. Throughout the process, we have ongoing conversations with our coordinators and partners about AfterCare strategies for after we leave. Much of the strategy and planning for this happens during preparation, but the hardcore training happens when we are there on the ground in order to enable our partners to take the program and run with it. It is exciting to be a part of their success.</p>\n\n<p>The other incredible thing is discovering great stories behind the hearing mission experience. There are always people we fit that have these amazing stories, and if we can find them ahead of time, then we can capture their story to share in the best way possible.</p>\n\n<p><strong>What do you take advantage of when you are home that you miss when you are on a hearing mission?</strong></p>\n\n<p>At home, I love not having to check in and out of a hotel and being able to just leave my stuff where I want. I love getting in my car and being able take myself somewhere. It&rsquo;s all the most basic things! To me Trader Joe&rsquo;s, some hot yoga and a shopping trip to REI &hellip;. I love it.</p>\n\n<p><strong>What do you look forward to most in the hearing mission experience?</strong></p>\n\n<p>I love setup day. Of course the hearing mission days are great, but all the planning culminates on set-up day &ndash; the day before the hearing mission. During this time we are training all of our volunteers, watching the tents go up and the chairs being set up. I want to make sure it&rsquo;s perfect. Then on the hearing mission day, I can enjoy giving the gift of hearing, knowing that all of the energy that went into the preparation was well worth it.</p>','none','Foundation Staff ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(93,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(94,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}BLOG-Impacting_a_life_in_Manila-LEAD.png','none','Hearing Missions','none',1377280500,'','none','<p>In December 2011, Manny Pacquiao joined us as a volunteer on a mission in Manila, Philippines. There he met Parisse, a young bright girl struggling with her studies because of hearing loss. He helped us give her the gift of hearing, and today, she is thriving and loves school. Watch our latest video blog to see how well she&rsquo;s doing and her very special message for Manny.</p>\n\n<p>[gallery id=\"blog-impacting-a-life-in-manila-film\"]</p>','none','Foundation Staff ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'','xhtml','','xhtml','','br','','xhtml','','none','','br','','none','','none','','none','','none','','xhtml','','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(98,1,15,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,' ','xhtml','','xhtml','Through 2010, we provided more than 1 million hearing aids to people in need worldwide. We commit to providing 1 million more this decade.','br',' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'','none','','none',0,'','none','','none','','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(99,1,16,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'consectetur adipis','none','Sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.','br','','none','DSC08418cc_edit.jpg','none','true','none','<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\n\n<p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>\n\n<p>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>','none','','xhtml','','none','','none',1392187740,'','none','Egypt','none','Africa','none','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(100,1,16,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','br','','none','DSC08418cc_edit.jpg','none','false','xhtml','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat porttitor sem sed facilisis. Pellentesque scelerisque ante sed risus vestibulum interdum. Proin tincidunt, ante eget tincidunt adipiscing, dui nisl accumsan neque, eu feugiat enim nibh ac libero. Duis erat lorem, accumsan in hendrerit vel, dignissim at urna. Morbi imperdiet sapien quis eros ultrices varius. Aliquam vel dolor quis mauris faucibus dapibus. Curabitur ultricies scelerisque aliquam. In dignissim at dui ac aliquam. Pellentesque vulputate malesuada facilisis. Aliquam mattis lorem non accumsan interdum. Curabitur vitae nibh sed orci egestas aliquam ut a eros. Nullam tempor justo nec nibh bibendum hendrerit. Sed adipiscing arcu ligula, eget gravida tellus sodales ut. Morbi auctor erat sit amet aliquam ullamcorper. Ut vel fermentum neque. Fusce nibh tortor, ultricies et purus quis, auctor facilisis lorem.</p>\n\n<p>Pellentesque porttitor diam a sagittis lacinia. Mauris at felis lobortis, malesuada ante eget, dictum augue. Integer consequat at tellus ut lobortis. Aliquam rhoncus vitae justo et luctus. Nullam non sem non lorem cursus feugiat ut non nunc. Cras lobortis luctus augue, sit amet porttitor mi posuere non. In ornare nibh ac fermentum aliquam. Duis ut tempor arcu.</p>\n\n<p>Nunc vehicula id tellus vel eleifend. Suspendisse in mauris ac nibh aliquam placerat sed et turpis. Aenean vel massa ornare, condimentum arcu vitae, commodo dolor. Fusce eleifend accumsan leo eget malesuada. Etiam augue dui, accumsan quis eros vel, pulvinar fringilla lacus. Nunc eu porttitor est, at pulvinar nisi. Mauris consectetur, nunc et facilisis porta, neque erat placerat velit, blandit lobortis velit lorem quis leo. Nullam pulvinar a nibh ut pulvinar. Nam suscipit tellus id porta imperdiet. Phasellus ultricies ante et est consectetur tincidunt. Phasellus tempus nec nisi sit amet egestas. In quam felis, bibendum sed laoreet non, aliquam ac metus. Donec hendrerit, turpis nec tincidunt sodales, leo mauris hendrerit purus, nec eleifend metus arcu non metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n\n<p>Suspendisse potenti. Ut diam ipsum, scelerisque ac nisi sed, pellentesque vulputate turpis. Praesent nec velit feugiat, dignissim est a, adipiscing lectus. Donec in nisi non metus lobortis dictum eget eget turpis. Mauris ornare, justo dictum cursus varius, elit tellus rhoncus arcu, eu pulvinar massa tellus vitae elit. Sed dictum sapien at facilisis tempus. Suspendisse consectetur consectetur diam, vitae faucibus lectus consectetur vel. Donec ante sem, posuere ac nunc lobortis, consectetur gravida felis. Integer pulvinar eleifend augue in dapibus. Morbi eget hendrerit arcu, vel volutpat felis. Nulla dapibus nibh ut lectus gravida, congue venenatis dui vehicula. Nulla facilisi. Praesent egestas libero ut justo tempor, nec tempor est porttitor. Nam semper mollis rhoncus. Nulla facilisis pulvinar urna, consequat egestas tellus semper hendrerit. Pellentesque molestie pulvinar lacus in scelerisque.</p>\n\n<p>Integer sollicitudin id est ut sagittis. Ut interdum porttitor massa, sit amet hendrerit lectus lacinia feugiat. Nunc ut tincidunt justo. Maecenas varius mauris eget quam hendrerit, nec ultrices justo tincidunt. Pellentesque luctus tempus ipsum in consectetur. Nulla sodales fermentum ante id porta. Maecenas facilisis faucibus cursus. Nulla eleifend magna sed eleifend molestie. Nulla quis risus tempor, pellentesque augue quis, dictum sem. Donec porttitor cursus nisl eget accumsan. Etiam accumsan vestibulum ligula at iaculis. Fusce luctus mauris non augue egestas, non faucibus sem blandit. Nunc ac risus at nulla hendrerit volutpat. Pellentesque quis leo sed urna dignissim tempus eu nec velit.</p>','none','','xhtml','',NULL,'','none',1384837680,'','none','Bhutan','xhtml','Asia','xhtml','','none','','none','','none','','xhtml','','none','','xhtml','','none','','xhtml','','xhtml','','xhtml','','none','','none','','xhtml',0,'none','','none','','xhtml'),(101,1,17,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml','<h1>Starkey Hearing Foundation&amp;rsquo;s annual So the World May Hear Awards Gala celebrates the spirit of giving.</h1>\n\n<p>The gala showcases the tremendous impact of reflecting caring and sharing into the lives of others. With the support we receive at the Gala, we are able to use hearing as a vehicle to change lives and give more than 100,000 hearing aids annually to people in need. Each year we honor humanitarians who dedicate their time and service to helping others around the world and here at home, and we have amazing perfor- mances from world-class entertainers.</p>','none',' ','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,0,NULL,'',NULL,'',NULL),(102,1,18,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none',' ','xhtml',' ','xhtml','text_3col','xhtml','',NULL,'',NULL,NULL,NULL,0,NULL,'',NULL,'',NULL),(103,1,18,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none',' ','xhtml',' ','xhtml','images_3col','xhtml','',NULL,'',NULL,NULL,NULL,0,NULL,'',NULL,'',NULL),(104,1,18,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<h2>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</h2>\n\n<p>At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing <strong>elitr, sed diam nonumy eirmod</strong> tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore <a href=\"#\">magna aliquyam erat</a>, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>\n\n<h3>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,</h3>\n\n<ul>\n	<li>vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim</li>\n	<li>qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</li>\n	<li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod</li>\n	<li>tincidunt ut laoreet dolore magna aliquam erat volutpat.</li>\n</ul>','none',' ','xhtml',' ','xhtml','single','xhtml','',NULL,'',NULL,NULL,NULL,0,NULL,'',NULL,'',NULL),(105,1,19,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'Upcoming Gala Event','none',' Starkey Hearing Foundation’s annual So the World May Hear Awards Gala celebrates the spirit of giving.The gala showcases the tremendous impact of reflecting caring and sharing into the lives of others. With the support we receive at the Gala, we are able to use hearing as a vehicle to change lives and give more than 100,000 hearing aids annually to people in need. Each year we honor humanitarians who dedicate their time and service to helping others around the world and here at home, and we have amazing perfor- mances from world-class entertainers.','none','','xhtml',2014,'none','vikings_mission.jpg','none',' ','xhtml');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'homepage_feature_subtitle','Subtitle ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(2,1,1,'homepage_feature_splash_image','Hero Image ','W: browser width H: 600px ','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(3,1,1,'homepage_feature_link','CTA Link','Insert URL that CTA will link out to, if feature is a video, insert video URL ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(4,1,2,'homepage_pictograms','homepage_pictograms','W 300px H: 180px','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(27,1,6,'homepage_map_category_title','Homepage Map Pin Category','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(5,1,3,'homepage_map_item_category','Map Pin Category','Select the pin type you want to display for this item','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI2Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7aTowO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(6,1,3,'homepage_map_item_lat','Latitude','Enter latitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(7,1,3,'homepage_map_item_lon','Longitude ','Enter Longitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,3,'homepage_map_item_location','Item Location','Enter location name if you want this to appear on map item i.e \"Los Angeles, CA\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(9,1,3,'homepage_map_item_content','Map Item Text ','Insert body copy here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',10,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(78,1,11,'press_release_contact','Contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(77,1,11,'press_release_pdf_download','PDF download','','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToyIjt9czo0OiJ2aWV3IjtzOjQ6Imxpc3QiO3M6MTA6InRodW1iX3NpemUiO3M6NToic21hbGwiO3M6MTQ6InNob3dfZmlsZW5hbWVzIjtzOjE6Im4iO3M6OToic2hvd19jb2xzIjthOjM6e2k6MDtzOjQ6Im5hbWUiO2k6MTtzOjQ6ImRhdGUiO2k6MjtzOjQ6InNpemUiO31zOjU6Im11bHRpIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(76,1,11,'press_release_body_text','Content','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(75,1,11,'press_release_source','Source','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(74,1,11,'press_release_image','Press Release Image','W: browser width H: 525px','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(73,1,10,'media_mention_body_text','Detail Page Body Text ','Input if media mention has a detail page ','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(18,1,5,'blog_featured','Feature in Carousel?','','fieldpack_switch','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YToxMTp7czo5OiJvZmZfbGFiZWwiO3M6MjoiTk8iO3M6Nzoib2ZmX3ZhbCI7czo1OiJmYWxzZSI7czo4OiJvbl9sYWJlbCI7czozOiJZRVMiO3M6Njoib25fdmFsIjtzOjQ6InRydWUiO3M6NzoiZGVmYXVsdCI7czozOiJvZmYiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(19,1,5,'blog_image','Blog Image ','This image will serve as the thumbnail image (W: 386px H: 230px)  as well as the header image (W: browser width H: 525px) on the blog post ','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToibiI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(20,1,5,'blog_category','Blog Category ','','select','News\nEvents\nHear Now\nGala\nFilms\nCelebrity\nOperation Change\nHearing Missions\nListen Carefully','n',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(21,1,5,'blog_date','Blog Date ','The post will appear to be published on the selected date ','date','','0',0,0,6,128,'y','ltr','n','n','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(48,1,1,'homepage_feature_cta','CTA Text ','Insert two to three words for CTA Text ','text','','0',0,0,6,256,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(47,1,5,'blog_related_items','Related Blog Posts ','Select related posts to appear at the bottom of this entry ','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',7,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI1Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(24,1,5,'blog_content','Blog Text ','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',7,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(25,1,5,'blog_author','Blog Author ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(26,1,2,'homepage_mission_statment','homepage_mission_statment','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(28,1,6,'homepage_map_category_image','Homepage Map Pin Icon','upload files as .pngs','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(29,1,3,'homepage_map_item_cta_link','Map Item CTA URL','Enter URL you would like to link to from Map Item','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(30,1,3,'homepage_map_item_cta_text','Map Item CTA Text ','Enter 2-3 words that will display as link out on map item i.e. \"Read More\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(56,1,8,'hear_now_form_contact','Hear Now Form Contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(46,1,3,'homepage_map_item_image','Homepage Map Item Image ','Upload Image to be displayed in map item panel W: 410px H: 378px','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(33,1,7,'carousel_image','Carousel Thumb','This is the thumbnail image displayed in the carousel w: 400px h: 210 px','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(34,1,7,'carousel_cta','Carousel CTA ','Enter two to three words to displayed as call to action link in carousel thumb','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(35,1,7,'carousel_panel_title','Carousel Panel Title ','W: browser width H: 560 px','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(36,1,7,'carousel_panel_image','Carousel Panel Image ','This is the main image that will display in the feature area when thumb is selected W: browser width H: 560px\n￼￼','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(37,1,7,'carousel_video_url','Carousel Video URL','If carousel item is a video, insert video URL here ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(38,1,7,'carousel_panel_cta','Carousel Panel CTA ','Enter two to three words to be displayed as link in in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(39,1,7,'carousel_panel_link','Carousel Panel CTA Link','Add URL that CTA will link out to in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(40,1,7,'carousel_body','Carousel Panel Text ','Insert body copy to be displayed in panel overlay ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',9,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6InkiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(41,1,8,'operation_change_content','Operation Change ','Enter text for Operation Change Tab here','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(42,1,8,'listen_carefully_content','Listen Carefully','Enter text for Listen Carefully Tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(44,1,8,'hear_now_content','Hear Now ','Enter text for Hear Now tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',4,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(45,1,8,'hearing_aid_recycling_content','Hearing Aid Recycle','Enter text for Hearing Aid Recycling tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',5,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(57,1,8,'hear_now_download_copy','Hear Now Download Copy','','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(49,1,8,'program_page_leader','Page Leader','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(71,1,10,'media_mention_source','Source ','CNN or SHF Team, etc','text','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(70,1,10,'media_mention_cta_link','CTA Link','Media Mentions Link out ','text','','0',0,0,6,500,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(69,1,10,'media_mention_cta_text','CTA Text ','For Feature Carousel: CTA for Article Media Mentions','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(68,1,10,'media_mention_quote','Article Quote ','For Feature Carousel: Uploading an article quote will create feature with blue background and quote ','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(67,1,10,'media_mention_date','Date ','','date','','0',0,0,6,128,'y','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(65,1,10,'media_mention_video_url','Video URL','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(66,1,10,'media_mention_logo','Logo','W: 100 H: 100','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToibiI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(72,1,10,'media_mention_detail_page','Add Detail Page?','Does this media mention need a detail page? Otherwise media mentions will link out to external article ','fieldpack_switch','','0',0,0,6,128,'n','ltr','n','n','none','n',10,'any','YToxMTp7czo5OiJvZmZfbGFiZWwiO3M6MjoiTk8iO3M6Nzoib2ZmX3ZhbCI7czo1OiJmYWxzZSI7czo4OiJvbl9sYWJlbCI7czozOiJZRVMiO3M6Njoib25fdmFsIjtzOjQ6InRydWUiO3M6NzoiZGVmYXVsdCI7czozOiJvZmYiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(58,1,8,'hear_now_form_download_english','Hear Now Form Download English','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6Im4iO3M6MTI6Im51bV9leGlzdGluZyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(59,1,8,'hear_now_form_download_spanish','Hear Now Form Download Spanish','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIyIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6Im4iO3M6MTI6Im51bV9leGlzdGluZyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(60,1,8,'operation_change_partnerships','Operation Change Partnerships','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',10,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(61,1,8,'listen_carefully_additional_reso','Listen Carefully Additional Resouces','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',11,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(62,1,9,'item','item','Can upload Single Image or Image and Video Combo - W: browser width H: 525px. \nMulti Image/Video Galleries - W: varies H: 525px','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(63,1,10,'media_mention_feature_carousel','Feature in Carousel','Do you want this media mention to appear in the carousel at the top of the page?','fieldpack_switch','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YToxMTp7czo5OiJvZmZfbGFiZWwiO3M6MjoiTk8iO3M6Nzoib2ZmX3ZhbCI7czo1OiJmYWxzZSI7czo4OiJvbl9sYWJlbCI7czozOiJZRVMiO3M6Njoib25fdmFsIjtzOjQ6InRydWUiO3M6NzoiZGVmYXVsdCI7czozOiJvZmYiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(64,1,10,'media_mention_image','Image ','This image will appear as the Image in the feature carousel (W: browser width H: 525px) overlaying a video or as thumbnail (W: 386px H: 230px) in the gallery ','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(79,1,12,'total_hearing_aids_provided','Hearing aids provided','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(80,1,12,'countries_visited','Countries Visited','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(81,1,12,'mm_order','Weight','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NzoiaW50ZWdlciI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(82,1,13,'content_tabs','Content Tabs','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjMiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiMyI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(83,1,13,'mission_highlights','Highlights','','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoyOiIxNiI7fXM6NzoiZXhwaXJlZCI7aTowO3M6NjoiZnV0dXJlIjtpOjA7czoxMDoiY2F0ZWdvcmllcyI7YTowOnt9czo3OiJhdXRob3JzIjthOjA6e31zOjg6InN0YXR1c2VzIjthOjA6e31zOjU6ImxpbWl0IjtzOjE6IjAiO3M6MTE6Im9yZGVyX2ZpZWxkIjtzOjEwOiJlbnRyeV9kYXRlIjtzOjk6Im9yZGVyX2RpciI7czozOiJhc2MiO3M6MTQ6ImFsbG93X211bHRpcGxlIjtzOjE6IjEiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(84,1,13,'hm_lead','Intro text','','textarea','','0',0,0,3,128,'n','ltr','n','n','br','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(85,1,13,'hearing_mission_statistics','Hearing Mission Statistics','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',4,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(86,1,14,'mission_subtitle','Subtitle','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(87,1,14,'mission_excerpt','Excerpt','','textarea','','0',0,0,3,128,'n','ltr','n','n','br','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(88,1,14,'mission_image','Featured Image','','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YToxMjp7czo4OiJmaWxlZGlycyI7czozOiJhbGwiO3M6NDoidmlldyI7czo2OiJ0aHVtYnMiO3M6MTA6InRodW1iX3NpemUiO3M6NToic21hbGwiO3M6MTQ6InNob3dfZmlsZW5hbWVzIjtzOjE6Im4iO3M6OToic2hvd19jb2xzIjthOjE6e2k6MDtzOjQ6Im5hbWUiO31zOjU6Im11bHRpIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(89,1,14,'mission_thumb_image','Thumbnail Image','','assets','','0',0,0,6,128,'y','ltr','n','n','none','n',4,'any','YToxMjp7czo4OiJmaWxlZGlycyI7czozOiJhbGwiO3M6NDoidmlldyI7czo2OiJ0aHVtYnMiO3M6MTA6InRodW1iX3NpemUiO3M6NToic21hbGwiO3M6MTQ6InNob3dfZmlsZW5hbWVzIjtzOjE6Im4iO3M6OToic2hvd19jb2xzIjthOjE6e2k6MDtzOjQ6Im5hbWUiO31zOjU6Im11bHRpIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(90,1,14,'mission_featured','Featured Item?','','entry_type','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',5,'any','YTo5OntzOjEyOiJ0eXBlX29wdGlvbnMiO2E6Mjp7czo1OiJmYWxzZSI7YToyOntzOjU6ImxhYmVsIjtzOjI6Ik5vIjtzOjExOiJoaWRlX2ZpZWxkcyI7YTozOntpOjA7czoyOiI4NiI7aToxO3M6MjoiODciO2k6MjtzOjI6Ijk0Ijt9fXM6NDoidHJ1ZSI7YToxOntzOjU6ImxhYmVsIjtzOjM6IlllcyI7fX1zOjE3OiJibGFua19oaWRlX2ZpZWxkcyI7YTowOnt9czo5OiJmaWVsZHR5cGUiO3M6MTQ6ImZpZWxkcGFja19waWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(91,1,14,'mission_content','Content','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(92,1,14,'mission_rel','Related Missions','','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',7,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoyOiIxNiI7fXM6NzoiZXhwaXJlZCI7aTowO3M6NjoiZnV0dXJlIjtpOjA7czoxMDoiY2F0ZWdvcmllcyI7YTowOnt9czo3OiJhdXRob3JzIjthOjA6e31zOjg6InN0YXR1c2VzIjthOjE6e2k6MDtzOjQ6Im9wZW4iO31zOjU6ImxpbWl0IjtzOjA6IiI7czoxMToib3JkZXJfZmllbGQiO3M6MTA6ImVudHJ5X2RhdGUiO3M6OToib3JkZXJfZGlyIjtzOjM6ImFzYyI7czoxNDoiYWxsb3dfbXVsdGlwbGUiO3M6MToiMSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(93,1,12,'is_us_map','Use United States Map','','fieldpack_switch','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YToxMTp7czo5OiJvZmZfbGFiZWwiO3M6MjoiTk8iO3M6Nzoib2ZmX3ZhbCI7czoxOiIwIjtzOjg6Im9uX2xhYmVsIjtzOjM6IllFUyI7czo2OiJvbl92YWwiO3M6MToiMSI7czo3OiJkZWZhdWx0IjtzOjM6Im9mZiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(94,1,14,'mission_video_url','Video Url','','text','','0',0,0,6,800,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(95,1,14,'mission_date','Date','','date','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(96,1,14,'mission_country','Country','','mx_select_plus','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',10,'any','YToxNDp7czoxNToibXhfc2VsZWN0X3BsdXNfIjthOjc6e3M6MTE6InBsYWNlaG9sZGVyIjtzOjE2OiJTZWxlY3QgYSBDb3VudHJ5IjtzOjExOiJtdWx0aXNlbGVjdCI7czoxOiJuIjtzOjE3OiJhbGxvd19uZXdfb3B0aW9ucyI7czoxOiJuIjtzOjE0OiJhbGxvd19kZXNlbGVjdCI7czoxOiJ5IjtzOjk6Im1pbl93aWR0aCI7czo1OiIzMDBweCI7czo3OiJvcHRpb25zIjtzOjE2NDg6IkJhbmdsYWRlc2gKQmVsZ2l1bQpCdXJraW5hIEZhc28KQnVsZ2FyaWEKQm9zbmlhIGFuZCBIZXJ6ZWdvdmluYQpCcnVuZWkKQm9saXZpYQpKYXBhbgpCdXJ1bmRpCkJlbmluCkJodXRhbgpKYW1haWNhCkJvdHN3YW5hCkJyYXppbApUaGUgQmFoYW1hcwpCZWxhcnVzCkJlbGl6ZQpSdXNzaWEKUndhbmRhClJlcHVibGljIG9mIFNlcmJpYQpMaXRodWFuaWEKTHV4ZW1ib3VyZwpMaWJlcmlhClJvbWFuaWEKR3VpbmVhIEJpc3NhdQpHdWF0ZW1hbGEKR3JlZWNlCkVxdWF0b3JpYWwgR3VpbmVhCkd1eWFuYQpHZW9yZ2lhClVuaXRlZCBLaW5nZG9tCkdhYm9uCkd1aW5lYQpHYW1iaWEKR3JlZW5sYW5kCkt1d2FpdApHaGFuYQpPbWFuCkpvcmRhbgpDcm9hdGlhCkhhaXRpCkh1bmdhcnkKSG9uZHVyYXMKTGF0dmlhClB1ZXJ0byBSaWNvCldlc3QgQmFuawpQb3J0dWdhbApQYXJhZ3VheQpQYW5hbWEKUGFwdWEgTmV3IEd1aW5lYQpQZXJ1ClBha2lzdGFuClBoaWxpcHBpbmVzClBvbGFuZApaYW1iaWEKRXN0b25pYQpFZ3lwdApTb3V0aCBBZnJpY2EKRWN1YWRvcgpBbGJhbmlhCkFuZ29sYQpLYXpha2hzdGFuCkV0aGlvcGlhClppbWJhYndlClNwYWluCkVyaXRyZWEKTW9udGVuZWdybwpNb2xkb3ZhCk1hZGFnYXNjYXIKTW9yb2NjbwpVemJla2lzdGFuCk15YW5tYXIKTWFsaQpNb25nb2xpYQpNYWNlZG9uaWEKTWFsYXdpCk1hdXJpdGFuaWEKVWdhbmRhCk1hbGF5c2lhCk1leGljbwpWYW51YXR1CkZyYW5jZQpGaW5sYW5kCkZpamkKRmFsa2xhbmQgSXNsYW5kcwpOaWNhcmFndWEKTmV0aGVybGFuZHMKTm9yd2F5Ck5hbWliaWEKTmV3IENhbGVkb25pYQpOaWdlcgpOaWdlcmlhCk5ldyBaZWFsYW5kCk5lcGFsCkl2b3J5IENvYXN0ClN3aXR6ZXJsYW5kCkNvbG9tYmlhCkNoaW5hCkNhbWVyb29uCkNoaWxlCkNhbmFkYQpSZXB1YmxpYyBvZiB0aGUgQ29uZ28KQ2VudHJhbCBBZnJpY2FuIFJlcHVibGljCkRlbW9jcmF0aWMgUmVwdWJsaWMgb2YgdGhlIENvbmdvCkN6ZWNoIFJlcHVibGljCkN5cHJ1cwpDb3N0YSBSaWNhCkN1YmEKU3dhemlsYW5kClN5cmlhCkt5cmd5enN0YW4KS2VueWEKU291dGggU3VkYW4KU3VyaW5hbWUKQ2FtYm9kaWEKRWwgU2FsdmFkb3IKU2xvdmFraWEKU291dGggS29yZWEKU2xvdmVuaWEKTm9ydGggS29yZWEKU29tYWxpYQpTZW5lZ2FsClNpZXJyYSBMZW9uZQpTb2xvbW9uIElzbGFuZHMKU2F1ZGkgQXJhYmlhClN3ZWRlbgpTdWRhbgpEb21pbmljYW4gUmVwdWJsaWMKRGppYm91dGkKRGVubWFyawpHZXJtYW55ClllbWVuCkF1c3RyaWEKQWxnZXJpYQpVcnVndWF5CkxlYmFub24KTGFvcwpUYWl3YW4KVHJpbmlkYWQgYW5kIFRvYmFnbwpUdXJrZXkKU3JpIExhbmthClR1bmlzaWEKRWFzdCBUaW1vcgpUdXJrbWVuaXN0YW4KVGFqaWtpc3RhbgpMZXNvdGhvClRoYWlsYW5kCkZyZW5jaCBTb3V0aGVybiBhbmQgQW50YXJjdGljIExhbmRzClRvZ28KQ2hhZApMaWJ5YQpVbml0ZWQgQXJhYiBFbWlyYXRlcwpWZW5lenVlbGEKQWZnaGFuaXN0YW4KSXJhcQpJY2VsYW5kCklyYW4KQXJtZW5pYQpJdGFseQpWaWV0bmFtCkFyZ2VudGluYQpBdXN0cmFsaWEKSXNyYWVsCkluZGlhClRhbnphbmlhCkF6ZXJiYWlqYW4KSXJlbGFuZApJbmRvbmVzaWEKVWtyYWluZQpRYXRhcgpNb3phbWJpcXVlClVuaXRlZCBTdGF0ZXMiO3M6MTA6ImRiX3JlcXVlc3QiO3M6MDoiIjt9czoxMToicGxhY2Vob2xkZXIiO3M6MTY6IlNlbGVjdCBhIENvdW50cnkiO3M6MTE6Im11bHRpc2VsZWN0IjtzOjE6Im4iO3M6MTc6ImFsbG93X25ld19vcHRpb25zIjtzOjE6Im4iO3M6MTQ6ImFsbG93X2Rlc2VsZWN0IjtzOjE6InkiO3M6OToibWluX3dpZHRoIjtzOjU6IjMwMHB4IjtzOjc6Im9wdGlvbnMiO2E6MTcyOntzOjEwOiJCYW5nbGFkZXNoIjtzOjEwOiJCYW5nbGFkZXNoIjtzOjc6IkJlbGdpdW0iO3M6NzoiQmVsZ2l1bSI7czoxMjoiQnVya2luYSBGYXNvIjtzOjEyOiJCdXJraW5hIEZhc28iO3M6ODoiQnVsZ2FyaWEiO3M6ODoiQnVsZ2FyaWEiO3M6MjI6IkJvc25pYSBhbmQgSGVyemVnb3ZpbmEiO3M6MjI6IkJvc25pYSBhbmQgSGVyemVnb3ZpbmEiO3M6NjoiQnJ1bmVpIjtzOjY6IkJydW5laSI7czo3OiJCb2xpdmlhIjtzOjc6IkJvbGl2aWEiO3M6NToiSmFwYW4iO3M6NToiSmFwYW4iO3M6NzoiQnVydW5kaSI7czo3OiJCdXJ1bmRpIjtzOjU6IkJlbmluIjtzOjU6IkJlbmluIjtzOjY6IkJodXRhbiI7czo2OiJCaHV0YW4iO3M6NzoiSmFtYWljYSI7czo3OiJKYW1haWNhIjtzOjg6IkJvdHN3YW5hIjtzOjg6IkJvdHN3YW5hIjtzOjY6IkJyYXppbCI7czo2OiJCcmF6aWwiO3M6MTE6IlRoZSBCYWhhbWFzIjtzOjExOiJUaGUgQmFoYW1hcyI7czo3OiJCZWxhcnVzIjtzOjc6IkJlbGFydXMiO3M6NjoiQmVsaXplIjtzOjY6IkJlbGl6ZSI7czo2OiJSdXNzaWEiO3M6NjoiUnVzc2lhIjtzOjY6IlJ3YW5kYSI7czo2OiJSd2FuZGEiO3M6MTg6IlJlcHVibGljIG9mIFNlcmJpYSI7czoxODoiUmVwdWJsaWMgb2YgU2VyYmlhIjtzOjk6IkxpdGh1YW5pYSI7czo5OiJMaXRodWFuaWEiO3M6MTA6Ikx1eGVtYm91cmciO3M6MTA6Ikx1eGVtYm91cmciO3M6NzoiTGliZXJpYSI7czo3OiJMaWJlcmlhIjtzOjc6IlJvbWFuaWEiO3M6NzoiUm9tYW5pYSI7czoxMzoiR3VpbmVhIEJpc3NhdSI7czoxMzoiR3VpbmVhIEJpc3NhdSI7czo5OiJHdWF0ZW1hbGEiO3M6OToiR3VhdGVtYWxhIjtzOjY6IkdyZWVjZSI7czo2OiJHcmVlY2UiO3M6MTc6IkVxdWF0b3JpYWwgR3VpbmVhIjtzOjE3OiJFcXVhdG9yaWFsIEd1aW5lYSI7czo2OiJHdXlhbmEiO3M6NjoiR3V5YW5hIjtzOjc6Ikdlb3JnaWEiO3M6NzoiR2VvcmdpYSI7czoxNDoiVW5pdGVkIEtpbmdkb20iO3M6MTQ6IlVuaXRlZCBLaW5nZG9tIjtzOjU6IkdhYm9uIjtzOjU6IkdhYm9uIjtzOjY6Ikd1aW5lYSI7czo2OiJHdWluZWEiO3M6NjoiR2FtYmlhIjtzOjY6IkdhbWJpYSI7czo5OiJHcmVlbmxhbmQiO3M6OToiR3JlZW5sYW5kIjtzOjY6Ikt1d2FpdCI7czo2OiJLdXdhaXQiO3M6NToiR2hhbmEiO3M6NToiR2hhbmEiO3M6NDoiT21hbiI7czo0OiJPbWFuIjtzOjY6IkpvcmRhbiI7czo2OiJKb3JkYW4iO3M6NzoiQ3JvYXRpYSI7czo3OiJDcm9hdGlhIjtzOjU6IkhhaXRpIjtzOjU6IkhhaXRpIjtzOjc6Ikh1bmdhcnkiO3M6NzoiSHVuZ2FyeSI7czo4OiJIb25kdXJhcyI7czo4OiJIb25kdXJhcyI7czo2OiJMYXR2aWEiO3M6NjoiTGF0dmlhIjtzOjExOiJQdWVydG8gUmljbyI7czoxMToiUHVlcnRvIFJpY28iO3M6OToiV2VzdCBCYW5rIjtzOjk6Ildlc3QgQmFuayI7czo4OiJQb3J0dWdhbCI7czo4OiJQb3J0dWdhbCI7czo4OiJQYXJhZ3VheSI7czo4OiJQYXJhZ3VheSI7czo2OiJQYW5hbWEiO3M6NjoiUGFuYW1hIjtzOjE2OiJQYXB1YSBOZXcgR3VpbmVhIjtzOjE2OiJQYXB1YSBOZXcgR3VpbmVhIjtzOjQ6IlBlcnUiO3M6NDoiUGVydSI7czo4OiJQYWtpc3RhbiI7czo4OiJQYWtpc3RhbiI7czoxMToiUGhpbGlwcGluZXMiO3M6MTE6IlBoaWxpcHBpbmVzIjtzOjY6IlBvbGFuZCI7czo2OiJQb2xhbmQiO3M6NjoiWmFtYmlhIjtzOjY6IlphbWJpYSI7czo3OiJFc3RvbmlhIjtzOjc6IkVzdG9uaWEiO3M6NToiRWd5cHQiO3M6NToiRWd5cHQiO3M6MTI6IlNvdXRoIEFmcmljYSI7czoxMjoiU291dGggQWZyaWNhIjtzOjc6IkVjdWFkb3IiO3M6NzoiRWN1YWRvciI7czo3OiJBbGJhbmlhIjtzOjc6IkFsYmFuaWEiO3M6NjoiQW5nb2xhIjtzOjY6IkFuZ29sYSI7czoxMDoiS2F6YWtoc3RhbiI7czoxMDoiS2F6YWtoc3RhbiI7czo4OiJFdGhpb3BpYSI7czo4OiJFdGhpb3BpYSI7czo4OiJaaW1iYWJ3ZSI7czo4OiJaaW1iYWJ3ZSI7czo1OiJTcGFpbiI7czo1OiJTcGFpbiI7czo3OiJFcml0cmVhIjtzOjc6IkVyaXRyZWEiO3M6MTA6Ik1vbnRlbmVncm8iO3M6MTA6Ik1vbnRlbmVncm8iO3M6NzoiTW9sZG92YSI7czo3OiJNb2xkb3ZhIjtzOjEwOiJNYWRhZ2FzY2FyIjtzOjEwOiJNYWRhZ2FzY2FyIjtzOjc6Ik1vcm9jY28iO3M6NzoiTW9yb2NjbyI7czoxMDoiVXpiZWtpc3RhbiI7czoxMDoiVXpiZWtpc3RhbiI7czo3OiJNeWFubWFyIjtzOjc6Ik15YW5tYXIiO3M6NDoiTWFsaSI7czo0OiJNYWxpIjtzOjg6Ik1vbmdvbGlhIjtzOjg6Ik1vbmdvbGlhIjtzOjk6Ik1hY2Vkb25pYSI7czo5OiJNYWNlZG9uaWEiO3M6NjoiTWFsYXdpIjtzOjY6Ik1hbGF3aSI7czoxMDoiTWF1cml0YW5pYSI7czoxMDoiTWF1cml0YW5pYSI7czo2OiJVZ2FuZGEiO3M6NjoiVWdhbmRhIjtzOjg6Ik1hbGF5c2lhIjtzOjg6Ik1hbGF5c2lhIjtzOjY6Ik1leGljbyI7czo2OiJNZXhpY28iO3M6NzoiVmFudWF0dSI7czo3OiJWYW51YXR1IjtzOjY6IkZyYW5jZSI7czo2OiJGcmFuY2UiO3M6NzoiRmlubGFuZCI7czo3OiJGaW5sYW5kIjtzOjQ6IkZpamkiO3M6NDoiRmlqaSI7czoxNjoiRmFsa2xhbmQgSXNsYW5kcyI7czoxNjoiRmFsa2xhbmQgSXNsYW5kcyI7czo5OiJOaWNhcmFndWEiO3M6OToiTmljYXJhZ3VhIjtzOjExOiJOZXRoZXJsYW5kcyI7czoxMToiTmV0aGVybGFuZHMiO3M6NjoiTm9yd2F5IjtzOjY6Ik5vcndheSI7czo3OiJOYW1pYmlhIjtzOjc6Ik5hbWliaWEiO3M6MTM6Ik5ldyBDYWxlZG9uaWEiO3M6MTM6Ik5ldyBDYWxlZG9uaWEiO3M6NToiTmlnZXIiO3M6NToiTmlnZXIiO3M6NzoiTmlnZXJpYSI7czo3OiJOaWdlcmlhIjtzOjExOiJOZXcgWmVhbGFuZCI7czoxMToiTmV3IFplYWxhbmQiO3M6NToiTmVwYWwiO3M6NToiTmVwYWwiO3M6MTE6Ikl2b3J5IENvYXN0IjtzOjExOiJJdm9yeSBDb2FzdCI7czoxMToiU3dpdHplcmxhbmQiO3M6MTE6IlN3aXR6ZXJsYW5kIjtzOjg6IkNvbG9tYmlhIjtzOjg6IkNvbG9tYmlhIjtzOjU6IkNoaW5hIjtzOjU6IkNoaW5hIjtzOjg6IkNhbWVyb29uIjtzOjg6IkNhbWVyb29uIjtzOjU6IkNoaWxlIjtzOjU6IkNoaWxlIjtzOjY6IkNhbmFkYSI7czo2OiJDYW5hZGEiO3M6MjE6IlJlcHVibGljIG9mIHRoZSBDb25nbyI7czoyMToiUmVwdWJsaWMgb2YgdGhlIENvbmdvIjtzOjI0OiJDZW50cmFsIEFmcmljYW4gUmVwdWJsaWMiO3M6MjQ6IkNlbnRyYWwgQWZyaWNhbiBSZXB1YmxpYyI7czozMjoiRGVtb2NyYXRpYyBSZXB1YmxpYyBvZiB0aGUgQ29uZ28iO3M6MzI6IkRlbW9jcmF0aWMgUmVwdWJsaWMgb2YgdGhlIENvbmdvIjtzOjE0OiJDemVjaCBSZXB1YmxpYyI7czoxNDoiQ3plY2ggUmVwdWJsaWMiO3M6NjoiQ3lwcnVzIjtzOjY6IkN5cHJ1cyI7czoxMDoiQ29zdGEgUmljYSI7czoxMDoiQ29zdGEgUmljYSI7czo0OiJDdWJhIjtzOjQ6IkN1YmEiO3M6OToiU3dhemlsYW5kIjtzOjk6IlN3YXppbGFuZCI7czo1OiJTeXJpYSI7czo1OiJTeXJpYSI7czoxMDoiS3lyZ3l6c3RhbiI7czoxMDoiS3lyZ3l6c3RhbiI7czo1OiJLZW55YSI7czo1OiJLZW55YSI7czoxMToiU291dGggU3VkYW4iO3M6MTE6IlNvdXRoIFN1ZGFuIjtzOjg6IlN1cmluYW1lIjtzOjg6IlN1cmluYW1lIjtzOjg6IkNhbWJvZGlhIjtzOjg6IkNhbWJvZGlhIjtzOjExOiJFbCBTYWx2YWRvciI7czoxMToiRWwgU2FsdmFkb3IiO3M6ODoiU2xvdmFraWEiO3M6ODoiU2xvdmFraWEiO3M6MTE6IlNvdXRoIEtvcmVhIjtzOjExOiJTb3V0aCBLb3JlYSI7czo4OiJTbG92ZW5pYSI7czo4OiJTbG92ZW5pYSI7czoxMToiTm9ydGggS29yZWEiO3M6MTE6Ik5vcnRoIEtvcmVhIjtzOjc6IlNvbWFsaWEiO3M6NzoiU29tYWxpYSI7czo3OiJTZW5lZ2FsIjtzOjc6IlNlbmVnYWwiO3M6MTI6IlNpZXJyYSBMZW9uZSI7czoxMjoiU2llcnJhIExlb25lIjtzOjE1OiJTb2xvbW9uIElzbGFuZHMiO3M6MTU6IlNvbG9tb24gSXNsYW5kcyI7czoxMjoiU2F1ZGkgQXJhYmlhIjtzOjEyOiJTYXVkaSBBcmFiaWEiO3M6NjoiU3dlZGVuIjtzOjY6IlN3ZWRlbiI7czo1OiJTdWRhbiI7czo1OiJTdWRhbiI7czoxODoiRG9taW5pY2FuIFJlcHVibGljIjtzOjE4OiJEb21pbmljYW4gUmVwdWJsaWMiO3M6ODoiRGppYm91dGkiO3M6ODoiRGppYm91dGkiO3M6NzoiRGVubWFyayI7czo3OiJEZW5tYXJrIjtzOjc6Ikdlcm1hbnkiO3M6NzoiR2VybWFueSI7czo1OiJZZW1lbiI7czo1OiJZZW1lbiI7czo3OiJBdXN0cmlhIjtzOjc6IkF1c3RyaWEiO3M6NzoiQWxnZXJpYSI7czo3OiJBbGdlcmlhIjtzOjc6IlVydWd1YXkiO3M6NzoiVXJ1Z3VheSI7czo3OiJMZWJhbm9uIjtzOjc6IkxlYmFub24iO3M6NDoiTGFvcyI7czo0OiJMYW9zIjtzOjY6IlRhaXdhbiI7czo2OiJUYWl3YW4iO3M6MTk6IlRyaW5pZGFkIGFuZCBUb2JhZ28iO3M6MTk6IlRyaW5pZGFkIGFuZCBUb2JhZ28iO3M6NjoiVHVya2V5IjtzOjY6IlR1cmtleSI7czo5OiJTcmkgTGFua2EiO3M6OToiU3JpIExhbmthIjtzOjc6IlR1bmlzaWEiO3M6NzoiVHVuaXNpYSI7czoxMDoiRWFzdCBUaW1vciI7czoxMDoiRWFzdCBUaW1vciI7czoxMjoiVHVya21lbmlzdGFuIjtzOjEyOiJUdXJrbWVuaXN0YW4iO3M6MTA6IlRhamlraXN0YW4iO3M6MTA6IlRhamlraXN0YW4iO3M6NzoiTGVzb3RobyI7czo3OiJMZXNvdGhvIjtzOjg6IlRoYWlsYW5kIjtzOjg6IlRoYWlsYW5kIjtzOjM1OiJGcmVuY2ggU291dGhlcm4gYW5kIEFudGFyY3RpYyBMYW5kcyI7czozNToiRnJlbmNoIFNvdXRoZXJuIGFuZCBBbnRhcmN0aWMgTGFuZHMiO3M6NDoiVG9nbyI7czo0OiJUb2dvIjtzOjQ6IkNoYWQiO3M6NDoiQ2hhZCI7czo1OiJMaWJ5YSI7czo1OiJMaWJ5YSI7czoyMDoiVW5pdGVkIEFyYWIgRW1pcmF0ZXMiO3M6MjA6IlVuaXRlZCBBcmFiIEVtaXJhdGVzIjtzOjk6IlZlbmV6dWVsYSI7czo5OiJWZW5lenVlbGEiO3M6MTE6IkFmZ2hhbmlzdGFuIjtzOjExOiJBZmdoYW5pc3RhbiI7czo0OiJJcmFxIjtzOjQ6IklyYXEiO3M6NzoiSWNlbGFuZCI7czo3OiJJY2VsYW5kIjtzOjQ6IklyYW4iO3M6NDoiSXJhbiI7czo3OiJBcm1lbmlhIjtzOjc6IkFybWVuaWEiO3M6NToiSXRhbHkiO3M6NToiSXRhbHkiO3M6NzoiVmlldG5hbSI7czo3OiJWaWV0bmFtIjtzOjk6IkFyZ2VudGluYSI7czo5OiJBcmdlbnRpbmEiO3M6OToiQXVzdHJhbGlhIjtzOjk6IkF1c3RyYWxpYSI7czo2OiJJc3JhZWwiO3M6NjoiSXNyYWVsIjtzOjU6IkluZGlhIjtzOjU6IkluZGlhIjtzOjg6IlRhbnphbmlhIjtzOjg6IlRhbnphbmlhIjtzOjEwOiJBemVyYmFpamFuIjtzOjEwOiJBemVyYmFpamFuIjtzOjc6IklyZWxhbmQiO3M6NzoiSXJlbGFuZCI7czo5OiJJbmRvbmVzaWEiO3M6OToiSW5kb25lc2lhIjtzOjc6IlVrcmFpbmUiO3M6NzoiVWtyYWluZSI7czo1OiJRYXRhciI7czo1OiJRYXRhciI7czoxMDoiTW96YW1iaXF1ZSI7czoxMDoiTW96YW1iaXF1ZSI7czoxMzoiVW5pdGVkIFN0YXRlcyI7czoxMzoiVW5pdGVkIFN0YXRlcyI7fXM6MTA6ImRiX3JlcXVlc3QiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(97,1,14,'mission_region','Region','','mx_select_plus','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',11,'any','YToxNDp7czoxNToibXhfc2VsZWN0X3BsdXNfIjthOjc6e3M6MTE6InBsYWNlaG9sZGVyIjtzOjI0OiJTZWxlY3Qgb3IgZW50ZXIgYSByZWdpb24iO3M6MTE6Im11bHRpc2VsZWN0IjtzOjE6Im4iO3M6MTc6ImFsbG93X25ld19vcHRpb25zIjtzOjE6InkiO3M6MTQ6ImFsbG93X2Rlc2VsZWN0IjtzOjE6Im4iO3M6OToibWluX3dpZHRoIjtzOjU6IjMwMHB4IjtzOjc6Im9wdGlvbnMiO3M6MDoiIjtzOjEwOiJkYl9yZXF1ZXN0IjtzOjExOToiU0VMRUNUIHRpdGxlIGFzIG9wdGlvbl9uYW1lLCB0aXRsZSBhcyBvcHRpb25fbGFiZWwgRlJPTSBleHBfY2hhbm5lbF90aXRsZXMgV0hFUkUgY2hhbm5lbF9pZCA9ICcxNCcgT1JERVIgQlkgb3B0aW9uX25hbWUiO31zOjExOiJwbGFjZWhvbGRlciI7czoyNDoiU2VsZWN0IG9yIGVudGVyIGEgcmVnaW9uIjtzOjExOiJtdWx0aXNlbGVjdCI7czoxOiJuIjtzOjE3OiJhbGxvd19uZXdfb3B0aW9ucyI7czoxOiJ5IjtzOjE0OiJhbGxvd19kZXNlbGVjdCI7czoxOiJuIjtzOjk6Im1pbl93aWR0aCI7czo1OiIzMDBweCI7czo3OiJvcHRpb25zIjthOjE6e3M6MDoiIjtzOjA6IiI7fXM6MTA6ImRiX3JlcXVlc3QiO3M6MTE5OiJTRUxFQ1QgdGl0bGUgYXMgb3B0aW9uX25hbWUsIHRpdGxlIGFzIG9wdGlvbl9sYWJlbCBGUk9NIGV4cF9jaGFubmVsX3RpdGxlcyBXSEVSRSBjaGFubmVsX2lkID0gJzE0JyBPUkRFUiBCWSBvcHRpb25fbmFtZSI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(98,1,5,'blog_header_image','Header Image','If this field is left empty the thumbnail image will be used.','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(99,1,10,'mm_header_image','Header Image','If this field is left empty the thumbnail image will be used.','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',12,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(100,1,11,'press_header_image','Header Image','If this field is left empty the thumbnail image will be used.','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToieSI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(101,1,15,'galla_overview_carousel','Carousel Items','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(102,1,15,'galla_overview_intro','Intro','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIzIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(103,1,15,'galla_overview_highlights','Highlights','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',3,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtzOjE6IjIiO3M6MTM6ImdyaWRfbWF4X3Jvd3MiO3M6MToiMiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(104,1,16,'content_block','Content Block','','wygwam','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiI0IjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(105,1,16,'col3_text','Three Column: Text','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(106,1,16,'col3_img','Three column: Images','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',3,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(107,1,16,'display_type','Display Type','','entry_type','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',4,'any','YTo5OntzOjEyOiJ0eXBlX29wdGlvbnMiO2E6Mzp7czo2OiJzaW5nbGUiO2E6Mjp7czo1OiJsYWJlbCI7czoxMzoiU2luZ2xlIENvbHVtbiI7czoxMToiaGlkZV9maWVsZHMiO2E6Mjp7aTowO3M6MzoiMTA1IjtpOjE7czozOiIxMDYiO319czo5OiJ0ZXh0XzNjb2wiO2E6Mjp7czo1OiJsYWJlbCI7czoxODoiVGhyZWUgQ29sdW1uOiBUZXh0IjtzOjExOiJoaWRlX2ZpZWxkcyI7YToyOntpOjA7czozOiIxMDQiO2k6MTtzOjM6IjEwNiI7fX1zOjExOiJpbWFnZXNfM2NvbCI7YToyOntzOjU6ImxhYmVsIjtzOjIwOiJUaHJlZSBDb2x1bW46IEltYWdlcyI7czoxMToiaGlkZV9maWVsZHMiO2E6Mjp7aTowO3M6MzoiMTA0IjtpOjE7czozOiIxMDUiO319fXM6MTc6ImJsYW5rX2hpZGVfZmllbGRzIjthOjA6e31zOjk6ImZpZWxkdHlwZSI7czoxNDoiZmllbGRwYWNrX3BpbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(108,1,17,'galla_intro_title','Intro Title','','text','','0',0,0,6,500,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(109,1,17,'galla_intro_text','Intro Text','','textarea','','0',0,0,3,128,'n','ltr','n','n','none','n',2,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(110,1,17,'galla_gallery_code','Gallery','','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',3,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoyOiIxMiI7fXM6NzoiZXhwaXJlZCI7aTowO3M6NjoiZnV0dXJlIjtpOjA7czoxMDoiY2F0ZWdvcmllcyI7YTowOnt9czo3OiJhdXRob3JzIjthOjA6e31zOjg6InN0YXR1c2VzIjthOjA6e31zOjU6ImxpbWl0IjtzOjA6IiI7czoxMToib3JkZXJfZmllbGQiO3M6NToidGl0bGUiO3M6OToib3JkZXJfZGlyIjtzOjM6ImFzYyI7czoxNDoiYWxsb3dfbXVsdGlwbGUiO2k6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(111,1,17,'galla_year','Year','','text','','0',0,0,6,4,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NzoiaW50ZWdlciI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(112,1,17,'galla_thumb_image','Carousel Image','','assets','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMjp7czo4OiJmaWxlZGlycyI7YToxOntpOjA7czo0OiJlZToxIjt9czo0OiJ2aWV3IjtzOjY6InRodW1icyI7czoxMDoidGh1bWJfc2l6ZSI7czo1OiJzbWFsbCI7czoxNDoic2hvd19maWxlbmFtZXMiO3M6MToibiI7czo5OiJzaG93X2NvbHMiO2E6MTp7aTowO3M6NDoibmFtZSI7fXM6NToibXVsdGkiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(113,1,17,'galla_panel','Galla Panels','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',6,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ==');
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
-- Table structure for table `exp_channel_grid_field_101`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_101` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_25` text,
  `col_id_26` text,
  `col_id_27` text,
  `col_id_28` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_101`
--

LOCK TABLES `exp_channel_grid_field_101` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_101` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_101` VALUES (1,101,0,'CAROUSEL-Tony_Hawk_Event.JPG','http://www.youtube.com/watch?v=tF-9R4UUWa','Lorem Ipsum','Lorem ipsum dolor sit amet, consetetur sadipscing elitr'),(2,101,1,'billaustin.jpg','http://www.youtube.com/watch?v=tF-9R4UUWa','Dolor Sit Amet','Lorem ipsum dolor sit amet, consetetur sadipscing elitr');
/*!40000 ALTER TABLE `exp_channel_grid_field_101` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_103`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_103` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_29` text,
  `col_id_30` text,
  `col_id_31` text,
  `col_id_32` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_103`
--

LOCK TABLES `exp_channel_grid_field_103` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_103` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_103` VALUES (1,101,0,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg','Tani Austin Reflects on 12 Amazing Years','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut sapien vel massa dictum malesuada sed quis nibh.','#sample-link'),(2,101,1,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg','Can You Feel The Love Tonight','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut sapien vel massa dictum malesuada sed quis nibh.','#sample-link2');
/*!40000 ALTER TABLE `exp_channel_grid_field_103` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_105`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_105`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_105` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_33` text,
  `col_id_34` text,
  `col_id_35` text,
  `col_id_36` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_105`
--

LOCK TABLES `exp_channel_grid_field_105` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_105` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_105` VALUES (1,102,0,'FRIDAY JULY 26TH','<h3>8:00 AM</h3>\n\n <h3>OLYMPICS HILL GOLF CLUB</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN\n\n  * shuttle will leave the hotel early\n\n  *optional tour available','<h3>1:00 PM</h3>\n\n <h3>SECOND VENUE</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN\n\n  *optional tour available','<h3>2:00 PM</h3>\n\n <h3>THIRD OLYMPICS HILL GOLF CLUB</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN'),(2,102,1,'SATURDAY JULY 27TH','<h3>8:00 AM</h3>\n\n <h3>OLYMPICS HILL GOLF CLUB</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN\n\n  * shuttle will leave the hotel early\n\n  *optional tour available','<h3>2:00 PM</h3>\n\n <h3>THIRD OLYMPICS HILL GOLF CLUB</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN',NULL),(3,102,2,'SO THE WORLD MAY HEAR GALA','<h3>8:00 AM</h3>\n\n <h3>COCKTAILS AND SILENT AUCTION</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN','<h3>2:00 PM</h3>\n\n <h3>THIRD OLYMPICS HILL GOLF CLUB</h3>\n\n  Starkey Hearing Foundation, Eden Prairie, MN',NULL);
/*!40000 ALTER TABLE `exp_channel_grid_field_105` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_106`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_106` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_37` text,
  `col_id_38` text,
  `col_id_39` text,
  `col_id_40` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_106`
--

LOCK TABLES `exp_channel_grid_field_106` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_106` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_106` VALUES (1,103,0,'Sample Row','info_livesimpacted.jpg','info_livesindirectly.jpg','info_totalaids.jpg');
/*!40000 ALTER TABLE `exp_channel_grid_field_106` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_113`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_113`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_113` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_41` text,
  `col_id_42` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_113`
--

LOCK TABLES `exp_channel_grid_field_113` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_113` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_113` VALUES (1,105,0,'Schedule',''),(2,105,1,'Sponsorship Information',''),(3,105,2,'Honoree Information',''),(4,105,3,'Entertainers',''),(5,105,4,'Special Guests',''),(6,105,5,'Gala Sponsors','');
/*!40000 ALTER TABLE `exp_channel_grid_field_113` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_62`
--

LOCK TABLES `exp_channel_grid_field_62` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_62` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_62` VALUES (1,25,0,'{filedir_1}Blog_Philippines_.jpg',''),(2,26,0,'{filedir_1}listencarefullygallery2.png',''),(3,31,0,'{filedir_1}HERO-Program-Operation_Change.png','http://www.youtube.com/watch?v=na5j0wDq7kc'),(9,52,0,'{filedir_1}billaustin.jpg',''),(4,32,0,'{filedir_1}listencarefully.jpg',''),(5,33,0,'{filedir_1}listencarefully2.jpg',''),(6,34,0,'{filedir_1}listencarefully3.jpg','http://www.youtube.com/watch?v=rlyH-ZcCf7o'),(7,35,0,'{filedir_1}hearnow1.jpg',''),(8,36,0,'{filedir_1}HERO-Hearing_Aid_Recycling.jpg','http://www.youtube.com/watch?v=tF-9R4UUWa8'),(10,53,0,'{filedir_1}billaustin.jpg',''),(11,53,1,'{filedir_1}Blog_A_Knight.jpg',''),(12,53,2,'{filedir_1}CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','http://www.youtube.com/watch?v=OJ4W9zzjgII'),(13,53,3,'{filedir_1}CAROUSEL-Building_a_Better_Kibera.jpg',''),(14,25,1,'{filedir_1}Blog_A_Knight.jpg',''),(15,25,2,'{filedir_1}CAROUSEL-Tony_Hawk_Event.JPG',''),(16,25,3,'',''),(19,78,0,'{filedir_1}BLOG-An_Unstoppable_Spirit_01.jpg',''),(20,78,1,'{filedir_1}BLOG-An_Unstoppable_Spirit_02.jpg',''),(18,73,0,'','http://youtu.be/lApt9XthONg'),(21,78,2,'',''),(22,79,0,'{filedir_1}LC-10-Sec-Video-02.png','http://www.youtube.com/watch?v=HXC2R5SR9aE'),(23,81,0,'','http://youtu.be/jK1lFYKgc7k'),(24,91,0,'{filedir_1}BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',''),(25,91,1,'{filedir_1}BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',''),(26,93,0,'','http://youtu.be/HVx-lUkcr38'),(27,95,0,'{filedir_1}BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-01.jpg',''),(28,95,1,'{filedir_1}BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg',''),(29,95,2,'{filedir_1}BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-03.jpg','');
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_80`
--

LOCK TABLES `exp_channel_grid_field_80` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_80` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_80` VALUES (1,83,0,'Ethiopia','ET','100'),(2,83,1,'Malawi','ML','2000'),(3,83,2,'Nigeria','NG','1200'),(4,83,3,'South Africa','ZA','100'),(5,84,0,'California','US-CA','300'),(6,84,1,'Massachusetts','US-MA','3000'),(7,84,2,'New Jersey','US-NJ','5000'),(8,85,0,'Panama','PA','34434'),(9,86,0,'Philippines','PH','12'),(10,86,1,'Vietnam','VN','1234'),(11,87,0,'Colombia','CO','122'),(12,88,0,'Germany','DE','1212'),(13,89,0,'Australia','AU','12123'),(14,83,4,'Egypt ','EG',''),(15,83,5,'South Sudan ','SS','5000'),(16,83,6,'Morocco ','MA','');
/*!40000 ALTER TABLE `exp_channel_grid_field_80` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_82`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_82` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_19` text,
  `col_id_20` text,
  `col_id_21` text,
  `col_id_22` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_82`
--

LOCK TABLES `exp_channel_grid_field_82` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_82` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_82` VALUES (1,98,0,'About Mission','building_a_better_kibera.jpg','More than 360 million people worldwide have a disabling hearing loss.','Yet many do not have access to the hearing care that can help them. We address this problem by developing sustainable systems of care globally. Each year, we fit more than 100,000 hearing aids to people in need. We have worked in more than 100 countries and are committed to providing 1 million hearing aids this decade.'),(2,98,1,'Community Based','west_bank_mission.jpg','Article 2','Yet many do not have access to the hearing care that can help them. We address this problem by developing sustainable systems of care globally. Each year, we fit more than 100,000 hearing aids to people in need. We have worked in more than 100 countries and are committed to providing 1 million hearing aids this decade.'),(3,98,2,'Three Phases','peru_mission_02.jpg','Article 3','Yet many do not have access to the hearing care that can help them. We address this problem by developing sustainable systems of care globally. Each year, we fit more than 100,000 hearing aids to people in need. We have worked in more than 100 countries and are committed to providing 1 million hearing aids this decade.');
/*!40000 ALTER TABLE `exp_channel_grid_field_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_85`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_85`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_85` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_23` text,
  `col_id_24` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_85`
--

LOCK TABLES `exp_channel_grid_field_85` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_85` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_85` VALUES (1,98,0,'1,000,000','OUR HEARING AID COMMITMENT THIS DECADE'),(2,98,1,'400,000','DELIVERED TOWARD OUR COMMITMENT'),(3,98,2,'5,000','DELIVERED IN 2014');
/*!40000 ALTER TABLE `exp_channel_grid_field_85` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (2,1,4,1,NULL,'172.251.100.146','PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE','president-and-chelsea-clinton-visit-site-to-see','open','y',0,0,0,0,'y','n',1390188000,'2014','01','19',0,0,20140120033810,0,0),(3,1,4,1,NULL,'172.251.100.146','Starkey Executive Director Speaks on the \'Miracle\' of Watching Patients Hear for the Very First Time','starkey-executive-director-speaks-on-the-miracle-of-watching-patients-hear','open','y',0,0,0,0,'y','n',1390189140,'2014','01','19',0,0,20140120054413,0,0),(4,1,1,1,NULL,'167.100.118.140','Commitment to Action','commitment-to-action1','open','y',0,0,0,0,'y','n',1390237920,'2014','01','20',0,0,20140211170621,0,0),(5,1,1,1,NULL,'167.100.118.140','Building Sustainable Systems of Hearing Care','building-sustainable-systems-of-hearing-care','open','y',0,0,0,0,'y','n',1390197600,'2014','01','19',0,0,20140211165453,0,0),(6,1,7,1,NULL,'167.100.118.140','Celebrity Support','celebrity-support','open','y',0,0,0,0,'n','n',1390198920,'2014','01','19',0,0,20140211183425,0,0),(7,1,7,1,NULL,'167.100.118.140','Listen Carefully Goes Live','listen-carefully-in-schools','open','y',0,0,0,0,'n','n',1390199280,'2014','01','19',0,0,20140213185521,0,0),(8,1,7,1,NULL,'167.100.118.140','Recycling Sound','recycling-sound','open','y',0,0,0,0,'y','n',1390199700,'2014','01','19',0,0,20140213185030,0,0),(9,1,6,1,NULL,'172.251.100.146','Where We Are Now','where-we-are-now','open','y',0,0,0,0,'y','n',1390200540,'2014','01','19',0,0,20140120065030,0,0),(10,1,3,1,NULL,'167.100.118.140','Where we are now: India','where-we-are-now-india','open','y',0,0,0,0,'y','n',1390200600,'2014','01','19',0,0,20140211174749,0,0),(11,1,2,1,NULL,'167.100.118.140','Hearing Mission 1','we-use-hearing-as-a-vehicle-to-change-lives-around-the-world','open','y',0,0,0,0,'y','n',1390202040,'2014','01','19',0,0,20140214054722,0,0),(48,1,6,6,NULL,'67.53.113.42','Where we were yesterday','where-we-were-yesterday','open','y',0,0,0,0,'y','n',1391548500,'2014','02','04',0,0,20140204211619,0,0),(16,1,6,1,NULL,'76.169.36.76','Hearing Missions','hearing-missions','open','y',0,0,0,0,'y','n',1390241640,'2014','01','20',0,0,20140120181456,0,0),(17,1,10,1,NULL,'167.100.118.140','Programs','programs-2','open','y',0,0,0,0,'y','n',1390963920,'2014','01','28',0,0,20140213184603,0,0),(97,1,11,6,NULL,'172.251.100.146','test media mentio','test-media-mentio','open','y',0,0,0,0,'y','n',1392409980,'2014','02','14',0,0,20140214203729,0,0),(19,1,10,6,NULL,'167.100.118.140','Programs','programs','open','y',0,0,0,0,'n','n',1391037960,'2014','01','29',0,0,20140213215358,0,0),(20,1,1,6,NULL,'167.100.118.140','Hear at Home','hear-at-home','open','y',0,0,0,0,'y','n',1391039400,'2014','01','29',0,0,20140211165704,0,0),(100,1,16,6,NULL,'97.81.103.51','Hearing Mission Test Entry','hearing-mission-test-entry','open','y',0,0,0,0,'y','n',1392700080,'2014','02','17',0,0,20140219230632,0,0),(22,1,7,6,NULL,'67.53.113.42','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'y','n',1391122980,'2014','01','30',0,0,20140131193344,0,0),(99,1,16,1,NULL,'97.81.103.51','Lorem Ipsum dolor sit amet','lorem-ipsum-dolor-sit-amet','open','y',0,0,0,0,'n','n',1350877920,'2012','10','21',0,0,20140219230705,0,0),(31,1,12,6,NULL,'167.100.118.140','Operation Change Intro Video','operation-change-intro-video','open','y',0,0,0,0,'y','n',1391489640,'2014','02','03',0,0,20140212192852,0,0),(32,1,12,6,NULL,'172.251.100.146','ListenCarefully','listencarefully','open','y',0,0,0,0,'y','n',1391489940,'2014','02','03',0,0,20140204050053,0,0),(25,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery','listen-carefully-gallery','open','y',0,0,0,0,'y','n',1391200080,'2014','01','31',0,0,20140210215715,0,0),(26,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery 2','listen-carefully-gallery-2','open','y',0,0,0,0,'y','n',1391200380,'2014','01','31',0,0,20140131203441,0,0),(96,1,5,6,NULL,'172.251.100.146','testing blog post','testing-blog-post','open','y',0,0,0,0,'y','n',1392408480,'2014','02','14',0,0,20140214201045,0,0),(29,1,11,6,NULL,'167.100.118.140','Twins Blog: The First Starkey Mission','twins-blog-the-first-starkey-mission','open','y',0,0,0,0,'y','n',1391288040,'2014','02','01',0,0,20140213224822,0,0),(49,1,3,6,NULL,'167.100.118.140','Partnering to Reach the World','partnering-to-reach-the-world','open','y',0,0,0,0,'n','n',1391548800,'2014','02','04',0,0,20140211175820,0,0),(33,1,12,6,NULL,'172.251.100.146','ListenCarefully2','listencarefully2','open','y',0,0,0,0,'y','n',1391490060,'2014','02','03',0,0,20140204050139,0,0),(34,1,12,6,NULL,'172.251.100.146','ListenCarefully3','listencarefully3','open','y',0,0,0,0,'y','n',1391490060,'2014','02','03',0,0,20140204050246,0,0),(35,1,12,6,NULL,'172.251.100.146','HearNow','hearnow','open','y',0,0,0,0,'y','n',1391490120,'2014','02','03',0,0,20140204050329,0,0),(36,1,12,6,NULL,'167.100.118.140','HearingAidRecycling','hearingaidrecycling','open','y',0,0,0,0,'y','n',1391490180,'2014','02','03',0,0,20140212200159,0,0),(38,1,6,6,NULL,'67.53.113.42','Program','program','open','y',0,0,0,0,'y','n',1391538480,'2014','02','04',0,0,20140204183050,0,0),(39,1,6,6,NULL,'67.53.113.42','Stories','stories','open','y',0,0,0,0,'y','n',1391538600,'2014','02','04',0,0,20140204183121,0,0),(40,1,6,6,NULL,'67.53.113.42','Video','video','open','y',0,0,0,0,'y','n',1391538660,'2014','02','04',0,0,20140204183151,0,0),(41,1,6,6,NULL,'67.53.113.42','Gallery','gallery','open','y',0,0,0,0,'y','n',1391538660,'2014','02','04',0,0,20140204183311,0,0),(42,1,3,6,NULL,'167.100.118.140','Stand Up for Skateparks Learns to Listen Carefully','stand-up-for-skateparks-learns-to-listen-carefully','open','y',0,0,0,0,'y','n',1391538780,'2014','02','04',0,0,20140211172022,0,0),(47,1,1,6,NULL,'167.100.118.140','Testing Homepage Slider','testing-homepage-slider','closed','y',0,0,0,0,'y','n',1391547960,'2014','02','04',0,0,20140211170711,0,0),(50,1,7,6,NULL,'67.53.113.42','Homepage Slider','homepage-slider','open','y',0,0,0,0,'y','n',1391549400,'2014','02','04',0,0,20140204213312,0,0),(98,1,15,1,NULL,'172.251.100.146','Hearing Missions','hearing-missions','open','y',0,0,0,0,'y','n',1392515340,'2014','02','15',0,0,20140218051459,0,0),(52,1,12,6,NULL,'67.53.113.42','Testing Galleries','testing-galleries','open','y',0,0,0,0,'y','n',1391550900,'2014','02','04',0,0,20140204215623,0,0),(53,1,12,6,NULL,'67.53.113.42','Testing Gallery 2','testing-gallery-2','open','y',0,0,0,0,'y','n',1391551020,'2014','02','04',0,0,20140204220219,0,0),(54,1,13,6,NULL,'162.195.121.216','Starkey Press Release Test','starkey-press-release-test','open','y',0,0,0,0,'y','n',1391807640,'2014','02','07',0,0,20140207211620,0,0),(95,1,12,4,NULL,'167.100.118.140','BLOG-December_Newsletter_caring_for_our_friends_in_the_Philippines','blog-december-newsletter-caring-for-our-friends-in-the-philippines','open','y',0,0,0,0,'y','n',1392401940,'2014','02','14',0,0,20140214184150,0,0),(56,1,11,6,NULL,'167.100.118.140','Starkey Executive Director Speaks on the \'Miracle\' of Watching Patients Hear for the Very First Time','starkey_executive_director-speaks_on_the_miracle','open','y',0,0,0,0,'y','n',1391820900,'2014','02','07',0,0,20140214180913,0,0),(87,1,14,1,NULL,'97.81.103.51','South America','south-america','open','y',0,0,0,0,'y','n',1392343860,'2014','02','13',0,0,20140214021231,0,0),(59,1,3,3,NULL,'167.100.118.140','Vikings Partner to Give the Gift of Hearing in Minnesota','vikings-partner-to-give-the-gift-of-hearing-in-minnesota','open','y',0,0,0,0,'n','n',1392139680,'2014','02','11',0,0,20140211173225,0,0),(60,1,3,3,NULL,'167.100.118.140','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'n','n',1392139920,'2014','02','11',0,0,20140211173641,0,0),(61,1,3,3,NULL,'167.100.118.140','Changing Lives with Sir Richard Branson and Virgin Unite','changing-lives-with-sir-richard-branson-and-virgin-unite','open','y',0,0,0,0,'n','n',1392140220,'2014','02','11',0,0,20140211174530,0,0),(62,1,3,3,NULL,'167.100.118.140','Building Momentum for Peace in the West Bank','building-momentum-for-peace-in-the-west-bank','open','y',0,0,0,0,'n','n',1392140460,'2014','02','11',0,0,20140211174453,0,0),(63,1,3,3,NULL,'167.100.118.140','Building a Better Kibera','building-a-better-kibera','open','y',0,0,0,0,'n','n',1392141540,'2014','02','11',0,0,20140211181656,0,0),(64,1,7,3,NULL,'167.100.118.140','Bill Austin Legacy','bill-austin-legacy','open','y',0,0,0,0,'n','n',1392143640,'2014','02','11',0,0,20140213184421,0,0),(65,1,7,3,NULL,'67.53.113.42','2013 So the World May Hear Awards Gala Highlights','2013-so-the-world-may-hear-awards-gala-highlights','open','y',0,0,0,0,'y','n',1392144180,'2014','02','11',0,0,20140213200011,0,0),(86,1,14,1,NULL,'97.81.103.51','Asia','asia','open','y',0,0,0,0,'y','n',1392343860,'2014','02','13',0,0,20140214021146,0,0),(67,1,7,3,NULL,'167.100.118.140','Operation Change','operation-change','open','y',0,0,0,0,'y','n',1392148680,'2014','02','11',0,0,20140213184716,0,0),(74,1,5,4,NULL,'167.100.118.140','Transforming through Volunteerism in Queretaro','transforming-through-volunteerism-in-queretaro','open','y',0,0,0,0,'y','n',1392156660,'2014','02','11',0,0,20140213214642,0,0),(75,1,13,6,NULL,'67.53.113.42','Starkey Hearing Foundation Offers Assistance in Boston','starkey-hearing-foundation-offers-assistance-in-boston','open','y',0,0,0,0,'y','n',1392158220,'2014','02','11',0,0,20140211223900,0,0),(70,1,13,6,NULL,'67.53.113.42','A Record-Setting Year for the Starkey Hearing Foundation','a-record-setting-year-for-the-starkey-hearing-foundation','open','y',0,0,0,0,'y','n',1392152340,'2014','02','11',0,0,20140211210226,0,0),(85,1,14,1,NULL,'97.81.103.51','Central America & Caribbean','central-america-caribbean','open','y',0,0,0,0,'y','n',1392343800,'2014','02','13',0,0,20140214022003,0,0),(83,1,14,1,NULL,'67.53.113.42','Africa','africa','open','y',0,0,0,0,'y','n',1392343200,'2014','02','13',0,0,20140218014501,0,0),(84,1,14,1,NULL,'97.81.103.51','US','us','open','y',0,0,0,0,'y','n',1392343740,'2014','02','13',0,0,20140216222545,0,0),(73,1,12,4,NULL,'167.100.118.140','BLOG-Transforming _through_Volunteerism_in_Queretaro-FILM','transforming-through-volunteerism-in-queretaro','open','y',0,0,0,0,'y','n',1392156480,'2014','02','11',0,0,20140213175112,0,0),(76,1,11,6,NULL,'167.100.118.140','Couple Brings Gift of Hearing to Impaired Across the Globe','couple-brings-gifts-of-hearing-to-impaired-across-the-globe','open','y',0,0,0,0,'y','n',1392158580,'2014','02','11',0,0,20140213230151,0,0),(77,1,5,4,NULL,'167.100.118.140','An Unstoppable Spirit','an-unstoppable-spirit','open','y',0,0,0,0,'y','n',1392221880,'2014','02','12',0,0,20140214174214,0,0),(78,1,12,4,NULL,'167.100.118.140','BLOG-An_Unstoppable_Spirit','an-u','open','y',0,0,0,0,'y','n',1392222420,'2014','02','12',0,0,20140212163927,0,0),(79,1,12,3,NULL,'167.100.118.140','Listen Carefully-10-Second-Film','listen-carefully-10-second-film','open','y',0,0,0,0,'y','n',1392228060,'2014','02','12',0,0,20140212190317,0,0),(80,1,5,4,NULL,'97.81.103.51','Giving Back the World in Trujillo','giving-back-the-world-in-trujillo','open','y',0,0,0,0,'y','n',1392322740,'2014','02','13',0,0,20140214004358,0,0),(81,1,12,4,NULL,'167.100.118.140','BLOG-Giving_Back_the_World_in_Trujillo-FILM','blog-giving-back-the-world-in-trujillo-film','open','y',0,0,0,0,'y','n',1392323580,'2014','02','13',0,0,20140213204124,0,0),(88,1,14,1,NULL,'97.81.103.51','Europe','europe','open','y',0,0,0,0,'y','n',1392343920,'2014','02','13',0,0,20140218002802,0,0),(89,1,14,1,NULL,'97.81.103.51','Australia','australia','open','y',0,0,0,0,'y','n',1392343980,'2014','02','13',0,0,20140214021341,0,0),(91,1,12,4,NULL,'167.100.118.140','BLOG-Preparing_to_give_the_gift_of_hearing','blog-preparing-to-give-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1392395640,'2014','02','14',0,0,20140214163617,0,0),(92,1,5,4,NULL,'167.100.118.140','Preparing to Give the Gift of Hearing','preparing-to-give-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1392395760,'2014','02','14',0,0,20140214164342,0,0),(93,1,12,4,NULL,'167.100.118.140','BLOG-Impacting_a_life_in_Manila-FILM','blog-impacting-a-life-in-manila-film','open','y',0,0,0,0,'y','n',1392396840,'2014','02','14',0,0,20140214165514,0,0),(94,1,5,4,NULL,'67.53.113.42','Impacting a Life in Manila','impacting-a-life-in-manila','open','y',0,0,0,0,'y','n',1392396900,'2014','02','14',0,0,20140214183004,0,0),(101,1,17,1,NULL,'97.81.103.51','Galla: Overview Tab','galla-overview-tab','open','y',0,0,0,0,'y','n',1392957480,'2014','02','20',0,0,20140221044313,0,0),(102,1,18,1,NULL,'97.81.103.51','2014: Text Row Example','2014-schedule','open','y',0,0,0,0,'y','n',1392957780,'2014','02','20',0,0,20140221045043,0,0),(103,1,18,1,NULL,'97.81.103.51','2014: Image Row Example','2014-sponsorship','open','y',0,0,0,0,'y','n',1392958020,'2014','02','20',0,0,20140221045023,0,0),(104,1,18,1,NULL,'97.81.103.51','2014: Text block example','2014-text-block-example','open','y',0,0,0,0,'y','n',1392958080,'2014','02','20',0,0,20140221045006,0,0),(105,1,19,1,NULL,'97.81.103.51','Starkey Galla 2014','starkey-galla-2014','open','y',0,0,0,0,'y','n',1392958200,'2014','02','20',0,0,20140221045507,0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'homepage_features','Homepage Hero Slider ','http://starkey.ahundredyears.com/','','en',3,0,1391039400,0,'',NULL,'open',1,1,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(2,1,'homepage_content','Homepage Mission and Pictograms ','http://starkey.ahundredyears.com/','','en',1,0,1390202040,0,'',NULL,'open',2,4,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(3,1,'homepage_map_items','Homepage Map Items','http://starkey.ahundredyears.com/',NULL,'en',8,0,1392141540,0,'',NULL,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(4,1,'media_mentions_carousel','Media Mentions Carousel','http://starkey.ahundredyears.com/','','en',2,0,1390189140,0,'',NULL,'open',NULL,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(5,1,'blog','Blog','http://starkey.ahundredyears.com/',NULL,'en',6,0,1392408480,0,'',NULL,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(6,1,'homepage_map_categories','Homepage Map Categories','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391548500,0,'',NULL,'open',6,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(7,1,'homepage_main_carousel','Homepage Bottom Carousel','http://starkey.ahundredyears.com/','','en',8,0,1392148680,0,'',NULL,'open',7,33,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(8,1,'operation_change_carousel','Operation Change Carousel','http://starkey.ahundredyears.com/','','en',0,0,0,0,'',NULL,'open',7,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(9,1,'listen_carefully','Listen Carefully','http://starkey.ahundredyears.com/',NULL,'en',0,0,0,0,'',NULL,'open',7,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(10,1,'programs','Programs','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391037960,0,'',NULL,'open',8,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(13,1,'press_releases','Press Releases','http://starkey.ahundredyears.com/',NULL,'en',3,0,1392158220,0,'',NULL,'open',11,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(11,1,'media_mentions','Media Mentions','http://starkey.ahundredyears.com/',NULL,'en',4,0,1392409980,0,'',NULL,'open',10,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(12,1,'gallery','Gallery','http://starkey.ahundredyears.com/',NULL,'en',17,0,1392401940,0,'',NULL,'open',9,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(14,1,'mission_markers','Mission Markers','http://starkey.ahundredyears.com/',NULL,'en',7,0,1392343980,0,'',1,'open',12,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(15,1,'hearing_landing','Hearing Mission Index','http://starkey.ahundredyears.com/','','en',1,0,1392515340,0,'',1,'open',13,82,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(16,1,'hearing_missions','Hearing Mission','http://starkey.ahundredyears.com/','','en',2,0,1392700080,0,'1',1,'open',14,87,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(17,1,'galla_overview','Galla Overview','http://production.starkey.ahundredyears.com/',NULL,'en',1,0,1392957480,0,'',1,'open',15,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(18,1,'galla_panel','Galla Panel','http://production.starkey.ahundredyears.com/',NULL,'en',3,0,1392958080,0,'',1,'open',16,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(19,1,'galla','Galla','http://production.starkey.ahundredyears.com/',NULL,'en',1,0,1392958200,0,'',1,'open',17,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'dev@100yea.rs','10.11.0.1',1389245396,'Logged in'),(2,1,1,'dev@100yea.rs','10.11.0.1',1389245511,'Site Updated&nbsp;&nbsp;Starkey Hearing Foundation'),(3,1,1,'dev@100yea.rs','10.11.0.1',1389255875,'Logged out'),(4,1,1,'dev@100yea.rs','10.11.0.1',1389306293,'Logged in'),(5,1,1,'dev@100yea.rs','67.53.113.42',1389658121,'Logged in'),(6,1,1,'dev@100yea.rs','67.53.113.42',1390001368,'Logged in'),(7,1,1,'dev@100yea.rs','67.53.113.42',1390001560,'Field Group Created:&nbsp;Homepage Features'),(8,1,1,'dev@100yea.rs','67.53.113.42',1390001825,'Field Group Created:&nbsp;Homepage Pictograms'),(9,1,1,'dev@100yea.rs','67.53.113.42',1390001855,'Field Group Created:&nbsp;Homepage Map Items'),(10,1,1,'dev@100yea.rs','67.53.113.42',1390001975,'Field Group Created:&nbsp;Media Mentions'),(11,1,1,'dev@100yea.rs','67.53.113.42',1390002133,'Field Group Created:&nbsp;Blog'),(12,1,1,'dev@100yea.rs','67.53.113.42',1390002338,'Channel Created:&nbsp;&nbsp;Homepage Features'),(13,1,1,'dev@100yea.rs','67.53.113.42',1390002360,'Channel Created:&nbsp;&nbsp;Homepage Pictograms'),(14,1,1,'dev@100yea.rs','67.53.113.42',1390002379,'Channel Created:&nbsp;&nbsp;Homepage Map Items'),(15,1,1,'dev@100yea.rs','67.53.113.42',1390002398,'Channel Created:&nbsp;&nbsp;Media Mentions'),(16,1,1,'dev@100yea.rs','67.53.113.42',1390002408,'Channel Created:&nbsp;&nbsp;Blog'),(17,1,1,'dev@100yea.rs','67.53.113.42',1390003402,'Logged in'),(18,1,1,'dev@100yea.rs','76.169.36.76',1390174434,'Logged in'),(19,1,1,'dev@100yea.rs','172.251.100.146',1390175990,'Logged in'),(20,1,1,'dev@100yea.rs','172.251.100.146',1390178704,'Logged out'),(21,1,1,'dev@100yea.rs','76.169.36.76',1390186504,'Logged in'),(22,1,1,'dev@100yea.rs','76.169.36.76',1390186888,'Field Group Created:&nbsp;Homepage Map Categories'),(23,1,1,'dev@100yea.rs','76.169.36.76',1390187000,'Channel Created:&nbsp;&nbsp;Homepage Map Categories'),(24,1,1,'dev@100yea.rs','76.169.36.76',1390187478,'Field Group Created:&nbsp;Homepage Main Carousel'),(25,1,1,'dev@100yea.rs','76.169.36.76',1390187711,'Channel Created:&nbsp;&nbsp;Main Carousel'),(26,1,1,'dev@100yea.rs','172.251.100.146',1390188000,'Logged in'),(27,1,1,'dev@100yea.rs','76.169.36.76',1390188084,'Channel Created:&nbsp;&nbsp;Operation Change'),(28,1,1,'dev@100yea.rs','76.169.36.76',1390188095,'Channel Created:&nbsp;&nbsp;Listen Carefully'),(29,1,1,'dev@100yea.rs','76.169.36.76',1390188185,'Channel Created:&nbsp;&nbsp;Programs'),(30,1,1,'dev@100yea.rs','76.169.36.76',1390188198,'Field Group Created:&nbsp;Programs'),(31,1,1,'dev@100yea.rs','76.169.36.76',1390190779,'Logged out'),(32,1,1,'dev@100yea.rs','172.251.100.146',1390192108,'Logged in'),(33,1,1,'dev@100yea.rs','172.251.100.146',1390192138,'Logged out'),(34,1,1,'dev@100yea.rs','172.251.100.146',1390192147,'Logged in'),(35,1,1,'dev@100yea.rs','76.169.36.76',1390195561,'Logged in'),(36,1,1,'dev@100yea.rs','172.251.100.146',1390196042,'Logged out'),(37,1,1,'dev@100yea.rs','172.251.100.146',1390196559,'Logged in'),(38,1,1,'dev@100yea.rs','76.169.36.76',1390197123,'Logged in'),(39,1,1,'dev@100yea.rs','76.169.36.76',1390198922,'Custom Field Deleted:&nbsp;carousel_title'),(40,1,1,'dev@100yea.rs','76.169.36.76',1390201092,'Logged in'),(41,1,1,'dev@100yea.rs','76.169.36.76',1390202448,'Custom Field Deleted:&nbsp;blog_link'),(42,1,1,'dev@100yea.rs','76.169.36.76',1390202491,'Custom Field Deleted:&nbsp;blog_source'),(43,1,1,'dev@100yea.rs','172.251.100.146',1390208228,'Logged out'),(44,1,1,'dev@100yea.rs','76.169.36.76',1390209177,'Logged out'),(45,1,1,'dev@100yea.rs','67.53.113.42',1390237918,'Logged in'),(46,1,1,'dev@100yea.rs','76.169.36.76',1390238882,'Logged in'),(47,1,1,'dev@100yea.rs','76.169.36.76',1390241230,'Logged in'),(48,1,1,'dev@100yea.rs','67.53.113.42',1390243995,'Logged out'),(49,1,1,'dev@100yea.rs','67.53.113.42',1390850253,'Logged in'),(50,1,1,'dev@100yea.rs','67.53.113.42',1390850428,'Member profile created:&nbsp;&nbsp;taylor_joseph'),(51,1,1,'dev@100yea.rs','67.53.113.42',1390850463,'Member profile created:&nbsp;&nbsp;trinh_mai'),(52,1,1,'dev@100yea.rs','67.53.113.42',1390850495,'Member profile created:&nbsp;&nbsp;laura_hetzel'),(53,1,1,'dev@100yea.rs','67.53.113.42',1390850564,'Member profile created:&nbsp;&nbsp;randall_ward'),(54,1,1,'dev@100yea.rs','67.53.113.42',1390850671,'Screen name was changed to:&nbsp;&nbsp;Trinh Mai'),(55,1,1,'dev@100yea.rs','67.53.113.42',1390864649,'Logged in'),(56,1,1,'dev@100yea.rs','67.53.113.42',1390865172,'Logged in'),(57,1,1,'dev@100yea.rs','67.53.113.42',1390865267,'Member profile created:&nbsp;&nbsp;julie@100yea.rs'),(58,1,6,'julie@100yea.rs','67.53.113.42',1390865391,'Logged in'),(59,1,6,'julie@100yea.rs','172.251.100.146',1390879909,'Logged in'),(60,1,1,'dev@100yea.rs','76.169.36.76',1390881643,'Logged in'),(61,1,1,'dev@100yea.rs','76.169.36.76',1390888793,'Logged in'),(62,1,1,'dev@100yea.rs','76.169.36.76',1390892415,'Logged out'),(63,1,6,'julie@100yea.rs','172.251.100.146',1390934637,'Logged in'),(64,1,1,'dev@100yea.rs','67.53.113.42',1390942116,'Logged in'),(65,1,1,'dev@100yea.rs','67.53.113.42',1390942173,'Logged in'),(66,1,6,'julie@100yea.rs','172.251.100.146',1390944299,'Logged out'),(67,1,6,'julie@100yea.rs','172.251.100.146',1390946652,'Logged in'),(68,1,6,'julie@100yea.rs','172.251.100.146',1390962146,'Logged in'),(69,1,1,'dev@100yea.rs','76.169.36.76',1390963929,'Logged in'),(70,1,6,'julie@100yea.rs','172.251.100.146',1390966989,'Logged out'),(71,1,6,'julie@100yea.rs','172.251.100.146',1390970002,'Logged in'),(72,1,1,'dev@100yea.rs','76.169.36.76',1390971428,'Logged in'),(73,1,6,'julie@100yea.rs','172.251.100.146',1390974780,'Logged in'),(74,1,1,'dev@100yea.rs','76.169.36.76',1390975337,'Logged in'),(75,1,1,'dev@100yea.rs','76.169.36.76',1390975463,'Member profile created:&nbsp;&nbsp;tulika_bose'),(76,1,1,'dev@100yea.rs','76.169.36.76',1390975508,'Member profile created:&nbsp;&nbsp;megan_sheley'),(77,1,6,'julie@100yea.rs','172.251.100.146',1390977916,'Logged out'),(78,1,1,'dev@100yea.rs','76.169.36.76',1390981911,'Logged out'),(79,1,1,'dev@100yea.rs','76.169.36.76',1390983433,'Logged in'),(80,1,1,'dev@100yea.rs','76.169.36.76',1390986303,'Logged in'),(81,1,1,'dev@100yea.rs','76.169.36.76',1390987040,'Logged out'),(82,1,1,'dev@100yea.rs','76.169.36.76',1390987518,'Logged in'),(83,1,1,'dev@100yea.rs','76.169.36.76',1390990723,'Logged out'),(84,1,6,'julie@100yea.rs','172.251.100.146',1391017243,'Logged in'),(85,1,1,'dev@100yea.rs','76.169.36.76',1391018846,'Logged in'),(86,1,6,'julie@100yea.rs','172.251.100.146',1391021598,'Logged in'),(87,1,1,'dev@100yea.rs','76.169.36.76',1391022070,'Logged out'),(88,1,1,'dev@100yea.rs','76.169.36.76',1391023429,'Logged in'),(89,1,6,'julie@100yea.rs','172.251.100.146',1391024368,'Logged in'),(90,1,1,'dev@100yea.rs','76.169.36.76',1391025187,'Channel Created:&nbsp;&nbsp;Media Mentions'),(91,1,6,'julie@100yea.rs','172.251.100.146',1391025819,'Logged out'),(92,1,6,'julie@100yea.rs','172.251.100.146',1391025824,'Logged in'),(93,1,1,'dev@100yea.rs','76.169.36.76',1391025894,'Logged out'),(94,1,1,'dev@100yea.rs','76.169.36.76',1391025897,'Logged in'),(95,1,6,'julie@100yea.rs','172.251.100.146',1391026118,'Logged in'),(96,1,6,'julie@100yea.rs','172.251.100.146',1391026128,'Logged in'),(97,1,6,'julie@100yea.rs','172.251.100.146',1391026387,'Logged in'),(98,1,1,'dev@100yea.rs','76.169.36.76',1391026426,'Logged in'),(99,1,1,'dev@100yea.rs','76.169.36.76',1391031302,'Logged in'),(100,1,6,'julie@100yea.rs','172.251.100.146',1391032109,'Logged in'),(101,1,1,'dev@100yea.rs','76.169.36.76',1391037048,'Logged in'),(102,1,6,'julie@100yea.rs','172.251.100.146',1391037612,'Logged out'),(103,1,6,'julie@100yea.rs','172.251.100.146',1391038002,'Logged in'),(104,1,1,'dev@100yea.rs','76.169.36.76',1391038930,'Custom Field Deleted:&nbsp;Hear Now Title'),(105,1,1,'dev@100yea.rs','76.169.36.76',1391040145,'Logged in'),(106,1,1,'dev@100yea.rs','76.169.36.76',1391042932,'Logged out'),(107,1,1,'dev@100yea.rs','76.169.36.76',1391043035,'Logged in'),(108,1,1,'dev@100yea.rs','76.169.36.76',1391048286,'Logged out'),(109,1,1,'dev@100yea.rs','76.169.36.76',1391053349,'Logged in'),(110,1,6,'julie@100yea.rs','172.251.100.146',1391063062,'Logged in'),(111,1,6,'julie@100yea.rs','172.251.100.146',1391067363,'Logged out'),(112,1,1,'dev@100yea.rs','67.53.113.42',1391105484,'Logged in'),(113,1,1,'dev@100yea.rs','67.53.113.42',1391108060,'Logged out'),(114,1,6,'julie@100yea.rs','67.53.113.42',1391108410,'Logged in'),(115,1,6,'julie@100yea.rs','67.53.113.42',1391111693,'Logged out'),(116,1,6,'julie@100yea.rs','67.53.113.42',1391122997,'Logged in'),(117,1,1,'dev@100yea.rs','76.169.36.76',1391189536,'Logged in'),(118,1,1,'dev@100yea.rs','76.169.36.76',1391192377,'Logged in'),(119,1,1,'dev@100yea.rs','76.169.36.76',1391192642,'Custom Field Deleted:&nbsp;homepage_map_item_subtitle'),(120,1,1,'dev@100yea.rs','76.169.36.76',1391193919,'Logged in'),(121,1,6,'julie@100yea.rs','67.53.113.42',1391196783,'Logged in'),(122,1,1,'dev@100yea.rs','76.169.36.76',1391198029,'Logged out'),(123,1,1,'dev@100yea.rs','76.169.36.76',1391198055,'Logged in'),(124,1,1,'dev@100yea.rs','76.169.36.76',1391198207,'Logged in'),(125,1,1,'dev@100yea.rs','76.169.36.76',1391199105,'Field Group Created:&nbsp;Gallery'),(126,1,1,'dev@100yea.rs','76.169.36.76',1391199167,'Channel Created:&nbsp;&nbsp;Gallery'),(127,1,1,'dev@100yea.rs','76.169.36.76',1391201583,'Logged out'),(128,1,6,'julie@100yea.rs','67.53.113.42',1391206034,'Logged out'),(129,1,1,'dev@100yea.rs','76.169.36.76',1391210574,'Logged in'),(130,1,1,'dev@100yea.rs','76.169.36.76',1391211049,'Logged in'),(131,1,6,'julie@100yea.rs','67.53.113.42',1391211422,'Logged in'),(132,1,6,'julie@100yea.rs','67.53.113.42',1391215453,'Logged in'),(133,1,1,'dev@100yea.rs','76.169.36.76',1391219603,'Logged in'),(134,1,6,'julie@100yea.rs','172.251.100.146',1391287070,'Logged in'),(135,1,1,'dev@100yea.rs','76.90.138.219',1391287092,'Logged in'),(136,1,1,'dev@100yea.rs','66.215.94.39',1391287166,'Logged in'),(137,1,1,'dev@100yea.rs','66.215.94.39',1391287445,'Logged in'),(138,1,1,'dev@100yea.rs','66.215.94.39',1391288259,'Logged in'),(139,1,1,'dev@100yea.rs','66.215.94.39',1391288473,'Logged in'),(140,1,1,'dev@100yea.rs','66.215.94.39',1391288998,'Logged in'),(141,1,1,'dev@100yea.rs','66.215.94.39',1391294402,'Logged out'),(142,1,1,'dev@100yea.rs','76.169.36.76',1391315976,'Logged in'),(143,1,1,'dev@100yea.rs','76.169.36.76',1391323405,'Logged in'),(144,1,6,'julie@100yea.rs','172.251.100.146',1391381453,'Logged in'),(145,1,6,'julie@100yea.rs','172.251.100.146',1391383034,'Logged out'),(146,1,6,'julie@100yea.rs','67.53.113.42',1391449436,'Logged in'),(147,1,6,'julie@100yea.rs','67.53.113.42',1391460251,'Logged in'),(148,1,6,'julie@100yea.rs','67.53.113.42',1391463344,'Logged out'),(149,1,6,'julie@100yea.rs','67.53.113.42',1391464865,'Logged in'),(150,1,6,'julie@100yea.rs','67.53.113.42',1391469120,'Logged out'),(151,1,6,'julie@100yea.rs','67.53.113.42',1391470529,'Logged in'),(152,1,6,'julie@100yea.rs','67.53.113.42',1391473159,'Logged out'),(153,1,1,'dev@100yea.rs','67.53.113.42',1391474212,'Logged in'),(154,1,6,'julie@100yea.rs','172.251.100.146',1391489653,'Logged in'),(155,1,6,'julie@100yea.rs','172.251.100.146',1391490424,'Logged in'),(156,1,6,'julie@100yea.rs','67.53.113.42',1391538264,'Logged in'),(157,1,6,'julie@100yea.rs','67.53.113.42',1391539983,'Logged in'),(158,1,6,'julie@100yea.rs','67.53.113.42',1391540284,'Logged in'),(159,1,1,'dev@100yea.rs','67.53.113.42',1391540341,'Logged in'),(160,1,1,'dev@100yea.rs','67.53.113.42',1391540362,'Logged in'),(161,1,1,'dev@100yea.rs','67.53.113.42',1391541394,'Logged in'),(162,1,1,'dev@100yea.rs','67.53.113.42',1391541873,'Logged in'),(163,1,6,'julie@100yea.rs','67.53.113.42',1391545117,'Logged out'),(164,1,1,'dev@100yea.rs','67.53.113.42',1391545801,'Logged in'),(165,1,1,'dev@100yea.rs','67.53.113.42',1391548761,'Logged in'),(166,1,6,'julie@100yea.rs','67.53.113.42',1391552090,'Logged out'),(167,1,2,'taylor_joseph','67.53.113.42',1391552108,'Logged in'),(168,1,6,'julie@100yea.rs','67.53.113.42',1391553026,'Logged in'),(169,1,6,'julie@100yea.rs','67.53.113.42',1391557367,'Logged out'),(170,1,3,'trinh_mai','167.100.118.140',1391610838,'Logged in'),(171,1,6,'julie@100yea.rs','67.53.113.42',1391715768,'Logged in'),(172,1,6,'julie@100yea.rs','67.53.113.42',1391721251,'Logged in'),(173,1,6,'julie@100yea.rs','67.53.113.42',1391725914,'Logged in'),(174,1,6,'julie@100yea.rs','67.53.113.42',1391728405,'Logged out'),(175,1,1,'dev@100yea.rs','76.169.36.76',1391791133,'Logged in'),(176,1,1,'dev@100yea.rs','76.169.36.76',1391791171,'Field Group Created:&nbsp;Media Mention'),(177,1,1,'dev@100yea.rs','76.169.36.76',1391791318,'Field group Deleted:&nbsp;&nbsp;Media Mentions'),(178,1,1,'dev@100yea.rs','76.169.36.76',1391791486,'Field Group Created:&nbsp;Press Release'),(179,1,1,'dev@100yea.rs','76.169.36.76',1391793017,'Logged in'),(180,1,1,'dev@100yea.rs','76.169.36.76',1391793048,'Channel Created:&nbsp;&nbsp;Press Releases'),(181,1,1,'dev@100yea.rs','67.53.113.42',1391800501,'Logged in'),(182,1,1,'dev@100yea.rs','67.53.113.42',1391803027,'Logged out'),(183,1,1,'dev@100yea.rs','67.53.113.42',1391805360,'Logged in'),(184,1,6,'julie@100yea.rs','162.195.121.216',1391807685,'Logged in'),(185,1,1,'dev@100yea.rs','67.53.113.42',1391807839,'Logged out'),(186,1,1,'dev@100yea.rs','76.169.36.76',1391807897,'Logged in'),(187,1,1,'dev@100yea.rs','67.53.113.42',1391810252,'Logged in'),(188,1,1,'dev@100yea.rs','67.53.113.42',1391812818,'Logged out'),(189,1,1,'dev@100yea.rs','107.214.220.202',1391815914,'Logged in'),(190,1,6,'julie@100yea.rs','172.251.100.146',1391820905,'Logged in'),(191,1,6,'julie@100yea.rs','172.251.100.146',1391997349,'Logged in'),(192,1,1,'dev@100yea.rs','67.53.113.42',1392068813,'Logged in'),(193,1,6,'julie@100yea.rs','67.53.113.42',1392069382,'Logged in'),(194,1,1,'dev@100yea.rs','67.53.113.42',1392071244,'Logged out'),(195,1,1,'dev@100yea.rs','67.53.113.42',1392072598,'Logged in'),(196,1,6,'julie@100yea.rs','67.53.113.42',1392074239,'Logged in'),(197,1,1,'dev@100yea.rs','67.53.113.42',1392075496,'Logged out'),(198,1,3,'trinh_mai','167.100.118.140',1392130151,'Logged in'),(199,1,1,'dev@100yea.rs','198.15.96.194',1392136134,'Logged in'),(200,1,1,'dev@100yea.rs','198.15.96.194',1392140054,'Logged out'),(201,1,6,'julie@100yea.rs','67.53.113.42',1392142443,'Logged in'),(202,1,1,'dev@100yea.rs','198.15.96.194',1392142502,'Logged in'),(203,1,6,'julie@100yea.rs','67.53.113.42',1392145083,'Logged out'),(204,1,6,'julie@100yea.rs','67.53.113.42',1392146545,'Logged in'),(205,1,1,'dev@100yea.rs','198.15.96.194',1392146795,'Logged out'),(206,1,1,'dev@100yea.rs','76.169.36.76',1392147496,'Logged in'),(207,1,3,'trinh_mai','167.100.118.140',1392147536,'Logged out'),(208,1,3,'trinh_mai','167.100.118.140',1392147853,'Logged in'),(209,1,6,'julie@100yea.rs','67.53.113.42',1392149146,'Logged in'),(210,1,1,'dev@100yea.rs','76.169.36.76',1392149530,'Logged in'),(211,1,1,'dev@100yea.rs','76.169.36.76',1392151150,'Logged in'),(212,1,4,'laura_hetzel','167.100.118.140',1392156335,'Logged in'),(213,1,1,'dev@100yea.rs','198.15.96.194',1392157461,'Logged in'),(214,1,4,'laura_hetzel','167.100.118.140',1392159315,'Logged out'),(215,1,6,'julie@100yea.rs','67.53.113.42',1392159497,'Logged in'),(216,1,3,'trinh_mai','167.100.118.140',1392159772,'Logged out'),(217,1,3,'trinh_mai','167.100.118.140',1392160659,'Logged in'),(218,1,6,'julie@100yea.rs','67.53.113.42',1392165432,'Logged out'),(219,1,3,'trinh_mai','167.100.118.140',1392218442,'Logged in'),(220,1,4,'laura_hetzel','167.100.118.140',1392221654,'Logged in'),(221,1,4,'laura_hetzel','167.100.118.140',1392226057,'Logged out'),(222,1,3,'trinh_mai','167.100.118.140',1392230636,'Logged out'),(223,1,3,'trinh_mai','167.100.118.140',1392231186,'Logged in'),(224,1,1,'dev@100yea.rs','76.169.36.76',1392232161,'Logged in'),(225,1,3,'trinh_mai','167.100.118.140',1392237736,'Logged out'),(226,1,3,'trinh_mai','167.100.118.140',1392240149,'Logged in'),(227,1,1,'dev@100yea.rs','67.53.113.42',1392250024,'Logged in'),(228,1,1,'dev@100yea.rs','97.81.103.51',1392250385,'Logged in'),(229,1,6,'julie@100yea.rs','67.53.113.42',1392250455,'Logged in'),(230,1,6,'julie@100yea.rs','67.53.113.42',1392253985,'Logged out'),(231,1,6,'julie@100yea.rs','67.53.113.42',1392254957,'Logged in'),(232,1,1,'dev@100yea.rs','208.54.64.170',1392256344,'Logged out'),(233,1,1,'dev@100yea.rs','208.54.64.170',1392256655,'Logged in'),(234,1,6,'julie@100yea.rs','67.53.113.42',1392257706,'Logged out'),(235,1,6,'julie@100yea.rs','67.53.113.42',1392260070,'Logged in'),(236,1,6,'julie@100yea.rs','172.251.100.146',1392274130,'Logged in'),(237,1,3,'trinh_mai','167.100.118.140',1392304945,'Logged in'),(238,1,3,'trinh_mai','167.100.118.140',1392307360,'Logged out'),(239,1,4,'laura_hetzel','167.100.118.140',1392313593,'Logged in'),(240,1,3,'trinh_mai','167.100.118.140',1392316359,'Logged in'),(241,1,3,'trinh_mai','167.100.118.140',1392320201,'Logged out'),(242,1,6,'julie@100yea.rs','67.53.113.42',1392321549,'Logged in'),(243,1,3,'trinh_mai','167.100.118.140',1392326214,'Logged in'),(244,1,4,'laura_hetzel','167.100.118.140',1392326614,'Logged out'),(245,1,4,'laura_hetzel','167.100.118.140',1392327506,'Logged in'),(246,1,6,'julie@100yea.rs','67.53.113.42',1392334516,'Logged in'),(247,1,1,'dev@100yea.rs','97.81.103.51',1392334780,'Logged in'),(248,1,1,'dev@100yea.rs','97.81.103.51',1392339877,'Logged in'),(249,1,1,'dev@100yea.rs','67.53.113.42',1392339893,'Logged in'),(250,1,1,'dev@100yea.rs','97.81.103.51',1392342075,'Field Group Created:&nbsp;Mission Markers'),(251,1,1,'dev@100yea.rs','97.81.103.51',1392343176,'Channel Created:&nbsp;&nbsp;Mission Markers'),(252,1,3,'trinh_mai','50.148.230.154',1392351328,'Logged in'),(253,1,4,'laura_hetzel','167.100.118.140',1392394012,'Logged in'),(254,1,4,'laura_hetzel','167.100.118.140',1392394259,'Logged in'),(255,1,4,'laura_hetzel','167.100.118.140',1392400968,'Logged in'),(256,1,1,'dev@100yea.rs','67.53.113.42',1392402579,'Logged in'),(257,1,6,'julie@100yea.rs','67.53.113.42',1392405691,'Logged in'),(258,1,6,'julie@100yea.rs','172.251.100.146',1392408334,'Logged in'),(259,1,6,'julie@100yea.rs','67.53.113.42',1392408482,'Logged out'),(260,1,6,'julie@100yea.rs','172.251.100.146',1392414898,'Logged out'),(261,1,1,'dev@100yea.rs','67.53.113.42',1392420400,'Logged in'),(262,1,6,'julie@100yea.rs','172.251.100.146',1392422543,'Logged in'),(263,1,1,'dev@100yea.rs','67.53.113.42',1392422556,'Logged in'),(264,1,1,'dev@100yea.rs','97.81.103.51',1392422623,'Logged in'),(265,1,1,'dev@100yea.rs','67.53.113.42',1392426203,'Logged out'),(266,1,1,'dev@100yea.rs','97.81.103.51',1392437741,'Logged in'),(267,1,1,'dev@100yea.rs','97.81.103.51',1392501619,'Logged in'),(268,1,1,'dev@100yea.rs','97.81.103.51',1392506835,'Logged in'),(269,1,1,'dev@100yea.rs','97.81.103.51',1392506856,'Field Group Created:&nbsp;Hearing Landing'),(270,1,1,'dev@100yea.rs','97.81.103.51',1392507143,'Channel Created:&nbsp;&nbsp;Hearing Mission Landing Page'),(271,1,1,'dev@100yea.rs','97.81.103.51',1392507213,'Member Group Updated:&nbsp;&nbsp;Members'),(272,1,1,'dev@100yea.rs','97.81.103.51',1392510115,'Logged out'),(273,1,1,'dev@100yea.rs','97.81.103.51',1392514333,'Logged in'),(274,1,1,'dev@100yea.rs','97.81.103.51',1392514360,'Field Group Created:&nbsp;Hearing Missions'),(275,1,1,'dev@100yea.rs','97.81.103.51',1392514930,'Channel Created:&nbsp;&nbsp;Hearing Mission'),(276,1,1,'dev@100yea.rs','97.81.103.51',1392515170,'Category Group Created:&nbsp;&nbsp;Countries'),(277,1,1,'dev@100yea.rs','97.81.103.51',1392518538,'Logged out'),(278,1,1,'dev@100yea.rs','97.81.103.51',1392576724,'Logged in'),(279,1,6,'julie@100yea.rs','172.251.100.146',1392578080,'Logged in'),(280,1,1,'dev@100yea.rs','97.81.103.51',1392589443,'Logged in'),(281,1,1,'dev@100yea.rs','97.81.103.51',1392612871,'Logged in'),(282,1,1,'dev@100yea.rs','198.15.108.194',1392613780,'Logged in'),(283,1,1,'dev@100yea.rs','198.15.108.194',1392616803,'Logged out'),(284,1,1,'dev@100yea.rs','67.53.113.42',1392662379,'Logged in'),(285,1,6,'julie@100yea.rs','67.53.113.42',1392664486,'Logged in'),(286,1,1,'dev@100yea.rs','67.53.113.42',1392666756,'Logged out'),(287,1,1,'dev@100yea.rs','67.53.113.42',1392668506,'Logged in'),(288,1,1,'dev@100yea.rs','67.53.113.42',1392670936,'Logged out'),(289,1,6,'julie@100yea.rs','67.53.113.42',1392676609,'Logged in'),(290,1,1,'dev@100yea.rs','97.81.103.51',1392681561,'Logged in'),(291,1,6,'julie@100yea.rs','67.53.113.42',1392684357,'Logged out'),(292,1,1,'dev@100yea.rs','67.53.113.42',1392686584,'Logged in'),(293,1,6,'julie@100yea.rs','67.53.113.42',1392686738,'Logged in'),(294,1,6,'julie@100yea.rs','67.53.113.42',1392687236,'Logged in'),(295,1,1,'dev@100yea.rs','97.81.103.51',1392687393,'Logged in'),(296,1,1,'dev@100yea.rs','97.81.103.51',1392690303,'Logged in'),(297,1,1,'dev@100yea.rs','97.81.103.51',1392696783,'Logged in'),(298,1,6,'julie@100yea.rs','172.251.100.146',1392699913,'Logged in'),(299,1,6,'julie@100yea.rs','67.53.113.42',1392757245,'Logged in'),(300,1,6,'julie@100yea.rs','67.53.113.42',1392759822,'Logged out'),(301,1,1,'dev@100yea.rs','76.169.36.76',1392760476,'Logged in'),(302,1,1,'dev@100yea.rs','76.169.36.76',1392768794,'Logged in'),(303,1,6,'julie@100yea.rs','67.53.113.42',1392830952,'Logged in'),(304,1,6,'julie@100yea.rs','67.53.113.42',1392835036,'Logged out'),(305,1,1,'dev@100yea.rs','66.85.147.138',1392845548,'Logged in'),(306,1,6,'julie@100yea.rs','67.53.113.42',1392845801,'Logged in'),(307,1,1,'dev@100yea.rs','67.53.113.42',1392846398,'Logged in'),(308,1,6,'julie@100yea.rs','67.53.113.42',1392848315,'Logged out'),(309,1,1,'dev@100yea.rs','67.53.113.42',1392848977,'Logged out'),(310,1,1,'dev@100yea.rs','67.53.113.42',1392849367,'Logged in'),(311,1,1,'dev@100yea.rs','97.81.103.51',1392849444,'Logged in'),(312,1,1,'dev@100yea.rs','97.81.103.51',1392859709,'Logged in'),(313,1,1,'dev@100yea.rs','97.81.103.51',1392956432,'Logged in'),(314,1,1,'dev@100yea.rs','97.81.103.51',1392956453,'Field Group Created:&nbsp;Galla Overview Page'),(315,1,1,'dev@100yea.rs','97.81.103.51',1392956824,'Channel Created:&nbsp;&nbsp;Galla Overview'),(316,1,1,'dev@100yea.rs','97.81.103.51',1392956897,'Field Group Created:&nbsp;Galla Panel'),(317,1,1,'dev@100yea.rs','97.81.103.51',1392957272,'Channel Created:&nbsp;&nbsp;Galla Panel'),(318,1,1,'dev@100yea.rs','97.81.103.51',1392957296,'Field Group Created:&nbsp;Galla'),(319,1,1,'dev@100yea.rs','97.81.103.51',1392957519,'Channel Created:&nbsp;&nbsp;Galla');
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_developer_log`
--

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;
INSERT INTO `exp_developer_log` VALUES (1,1392688340,'n',NULL,'generate_json()',346,'system/expressionengine/third_party/entry_type/ft.entry_type.php','2.6','the native JSON extension (json_encode())',0,NULL,NULL,NULL,NULL,NULL,'f9bf1e5ca4b6370af655e833135b48d8'),(2,1392688340,'n',NULL,'generate_json()',797,'/var/www/starkey/system/codeigniter/system/libraries/Javascript.php','2.6','the native JSON extension (json_encode())',0,NULL,NULL,NULL,NULL,NULL,'893cf0d6cf1b8c892f9fcba6badc92b9'),(3,1392690514,'n',NULL,'generate_json()',96,'system/expressionengine/third_party/entry_type/libraries/Entry_type.php','2.6','the native JSON extension (json_encode())',0,NULL,NULL,NULL,NULL,NULL,'cdff266be36dae3f5948a5924ee8c777'),(4,1392690514,'n',NULL,'generate_json()',98,'system/expressionengine/third_party/entry_type/libraries/Entry_type.php','2.6','the native JSON extension (json_encode())',0,NULL,NULL,NULL,NULL,NULL,'ad0c7b7b404dd980eb22ab570d5778bb'),(5,1392690514,'n',NULL,'generate_json()',141,'system/expressionengine/third_party/entry_type/libraries/Entry_type.php','2.6','the native JSON extension (json_encode())',0,NULL,NULL,NULL,NULL,NULL,'f53ef41723cdf39729996d129e4df0d2'),(6,1392690514,'n',NULL,'generate_json()',801,'/var/www/starkey/system/codeigniter/system/libraries/Javascript.php','2.6','the native JSON extension (json_encode())',0,NULL,NULL,NULL,NULL,NULL,'914ee985c21a73a1997b333ef09ede8d');
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),(2,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y'),(3,'Assets_ext','channel_entries_query_result','channel_entries_query_result','',10,'2.2.4','y'),(4,'Assets_ext','file_after_save','file_after_save','',9,'2.2.4','y'),(5,'Assets_ext','files_after_delete','files_after_delete','',8,'2.2.4','y'),(6,'Stash_ext','template_fetch_template','template_fetch_template','',10,'2.4.9','y'),(7,'Stash_ext','template_post_parse','template_post_parse','',10,'2.4.9','y'),(8,'Entry_type_ext','publish_form_channel_preferences','publish_form_channel_preferences','a:0:{}',10,'1.1.0','y'),(9,'Single_entry_ext','cp_menu_array','cp_menu_array','a:2:{s:12:\"single_entry\";a:1:{i:1;a:2:{i:15;s:1:\"1\";i:17;s:1:\"1\";}}s:22:\"single_entry_nav_title\";s:14:\"Single Entries\";}',10,'1.0.5','y');
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
) ENGINE=MyISAM AUTO_INCREMENT=453 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'markdown'),(4,1,'xhtml'),(5,2,'none'),(6,2,'br'),(7,2,'markdown'),(8,2,'xhtml'),(9,3,'none'),(10,3,'br'),(11,3,'markdown'),(12,3,'xhtml'),(13,4,'none'),(14,4,'br'),(15,4,'markdown'),(16,4,'xhtml'),(17,5,'none'),(18,5,'br'),(19,5,'markdown'),(20,5,'xhtml'),(21,6,'none'),(22,6,'br'),(23,6,'markdown'),(24,6,'xhtml'),(25,7,'none'),(26,7,'br'),(27,7,'markdown'),(28,7,'xhtml'),(29,8,'none'),(30,8,'br'),(31,8,'markdown'),(32,8,'xhtml'),(33,9,'none'),(34,9,'br'),(35,9,'markdown'),(36,9,'xhtml'),(309,78,'none'),(308,77,'xhtml'),(307,77,'markdown'),(306,77,'br'),(305,77,'none'),(304,76,'xhtml'),(303,76,'markdown'),(302,76,'br'),(301,76,'none'),(300,75,'xhtml'),(299,75,'markdown'),(298,75,'br'),(297,75,'none'),(296,74,'xhtml'),(295,74,'markdown'),(294,74,'br'),(293,74,'none'),(292,73,'xhtml'),(291,73,'markdown'),(290,73,'br'),(289,73,'none'),(288,72,'xhtml'),(287,72,'markdown'),(286,72,'br'),(285,72,'none'),(284,71,'xhtml'),(283,71,'markdown'),(282,71,'br'),(281,71,'none'),(280,70,'xhtml'),(279,70,'markdown'),(278,70,'br'),(69,18,'none'),(70,18,'br'),(71,18,'markdown'),(72,18,'xhtml'),(73,19,'none'),(74,19,'br'),(75,19,'markdown'),(76,19,'xhtml'),(77,20,'none'),(78,20,'br'),(79,20,'markdown'),(80,20,'xhtml'),(81,21,'none'),(82,21,'br'),(83,21,'markdown'),(84,21,'xhtml'),(191,48,'markdown'),(190,48,'br'),(189,48,'none'),(188,47,'xhtml'),(187,47,'markdown'),(186,47,'br'),(185,47,'none'),(93,24,'none'),(94,24,'br'),(95,24,'markdown'),(96,24,'xhtml'),(97,25,'none'),(98,25,'br'),(99,25,'markdown'),(100,25,'xhtml'),(101,26,'none'),(102,26,'br'),(103,26,'markdown'),(104,26,'xhtml'),(105,27,'none'),(106,27,'br'),(107,27,'markdown'),(108,27,'xhtml'),(109,28,'none'),(110,28,'br'),(111,28,'markdown'),(112,28,'xhtml'),(113,29,'none'),(114,29,'br'),(115,29,'markdown'),(116,29,'xhtml'),(117,30,'none'),(118,30,'br'),(119,30,'markdown'),(120,30,'xhtml'),(223,56,'markdown'),(222,56,'br'),(221,56,'none'),(183,46,'markdown'),(182,46,'br'),(181,46,'none'),(129,33,'none'),(130,33,'br'),(131,33,'markdown'),(132,33,'xhtml'),(133,34,'none'),(134,34,'br'),(135,34,'markdown'),(136,34,'xhtml'),(137,35,'none'),(138,35,'br'),(139,35,'markdown'),(140,35,'xhtml'),(141,36,'none'),(142,36,'br'),(143,36,'markdown'),(144,36,'xhtml'),(145,37,'none'),(146,37,'br'),(147,37,'markdown'),(148,37,'xhtml'),(149,38,'none'),(150,38,'br'),(151,38,'markdown'),(152,38,'xhtml'),(153,39,'none'),(154,39,'br'),(155,39,'markdown'),(156,39,'xhtml'),(157,40,'none'),(158,40,'br'),(159,40,'markdown'),(160,40,'xhtml'),(161,41,'none'),(162,41,'br'),(163,41,'markdown'),(164,41,'xhtml'),(165,42,'none'),(166,42,'br'),(167,42,'markdown'),(168,42,'xhtml'),(227,57,'markdown'),(226,57,'br'),(225,57,'none'),(224,56,'xhtml'),(173,44,'none'),(174,44,'br'),(175,44,'markdown'),(176,44,'xhtml'),(177,45,'none'),(178,45,'br'),(179,45,'markdown'),(180,45,'xhtml'),(184,46,'xhtml'),(192,48,'xhtml'),(193,49,'none'),(194,49,'br'),(195,49,'markdown'),(196,49,'xhtml'),(277,70,'none'),(276,69,'xhtml'),(275,69,'markdown'),(274,69,'br'),(273,69,'none'),(272,68,'xhtml'),(271,68,'markdown'),(270,68,'br'),(269,68,'none'),(268,67,'xhtml'),(267,67,'markdown'),(266,67,'br'),(265,67,'none'),(264,66,'xhtml'),(263,66,'markdown'),(262,66,'br'),(261,66,'none'),(260,65,'xhtml'),(259,65,'markdown'),(258,65,'br'),(257,65,'none'),(228,57,'xhtml'),(229,58,'none'),(230,58,'br'),(231,58,'markdown'),(232,58,'xhtml'),(233,59,'none'),(234,59,'br'),(235,59,'markdown'),(236,59,'xhtml'),(237,60,'none'),(238,60,'br'),(239,60,'markdown'),(240,60,'xhtml'),(241,61,'none'),(242,61,'br'),(243,61,'markdown'),(244,61,'xhtml'),(245,62,'none'),(246,62,'br'),(247,62,'markdown'),(248,62,'xhtml'),(249,63,'none'),(250,63,'br'),(251,63,'markdown'),(252,63,'xhtml'),(253,64,'none'),(254,64,'br'),(255,64,'markdown'),(256,64,'xhtml'),(310,78,'br'),(311,78,'markdown'),(312,78,'xhtml'),(313,79,'none'),(314,79,'br'),(315,79,'markdown'),(316,79,'xhtml'),(317,80,'none'),(318,80,'br'),(319,80,'markdown'),(320,80,'xhtml'),(321,81,'none'),(322,81,'br'),(323,81,'markdown'),(324,81,'xhtml'),(325,82,'none'),(326,82,'br'),(327,82,'markdown'),(328,82,'xhtml'),(329,83,'none'),(330,83,'br'),(331,83,'markdown'),(332,83,'xhtml'),(333,84,'none'),(334,84,'br'),(335,84,'markdown'),(336,84,'xhtml'),(337,85,'none'),(338,85,'br'),(339,85,'markdown'),(340,85,'xhtml'),(341,86,'none'),(342,86,'br'),(343,86,'markdown'),(344,86,'xhtml'),(345,87,'none'),(346,87,'br'),(347,87,'markdown'),(348,87,'xhtml'),(349,88,'none'),(350,88,'br'),(351,88,'markdown'),(352,88,'xhtml'),(353,89,'none'),(354,89,'br'),(355,89,'markdown'),(356,89,'xhtml'),(357,90,'none'),(358,90,'br'),(359,90,'markdown'),(360,90,'xhtml'),(361,91,'none'),(362,91,'br'),(363,91,'markdown'),(364,91,'xhtml'),(365,92,'none'),(366,92,'br'),(367,92,'markdown'),(368,92,'xhtml'),(369,93,'none'),(370,93,'br'),(371,93,'markdown'),(372,93,'xhtml'),(373,94,'none'),(374,94,'br'),(375,94,'markdown'),(376,94,'xhtml'),(377,95,'none'),(378,95,'br'),(379,95,'markdown'),(380,95,'xhtml'),(381,96,'none'),(382,96,'br'),(383,96,'markdown'),(384,96,'xhtml'),(385,97,'none'),(386,97,'br'),(387,97,'markdown'),(388,97,'xhtml'),(389,98,'none'),(390,98,'br'),(391,98,'markdown'),(392,98,'xhtml'),(393,99,'none'),(394,99,'br'),(395,99,'markdown'),(396,99,'xhtml'),(397,100,'none'),(398,100,'br'),(399,100,'markdown'),(400,100,'xhtml'),(401,101,'none'),(402,101,'br'),(403,101,'markdown'),(404,101,'xhtml'),(405,102,'none'),(406,102,'br'),(407,102,'markdown'),(408,102,'xhtml'),(409,103,'none'),(410,103,'br'),(411,103,'markdown'),(412,103,'xhtml'),(413,104,'none'),(414,104,'br'),(415,104,'markdown'),(416,104,'xhtml'),(417,105,'none'),(418,105,'br'),(419,105,'markdown'),(420,105,'xhtml'),(421,106,'none'),(422,106,'br'),(423,106,'markdown'),(424,106,'xhtml'),(425,107,'none'),(426,107,'br'),(427,107,'markdown'),(428,107,'xhtml'),(429,108,'none'),(430,108,'br'),(431,108,'markdown'),(432,108,'xhtml'),(433,109,'none'),(434,109,'br'),(435,109,'markdown'),(436,109,'xhtml'),(437,110,'none'),(438,110,'br'),(439,110,'markdown'),(440,110,'xhtml'),(441,111,'none'),(442,111,'br'),(443,111,'markdown'),(444,111,'xhtml'),(445,112,'none'),(446,112,'br'),(447,112,'markdown'),(448,112,'xhtml'),(449,113,'none'),(450,113,'br'),(451,113,'markdown'),(452,113,'xhtml');
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Homepage Hero Slider'),(2,1,'Homepage Mission and Pictograms'),(3,1,'Homepage Map Items'),(11,1,'Press Release'),(5,1,'Blog'),(6,1,'Homepage Map Categories'),(7,1,'Homepage Bottom Carousel'),(8,1,'Programs'),(9,1,'Gallery'),(10,1,'Media Mention'),(12,1,'Mission Markers'),(13,1,'Hearing Landing'),(14,1,'Hearing Missions'),(15,1,'Galla Overview Page'),(16,1,'Galla Panel'),(17,1,'Galla');
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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'grid','1.0','YTowOnt9','n'),(7,'multi_select','1.0','YTowOnt9','n'),(8,'checkboxes','1.0','YTowOnt9','n'),(9,'radio','1.0','YTowOnt9','n'),(10,'relationship','1.0','YTowOnt9','n'),(11,'rte','1.0','YTowOnt9','n'),(12,'wygwam','3.2.2','YToyOntzOjExOiJsaWNlbnNlX2tleSI7czowOiIiO3M6MTI6ImZpbGVfYnJvd3NlciI7czo2OiJhc3NldHMiO30=','y'),(13,'freeform','4.1.3','YTowOnt9','n'),(14,'assets','2.2.4','YTowOnt9','y'),(15,'fieldpack_checkboxes','2.1.1','YTowOnt9','n'),(16,'fieldpack_dropdown','2.1.1','YTowOnt9','n'),(17,'fieldpack_list','2.1.1','YTowOnt9','n'),(18,'fieldpack_multiselect','2.1.1','YTowOnt9','n'),(19,'fieldpack_pill','2.1.1','YTowOnt9','n'),(20,'fieldpack_radio_buttons','2.1.1','YTowOnt9','n'),(21,'fieldpack_switch','2.1.1','YTowOnt9','n'),(22,'hundies_region_select','1.0','YTowOnt9','n'),(23,'entry_type','1.1.0','YTowOnt9','n'),(24,'mx_select_plus','1.4','YToxOntzOjA6IiI7czowOiIiO30=','n');
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
) ENGINE=MyISAM AUTO_INCREMENT=269 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (46,1,'pdf_download_tes.pdf',2,'/var/www/starkey/www/uploads/files/pdf_download_tes.pdf','application/pdf','pdf_download_tes.pdf',8673,NULL,NULL,NULL,6,1391541790,6,1391541790,' '),(72,1,'SHF_2012Overview_NewsRelease_FINAL1.docx',2,'/var/www/starkey/www/uploads/files/SHF_2012Overview_NewsRelease_FINAL1.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','SHF_2012Overview_NewsRelease_FINAL1.docx',184699,NULL,NULL,NULL,6,1392152482,6,1392152482,' '),(88,1,'Listen-Carefully-Loudness-Wars.pdf',2,'/var/www/starkey/www/uploads/files/Listen-Carefully-Loudness-Wars.pdf','application/pdf','Listen-Carefully-Loudness-Wars.pdf',254925,'','','',3,1392232516,3,1392232528,' '),(92,1,'FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf',2,'/var/www/starkey/www/uploads/files/FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf','application/pdf','FORM7970-10-EE-XX-Hear-Now-Application-2014.pdf',2197606,NULL,NULL,NULL,3,1392234275,3,1392234275,' '),(93,1,'FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf',2,'/var/www/starkey/www/uploads/files/FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf','application/pdf','FORM7970-10-EE-XX-Hear-Now-Application-2014_SPANISH.pdf',2208358,NULL,NULL,NULL,3,1392234291,3,1392234291,' '),(104,1,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',2,'/var/www/starkey/www/uploads/files/Screen_Shot_2014-02-12_at_8.59.27_PM.png','image/png','Screen_Shot_2014-02-12_at_8.59.27_PM.png',4440,NULL,NULL,NULL,1,1392335362,1,1392849489,'31 64'),(145,1,'DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg',2,'/var/www/starkey/www/uploads/files/DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg','image/jpeg','DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg',5530452,NULL,NULL,NULL,6,1392700972,1,1392849487,'3988 5420'),(219,1,'Rwanda_Day_Three_447.jpg',1,'/var/www/starkey/www/uploads/images/Rwanda_Day_Three_447.jpg','image/jpeg','Rwanda_Day_Three_447.jpg',9387054,NULL,NULL,NULL,1,1392681562,1,1392850982,'3744 5616'),(218,1,'Rwanda_Day_One_1226_edit.jpg',1,'/var/www/starkey/www/uploads/images/Rwanda_Day_One_1226_edit.jpg','image/jpeg','Rwanda_Day_One_1226_edit.jpg',8930944,NULL,NULL,NULL,1,1392681537,1,1392850981,'5616 3744'),(217,1,'Rwanda.jpg',1,'/var/www/starkey/www/uploads/images/Rwanda.jpg','image/jpeg','Rwanda.jpg',5484707,NULL,NULL,NULL,1,1392681561,1,1392850981,'2533 3093'),(216,1,'Main_2.jpg',1,'/var/www/starkey/www/uploads/images/Main_2.jpg','image/jpeg','Main_2.jpg',5211133,NULL,NULL,NULL,1,1392681513,1,1392850978,'4265 6714'),(215,1,'Main.jpg',1,'/var/www/starkey/www/uploads/images/Main.jpg','image/jpeg','Main.jpg',2355552,NULL,NULL,NULL,1,1392681509,1,1392850978,'2333 3946'),(214,1,'MJM_5941cSantoDomingo_Day_3_Tues_Feb_12.jpg',1,'/var/www/starkey/www/uploads/images/MJM_5941cSantoDomingo_Day_3_Tues_Feb_12.jpg','image/jpeg','MJM_5941cSantoDomingo_Day_3_Tues_Feb_12.jpg',6995365,NULL,NULL,NULL,1,1392681536,1,1392850978,'4542 7004'),(213,1,'MCC_9492cNew_Orleans_Day_1_1.jpg',1,'/var/www/starkey/www/uploads/images/MCC_9492cNew_Orleans_Day_1_1.jpg','image/jpeg','MCC_9492cNew_Orleans_Day_1_1.jpg',3131792,NULL,NULL,NULL,1,1392681515,1,1392850974,'2922 5139'),(212,1,'MCC_6805cc_edit.jpg',1,'/var/www/starkey/www/uploads/images/MCC_6805cc_edit.jpg','image/jpeg','MCC_6805cc_edit.jpg',22759968,NULL,NULL,NULL,1,1392681563,1,1392850974,'4542 7250'),(211,1,'MCC_1444cc.jpg',1,'/var/www/starkey/www/uploads/images/MCC_1444cc.jpg','image/jpeg','MCC_1444cc.jpg',557710,NULL,NULL,NULL,1,1392681508,1,1392850974,'1158 1495'),(210,1,'DSC09692ccSo_Africa_Day_2_Mar_1_Fri.jpg',1,'/var/www/starkey/www/uploads/images/DSC09692ccSo_Africa_Day_2_Mar_1_Fri.jpg','image/jpeg','DSC09692ccSo_Africa_Day_2_Mar_1_Fri.jpg',1339389,NULL,NULL,NULL,1,1392681480,1,1392850972,'1165 1440'),(209,1,'DSC08239cc.jpg',1,'/var/www/starkey/www/uploads/images/DSC08239cc.jpg','image/jpeg','DSC08239cc.jpg',1321594,NULL,NULL,NULL,1,1392681471,1,1392850972,'2221 3008'),(208,1,'DSC07963cc.jpg',1,'/var/www/starkey/www/uploads/images/DSC07963cc.jpg','image/jpeg','DSC07963cc.jpg',1979544,NULL,NULL,NULL,1,1392681469,1,1392850972,'2719 2146'),(207,1,'DSC06962cc.jpg',1,'/var/www/starkey/www/uploads/images/DSC06962cc.jpg','image/jpeg','DSC06962cc.jpg',1934884,NULL,NULL,NULL,1,1392681464,1,1392850968,'3089 2748'),(206,1,'DSC06637cGuadalajara_Day_3_Sunday.jpg',1,'/var/www/starkey/www/uploads/images/DSC06637cGuadalajara_Day_3_Sunday.jpg','image/jpeg','DSC06637cGuadalajara_Day_3_Sunday.jpg',3897836,NULL,NULL,NULL,1,1392681465,1,1392850968,'3376 6000'),(205,1,'DSC05915cc.jpg',1,'/var/www/starkey/www/uploads/images/DSC05915cc.jpg','image/jpeg','DSC05915cc.jpg',2781118,NULL,NULL,NULL,1,1392681455,1,1392850968,'3358 3111'),(204,1,'DSC05898cc.jpg',1,'/var/www/starkey/www/uploads/images/DSC05898cc.jpg','image/jpeg','DSC05898cc.jpg',3427550,NULL,NULL,NULL,1,1392681448,1,1392850968,'3141 5606'),(203,1,'DSC03822cc.jpg',1,'/var/www/starkey/www/uploads/images/DSC03822cc.jpg','image/jpeg','DSC03822cc.jpg',13778074,NULL,NULL,NULL,1,1392681471,1,1392850968,'2542 4665'),(202,1,'DSC03761cc3.jpg',1,'/var/www/starkey/www/uploads/images/DSC03761cc3.jpg','image/jpeg','DSC03761cc3.jpg',2439773,NULL,NULL,NULL,1,1392681433,1,1392850965,'3816 3344'),(201,1,'DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg',1,'/var/www/starkey/www/uploads/images/DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg','image/jpeg','DSC03653cMadagascar_Day_6_Antananarivo_June_5_1.jpg',5530452,NULL,NULL,NULL,1,1392681443,1,1392850965,'3988 5420'),(200,1,'DSC03269ccKarlal_India_Day_3_Mar_31_Sun.jpg',1,'/var/www/starkey/www/uploads/images/DSC03269ccKarlal_India_Day_3_Mar_31_Sun.jpg','image/jpeg','DSC03269ccKarlal_India_Day_3_Mar_31_Sun.jpg',5074946,NULL,NULL,NULL,1,1392681439,1,1392850965,'3049 5493'),(146,1,'ABClogo.jpg',1,'/var/www/starkey/www/uploads/images/ABClogo.jpg','image/jpeg','ABClogo.jpg',6763,NULL,NULL,NULL,1,1392157491,1,1392850961,'134 152'),(147,1,'BLOG-An_Unstoppable_Spirit_01.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-An_Unstoppable_Spirit_01.jpg','image/jpeg','BLOG-An_Unstoppable_Spirit_01.jpg',70852,NULL,NULL,NULL,1,1392223131,1,1392850961,'525 904'),(148,1,'BLOG-An_Unstoppable_Spirit_02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-An_Unstoppable_Spirit_02.jpg','image/jpeg','BLOG-An_Unstoppable_Spirit_02.jpg',128784,NULL,NULL,NULL,1,1392223145,1,1392850961,'525 1048'),(149,1,'BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg','image/jpeg','BLOG-Dave_Fabry_Lives_to_Listen_Carefully.jpg',3936128,NULL,NULL,NULL,1,1392153484,1,1392850961,'1638 5616'),(150,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg','image/jpeg','BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-02.jpg',187004,NULL,NULL,NULL,1,1392402841,1,1392850962,'525 774'),(151,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-021.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-021.jpg','image/jpeg','BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-021.jpg',187004,NULL,NULL,NULL,1,1392403725,1,1392850962,'525 774'),(152,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-022.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-022.jpg','image/jpeg','BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-022.jpg',187004,NULL,NULL,NULL,1,1392403751,1,1392850962,'525 774'),(153,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-023.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-023.jpg','image/jpeg','BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-023.jpg',187004,NULL,NULL,NULL,1,1392403772,1,1392850962,'525 774'),(154,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-03.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-03.jpg','image/jpeg','BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-03.jpg',26911,NULL,NULL,NULL,1,1392402855,1,1392850962,'234 300'),(155,1,'BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-LEAD.jpg','image/jpeg','BLOG-December_newsletter_caring_for_our_friends_in_the_Philippines-LEAD.jpg',149854,NULL,NULL,NULL,1,1392403484,1,1392850962,'525 762'),(156,1,'BLOG-Impacting_a_life_in_Manila-LEAD.png',1,'/var/www/starkey/www/uploads/images/BLOG-Impacting_a_life_in_Manila-LEAD.png','image/png','BLOG-Impacting_a_life_in_Manila-LEAD.png',993106,NULL,NULL,NULL,1,1392397041,1,1392850962,'525 958'),(157,1,'BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg','image/jpeg','BLOG-Preparing_to_give_the__Gift_of-Hearing-LEAD.jpg',118864,NULL,NULL,NULL,1,1392317488,1,1392850962,'525 835'),(158,1,'BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg','image/jpeg','BLOG-Preparing_to_give_the_gift_of_hearing-01.jpg',181390,NULL,NULL,NULL,1,1392395737,1,1392850962,'525 844'),(159,1,'BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg','image/jpeg','BLOG-Preparing_to_give_the_gift_of_hearing-02.jpg',167003,NULL,NULL,NULL,1,1392395754,1,1392850962,'525 701'),(160,1,'BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg','image/jpeg','BLOG-Preparing_to_give_the_gift_of_hearing-LEAD.jpg',133038,NULL,NULL,NULL,1,1392395987,1,1392850962,'525 835'),(161,1,'BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg','image/jpeg','BLOG-Transforming_through_Volunteerism_in_Queretaro-LEAD.jpg',109104,NULL,NULL,NULL,1,1392327970,1,1392850962,'525 787'),(162,1,'BLOG-Unstoppable_Spirit_LEAD-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Unstoppable_Spirit_LEAD-02.jpg','image/jpeg','BLOG-Unstoppable_Spirit_LEAD-02.jpg',283537,NULL,NULL,NULL,1,1392225896,1,1392850962,'525 1800'),(163,1,'BLOG-Unstoppable_Spirit_LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg','image/jpeg','BLOG-Unstoppable_Spirit_LEAD.jpg',185268,NULL,NULL,NULL,1,1392224175,1,1392850962,'377 821'),(164,1,'BLOG-Volunteerism_in_Queretaro-02.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Volunteerism_in_Queretaro-02.jpg','image/jpeg','BLOG-Volunteerism_in_Queretaro-02.jpg',168641,NULL,NULL,NULL,1,1392152162,1,1392850962,'322 1102'),(165,1,'BLOG-Volunteerism_in_Queretaro.jpg',1,'/var/www/starkey/www/uploads/images/BLOG-Volunteerism_in_Queretaro.jpg','image/jpeg','BLOG-Volunteerism_in_Queretaro.jpg',240336,NULL,NULL,NULL,1,1392151386,1,1392850963,'482 1102'),(166,1,'BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg',1,'/var/www/starkey/www/uploads/images/BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg','image/jpeg','BLOG_Giving_Back_the-World_in_Trujillo-LEAD.jpg',114256,NULL,NULL,NULL,1,1392322963,1,1392850963,'525 791'),(167,1,'BillandTani.jpg',1,'/var/www/starkey/www/uploads/images/BillandTani.jpg','image/jpeg','BillandTani.jpg',150744,NULL,NULL,NULL,1,1392148470,1,1392850963,'284 424'),(168,1,'CAROUSEL-Building_a_Better_Kibera1.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Building_a_Better_Kibera1.jpg','image/jpeg','CAROUSEL-Building_a_Better_Kibera1.jpg',775997,NULL,NULL,NULL,1,1392148360,1,1392850963,'908 1622'),(169,1,'CAROUSEL-Celebrity_Film-thumb.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Celebrity_Film-thumb.jpg','image/jpeg','CAROUSEL-Celebrity_Film-thumb.jpg',500531,NULL,NULL,NULL,1,1392143118,1,1392850963,'876 1667'),(170,1,'CAROUSEL-Operation_Change-panel.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Operation_Change-panel.jpg','image/jpeg','CAROUSEL-Operation_Change-panel.jpg',395915,NULL,NULL,NULL,1,1392148978,1,1392850964,'560 1200'),(171,1,'CAROUSEL-Operation_Change-thumb.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Operation_Change-thumb.jpg','image/jpeg','CAROUSEL-Operation_Change-thumb.jpg',119073,NULL,NULL,NULL,1,1392148948,1,1392850964,'210 400'),(172,1,'CAROUSEL-Philippines_Film.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Philippines_Film.jpg','image/jpeg','CAROUSEL-Philippines_Film.jpg',986228,NULL,NULL,NULL,1,1392147834,1,1392850964,'915 1626'),(173,1,'CAROUSEL-West_Bank_Mission-IMG_5155.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-West_Bank_Mission-IMG_5155.jpg','image/jpeg','CAROUSEL-West_Bank_Mission-IMG_5155.jpg',519314,NULL,NULL,NULL,1,1392146646,1,1392850964,'624 936'),(174,1,'DSC02337cc3Edit.jpeg',1,'/var/www/starkey/www/uploads/images/DSC02337cc3Edit.jpeg','image/jpeg','DSC02337cc3Edit.jpeg',6729305,NULL,NULL,NULL,1,1392156580,1,1392850965,'2450 3881'),(175,1,'DSC08418cc_edit.jpg',1,'/var/www/starkey/www/uploads/images/DSC08418cc_edit.jpg','image/jpeg','DSC08418cc_edit.jpg',1451770,NULL,NULL,NULL,1,1392155115,1,1392850972,'789 1401'),(176,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg',1,'/var/www/starkey/www/uploads/images/HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care-02.2.jpg',550846,NULL,NULL,NULL,1,1392137683,1,1392850973,'600 1800'),(177,1,'HERO-Hearing_Aid_Recycling.jpg',1,'/var/www/starkey/www/uploads/images/HERO-Hearing_Aid_Recycling.jpg','image/jpeg','HERO-Hearing_Aid_Recycling.jpg',256649,NULL,NULL,NULL,1,1392235274,1,1392850973,'525 1800'),(178,1,'HERO-Program-Operation_Change.png',1,'/var/www/starkey/www/uploads/images/HERO-Program-Operation_Change.png','image/png','HERO-Program-Operation_Change.png',905909,NULL,NULL,NULL,1,1392233125,1,1392850973,'525 1800'),(179,1,'LC-10-Sec-Video-01.png',1,'/var/www/starkey/www/uploads/images/LC-10-Sec-Video-01.png','image/png','LC-10-Sec-Video-01.png',517719,NULL,NULL,NULL,1,1392231681,1,1392850974,'380 1304'),(180,1,'LC-10-Sec-Video-02.png',1,'/var/www/starkey/www/uploads/images/LC-10-Sec-Video-02.png','image/png','LC-10-Sec-Video-02.png',348995,NULL,NULL,NULL,1,1392231774,1,1392850974,'383 1312'),(181,1,'MAP-Building_a_Better_Kibera.jpg',1,'/var/www/starkey/www/uploads/images/MAP-Building_a_Better_Kibera.jpg','image/jpeg','MAP-Building_a_Better_Kibera.jpg',177213,NULL,NULL,NULL,1,1392142611,1,1392850974,'378 410'),(182,1,'MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg',1,'/var/www/starkey/www/uploads/images/MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg','image/jpeg','MAP-Changing_Lives_with_Sir_Richard_Branson_and_Virgin_Unite.jpg',145645,NULL,NULL,NULL,1,1392140382,1,1392850974,'378 410'),(183,1,'MAP-Los-Angeles-Listen-Carefully.jpg',1,'/var/www/starkey/www/uploads/images/MAP-Los-Angeles-Listen-Carefully.jpg','image/jpeg','MAP-Los-Angeles-Listen-Carefully.jpg',144273,NULL,NULL,NULL,1,1392139207,1,1392850974,'378 410'),(184,1,'MAP-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/images/MAP-Peru_Mission-02-DSC07062.jpg','image/jpeg','MAP-Peru_Mission-02-DSC07062.jpg',222090,NULL,NULL,NULL,1,1392140188,1,1392850974,'378 410'),(185,1,'MAP-Providing_Clean_Water_in_Tanzania.jpg',1,'/var/www/starkey/www/uploads/images/MAP-Providing_Clean_Water_in_Tanzania.jpg','image/jpeg','MAP-Providing_Clean_Water_in_Tanzania.jpg',163339,NULL,NULL,NULL,1,1392141018,1,1392850974,'378 410'),(186,1,'MAP-Vikings_Mission-IMG_6064.JPG',1,'/var/www/starkey/www/uploads/images/MAP-Vikings_Mission-IMG_6064.JPG','image/jpeg','MAP-Vikings_Mission-IMG_6064.JPG',161384,NULL,NULL,NULL,1,1392139634,1,1392850974,'378 410'),(187,1,'MAP-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/images/MAP-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','MAP-Where_We_Are_Now-India-DSC03269cc.jpg',199133,NULL,NULL,NULL,1,1392140852,1,1392850974,'378 410'),(188,1,'MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png',1,'/var/www/starkey/www/uploads/images/MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png','image/png','MEDIA-01.27.14_CBS_MNLocal_TwinsBlog.png',682635,NULL,NULL,NULL,1,1392330311,1,1392850974,'525 939'),(189,1,'MEDIA-08.02_.14_CGI_Blog_.png',1,'/var/www/starkey/www/uploads/images/MEDIA-08.02_.14_CGI_Blog_.png','image/png','MEDIA-08.02_.14_CGI_Blog_.png',783141,NULL,NULL,NULL,1,1392401283,1,1392850974,'525 1216'),(190,1,'MEDIA-WCCO-LOGO.png',1,'/var/www/starkey/www/uploads/images/MEDIA-WCCO-LOGO.png','image/png','MEDIA-WCCO-LOGO.png',19411,NULL,NULL,NULL,1,1392331329,1,1392850978,'100 103'),(191,1,'Operation-Change-Donna-Karan-Film.jpg',1,'/var/www/starkey/www/uploads/images/Operation-Change-Donna-Karan-Film.jpg','image/jpeg','Operation-Change-Donna-Karan-Film.jpg',293950,NULL,NULL,NULL,1,1392234023,1,1392850978,'354 638'),(192,1,'Operation-Change-Ray-Lewis-Film.jpg',1,'/var/www/starkey/www/uploads/images/Operation-Change-Ray-Lewis-Film.jpg','image/jpeg','Operation-Change-Ray-Lewis-Film.jpg',213322,NULL,NULL,NULL,1,1392233633,1,1392850981,'353 639'),(193,1,'Screen_Shot_2014-02-12_at_8.59.27_PM.png',1,'/var/www/starkey/www/uploads/images/Screen_Shot_2014-02-12_at_8.59.27_PM.png','image/png','Screen_Shot_2014-02-12_at_8.59.27_PM.png',4440,NULL,NULL,NULL,1,1392335392,1,1392850982,'31 64'),(194,1,'Unstoppable_Spirit_LEAD.jpg',1,'/var/www/starkey/www/uploads/images/Unstoppable_Spirit_LEAD.jpg','image/jpeg','Unstoppable_Spirit_LEAD.jpg',91286,NULL,NULL,NULL,1,1392222175,1,1392850984,'525 821'),(195,1,'_DSC0608cc.jpg',1,'/var/www/starkey/www/uploads/images/_DSC0608cc.jpg','image/jpeg','_DSC0608cc.jpg',3682156,NULL,NULL,NULL,1,1391215984,1,1392850984,'3083 4635'),(196,1,'info_livesimpacted.jpg',1,'/var/www/starkey/www/uploads/images/info_livesimpacted.jpg','image/jpeg','info_livesimpacted.jpg',421952,NULL,NULL,NULL,1,1390202277,1,1392850985,'198 252'),(197,1,'info_livesindirectly.jpg',1,'/var/www/starkey/www/uploads/images/info_livesindirectly.jpg','image/jpeg','info_livesindirectly.jpg',419655,NULL,NULL,NULL,1,1390202291,1,1392850985,'198 252'),(198,1,'info_totalaids.jpg',1,'/var/www/starkey/www/uploads/images/info_totalaids.jpg','image/jpeg','info_totalaids.jpg',429587,NULL,NULL,NULL,1,1390202303,1,1392850985,'198 252'),(199,1,'test_upload.png',1,'/var/www/starkey/www/uploads/images/test_upload.png','image/png','test_upload.png',4440,NULL,NULL,NULL,1,1392260206,1,1392850986,'31 64'),(220,1,'Rwanda_Day_Two_212.jpg',1,'/var/www/starkey/www/uploads/images/Rwanda_Day_Two_212.jpg','image/jpeg','Rwanda_Day_Two_212.jpg',2481672,NULL,NULL,NULL,1,1392681545,1,1392850982,'2808 1872'),(221,1,'building_a_better_kibera.jpg',1,'/var/www/starkey/www/uploads/images/building_a_better_kibera.jpg','image/jpeg','building_a_better_kibera.jpg',775997,NULL,NULL,NULL,1,1392515437,1,1392850984,'908 1622'),(222,1,'peru_mission_02.jpg',1,'/var/www/starkey/www/uploads/images/peru_mission_02.jpg','image/jpeg','peru_mission_02.jpg',582876,NULL,NULL,NULL,1,1392515436,1,1392850986,'639 936'),(223,1,'west_bank_mission.jpg',1,'/var/www/starkey/www/uploads/images/west_bank_mission.jpg','image/jpeg','west_bank_mission.jpg',713742,NULL,NULL,NULL,1,1392515437,1,1392850986,'895 1591'),(224,1,'CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg','image/jpeg','CAROUSEL-2013_STWMH_Awards_Gala_Highlights.jpg',600107,NULL,NULL,NULL,1,1392849929,1,1392850963,'947 1679'),(225,1,'HERO-Vikings_Mission-IMG_6312.jpg',1,'/var/www/starkey/www/uploads/images/HERO-Vikings_Mission-IMG_6312.jpg','image/jpeg','HERO-Vikings_Mission-IMG_6312.jpg',416511,NULL,NULL,NULL,1,1392849943,1,1392850974,'496 936'),(226,1,'HERO-Commitment_to_Action_Film.jpg',1,'/var/www/starkey/www/uploads/images/HERO-Commitment_to_Action_Film.jpg','image/jpeg','HERO-Commitment_to_Action_Film.jpg',776026,NULL,NULL,NULL,1,1392850072,1,1392850973,'863 1537'),(227,1,'ABC_tani_austin_sr_140121_16x9_608.jpg',1,'/var/www/starkey/www/uploads/images/ABC_tani_austin_sr_140121_16x9_608.jpg','image/jpeg','ABC_tani_austin_sr_140121_16x9_608.jpg',37016,NULL,NULL,NULL,1,1392850766,1,1392850766,'342 608'),(228,1,'Blog_A_Knight.jpg',1,'/var/www/starkey/www/uploads/images/Blog_A_Knight.jpg','image/jpeg','Blog_A_Knight.jpg',489262,NULL,NULL,NULL,1,1392850767,1,1392850767,'1571 1992'),(229,1,'Blog_Philippines_.jpg',1,'/var/www/starkey/www/uploads/images/Blog_Philippines_.jpg','image/jpeg','Blog_Philippines_.jpg',109435,NULL,NULL,NULL,1,1392850767,1,1392850767,'705 1024'),(230,1,'CAROUSEL-Building_a_Better_Kibera.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Building_a_Better_Kibera.jpg','image/jpeg','CAROUSEL-Building_a_Better_Kibera.jpg',775997,NULL,NULL,NULL,1,1392850769,1,1392850769,'908 1622'),(231,1,'CAROUSEL-Celebrity_Film.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Celebrity_Film.jpg','image/jpeg','CAROUSEL-Celebrity_Film.jpg',475188,NULL,NULL,NULL,1,1392850770,1,1392850770,'932 1667'),(232,1,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','image/jpeg','CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',670533,NULL,NULL,NULL,1,1392850771,1,1392850771,'943 1676'),(233,1,'CAROUSEL-Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Listen_Carefully.jpg','image/jpeg','CAROUSEL-Listen_Carefully.jpg',365842,NULL,NULL,NULL,1,1392850772,1,1392850772,'833 1484'),(234,1,'CAROUSEL-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Peru_Mission-02-DSC07062.jpg','image/jpeg','CAROUSEL-Peru_Mission-02-DSC07062.jpg',582876,NULL,NULL,NULL,1,1392850773,1,1392850773,'639 936'),(235,1,'CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg','image/jpeg','CAROUSEL-Providing_Clean_Water_in_Tanzania.jpg',717315,NULL,NULL,NULL,1,1392850775,1,1392850775,'943 1680'),(236,1,'CAROUSEL-Tony_Hawk_Event.JPG',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Tony_Hawk_Event.JPG','image/jpeg','CAROUSEL-Tony_Hawk_Event.JPG',131762,NULL,NULL,NULL,1,1392850775,1,1392850775,'480 640'),(237,1,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',497551,NULL,NULL,NULL,1,1392850776,1,1392850776,'520 936'),(238,1,'CAROUSEL-William_F._Austin_Legacy_Film.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-William_F._Austin_Legacy_Film.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film.jpg',472027,NULL,NULL,NULL,1,1392850779,1,1392850779,'909 1614'),(239,1,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-William_F._Austin_Legacy_Film_.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_.jpg',472027,NULL,NULL,NULL,1,1392850777,1,1392850777,'909 1614'),(240,1,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',1,'/var/www/starkey/www/uploads/images/CAROUSEL-William_F._Austin_Legacy_Film_1.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',472027,NULL,NULL,NULL,1,1392850778,1,1392850778,'909 1614'),(241,1,'CBSStarkey.jpg',1,'/var/www/starkey/www/uploads/images/CBSStarkey.jpg','image/jpeg','CBSStarkey.jpg',28198,NULL,NULL,NULL,1,1392850779,1,1392850779,'349 620'),(242,1,'COVER_pianoboy_cc.jpg',1,'/var/www/starkey/www/uploads/images/COVER_pianoboy_cc.jpg','image/jpeg','COVER_pianoboy_cc.jpg',8653595,NULL,NULL,NULL,1,1392850796,1,1392850796,'3283 5410'),(243,1,'Clinton_Foundation_Logo.png',1,'/var/www/starkey/www/uploads/images/Clinton_Foundation_Logo.png','image/png','Clinton_Foundation_Logo.png',38239,NULL,NULL,NULL,1,1392850780,1,1392850780,'200 200'),(244,1,'Dave_Fabry.jpg',1,'/var/www/starkey/www/uploads/images/Dave_Fabry.jpg','image/jpeg','Dave_Fabry.jpg',5586958,NULL,NULL,NULL,1,1392850807,1,1392850807,'3744 5616'),(245,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',1,'/var/www/starkey/www/uploads/images/HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',593033,NULL,NULL,NULL,1,1392850810,1,1392850810,'901 1604'),(246,1,'PeaceinWestBank.jpg',1,'/var/www/starkey/www/uploads/images/PeaceinWestBank.jpg','image/jpeg','PeaceinWestBank.jpg',121579,NULL,NULL,NULL,1,1392850823,1,1392850823,'680 1024'),(247,1,'PoweringInspiration_.jpg',1,'/var/www/starkey/www/uploads/images/PoweringInspiration_.jpg','image/jpeg','PoweringInspiration_.jpg',95741,NULL,NULL,NULL,1,1392850823,1,1392850823,'747 1024'),(248,1,'Screen_Shot_2014-01-31_at_12.29.23_PM.png',1,'/var/www/starkey/www/uploads/images/Screen_Shot_2014-01-31_at_12.29.23_PM.png','image/png','Screen_Shot_2014-01-31_at_12.29.23_PM.png',959228,NULL,NULL,NULL,1,1392850825,1,1392850825,'474 1440'),(249,1,'September_Newsletter.jpg',1,'/var/www/starkey/www/uploads/images/September_Newsletter.jpg','image/jpeg','September_Newsletter.jpg',111920,NULL,NULL,NULL,1,1392850825,1,1392850825,'680 1024'),(250,1,'TaniAustin.jpg',1,'/var/www/starkey/www/uploads/images/TaniAustin.jpg','image/jpeg','TaniAustin.jpg',69288,NULL,NULL,NULL,1,1392850826,1,1392850826,'914 1920'),(251,1,'billaustin.jpg',1,'/var/www/starkey/www/uploads/images/billaustin.jpg','image/jpeg','billaustin.jpg',32330,NULL,NULL,NULL,1,1392850766,1,1392850766,'342 500'),(252,1,'cbslogo.png',1,'/var/www/starkey/www/uploads/images/cbslogo.png','image/png','cbslogo.png',3936,NULL,NULL,NULL,1,1392850779,1,1392850779,'300 300'),(253,1,'cnnlogo.png',1,'/var/www/starkey/www/uploads/images/cnnlogo.png','image/png','cnnlogo.png',20978,NULL,NULL,NULL,1,1392850780,1,1392850780,'225 300'),(254,1,'hearingaidrecycling.jpg',1,'/var/www/starkey/www/uploads/images/hearingaidrecycling.jpg','image/jpeg','hearingaidrecycling.jpg',257452,NULL,NULL,NULL,1,1392850808,1,1392850808,'525 1600'),(255,1,'hearnow1.jpg',1,'/var/www/starkey/www/uploads/images/hearnow1.jpg','image/jpeg','hearnow1.jpg',340205,NULL,NULL,NULL,1,1392850809,1,1392850809,'525 1600'),(256,1,'icon_gallery.png',1,'/var/www/starkey/www/uploads/images/icon_gallery.png','image/png','icon_gallery.png',2979,NULL,NULL,NULL,1,1392850815,1,1392850815,'56 56'),(257,1,'icon_now.png',1,'/var/www/starkey/www/uploads/images/icon_now.png','image/png','icon_now.png',3571,NULL,NULL,NULL,1,1392850815,1,1392850815,'56 56'),(258,1,'icon_program.png',1,'/var/www/starkey/www/uploads/images/icon_program.png','image/png','icon_program.png',3594,NULL,NULL,NULL,1,1392850815,1,1392850815,'56 56'),(259,1,'icon_stories.png',1,'/var/www/starkey/www/uploads/images/icon_stories.png','image/png','icon_stories.png',3049,NULL,NULL,NULL,1,1392850815,1,1392850815,'56 56'),(260,1,'icon_video.png',1,'/var/www/starkey/www/uploads/images/icon_video.png','image/png','icon_video.png',2965,NULL,NULL,NULL,1,1392850815,1,1392850815,'56 56'),(261,1,'listencarefully.jpg',1,'/var/www/starkey/www/uploads/images/listencarefully.jpg','image/jpeg','listencarefully.jpg',405535,NULL,NULL,NULL,1,1392850816,1,1392850816,'525 1600'),(262,1,'listencarefully2.jpg',1,'/var/www/starkey/www/uploads/images/listencarefully2.jpg','image/jpeg','listencarefully2.jpg',598081,NULL,NULL,NULL,1,1392850817,1,1392850817,'525 1600'),(263,1,'listencarefully3.jpg',1,'/var/www/starkey/www/uploads/images/listencarefully3.jpg','image/jpeg','listencarefully3.jpg',631088,NULL,NULL,NULL,1,1392850818,1,1392850818,'525 1600'),(264,1,'listencarefullygallery2.png',1,'/var/www/starkey/www/uploads/images/listencarefullygallery2.png','image/png','listencarefullygallery2.png',1155905,NULL,NULL,NULL,1,1392850821,1,1392850821,'476 1440'),(265,1,'marleemartin.jpeg',1,'/var/www/starkey/www/uploads/images/marleemartin.jpeg','image/jpeg','marleemartin.jpeg',24875,NULL,NULL,NULL,1,1392850821,1,1392850821,'327 320'),(266,1,'operationchange.jpg',1,'/var/www/starkey/www/uploads/images/operationchange.jpg','image/jpeg','operationchange.jpg',504147,NULL,NULL,NULL,1,1392850822,1,1392850822,'525 1600'),(267,1,'special_olympics_mission.jpg',1,'/var/www/starkey/www/uploads/images/special_olympics_mission.jpg','image/jpeg','special_olympics_mission.jpg',20900,NULL,NULL,NULL,1,1392850825,1,1392850825,'220 330'),(268,1,'westbank2.jpeg',1,'/var/www/starkey/www/uploads/images/westbank2.jpeg','image/jpeg','westbank2.jpeg',110247,NULL,NULL,NULL,1,1392850826,1,1392850826,'480 640');
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
INSERT INTO `exp_freeform_params` VALUES (73,1392860340,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}');
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
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_grid_columns`
--

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;
INSERT INTO `exp_grid_columns` VALUES (1,4,'channel',0,'file','slot_1','slot_1','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(2,4,'channel',1,'file','slot_2','slot_2','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(3,4,'channel',2,'file','slot_3','slot_3','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(4,60,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(5,60,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(6,60,'channel',4,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(7,60,'channel',3,'text','Call to Action','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(8,61,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(9,61,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(10,61,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(11,61,'channel',4,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(12,61,'channel',3,'text','Call to Action','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(13,60,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(14,62,'channel',0,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(15,62,'channel',1,'text','Video','video','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(16,80,'channel',0,'text','Name','name','','n','n',50,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(17,80,'channel',1,'hundies_region_select','Selected Map Region','abbreviation','','n','n',25,'{\"group_id\":\"12\",\"field_id\":\"80\",\"site_id\":\"1\",\"field_type\":\"grid\",\"field_label\":\"Countries Visited\",\"field_name\":\"countries_visited\",\"field_instructions\":\"\",\"field_required\":\"n\",\"field_search\":\"n\",\"field_is_hidden\":\"n\",\"field_order\":\"2\",\"select_field_fmt\":\"xhtml\",\"select_field_show_fmt\":\"n\",\"select_field_list_items\":\"\",\"select_field_pre_populate_id\":\"5_25\",\"field_maxl\":\"128\",\"text_field_fmt\":\"xhtml\",\"text_field_show_fmt\":\"n\",\"text_field_text_direction\":\"ltr\",\"text_field_content_type\":\"all\",\"text_field_show_smileys\":\"n\",\"text_field_show_glossary\":\"n\",\"text_field_show_spellcheck\":\"n\",\"text_field_show_file_selector\":\"n\",\"field_ta_rows\":\"6\",\"textarea_field_fmt\":\"xhtml\",\"textarea_field_show_fmt\":\"n\",\"textarea_field_text_direction\":\"ltr\",\"textarea_field_show_formatting_btns\":\"n\",\"textarea_field_show_smileys\":\"n\",\"textarea_field_show_glossary\":\"n\",\"textarea_field_show_spellcheck\":\"n\",\"textarea_field_show_writemode\":\"n\",\"textarea_field_show_file_selector\":\"n\",\"file_field_content_type\":\"all\",\"file_allowed_directories\":\"all\",\"grid_min_rows\":\"0\",\"grid_max_rows\":\"\",\"grid\":{\"cols\":{\"col_id_16\":{\"col_type\":\"text\",\"col_label\":\"Name\",\"col_name\":\"name\",\"col_instructions\":\"\",\"col_width\":\"50\",\"col_settings\":{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\"}},\"col_id_17\":{\"col_type\":\"hundies_region_select\",\"col_label\":\"Selected Map Region\",\"col_name\":\"abbreviation\",\"col_instructions\":\"\",\"col_width\":\"25\",\"col_settings\":{\"field_fmt\":\"none\"}},\"col_id_18\":{\"col_type\":\"text\",\"col_label\":\"Total Hearing Aids Provided\",\"col_name\":\"hearing_aids\",\"col_instructions\":\"\",\"col_width\":\"25\",\"col_settings\":{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\"}}}},\"grid_html\":\"<div id=\\\"grid_settings_container\\\">\\n\\t<div id=\\\"grid_settings\\\">\\n\\t\\t<div id=\\\"grid_col_settings_labels\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label grid_data_type\\\">Data Type?<\\/label>\\t\\t\\t<label class=\\\"grid_col_setting_label\\\">Publish Label<\\/label>\\t\\t\\t<label class=\\\"grid_col_setting_label\\\">Field Name<\\/label>\\t\\t\\t<label class=\\\"grid_col_setting_label\\\">Instructions<\\/label>\\t\\t\\t<label class=\\\"grid_col_setting_label grid_data_search\\\">Is this data...<\\/label>\\t\\t\\t<label class=\\\"grid_col_setting_label\\\">Column Width<\\/label>\\t\\t<\\/div>\\n\\n\\t\\t<div id=\\\"grid_col_settings_container\\\" style=\\\"width: 1072px;\\\">\\n\\n\\t\\t\\t<div id=\\\"grid_col_settings_container_inner\\\" class=\\\"group ui-sortable\\\" style=\\\"width: 1032px;\\\">\\n\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings\\\" data-field-name=\\\"col_id_16\\\" style=\\\"\\\">\\n\\t<div class=\\\"grid_col_settings_section grid_data_type alt\\\">\\n\\t\\t<select name=\\\"grid[cols][col_id_16][col_type]\\\" class=\\\"grid_col_select\\\">\\n<option value=\\\"checkboxes\\\">Checkboxes<\\/option>\\n<option value=\\\"date\\\">Date<\\/option>\\n<option value=\\\"file\\\">File<\\/option>\\n<option value=\\\"multi_select\\\">Multi Select<\\/option>\\n<option value=\\\"radio\\\">Radio Buttons<\\/option>\\n<option value=\\\"relationship\\\">Relationships<\\/option>\\n<option value=\\\"select\\\">Select Dropdown<\\/option>\\n<option value=\\\"text\\\" selected=\\\"selected\\\">Text Input<\\/option>\\n<option value=\\\"textarea\\\">Textarea<\\/option>\\n<option value=\\\"rte\\\">Textarea (Rich Text)<\\/option>\\n<option value=\\\"assets\\\">Assets<\\/option>\\n<option value=\\\"hundies_region_select\\\">Hundies Region Select<\\/option>\\n<\\/select>\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_button_delete\\\" title=\\\"Delete Column\\\" style=\\\"display: inline;\\\">Delete Column<\\/a>\\n\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_16][col_label]\\\" value=\\\"Name\\\" class=\\\"grid_col_field_label\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text alt\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_16][col_name]\\\" value=\\\"name\\\" class=\\\"grid_col_field_name\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_16][col_instructions]\\\" value=\\\"\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_data_search alt\\\">\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][col_id_16][col_required]\\\" value=\\\"column_required\\\">Required?<\\/label>\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][col_id_16][col_search]\\\" value=\\\"column_searchable\\\">Searchable?<\\/label>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_width\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_16][col_width]\\\" value=\\\"50\\\" class=\\\"grid_input_text_small\\\" maxlength=\\\"3\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Percentage.<\\/i>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_custom\\\" data-field-name=\\\"col_id_16\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_text\\\" data-fieldtype=\\\"text\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][col_id_16][col_settings][field_fmt]\\\" class=\\\"select\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Field Content<\\/label><select name=\\\"grid[cols][col_id_16][col_settings][field_content_type]\\\" class=\\\"select\\\">\\n<option value=\\\"all\\\" selected=\\\"selected\\\">All<\\/option>\\n<option value=\\\"numeric\\\">Number<\\/option>\\n<option value=\\\"integer\\\">Integer<\\/option>\\n<option value=\\\"decimal\\\">Decimal<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Text direction?<\\/label><select name=\\\"grid[cols][col_id_16][col_settings][field_text_direction]\\\" class=\\\"select\\\">\\n<option value=\\\"ltr\\\" selected=\\\"selected\\\">Left to Right<\\/option>\\n<option value=\\\"rtl\\\">Right to Left<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label>Limit input?<\\/label>&nbsp;&nbsp;&nbsp;<input type=\\\"text\\\" name=\\\"grid[cols][col_id_16][col_settings][field_maxl]\\\" value=\\\"256\\\" class=\\\"grid_input_text_small\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Characters allowed.<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_copy\\\">\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_col_copy\\\">Copy<\\/a>\\n\\t<\\/div>\\n<\\/div>\\t\\t\\t\\t\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings\\\" data-field-name=\\\"col_id_17\\\" style=\\\"\\\">\\n\\t<div class=\\\"grid_col_settings_section grid_data_type alt\\\">\\n\\t\\t<select name=\\\"grid[cols][col_id_17][col_type]\\\" class=\\\"grid_col_select\\\">\\n<option value=\\\"checkboxes\\\">Checkboxes<\\/option>\\n<option value=\\\"date\\\">Date<\\/option>\\n<option value=\\\"file\\\">File<\\/option>\\n<option value=\\\"multi_select\\\">Multi Select<\\/option>\\n<option value=\\\"radio\\\">Radio Buttons<\\/option>\\n<option value=\\\"relationship\\\">Relationships<\\/option>\\n<option value=\\\"select\\\">Select Dropdown<\\/option>\\n<option value=\\\"text\\\">Text Input<\\/option>\\n<option value=\\\"textarea\\\">Textarea<\\/option>\\n<option value=\\\"rte\\\">Textarea (Rich Text)<\\/option>\\n<option value=\\\"assets\\\">Assets<\\/option>\\n<option value=\\\"hundies_region_select\\\" selected=\\\"selected\\\">Hundies Region Select<\\/option>\\n<\\/select>\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_button_delete\\\" title=\\\"Delete Column\\\" style=\\\"display: inline;\\\">Delete Column<\\/a>\\n\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_17][col_label]\\\" value=\\\"Selected Map Region\\\" class=\\\"grid_col_field_label\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text alt\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_17][col_name]\\\" value=\\\"abbreviation\\\" class=\\\"grid_col_field_name\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_17][col_instructions]\\\" value=\\\"\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_data_search alt\\\">\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][col_id_17][col_required]\\\" value=\\\"column_required\\\">Required?<\\/label>\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][col_id_17][col_search]\\\" value=\\\"column_searchable\\\">Searchable?<\\/label>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_width\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_17][col_width]\\\" value=\\\"25\\\" class=\\\"grid_input_text_small\\\" maxlength=\\\"3\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Percentage.<\\/i>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_custom\\\" data-field-name=\\\"col_id_17\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_hundies_region_select\\\" data-fieldtype=\\\"hundies_region_select\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][col_id_17][col_settings][field_fmt]\\\" class=\\\"select\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_copy\\\">\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_col_copy\\\">Copy<\\/a>\\n\\t<\\/div>\\n<\\/div>\\t\\t\\t\\t\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings\\\" data-field-name=\\\"col_id_18\\\" style=\\\"\\\">\\n\\t<div class=\\\"grid_col_settings_section grid_data_type alt\\\">\\n\\t\\t<select name=\\\"grid[cols][col_id_18][col_type]\\\" class=\\\"grid_col_select\\\">\\n<option value=\\\"checkboxes\\\">Checkboxes<\\/option>\\n<option value=\\\"date\\\">Date<\\/option>\\n<option value=\\\"file\\\">File<\\/option>\\n<option value=\\\"multi_select\\\">Multi Select<\\/option>\\n<option value=\\\"radio\\\">Radio Buttons<\\/option>\\n<option value=\\\"relationship\\\">Relationships<\\/option>\\n<option value=\\\"select\\\">Select Dropdown<\\/option>\\n<option value=\\\"text\\\" selected=\\\"selected\\\">Text Input<\\/option>\\n<option value=\\\"textarea\\\">Textarea<\\/option>\\n<option value=\\\"rte\\\">Textarea (Rich Text)<\\/option>\\n<option value=\\\"assets\\\">Assets<\\/option>\\n<option value=\\\"hundies_region_select\\\">Hundies Region Select<\\/option>\\n<\\/select>\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_button_delete\\\" title=\\\"Delete Column\\\" style=\\\"display: inline;\\\">Delete Column<\\/a>\\n\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_18][col_label]\\\" value=\\\"Total Hearing Aids Provided\\\" class=\\\"grid_col_field_label\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text alt\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_18][col_name]\\\" value=\\\"hearing_aids\\\" class=\\\"grid_col_field_name\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_18][col_instructions]\\\" value=\\\"\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_data_search alt\\\">\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][col_id_18][col_required]\\\" value=\\\"column_required\\\">Required?<\\/label>\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][col_id_18][col_search]\\\" value=\\\"column_searchable\\\">Searchable?<\\/label>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_width\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][col_id_18][col_width]\\\" value=\\\"25\\\" class=\\\"grid_input_text_small\\\" maxlength=\\\"3\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Percentage.<\\/i>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_custom\\\" data-field-name=\\\"col_id_18\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_text\\\" data-fieldtype=\\\"text\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][col_id_18][col_settings][field_fmt]\\\" class=\\\"select\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Field Content<\\/label><select name=\\\"grid[cols][col_id_18][col_settings][field_content_type]\\\" class=\\\"select\\\">\\n<option value=\\\"all\\\" selected=\\\"selected\\\">All<\\/option>\\n<option value=\\\"numeric\\\">Number<\\/option>\\n<option value=\\\"integer\\\">Integer<\\/option>\\n<option value=\\\"decimal\\\">Decimal<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Text direction?<\\/label><select name=\\\"grid[cols][col_id_18][col_settings][field_text_direction]\\\" class=\\\"select\\\">\\n<option value=\\\"ltr\\\" selected=\\\"selected\\\">Left to Right<\\/option>\\n<option value=\\\"rtl\\\">Right to Left<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label>Limit input?<\\/label>&nbsp;&nbsp;&nbsp;<input type=\\\"text\\\" name=\\\"grid[cols][col_id_18][col_settings][field_maxl]\\\" value=\\\"256\\\" class=\\\"grid_input_text_small\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Characters allowed.<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_copy\\\">\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_col_copy\\\">Copy<\\/a>\\n\\t<\\/div>\\n<\\/div>\\t\\t\\t\\t\\n\\t\\t\\t\\t<a class=\\\"grid_button_add\\\" href=\\\"#\\\" title=\\\"Add Column\\\">Add Column<\\/a>\\n\\n\\t\\t\\t<\\/div>\\n\\t\\t<\\/div>\\n\\t<\\/div>\\n\\n\\t<div id=\\\"grid_col_settings_elements\\\">\\n\\t\\t<div class=\\\"grid_col_settings\\\" data-field-name=\\\"new_0\\\">\\n\\t<div class=\\\"grid_col_settings_section grid_data_type alt\\\">\\n\\t\\t<select name=\\\"grid[cols][new_0][col_type]\\\" class=\\\"grid_col_select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"checkboxes\\\">Checkboxes<\\/option>\\n<option value=\\\"date\\\">Date<\\/option>\\n<option value=\\\"file\\\">File<\\/option>\\n<option value=\\\"multi_select\\\">Multi Select<\\/option>\\n<option value=\\\"radio\\\">Radio Buttons<\\/option>\\n<option value=\\\"relationship\\\">Relationships<\\/option>\\n<option value=\\\"select\\\">Select Dropdown<\\/option>\\n<option value=\\\"text\\\" selected=\\\"selected\\\">Text Input<\\/option>\\n<option value=\\\"textarea\\\">Textarea<\\/option>\\n<option value=\\\"rte\\\">Textarea (Rich Text)<\\/option>\\n<option value=\\\"assets\\\">Assets<\\/option>\\n<option value=\\\"hundies_region_select\\\">Hundies Region Select<\\/option>\\n<\\/select>\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_button_delete\\\" title=\\\"Delete Column\\\">Delete Column<\\/a>\\n\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_label]\\\" value=\\\"\\\" class=\\\"grid_col_field_label\\\" disabled=\\\"disabled\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text alt\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_name]\\\" value=\\\"\\\" class=\\\"grid_col_field_name\\\" disabled=\\\"disabled\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section text\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_instructions]\\\" value=\\\"\\\" disabled=\\\"disabled\\\">\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_data_search alt\\\">\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_required]\\\" value=\\\"column_required\\\" disabled=\\\"disabled\\\">Required?<\\/label>\\n\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_search]\\\" value=\\\"column_searchable\\\" disabled=\\\"disabled\\\">Searchable?<\\/label>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_width\\\">\\n\\t\\t<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_width]\\\" value=\\\"\\\" class=\\\"grid_input_text_small\\\" maxlength=\\\"3\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Percentage.<\\/i>\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_custom\\\" data-field-name=\\\"new_0\\\">\\n\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_text\\\" data-fieldtype=\\\"text\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Field Content<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_content_type]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"all\\\">All<\\/option>\\n<option value=\\\"numeric\\\">Number<\\/option>\\n<option value=\\\"integer\\\">Integer<\\/option>\\n<option value=\\\"decimal\\\">Decimal<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Text direction?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_text_direction]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"ltr\\\">Left to Right<\\/option>\\n<option value=\\\"rtl\\\">Right to Left<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label>Limit input?<\\/label>&nbsp;&nbsp;&nbsp;<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_settings][field_maxl]\\\" value=\\\"256\\\" class=\\\"grid_input_text_small\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Characters allowed.<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t<\\/div>\\n\\t<div class=\\\"grid_col_settings_section grid_col_copy\\\">\\n\\t\\t<a href=\\\"#\\\" class=\\\"grid_col_copy\\\">Copy<\\/a>\\n\\t<\\/div>\\n<\\/div>\\n\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_checkboxes\\\" data-fieldtype=\\\"checkboxes\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<textarea name=\\\"grid[cols][new_0][col_settings][field_list_items]\\\" cols=\\\"24\\\" rows=\\\"10\\\" class=\\\"right\\\" disabled=\\\"disabled\\\"><\\/textarea><label>Multi-Select Options<\\/label><br><i class=\\\"instruction_text\\\">Put each item on a single line<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_date\\\" data-fieldtype=\\\"date\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][localize]\\\" value=\\\"localize\\\" checked=\\\"checked\\\" disabled=\\\"disabled\\\">Localized?<\\/label>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_file\\\" data-fieldtype=\\\"file\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Allowed file type<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_content_type]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"all\\\" selected=\\\"selected\\\">All<\\/option>\\n<option value=\\\"image\\\">Image<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Allowed directory<\\/label><select name=\\\"grid[cols][new_0][col_settings][allowed_directories]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"all\\\" selected=\\\"selected\\\">All<\\/option>\\n<option value=\\\"2\\\">File Uploads<\\/option>\\n<option value=\\\"1\\\">Image Uploads<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<div class=\\\"grid_padding\\\"><strong>Frontend Options<\\/strong><br><i class=\\\"instruction_text\\\">Change the behavior of the field when used in a {channel:form} tag.<\\/i><\\/div>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][show_existing]\\\" value=\\\"y\\\" checked=\\\"checked\\\" disabled=\\\"disabled\\\">Show existing files?<\\/label>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label>Limit existing files to<\\/label>&nbsp;&nbsp;&nbsp;<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_settings][num_existing]\\\" value=\\\"50\\\" class=\\\"grid_input_text_small\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;&nbsp;<strong>returned<\\/strong>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_multi_select\\\" data-fieldtype=\\\"multi_select\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<textarea name=\\\"grid[cols][new_0][col_settings][field_list_items]\\\" cols=\\\"24\\\" rows=\\\"10\\\" class=\\\"right\\\" disabled=\\\"disabled\\\"><\\/textarea><label>Multi-Select Options<\\/label><br><i class=\\\"instruction_text\\\">Put each item on a single line<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_radio\\\" data-fieldtype=\\\"radio\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<textarea name=\\\"grid[cols][new_0][col_settings][field_list_items]\\\" cols=\\\"24\\\" rows=\\\"10\\\" class=\\\"right\\\" disabled=\\\"disabled\\\"><\\/textarea><label>Multi-Select Options<\\/label><br><i class=\\\"instruction_text\\\">Put each item on a single line<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_relationship\\\" data-fieldtype=\\\"relationship\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][expired]\\\" value=\\\"1\\\" disabled=\\\"disabled\\\">Expired entries?<\\/label>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][future]\\\" value=\\\"1\\\" disabled=\\\"disabled\\\">Future entries?<\\/label>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_small_width\\\">Channels<\\/label><select name=\\\"grid[cols][new_0][col_settings][channels][]\\\" style=\\\"height: 140px\\\" class=\\\"grid_settings_multiselect grid_select_wide\\\" multiple=\\\"\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"--\\\">-- Any --<\\/option>\\n<option value=\\\"5\\\">Blog<\\/option>\\n<option value=\\\"12\\\">Gallery<\\/option>\\n<option value=\\\"16\\\">Hearing Mission<\\/option>\\n<option value=\\\"15\\\">Hearing Mission Landing Page<\\/option>\\n<option value=\\\"7\\\">Homepage Bottom Carousel<\\/option>\\n<option value=\\\"1\\\">Homepage Hero Slider <\\/option>\\n<option value=\\\"6\\\">Homepage Map Categories<\\/option>\\n<option value=\\\"3\\\">Homepage Map Items<\\/option>\\n<option value=\\\"2\\\">Homepage Mission and Pictograms <\\/option>\\n<option value=\\\"9\\\">Listen Carefully<\\/option>\\n<option value=\\\"11\\\">Media Mentions<\\/option>\\n<option value=\\\"4\\\">Media Mentions Carousel<\\/option>\\n<option value=\\\"14\\\">Mission Markers<\\/option>\\n<option value=\\\"8\\\">Operation Change Carousel<\\/option>\\n<option value=\\\"13\\\">Press Releases<\\/option>\\n<option value=\\\"10\\\">Programs<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_small_width\\\">Categories<\\/label><select name=\\\"grid[cols][new_0][col_settings][categories][]\\\" style=\\\"height: 140px\\\" class=\\\"grid_settings_multiselect grid_select_wide\\\" multiple=\\\"\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"--\\\">-- Any --<\\/option>\\n<option value=\\\"3\\\">Africa<\\/option>\\n<option value=\\\"8\\\">&nbsp;&nbsp;&nbsp;&nbsp;Ethiopia<\\/option>\\n<option value=\\\"9\\\">&nbsp;&nbsp;&nbsp;&nbsp;Malawi<\\/option>\\n<option value=\\\"10\\\">&nbsp;&nbsp;&nbsp;&nbsp;Nigeria<\\/option>\\n<option value=\\\"11\\\">&nbsp;&nbsp;&nbsp;&nbsp;South Africa<\\/option>\\n<option value=\\\"12\\\">ASIA<\\/option>\\n<option value=\\\"13\\\">&nbsp;&nbsp;&nbsp;&nbsp;Philippines<\\/option>\\n<option value=\\\"14\\\">&nbsp;&nbsp;&nbsp;&nbsp;Vietnam<\\/option>\\n<option value=\\\"19\\\">AUSTRALIA<\\/option>\\n<option value=\\\"2\\\">Central America &amp; Caribbean<\\/option>\\n<option value=\\\"7\\\">&nbsp;&nbsp;&nbsp;&nbsp;Panama<\\/option>\\n<option value=\\\"17\\\">EUROPE<\\/option>\\n<option value=\\\"18\\\">&nbsp;&nbsp;&nbsp;&nbsp;Germany<\\/option>\\n<option value=\\\"15\\\">SOUTH AMERICA<\\/option>\\n<option value=\\\"16\\\">&nbsp;&nbsp;&nbsp;&nbsp;Colombia<\\/option>\\n<option value=\\\"1\\\">US<\\/option>\\n<option value=\\\"4\\\">&nbsp;&nbsp;&nbsp;&nbsp;California<\\/option>\\n<option value=\\\"5\\\">&nbsp;&nbsp;&nbsp;&nbsp;Massachusetts<\\/option>\\n<option value=\\\"6\\\">&nbsp;&nbsp;&nbsp;&nbsp;New Jersey<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_small_width\\\">Authors<\\/label><select name=\\\"grid[cols][new_0][col_settings][authors][]\\\" style=\\\"height: 57px\\\" class=\\\"grid_settings_multiselect grid_select_wide\\\" multiple=\\\"\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"--\\\">-- Any --<\\/option>\\n<option value=\\\"g_5\\\">Members<\\/option>\\n<option value=\\\"m_8\\\">&nbsp;&nbsp;&nbsp;&nbsp;Megan Sheley<\\/option>\\n<option value=\\\"m_7\\\">&nbsp;&nbsp;&nbsp;&nbsp;Tulika Bose<\\/option>\\n<option value=\\\"g_1\\\">Super Admins<\\/option>\\n<option value=\\\"m_1\\\">&nbsp;&nbsp;&nbsp;&nbsp;100YRS<\\/option>\\n<option value=\\\"m_6\\\">&nbsp;&nbsp;&nbsp;&nbsp;Julie<\\/option>\\n<option value=\\\"m_4\\\">&nbsp;&nbsp;&nbsp;&nbsp;Laura Hetzel<\\/option>\\n<option value=\\\"m_5\\\">&nbsp;&nbsp;&nbsp;&nbsp;Randall Ward<\\/option>\\n<option value=\\\"m_2\\\">&nbsp;&nbsp;&nbsp;&nbsp;Taylor Joseph<\\/option>\\n<option value=\\\"m_3\\\">&nbsp;&nbsp;&nbsp;&nbsp;Trinh Mai<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_small_width\\\">Statuses<\\/label><select name=\\\"grid[cols][new_0][col_settings][statuses][]\\\" style=\\\"height: 43px\\\" class=\\\"grid_settings_multiselect grid_select_wide\\\" multiple=\\\"\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"--\\\">-- Any --<\\/option>\\n<option value=\\\"open\\\">Open<\\/option>\\n<option value=\\\"closed\\\">Closed<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label>Show<\\/label>&nbsp;&nbsp;&nbsp;<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_settings][limit]\\\" value=\\\"100\\\" size=\\\"4\\\" class=\\\"grid_input_text_small\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;&nbsp;<label>entries<\\/label>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label>Order by<\\/label>&nbsp;&nbsp;<select name=\\\"grid[cols][new_0][col_settings][order_field]\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"title\\\">Entry Title<\\/option>\\n<option value=\\\"entry_date\\\">Entry Date<\\/option>\\n<\\/select>&nbsp;&nbsp;<label>in<\\/label>&nbsp;&nbsp;<select name=\\\"grid[cols][new_0][col_settings][order_dir]\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"asc\\\">Ascending Order<\\/option>\\n<option value=\\\"desc\\\">Descending Order<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][allow_multiple]\\\" value=\\\"1\\\" disabled=\\\"disabled\\\">Allow multiple relations?<\\/label>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_select\\\" data-fieldtype=\\\"select\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<textarea name=\\\"grid[cols][new_0][col_settings][field_list_items]\\\" cols=\\\"24\\\" rows=\\\"10\\\" class=\\\"right\\\" disabled=\\\"disabled\\\"><\\/textarea><label>Multi-Select Options<\\/label><br><i class=\\\"instruction_text\\\">Put each item on a single line<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_text\\\" data-fieldtype=\\\"text\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Field Content<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_content_type]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"all\\\">All<\\/option>\\n<option value=\\\"numeric\\\">Number<\\/option>\\n<option value=\\\"integer\\\">Integer<\\/option>\\n<option value=\\\"decimal\\\">Decimal<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Text direction?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_text_direction]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"ltr\\\">Left to Right<\\/option>\\n<option value=\\\"rtl\\\">Right to Left<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label>Limit input?<\\/label>&nbsp;&nbsp;&nbsp;<input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_settings][field_maxl]\\\" value=\\\"256\\\" class=\\\"grid_input_text_small\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;&nbsp;<i class=\\\"instruction_text\\\">Characters allowed.<\\/i>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_textarea\\\" data-fieldtype=\\\"textarea\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Text direction?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_text_direction]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"ltr\\\">Left to Right<\\/option>\\n<option value=\\\"rtl\\\">Right to Left<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Textarea Rows<\\/label><input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_settings][field_ta_rows]\\\" value=\\\"6\\\" size=\\\"4\\\" class=\\\"grid_input_text_small\\\" disabled=\\\"disabled\\\">\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_rte\\\" data-fieldtype=\\\"rte\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Textarea Rows<\\/label><input type=\\\"text\\\" name=\\\"grid[cols][new_0][col_settings][field_ta_rows]\\\" value=\\\"10\\\" size=\\\"4\\\" class=\\\"grid_input_text_small\\\" disabled=\\\"disabled\\\">\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Text direction?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_text_direction]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"ltr\\\">Left to Right<\\/option>\\n<option value=\\\"rtl\\\">Right to Left<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_assets\\\" data-fieldtype=\\\"assets\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\"><label for=\\\"assets_filedirs\\\">File Upload Directories<\\/label><br>Which file upload directories should authors be allowed to choose files from?<\\/label><div class=\\\"assets-filedirs\\\">\\n\\t<div class=\\\"assets-all assets-settingheader\\\">\\n\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][assets][filedirs]\\\" value=\\\"all\\\" checked=\\\"checked\\\" onchange=\\\"Assets.onAllFiledirsChange(this)\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;All<\\/label>\\n\\t<\\/div>\\n\\t<div class=\\\"assets-list\\\">\\n\\t\\t\\t\\t\\t\\t\\t\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][assets][filedirs][]\\\" value=\\\"ee:2\\\" checked=\\\"checked\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;File Uploads<\\/label><br>\\n\\t\\t\\t\\t\\t\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][assets][filedirs][]\\\" value=\\\"ee:1\\\" checked=\\\"checked\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;Image Uploads<\\/label><br>\\n\\t\\t\\t\\t\\t\\t<\\/div>\\n<\\/div>\\n\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section  group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\"><label for=\\\"assets_view\\\">View Options<\\/label><\\/label>\\n<div class=\\\"assets-settingheader\\\">\\n\\t<label>\\n\\t\\tView files as&nbsp;&nbsp;\\t\\t<select name=\\\"grid[cols][new_0][col_settings][assets][view]\\\" onchange=\\\"jQuery(this).parent().parent().next().children(\'.assets-options-\'+this.value).show().siblings().hide()\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"thumbs\\\" selected=\\\"selected\\\">Thumbnails<\\/option>\\n<option value=\\\"list\\\">List<\\/option>\\n<\\/select>\\t<\\/label>\\n<\\/div>\\n\\n<div>\\n\\t<div class=\\\"assets-options-thumbs\\\">\\n\\t\\t<p>\\n\\t\\t\\t<label for=\\\"thumb_size\\\">Thumbnail Size<\\/label>&nbsp;&nbsp;\\t\\t\\t<select name=\\\"grid[cols][new_0][col_settings][assets][thumb_size]\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"small\\\" selected=\\\"selected\\\">Small<\\/option>\\n<option value=\\\"large\\\">Large<\\/option>\\n<\\/select>\\t\\t<\\/p>\\n\\t\\t<p style=\\\"margin-bottom: 0\\\">\\n\\t\\t\\t<label for=\\\"show_filenames\\\">Show filenames?<\\/label>&nbsp;&nbsp;\\t\\t\\t<select name=\\\"grid[cols][new_0][col_settings][assets][show_filenames]\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"y\\\">Yes<\\/option>\\n<option value=\\\"n\\\" selected=\\\"selected\\\">No<\\/option>\\n<\\/select>\\t\\t<\\/p>\\n\\t<\\/div>\\n\\n\\t<div class=\\\"assets-options-list\\\" style=\\\"display: none\\\">\\n\\t\\t<label for=\\\"show_cols\\\">Columns<\\/label><br>\\n\\t\\t\\n<input type=\\\"hidden\\\" name=\\\"grid[cols][new_0][col_settings][assets][show_cols][]\\\" value=\\\"name\\\" disabled=\\\"disabled\\\">\\n\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"\\\" value=\\\"\\\" checked=\\\"checked\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;Name<\\/label><br>\\n\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][assets][show_cols][]\\\" value=\\\"folder\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;Folder<\\/label><br>\\n\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][assets][show_cols][]\\\" value=\\\"date\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;Date<\\/label><br>\\n\\t\\t<label class=\\\"assets-checkbox\\\"><input type=\\\"checkbox\\\" name=\\\"grid[cols][new_0][col_settings][assets][show_cols][]\\\" value=\\\"size\\\" disabled=\\\"disabled\\\">&nbsp;&nbsp;Size<\\/label><br>\\n\\t<\\/div>\\n<\\/div>\\n\\t\\t<\\/div>\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\"><label for=\\\"assets_multi\\\">Allow multiple selections?<\\/label><\\/label><select name=\\\"grid[cols][new_0][col_settings][assets][multi]\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"y\\\" selected=\\\"selected\\\">Yes<\\/option>\\n<option value=\\\"n\\\">No<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t\\t\\t<div class=\\\"grid_col_settings_custom_field_hundies_region_select\\\" data-fieldtype=\\\"hundies_region_select\\\">\\n\\t\\t\\t<div class=\\\"grid_col_settings_section alt group\\\">\\n\\t\\t\\t<label class=\\\"grid_col_setting_label_fixed_width\\\">Output formatting?<\\/label><select name=\\\"grid[cols][new_0][col_settings][field_fmt]\\\" class=\\\"select\\\" disabled=\\\"disabled\\\">\\n<option value=\\\"antenna\\\">Antenna<\\/option>\\n<option value=\\\"br\\\">Auto &lt;br \\/&gt;<\\/option>\\n<option value=\\\"http_header\\\">Http Header<\\/option>\\n<option value=\\\"hundies_shortcode\\\">Hundies Shortcode<\\/option>\\n<option value=\\\"ifelse\\\">Ifelse<\\/option>\\n<option value=\\\"json\\\">Json<\\/option>\\n<option value=\\\"low_replace\\\">Low Replace<\\/option>\\n<option value=\\\"magpie\\\">Magpie<\\/option>\\n<option value=\\\"mah_eencode\\\">Mah Eencode<\\/option>\\n<option value=\\\"markdown\\\">Markdown<\\/option>\\n<option value=\\\"none\\\" selected=\\\"selected\\\">None<\\/option>\\n<option value=\\\"xhtml\\\">Xhtml<\\/option>\\n<option value=\\\"xml_encode\\\">Xml Encode<\\/option>\\n<\\/select>\\t\\t<\\/div>\\n\\t<\\/div>\\t\\t\\t<\\/div>\\n<\\/div>\",\"multi_select_field_fmt\":\"xhtml\",\"multi_select_field_show_fmt\":\"n\",\"multi_select_field_list_items\":\"\",\"multi_select_field_pre_populate_id\":\"5_25\",\"checkboxes_field_fmt\":\"xhtml\",\"checkboxes_field_show_fmt\":\"n\",\"checkboxes_field_list_items\":\"\",\"checkboxes_field_pre_populate_id\":\"5_25\",\"radio_field_fmt\":\"xhtml\",\"radio_field_show_fmt\":\"n\",\"radio_field_list_items\":\"\",\"radio_field_pre_populate_id\":\"5_25\",\"relationship_channels\":[\"--\"],\"relationship_categories\":[\"--\"],\"relationship_authors\":[\"--\"],\"relationship_statuses\":[\"--\"],\"relationship_limit\":\"100\",\"relationship_order_field\":\"title\",\"relationship_order_dir\":\"asc\",\"rte_field_text_direction\":\"ltr\",\"rte_ta_rows\":\"6\",\"wygwam\":{\"convert\":\"auto\",\"config\":\"1\",\"defer\":\"n\"},\"assets\":{\"filedirs\":\"all\",\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"y\"},\"fieldpack_checkboxes_options\":\"\",\"fieldpack_dropdown_options\":\"\",\"fieldpack_multiselect_options\":\"\",\"pt_pill_options\":\"\",\"fieldpack_radio_buttons_options\":\"\",\"pt_switch\":{\"off_label\":\"NO\",\"off_val\":\"\",\"on_label\":\"YES\",\"on_val\":\"y\",\"default\":\"off\"},\"hundies_region_select_field_fmt\":\"xhtml\",\"hundies_region_select_field_show_fmt\":\"n\",\"field_edit_submit\":\"Update\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\"}'),(18,80,'channel',2,'text','Total Hearing Aids Provided','hearing_aids','','n','n',25,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(19,82,'channel',0,'text','Tab Title','tab_title','','n','n',15,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(20,82,'channel',1,'assets','Image','tab_image','','n','n',15,'{\"filedirs\":[\"ee:2\",\"ee:1\"],\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"n\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_type\":\"assets\",\"field_required\":\"n\"}'),(21,82,'channel',2,'text','Content Title','tab_content_title','','n','n',30,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(22,82,'channel',3,'textarea','Content','tab_content','','n','n',40,'{\"field_fmt\":\"br\",\"field_text_direction\":\"ltr\",\"field_ta_rows\":\"6\",\"field_required\":\"n\"}'),(23,85,'channel',0,'text','Number','number','ex: 1,000,000','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(24,85,'channel',1,'text','Tagline','tagline','ex: Our hearing aid commitment this decade','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"500\",\"field_required\":\"n\"}'),(25,101,'channel',0,'assets','Image','image','','n','n',0,'{\"filedirs\":[\"ee:1\"],\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"n\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_type\":\"assets\",\"field_required\":\"n\"}'),(26,101,'channel',1,'text','Video Url','video_url','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(27,101,'channel',2,'text','Headline','headline','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(28,101,'channel',3,'textarea','Content','content','','n','n',0,'{\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_ta_rows\":\"6\",\"field_required\":\"n\"}'),(29,103,'channel',0,'assets','Image','image','','n','n',0,'{\"filedirs\":[\"ee:1\"],\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"n\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_type\":\"assets\",\"field_required\":\"n\"}'),(30,103,'channel',1,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(31,103,'channel',2,'text','Body','body','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(32,103,'channel',3,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(33,105,'channel',0,'text','Row Title','row_title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(34,105,'channel',1,'rte','Column One','col1','','n','n',0,'{\"field_ta_rows\":\"10\",\"field_text_direction\":\"ltr\",\"field_required\":\"n\"}'),(35,105,'channel',2,'rte','Column Two','col2','','n','n',0,'{\"field_ta_rows\":\"10\",\"field_text_direction\":\"ltr\",\"field_required\":\"n\"}'),(36,105,'channel',3,'rte','Column Three','col3','','n','n',0,'{\"field_ta_rows\":\"10\",\"field_text_direction\":\"ltr\",\"field_required\":\"n\"}'),(37,106,'channel',0,'text','Row Title','row_title','This will be used as a header for the row','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(38,106,'channel',1,'assets','Column One','col1','','n','n',0,'{\"filedirs\":[\"ee:1\"],\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"n\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_type\":\"assets\",\"field_required\":\"n\"}'),(39,106,'channel',2,'assets','Column Two','col2','','n','n',0,'{\"filedirs\":[\"ee:1\"],\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"n\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_type\":\"assets\",\"field_required\":\"n\"}'),(40,106,'channel',3,'assets','Column Three','col3','','n','n',0,'{\"filedirs\":[\"ee:1\"],\"view\":\"thumbs\",\"thumb_size\":\"small\",\"show_filenames\":\"n\",\"show_cols\":[\"name\"],\"multi\":\"n\",\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_type\":\"assets\",\"field_required\":\"n\"}'),(41,113,'channel',0,'text','Tab Label','tab_label','','y','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"y\"}'),(42,113,'channel',1,'relationship','Tab Content','tab_content','','y','n',0,'{\"channels\":[\"18\"],\"expired\":0,\"future\":0,\"categories\":[],\"authors\":[],\"statuses\":[\"open\"],\"limit\":\"\",\"order_field\":\"entry_date\",\"order_dir\":\"asc\",\"allow_multiple\":0,\"field_required\":\"y\"}');
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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
INSERT INTO `exp_layout_publish` VALUES (9,1,1,16,'a:2:{s:7:\"publish\";a:18:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:90;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:86;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:87;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:88;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:89;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:94;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:95;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:97;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:3:\"50%\";}i:96;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:3:\"50%\";}i:91;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:92;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(2,1,1,15,'a:2:{s:7:\"publish\";a:11:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:84;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:85;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:82;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}i:83;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(4,1,1,14,'a:2:{s:7:\"publish\";a:11:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:3:\"60%\";}i:93;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:3:\"40%\";}i:79;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:80;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:81;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(12,1,1,12,'a:2:{s:7:\"publish\";a:8:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:62;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(13,1,1,5,'a:2:{s:7:\"publish\";a:15:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:18;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}i:19;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:98;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:20;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:21;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:47;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:24;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:25;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(16,1,1,11,'a:2:{s:7:\"publish\";a:19:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:63;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:99;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:64;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:66;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:65;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:67;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:68;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:69;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:70;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:71;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:72;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:73;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(17,1,1,13,'a:2:{s:7:\"publish\";a:13:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:74;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:100;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:75;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:76;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:77;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:78;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:7:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(19,1,1,17,'a:2:{s:7:\"publish\";a:11:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:1;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:101;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:102;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:103;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:6:{s:10:\"_tab_label\";s:7:\"Options\";s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(21,1,1,18,'a:2:{s:7:\"publish\";a:7:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:107;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:104;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:105;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}i:106;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:0;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:11:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}'),(22,1,1,19,'a:2:{s:7:\"publish\";a:14:{s:10:\"_tab_label\";s:7:\"Publish\";s:5:\"title\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:9:\"url_title\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:111;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:108;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:109;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:110;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:113;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}i:112;a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:15:\"expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:23:\"comment_expiration_date\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:8:\"category\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:16:\"pages__pages_uri\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:24:\"pages__pages_template_id\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}s:7:\"options\";a:6:{s:10:\"_tab_label\";s:7:\"Options\";s:10:\"entry_date\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:11:\"new_channel\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"status\";a:4:{s:7:\"visible\";b:1;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:6:\"author\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}s:7:\"options\";a:4:{s:7:\"visible\";b:0;s:8:\"collapse\";b:0;s:11:\"htmlbuttons\";b:1;s:5:\"width\";s:4:\"100%\";}}}');
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
INSERT INTO `exp_member_groups` VALUES (1,1,'Super Admins','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','','y','y','y',0,'y',20,60,'y','y','y','y','y'),(2,1,'Banned','','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','','n','n','n',60,'n',20,60,'n','n','n','n','n'),(3,1,'Guests','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(4,1,'Pending','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','n','n','n','n','','y','n','y',15,'n',20,60,'n','n','n','n','n'),(5,1,'Members','','y','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','n','','y','n','y',10,'y',20,60,'y','n','y','y','y');
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
INSERT INTO `exp_members` VALUES (1,1,'dev@100yea.rs','100YRS','a8a7b03cba67d17d2ab5be34c9079ba33d1a1cb6cb864a9aa5007ac25bd8b059d76a2f75350ac5f1bedcff3b71dd878f1be88dcfbdf5d3cab855dcf5187212a7','EkVtF:M>jnMhU/SMX(=q$*5gN28)NItXmg?K)|yJg7_H.Wi;4-`Ut<L1Wiu:dse}x;m/pqhGbh1aEGVlN2^%V{;=)FA6\'uOPR?mEDy5Nxu2Wax2v(knj(:eG>8BP\\\\,=','9f103e0f65ebdd0f0071291566aa0b4ec2c0ce3a','efa1131cff05bf5812eeffa169757ded10ce276e',NULL,'dev@100yea.rs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'10.11.0.1',1383699021,1392864527,1392958495,25,0,0,0,1392958507,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18','','Assets|C=addons_modules&M=show_module_cp&module=assets|1','n',0,'y',0),(2,1,'taylor_joseph','Taylor Joseph','d20885cf421ceae1fa04b3a1a3992b8dc6c42ca802a1180d8b032923319c9fb433baa5efeadd919f690f34add079a66f87a270c782ffe4b738122ae382313d13','^.~=fwa3Cemv@z:=#BSGn+iU-sVH$k8L8_6k|S6~@_lCql3fjB86rE1!u&DF6-FTo:kn/.\\4,$8RgD<v/_`K7K\\/\\\'GMq@7EAMp\'bO%Z\'[r\\]lY){pRW2R[KBat%dTX;','0f194eb9cb74f4354d309168b2cf28f22b33035a','ff6cfdb53f105bf771eebde3464924b440931c4a',NULL,'Taylor_Joseph@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850428,1391552108,1391552108,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'trinh_mai','Trinh Mai','6e3879eac348edef0a99a006f8d275bbb444646390e359e348c6e357581c8003d5df6d7b14fa0ee3af88db8473e0722a8217db46faa41d984070611a6dd4ace3','}$`<N6_\"VYN@IGHzjDY7Rec1@hk\'ZWq5HCRMJoHFvfqljn3IOwnm!6+4r6M0*~]0H[o?$!dWhBWTzLr+lR2PE4ocCHKQxRj>UwvHU(\'(?APR&iXL\'|S<(\'_q~y2`\\hJ(','2a35c0eb5685fb2a80c82f6cf386813ccc5ebfec','7f16667d0fc7fa3c9cda673b2372442193108e2c',NULL,'Trinh_Mai@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850463,1392335557,1392357662,9,0,0,0,1392352994,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'laura_hetzel','Laura Hetzel','f31af15e4df9066600604e5241f9dcd4871ae789f67ade5d94d30ad98326beacd09e6a8fe61408c639d0ba0fd6bc65f63254b20342d50d9d052c5003a712c6bf','*q{*<U!9;t1[fdpy[8t4w]P<045n}5*\"hw]*,bZQo&zUoywdYSRT\\8z0KO5$mT\'Uj~u#2,Z&\"J]Xp5FCfJH3|LWFI7!}VyijN98},k40n7A*:?kK)fN)n(bTJ&r?H\\#c','968d5b7895b7e24e58be8e3575dd2d6c134fc476','332b1fb5073f09dbf7468e1a2b0d65bc8a56af92',NULL,'Laura_Hetzel@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850495,1392333453,1392403763,11,0,0,0,1392403310,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'randall_ward','Randall Ward','4ff34fe515b1476d91a1ab21fd22609af97f7c6c969320c18b49367dbd27c7ae9b227e2cee9ac01e4d8bfe00f3f9ee7b76383031c9eb10ede0ef177767f0d0e6','#$.Ln^2*0E}w#0pmZU\'JvCv\\:US04A5e#,_7?\'jQ/=z:\"`|EuoB6\"(L9QuOh/6nbtDrkeN7ST4O|\'zL[;+:!Mdl\\scJvO,t+?AN^}zyem@f(%W-@:?ph<xl%uVD{WDTE','0ea2c818353df42c5f031017b53739481035fb6a','0c30f8fcd22592abb65ce9399db9e0e0feede1bd',NULL,'Randall_Ward@starkeyhearingfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850564,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'julie@100yea.rs','Julie','2c1165ca027fa015339d532b45aac4472419a40f1cdcccac7db78ae4f7a7575c9b705301695a54265f2143ccd0aa1ea1e03d62f24f3a26bb50645b729a917ca9',']y\\X@r{`sR^Jh=#r#Q-9BW!}DD(yT6_x<$,\"N/xro:M`v}(:ui;TDePq!]_]dhx`~<.\\g_4x=^&\\:h}Xied@auH0\"g&KUTWDb\\hHM}@?Etk;E{,b6wHrh^B_m;G!bK|J','9444d23d017fe0fb04505a0d6c41e8ec9275578a','a86408905268b712456c93cc4b374b2293ab63a9',NULL,'julie@100yea.rs','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390865267,1392835036,1392848315,31,0,0,0,1392700171,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(7,5,'tulika_bose','Tulika Bose','b4326e7a34c0875c944e4c8f8fe242d78d1ba805a53b3307053ca5efa1430c2965207a465552c874f9d71875b3e829551d0cd65e741d5cd3ea37651f35fa8a86','I]$m=VBBlaB*+n\'`7,K1x?YhI,~t}qao0GN%^2_\'N@\'!\\DO\"Skmiu\'s{]:L)+g\"|&}JYyf1n:)t7{$w:jQzAl-Oi0.}\\9.]\\|Uq*8&y^>Bv\'dV3G;.i4hsjC]T:uA.ij','9ad103500d30fb95dede1cd734acfd2c566c34a6','f852d5c7028ebacdeed5f2442afad2d7cfc0da29',NULL,'Tulika_Bose@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(8,5,'megan_sheley','Megan Sheley','a8d94a9de0e8eaaeea268469640a73ba4d81930f6d4bfb5ca913861871a62fa9d89de6b08a1b7d4bb881519855e7ba4da3e16d41e3b7e7a8ba67e9ba99e4af7a','NQAOe2\"V<=~g}:~wBsF~B4Oy4$^NOj-CdW4+iRsoo-~2~6XE-@nBy0Ee4H7QW\\U^V.}AP3eX,~XO9J|z:g_*[xPhT(wzJ.YrMzRCdg6uus\"a]aAZt7YE\'3*+=6AY]G\\z','959e59ff8c8d14aec02135972b2757dbb5f08611','c134aecae31953d508b66a656cbe5632d6e77728',NULL,'Megan_Sheley@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975508,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Comment','2.3.1','y','n'),(2,'Email','2.0','n','n'),(3,'Emoticon','2.0','n','n'),(4,'Jquery','1.0','n','n'),(5,'Pages','2.2','y','y'),(6,'Rss','2.0','n','n'),(7,'Search','2.2.1','n','n'),(8,'Channel','2.0.1','n','n'),(9,'Member','2.1','n','n'),(10,'Stats','2.0','n','n'),(11,'Rte','1.0.1','y','n'),(12,'Wygwam','3.2.2','y','n'),(13,'Freeform','4.1.3','y','n'),(14,'Assets','2.2.4','y','n'),(15,'Query','2.0','n','n'),(16,'Stash','2.4.9','n','n');
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
INSERT INTO `exp_password_lockout` VALUES (11,1392846390,'67.53.113.42','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9) AppleWebKit/537.71 (KHTML, like Gecko) Version/7.0 Safari/537.71','dev@seso.net');
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
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
INSERT INTO `exp_relationships` VALUES (30,10,9,5,0,0,0,0),(44,100,99,92,0,0,0,1),(23,42,16,5,0,0,0,0),(33,49,40,5,0,0,0,0),(43,98,99,83,0,0,0,1),(25,59,16,5,0,0,0,0),(26,60,16,5,0,0,0,0),(29,61,40,5,0,0,0,0),(28,62,40,5,0,0,0,0),(35,63,40,5,0,0,0,0),(45,105,34,110,0,0,0,0),(46,105,102,42,113,42,1,0),(47,105,103,42,113,42,2,0),(48,105,104,42,113,42,3,0),(49,105,104,42,113,42,4,0),(50,105,104,42,113,42,5,0),(51,105,103,42,113,42,6,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=22241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (22240,1392960027,'0','59d08f3a8f6a48f5de074989a79a1310d23f8832',0),(22239,1392960026,'0','ce4a42ce1938fc05c06a60648d489509737a5f70',0),(22238,1392960006,'0','facb875923bb95f210fb1bd4fc3278f90c408891',0),(22237,1392960005,'0','b636cd807d38031a105598133cde2c66ae819cea',0),(22236,1392960005,'0','604202b7d6a22fd2927affc018f455f4c352603e',0),(22235,1392960005,'0','6029f20d9d1eb5142b162098a96477866c792e9a',0),(22234,1392959709,'0','2fec5bc74c1425307cbc6891e597874b298ed868',0),(22233,1392959708,'0','298264722924e7911cbcbc1d4afa562b91e60b02',0),(22232,1392959681,'0','2ceca4bd27f0cff3fddaa8a0d1b0b0ab59575eb1',0),(22231,1392959681,'0','1ea0c40c64acf80f1b55ae9574fd2e92b166af6a',0),(22230,1392959681,'0','bfc7e6dd682ed7a179566f34f3e01339ea7d41ae',0),(22229,1392959676,'0','a3711e1f4f427687ce1dfd0c65ffb94cd6e4c541',0),(22228,1392959676,'0','d58ee74fa303bc7cc4e188f2d966caf6a1a55c4d',0),(22227,1392959676,'0','ef8d437add4d0a0d9c2ee7c909ab3330a9e27930',0),(21980,1392956401,'0','f7e160231bda0221a3f085790fef95c8a28d5f55',0),(21981,1392956401,'0','dd66f937c30ec607c9d8d8f8d14a8a8d89838161',0),(21982,1392956401,'0','2123e15ae988abe1ace64202b985eba5096115ad',1),(21983,1392956432,'0','78c8541c66f394f57e0d36540b2efe13120d3658',0),(21984,1392956432,'7ac365902e833787763e2e35dc82cd514a405c79','49d8525042515985b94277d289448fe5f0cfb31e',0),(21985,1392956440,'7ac365902e833787763e2e35dc82cd514a405c79','5d121e7e2ba1fe3d9171ce2299964e5f926ce766',0),(21986,1392956444,'7ac365902e833787763e2e35dc82cd514a405c79','9b353bcc3695cc39f616d2e7a7116004eff9a9e2',1),(21987,1392956453,'7ac365902e833787763e2e35dc82cd514a405c79','c029e336e2d7f82b9aa2e1af927973436565e1e4',0),(21988,1392956453,'7ac365902e833787763e2e35dc82cd514a405c79','2e1aa821edac178bd4246efa00209cf17561953b',0),(21989,1392956455,'7ac365902e833787763e2e35dc82cd514a405c79','4da6e789ac5e6b5937b0e2e5470cdce652e1ff5c',0),(21990,1392956488,'7ac365902e833787763e2e35dc82cd514a405c79','16aa1c15eec23d46ab83d8d043a1a95bb244b2bd',1),(21991,1392956573,'7ac365902e833787763e2e35dc82cd514a405c79','1fde9ef5d136fde9f6585d0bc796f7fb6aac5179',0),(21992,1392956573,'7ac365902e833787763e2e35dc82cd514a405c79','9dd50a7f77fc488386efb7fee7f799d4866aa1ca',0),(21993,1392956579,'7ac365902e833787763e2e35dc82cd514a405c79','c4c7ed257c976eda59766e1294de18f8eec035b7',1),(21994,1392956601,'7ac365902e833787763e2e35dc82cd514a405c79','2d445a4433e4d2ae9e58f84f527f77108c08abff',0),(21995,1392956601,'7ac365902e833787763e2e35dc82cd514a405c79','dd7b82d0913f2444cea422547f4b07491aebc962',0),(21996,1392956610,'7ac365902e833787763e2e35dc82cd514a405c79','f7e4163585f7380173d06b4bd4aab157b73cc792',0),(21997,1392956613,'7ac365902e833787763e2e35dc82cd514a405c79','1f98ce6627170d8db4d1989ae691649309474590',0),(21998,1392956623,'7ac365902e833787763e2e35dc82cd514a405c79','9b527b309d4a88931e64e8e3f54f92cb4558602b',1),(21999,1392956712,'7ac365902e833787763e2e35dc82cd514a405c79','0e9b3b7133b94d09fb7b959c1d29204c9334204c',0),(22000,1392956712,'7ac365902e833787763e2e35dc82cd514a405c79','929856a3c6870af67b7fa051f0426291dcc3ecff',0),(22001,1392956716,'7ac365902e833787763e2e35dc82cd514a405c79','e69f10f3f8dcaddd968c4bf211550a5b192ce5b2',1),(22002,1392956720,'7ac365902e833787763e2e35dc82cd514a405c79','6a3f17e570faf78c99fc7e41a3952b5887fa38f9',0),(22003,1392956720,'7ac365902e833787763e2e35dc82cd514a405c79','3b947b87cdff8688b047dd8e6bbae858fc941254',0),(22004,1392956727,'7ac365902e833787763e2e35dc82cd514a405c79','b582ae4137a0a1fe662eb12af5d242f4acf94d04',1),(22005,1392956802,'7ac365902e833787763e2e35dc82cd514a405c79','ba8f4ea74a7fac5a0ef23638964ca0c5965286d4',0),(22006,1392956802,'7ac365902e833787763e2e35dc82cd514a405c79','980ad98f61aba0e95e41cecb692892ce776de3e5',0),(22007,1392956810,'7ac365902e833787763e2e35dc82cd514a405c79','2ce6a16027529f14e3bc672df95e05ec73653a71',0),(22008,1392956813,'7ac365902e833787763e2e35dc82cd514a405c79','249ce9cd4734e97d6cd14872d3a6d3ca9dfafb2f',1),(22009,1392956824,'7ac365902e833787763e2e35dc82cd514a405c79','2575ffd405e5d54c4db3eab194523a72aaae9382',0),(22010,1392956824,'7ac365902e833787763e2e35dc82cd514a405c79','cf95095a671fb0563aa4ef3c63cad936c3dab851',0),(22011,1392956826,'7ac365902e833787763e2e35dc82cd514a405c79','a82a5f81e1e4089a4e6fd77030f841a3f89e8b70',0),(22012,1392956828,'7ac365902e833787763e2e35dc82cd514a405c79','b255bad63d29fe4e4287e3a6009e981297365f7e',0),(22013,1392956833,'7ac365902e833787763e2e35dc82cd514a405c79','0c407ea9da2b3e40daa183acc174138046c85a96',0),(22014,1392956836,'7ac365902e833787763e2e35dc82cd514a405c79','5ce9b0cb3631b56c80ec5e892d3a214c60df5b96',0),(22015,1392956840,'7ac365902e833787763e2e35dc82cd514a405c79','7a781316d8b23bed5385ac3d4f609c599564f938',0),(22016,1392956843,'7ac365902e833787763e2e35dc82cd514a405c79','36278836d52ea10bee3f2c5496fdde1a26a97c4f',1),(22017,1392956855,'7ac365902e833787763e2e35dc82cd514a405c79','1eba611e0551575d698f59557480f6aa5a9617a6',0),(22018,1392956855,'7ac365902e833787763e2e35dc82cd514a405c79','9cc7bbe3f9fdda5f8c83de6c437158f9930a34f4',0),(22019,1392956890,'7ac365902e833787763e2e35dc82cd514a405c79','e2881cac048d5c97a0af9700323ebb8ef06228a6',0),(22020,1392956892,'7ac365902e833787763e2e35dc82cd514a405c79','2adef75e1dbd9f30d7ed695af9366e2b1419ac5b',1),(22021,1392956897,'7ac365902e833787763e2e35dc82cd514a405c79','8bb280cb4a31a58cc57f7bed976999abc43f7a24',0),(22022,1392956897,'7ac365902e833787763e2e35dc82cd514a405c79','08fd13a4ddb353bc01624085e83ed1bbe3d9c16b',0),(22023,1392956899,'7ac365902e833787763e2e35dc82cd514a405c79','ff6112ba542b011ba6024b2332c2d90bd46194ec',0),(22024,1392956900,'7ac365902e833787763e2e35dc82cd514a405c79','b64e9a6027ab7d31fb4ca631b87c5371d818de16',0),(22025,1392956928,'7ac365902e833787763e2e35dc82cd514a405c79','a7167a8d96058df99505f8efb1e0d1f328d11c83',1),(22026,1392956973,'7ac365902e833787763e2e35dc82cd514a405c79','b4a3a8979eb15e7206be3fef18ad9048208319b4',0),(22027,1392956973,'7ac365902e833787763e2e35dc82cd514a405c79','120befb7703769db74b87e60bb83bf52b9caacd7',1),(22028,1392956983,'7ac365902e833787763e2e35dc82cd514a405c79','5359ae1530f5ba95f27eecfd5e09a0cc5067d816',1),(22029,1392956994,'7ac365902e833787763e2e35dc82cd514a405c79','a1dbe649e6be38698f8e0efec7d9d6a5cbd8f469',0),(22030,1392956994,'7ac365902e833787763e2e35dc82cd514a405c79','0ad8ba1dd3f99d3e876ffc08889c38be0604f099',0),(22031,1392956997,'7ac365902e833787763e2e35dc82cd514a405c79','746724ae844b263e3cf8e8f428f981b9e20a013a',1),(22032,1392957078,'7ac365902e833787763e2e35dc82cd514a405c79','5cfa1585be6024a4eabed65fdcafeb2988f148a6',0),(22033,1392957078,'7ac365902e833787763e2e35dc82cd514a405c79','c3bce32bf7383948c077ce59c84589c4e15213e4',1),(22034,1392957086,'7ac365902e833787763e2e35dc82cd514a405c79','b501e26f29aed9cb5efc5d2add9ec8ec37cae3a4',1),(22035,1392957086,'7ac365902e833787763e2e35dc82cd514a405c79','1edc329b61008832aa104499622acbb58aef0319',1),(22036,1392957088,'7ac365902e833787763e2e35dc82cd514a405c79','7b38113c36bed01723cc322f15b2b729d12511c2',0),(22037,1392957088,'7ac365902e833787763e2e35dc82cd514a405c79','d39a089bab3b779ee42c9734a18328e8d8af5e1f',0),(22038,1392957089,'7ac365902e833787763e2e35dc82cd514a405c79','59baf9df0583e1f7746bc625080d39d3bc8060d1',1),(22039,1392957172,'7ac365902e833787763e2e35dc82cd514a405c79','9a947e2be027a5a203dbb248cb28c21d4302a567',0),(22040,1392957172,'7ac365902e833787763e2e35dc82cd514a405c79','1aca3cd37f37812059f49428598bb57d084e0a1e',0),(22041,1392957179,'7ac365902e833787763e2e35dc82cd514a405c79','3ec9b6ec1813c049255337826995523a7b4b2843',1),(22042,1392957225,'7ac365902e833787763e2e35dc82cd514a405c79','5a8a4fa056ed2a4ec332018a2c216bcd2e5d57f2',0),(22043,1392957225,'7ac365902e833787763e2e35dc82cd514a405c79','7c1389cbfc80e9a64552b2a2c3fba38a65f045d0',0),(22044,1392957231,'7ac365902e833787763e2e35dc82cd514a405c79','caf870b1f2231a5877dcbdd9da99745b2b9647b6',0),(22045,1392957237,'7ac365902e833787763e2e35dc82cd514a405c79','9fd2117ee2a6dec92df049f071964b870107fa62',1),(22046,1392957272,'7ac365902e833787763e2e35dc82cd514a405c79','f71e9846ced52cc471f99af22e6b5be6442c8d98',0),(22047,1392957272,'7ac365902e833787763e2e35dc82cd514a405c79','812dc8d3dd6db0339850e2f255b9b082a50b1f49',0),(22048,1392957276,'7ac365902e833787763e2e35dc82cd514a405c79','806b0d6e43030f8f72d610de7371f38c9239283b',0),(22049,1392957280,'7ac365902e833787763e2e35dc82cd514a405c79','99a4b21f897214faec9cdd6c8687a5d14cd07784',0),(22050,1392957286,'7ac365902e833787763e2e35dc82cd514a405c79','caf65fdb16d39cbe4ebe06b1e5e88fdedefeed95',1),(22051,1392957296,'7ac365902e833787763e2e35dc82cd514a405c79','aa636f9e2dc11a0d46a3eeea79b3b817e5130625',0),(22052,1392957296,'7ac365902e833787763e2e35dc82cd514a405c79','c0cc9f64acb2c963197b5e65c59ff43b0cf08215',0),(22053,1392957298,'7ac365902e833787763e2e35dc82cd514a405c79','dcac15733608c14422e7bfd2a6c5ad854b78e6e0',0),(22054,1392957299,'7ac365902e833787763e2e35dc82cd514a405c79','bfdfc22592bceca9e52beffeb809ca56431ad17a',1),(22055,1392957316,'7ac365902e833787763e2e35dc82cd514a405c79','fd2add94522c1f5fe1e0a674af93ad8f1afbb351',0),(22056,1392957316,'7ac365902e833787763e2e35dc82cd514a405c79','526429290d94042b8a2ea043b7a39512e2b6bac8',0),(22057,1392957321,'7ac365902e833787763e2e35dc82cd514a405c79','efcc932aed94e06bd3956c1193fcac0030e7c636',1),(22058,1392957336,'7ac365902e833787763e2e35dc82cd514a405c79','b9da3a8487beb66b70d4b38b6591754a0fd5e078',0),(22059,1392957336,'7ac365902e833787763e2e35dc82cd514a405c79','4d204d288384dfd1ade9c53bba58dab0423e4e65',0),(22060,1392957341,'7ac365902e833787763e2e35dc82cd514a405c79','b7a1ce18ae18c1e597204adeb0beaef63d2e4c4e',1),(22061,1392957363,'7ac365902e833787763e2e35dc82cd514a405c79','ab9286289b43d284151e02ade25c57f0566710ae',0),(22062,1392957363,'7ac365902e833787763e2e35dc82cd514a405c79','93e34bbc8cecdc33215a6b9678a7f069a5b1fd83',0),(22063,1392957369,'7ac365902e833787763e2e35dc82cd514a405c79','3b20b2742d4d0cef8eb5bcbdfaa06d70acfb657a',1),(22064,1392957391,'7ac365902e833787763e2e35dc82cd514a405c79','04a41069a4cf343ffee72454ea72371bb7e571ae',0),(22065,1392957391,'7ac365902e833787763e2e35dc82cd514a405c79','2b21ed9aa90e3fe582eed3a21cc5f99f098c8c12',0),(22066,1392957397,'7ac365902e833787763e2e35dc82cd514a405c79','d42e383be745347246510c99b64425a1828efa3d',1),(22067,1392957422,'7ac365902e833787763e2e35dc82cd514a405c79','4db7c1f3ac18920e84adf16aaf592e83dd271fbd',0),(22068,1392957422,'7ac365902e833787763e2e35dc82cd514a405c79','983d11e297f0a113e7105c1a7595e5e692b81e3f',0),(22069,1392957430,'7ac365902e833787763e2e35dc82cd514a405c79','c890ce9a514b41d41838f85512892e515fc6f2f2',1),(22070,1392957482,'7ac365902e833787763e2e35dc82cd514a405c79','d344bd58152fc399b53f73380e9b86fbe435f671',0),(22071,1392957482,'7ac365902e833787763e2e35dc82cd514a405c79','9f6f4661fe96fc0d528973b0103e5624a388fd56',0),(22072,1392957499,'7ac365902e833787763e2e35dc82cd514a405c79','db3b47e716d46cd54ba81b973a3709e4a443a020',0),(22073,1392957503,'7ac365902e833787763e2e35dc82cd514a405c79','f99379665cc335c32bd5f3bd56c02a7485faab4b',1),(22074,1392957519,'7ac365902e833787763e2e35dc82cd514a405c79','02854a9b31707dae5b48e01a90e6ca226ab68b97',0),(22075,1392957519,'7ac365902e833787763e2e35dc82cd514a405c79','24a6831ca9318cfd22d21a628b5c7a66e1993db2',0),(22076,1392957522,'7ac365902e833787763e2e35dc82cd514a405c79','5558ecb9c40e80c060ff2ce683a5a688170787db',1),(22077,1392957522,'7ac365902e833787763e2e35dc82cd514a405c79','783b0e4ec270d1ea34d006b37375b47e83a5b00e',0),(22078,1392957523,'7ac365902e833787763e2e35dc82cd514a405c79','37c8b3901534397942c37beb93228380cfb1df54',0),(22079,1392957523,'7ac365902e833787763e2e35dc82cd514a405c79','7449b461212c514005aa9b46ef9be2c2b9785f3e',0),(22080,1392957587,'7ac365902e833787763e2e35dc82cd514a405c79','94a192d960f1c88031e1977e356d2b213f671d7d',1),(22081,1392957596,'7ac365902e833787763e2e35dc82cd514a405c79','2232a744eee3189ec8904b7a887312cf67760d75',1),(22082,1392957608,'7ac365902e833787763e2e35dc82cd514a405c79','6d21ffb9aea21090347ac7742ea35ad8ccb90bc1',1),(22083,1392957660,'7ac365902e833787763e2e35dc82cd514a405c79','7c17026a6a55fed738d44d8e574a0408a1c625f0',0),(22084,1392957670,'7ac365902e833787763e2e35dc82cd514a405c79','b4338ff1a778a9167b2e4777b0053f4d02f3d89b',0),(22085,1392957670,'7ac365902e833787763e2e35dc82cd514a405c79','bcee7abedafe35eff26bf3f58cab4bcf41795348',0),(22086,1392957670,'7ac365902e833787763e2e35dc82cd514a405c79','cdb7ec4499d66ef78e48a55160a85d24c301c747',0),(22087,1392957671,'7ac365902e833787763e2e35dc82cd514a405c79','ea3136baf78c239924f83acb41908b49c67edcd6',0),(22088,1392957675,'7ac365902e833787763e2e35dc82cd514a405c79','b3fc794d872184f9f12bdc2d5beeb9e938db9274',0),(22089,1392957675,'7ac365902e833787763e2e35dc82cd514a405c79','6752ca206cee516e6b78ee433b742fa92695cf1a',0),(22090,1392957678,'7ac365902e833787763e2e35dc82cd514a405c79','06f5fb590cbc029daebceb8195d4ff9baf0f413a',0),(22091,1392957693,'7ac365902e833787763e2e35dc82cd514a405c79','fc6061c9e8626b5ce8033267612ed4bdc6b434f1',0),(22092,1392957693,'7ac365902e833787763e2e35dc82cd514a405c79','574e82fbcb041ec3c158d96e48c1cf331aff8c24',0),(22093,1392957694,'7ac365902e833787763e2e35dc82cd514a405c79','62ebf326a9aed4cf868132b18e84735aa730fbd0',0),(22094,1392957694,'7ac365902e833787763e2e35dc82cd514a405c79','0fab310f1e691c9946b3075ea14f674923fe44e0',0),(22095,1392957698,'7ac365902e833787763e2e35dc82cd514a405c79','6f97cf0de89d9d76a5e2fa23d69e58d552023372',0),(22096,1392957774,'7ac365902e833787763e2e35dc82cd514a405c79','48cc48a4c1f73fc7091e95371aaa2b51cf5dcbec',0),(22097,1392957774,'7ac365902e833787763e2e35dc82cd514a405c79','008806dfd6fcd09265437edd89ef42113aa626b6',0),(22098,1392957774,'7ac365902e833787763e2e35dc82cd514a405c79','8a48c146e1dc033df8d4abb9f014bb2c41e618b9',0),(22099,1392957774,'7ac365902e833787763e2e35dc82cd514a405c79','53bfebac82e10e3f02c8c9b1b20b4532b3bb174e',0),(22100,1392957780,'7ac365902e833787763e2e35dc82cd514a405c79','969ba5a3ba1ee3344b6576753898dbc882a5d401',0),(22101,1392957781,'7ac365902e833787763e2e35dc82cd514a405c79','963bafcf47e2197ffcfd196f50b3ce5e10fbb364',0),(22102,1392957781,'7ac365902e833787763e2e35dc82cd514a405c79','777df77b6d5f81f7d8edcb09ee761dc2f1342e47',0),(22103,1392957781,'7ac365902e833787763e2e35dc82cd514a405c79','046dbf9ecb3fc5c6cc314e24ad3c87799b2736ac',0),(22104,1392957781,'7ac365902e833787763e2e35dc82cd514a405c79','3f96a19911ce66e257a54241829db9356840374a',0),(22105,1392957787,'7ac365902e833787763e2e35dc82cd514a405c79','2e9deb6da1a2b978c6e6bdf908c79b15a08f64cd',1),(22106,1392957793,'7ac365902e833787763e2e35dc82cd514a405c79','3e0034343cf81cc2bdf88551712cc2f1bf304a06',0),(22107,1392957793,'7ac365902e833787763e2e35dc82cd514a405c79','4555f117ad7bc2696c467342b8ae7dcf346af51c',0),(22108,1392957812,'7ac365902e833787763e2e35dc82cd514a405c79','b86168107c193ff422c4927f4d3df3ec0255da36',1),(22109,1392957812,'7ac365902e833787763e2e35dc82cd514a405c79','c0cd46b6d4ad3ba2d89807a52d4cc1c9857c282d',0),(22110,1392957812,'7ac365902e833787763e2e35dc82cd514a405c79','633999defb1d93030dcb2e38256883f31eb97170',0),(22111,1392957813,'7ac365902e833787763e2e35dc82cd514a405c79','b81a29f8908091a8467f89713f01b1d8cdc2311a',0),(22112,1392957848,'7ac365902e833787763e2e35dc82cd514a405c79','6791d7e0270dc032445e0301acf988e7e9071848',1),(22113,1392957905,'7ac365902e833787763e2e35dc82cd514a405c79','17f50ae355124bb82290968c4dd4db34ee2b9545',1),(22114,1392957906,'7ac365902e833787763e2e35dc82cd514a405c79','921a5ed39740f591959f7337074d9402e732f3e8',0),(22115,1392957906,'7ac365902e833787763e2e35dc82cd514a405c79','81b227a561de36fd0207d4b64ea519a1460a760b',0),(22116,1392957906,'7ac365902e833787763e2e35dc82cd514a405c79','40b5eafc7a66cdf2ed7d82fa35c4315b9bfcac39',0),(22117,1392957917,'7ac365902e833787763e2e35dc82cd514a405c79','e98a405b370faa12974c05f186559ca14467c66c',0),(22118,1392957917,'7ac365902e833787763e2e35dc82cd514a405c79','33cd82ca4d998e5374d901b430bb3cf58ff0373c',0),(22119,1392957919,'7ac365902e833787763e2e35dc82cd514a405c79','10a1eca54da85ec59a85c0d1d80cdd1a00478a31',1),(22120,1392957920,'7ac365902e833787763e2e35dc82cd514a405c79','157039ce0cc324280a7ffb656cd4feb480fc1006',0),(22121,1392957920,'7ac365902e833787763e2e35dc82cd514a405c79','37a4ec7667461c1ced01096d8d1e7e9cb5fc97d3',0),(22122,1392957920,'7ac365902e833787763e2e35dc82cd514a405c79','6aee2d56a6b9e1361853be22f6bc52f8fd510bdf',0),(22123,1392957925,'7ac365902e833787763e2e35dc82cd514a405c79','4bb9fd573186c1341842d62cc39ba6e34f4585d6',0),(22124,1392957927,'7ac365902e833787763e2e35dc82cd514a405c79','7d09f51624e7c1c5ca28307947a38b6641f36321',0),(22125,1392957928,'7ac365902e833787763e2e35dc82cd514a405c79','3149480d7ca6b7b5007462cb408be129c3056db0',0),(22126,1392957928,'7ac365902e833787763e2e35dc82cd514a405c79','1fdbb5ab59f3b37301e9a171547a28a70dc16106',0),(22127,1392957928,'7ac365902e833787763e2e35dc82cd514a405c79','e398968b396e2d15e3978591fe1ad04f05e0c1a1',0),(22128,1392957937,'7ac365902e833787763e2e35dc82cd514a405c79','7b2ce103016a24b6c19ca5afcc9b039e99c5d27b',0),(22129,1392957939,'7ac365902e833787763e2e35dc82cd514a405c79','5faf0f2027d4069bbc5cbdf4b40f83767acd0121',0),(22130,1392957940,'7ac365902e833787763e2e35dc82cd514a405c79','1810862dec986caae9e61e6c7a8420b467fc6a3f',0),(22131,1392957942,'7ac365902e833787763e2e35dc82cd514a405c79','456b872e0af84a6ee74b85b9087db886dd35bb79',1),(22132,1392957953,'7ac365902e833787763e2e35dc82cd514a405c79','315fa6d5489900fa7a0fecaf2e3d71c179368df1',0),(22133,1392957953,'7ac365902e833787763e2e35dc82cd514a405c79','b71ab4b7368b898dc3278cb88ef2ce46a94c3e10',0),(22134,1392957955,'7ac365902e833787763e2e35dc82cd514a405c79','a6a0a7509a8fde475ed17f5b741d05e27a63dae5',1),(22135,1392957956,'7ac365902e833787763e2e35dc82cd514a405c79','f62d8d1d1926e8af7d7e7b6cfa57e90c6de61b9a',0),(22136,1392957956,'7ac365902e833787763e2e35dc82cd514a405c79','cc0520878f0a85153b483a8c9b65c3ff913ca9e5',0),(22137,1392957956,'7ac365902e833787763e2e35dc82cd514a405c79','8f3f6f73609e7f0741dc3bae37bfb67450731a15',0),(22138,1392957982,'7ac365902e833787763e2e35dc82cd514a405c79','b158bc8005a8583cbedfafaaafcdcf14eb365b17',0),(22139,1392957982,'7ac365902e833787763e2e35dc82cd514a405c79','112537765c77f804c5747cb4352b24ed25711786',0),(22140,1392957988,'7ac365902e833787763e2e35dc82cd514a405c79','1a2a51c5f0e8ca2e99c0b5f4ce7e151c5f7b13a7',0),(22141,1392957988,'7ac365902e833787763e2e35dc82cd514a405c79','61f0df09a651365b2774f107052cf4636b83d84c',0),(22142,1392957988,'7ac365902e833787763e2e35dc82cd514a405c79','0a12939ffdef3c1cab373a0950f01e617da57628',0),(22143,1392957989,'7ac365902e833787763e2e35dc82cd514a405c79','c0a19d84f71016afae6d11b3508085a3f9c847ef',0),(22144,1392958024,'7ac365902e833787763e2e35dc82cd514a405c79','0ebed4bb26ae3d247928ee694b5e0be54ad8d08f',1),(22145,1392958056,'7ac365902e833787763e2e35dc82cd514a405c79','5c36bd84f54f7fc08f961a9acae070787bf200bf',0),(22146,1392958056,'7ac365902e833787763e2e35dc82cd514a405c79','1526db0a6a4c21443b792bbe19ff60d0c80a7ab4',0),(22147,1392958059,'7ac365902e833787763e2e35dc82cd514a405c79','71a5d085521d6dfd4e3438bb5833133d77a365b8',0),(22148,1392958060,'7ac365902e833787763e2e35dc82cd514a405c79','585872763a220bf52c66d1937c02eedb4746e9f0',0),(22149,1392958060,'7ac365902e833787763e2e35dc82cd514a405c79','7c5110ab28f1c495628a46eca48bb48c3bcc2db1',0),(22150,1392958060,'7ac365902e833787763e2e35dc82cd514a405c79','cc49cb7b64e77450e06b27061a6cfc31462864d6',0),(22151,1392958066,'7ac365902e833787763e2e35dc82cd514a405c79','3dff2634f0455390cfd38d9e9a57af7306186932',0),(22152,1392958066,'7ac365902e833787763e2e35dc82cd514a405c79','8650239c60ff92d77662852641d15e9b494c41f7',0),(22153,1392958066,'7ac365902e833787763e2e35dc82cd514a405c79','ac29a84ef31a3e0fb6999f081f3dc837254f3727',0),(22154,1392958066,'7ac365902e833787763e2e35dc82cd514a405c79','caffaabde0f66b923677fcc495b3141c2b316e40',0),(22155,1392958070,'7ac365902e833787763e2e35dc82cd514a405c79','766ca2394c57b7fff919e9783c26f2cad49e847f',0),(22156,1392958070,'7ac365902e833787763e2e35dc82cd514a405c79','9057ef92d1b1854600e45bda827071171951bb12',0),(22157,1392958070,'7ac365902e833787763e2e35dc82cd514a405c79','b625f5171194cfdb7d88b7f8b211659970cdd40d',0),(22158,1392958070,'7ac365902e833787763e2e35dc82cd514a405c79','c725d20ab9051fc7fc8fbdce401b32220511c602',0),(22159,1392958070,'7ac365902e833787763e2e35dc82cd514a405c79','0c506bd2bce78ec22fae652d7a887456a68ed727',0),(22160,1392958073,'7ac365902e833787763e2e35dc82cd514a405c79','1f21d6529732ecc12c7c5c0f85406dfc90209f7f',0),(22161,1392958074,'7ac365902e833787763e2e35dc82cd514a405c79','2bbe279a8aed8274352aeaf937960663a648a307',0),(22162,1392958074,'7ac365902e833787763e2e35dc82cd514a405c79','9e35be0880be215bf752eaaa9e3b2c389cbb858a',0),(22163,1392958074,'7ac365902e833787763e2e35dc82cd514a405c79','4146841944c8281116663a05bfa91662f57d33e7',0),(22164,1392958074,'7ac365902e833787763e2e35dc82cd514a405c79','b52c8852d32b1731376f123783261e570b07beb7',0),(22165,1392958076,'7ac365902e833787763e2e35dc82cd514a405c79','936456692bc384d92b281091bf225ac5685966d8',0),(22166,1392958077,'7ac365902e833787763e2e35dc82cd514a405c79','92ff20c4754fdc9c0834ec6d35ae3f9377f359df',0),(22167,1392958077,'7ac365902e833787763e2e35dc82cd514a405c79','eb4b7204e27a30a9d705848b44b19c016f8a10c4',0),(22168,1392958077,'7ac365902e833787763e2e35dc82cd514a405c79','09901b26a8ba10b93b375d739712bfc67761c644',0),(22169,1392958077,'7ac365902e833787763e2e35dc82cd514a405c79','ef64c8208c899e1c4663654b42417a60034183a2',0),(22170,1392958079,'7ac365902e833787763e2e35dc82cd514a405c79','97053833dc60ad4cbeb43dd441fa5eda84d0ed05',0),(22171,1392958079,'7ac365902e833787763e2e35dc82cd514a405c79','2300ecf620e5b3897c0845c2176a346710da39d1',0),(22172,1392958079,'7ac365902e833787763e2e35dc82cd514a405c79','937d0447ca9dac9101e730af5196bc5aea85738a',0),(22173,1392958079,'7ac365902e833787763e2e35dc82cd514a405c79','9769474d3c3816d58dd1aa8a975588f062140e71',0),(22174,1392958081,'7ac365902e833787763e2e35dc82cd514a405c79','719cbff5fad1b07009897b20b2742660930a233e',0),(22175,1392958082,'7ac365902e833787763e2e35dc82cd514a405c79','7908d86b3a87ca336336c0bfb8206976207c8084',0),(22176,1392958082,'7ac365902e833787763e2e35dc82cd514a405c79','9a8a4ea2d0fced2283c172830e65c2a8a5ee341d',0),(22177,1392958082,'7ac365902e833787763e2e35dc82cd514a405c79','977652c6b920e018a6a2386c56a36d4a668350d3',0),(22178,1392958082,'7ac365902e833787763e2e35dc82cd514a405c79','01255da315f765434b8a17fa06cfde5fd22cd53f',0),(22179,1392958084,'7ac365902e833787763e2e35dc82cd514a405c79','cc2c9de4ca37ffce264738ed876290cb64a5193f',0),(22180,1392958084,'7ac365902e833787763e2e35dc82cd514a405c79','3fd7d9a5aafc1f860848eb26350dd4c5acf512fc',0),(22181,1392958086,'7ac365902e833787763e2e35dc82cd514a405c79','84a0a07a2eeb9cafdbbdaa29ddb8aebb5c9019e0',0),(22182,1392958086,'7ac365902e833787763e2e35dc82cd514a405c79','d355587c1acbe1910a5eebb69eaaa9ad8e36271b',0),(22183,1392958088,'7ac365902e833787763e2e35dc82cd514a405c79','d54be9c3789c972ca54cae20307965ea4a916556',1),(22184,1392958109,'7ac365902e833787763e2e35dc82cd514a405c79','c6de1ed0ca7978c1082c5fe998cff5e644052bb0',0),(22185,1392958110,'7ac365902e833787763e2e35dc82cd514a405c79','897100a07ca1562f7597e81c39d2ab0a07645882',0),(22186,1392958113,'7ac365902e833787763e2e35dc82cd514a405c79','6edc318df7636c12801e32c6e7a2870fe2f2ab3b',1),(22187,1392958114,'7ac365902e833787763e2e35dc82cd514a405c79','265dafaf4315756c8d08d134de39b0d85cdb897d',0),(22188,1392958114,'7ac365902e833787763e2e35dc82cd514a405c79','40f35c7e38b35f5815cf1922fec8786d97b93638',0),(22189,1392958114,'7ac365902e833787763e2e35dc82cd514a405c79','cfc3d30354d5a47be2afb3d3d0948f7b4f0cf141',0),(22190,1392958176,'7ac365902e833787763e2e35dc82cd514a405c79','38169a2562fe952f35ea8600d42120a35e0817a7',1),(22191,1392958206,'7ac365902e833787763e2e35dc82cd514a405c79','e79d9c184327e8cf36911ee6fa6ae5b84f012dcb',0),(22192,1392958206,'7ac365902e833787763e2e35dc82cd514a405c79','f9f60b15ba9cbe37a320d9feba2a0d60e8e101ab',0),(22193,1392958209,'7ac365902e833787763e2e35dc82cd514a405c79','27a5c1281ebb194e9c310c0ee593a0793a6f7758',0),(22194,1392958211,'7ac365902e833787763e2e35dc82cd514a405c79','c6d350a53bc710e1dc6b74ad366f2e06a88a39f6',1),(22195,1392958211,'7ac365902e833787763e2e35dc82cd514a405c79','33cbeab9bc5c524d969270b1292819e34ce4bac8',0),(22196,1392958211,'7ac365902e833787763e2e35dc82cd514a405c79','d62c65120639925b4ef690cf1917aa13ad9e371b',0),(22197,1392958211,'7ac365902e833787763e2e35dc82cd514a405c79','08da7f5dfeb5d7c5e96e4c37dbca956203c2f7ca',0),(22198,1392958223,'7ac365902e833787763e2e35dc82cd514a405c79','cc88d0dbec165410b6045175aba824abef8845d3',0),(22199,1392958224,'7ac365902e833787763e2e35dc82cd514a405c79','f53f255403ba6b3a4e0be84c5d2a4880398c2632',0),(22200,1392958231,'7ac365902e833787763e2e35dc82cd514a405c79','3ae8856333c435b64706c998f45fb30762da1296',0),(22201,1392958232,'7ac365902e833787763e2e35dc82cd514a405c79','1f89b876b75dc9aa131bfdf938c3eae0ab80081c',1),(22202,1392958233,'7ac365902e833787763e2e35dc82cd514a405c79','3ce4b707d7789f6e38ad4f57596fd17db7bc1934',0),(22203,1392958233,'7ac365902e833787763e2e35dc82cd514a405c79','fe601fa697bc7c10f846139ff3ca95a833ad77e0',0),(22204,1392958233,'7ac365902e833787763e2e35dc82cd514a405c79','9d986e60eb7dec0dc43f1e45cac5d108b4b739eb',0),(22205,1392958243,'7ac365902e833787763e2e35dc82cd514a405c79','31a46fd25d4ac9379bd4ec97604eadb405ac8046',0),(22206,1392958243,'7ac365902e833787763e2e35dc82cd514a405c79','00cc40ec7ed26adf5676bbca9a679ee26cdf6278',0),(22207,1392958248,'7ac365902e833787763e2e35dc82cd514a405c79','f6c9448de1811d5f71818102e276838b706900e9',0),(22208,1392958252,'7ac365902e833787763e2e35dc82cd514a405c79','aa04fb6bc6aeef17a1fc0fc73b594a79463e4a73',1),(22209,1392958253,'7ac365902e833787763e2e35dc82cd514a405c79','cdff23cfff2a6826dfde14a3d47176810f4a80da',0),(22210,1392958253,'7ac365902e833787763e2e35dc82cd514a405c79','2b87ae87d3050d0b06c3864fe1197408e35527fa',0),(22211,1392958253,'7ac365902e833787763e2e35dc82cd514a405c79','a6a1e99ba35e5c0914862672ef77ddf358191190',0),(22212,1392958319,'7ac365902e833787763e2e35dc82cd514a405c79','88fe25a7d9fc4142ce5af8a4d67fcee12e9c08ae',1),(22213,1392958386,'7ac365902e833787763e2e35dc82cd514a405c79','c0c58b5eb0d1e8424c981f8b38c30e812bd02b7c',0),(22214,1392958495,'7ac365902e833787763e2e35dc82cd514a405c79','45b772f72da9df207ecce482e6cd711d6e16dd1a',0),(22215,1392958495,'7ac365902e833787763e2e35dc82cd514a405c79','01388c91c34c805f6d8b3d9ae69b16d5164cd484',0),(22216,1392958495,'7ac365902e833787763e2e35dc82cd514a405c79','3c69c5ea8cd906524e19e2474d7b4eeaaba2023a',0),(22217,1392958495,'7ac365902e833787763e2e35dc82cd514a405c79','c92926f1b2d7cf5bcda33565654cd3ebfcd0e81e',0),(22218,1392958498,'7ac365902e833787763e2e35dc82cd514a405c79','3bcc67a5893117f206df33b464a872204baf5250',0),(22219,1392958500,'7ac365902e833787763e2e35dc82cd514a405c79','1ef4aaf41379ac47daed93a2691194adabbef480',0),(22220,1392958500,'7ac365902e833787763e2e35dc82cd514a405c79','2694086ffe0126bc0252e68782ea9a3fbc5a6a5d',0),(22221,1392958504,'7ac365902e833787763e2e35dc82cd514a405c79','9236ed610fc0bd027b97248d214090b9b187d3ad',1),(22222,1392958507,'7ac365902e833787763e2e35dc82cd514a405c79','50e4d15ce65ce96cc58f76f44982ffd54ea9589c',0),(22223,1392958507,'7ac365902e833787763e2e35dc82cd514a405c79','e076e9f8fcbf6087a88aab5514d60b63031d08ef',0),(22224,1392958554,'7ac365902e833787763e2e35dc82cd514a405c79','ce8ed294b9cfd2f8dc7d46b592da14c71e424736',0),(22225,1392958557,'7ac365902e833787763e2e35dc82cd514a405c79','41d9ed23456bd59abd7925e76194250e838180d6',0),(22226,1392959674,'0','0e7f760c343f79ecb36155c164bd093163acc105',0);
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
INSERT INTO `exp_sessions` VALUES ('7ac365902e833787763e2e35dc82cd514a405c79',1,1,'97.81.103.51','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36','1e1d3d93d461182ab43fc9388ceed545',1392956432,1392958557);
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
-- Table structure for table `exp_stash`
--

DROP TABLE IF EXISTS `exp_stash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stash` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `session_id` varchar(40) DEFAULT NULL,
  `bundle_id` int(11) unsigned NOT NULL DEFAULT '1',
  `key_name` varchar(255) NOT NULL,
  `key_label` varchar(255) DEFAULT NULL,
  `created` int(10) unsigned NOT NULL,
  `expire` int(10) unsigned NOT NULL DEFAULT '0',
  `parameters` mediumtext,
  PRIMARY KEY (`id`),
  KEY `bundle_id` (`bundle_id`),
  KEY `key_session` (`key_name`,`session_id`),
  KEY `key_name` (`key_name`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `exp_stash_fk` FOREIGN KEY (`bundle_id`) REFERENCES `exp_stash_bundles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stash`
--

LOCK TABLES `exp_stash` WRITE;
/*!40000 ALTER TABLE `exp_stash` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_stash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stash_bundles`
--

DROP TABLE IF EXISTS `exp_stash_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stash_bundles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_name` varchar(255) NOT NULL,
  `bundle_label` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bundle` (`bundle_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stash_bundles`
--

LOCK TABLES `exp_stash_bundles` WRITE;
/*!40000 ALTER TABLE `exp_stash_bundles` DISABLE KEYS */;
INSERT INTO `exp_stash_bundles` VALUES (1,'default','Default',1),(2,'templates','Templates',1),(3,'static','Static',1);
/*!40000 ALTER TABLE `exp_stash_bundles` ENABLE KEYS */;
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
INSERT INTO `exp_stats` VALUES (1,1,8,8,'Megan Sheley',76,0,0,0,1392958200,0,0,1383699119,1,1383699119,1393564474);
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (1,1,'pages',1,'y'),(2,1,'blog',2,'n'),(3,1,'media_mentions',3,'n'),(4,1,'programs',4,'n'),(6,1,'api',5,'n'),(7,1,'missions',6,'n'),(8,1,'gala',7,'n');
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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','','',1389247785,1,'n',0,'','n','y','o',0),(2,1,2,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'blog-index-page page\'  ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n      <div class=\"outer-container\">\n      <section class=\'carousel bottom\' ng-controller=\"bottomCarouselCtrl\">\n        <thumblist-nav>\n          <div>\n            <img src=\"uploads/home/feature/building_a_better_kibera.jpg\">\n            <h4>Global Hearing Mission</h4>\n            <button ng-click=\"slide(0)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/celebrity_film.jpg\">\n            <h4>Celebrity Support</h4>\n            <button ng-click=\"slide(1)\">watch video &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/changing_lives_with_sir_richard_branson_and_virgin_unite.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(2)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/listen_carefully.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(3)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/operation_change.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(4)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/philippines_film.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(5)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/providing_clean_water_in_tanzania.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(6)\">read stories &rarr;</button>\n          </div>\n        </thumblist-nav>\n      </section>\n      </div>\n\n      <div class=\"outer-container\">\n      <div ng-controller=\"PaginationController\">\n          <div class=\"pagination-featured\">\n            <div ng-repeat=\"featuredArticle in featured\">\n              <h1></h1>\n            </div>\n          </div>\n      \n          <div class=\"pagination\">\n            <ul>\n              <li ng-class=\"{disabled: currentPage == 0}\">\n                <a href ng-click=\"prevPage()\">Prev</a>\n              </li>\n              <li ng-repeat=\"n in range(pagedArticles.length)\"\n                ng-class=\"{active: n == currentPage}\"\n                ng-click=\"setPage()\">\n                <a href ng-bind=\"n + 1\">1</a>\n              </li>\n              <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                <a href ng-click=\"nextPage()\">Next</a>\n              </li>\n            </ul>\n          </div>\n          <div class=\"spacer\"></div>\n          <div class=\"outer-container\">\n            <div class=\"pagination-articles \" ng-repeat=\"articleCol in pagedArticles[currentPage]\">\n              <div ng-repeat=\"article in articleCol\">\n                <pagination article=\"article\" lightbox=\"lightbox\" add-tag=\"addTag\" class= \"row\"></pagination>\n              </div>\n            </div>\n          </div>\n          <div class=\"center\">\n            <div class=\"pagination\">\n              <ul>\n                <li ng-class=\"{disabled: currentPage == 0}\">\n                  <a href ng-click=\"prevPage()\">Prev</a>\n                </li>\n                <li ng-repeat=\"n in range(pagedArticles.length)\"\n                  ng-class=\"{active: n == currentPage}\"\n                  ng-click=\"setPage()\">\n                  <a href ng-bind=\"n + 1\">1</a>\n                </li>\n                <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                  <a href ng-click=\"nextPage()\">Next</a>\n                </li>\n              </ul>\n            </div>\n          </div>\n      \n        <div class=\"modal fade\" ng-class=\"{in: lightbox()}\">\n          <div class=\"modal-header\">\n            <button type=\"button\" class=\"close\" ng-click=\"lightbox(false)\">×</button>\n            <h2>{{lightbox().title}}</h2>\n          </div>\n          <div class=\"modal-body\">\n            <a href=\"{{lightbox().url}}\">\n            Modal\n            </a>\n            <p>{{lightbox().desc}}</p>\n            <p>\n              <span class=\"label label-info pagination-tag\" ng-repeat=\"tag in lightbox().tags\"></span>\n            </p>\n          </div>\n          <div class=\"modal-footer\">\n            <a href=\"{{lightbox().url}}\" class=\"btn btn-primary\">Check out the App</a>\n            <a ng-show=\"lightbox().src\" href=\"{{lightbox().src}}\" class=\"btn\">View the Source</a>\n            <a ng-show=\"lightbox().info\" href=\"{{lightbox().info}}\" class=\"btn\">Read More</a>\n          </div>\n        </div>\n        <div class=\"modal-backdrop fade\" ng-class=\"{in: lightbox()}\" ng-click=\'lightbox(false)\'></div>\n      \n      </div>\n      </div>\n\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1390174301,1,'n',0,'','n','n','o',0),(3,1,3,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n  <meta charset=\"utf-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <title>Starkey Hearing Foundation</title>\n  <meta name=\"description\" content=\"\">\n  <meta name=\"viewport\" content=\"width=device-width\">\n  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n  \n  <link rel=\"stylesheet\" href=\"assets/styles/39034138.main.css\"/>\n  \n  </head>\n  <body class=\'media-mentions-page page\' ng:app=\"mediaMentionsPagesApp\" ng:controller=\"globalVideoModalCtrl\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n        <a href=\"/\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n        </a>\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n      <div ng-view></div>\n    <!-- end main content section -->\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/109209b4.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/7a1cf0cb.main.js\"></script>\n    \n    <script src=\"/assets/scripts/f7bcce96.plugins.js\"></script>\n    \n    <video-player-modal show=\'modalVideo\' width=\'90%\' height=\'90%\'></video-player-modal>\n</body>\n</html>\n','',1391805397,1,'n',0,'','n','n','o',0),(4,1,4,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n\n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'programs-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n    <section class=\'page-leader\'>\n      <h1>Our programs</h1>\n      <p>Programs overview lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dnt lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam.</p>\n    </section>\n\n    <section class=\'tabbed-content\'>\n      <nav>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.operation-change\'>Operation Change</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.listen-carefully\'>Listen Carefully</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hear-now\'>Hear Now</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hearing-aid-recycling\'>Hearing Aid Recycling</a>\n            </li>\n          </ul>\n      </nav>\n\n      <article class=\'tab-content operation-change\'>\n        <div class=\"outer-container\">\n          <h1>Operation change</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n\n        <section class=\"carousel hero\" ng-controller=\"heroCarouselCtrl\">\n          <swiper class=\"swiper\" speed=\"5000\" continuous=\"true\" auto=\"false\">\n            <div class=\"slide\">\n              <article>\n                <img src=\"uploads/home/hero/vikings_mission.jpg\" />\n              </article>\n            </div>\n          </swiper>\n        </section>\n        <br/>\n        <div class=\"outer-container\">\n          <h1>Our partnerships</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content listen-carefully\'>\n        <div class=\"outer-container\">\n          <h1>Listen Carefully</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hear-now\'>\n        <div class=\"outer-container\">\n          <h1>Hear Now</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hearing-aid-recycling\'>\n        <div class=\"outer-container\">\n          <h1>Hearing Aid Recycling</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n    </section>\n    <br/>\n\n      <p>Put production thumblist_nav here</p>\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(6,1,6,'homepage_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"coords\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"5\"}\n        [\n            {homepage_map_item_lat},\n            {homepage_map_item_lon}\n        ],\n   {/exp:channel:entries}\n   ],\n   \"meta_data\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"6\"}\n       {\n          \"title\":\"{title}\",\n          \"text\":\"{if homepage_map_item_content}{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{homepage_map_item_content}{/exp:low_replace}{/if}\",\n          \"thumbnail_url\":\"{homepage_map_item_image}\",\n          \"action_target\":\"{homepage_map_item_cta_link}\"\n       },\n    {/exp:channel:entries}\n   ]\n}\n',NULL,1391025408,1,'n',0,'','n','n','o',0),(7,1,6,'blog','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n    {exp:channel:entries channel=\"blog\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"year\": \"{entry_date format=\'%Y\'}\",\n      \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n      \"related_blog_items\": [],\n      \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n      \"title\": \"{title}\",\n      \"text\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{blog_content}{/exp:low_replace}\",\n      \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\",\n      \"image_url\": \"{if blog_image}{blog_image}{/if}\",\n      \"author\":\"{blog_author}\"\n    },\n    {/exp:channel:entries}\n]\n{if:else}\n{exp:channel:prev_entry channel=\"blog\"}\n  <? $prev_id = \"{entry_id}\"; ?>\n{/exp:channel:prev_entry}\n  <? $prev_item = (!empty($prev_id)) ? $prev_id : false; ?>\n{exp:channel:next_entry channel=\"blog\"}\n  <? $next_id = \"{entry_id}\"; ?>\n{/exp:channel:next_entry}\n  <? $next_item = (!empty($next_id)) ? $next_id : \"0\"; ?>\n{exp:channel:entries channel=\"blog\" limit=\"1\"}\n{\n  \"id\": \"{entry_id}\",\n  \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n  \"year\": \"{entry_date format=\'%Y\'}\",\n  \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n  \"related_blog_items\": [{blog_related_items backspace=\"1\"}{blog_related_items:entry_id},{/blog_related_items}],\n  \"prev_item\": \"<?=$prev_item?>\",\n  \"next_item\": \"<?=$next_item?>\",\n  \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n  \"title\": \"{title}\",\n  \"text\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{blog_content}{/exp:low_replace}\",\n  \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\",\n  \"image_url\": \"{if blog_image}{blog_image}{/if}\",\n  \"author\":\"{blog_author}\"\n}\n{/exp:channel:entries}\n{/if}\n','',1391800573,1,'n',0,'','n','y','o',0),(8,1,6,'press','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n    {exp:channel:entries channel=\"media_mentions\" backspace=\"6\"}\n    {\n      \"id\":\"{entry_id}\",\n      \"title\": \"{title}\",\n      \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n      \"year\": \"{entry_date format=\'%Y\'}\",\n      \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n      \"type\":\"{media_mention_type}\",\n      \"featured\":\"{media_mention_featured}\",\n      \"header_image_url\":\"{media_mention_splash_image}\",\n      \"logo_image_url\":\"{media_mention_icon}\",\n      \"quote\":\"{media_mention_quote}\",\n      \"call_to_action_text\":\"{media_mention_cta_text}\",\n      \"call_to_action_link\":\"{media_mention_cta_link}\",\n      \"video_link\":\"{media_mention_video_url}\"\n    },\n    {/exp:channel:entries}\n]\n{if:else}\n{exp:channel:entries channel=\"media_mentions\" limit=\"1\"}\n{\n  \"id\":\"{entry_id}\",\n  \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n  \"title\": \"{title}\",\n  \"year\": \"{entry_date format=\'%Y\'}\",\n  \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n  \"type\":\"{media_mention_type}\",\n  \"featured\":\"{media_mention_featured}\",\n  \"header_image_url\":\"{media_mention_splash_image}\",\n  \"logo_image_url\":\"{media_mention_icon}\",\n  \"quote\":\"{media_mention_quote}\",\n  \"call_to_action_text\":\"{media_mention_cta_text}\",\n  \"call_to_action_link\":\"{media_mention_cta_link}\",\n  \"video_link\":\"{media_mention_video_url}\"\n}\n{/exp:channel:entries}\n{/if}\n','',1391800610,1,'n',0,'','n','y','o',0),(9,1,6,'featured_articles','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"homepage_main_carousel\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"thumbnail_title\":\"{title}\",\n      \"thumbnail_image_url\":\"{carousel_image}\",\n      \"thumbnail_call_to_action_text\":\"{carousel_cta}\",\n      \"panel_title\":\"{carousel_panel_title}\",\n      \"panel_image_url\":\"{carousel_panel_image}\",\n      \"video_link_url\":\"{carousel_video_url}\",\n      \"panel_call_to_action_text\":\"{carousel_panel_cta}\",\n      \"panel_call_to_action_link_url\":\"{carousel_panel_link}\",\n      \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{carousel_body}{/exp:low_replace}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391043561,1,'n',0,'','n','n','o',0),(10,1,6,'program_partnerships','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{operation_change_partnerships}\n    {\n      \"id\":\"{operation_change_partnerships:row_id}\",\n      \"date\":\"{operation_change_partnerships:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{operation_change_partnerships:image}\",\n      \"thumbnail_title\":\"{operation_change_partnerships:title}\",\n      \"link_cta\":\"{operation_change_partnerships:cta}\",\n      \"link_url\":\"{operation_change_partnerships:link}\"\n    },\n    {/operation_change_partnerships}{/exp:channel:entries}\n]\n',NULL,1391210764,1,'n',0,'','n','n','o',0),(11,1,6,'program_resources','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{listen_carefully_additional_reso}\n    {\n      \"id\":\"{listen_carefully_additional_reso:row_id}\",\n      \"date\":\"{listen_carefully_additional_reso:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{listen_carefully_additional_reso:image}\",\n      \"thumbnail_title\":\"{listen_carefully_additional_reso:title}\",\n      \"link_cta\":\"{listen_carefully_additional_reso:cta}\",\n      \"link_url\":\"{listen_carefully_additional_reso:link}\"\n    },\n    {/listen_carefully_additional_reso}{/exp:channel:entries}\n]\n',NULL,1391211059,1,'n',0,'','n','n','o',0),(12,1,6,'index','y','webpage','',NULL,1391288619,1,'n',0,'','n','n','o',0),(13,1,6,'programs','n','webpage','',NULL,1391319181,1,'n',0,'','n','y','o',0),(14,1,6,'program_0','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'operation-change reveal\'>\n  <div class=\"outer-container\">\n    <h1>Operation change</h1>\n\n    {exp:hundies_shortcode}{operation_change_content}{/exp:hundies_shortcode}\n    <br/>\n    <h2>Our Partnerships</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programPartnerships\">\n      <div ng-repeat=\"article in programPartnerships\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391320660,1,'n',0,'','n','n','o',0),(15,1,6,'program_1','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'listen-carefully reveal\'>\n  <div class=\"outer-container\">\n\n    {exp:hundies_shortcode}{listen_carefully_content}{/exp:hundies_shortcode}\n\n    <br/>\n    <h2>Additional Resources</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programResources\">\n      <div ng-repeat=\"article in programResources\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391321117,1,'n',0,'','n','n','o',0),(16,1,6,'program_2','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hear-now reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hear Now</h1>\n\n    {exp:hundies_shortcode}{hear_now_content}{/exp:hundies_shortcode}\n\n    <p class=\"centered\"><a href=\"mailto:{hear_now_form_contact}\" class=\"link-with-border\">Contact us</a></p>\n\n\n    <p>{hear_now_download_copy}</p>\n\n    <div class=\"share-this-post\">\n      <ul>\n        <li><span class=\"note\">Download application</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_english}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n        <li><span class=\"note\">Descargar Solicitud</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_spanish}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n      </ul>\n    </div>\n\n    <hr class=\"separator padded\"/>\n    <br/>\n    <h1>Providers Looking to Give Back</h1>\n    <p>Help us give the gift of hearing into the lives of people in need. If you are a hearing professional, we need your help! Become a Hear Now volunteer and volunteer to fit and follow up with our Hear Now recipients. Your crucial support will help change lives forever and have a lasting impact on your community.</p>\n    <br/>\n    <hr class=\"separator padded\"/>\n    <h3><a href ng-click=\"toggle(isVisible)\" class=\"highlight\">Become a Provider</a></h3>\n    <br/>\n    <div class=\"become-a-provider-container reveal\" ng-show=\"isVisible\">\n      <br/>\n\n      {exp:freeform:form form_id=\"2\" form:id=\"become_a_provider_form\" form:class=\"flatform invert\" return=\"/#thank_you\"}\n          <ul>\n              <li class=\"leftHalf\">\n                  {freeform:field:first_name attr:placeholder=\"First Name\"}\n              </li>\n\n              <li class=\"rightHalf\">\n                  {freeform:field:last_name attr:placeholder=\"Last Name\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:practice attr:placeholder=\"Practice\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:phone attr:placeholder=\"Phone\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:fax attr:placeholder=\"FAX\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:email attr:placeholder=\"Email\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:address attr:placeholder=\"Address\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:city attr:placeholder=\"City\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:state attr:placeholder=\"State\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:zip attr:placeholder=\"Zip\"}\n              </li>\n\n              <li class=\"full\">\n                <br/>\n                  {freeform:submit attr:id=\"become_a_provider_submit\"}\n              </li>\n          </ul>\n\n      {/exp:freeform:form}\n    </div>\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322627,1,'n',0,'','n','n','o',0),(17,1,6,'program_3','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hearing-aid-recycling reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hearing Aid Recycling</h1>\n\n    {exp:hundies_shortcode}{hearing_aid_recycling_content}{/exp:hundies_shortcode}\n\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322745,1,'n',0,'','n','n','o',0),(18,1,6,'press_releases','y','webpage','{exp:http_header content_type=\"application/json\"}{\n{exp:channel:entries channel=\"press_releases\" limit=\"1\"}\n    \"id\":\"{entry_id}\",\n    \"title\": \"{title}\",\n    \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n    \"year\": \"{entry_date format=\'%Y\'}\",\n    \"type\":\"press_release\",\n    \"press_release_source\": \"{press_release_source}\",\n    \"press_release_pdf_download\": \"{press_release_pdf_download}\",\n    \"press_release_contact\": \"{press_release_contact}\",\n    \"body\": \"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{press_release_body_text}{/exp:low_replace}\"\n{/exp:channel:entries}\n}\n',NULL,1391810580,1,'n',0,'','n','n','o',0),(19,1,6,'media_mentions','y','webpage','{exp:http_header content_type=\"application/json\"}{\n{exp:channel:entries channel=\"media_mentions\" limit=\"1\"}\n    \"id\":\"{item_id}\",\n    \"title\": \"{title}\",\n    \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n    \"year\": \"{entry_date format=\'%Y\'}\",\n    \"type\":\"media_mention\",\n    \"featured\":\"{media_mention_feature_carousel}\",\n    \"header_image_url\":\"{media_mention_image}\",\n    \"logo_image_url\":\"{media_mention_logo}\",\n    \"quote\":\"{media_mention_quote}\",\n    \"call_to_action_text\":\"{media_mention_cta_text}\",\n    \"call_to_action_link\":\"{media_mention_cta_link}\",\n    \"video_link\":\"{media_mention_video_url}\",\n    \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{media_mention_body_text}{/exp:low_replace}\"\n{/exp:channel:entries}\n}','',1392157548,1,'n',0,'','n','n','o',0),(20,1,7,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n\n  <head>\n  <meta charset=\"utf-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <title>Starkey Hearing Foundation</title>\n  <meta name=\"description\" content=\"\">\n  <meta name=\"viewport\" content=\"width=device-width\">\n  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n  \n  <link rel=\"stylesheet\" href=\"assets/styles/7cb3a6d9.main.css\"/>\n  \n  </head>\n  <body class=\'hearing-missions-page page\' ng:app=\"missionsPageApp\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n        <a href=\"/\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n        </a>\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n\n              <a href=\"{path=\'missions/index\'}\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n    <div ng-view></div>\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/a332a0e7.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/36fe27b7.main.js\"></script>\n    \n    <script src=\"/assets/scripts/f7bcce96.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1392253615,1,'n',0,'','n','n','o',0),(21,1,6,'missions_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"continents\": [\n      {exp:channel:entries channel=\"mission_markers\" dynamic=\"no\" backspace=\"8\" orderby=\"mm_order\" sort=\"asc\"}\n      {\n         \"name\": \"{exp:mah_eencode decode=\"yes\"}{title}{/exp:mah_eencode}\",\n         \"total_hearing_aids_provided\": \"{total_hearing_aids_provided}\",\n         \"countries_visited\": [\n            {countries_visited}\n            {\n               \"name\": \"{countries_visited:name}\",\n               \"abbreviation\": \"{countries_visited:abbreviation}\",\n               \"total_hearing_aids_provided\": \"{countries_visited:hearing_aids}\"\n            }{if countries_visited:count != countries_visited:total_rows},{/if}\n            {/countries_visited}\n         ]\n      },\n      {/exp:channel:entries}\n   ]\n}',NULL,1392344254,1,'n',0,'','n','n','o',0),(24,1,6,'article','y','webpage','<detail-page\n{exp:channel:entries channel=\"blog\" dynamic=\"no\" url_title=\"{segment_3}\" limit=\"1\"}\n  detail-page-type=\"blog\"\n  date=\"{blog_date format=\'%M %d, %Y\'}\"\n  author=\"{blog_author}\"\n  category=\"{blog_category}\"\n  title=\"{title}\"\n  subhead=\"\"\n  body=\'{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}\'\n  header-image-url=\"{blog_image}\"\n  thumbnail-image-url=\"\"\n  share-this=\"false\"\n  has-related-posts=\"false\"\n{/exp:channel:entries}\n  previous-page-id=\"{exp:channel:prev_entry channel=\'blog\' url_title=\'{segment_3}\'}{url_title}{/exp:channel:prev_entry}\"\n  next-page-id=\"{exp:channel:next_entry channel=\'blog\' url_title=\'{segment_3}\'}{url_title}{/exp:channel:next_entry}\"\n  >\n</detail-page>\n\n<!-- <div class=\"article-header-image\">\n  <div class=\"image\" style=\"background-image: url(\'{blog_image}\');\">\n    <ul class=\"page-nav-links\">\n      <li>\n        <a href=\"#/articles/\" ng-disabled=\"currentPosition == article.prev_item\">&larr;</a>\n      </li>\n      <li>\n        <a href=\"#/articles/\" ng-disabled=\"currentPosition == article.next_item\" >&rarr;</a>\n      </li>\n      <li>\n        <a href=\"#\">X</a>\n      </li>\n    </ul>\n    <div class=\"gradient-background\"></div>\n    <div class=\"outer-container\">\n      <div class=\"relative-container\">\n        <div class=\"banner\">\n          {if blog_category}\n            <p class=\"article-item-category\">{blog_category}</p>\n          {/if}\n          <h1  class=\"article-title\">{title}</h1>\n          <p>{entry_date format=\'%M %d, %Y\'} | {blog_author}</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<br/>\n<div class=\"text-container\">\n{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}\n</div>\n<div class=\"outer-container\">\n  <div class=\"share-this-post\">\n    <ul>\n      <li><span class=\"note\">Share this post</span></li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-twitter\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-fb\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-email\"></span>\n        </a>\n      </li>\n    </ul>\n  </div>\n</div>\n<br/>\n<div class=\"outer-container\">\n  <h3 class=\"section-title centered\">Related posts</h3>\n  <section class=\'carousel\'>\n    <thumblist-nav>\n      <div ng-repeat=\"article in articles\">\n        <slide\n          thumblist=\"true\"\n          image-url=\"\"\n          video-url=\"\"\n          link-url=\"#/articles/\"\n          headline=\"\"\n          link-style=\"\"\n          date=\"\"\n        ></slide>\n      </div>\n    </thumblist-nav>\n  </section>\n</div>\n<br/>\n<hr class=\"separator padded\"/>\n\n<div class=\"outer-container\">\n  <div class=\"pagination\">\n    <ul>\n      <li ng-class=\"{disabled: currentPage == 0}\">\n        <a href ng-disabled=\"currentPage == 0\" ng-click=\"currentPage=currentPage-1\">Prev</a>\n      </li>\n      <li ng-class=\"{disabled: currentPage >= articles.length/pageSize - 1}\">\n        <a href ng-click=\"currentPage=currentPage+1\">Next</a>\n      </li>\n    </ul>\n  </div>\n  <ul class=\"pagination-articles\">\n    <li ng-repeat=\"article in articles | startFrom:currentPage*pageSize | limitTo:pageSize\">\n      <div class=\'block\'>\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <h2 class=\"headline\"></h2>\n        <p class=\'read-more\'><a href=\"#/articles/\">Read more &rarr;</a></p>\n      </div>\n    </li>\n  </ul>\n</div>\n -->\n',NULL,1392431907,1,'n',0,'','n','n','o',0),(22,1,6,'missions','y','webpage','{exp:http_header content_type=\"application/json\"}\n{if segment_3 == \"index\" OR segment_3 == \"\"}\n[\n  {\n    \"id\": \"1\",\n    \"date\": \"February 13, 2014\",\n    \"featured\": \"true\",\n    \"title\": \"An Unstoppable Spirit\",\n    \"body\": \"Like a typical 9-year-old girl, Maci Rowan loves the band One Direction and will proudly proclaim to anyone listening that her favorite song is&nbsp;What Makes You Beautiful. However, Maci is anything but typical. Born with cerebral palsy, she has had to overcome some significant physical obstacles in her short life. These obstacles became even more daunting last year when she began to suffer hearing loss.</p>  <p>Despite her hearing loss, Maci continued to seek out ways to connect to the world and outlets for her jubilant energy and desire to learn. Unfortunately, Maci’s normally excellent grades began to fall, and her frustration with not doing well in school and inability to connect with her peers and teachers, caused her to act out in class.&nbsp; At home, she turned to her dolls for company and connection. Her mother Christy became increasingly concerned over Maci’s retreat into isolation. She recognized that hearing loss was to blame and reached out to Starkey Hearing Foundation for help.</p> <p>When Maci came to see us in New Orleans, her smile lit up the room, and her laughter was contagious. We had invited Maci to our Friday mission in partnership with Garth Brooks’ Super ProCamps, so that she could not only receive the gift of hearing but also participate in all the fun activities for the children. We watched in amazement as NFL stars were drawn to her boundless joy and curiosity. The Foundation team and our celebrity volunteers just couldn’t get enough of Maci. &nbsp;Explaining her daughter’s unique spirit, Christy said with a smile, “She has always been this way. Once she gets you wrapped around her finger, you’re lost. You have no chance of disciplining her.”</p>  <p>By the time she sat in Bill Austin’s chair to receive the gift of hearing, Maci had not heard her own voice in months, but once she was fit, she beamed her irrepressible light and cried out, “Oh! I can talk again!”</p>  <p>Able to confidently connect with the world again, Maci immediately joined the kids participating in the ProCamps cheerleading activities and won the “Champion of the Day” award. We know that with the gift of hearing this amazing girl will continue winning and inspire many more hearts and minds.</p>\",\n    \"thumbnail_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"header_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"author\": \"SHF Team\",\n    \"mission_item_category\": \"Africa\"\n  }\n]\n{if:else}\n{\n  {\n    \"id\": \"1\",\n    \"date\": \"February 13, 2014\",\n    \"featured\": \"true\",\n    \"title\": \"An Unstoppable Spirit\",\n    \"body\": \"Like a typical 9-year-old girl, Maci Rowan loves the band One Direction and will proudly proclaim to anyone listening that her favorite song is&nbsp;What Makes You Beautiful. However, Maci is anything but typical. Born with cerebral palsy, she has had to overcome some significant physical obstacles in her short life. These obstacles became even more daunting last year when she began to suffer hearing loss.</p>  <p>Despite her hearing loss, Maci continued to seek out ways to connect to the world and outlets for her jubilant energy and desire to learn. Unfortunately, Maci’s normally excellent grades began to fall, and her frustration with not doing well in school and inability to connect with her peers and teachers, caused her to act out in class.&nbsp; At home, she turned to her dolls for company and connection. Her mother Christy became increasingly concerned over Maci’s retreat into isolation. She recognized that hearing loss was to blame and reached out to Starkey Hearing Foundation for help.</p> <p>When Maci came to see us in New Orleans, her smile lit up the room, and her laughter was contagious. We had invited Maci to our Friday mission in partnership with Garth Brooks’ Super ProCamps, so that she could not only receive the gift of hearing but also participate in all the fun activities for the children. We watched in amazement as NFL stars were drawn to her boundless joy and curiosity. The Foundation team and our celebrity volunteers just couldn’t get enough of Maci. &nbsp;Explaining her daughter’s unique spirit, Christy said with a smile, “She has always been this way. Once she gets you wrapped around her finger, you’re lost. You have no chance of disciplining her.”</p>  <p>By the time she sat in Bill Austin’s chair to receive the gift of hearing, Maci had not heard her own voice in months, but once she was fit, she beamed her irrepressible light and cried out, “Oh! I can talk again!”</p>  <p>Able to confidently connect with the world again, Maci immediately joined the kids participating in the ProCamps cheerleading activities and won the “Champion of the Day” award. We know that with the gift of hearing this amazing girl will continue winning and inspire many more hearts and minds.</p>\",\n    \"thumbnail_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"header_image_url\": \"http://starkey.ahundredyears.com/uploads/images/BLOG-Unstoppable_Spirit_LEAD.jpg\",\n    \"author\": \"SHF Team\",\n    \"mission_item_category\": \"Africa\"\n  }\n{/if}\n',NULL,1392329491,1,'n',0,'','n','n','o',0),(23,1,6,'articles','y','webpage','{exp:channel:entries channel=\"blog\" limit=\"1\"}\n<div class=\"article-header-image\">\n  <div class=\"image\" style=\"background-image: url(\'{blog_image}\');\">\n    <ul class=\"page-nav-links\">\n      <li>\n        <a href=\"#/articles/\" ng-disabled=\"currentPosition == article.prev_item\">&larr;</a>\n      </li>\n      <li>\n        <a href=\"#/articles/\" ng-disabled=\"currentPosition == article.next_item\" >&rarr;</a>\n      </li>\n      <li>\n        <a href=\"#\">X</a>\n      </li>\n    </ul>\n    <div class=\"gradient-background\"></div>\n    <div class=\"outer-container\">\n      <div class=\"relative-container\">\n        <div class=\"banner\">\n          {if blog_category}\n            <p class=\"article-item-category\">{blog_category}</p>\n          {/if}\n          <h1  class=\"article-title\">{title}</h1>\n          <p>{{parseDate({entry_date format=\'%m %d %Y\'}) | date:\"MMMM d yyyy\"}} | {blog_author}</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<br/>\n\n{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}\n\n<div class=\"outer-container\">\n  <div class=\"share-this-post\">\n    <ul>\n      <li><span class=\"note\">Share this post</span></li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-twitter\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-fb\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-email\"></span>\n        </a>\n      </li>\n    </ul>\n  </div>\n\n</div>\n<br/>\n{/exp:channel:entries}\n',NULL,1392339200,1,'n',0,'','n','n','o',0),(25,1,6,'missions_detail','y','webpage','{exp:channel:next_entry url_title=\"{segment_3}\"}\n   {exp:stash:set_value parse_tags=\"yes\" name=\"next_entry\" value=\"{url_title}\"}\n{/exp:channel:next_entry}\n\n{exp:channel:prev_entry url_title=\"{segment_3}\"}\n    {exp:stash:set_value parse_tags=\"yes\" name=\"prev_entry\" value=\"{url_title}\"}\n{/exp:channel:prev_entry}\n\n{exp:channel:entries channel=\"hearing_missions\" dynamic=\"no\" limit=\"1\"}\n<div class=\"article-header-image\">\n  <div class=\"image\" style=\"background-image:url(\'{mission_image:url}\');\">\n    <ul class=\"page-nav-links\">\n      <li>\n        <a href=\"#/missions/{exp:stash:prev_entry}\" ng-disabled=\"currentPosition == article.prev_item\">&larr;</a>\n      </li>\n      <li>\n        <a href=\"#/missions/{exp:stash:next_entry}\" ng-disabled=\"currentPosition == article.next_item\" >&rarr;</a>\n      </li>\n      <li>\n        <a href=\"#\">X</a>\n      </li>\n    </ul>\n    <div class=\"gradient-background\"></div>\n    <div class=\"outer-container\">\n      <div class=\"relative-container\">\n        <div class=\"banner\">\n          <p class=\"article-item-category\">{categories show_group=\"1\"}{category_name}{/categories}</p>\n          <h1  class=\"article-title\">{title}</h1>\n          <p>{entry_date format=\"%F %d, %Y\"} | {author}</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n\n<br/>\n\n<div class=\"text-container\">\n{exp:hundies_shortcode}{mission_content}{/exp:hundies_shortcode}\n</div>\n\n\n<br/>\n<div class=\"outer-container\">\n\n  <div class=\"share-this-post\">\n    <ul>\n      <li><span class=\"note\">Share this post</span></li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-twitter\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-fb\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-email\"></span>\n        </a>\n      </li>\n    </ul>\n  </div>\n\n  <h3 class=\"section-title centered\">Related posts</h3>\n  <section class=\'carousel\'>\n    <thumblist-nav>\n      {mission_rel}\n      <div>\n        <slide\n          thumblist=\"true\"\n          image-url=\"{mission_rel:mission_thumb_image:url}\"\n          video-url=\"\"\n          link-url=\"#/missions/{url_title}\"\n          headline=\"{title}\"\n          link-style=\"\"\n          date=\"{entry_date format=\'%F %d, %Y\'}\"\n        ></slide>\n      </div>\n      {/mission_rel}\n    </thumblist-nav>\n  </section>\n</div>\n<br/>\n{/exp:channel:entries}',NULL,1392516106,1,'n',0,'','n','n','o',0),(26,1,6,'blog_detail','y','webpage','{exp:channel:next_entry channel=\"blog\" url_title=\"{segment_3}\"}\n   {exp:stash:set_value parse_tags=\"yes\" name=\"next_entry\" value=\"{url_title}\"}\n{/exp:channel:next_entry}\n\n{exp:channel:prev_entry channel=\"blog\" url_title=\"{segment_3}\"}\n    {exp:stash:set_value parse_tags=\"yes\" name=\"prev_entry\" value=\"{url_title}\"}\n{/exp:channel:prev_entry}\n\n{exp:channel:entries channel=\"blog\" dynamic=\"no\" url_title=\"{segment_3}\" limit=\"1\"}\n<div class=\"article-header-image\">\n  <div class=\"image\" style=\"background-image: url(\'{blog_image}\');\">\n    <ul class=\"page-nav-links\">\n      {if {exp:stash:not_empty name=\"next_entry\"} }\n      <li>\n        <a href=\"#/articles/{exp:stash:next_entry}\" ng-disabled=\"currentPosition == article.next_item\">&larr;</a>\n      </li>\n      {/if}\n      {if {exp:stash:not_empty name=\"prev_entry\"} }\n      <li>\n        <a href=\"#/articles/{exp:stash:prev_entry}\" ng-disabled=\"currentPosition == article.prev_item\" >&rarr;</a>\n      </li>\n      {/if}\n      <li>\n        <a href=\"#\">X</a>\n      </li>\n    </ul>\n    <div class=\"gradient-background\"></div>\n    <div class=\"outer-container\">\n      <div class=\"relative-container\">\n        <div class=\"banner\">\n          {if blog_category}\n            <p class=\"article-item-category\">{blog_category}</p>\n          {/if}\n          <h1  class=\"article-title\">{title}</h1>\n          <p>{entry_date format=\'%M %d, %Y\'} | {blog_author}</p>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<br/>\n<div class=\"text-container\">\n{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}\n</div>\n<div class=\"outer-container\">\n  <div class=\"share-this-post\">\n    <ul>\n      <li><span class=\"note\">Share this post</span></li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-twitter\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-fb\"></span>\n        </a>\n      </li>\n      <li>\n        <a href=\"#\">\n          <span class=\"icon starkey-share-email\"></span>\n        </a>\n      </li>\n    </ul>\n  </div>\n</div>\n<br/>\n<div class=\"outer-container\">\n  <h3 class=\"section-title centered\">Related posts</h3>\n  <section class=\'carousel\'>\n    <thumblist-nav>\n      <div ng-repeat=\"article in articles\">\n        <slide\n          thumblist=\"true\"\n          image-url=\"\"\n          video-url=\"\"\n          link-url=\"#/articles/\"\n          headline=\"\"\n          link-style=\"\"\n          date=\"\"\n        ></slide>\n      </div>\n    </thumblist-nav>\n  </section>\n</div>\n<br/>\n<hr class=\"separator padded\"/>\n\n<div class=\"outer-container\">\n  <div class=\"pagination\">\n    <ul>\n      <li ng-class=\"{disabled: currentPage == 0}\">\n        <a href ng-disabled=\"currentPage == 0\" ng-click=\"currentPage=currentPage-1\">Prev</a>\n      </li>\n      <li ng-class=\"{disabled: currentPage >= articles.length/pageSize - 1}\">\n        <a href ng-click=\"currentPage=currentPage+1\">Next</a>\n      </li>\n    </ul>\n  </div>\n  <ul class=\"pagination-articles\">\n    <li ng-repeat=\"article in articles | startFrom:currentPage*pageSize | limitTo:pageSize\">\n      <div class=\'block\'>\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <h2 class=\"headline\"></h2>\n        <p class=\'read-more\'><a href=\"#/articles/\">Read more &rarr;</a></p>\n      </div>\n    </li>\n  </ul>\n</div>\n{/exp:channel:entries}',NULL,1392613594,1,'n',0,'','n','n','o',0),(27,1,6,'missions_page','y','webpage','{exp:http_header content_type=\"application/json\"}{exp:channel:entries channel=\"hearing_landing\" dynamic=\"no\" limit=\"1\"}\n[\n  {\n    \"page_title\" : \"{title}\",\n    \"page_lead\" : \"{hm_lead}\",\n    \"hearing_mission_statistics\" : [\n    {hearing_mission_statistics}\n        {\n            \"name\": \"{hearing_mission_statistics:number}\",\n            \"tagline\": \"{hearing_mission_statistics:tagline}\"\n        }{if hearing_mission_statistics:count != hearing_mission_statistics:total_rows},{/if}\n    {/hearing_mission_statistics}\n    ],\n    \"content_tabs\" : [\n    {content_tabs}\n        {\n            \"tab_title\" : \"{content_tabs:tab_title}\",\n            \"content_title\" : \"{content_tabs:tab_content_title}\",\n            \"content\" : \"{content_tabs:tab_content}\",\n            <!-- TODO FOR KARA -->\n            \"thumbnail_image_url\" : \"\"\n            <!-- \"{content_tabs:thumbnail_image_url}\" -->\n        }{if content_tabs:count != content_tabs:total_rows},{/if}\n    {/content_tabs}\n    ],\n    \"highlights\" : [\n    {mission_highlights limit=\"10\"}\n        <!-- KARA: see missions_highlights.tpl -->\n        {\n            \"id\"        : \"{url_title}\",\n            \"title\"     : \"{title}\",\n            \"subtitle\"  : \"{mission_highlights:mission_subtitle}\",\n            \"excerpt\"   : \"{mission_highlights:mission_excerpt}\",\n            \"image\"     : \"{mission_highlights:mission_image:url}\",\n            \"video\"     : \"{mission_highlights:mission_video_url}\"\n        }{if mission_highlights:count != mission_highlights:total_results}{/if}\n    {/mission_highlights}\n    ]\n  }\n]\n{/exp:channel:entries}',NULL,1392668337,1,'n',0,'','n','n','o',0),(28,1,6,'missions_highlights','y','webpage','[\n  {\n    \"id\"        : \"url_title\",\n    \"title\"     : \"title\",\n    \"subtitle\"  : \"mission_subtitle\",\n    \"excerpt\"   : \"mission_excerpt\",\n    \"image\"     : \"mission_image:url\",\n    \"video\"     : \"mission_video_url\",\n    \"category_name\": \"\",\n    \"featured\": \"\",\n    \"thumbnail_image_url\": \"\",\n    \"header_image_url\": \"\",\n    \"date\": \"\",\n    \"year\": \"\",\n    \"region\": \"\",\n    \"country\":\"\"\n  }\n]',NULL,1392668636,1,'n',0,'','n','n','o',0),(29,1,8,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n\n  <head>\n  <meta charset=\"utf-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <title>Starkey Hearing Foundation</title>\n  <meta name=\"description\" content=\"\">\n  <meta name=\"viewport\" content=\"width=device-width\">\n  <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n  \n  <link rel=\"stylesheet\" href=\"assets/styles/3d8399a4.main.css\"/>\n  \n  </head>\n  <body class=\'gala-page page\' ng:app=\"galaPageApp\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n        <a href=\"/\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n        </a>\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n\n              <a href=\"{path=\'missions/index\'}\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'gala/index\'}\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n    <!--  {exp:channel:entries channel=\"gala\" limit=\"1\"} -->\n    <!-- {/exp:channel:entries} -->\n      <section class=\'page-leader\'>\n      <h1>\n        Gala\n      </h1>\n    </section>\n\n    <div ng:controller=\"GalaCtrl\">\n      <div class=\"outer-container\">\n        <section class=\'tabbed-content\'>\n          <nav class=\"outer-container\">\n              <ul class=\'two-tabs\'>\n                  \n                  <li ng-class=\"{active: currentTab.tabId==\'overview\'}\">\n                    <a href=\'#/gala/overview\'>Overview</a>\n                  </li>\n                  <li class=\"last\" ng-class=\"{active: currentTab.tabId==\'upcoming\'}\">\n                    <a href=\'#/gala/upcoming\'>Upcoming</a>\n                  </li>\n\n                </ul>\n            </nav>\n          </section>\n        </div>\n      <div class=\"gala-section\">\n        <div ng-view></div>\n      </div>\n      <section class=\'page-leader\'>\n        <h1>\n          Through the years\n        </h1>\n      </section>\n        <gala-thumblist-nav items=\"timelineItems\"></gala-thumblist-nav>\n    </div>\n\n\n    <br/>\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/a332a0e7.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/0f5d7572.main.js\"></script>\n    \n    <script src=\"/assets/scripts/f7bcce96.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1392696546,1,'n',0,'','n','n','o',0),(30,1,6,'gala_overview','y','webpage','<!-- {exp:channel:entries channel=\"programs\" limit=\"1\"} -->\n<article class=\'outer-container\'>\n  <section class=\"carousel\">\n    <swiper\n      continuous=\"true\"\n      speed=\"2000\"\n      identifier=\"swiper_1\"\n      auto=\"8000\"\n      paginator=\"true\"\n      tall=\"false\"\n      >\n        <!-- Kara: EE populates these slides -->\n        <slide\n          image-url=\'\'\n          background-color=\"\"\n          quote=\"\"\n          video-url=\"\"\n          link-url=\"\"\n          headline=\"\"\n          body-copy=\"\"\n          logo-image-url=\"\"\n          link-style=\"\"\n          link-text=\"\"\n        >\n        </slide>\n    </swiper>\n  </section>\n  <h1>{headline}</h1>\n  <p>{body}</p>\n\n  <hr class=\"separator\"/>\n  <!-- Kara: EE populates these articles -->\n  <article>\n    <div class=\"image\" style=\"background-image: url(\'{thumbnail_image_url}\');background-size: cover;\">\n    </div>\n    <div class=\"content\">\n      <h1>{title}</h1>\n      {content}\n      <p class=\"call-toaction\">\n        <a href=\"{call_to_action_url}\">{call_to_action_text}</a>\n      </p>\n    </div>\n  </article>\n\n</article>\n<!-- {/exp:channel:entries}',NULL,1392696547,1,'n',0,'','n','n','o',0),(31,1,6,'gala_upcoming','y','webpage','<!-- {exp:channel:entries channel=\"programs\" limit=\"1\"} -->\n<article class=\'outer-container\'>\n  <h1>Gala upcoming page</h1>\n  <!-- {exp:hundies_shortcode}{gala_upcoming}{/exp:hundies_shortcode} -->\n  <!-- Content here is a single instance of the gala_item.tpl template  -->\n</article>\n<!-- {/exp:channel:entries}',NULL,1392696553,1,'n',0,'','n','n','o',0),(32,1,6,'gala_items','y','webpage','[\n  {\n    \"id\": \"some-timeline-item-url\",\n    \"thumbnail_image_url\":\"\",\n    \"year\": \"\"\n  }\n]',NULL,1392830493,1,'n',0,'','n','n','o',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_wygwam_configs`
--

LOCK TABLES `exp_wygwam_configs` WRITE;
/*!40000 ALTER TABLE `exp_wygwam_configs` DISABLE KEYS */;
INSERT INTO `exp_wygwam_configs` VALUES (1,'Basic','YTo3OntzOjc6InRvb2xiYXIiO2E6ODp7aTowO3M6NDoiQm9sZCI7aToxO3M6NjoiSXRhbGljIjtpOjI7czo5OiJVbmRlcmxpbmUiO2k6MztzOjEyOiJOdW1iZXJlZExpc3QiO2k6NDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NTtzOjQ6IkxpbmsiO2k6NjtzOjY6IlVubGluayI7aTo3O3M6NjoiQW5jaG9yIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czo5OiJwYXJzZV9jc3MiO2I6MDtzOjEzOiJyZXN0cmljdF9odG1sIjtzOjE6InkiO3M6MTA6InVwbG9hZF9kaXIiO3M6MDoiIjt9'),(2,'Full','YTo3OntzOjc6InRvb2xiYXIiO2E6Mjk6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6MzoiQ3V0IjtpOjI7czo0OiJDb3B5IjtpOjM7czo1OiJQYXN0ZSI7aTo0O3M6OToiUGFzdGVUZXh0IjtpOjU7czoxMzoiUGFzdGVGcm9tV29yZCI7aTo2O3M6NDoiVW5kbyI7aTo3O3M6NDoiUmVkbyI7aTo4O3M6NToiU2NheXQiO2k6OTtzOjQ6IkJvbGQiO2k6MTA7czo2OiJJdGFsaWMiO2k6MTE7czo2OiJTdHJpa2UiO2k6MTI7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjEzO3M6MTI6Ik51bWJlcmVkTGlzdCI7aToxNDtzOjEyOiJCdWxsZXRlZExpc3QiO2k6MTU7czo3OiJPdXRkZW50IjtpOjE2O3M6NjoiSW5kZW50IjtpOjE3O3M6MTA6IkJsb2NrcXVvdGUiO2k6MTg7czo0OiJMaW5rIjtpOjE5O3M6NjoiVW5saW5rIjtpOjIwO3M6NjoiQW5jaG9yIjtpOjIxO3M6NToiSW1hZ2UiO2k6MjI7czo1OiJUYWJsZSI7aToyMztzOjE0OiJIb3Jpem9udGFsUnVsZSI7aToyNDtzOjExOiJTcGVjaWFsQ2hhciI7aToyNTtzOjg6IlJlYWRNb3JlIjtpOjI2O3M6NjoiU3R5bGVzIjtpOjI3O3M6NjoiRm9ybWF0IjtpOjI4O3M6ODoiTWF4aW1pemUiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjk6InBhcnNlX2NzcyI7YjowO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7czoxMDoidXBsb2FkX2RpciI7czowOiIiO30='),(3,'Typography','YTo2OntzOjc6InRvb2xiYXIiO2E6MTM6e2k6MDtzOjY6IkZvcm1hdCI7aToxO3M6NDoiQm9sZCI7aToyO3M6NjoiSXRhbGljIjtpOjM7czo5OiJVbmRlcmxpbmUiO2k6NDtzOjEyOiJOdW1iZXJlZExpc3QiO2k6NTtzOjEyOiJCdWxsZXRlZExpc3QiO2k6NjtzOjk6IlN1YnNjcmlwdCI7aTo3O3M6MTE6IlN1cGVyc2NyaXB0IjtpOjg7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjk7czo0OiJMaW5rIjtpOjEwO3M6NjoiVW5saW5rIjtpOjExO3M6NjoiQW5jaG9yIjtpOjEyO3M6MTA6IkJsb2NrcXVvdGUiO31zOjY6ImhlaWdodCI7czozOiIyMDAiO3M6MTQ6InJlc2l6ZV9lbmFibGVkIjtzOjE6InkiO3M6MTE6ImNvbnRlbnRzQ3NzIjthOjA6e31zOjEwOiJ1cGxvYWRfZGlyIjtzOjA6IiI7czoxMzoicmVzdHJpY3RfaHRtbCI7czoxOiJ5Ijt9'),(4,'Galla Panel','YTo2OntzOjc6InRvb2xiYXIiO2E6MjQ6e2k6MDtzOjY6IlNvdXJjZSI7aToxO3M6OToiVGVtcGxhdGVzIjtpOjI7czo2OiJGb3JtYXQiO2k6MztzOjQ6IkJvbGQiO2k6NDtzOjY6Ikl0YWxpYyI7aTo1O3M6OToiVW5kZXJsaW5lIjtpOjY7czoxMToiSnVzdGlmeUxlZnQiO2k6NztzOjEzOiJKdXN0aWZ5Q2VudGVyIjtpOjg7czoxMjoiSnVzdGlmeVJpZ2h0IjtpOjk7czoxMjoiSnVzdGlmeUJsb2NrIjtpOjEwO3M6MTI6Ik51bWJlcmVkTGlzdCI7aToxMTtzOjEyOiJCdWxsZXRlZExpc3QiO2k6MTI7czo5OiJTdWJzY3JpcHQiO2k6MTM7czoxMToiU3VwZXJzY3JpcHQiO2k6MTQ7czoxMjoiUmVtb3ZlRm9ybWF0IjtpOjE1O3M6NDoiTGluayI7aToxNjtzOjY6IlVubGluayI7aToxNztzOjY6IkFuY2hvciI7aToxODtzOjEwOiJCbG9ja3F1b3RlIjtpOjE5O3M6NToiSW1hZ2UiO2k6MjA7czo1OiJUYWJsZSI7aToyMTtzOjE0OiJIb3Jpem9udGFsUnVsZSI7aToyMjtzOjExOiJTcGVjaWFsQ2hhciI7aToyMztzOjEwOiJNZWRpYUVtYmVkIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjE0OiJyZXNpemVfZW5hYmxlZCI7czoxOiJ5IjtzOjExOiJjb250ZW50c0NzcyI7YTowOnt9czoxMDoidXBsb2FkX2RpciI7czowOiIiO3M6MTM6InJlc3RyaWN0X2h0bWwiO3M6MToieSI7fQ==');
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

-- Dump completed on 2014-02-21 17:41:20
