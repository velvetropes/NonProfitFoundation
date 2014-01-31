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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Comment','insert_new_comment',0),(2,'Comment_mcp','delete_comment_notification',0),(3,'Comment','comment_subscribe',0),(4,'Comment','edit_comment',0),(5,'Email','send_email',0),(6,'Search','do_search',0),(7,'Channel','submit_entry',0),(8,'Channel','filemanager_endpoint',0),(9,'Channel','smiley_pop',0),(10,'Channel','combo_loader',0),(11,'Member','registration_form',0),(12,'Member','register_member',0),(13,'Member','activate_member',0),(14,'Member','member_login',0),(15,'Member','member_logout',0),(16,'Member','send_reset_token',0),(17,'Member','process_reset_password',0),(18,'Member','send_member_email',0),(19,'Member','update_un_pw',0),(20,'Member','member_search',0),(21,'Member','member_delete',0),(22,'Rte','get_js',0),(23,'Freeform','save_form',0);
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
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
  `field_id_10` text,
  `field_ft_10` tinytext,
  `field_id_11` text,
  `field_ft_11` tinytext,
  `field_id_12` text,
  `field_ft_12` tinytext,
  `field_id_13` text,
  `field_ft_13` tinytext,
  `field_id_14` int(10) DEFAULT '0',
  `field_dt_14` varchar(50) DEFAULT NULL,
  `field_ft_14` tinytext,
  `field_id_15` text,
  `field_ft_15` tinytext,
  `field_id_16` text,
  `field_ft_16` tinytext,
  `field_id_17` text,
  `field_ft_17` tinytext,
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
  `field_id_50` text,
  `field_ft_50` tinytext,
  `field_id_51` text,
  `field_ft_51` tinytext,
  `field_id_52` text,
  `field_ft_52` tinytext,
  `field_id_53` text,
  `field_ft_53` tinytext,
  `field_id_54` text,
  `field_ft_54` tinytext,
  `field_id_55` text,
  `field_ft_55` tinytext,
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
INSERT INTO `exp_channel_data` VALUES (2,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','Press Release','none',1376031600,'','none','','none','','none','<b>FOR IMMEDIATE RELEASE</b>\n\n <h1><b>PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE STARKEY HEARING FOUNDATION’S GLOBAL FIGHT AGAINST HEARING LOSS</b></h1>\n\n <h2><i>The former president helps provide the gift of hearing in Zambia and Rwanda.</i></h2>\n\n MINNEAPOLIS (August 9, 2013) – Earlier this week, during his ten-day Africa trip, former President Bill Clinton and Chelsea Clinton joined Starkey Hearing Foundation’s team of hearing professionals to give customized hearing devices to more than 375 people in Livingstone, Zambia and Kigali, Rwanda. They made the stops to see the progress the Foundation is making on its Clinton Global Initiative Commitment to Action of providing 1 million hearing aids to people in need this decade.&nbsp; Currently, Starkey Hearing Foundation is nearly 40 percent ahead of schedule on its commitment, and in the past year alone, the Foundation has fitted more than 165,000 hearing aids worldwide.\n\n “Starkey Hearing Foundation is empowering people around the world to achieve a better life through the gift of hearing,” said President Clinton. “Chelsea and I were honored, as we always are, to help the great Starkey staff fit people, many of whom had never heard before, for hearing aids.”\n\n President Clinton and Chelsea Clinton personally fitted patients with new hearing aids in both Zambia and Rwanda. President Clinton&nbsp;has spoken&nbsp;at Starkey’s annual&nbsp;<i>So the World May Hear</i>&nbsp;Awards Gala for the last four years, including most recently on July 28, in St. Paul, Minn. This was his third time volunteering&nbsp;on&nbsp;a mission. He joined the Foundation in Colombia and Uganda in 2012.\n\n Hearing loss is a global epidemic, with disabling hearing loss impacting more than 360 million people worldwide, according to the World Health Organization. Yet with the help of a hearing device, hearing loss can often be corrected in many cases, giving an individual the opportunity to better connect with family, the community and the world around them.\n\n “Hearing&nbsp;is the basis for communication and human connection. It opens doors and gives individuals the power to seize opportunities and reach their full potential in life,” said Bill Austin, founder of Starkey Hearing Foundation. “The support we received from President Clinton and the Clinton Global Initiative has enabled us to build vital partnerships and touch more lives than we ever thought possible.”\n\n Mission partners Global Health Corps and Bridge2Rwanda also worked with Starkey Hearing Foundation in Rwanda. Actors Jesse Eisenberg and Dakota Fanning joined the team in Zambia.\n\n In between missions in Zambia and Rwanda, Starkey Hearing Foundation, along with Tanzanian-born Hasheem Thabeet, of the NBA’s Oklahoma City Thunder, made an additional stop in Tanzania to give the gift of hearing to more than 200 people in need.\n\n Starkey Hearing Foundation&nbsp;uses hearing as a vehicle to improve the lives of individuals around the world. Its work in Zambia, Rwanda and Tanzania is part of the dozens of domestic and international missions conducted each year. The foundation fits more than 100,000 hearing aids to people in need annually and has pledged to fit one million hearing aids this decade.\n\n More information about the foundation’s work can be found on&nbsp;Starkey Hearing Foundation’s&nbsp;<a href=\"http://www.starkeyhearingfoundation.org/\" title=\"\">website</a>,&nbsp;<a href=\"https://www.facebook.com/starkeyhearing#!/StarkeyCares?fref=ts\" title=\"\">Facebook</a>&nbsp;and<a href=\"https://twitter.com/starkeycares\" title=\"\">Twitter</a>&nbsp;pages.\n\n <b><i>About Starkey Hearing Foundation</i></b>\n\n Starkey Hearing Foundation&nbsp;uses hearing as a vehicle to reflect caring and improve the lives of individuals, families and communities around the world, by helping them reach their full potential. Hearing loss affects one in 10 Americans, and 63 million children worldwide, yet many do not have access to the hearing devices that can help them. Starkey Hearing Foundation fits and gives more than 100,000 hearing aids annually, and as a member of President Clinton’s Global Initiative, it has pledged to fit one million hearing aids this decade. In addition to giving the gift of hearing through worldwide hearing missions, Starkey Hearing Foundation promotes hearing health awareness and education through the Listen Carefully initiative and provides hearing instruments to low-income Americans through the Hear Now program. For more information&nbsp;on&nbsp;Starkey Hearing Foundation, visit&nbsp;<ins><a href=\"http://www.starkeyhearingfoundation.org/\" title=\"\">www.starkeyhearingfoundation.org</a></ins>.\n\n <b>About the Clinton Global Initiative</b>\n\n  \n\n Established in 2005 by President Bill Clinton, the Clinton Global Initiative (CGI), an initiative of Bill, Hillary &amp; Chelsea Clinton Foundation, convenes global leaders to create and implement innovative solutions to the world’s most pressing challenges. CGI Annual Meetings have brought together more than 150 heads of state, 20 Nobel Prize laureates, and hundreds of leading CEOs, heads of foundations and NGOs, major philanthropists, and members of the media. To date CGI members have made more than 2,300 commitments, which are already improving the lives of more than 400 million people in over 180 countries. When fully funded and implemented, these commitments will be valued at $73.5 billion.','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(3,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'One of the greatest challenges for all children with hearing loss is communication and connection with the rest of the world.','none','{filedir_1}TaniAustin.jpg','none','{filedir_1}Clinton_Foundation_Logo.png','none','Media Mention','none',1390189140,'','none','http://www.clintonfoundation.org/blog/2013/08/02/starkey-executive-director-speaks-miracle-watching-patients-hear-very-first-tim','none','Clinton Foundation','none','','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(4,1,1,'In 2010, we committed to providing 100,000 hearing aids a year to those in need','none','{filedir_1}HERO-Commitment_to_Action_Film.jpg','none','http://www.youtube.com/watch?v=ScjOkoueDYg','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(5,1,1,'To truly make an impact, our efforts must be sustainable','none','{filedir_1}HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','none','http://www.youtube.com/watch?v=W50L7eNGT2U','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(6,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Celebrity_Film.jpg','none','Watch','none','Celebrity Support ','none','{filedir_1}CAROUSEL-Celebrity_Film.jpg','none','http://www.youtube.com/watch?v=03KTq85Y3wM','none','','none','','none','<p>Starkey Hearing Foundation is fortunate to have hundreds of high-profile friends to help us raise awareness and generate support for the gift of hearing.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(7,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','Watch ','none','Listen Carefully in Schools','none','{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','http://www.youtube.com/watch?v=rlyH-ZcCf7o','none','','none','','none','<p>Disney and Nickelodeon stars Chris and Kyle Massey joined Grammy Award-winning songwriter/producer Dallas Austin to educate a crowd of more than 1,400 students at our launch event. The music and sound experience inspired not only a dance contest but also sent the right message: Your hearing is fragile. So don’t listen loudly. Listen Carefully.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(8,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','See the Process ','none','Recycling Sound','none','{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','http://www.youtube.com/watch?v=tF-9R4UUWa8','none','','none','','none','<p>Every year thousands of used hearing aids are donated to our Hear Now program people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(9,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We Are Now ','none','{filedir_1}icon_now.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(10,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','28.6','none','77.2','none','India ','none','<p>The mission team is excited to be back in India working with our Starkey India team to give the gift of hearing across four cities.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(11,1,2,'',NULL,'',NULL,'',NULL,' ','xhtml',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'We use hearing as a vehicle to change lives around the world.','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(13,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_Philippines_.jpg','none','Hearing Missions','none',1387524240,'','none','<p><b>Caring for Our Friends in the Philippines</b></p>\n\n<p>&nbsp; Over 35 days, four countries and 10 cities, the hearing mission team finished the year strong, fitting more than 12,000 people. Crisscrossing Asia, we brought the gift of hearing to India, Cambodia, China and completed our tour with an impactful, four-city hearing mission in the Philippines.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; Typhoon Haiyan struck the Philippines three weeks before our long-scheduled hearing mission was set to take place. For a second after that tragedy, we paused to consider how to help, and we decided that the best thing we could do was go, as planned, to give the gift of hearing. Joined by boxing champion Manny Pacquiao, fresh from his victory in China, and singer Jessica Sanchez, we brought our love and care to more than 5,000 people in need.</p>\n\n<p>&nbsp; Excited to be as hands-on as possible with the patients, Sanchez worked and traveled with the team for the entire hearing mission. Her first day on the job she helped reconnect 88-year-old Maria Solis Sogon with her 12 children, 20 grandchildren and 5 great-grandchildren. Overwhelmed with gratitude, Maria broke into song to Sanchez’s delight. By the end of the hearing mission, it was Sanchez who was moved to song by all of the incredible people and lives she was able to help change. She performed for a captivated audience, giving many of them their first experience of music.</p>\n\n<p>&nbsp; From General Santos to Lipa City to Batangas to Manila, the team was inspired by the resilience of the Philippines. While many may have been knocked down by the impact of Typhoon Haiyan, from what we experienced, their spirit has not been broken. It will not take long for the Philippines to be just as strong, if not stronger than it was before.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; <b>Happy Holidays!</b></p>\n\n<p>&nbsp; With the holidays upon us, the team is busy preparing for another year of changing lives, while also spending some quality time with the people we love. From the Starkey Hearing Foundation family to yours, we wish you all love, light and peace this holiday season. Thank you for all you do to support our efforts around the world. May 2014 bring you inspiration and adventure!</p>\n\n<p>&nbsp; As you spend time with your friends and families this holiday season, remember the connecting power of hearing.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; <a href=\"https://action.starkeyhearingfoundation.org/\" title=\"\">Pledge your support</a> today and help us give that same connection to thousands of families around the world in 2014.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(14,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}Dave_Fabry.jpg','none','Hearing Missions','none',1388215620,'','none','<p>Dave Fabry, Ph.D. audiologist and Starkey Hearing Technologies’ Vice President of Audiology and Professional Services, has dedicated his life to hearing care. As a young man in college he was a pre-veterinary medicine major, and his love of animals led him to a hearing lab where scientists were studying the damage from noise exposure in chinchillas. There he found his calling. Since then Fabry has earned a doctorate in audiology from the University of Minnesota, published more than 50 articles and been a leader in the field for more than 30 years. However, he has never let go of his interest in noise exposure and raising awareness on how to prevent hearing loss. He has channeled this passion into our Listen Carefully campaign, and we sat down with him to gain a deeper understanding of the challenges and solutions surrounding preventable hearing loss.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/screen-shot-2013-09-30-at-9-06-05-am-2/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>How important is hearing protection?</b></p>\n\n<p>&nbsp; Hearing protection is critical for all age groups. Look at the history of OSHA and hearing protection in the workplace – we have done a very good job with occupational noise exposure in the workplace. However, recreational noise exposure has become an increasing problem for both adults and children, which could include anything from concerts to loud restaurants and bars to firearms.</p>\n\n<p>&nbsp; We don’t often think of children as being at risk for noise exposure, but in fact, it is a huge concern and an emerging problem in the United States with upwards of 20 percent of teens estimated to suffer from measurable hearing loss. We have to do better at protecting kids from preventable hearing loss.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/img_5019/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>Most of us have been told to wear hearing protection at concerts or to turn down the volume on our headphones to protect our hearing, but what are some of the lesser-known areas where hearing protection should be used?</b></p>\n\n<p>&nbsp; When looking at dangerous levels of noise exposure, it is all about the intensity of the sound and the duration of exposure. Any sound that is in excess of 85 dB, with extended exposure, will harm your hearing.</p>\n\n<p>&nbsp; There are some really strange places that we don’t often think of where dangerous levels of noise exposure can occur. Dentists, for example, are at high risk for noise exposure, due to the sound of the high-frequency drills they use daily. Likewise, the barista at your local coffee shop is at risk for noise exposure due to the sound of the grinder and the high-frequency sound of many cappuccino machines.</p>\n\n<p>&nbsp; In terms of teenagers, one of the places we don’t often think of is the school band. The students playing in those bands could be at risk for noise exposure, particularly percussionists and piccolo players and those positioned near them. Violinists are also at a high risk for hearing loss because as they play they place their ears directly against the instrument.</p>\n\n<p>&nbsp; It is important for all of us to take active measures to protect against preventable hearing loss. In my own life I use noise-cancelling headphones on airplanes when I travel to protect against the sounds produced during take off and landing. I also use musicians earplugs when I go to concerts to reduce the sound across the entire frequency spectrum without impacting the sound of the music. I wear those same earplugs when I ride my motorcycle so I can adequately hear other motorists around me while also protecting my hearing. In addition, whenever I mow the grass, I wear hearing protection.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/socm2639-00-ee-hf-listen-carefully-facts-facebook-1/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>What are the key issues surrounding noise exposure and iPods and MP3 players?</b></p>\n\n<p>&nbsp; A popular test of the volume of an iPod or MP3 player is that you should never allow the volume to go over half or two-thirds the maximum. Unfortunately, this is an oversimplification because with today’s technology it is actually the headphones that determine the output level. I don’t want parents and teens to be lulled into a false sense of security by keeping an iPod at or below half the maximum – that could still be a level that is damaging.</p>\n\n<p>&nbsp; In addition, years ago, we used to recommend that if someone could stand three feet away from you and sing along with the song you are listening to, the music is too loud. But again, due to the level of technology available for headphones, this also no longer applies.</p>\n\n<p>&nbsp; In an ideal world, we could measure on a simulated ear the level that someone listens to an iPod, and then set the limit, but this is not practical for real-world environments. I would encourage parents to listen to the iPod through your child’s headphones, and then set the volume at a level that is comfortable for them and not uncomfortably loud. You can also download sound level meter apps that are pretty accurate. You can then hold your child’s headphones up to the sound meter app to get an idea of the sound level and set the volume accordingly.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/dsc01235cc3/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>How do you encourage your loved ones to protect their hearing?</b></p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; I am very particular with the level my daughter listens to music both in the car and on headphones. I always carry hearing protection with me when I go to concerts, so either my wife or my daughter will be encouraged to wear it when they are with me. I have always tried to stress the importance of protecting their hearing against recreational noise exposure.</p>','none','Listen Carefully','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(15,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_A_Knight.jpg','none','Hearing Missions','none',1382632260,'','none','<p><strong>A Knight and a Prince Help Kick Off Fall Missions</strong></p>\n\n<p>&nbsp; Striving for a strong finish to a record-breaking year, the mission team began its fall by spending October giving the gift of hearing in <a href=\"http://www.starkeyhearingfoundation.org/missions/africa/south-africa-10-2013/\" title=\"\">South Africa</a>, <a href=\"http://www.starkeyhearingfoundation.org/missions/africa/lesotho-10-2013/\" title=\"\">Lesotho</a> and Kenya.</p>\n\n<p>&nbsp; The team started out in South Africa where partnered with Sir Richard Branson and <a href=\"http://www.virgin.com/unite\" title=\"\">Virgin Unite</a> for the third time to bring the gift of hearing to hundreds of people in need at Virgin Unite&rsquo;s Bhubezi Healthcare Clinic.</p>\n\n<p>&nbsp; Next, we headed to Lesotho. It was our first hearing mission in the country where we had another wonderful partner in <a href=\"http://sentebale.org/\" title=\"\">Sentebale</a>, a nonprofit organization co-founded by Prince Harry and Prince Seeiso of Lesotho, who participated in the fittings. Patients, ranging from 4 to 101 years old, traveled from all parts of the small, landlocked country to have their hearing assessed and be fitted for hearing aids. For many it was an opportunity to hear for the very first time.</p>\n\n<p>&nbsp; After being honored at the 13th Annual Starkey Hearing Foundation&rsquo;s <em>So the World May Hear Awards</em>Gala in July, Branson joined us to bring the gift of hearing to Virgin Unite&rsquo;s Bhubezi Healthcare Clinic. More than 300 patients from the surrounding Bushbruckridge community were fit with hearing aids. Branson and the Virgin Unite team worked closely with us to ensure each patient left the mission with a new connection to sound and life.</p>\n\n<p>&nbsp; Discussing his continued dedication to the work of the Foundation, Branson said, &ldquo;I admire the Starkey Hearing Foundation for its tireless effort to transform lives with the gift of hearing. I hope it will inspire others, businesses and nonprofits alike, to seek new, innovative and entrepreneurial ways of making a difference in people&rsquo;s lives.&rdquo;</p>\n\n<p>&nbsp; Once the team wrapped up a successful mission in South Africa, we headed to our first mission in Lesotho with new partner <a href=\"http://sentebale.com\">Sentebale</a>.</p>\n\n<p>&nbsp; Prince Seeiso joined the team to help fit hearing aids and open up the world of sound to many living in silence and isolation. &ldquo;I have seen children wanting to talk to each other, and their eyes tell a thousand stories,&rdquo; Prince Seeiso said. &ldquo;On behalf of myself, Prince Harry and Sentebale, a big thanks goes to Starkey Hearing Foundation.&rdquo;</p>\n\n<p>&nbsp; The team is currently in Kenya, where we have traveled from Mombasa to Eldoret to one of the largest slums in Africa, Kibera, to Meru, all the while reflecting caring and connecting communities with the gift of hearing.</p>\n\n<p>&nbsp; <strong>2013 Gala Highlights</strong></p>\n\n<p>&nbsp; Whether it was the bald eagle soaring over the crowd as Nita Whitaker sang &ldquo;AmazingGrace,&rdquo; impassioned speeches from twin brothers Ashton and Michael Kutcher, or special surprise guests for Bill Austin, the 2013 <em>So the World May Hear</em> Awards Gala was an evening we will never forget. Our latest film brings you all the highlights and magic from this year&rsquo;s Gala.</p>\n\n<p>&nbsp; <a href=\"http://youtu.be/KD8h8zNpd48\" title=\"\">Watch as the world comes together to celebrate the power of caring.</a></p>\n\n<p>&nbsp; <strong>Listen Carefully with Tony Hawk and the Minnesota Vikings</strong></p>\n\n<p><span style=\"line-height:1.6em\">&nbsp; October is National Protect Your Hearing Month, and we&rsquo;ve been encouraging people toturn down the volume and Listen Carefully with Chris and Kyle Massey at skateboarding legend Tony Hawk&rsquo;s 2013 </span><a href=\"http://standupforskateparks.org/\" style=\"line-height: 1.6em;\" title=\"\">Stand Up for Skateparks</a><span style=\"line-height:1.6em\"> and with the help of the </span><a href=\"http://www.starkeyhearingfoundation.org/vikings/\" style=\"line-height: 1.6em;\" title=\"\">Minnesota Vikings</a><span style=\"line-height:1.6em\">.</span></p>\n\n<p>&nbsp; Remember: Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; Chris and Kyle Massey joined our team as we spread the word about the importance of protecting your hearing at the 2013 Stand Up for Skateparks, and we were encouraged to see the message stick as much of the audience wore the hearing protection we distributed during a headlining performance by Modest Mouse.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; The Minnesota Vikings have teamed up with our Listen Carefully campaign to encourage fans to protect their hearing, and they are donating $500 to the Foundation for every touchdown scored this season by Adrian Peterson or Greg Jennings. Vikings fans should also be on the look out for Listen Carefully hearing protection at all home games.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(16,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Hearing Missions','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(17,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>​testing</p>','none','','xhtml','','xhtml','','xhtml','',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(18,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','','none','{filedir_1}Clinton_Foundation_Logo.png','none','Media Mention','none',1376422980,'','none','http://www.clintonfoundation.org/main/clinton-foundation-blog.html/2013/08/06/africa-2013-day-5-recap','none','Clinton Foundation','none','','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','At the fitting, Starkey Hearing Foundation representatives fit children, some of whom have never heard before, with hearing aids','none','','none','','none','Read More ','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(19,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Our new docuseries - coming soon!&nbsp;</p>','none','<h1>Listen Carefully</h1>\n\n<p>Research shows that 1 in 8 children and teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures&ndash;such as lowering the volume&ndash;are taken.</p>\n\n<p>The program combines music and education to raise awareness about the fragility of hearing and the dangers of exposure to high decibel sounds.&nbsp;This year Starkey Hearing Foundation expanded Listen Carefully to offer educational support to more than 16,000 teachers and nearly 500,000 students nationwide.</p>\n\n<p>[gallery id = \"listen-carefully-gallery\"]</p>\n\n<h1>Make a Difference&nbsp;</h1>\n\n<p>Start with yourself. Your family. Your friends. Because you understand the transformative, interconnecting power of hearing. Because you know that 1 in 5 American teenagers has hearing loss-meaning we&rsquo;re losing our hearing faster, today, than our parents or grandparents did.</p>\n\n<p><span style=\"line-height:1.6em\">[gallery id =&nbsp;\"listen-carefully-gallery-2\"]</span></p>\n\n<p>&nbsp;</p>\n\n<h1>Educate Yourself&nbsp;</h1>','none','<p>Starkey Hearing Foundation has provided more hearing help to people in the United States than to any other country. We do this through domestic missions and also Hear Now, our application-based program that provides hearing help to low-income Americans. Each person we help is fit with new, top-of-the-line digital hearing aids that are customized to their hearing loss.&nbsp;</p>\n\n<p>If you or someone you know is struggling with hearing loss and unable to afford hearing aids, call 1-800-328-8602 or complete the form below, and a Hear Now representative will be in touch with you.&nbsp;</p>\n\n<p>If you have already spoken with a representative and need an application, you can download one here:</p>','none','<p>Every year thousands of hearing aids are donated to our Hear Now program from hearing professionals and other people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation. However, the journey from donation to the mission field is an absolute labor of love.&nbsp;</p>','none','',NULL,NULL,NULL,'',NULL,'<p>Starkey Hearing Foundation&rsquo;s commitment to global hearing health begins right here at home.&nbsp;Along with our worldwide missions, our national programs contribute to an entire system of care.&nbsp;Everyone can make a difference in the lives of those across the world or just next-door. Together, we can create a movement that brings peace and understanding through the gift of hearing.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',' ','xhtml',' ','xhtml','','xhtml'),(20,1,1,'Hearing Foundation has provided more hearing help to people in the United States than to any other country','none','{filedir_1}HERO-Vikings_Mission-IMG_6312.jpg','none','http://www.starkeyhearingfoundation.org/programs/hear-now/)','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(21,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}September_Newsletter.jpg','none','News','none',1378791720,'','none','<p>Special Olympics Athletes Receive the Gift of Hearing</p>\n\n<p>After the team returned from fitting more than 10,000 people in&nbsp;Peru&nbsp;and&nbsp;Mexico, our campus was flooded with inspiration when 22 Special Olympics Minnesota athletes and their families arrived for a homegrown mission. The Foundation has partnered with Special Olympics Minnesota on its Healthy Hearing Athletes Initiative, and this mission kicked off what we hope will become a long and life-changing collaboration that will open up the world of sound to all Special Olympics athletes in need. Each athlete was fit with top-of-the-line, customized hearing aids that opened up the world of sound like never before.</p>\n\n<p>Discussing the significance of this mission, Bill Austin said, &ldquo;We don&rsquo;t believe in disabilities. We believe in ability. Everybody has it, and we have to find it and use it and maximize it.&rdquo;</p>\n\n<p>Former Minnesota Viking Matt Blair was also on hand to support the athletes, including his good friend Katie Timmer. She has been participating in Special Olympics for more than 30 years and met Blair at a golf tournament. Over the years, Blair has become Timmer&rsquo;s biggest fan. Unfortunately, She suffered from a hearing loss that had begun to affect her performance, but once she received the gift of hearing, she couldn&rsquo;t wait to get back out on the golf course.</p>\n\n<p>Special Olympics president, Dave Dorn, said the partnership with the Foundation would make a huge difference in each of the athlete&rsquo;s lives.</p>\n\n<p>&ldquo;It&rsquo;s a&nbsp;confidence&nbsp;builder,&rdquo; Dorn said. &ldquo;They can be engaged in conversations and hear the world around them. All of a sudden they are much more participatory and active in their surroundings because they can hear what&rsquo;s going on.&rdquo;</p>\n\n<p>The mission team is currently on its way to South Africa which will be followed by missions in Lesotho and Kenya.</p>\n\n<p>The Power of Partnerships</p>\n\n<p>President Bill Clinton and Chelsea Clinton once again joined the team on a recent mission swing through in Zambia, Tanzania and Rwanda to see our 1 million hearing aid commitment in action. Our latest film showcases the power of partnerships in providing the gift of hearing and tackling some of the world&rsquo;s most challenging issues.</p>\n\n<p>Watch as powerful organizations come together to create lasting change.</p>\n\n<p>Join us for a Hearing Protection Twitter Chat!</p>\n\n<p>October is National Protect Your Hearing Month! Research shows that 1 in 5 teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures &ndash; such as lowering the volume &ndash; are taken.</p>\n\n<p>Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</p>\n\n<p>Join us on Twitter Thursday, October 3, from 12-1 p.m. CDT as Starkey Hearing Foundation and Starkey Hearing Technologies discuss ways to protect your hearing and prevent hearing loss!</p>\n\n<p>If you&rsquo;re new to Twitter chats,&nbsp;here&rsquo;s an overview of how it works&hellip;</p>\n\n<p>Commit Today</p>\n\n<p>Pledge your support today&nbsp;and help us change a life during our upcoming missions in South Africa or Lesotho.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(22,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','Experience More','none','Gift of Hearing in Peru ','none','{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','','none','','none','','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(23,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}PeaceinWestBank.jpg','none','News','none',1381950660,'','none','<p>Starkey Hearing Foundation&nbsp;is excited to be heading back to the West Bank soon for an upcoming hearing mission. Our work in the region has shown us how hearing brings people together and serves as a vehicle for peace and understanding.</p>\n\n<p>We wanted to share some feedback from a recent mission as we currently prepare for the next one.</p>\n\n<p>&ldquo;Before the mission &ndash; my first &ndash; I was so excited and really didn&rsquo;t know what to expect. Now I can definitely&nbsp;say it was not like anything I had done before. I have lived in this conflict all my life, and today, for the first time I met my neighbors who greeted me with nothing but love. I was amazed to see all the happy faces and know that my small efforts could give someone so much joy. I hope that this mission will take us one step closer to peace, and I hope it won&rsquo;t be the last.&rdquo;</p>\n\n<p>- Chen Cohen</p>\n\n<p>Our local partners have been hard at work, completing phase one by identifying patients and taking impressions. We look forward to contributing to peace building by continuing to foster connections between people and across cultures through the gift of hearing. Check out the photos below to see the preparation.</p>\n\n<p><img alt=\"\" src=\"{filedir_1}westbank2.jpeg\" style=\"height:250px; width:333px\" />&nbsp;</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(24,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}September_Newsletter.jpg','none','News','none',1379359200,'','none','<p>After the team returned from fitting more than 10,000 people in&nbsp;Peru&nbsp;and&nbsp;Mexico, our campus was flooded with inspiration when 22 Special Olympics Minnesota athletes and their families arrived for a homegrown mission. The Foundation has partnered with Special Olympics Minnesota on its Healthy Hearing Athletes Initiative, and this mission kicked off what we hope will become a long and life-changing collaboration that will open up the world of sound to all Special Olympics athletes in need. Each athlete was fit with top-of-the-line, customized hearing aids that opened up the world of sound like never before.</p>\n\n<p>Discussing the significance of this mission, Bill Austin said, &ldquo;We don&rsquo;t believe in disabilities. We believe in ability. Everybody has it, and we have to find it and use it and maximize it.&rdquo;</p>\n\n<p>Former Minnesota Viking Matt Blair was also on hand to support the athletes, including his good friend Katie Timmer. She has been participating in Special Olympics for more than 30 years and met Blair at a golf tournament. Over the years, Blair has become Timmer&rsquo;s biggest fan. Unfortunately, She suffered from a hearing loss that had begun to affect her performance, but once she received the gift of hearing, she couldn&rsquo;t wait to get back out on the golf course.</p>\n\n<p>Special Olympics president, Dave Dorn, said the partnership with the Foundation would make a huge difference in each of the athlete&rsquo;s lives.</p>\n\n<p>&ldquo;It&rsquo;s a&nbsp;confidence&nbsp;builder,&rdquo; Dorn said. &ldquo;They can be engaged in conversations and hear the world around them. All of a sudden they are much more participatory and active in their surroundings because they can hear what&rsquo;s going on.&rdquo;</p>\n\n<p>The mission team is currently on its way to South Africa which will be followed by missions in Lesotho and Kenya.</p>\n\n<h3>The Power of Partnerships</h3>\n\n<p>President Bill Clinton and Chelsea Clinton once again joined the team on a recent mission swing through in Zambia, Tanzania and Rwanda to see our 1 million hearing aid commitment in action. Our latest film showcases the power of partnerships in providing the gift of hearing and tackling some of the world&rsquo;s most challenging issues.</p>\n\n<p>Watch as powerful organizations come together to create lasting change.&nbsp;</p>\n\n<p style=\"margin-left: 480px;\"><img alt=\"\" src=\"{filedir_1}special_olympics_mission.jpg\" style=\"height:200px; width:300px\" /></p>\n\n<h3>Join us for a Hearing Protection Twitter Chat!</h3>\n\n<p>October is National Protect Your Hearing Month! Research shows that 1 in 5 teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures &ndash; such as lowering the volume &ndash; are taken.</p>\n\n<h3>Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</h3>\n\n<p>Join us on Twitter Thursday, October 3, from 12-1 p.m. CDT as Starkey Hearing Foundation and Starkey Hearing Technologies discuss ways to protect your hearing and prevent hearing loss!</p>\n\n<p>If you&rsquo;re new to Twitter chats,&nbsp;here&rsquo;s an overview of how it works&hellip;</p>\n\n<p>Commit Today</p>\n\n<p>Pledge your support today&nbsp;and help us change a life during our upcoming missions in South Africa or <a href=\"http://lesotho.com\">Lesotho</a>.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(25,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml'),(26,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml');
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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,1,1,'homepage_feature_subtitle','Subtitle ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(2,1,1,'homepage_feature_splash_image','Hero Image ','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(3,1,1,'homepage_feature_link','CTA Link','Insert URL that CTA will link out to, if feature is a video, insert video URL ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(4,1,2,'homepage_pictograms','homepage_pictograms','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',2,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(27,1,6,'homepage_map_category_title','Homepage Map Pin Category','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(5,1,3,'homepage_map_item_category','Map Pin Category','Select the pin type you want to display for this item','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI2Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7aTowO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(6,1,3,'homepage_map_item_lat','Latitude','Enter latitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(7,1,3,'homepage_map_item_lon','Longitude ','Enter Longitude coordinate ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(8,1,3,'homepage_map_item_location','Item Location','Enter location name if you want this to appear on map item i.e \"Los Angeles, CA\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(9,1,3,'homepage_map_item_content','Map Item Text ','Insert body copy here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',10,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(10,1,4,'media_mention_featured','Feature Carousel ','Select for this media mention to be featured in the carousel at the top of the page','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(11,1,4,'media_mention_splash_image','Image ','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(12,1,4,'media_mention_icon','Logo','Only upload this for Media Mentions (100 pixel width x 100 pixel width)','file','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(13,1,4,'media_mention_type','media_mention_type','','select','Press Release\nMedia Mention','n',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(14,1,4,'media_mention_date','Date ','','date','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(15,1,4,'media_mention_cta_link','Call to Action Link','Paste external link to media mention article here ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(16,1,4,'media_mention_source','Media Mention Source ','Where is this article coming from? (ex CNN or SHF Team) This will display in the thumbnail ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(17,1,4,'media_mention_content','Press Release Body Copy','ONLY enter this for Press Releases which will have detail page and body copy. EXCEPTION: Media Mentions with no external article can be entered here. ','rte','','0',0,0,10,128,'n','ltr','n','n','xhtml','n',8,'any','YTo4OntzOjI0OiJydGVfZmllbGRfdGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJydGVfdGFfcm93cyI7czoyOiIxMCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(18,1,5,'blog_featured','Blog Feature','Do you want this blog to appear in the Blog featured carousel? ','radio','true\nfalse','n',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(19,1,5,'blog_image','Blog Image ','This image will serve as the thumbnail image as well as the header image on the blog post ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czoxOiIxIjtzOjEzOiJzaG93X2V4aXN0aW5nIjtzOjE6InkiO3M6MTI6Im51bV9leGlzdGluZyI7czoyOiI1MCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(20,1,5,'blog_category','Blog Category ','','select','News\nEvents\nHear Now\nGala\nFilms\nCelebrity\nOperation Change\nHearing Missions\nListen Carefully','n',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(21,1,5,'blog_date','Blog Date ','The post will appear to be published on the selected date ','date','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(48,1,1,'homepage_feature_cta','CTA Text ','Insert two to three words for CTA Text ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(47,1,5,'blog_related_items','Related Blog Posts ','Select related posts to appear at the bottom of this entry ','relationship','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',7,'any','YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI1Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(24,1,5,'blog_content','Blog Text ','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',7,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(25,1,5,'blog_author','Blog Author ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(26,1,2,'homepage_mission_statment','homepage_mission_statment','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',1,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(28,1,6,'homepage_map_category_image','Homepage Map Pin Icon','upload files as .pngs','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(29,1,3,'homepage_map_item_cta_link','Map Item CTA URL','Enter URL you would like to link to from Map Item','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(30,1,3,'homepage_map_item_cta_text','Map Item CTA Text ','Enter 2-3 words that will display as link out on map item i.e. \"Read More\"','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(56,1,8,'hear_now_form_contact','Hear Now Form Contact','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(46,1,3,'homepage_map_item_image','Homepage Map Item Image ','Upload Image to be displayed in map item panel ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(33,1,7,'carousel_image','Carousel Thumb','This is the thumbnail image displayed in the carousel ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',2,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(34,1,7,'carousel_cta','Carousel CTA ','Enter two to three words to displayed as call to action link in carousel thumb','text','','0',0,0,6,128,'n','ltr','n','n','none','n',3,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(35,1,7,'carousel_panel_title','Carousel Panel Title ','','text','','0',0,0,6,128,'n','ltr','n','n','none','n',4,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(36,1,7,'carousel_panel_image','Carousel Panel Image ','This is the main image that will display in the feature area when thumb is selected ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjE6IjEiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToieSI7czoxMjoibnVtX2V4aXN0aW5nIjtzOjI6IjUwIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(37,1,7,'carousel_video_url','Carousel Video URL','If carousel item is a video, insert video URL here ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(38,1,7,'carousel_panel_cta','Carousel Panel CTA ','Enter two to three words to be displayed as link in in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',6,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(39,1,7,'carousel_panel_link','Carousel Panel CTA Link','Add URL that CTA will link out to in panel area ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(40,1,7,'carousel_body','Carousel Panel Text ','Insert body copy to be displayed in panel overlay ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',9,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6InkiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(41,1,8,'operation_change_content','Operation Change ','Enter text for Operation Change Tab here','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(42,1,8,'listen_carefully_content','Listen Carefully','Enter text for Listen Carefully Tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',2,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(44,1,8,'hear_now_content','Hear Now ','Enter text for Hear Now tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',4,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIxIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(45,1,8,'hearing_aid_recycling_content','Hearing Aid Recycle','Enter text for Hearing Aid Recycling tab here ','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',5,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(57,1,8,'hear_now_download_copy','Hear Now Download Copy','','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',7,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(50,1,4,'media_mention_download','PDF Download','upload pdf download to be displayed at bottom of press release detail page ','file','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czozOiJhbGwiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToibiI7czoxMjoibnVtX2V4aXN0aW5nIjtiOjA7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(49,1,8,'program_page_leader','Page Leader','','wygwam','','0',0,0,10,128,'n','ltr','n','n','none','n',1,'any','YTo4OntzOjY6ImNvbmZpZyI7czoxOiIyIjtzOjU6ImRlZmVyIjtzOjE6Im4iO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(51,1,4,'media_mention_quote','Quote','','textarea','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(52,1,4,'media_mention_contact','Contact','insert e-mail address of media contact ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',11,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(53,1,4,'media_mention_category','Category','Is this post to be labeled a media mention or press release? This will be used to filter on the front end.','select','','y',5,20,6,128,'n','ltr','n','n','none','n',3,'any','YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(54,1,4,'media_mention_cta_text','Call to Action Text','Insert 2-3 words to be displayed as the call to action button in the feature carousel ','text','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(55,1,4,'media_mention_video_url','Video URL','(optional) If media mention is a video, paste in Youtube URL','text','','0',0,0,6,128,'n','ltr','n','n','none','n',5,'any','YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),(58,1,8,'hear_now_form_download_english','Hear Now Form Download English','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',8,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czozOiJhbGwiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToibiI7czoxMjoibnVtX2V4aXN0aW5nIjtiOjA7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(59,1,8,'hear_now_form_download_spanish','Hear Now Form Download Spanish','','file','','0',0,0,6,128,'n','ltr','n','n','none','n',9,'any','YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxOToiYWxsb3dlZF9kaXJlY3RvcmllcyI7czozOiJhbGwiO3M6MTM6InNob3dfZXhpc3RpbmciO3M6MToibiI7czoxMjoibnVtX2V4aXN0aW5nIjtiOjA7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),(60,1,8,'operation_change_partnerships','Operation Change Partnerships','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',10,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(61,1,8,'listen_carefully_additional_reso','Listen Carefully Additional Resouces','','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',11,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),(62,1,9,'item','item','Item must be either a Image or a Video, but not both.','grid','','0',0,0,6,128,'n','ltr','n','n','xhtml','n',1,'any','YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ==');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_60`
--

LOCK TABLES `exp_channel_grid_field_60` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_60` DISABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_61`
--

LOCK TABLES `exp_channel_grid_field_61` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_61` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_62`
--

LOCK TABLES `exp_channel_grid_field_62` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_62` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_62` VALUES (1,25,0,'{filedir_1}Screen_Shot_2014-01-31_at_12.29.23_PM.png',''),(2,26,0,'{filedir_1}listencarefullygallery2.png','');
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (15,1,5,1,NULL,'172.251.100.146','October Newsletter: A Knight and a Prince Help Kick Off Fall Missions','october-newsletter-a-knight-and-a-prince-help-kick-off-fall-missions','open','y',0,0,0,0,'y','n',1390239060,'2014','01','20',0,0,20140130014619,0,0),(2,1,4,1,NULL,'172.251.100.146','PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE','president-and-chelsea-clinton-visit-site-to-see','open','y',0,0,0,0,'y','n',1390188000,'2014','01','19',0,0,20140120033810,0,0),(3,1,4,1,NULL,'172.251.100.146','Starkey Executive Director Speaks on the \'Miracle\' of Watching Patients Hear for the Very First Time','starkey-executive-director-speaks-on-the-miracle-of-watching-patients-hear','open','y',0,0,0,0,'y','n',1390189140,'2014','01','19',0,0,20140120054413,0,0),(4,1,1,1,NULL,'76.169.36.76','Commitment to Action','commitment-to-action1','open','y',0,0,0,0,'y','n',1390237920,'2014','01','20',0,0,20140120173933,0,0),(5,1,1,1,NULL,'76.169.36.76','Building Sustainable Systems of Hearing Care','building-sustainable-systems-of-hearing-care','open','y',0,0,0,0,'y','n',1390197600,'2014','01','19',0,0,20140120080637,0,0),(6,1,7,1,NULL,'172.251.100.146','Celebrity Support','celebrity-support','open','y',0,0,0,0,'y','n',1390198920,'2014','01','19',0,0,20140120064815,0,0),(7,1,7,1,NULL,'172.251.100.146','Listen Carefully in Schools','listen-carefully-in-schools','open','y',0,0,0,0,'y','n',1390199280,'2014','01','19',0,0,20140120064716,0,0),(8,1,7,1,NULL,'172.251.100.146','Recycling Sound','recycling-sound','open','y',0,0,0,0,'y','n',1390199700,'2014','01','19',0,0,20140120064658,0,0),(9,1,6,1,NULL,'172.251.100.146','Where We Are Now','where-we-are-now','open','y',0,0,0,0,'y','n',1390200540,'2014','01','19',0,0,20140120065030,0,0),(10,1,3,1,NULL,'172.251.100.146','Where we are now: India','where-we-are-now-india','open','y',0,0,0,0,'y','n',1390200600,'2014','01','19',0,0,20140120071358,0,0),(11,1,2,1,NULL,'67.53.113.42','We use hearing as a vehicle to change lives around the world.','we-use-hearing-as-a-vehicle-to-change-lives-around-the-world','open','y',0,0,0,0,'y','n',1390202040,'2014','01','19',0,0,20140130234722,0,0),(12,1,5,1,NULL,'172.251.100.146','December Newsletter: Caring for Our Friends in the Philippines','december-newsletter-caring-for-our-friends-in-the-philippines','open','y',0,0,0,0,'y','n',1390202100,'2014','01','19',0,0,20140120072346,0,0),(13,1,5,1,NULL,'76.169.36.76','December Newsletter: Caring for Our Friends in the Philippines','december-newsletter-caring-for-our-friends-in-the-philippines1','open','y',0,0,0,0,'y','n',1390202640,'2014','01','19',0,0,20140129200851,0,0),(14,1,5,1,NULL,'76.169.36.76','Dave Fabry Lives to Listen Carefully','dave-fabry-lives-to-listen-carefully','open','y',0,0,0,0,'y','n',1390202820,'2014','01','19',0,0,20140129200842,0,0),(16,1,6,1,NULL,'76.169.36.76','Hearing Missions','hearing-missions','open','y',0,0,0,0,'y','n',1390241640,'2014','01','20',0,0,20140120181456,0,0),(17,1,10,1,NULL,'76.169.36.76','Programs','programs','open','y',0,0,0,0,'y','n',1390963920,'2014','01','28',0,0,20140129025236,0,0),(18,1,11,6,NULL,'172.251.100.146','Africa 2013: Day 5 Recap','africa-2013-day-5-recap','open','y',0,0,0,0,'y','n',1391028180,'2014','01','29',0,0,20140129205002,0,0),(19,1,10,6,NULL,'67.53.113.42','Programs','programs1','open','y',0,0,0,0,'y','n',1391037960,'2014','01','29',0,0,20140131205933,0,0),(20,1,1,6,NULL,'172.251.100.146','Hear at Home','hear-at-home','open','y',0,0,0,0,'y','n',1391039400,'2014','01','29',0,0,20140130000323,0,0),(21,1,5,6,NULL,'172.251.100.146','September Newsletter: Special Olympics Athletes Receive the Gift of Hearing','september-newsletter-special-olympics-athletes-receive-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1391064120,'2014','01','29',0,0,20140130064853,0,0),(22,1,7,6,NULL,'67.53.113.42','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'y','n',1391122980,'2014','01','30',0,0,20140131193344,0,0),(23,1,5,6,NULL,'67.53.113.42','Building Momentum for Peace in the West Bank','building-momentum-for-peace-in-the-west-bank','open','y',0,0,0,0,'y','n',1391199060,'2014','01','31',0,0,20140131201931,0,0),(24,1,5,6,NULL,'67.53.113.42','September Newsletter: Special Olympics Athletes Receive the Gift of Hearing','september-newsletter-special-olympics-athletes-receive-the-gift-of-hea','open','y',0,0,0,0,'y','n',1391199600,'2014','01','31',0,0,20140131202648,0,0),(25,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery','listen-carefully-gallery','open','y',0,0,0,0,'y','n',1391200080,'2014','01','31',0,0,20140131203009,0,0),(26,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery 2','listen-carefully-gallery-2','open','y',0,0,0,0,'y','n',1391200380,'2014','01','31',0,0,20140131203441,0,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (1,1,'homepage_features','Homepage Hero Slider ','http://starkey.ahundredyears.com/','','en',3,0,1391039400,0,'',NULL,'open',1,1,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(2,1,'homepage_content','Homepage Mission and Pictograms ','http://starkey.ahundredyears.com/','','en',1,0,1390202040,0,'',NULL,'open',2,4,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(3,1,'homepage_map_items','Homepage Map Items','http://starkey.ahundredyears.com/',NULL,'en',1,0,1390200600,0,'',NULL,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(4,1,'media_mentions_carousel','Media Mentions Carousel','http://starkey.ahundredyears.com/','','en',2,0,1390189140,0,'',NULL,'open',4,10,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(5,1,'blog','Blog','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391199600,0,'',NULL,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(6,1,'homepage_map_categories','Homepage Map Categories','http://starkey.ahundredyears.com/',NULL,'en',2,0,1390241640,0,'',NULL,'open',6,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(7,1,'homepage_main_carousel','Homepage Bottom Carousel','http://starkey.ahundredyears.com/','','en',4,0,1391122980,0,'',NULL,'open',7,33,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(8,1,'operation_change_carousel','Operation Change Carousel','http://starkey.ahundredyears.com/','','en',0,0,0,0,'',NULL,'open',7,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(9,1,'listen_carefully','Listen Carefully','http://starkey.ahundredyears.com/',NULL,'en',0,0,0,0,'',NULL,'open',7,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(10,1,'programs','Programs','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391037960,0,'',NULL,'open',8,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(11,1,'media_mentions','Media Mentions','http://starkey.ahundredyears.com/',NULL,'en',1,0,1391028180,0,'',NULL,'open',4,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(12,1,'gallery','Gallery','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391200380,0,'',NULL,'open',9,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'dev@100yea.rs','10.11.0.1',1389245396,'Logged in'),(2,1,1,'dev@100yea.rs','10.11.0.1',1389245511,'Site Updated&nbsp;&nbsp;Starkey Hearing Foundation'),(3,1,1,'dev@100yea.rs','10.11.0.1',1389255875,'Logged out'),(4,1,1,'dev@100yea.rs','10.11.0.1',1389306293,'Logged in'),(5,1,1,'dev@100yea.rs','67.53.113.42',1389658121,'Logged in'),(6,1,1,'dev@100yea.rs','67.53.113.42',1390001368,'Logged in'),(7,1,1,'dev@100yea.rs','67.53.113.42',1390001560,'Field Group Created:&nbsp;Homepage Features'),(8,1,1,'dev@100yea.rs','67.53.113.42',1390001825,'Field Group Created:&nbsp;Homepage Pictograms'),(9,1,1,'dev@100yea.rs','67.53.113.42',1390001855,'Field Group Created:&nbsp;Homepage Map Items'),(10,1,1,'dev@100yea.rs','67.53.113.42',1390001975,'Field Group Created:&nbsp;Media Mentions'),(11,1,1,'dev@100yea.rs','67.53.113.42',1390002133,'Field Group Created:&nbsp;Blog'),(12,1,1,'dev@100yea.rs','67.53.113.42',1390002338,'Channel Created:&nbsp;&nbsp;Homepage Features'),(13,1,1,'dev@100yea.rs','67.53.113.42',1390002360,'Channel Created:&nbsp;&nbsp;Homepage Pictograms'),(14,1,1,'dev@100yea.rs','67.53.113.42',1390002379,'Channel Created:&nbsp;&nbsp;Homepage Map Items'),(15,1,1,'dev@100yea.rs','67.53.113.42',1390002398,'Channel Created:&nbsp;&nbsp;Media Mentions'),(16,1,1,'dev@100yea.rs','67.53.113.42',1390002408,'Channel Created:&nbsp;&nbsp;Blog'),(17,1,1,'dev@100yea.rs','67.53.113.42',1390003402,'Logged in'),(18,1,1,'dev@100yea.rs','76.169.36.76',1390174434,'Logged in'),(19,1,1,'dev@100yea.rs','172.251.100.146',1390175990,'Logged in'),(20,1,1,'dev@100yea.rs','172.251.100.146',1390178704,'Logged out'),(21,1,1,'dev@100yea.rs','76.169.36.76',1390186504,'Logged in'),(22,1,1,'dev@100yea.rs','76.169.36.76',1390186888,'Field Group Created:&nbsp;Homepage Map Categories'),(23,1,1,'dev@100yea.rs','76.169.36.76',1390187000,'Channel Created:&nbsp;&nbsp;Homepage Map Categories'),(24,1,1,'dev@100yea.rs','76.169.36.76',1390187478,'Field Group Created:&nbsp;Homepage Main Carousel'),(25,1,1,'dev@100yea.rs','76.169.36.76',1390187711,'Channel Created:&nbsp;&nbsp;Main Carousel'),(26,1,1,'dev@100yea.rs','172.251.100.146',1390188000,'Logged in'),(27,1,1,'dev@100yea.rs','76.169.36.76',1390188084,'Channel Created:&nbsp;&nbsp;Operation Change'),(28,1,1,'dev@100yea.rs','76.169.36.76',1390188095,'Channel Created:&nbsp;&nbsp;Listen Carefully'),(29,1,1,'dev@100yea.rs','76.169.36.76',1390188185,'Channel Created:&nbsp;&nbsp;Programs'),(30,1,1,'dev@100yea.rs','76.169.36.76',1390188198,'Field Group Created:&nbsp;Programs'),(31,1,1,'dev@100yea.rs','76.169.36.76',1390190779,'Logged out'),(32,1,1,'dev@100yea.rs','172.251.100.146',1390192108,'Logged in'),(33,1,1,'dev@100yea.rs','172.251.100.146',1390192138,'Logged out'),(34,1,1,'dev@100yea.rs','172.251.100.146',1390192147,'Logged in'),(35,1,1,'dev@100yea.rs','76.169.36.76',1390195561,'Logged in'),(36,1,1,'dev@100yea.rs','172.251.100.146',1390196042,'Logged out'),(37,1,1,'dev@100yea.rs','172.251.100.146',1390196559,'Logged in'),(38,1,1,'dev@100yea.rs','76.169.36.76',1390197123,'Logged in'),(39,1,1,'dev@100yea.rs','76.169.36.76',1390198922,'Custom Field Deleted:&nbsp;carousel_title'),(40,1,1,'dev@100yea.rs','76.169.36.76',1390201092,'Logged in'),(41,1,1,'dev@100yea.rs','76.169.36.76',1390202448,'Custom Field Deleted:&nbsp;blog_link'),(42,1,1,'dev@100yea.rs','76.169.36.76',1390202491,'Custom Field Deleted:&nbsp;blog_source'),(43,1,1,'dev@100yea.rs','172.251.100.146',1390208228,'Logged out'),(44,1,1,'dev@100yea.rs','76.169.36.76',1390209177,'Logged out'),(45,1,1,'dev@100yea.rs','67.53.113.42',1390237918,'Logged in'),(46,1,1,'dev@100yea.rs','76.169.36.76',1390238882,'Logged in'),(47,1,1,'dev@100yea.rs','76.169.36.76',1390241230,'Logged in'),(48,1,1,'dev@100yea.rs','67.53.113.42',1390243995,'Logged out'),(49,1,1,'dev@100yea.rs','67.53.113.42',1390850253,'Logged in'),(50,1,1,'dev@100yea.rs','67.53.113.42',1390850428,'Member profile created:&nbsp;&nbsp;taylor_joseph'),(51,1,1,'dev@100yea.rs','67.53.113.42',1390850463,'Member profile created:&nbsp;&nbsp;trinh_mai'),(52,1,1,'dev@100yea.rs','67.53.113.42',1390850495,'Member profile created:&nbsp;&nbsp;laura_hetzel'),(53,1,1,'dev@100yea.rs','67.53.113.42',1390850564,'Member profile created:&nbsp;&nbsp;randall_ward'),(54,1,1,'dev@100yea.rs','67.53.113.42',1390850671,'Screen name was changed to:&nbsp;&nbsp;Trinh Mai'),(55,1,1,'dev@100yea.rs','67.53.113.42',1390864649,'Logged in'),(56,1,1,'dev@100yea.rs','67.53.113.42',1390865172,'Logged in'),(57,1,1,'dev@100yea.rs','67.53.113.42',1390865267,'Member profile created:&nbsp;&nbsp;julie@100yea.rs'),(58,1,6,'julie@100yea.rs','67.53.113.42',1390865391,'Logged in'),(59,1,6,'julie@100yea.rs','172.251.100.146',1390879909,'Logged in'),(60,1,1,'dev@100yea.rs','76.169.36.76',1390881643,'Logged in'),(61,1,1,'dev@100yea.rs','76.169.36.76',1390888793,'Logged in'),(62,1,1,'dev@100yea.rs','76.169.36.76',1390892415,'Logged out'),(63,1,6,'julie@100yea.rs','172.251.100.146',1390934637,'Logged in'),(64,1,1,'dev@100yea.rs','67.53.113.42',1390942116,'Logged in'),(65,1,1,'dev@100yea.rs','67.53.113.42',1390942173,'Logged in'),(66,1,6,'julie@100yea.rs','172.251.100.146',1390944299,'Logged out'),(67,1,6,'julie@100yea.rs','172.251.100.146',1390946652,'Logged in'),(68,1,6,'julie@100yea.rs','172.251.100.146',1390962146,'Logged in'),(69,1,1,'dev@100yea.rs','76.169.36.76',1390963929,'Logged in'),(70,1,6,'julie@100yea.rs','172.251.100.146',1390966989,'Logged out'),(71,1,6,'julie@100yea.rs','172.251.100.146',1390970002,'Logged in'),(72,1,1,'dev@100yea.rs','76.169.36.76',1390971428,'Logged in'),(73,1,6,'julie@100yea.rs','172.251.100.146',1390974780,'Logged in'),(74,1,1,'dev@100yea.rs','76.169.36.76',1390975337,'Logged in'),(75,1,1,'dev@100yea.rs','76.169.36.76',1390975463,'Member profile created:&nbsp;&nbsp;tulika_bose'),(76,1,1,'dev@100yea.rs','76.169.36.76',1390975508,'Member profile created:&nbsp;&nbsp;megan_sheley'),(77,1,6,'julie@100yea.rs','172.251.100.146',1390977916,'Logged out'),(78,1,1,'dev@100yea.rs','76.169.36.76',1390981911,'Logged out'),(79,1,1,'dev@100yea.rs','76.169.36.76',1390983433,'Logged in'),(80,1,1,'dev@100yea.rs','76.169.36.76',1390986303,'Logged in'),(81,1,1,'dev@100yea.rs','76.169.36.76',1390987040,'Logged out'),(82,1,1,'dev@100yea.rs','76.169.36.76',1390987518,'Logged in'),(83,1,1,'dev@100yea.rs','76.169.36.76',1390990723,'Logged out'),(84,1,6,'julie@100yea.rs','172.251.100.146',1391017243,'Logged in'),(85,1,1,'dev@100yea.rs','76.169.36.76',1391018846,'Logged in'),(86,1,6,'julie@100yea.rs','172.251.100.146',1391021598,'Logged in'),(87,1,1,'dev@100yea.rs','76.169.36.76',1391022070,'Logged out'),(88,1,1,'dev@100yea.rs','76.169.36.76',1391023429,'Logged in'),(89,1,6,'julie@100yea.rs','172.251.100.146',1391024368,'Logged in'),(90,1,1,'dev@100yea.rs','76.169.36.76',1391025187,'Channel Created:&nbsp;&nbsp;Media Mentions'),(91,1,6,'julie@100yea.rs','172.251.100.146',1391025819,'Logged out'),(92,1,6,'julie@100yea.rs','172.251.100.146',1391025824,'Logged in'),(93,1,1,'dev@100yea.rs','76.169.36.76',1391025894,'Logged out'),(94,1,1,'dev@100yea.rs','76.169.36.76',1391025897,'Logged in'),(95,1,6,'julie@100yea.rs','172.251.100.146',1391026118,'Logged in'),(96,1,6,'julie@100yea.rs','172.251.100.146',1391026128,'Logged in'),(97,1,6,'julie@100yea.rs','172.251.100.146',1391026387,'Logged in'),(98,1,1,'dev@100yea.rs','76.169.36.76',1391026426,'Logged in'),(99,1,1,'dev@100yea.rs','76.169.36.76',1391031302,'Logged in'),(100,1,6,'julie@100yea.rs','172.251.100.146',1391032109,'Logged in'),(101,1,1,'dev@100yea.rs','76.169.36.76',1391037048,'Logged in'),(102,1,6,'julie@100yea.rs','172.251.100.146',1391037612,'Logged out'),(103,1,6,'julie@100yea.rs','172.251.100.146',1391038002,'Logged in'),(104,1,1,'dev@100yea.rs','76.169.36.76',1391038930,'Custom Field Deleted:&nbsp;Hear Now Title'),(105,1,1,'dev@100yea.rs','76.169.36.76',1391040145,'Logged in'),(106,1,1,'dev@100yea.rs','76.169.36.76',1391042932,'Logged out'),(107,1,1,'dev@100yea.rs','76.169.36.76',1391043035,'Logged in'),(108,1,1,'dev@100yea.rs','76.169.36.76',1391048286,'Logged out'),(109,1,1,'dev@100yea.rs','76.169.36.76',1391053349,'Logged in'),(110,1,6,'julie@100yea.rs','172.251.100.146',1391063062,'Logged in'),(111,1,6,'julie@100yea.rs','172.251.100.146',1391067363,'Logged out'),(112,1,1,'dev@100yea.rs','67.53.113.42',1391105484,'Logged in'),(113,1,1,'dev@100yea.rs','67.53.113.42',1391108060,'Logged out'),(114,1,6,'julie@100yea.rs','67.53.113.42',1391108410,'Logged in'),(115,1,6,'julie@100yea.rs','67.53.113.42',1391111693,'Logged out'),(116,1,6,'julie@100yea.rs','67.53.113.42',1391122997,'Logged in'),(117,1,1,'dev@100yea.rs','76.169.36.76',1391189536,'Logged in'),(118,1,1,'dev@100yea.rs','76.169.36.76',1391192377,'Logged in'),(119,1,1,'dev@100yea.rs','76.169.36.76',1391192642,'Custom Field Deleted:&nbsp;homepage_map_item_subtitle'),(120,1,1,'dev@100yea.rs','76.169.36.76',1391193919,'Logged in'),(121,1,6,'julie@100yea.rs','67.53.113.42',1391196783,'Logged in'),(122,1,1,'dev@100yea.rs','76.169.36.76',1391198029,'Logged out'),(123,1,1,'dev@100yea.rs','76.169.36.76',1391198055,'Logged in'),(124,1,1,'dev@100yea.rs','76.169.36.76',1391198207,'Logged in'),(125,1,1,'dev@100yea.rs','76.169.36.76',1391199105,'Field Group Created:&nbsp;Gallery'),(126,1,1,'dev@100yea.rs','76.169.36.76',1391199167,'Channel Created:&nbsp;&nbsp;Gallery'),(127,1,1,'dev@100yea.rs','76.169.36.76',1391201583,'Logged out'),(128,1,6,'julie@100yea.rs','67.53.113.42',1391206034,'Logged out');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),(2,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y');
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
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_formatting`
--

LOCK TABLES `exp_field_formatting` WRITE;
/*!40000 ALTER TABLE `exp_field_formatting` DISABLE KEYS */;
INSERT INTO `exp_field_formatting` VALUES (1,1,'none'),(2,1,'br'),(3,1,'markdown'),(4,1,'xhtml'),(5,2,'none'),(6,2,'br'),(7,2,'markdown'),(8,2,'xhtml'),(9,3,'none'),(10,3,'br'),(11,3,'markdown'),(12,3,'xhtml'),(13,4,'none'),(14,4,'br'),(15,4,'markdown'),(16,4,'xhtml'),(17,5,'none'),(18,5,'br'),(19,5,'markdown'),(20,5,'xhtml'),(21,6,'none'),(22,6,'br'),(23,6,'markdown'),(24,6,'xhtml'),(25,7,'none'),(26,7,'br'),(27,7,'markdown'),(28,7,'xhtml'),(29,8,'none'),(30,8,'br'),(31,8,'markdown'),(32,8,'xhtml'),(33,9,'none'),(34,9,'br'),(35,9,'markdown'),(36,9,'xhtml'),(37,10,'none'),(38,10,'br'),(39,10,'markdown'),(40,10,'xhtml'),(41,11,'none'),(42,11,'br'),(43,11,'markdown'),(44,11,'xhtml'),(45,12,'none'),(46,12,'br'),(47,12,'markdown'),(48,12,'xhtml'),(49,13,'none'),(50,13,'br'),(51,13,'markdown'),(52,13,'xhtml'),(53,14,'none'),(54,14,'br'),(55,14,'markdown'),(56,14,'xhtml'),(57,15,'none'),(58,15,'br'),(59,15,'markdown'),(60,15,'xhtml'),(61,16,'none'),(62,16,'br'),(63,16,'markdown'),(64,16,'xhtml'),(65,17,'none'),(66,17,'br'),(67,17,'markdown'),(68,17,'xhtml'),(69,18,'none'),(70,18,'br'),(71,18,'markdown'),(72,18,'xhtml'),(73,19,'none'),(74,19,'br'),(75,19,'markdown'),(76,19,'xhtml'),(77,20,'none'),(78,20,'br'),(79,20,'markdown'),(80,20,'xhtml'),(81,21,'none'),(82,21,'br'),(83,21,'markdown'),(84,21,'xhtml'),(191,48,'markdown'),(190,48,'br'),(189,48,'none'),(188,47,'xhtml'),(187,47,'markdown'),(186,47,'br'),(185,47,'none'),(93,24,'none'),(94,24,'br'),(95,24,'markdown'),(96,24,'xhtml'),(97,25,'none'),(98,25,'br'),(99,25,'markdown'),(100,25,'xhtml'),(101,26,'none'),(102,26,'br'),(103,26,'markdown'),(104,26,'xhtml'),(105,27,'none'),(106,27,'br'),(107,27,'markdown'),(108,27,'xhtml'),(109,28,'none'),(110,28,'br'),(111,28,'markdown'),(112,28,'xhtml'),(113,29,'none'),(114,29,'br'),(115,29,'markdown'),(116,29,'xhtml'),(117,30,'none'),(118,30,'br'),(119,30,'markdown'),(120,30,'xhtml'),(223,56,'markdown'),(222,56,'br'),(221,56,'none'),(183,46,'markdown'),(182,46,'br'),(181,46,'none'),(129,33,'none'),(130,33,'br'),(131,33,'markdown'),(132,33,'xhtml'),(133,34,'none'),(134,34,'br'),(135,34,'markdown'),(136,34,'xhtml'),(137,35,'none'),(138,35,'br'),(139,35,'markdown'),(140,35,'xhtml'),(141,36,'none'),(142,36,'br'),(143,36,'markdown'),(144,36,'xhtml'),(145,37,'none'),(146,37,'br'),(147,37,'markdown'),(148,37,'xhtml'),(149,38,'none'),(150,38,'br'),(151,38,'markdown'),(152,38,'xhtml'),(153,39,'none'),(154,39,'br'),(155,39,'markdown'),(156,39,'xhtml'),(157,40,'none'),(158,40,'br'),(159,40,'markdown'),(160,40,'xhtml'),(161,41,'none'),(162,41,'br'),(163,41,'markdown'),(164,41,'xhtml'),(165,42,'none'),(166,42,'br'),(167,42,'markdown'),(168,42,'xhtml'),(227,57,'markdown'),(226,57,'br'),(225,57,'none'),(224,56,'xhtml'),(173,44,'none'),(174,44,'br'),(175,44,'markdown'),(176,44,'xhtml'),(177,45,'none'),(178,45,'br'),(179,45,'markdown'),(180,45,'xhtml'),(184,46,'xhtml'),(192,48,'xhtml'),(193,49,'none'),(194,49,'br'),(195,49,'markdown'),(196,49,'xhtml'),(197,50,'none'),(198,50,'br'),(199,50,'markdown'),(200,50,'xhtml'),(201,51,'none'),(202,51,'br'),(203,51,'markdown'),(204,51,'xhtml'),(205,52,'none'),(206,52,'br'),(207,52,'markdown'),(208,52,'xhtml'),(209,53,'none'),(210,53,'br'),(211,53,'markdown'),(212,53,'xhtml'),(213,54,'none'),(214,54,'br'),(215,54,'markdown'),(216,54,'xhtml'),(217,55,'none'),(218,55,'br'),(219,55,'markdown'),(220,55,'xhtml'),(228,57,'xhtml'),(229,58,'none'),(230,58,'br'),(231,58,'markdown'),(232,58,'xhtml'),(233,59,'none'),(234,59,'br'),(235,59,'markdown'),(236,59,'xhtml'),(237,60,'none'),(238,60,'br'),(239,60,'markdown'),(240,60,'xhtml'),(241,61,'none'),(242,61,'br'),(243,61,'markdown'),(244,61,'xhtml'),(245,62,'none'),(246,62,'br'),(247,62,'markdown'),(248,62,'xhtml');
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,1,'Homepage Hero Slider'),(2,1,'Homepage Mission and Pictograms'),(3,1,'Homepage Map Items'),(4,1,'Media Mentions'),(5,1,'Blog'),(6,1,'Homepage Map Categories'),(7,1,'Homepage Bottom Carousel'),(8,1,'Programs'),(9,1,'Gallery');
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0','YTowOnt9','n'),(2,'text','1.0','YTowOnt9','n'),(3,'textarea','1.0','YTowOnt9','n'),(4,'date','1.0','YTowOnt9','n'),(5,'file','1.0','YTowOnt9','n'),(6,'grid','1.0','YTowOnt9','n'),(7,'multi_select','1.0','YTowOnt9','n'),(8,'checkboxes','1.0','YTowOnt9','n'),(9,'radio','1.0','YTowOnt9','n'),(10,'relationship','1.0','YTowOnt9','n'),(11,'rte','1.0','YTowOnt9','n'),(12,'wygwam','3.2.2','YTowOnt9','y'),(13,'freeform','4.1.3','YTowOnt9','n');
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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'Clinton_Foundation_Logo.png',1,'/var/www/starkey/www/uploads/Clinton_Foundation_Logo.png','image/png','Clinton_Foundation_Logo.png',38236,NULL,NULL,NULL,1,1390196588,1,1390196588,'200 200'),(2,1,'TaniAustin.jpg',1,'/var/www/starkey/www/uploads/TaniAustin.jpg','image/jpeg','TaniAustin.jpg',69284,NULL,NULL,NULL,1,1390196612,1,1390196612,'914 1920'),(3,1,'HERO-Commitment_to_Action_Film.jpg',1,'/var/www/starkey/www/uploads/HERO-Commitment_to_Action_Film.jpg','image/jpeg','HERO-Commitment_to_Action_Film.jpg',776028,NULL,NULL,NULL,1,1390197274,1,1390197274,'863 1537'),(4,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',1,'/var/www/starkey/www/uploads/HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',593029,NULL,NULL,NULL,1,1390197738,1,1390197738,'901 1604'),(5,1,'CAROUSEL-Celebrity_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Celebrity_Film.jpg','image/jpeg','CAROUSEL-Celebrity_Film.jpg',475187,NULL,NULL,NULL,1,1390199154,1,1390199154,'932 1667'),(6,1,'CAROUSEL-Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Listen_Carefully.jpg','image/jpeg','CAROUSEL-Listen_Carefully.jpg',365844,NULL,NULL,NULL,1,1390199537,1,1390199537,'833 1484'),(7,1,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','image/jpeg','CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',670536,NULL,NULL,NULL,1,1390199867,1,1390199867,'943 1676'),(8,1,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_.jpg',472023,NULL,NULL,NULL,1,1390200146,1,1390200146,'909 1614'),(9,1,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_1.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',472023,NULL,NULL,NULL,1,1390200232,1,1390200232,'909 1614'),(10,1,'CAROUSEL-William_F._Austin_Legacy_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film.jpg',472023,NULL,NULL,NULL,1,1390200330,1,1390200332,'909 1614'),(11,1,'icon_now.png',1,'/var/www/starkey/www/uploads/icon_now.png','image/png','icon_now.png',3574,NULL,NULL,NULL,1,1390200625,1,1390200625,'56 56'),(12,1,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',497551,NULL,NULL,NULL,1,1390202028,1,1390202028,'520 936'),(13,1,'info_livesimpacted.jpg',1,'/var/www/starkey/www/uploads/info_livesimpacted.jpg','image/jpeg','info_livesimpacted.jpg',421949,NULL,NULL,NULL,1,1390202277,1,1390202277,'198 252'),(14,1,'info_livesindirectly.jpg',1,'/var/www/starkey/www/uploads/info_livesindirectly.jpg','image/jpeg','info_livesindirectly.jpg',419656,NULL,NULL,NULL,1,1390202291,1,1390202291,'198 252'),(15,1,'info_totalaids.jpg',1,'/var/www/starkey/www/uploads/info_totalaids.jpg','image/jpeg','info_totalaids.jpg',429588,NULL,NULL,NULL,1,1390202303,1,1390202303,'198 252'),(16,1,'Blog_Philippines_.jpg',1,'/var/www/starkey/www/uploads/Blog_Philippines_.jpg','image/jpeg','Blog_Philippines_.jpg',109435,NULL,NULL,NULL,1,1390202735,1,1390202735,'705 1024'),(17,1,'Dave_Fabry.jpg',1,'/var/www/starkey/www/uploads/Dave_Fabry.jpg','image/jpeg','Dave_Fabry.jpg',5586954,NULL,NULL,NULL,1,1390203283,1,1390203283,'3744 5616'),(18,1,'Blog_A_Knight.jpg',1,'/var/www/starkey/www/uploads/Blog_A_Knight.jpg','image/jpeg','Blog_A_Knight.jpg',489257,NULL,NULL,NULL,1,1390239202,1,1390239202,'1571 1992'),(19,1,'HERO-Vikings_Mission-IMG_6312.jpg',1,'/var/www/starkey/www/uploads/HERO-Vikings_Mission-IMG_6312.jpg','image/jpeg','HERO-Vikings_Mission-IMG_6312.jpg',416512,NULL,NULL,NULL,6,1391040192,6,1391040192,'496 936'),(20,1,'PeaceinWestBank.jpg',1,'/var/www/starkey/www/uploads/PeaceinWestBank.jpg','image/jpeg','PeaceinWestBank.jpg',121580,NULL,NULL,NULL,6,1391041006,6,1391041006,'680 1024'),(21,1,'September_Newsletter.jpg',1,'/var/www/starkey/www/uploads/September_Newsletter.jpg','image/jpeg','September_Newsletter.jpg',111923,NULL,NULL,NULL,6,1391064515,6,1391064515,'680 1024'),(22,1,'CAROUSEL-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Peru_Mission-02-DSC07062.jpg','image/jpeg','CAROUSEL-Peru_Mission-02-DSC07062.jpg',582871,NULL,NULL,NULL,6,1391123133,6,1391123133,'639 936'),(23,1,'westbank2.jpeg',1,'/var/www/starkey/www/uploads/westbank2.jpeg','image/jpeg','westbank2.jpeg',110244,NULL,NULL,NULL,6,1391199395,6,1391199395,'480 640'),(24,1,'special_olympics_mission.jpg',1,'/var/www/starkey/www/uploads/special_olympics_mission.jpg','image/jpeg','special_olympics_mission.jpg',20900,NULL,NULL,NULL,6,1391199945,6,1391199945,'220 330'),(25,1,'Screen_Shot_2014-01-31_at_12.29.23_PM.png',1,'/var/www/starkey/www/uploads/Screen_Shot_2014-01-31_at_12.29.23_PM.png','image/png','Screen_Shot_2014-01-31_at_12.29.23_PM.png',959232,NULL,NULL,NULL,6,1391200188,6,1391200193,'474 1440'),(26,1,'listencarefullygallery2.png',1,'/var/www/starkey/www/uploads/listencarefullygallery2.png','image/png','listencarefullygallery2.png',1155901,NULL,NULL,NULL,6,1391200463,6,1391200475,'476 1440');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_form_entries_2`
--

LOCK TABLES `exp_freeform_form_entries_2` WRITE;
/*!40000 ALTER TABLE `exp_freeform_form_entries_2` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
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
INSERT INTO `exp_grid_columns` VALUES (1,4,'channel',0,'file','slot_1','slot_1','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(2,4,'channel',1,'file','slot_2','slot_2','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(3,4,'channel',2,'file','slot_3','slot_3','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(4,60,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(5,60,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(6,60,'channel',3,'text','URL','url','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(7,60,'channel',4,'text','CTA Text','cta_text','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(8,61,'channel',0,'text','Title','title','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(9,61,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(10,61,'channel',2,'date','Date','date','','n','n',0,'{\"localize\":true,\"field_required\":\"n\"}'),(11,61,'channel',3,'text','Link','link','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(12,61,'channel',4,'text','CTA','cta','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(13,60,'channel',1,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(14,62,'channel',0,'file','Image','image','','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"1\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_required\":\"n\"}'),(15,62,'channel',1,'text','Video','video','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}');
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
INSERT INTO `exp_members` VALUES (1,1,'dev@100yea.rs','100YRS','a8a7b03cba67d17d2ab5be34c9079ba33d1a1cb6cb864a9aa5007ac25bd8b059d76a2f75350ac5f1bedcff3b71dd878f1be88dcfbdf5d3cab855dcf5187212a7','EkVtF:M>jnMhU/SMX(=q$*5gN28)NItXmg?K)|yJg7_H.Wi;4-`Ut<L1Wiu:dse}x;m/pqhGbh1aEGVlN2^%V{;=)FA6\'uOPR?mEDy5Nxu2Wax2v(knj(:eG>8BP\\\\,=','9f103e0f65ebdd0f0071291566aa0b4ec2c0ce3a','efa1131cff05bf5812eeffa169757ded10ce276e',NULL,'dev@100yea.rs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'10.11.0.1',1383699021,1391107782,1391201583,15,0,0,0,1390963956,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18','',NULL,'n',0,'y',0),(2,1,'taylor_joseph','Taylor Joseph','d20885cf421ceae1fa04b3a1a3992b8dc6c42ca802a1180d8b032923319c9fb433baa5efeadd919f690f34add079a66f87a270c782ffe4b738122ae382313d13','^.~=fwa3Cemv@z:=#BSGn+iU-sVH$k8L8_6k|S6~@_lCql3fjB86rE1!u&DF6-FTo:kn/.\\4,$8RgD<v/_`K7K\\/\\\'GMq@7EAMp\'bO%Z\'[r\\]lY){pRW2R[KBat%dTX;','0f194eb9cb74f4354d309168b2cf28f22b33035a','ff6cfdb53f105bf771eebde3464924b440931c4a',NULL,'Taylor_Joseph@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850428,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'trinh_mai','Trinh Mai','4af7e123cfd0eb006ff307e029e60d84a9605df47460ee2e9f8603c69d4ba6862e6cc7b311b91d59ddbc9a234dc738292fdd5424dc395d8722f637894f069533','fUd)AD)k(|_rjDR/bWfLOR%}?Kov_~\'q3Y\'~Skf?sYWZ`;Z4.agpI%+&l:I0C@S},}xzN/BI`O6*fCFlgR2pXh%C<X_NqS[^6$&,v8YeGuP7S>MU~Sc-8\'rp8cq93S5_','2a35c0eb5685fb2a80c82f6cf386813ccc5ebfec','7f16667d0fc7fa3c9cda673b2372442193108e2c',NULL,'Trinh_Mai@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'laura_hetzel','Laura Hetzel','f31af15e4df9066600604e5241f9dcd4871ae789f67ade5d94d30ad98326beacd09e6a8fe61408c639d0ba0fd6bc65f63254b20342d50d9d052c5003a712c6bf','*q{*<U!9;t1[fdpy[8t4w]P<045n}5*\"hw]*,bZQo&zUoywdYSRT\\8z0KO5$mT\'Uj~u#2,Z&\"J]Xp5FCfJH3|LWFI7!}VyijN98},k40n7A*:?kK)fN)n(bTJ&r?H\\#c','968d5b7895b7e24e58be8e3575dd2d6c134fc476','332b1fb5073f09dbf7468e1a2b0d65bc8a56af92',NULL,'Laura_Hetzel@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850495,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'randall_ward','Randall Ward','4ff34fe515b1476d91a1ab21fd22609af97f7c6c969320c18b49367dbd27c7ae9b227e2cee9ac01e4d8bfe00f3f9ee7b76383031c9eb10ede0ef177767f0d0e6','#$.Ln^2*0E}w#0pmZU\'JvCv\\:US04A5e#,_7?\'jQ/=z:\"`|EuoB6\"(L9QuOh/6nbtDrkeN7ST4O|\'zL[;+:!Mdl\\scJvO,t+?AN^}zyem@f(%W-@:?ph<xl%uVD{WDTE','0ea2c818353df42c5f031017b53739481035fb6a','0c30f8fcd22592abb65ce9399db9e0e0feede1bd',NULL,'Randall_Ward@starkeyhearingfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850564,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'julie@100yea.rs','Julie','2c1165ca027fa015339d532b45aac4472419a40f1cdcccac7db78ae4f7a7575c9b705301695a54265f2143ccd0aa1ea1e03d62f24f3a26bb50645b729a917ca9',']y\\X@r{`sR^Jh=#r#Q-9BW!}DD(yT6_x<$,\"N/xro:M`v}(:ui;TDePq!]_]dhx`~<.\\g_4x=^&\\:h}Xied@auH0\"g&KUTWDb\\hHM}@?Etk;E{,b6wHrh^B_m;G!bK|J','9444d23d017fe0fb04505a0d6c41e8ec9275578a','a86408905268b712456c93cc4b374b2293ab63a9',NULL,'julie@100yea.rs','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390865267,1391127648,1391206034,9,0,0,0,1391200430,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(7,5,'tulika_bose','Tulika Bose','b4326e7a34c0875c944e4c8f8fe242d78d1ba805a53b3307053ca5efa1430c2965207a465552c874f9d71875b3e829551d0cd65e741d5cd3ea37651f35fa8a86','I]$m=VBBlaB*+n\'`7,K1x?YhI,~t}qao0GN%^2_\'N@\'!\\DO\"Skmiu\'s{]:L)+g\"|&}JYyf1n:)t7{$w:jQzAl-Oi0.}\\9.]\\|Uq*8&y^>Bv\'dV3G;.i4hsjC]T:uA.ij','9ad103500d30fb95dede1cd734acfd2c566c34a6','f852d5c7028ebacdeed5f2442afad2d7cfc0da29',NULL,'Tulika_Bose@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(8,5,'megan_sheley','Megan Sheley','a8d94a9de0e8eaaeea268469640a73ba4d81930f6d4bfb5ca913861871a62fa9d89de6b08a1b7d4bb881519855e7ba4da3e16d41e3b7e7a8ba67e9ba99e4af7a','NQAOe2\"V<=~g}:~wBsF~B4Oy4$^NOj-CdW4+iRsoo-~2~6XE-@nBy0Ee4H7QW\\U^V.}AP3eX,~XO9J|z:g_*[xPhT(wzJ.YrMzRCdg6uus\"a]aAZt7YE\'3*+=6AY]G\\z','959e59ff8c8d14aec02135972b2757dbb5f08611','c134aecae31953d508b66a656cbe5632d6e77728',NULL,'Megan_Sheley@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975508,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Comment','2.3.1','y','n'),(2,'Email','2.0','n','n'),(3,'Emoticon','2.0','n','n'),(4,'Jquery','1.0','n','n'),(5,'Pages','2.2','y','y'),(6,'Rss','2.0','n','n'),(7,'Search','2.2.1','n','n'),(8,'Channel','2.0.1','n','n'),(9,'Member','2.1','n','n'),(10,'Stats','2.0','n','n'),(11,'Rte','1.0.1','y','n'),(12,'Wygwam','3.2.2','y','n'),(13,'Freeform','4.1.3','y','n');
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
INSERT INTO `exp_password_lockout` VALUES (1,1390175380,'172.251.100.146','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36','qa100yrs'),(2,1390175391,'172.251.100.146','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36','qa100yrs'),(3,1390175978,'172.251.100.146','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36','dev@100yea.rs'),(4,1390934626,'172.251.100.146','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36','julie@100yea.rs'),(5,1390942111,'67.53.113.42','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36','dev@100yea.rs'),(6,1391037045,'76.169.36.76','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.102 Safari/537.36','dev@100yea.rs'),(7,1391196775,'67.53.113.42','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.77 Safari/537.36','julie@100yea.rs');
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
INSERT INTO `exp_relationships` VALUES (2,10,9,5,0,0,0,0),(8,14,12,47,0,0,0,1),(10,15,12,47,0,0,0,2),(9,15,14,47,0,0,0,1),(11,23,14,47,0,0,0,1),(12,23,12,47,0,0,0,2),(15,24,13,47,0,0,0,1);
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
) ENGINE=MyISAM AUTO_INCREMENT=3490 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (3489,1391207433,'0','e17da5b5870634667507fd25c5e09053d5404b9b',0),(3488,1391206050,'0','76116271e3add1f97b62da7a64db9da642873888',0),(3487,1391206050,'0','7007be4a50c88b7b2c6efce278852551f5813f0e',0),(3486,1391206034,'0','7120b120be509db984cbe59c78614504e4bd8f3e',0),(3485,1391206034,'64fcce012a2ca671aec570d552aa92c5863d5f75','43d007dd1ea374d27a804a4e8284e6c6b6ff154b',0),(3484,1391202818,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','0cc3b0b629cf7b790f691cd56c38b6664b506a3b',0),(3483,1391202817,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','33ebb44bebefd8d27bf5a939cb24bd03b9ae5c41',0),(3482,1391202747,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','9170646b6f6d96206d67233a599c4ae691ddd2ae',0),(3481,1391202747,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','9b7722c8b5e553527caaae913d3c7df57c533247',0),(3480,1391202746,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','1337f709ca23ca27e77035c115ea0edd3406da37',0),(3479,1391202107,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','5062c3c99d7227671d7ac2a48a34f3cceeece01b',0),(3478,1391202107,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','55065c647b23001cc442dcfb4545418a43101879',0),(3477,1391202106,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','51ea234c8204676ae3cbe2cf1bfbc9a81622c18a',0),(3476,1391201979,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','dc00dd31cb2ceb747b9e5d763259f2e137f17998',0),(3475,1391201973,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','9d5c130d8203f8b8228877a007afb031e83bff9e',0),(3474,1391201973,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','151616d5eb85cce5991162e9d1ffde54b74592f3',0),(3473,1391201599,'0','23176f5e8443e2b1282fdd7e3584ffa850e07c5b',0),(3472,1391201599,'0','6a52d8db3329f9a92af6067f7899f040e58f232a',0),(3471,1391201583,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','256d8339606b0caa1e9ad03c65caf14fa01fd953',0),(3470,1391200524,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','0074e20bd174401b9bf0f307495ead0449e2e6b7',0),(3469,1391200524,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','339eed80bd5df2cff6cb6efccff7c5d0ec3eb082',0),(3468,1391200523,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','0650e09c6f65d44d78bc23ea29cd1c3daf19daa0',0),(3467,1391200523,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','4a942bacd656c7ccb84d7ac57ab0d08c6d3f88ea',1),(3466,1391200521,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','38e9f4ffd40c9e7da1e8b56ba63e462df8f43ef3',0),(3465,1391200509,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','fdead7f07814bb32897d92b1ea20985ef398a2b3',0),(3464,1391200509,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','a15b16c02d8da879685952a3ec0e6420cc75a9d6',0),(3463,1391200509,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','b2230bbc7dd5516088187a4ad1aedede3cf45baa',0),(3462,1391200508,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','591bc060f31fbf6febac3ac781b461ced8f0bfee',0),(3461,1391200501,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','5a6b0ce66e9b9adcdb883f777f75ace6b2743fb5',0),(3460,1391200501,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','213ab763eff34f2cb8c75baab14b6eeb165c956c',0),(3459,1391200500,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6280d5ff5fca8918c7296a879e44a9b0cb065a33',0),(3458,1391200500,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','bda2dcf040282fdabbb6269b468c515245c0d48d',0),(3457,1391200481,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','b181f19e5661bc09134263a41b73692852b2b2a6',0),(3456,1391200481,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6863deef361d8716770dfa44476e14dd831df558',0),(3455,1391200478,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','8cdbbc7b2071107e531768fb85a59531cbd37d37',0),(3454,1391200478,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','357955b8439a434f07f4bc406aa64ff2a688f2e0',1),(3453,1391200475,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','03949fe8e98849ca25ac9345679523853c676d73',0),(3452,1391200463,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','61aa8ce69f4e7dd87c9be325cd412a0e53013b1c',1),(3451,1391200442,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6a06baf85d52eb6d8e5ef17d1567d014f6f89b5c',1),(3450,1391200438,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','3953c56efd27b5d73de1a6ea6005a9e2ef5641a8',1),(3449,1391200434,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','395b31b6163d74a0a00111f128e5a5eb5d44f87c',0),(3448,1391200434,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','bf55d71a04b2bef6880faa87cfc8908a4a6ab8ad',0),(3447,1391200433,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','7ee1d4c2bcf9bc22b803c3e0acf05c28214838d8',0),(3446,1391200433,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','3dc57cd5aebfa50efdecd5a8ae935a06677a3553',1),(3445,1391200431,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','dd884bbf55162046c8da69d65280bbdd5e19def6',0),(3444,1391200430,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','18a8b342ee04066ca78f9ecda10ab11ff8dd4437',0),(3443,1391200422,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6e7e5fac34caed40ac5e7cdae5e54a0d6770c6b1',0),(3442,1391200422,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','fa0dfb962714cb65076e6eb627f9be85e3b31acd',0),(3441,1391200421,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','387ca4b578f93142967cf39422141bd097f08ff2',0),(3440,1391200421,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','df0dc3573ccff2c8c30f34b10ace88b57ba562cb',1),(3439,1391200299,'d7f587051b3dc136c5648dbf60f721c2706f38d0','83974dfc600d725dc3e9bdda123b8550cf74bc10',0),(3438,1391200288,'d7f587051b3dc136c5648dbf60f721c2706f38d0','bf12374f24d32ddcc82d337d5df087767731171a',0),(3437,1391200288,'d7f587051b3dc136c5648dbf60f721c2706f38d0','23947f260c19cc73f74b8acc653c7118e30d1b7c',0),(3436,1391200239,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6533e1daa914617f6cddc33fbf29d921f9660aa1',0),(3435,1391200239,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a6b4805db3d965c21c99779671a062c14be6f7e7',0),(3434,1391200238,'d7f587051b3dc136c5648dbf60f721c2706f38d0','dddb059156f80b6a5e237367ceb340a5cae287e4',0),(3433,1391200238,'d7f587051b3dc136c5648dbf60f721c2706f38d0','d6b1fa2cd1707b090cff73b822aac9b7049509a1',1),(3432,1391200236,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e9fc1ce31296980717e147d4137771502f4febe9',0),(3431,1391200223,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2bf8dde72340bea4f50b733145778ad428846d7a',0),(3430,1391200209,'d7f587051b3dc136c5648dbf60f721c2706f38d0','b9a13142020579f5ea061599f5e11ed4a2dd2c4e',0),(3429,1391200209,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7a681d425e6a42bb305522d34c00e76cc85efcb2',0),(3428,1391200203,'d7f587051b3dc136c5648dbf60f721c2706f38d0','b2d3da8cf10b69f58987e9c0d288635ba0a0cc9e',1),(3427,1391200203,'d7f587051b3dc136c5648dbf60f721c2706f38d0','70e917a0bb2fbfb8455810d89ebea3015eb93aaa',0),(3426,1391200196,'d7f587051b3dc136c5648dbf60f721c2706f38d0','f3c9ec7ee3d5babf2dc9cc8115c03487829b8971',0),(3425,1391200193,'d7f587051b3dc136c5648dbf60f721c2706f38d0','615cc4e46f90e7a04defaaca05de2fa348c7ea19',1),(3424,1391200188,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6d3b8d63320e4d473cb9c01172f39d5f9f764395',1),(3423,1391200177,'d7f587051b3dc136c5648dbf60f721c2706f38d0','8c85321bf7e71cdae764a588b029d6dc49d55d63',1),(3422,1391200176,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e0190f74c0e270a069fc0e875fb5d24fb87bc4ae',1),(3421,1391200160,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5f31aa0d4c9bec614ecd3823d820c77f8b431791',1),(3420,1391200096,'d7f587051b3dc136c5648dbf60f721c2706f38d0','acd15bcf1f3f35865d63ece3e008053c031b7673',0),(3419,1391200096,'d7f587051b3dc136c5648dbf60f721c2706f38d0','995d522ac39b376b19b31ff2bdc0484ebc4ba28c',0),(3418,1391200096,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ed6a753071a97634942e6fccdcc590528951b5b3',0),(3417,1391200095,'d7f587051b3dc136c5648dbf60f721c2706f38d0','0a8bff93ad419107bd2f97f888992538595f023f',1),(3416,1391200088,'d7f587051b3dc136c5648dbf60f721c2706f38d0','10be5c482ea10bf768193d84a6a00939a9a07b97',0),(3415,1391200080,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1d050414d5c144931635f79bd1003b280092763b',0),(3414,1391200008,'d7f587051b3dc136c5648dbf60f721c2706f38d0','da2f7b6c577b696d38504bef0f453c9fb2547465',0),(3413,1391200008,'d7f587051b3dc136c5648dbf60f721c2706f38d0','0d0661a42baf3696250256ec11953c4f2f4f71b1',0),(3412,1391199947,'d7f587051b3dc136c5648dbf60f721c2706f38d0','50869a65695bbf18e49ddef9f9b5a06cea643761',0),(3411,1391199947,'d7f587051b3dc136c5648dbf60f721c2706f38d0','77c1f38418d4e2265f4cd08e0576ebc69857e594',1),(3410,1391199945,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e95390bfd5ee1933c1fe5b82608060c20f92ce36',0),(3409,1391199936,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1491e02888bc1e7dd71661e84848d01d0494a197',1),(3408,1391199933,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ce70a08fa41d6aeb15ce903c6741e45b85c385c2',1),(3407,1391199933,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a8787a621cfc1dd7eaee0603f0f34832f25de67d',1),(3406,1391199933,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e2ea0157dba2ac271e0885074462a124f41c6f24',1),(3405,1391199925,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1da2614b084c27eaa797b1f5382fc85cf4b208aa',1),(3404,1391199846,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ef38b62f88da33d18cef2aedf24982b0b4828a55',1),(3403,1391199846,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2c9062ed35291421a3d30f3ef76adbc3f42151db',0),(3402,1391199844,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7e09722bf2e62d540138bcaca6f42b11608c9316',1),(3401,1391199844,'d7f587051b3dc136c5648dbf60f721c2706f38d0','3aa70cabe93e2fe10006375a87eccb617c9319bd',1),(3400,1391199844,'d7f587051b3dc136c5648dbf60f721c2706f38d0','12fac90ac5a78771bf825682d6bd4cd94c6062f9',1),(3399,1391199842,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2b8cce5376c38a4a13425c2366a5588fccf5c616',1),(3398,1391199839,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6395d2e4b14f6bc2c7ca8feb4f466a57b478091d',0),(3397,1391199839,'d7f587051b3dc136c5648dbf60f721c2706f38d0','53324520003f2dc69c988c6887a7762d88c6998f',0),(3396,1391199839,'d7f587051b3dc136c5648dbf60f721c2706f38d0','0151370c214a84989904e4315f8314fcfd52f3d6',0),(3395,1391199838,'d7f587051b3dc136c5648dbf60f721c2706f38d0','f553e2cb5aad9a0eaebaa04180a3fca3cee797f9',1),(3394,1391199835,'d7f587051b3dc136c5648dbf60f721c2706f38d0','59daf507923f45534a9c5aecc9cbecb4058d16d3',0),(3393,1391199835,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1ecc1461dc5c51886d55444e85af0745a42167d7',0),(3392,1391199832,'d7f587051b3dc136c5648dbf60f721c2706f38d0','9061fa9dcee78af5de85c0f9af1ad6168009bfb8',0),(3391,1391199832,'d7f587051b3dc136c5648dbf60f721c2706f38d0','793f32831ce9255b6e58d41e63155812586b256d',0),(3390,1391199832,'d7f587051b3dc136c5648dbf60f721c2706f38d0','06de2007766129c75dac051befd63d1ede0b4b9a',0),(3389,1391199831,'d7f587051b3dc136c5648dbf60f721c2706f38d0','8b0c5defcb4138f2f23aa9215d13a5f36e4d338d',1),(3388,1391199827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5ebc7ea47a9c6d58a128239b8bbfa076c633c94c',0),(3387,1391199827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','8e357fbed1606d448686b6906a9bf8b9a418f7c6',0),(3386,1391199721,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e7fef6d90ec53c8c28304355c28eaa737ee9f55d',1),(3385,1391199626,'d7f587051b3dc136c5648dbf60f721c2706f38d0','b19c4ae1f30b0c5c2f7746830ada9561020f54c0',0),(3384,1391199626,'d7f587051b3dc136c5648dbf60f721c2706f38d0','4fd5e464e5497fe88e39e49ff74444f2979b89fc',0),(3383,1391199626,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2911a6eabb6b4b130fc7575cfea871eadcacab7f',0),(3382,1391199625,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a73b654f77efa08ae851831d6f94a98f9b264b53',1),(3381,1391199602,'d7f587051b3dc136c5648dbf60f721c2706f38d0','cedf46bbbc4a13789b5d75320eba938f0c8ece25',0),(3380,1391199598,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7e999e6947ff6fbb92541e50ec1cfd6231fb78dc',0),(3379,1391199572,'d7f587051b3dc136c5648dbf60f721c2706f38d0','98ca83375950300f53faa0b32b092836ef4997d5',0),(3378,1391199571,'d7f587051b3dc136c5648dbf60f721c2706f38d0','004154261400619e5e1f0166183b41df9c00802d',0),(3377,1391199571,'d7f587051b3dc136c5648dbf60f721c2706f38d0','cad19bbaedb3eeba3e228269eb20771f7ec793de',0),(3376,1391199439,'d7f587051b3dc136c5648dbf60f721c2706f38d0','846816573988b4ac2bea0eb9687ef1c25b2808a0',0),(3375,1391199439,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e87ec383f0809ef410b352edfdefc7dddfd830b4',1),(3374,1391199395,'d7f587051b3dc136c5648dbf60f721c2706f38d0','cfb8890c96c537b7d2802d5044eb70275ad4cfb8',0),(3373,1391199384,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7c1e9c8c59586103877d2896fc28635c7fff6e13',1),(3372,1391199382,'d7f587051b3dc136c5648dbf60f721c2706f38d0','4e13323c658f611c36e83a445a5595cd890c98cf',1),(3371,1391199340,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5099a454866c4a8c415a631a882f4d71de176092',1),(3370,1391199332,'d7f587051b3dc136c5648dbf60f721c2706f38d0','01d6bd41e3f1e025836b168d461dfe99e9844de6',1),(3369,1391199332,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7707c89e3b51afac2e49040d33ed6e6b419dcabc',0),(3368,1391199329,'d7f587051b3dc136c5648dbf60f721c2706f38d0','67cd2ae2c65ce5e0c2af46f7a1ae8fc5a3540986',1),(3367,1391199329,'d7f587051b3dc136c5648dbf60f721c2706f38d0','887f0574338b44785ab849d184a7993dad1d2805',1),(3366,1391199278,'d7f587051b3dc136c5648dbf60f721c2706f38d0','d6e94951d2500b8c34c85c11b11756c80ffcbe29',1),(3365,1391199224,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6531d3af71e264a7b4b6a31db56f4a6fc27e4061',1),(3364,1391199220,'d7f587051b3dc136c5648dbf60f721c2706f38d0','d8ed3daac073361ec9affaa1567c3796206af85a',1),(3363,1391199167,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','3222e561447255d9984b9e69fc146ae7f46bcd27',0),(3362,1391199167,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','437882cc618e0765ca8176bd800c3c929998a8e1',0),(3361,1391199159,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','59f7958f8c56c5ecdc512d19f5c254a4e8074bc7',1),(3360,1391199157,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','a63c4dc55de0ba5432829f51b441cf878f69b965',0),(3359,1391199151,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','14da7fea546f02f33ee44737069b5848ce7f48df',0),(3358,1391199151,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','9ace94fd4a7c371fc271cf4d7545caeffb90545c',0),(3357,1391199110,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','e3706b7d94ef1c8deff33c0503696202143b4996',1),(3356,1391199108,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','5346966c2de9bc777826ed6d19bd0e7c025e938e',0),(3355,1391199105,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','995a30c278ec8141a03e5a1909932d36c6717dc0',0),(3354,1391199105,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','6ed3362e35bb6102be078c65652f2356f5008592',0),(3353,1391199102,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ae7799b143e7e87e7c4d53c3cbaa46181104fe51',0),(3352,1391199102,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a9fedbe92353eb7616adb978dec76d8a219ca984',0),(3351,1391199101,'d7f587051b3dc136c5648dbf60f721c2706f38d0','06d944dd78736a4329fc8e8f9587a02d6cd3e2f6',0),(3350,1391199101,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','69d41bd3a58655c5bd765b8d87d64196003f8184',1),(3349,1391199098,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','8cc351ac18a7b06f9a8f3f87a88f81ca41d512c8',0),(3348,1391199091,'d7f587051b3dc136c5648dbf60f721c2706f38d0','453c74d93d1d48847e6eb956b2e7be352a617229',0),(3347,1391199091,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ec0f263c4e24546da78d80a79cc03fed8d46ea43',0),(3346,1391199091,'d7f587051b3dc136c5648dbf60f721c2706f38d0','73df44e7a1725b7dd5fd51596ac68e538ac1a439',0),(3345,1391199090,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6638f5934735f3a0d174deaa92b2a9cbbb79ee91',1),(3344,1391199089,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','13af1b0f49176a17aacc4b93955a69491f4d4b48',0),(3343,1391198689,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','9b4a3269f0b1aa9bc3eeab541628d522e61ca6b8',0),(3342,1391198685,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','38ceca4d3cf34bead139694e6b2f5463f79c7538',0),(3341,1391198523,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','777af0c81d1a081c62a2657697e1472fb9bc87e9',0),(3340,1391198207,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','4077f7a453ebfd863dd2c3b2c8e344a23064b996',0),(3339,1391198207,'0','d470760e756f53ad1cc05b6375a10bd8f60acb05',0),(3338,1391198065,'5e3023664d63bd40107a00008b2b9fbd175953e4','6d18f21543b7fd8f86aa167cbb167cbab67cc136',0),(3337,1391198055,'5e3023664d63bd40107a00008b2b9fbd175953e4','e8ec092fccbd9193028373d7f14ea073e0def367',0),(3336,1391198055,'0','d501e67b7521289d54b1465063417e06b33797c7',0),(3335,1391198038,'0','8373878c3463f5fe2068505cf64ad0506755b761',1),(3334,1391198038,'0','37e0a2ef195ea704757db64f34059eab273c8642',0),(3333,1391198038,'0','ac6cfe48e1b483ad38ceca04051c598110b27f37',0),(3332,1391198037,'0','6eaa1113dc8a1a5362821a01b17de25a37e3c972',0),(3331,1391198037,'0','148ecbd098b05a8dda1355243fffeeb6bcdefd66',0),(3330,1391198036,'0','8e134efc633421fd42ad0c89b337281635590465',0),(3329,1391198036,'0','ee68ce51d123d6aae2518d6fa5d4e8e963bb05f8',0),(3328,1391198036,'0','369336527147c755977027cc901d525305e570eb',1),(3327,1391198036,'0','73eb03970ae12c50af00632ce3e27d3123a82266',0),(3326,1391198036,'0','fd81b7abb289ea9b4dbe8926a055fc336062025d',0),(3325,1391198036,'0','7bb03358e0bc93a4bacaba6398eb12a7326a89a1',0),(3324,1391198029,'8091a16cf1ed7501dd6354382f176888d62bab5a','cfe37d8cb3ea7c6b4f925e43844b89a7c0bfd6b1',0),(3323,1391197592,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6a37e1555502c0d297d61bc9f169d992563e1ac1',0),(3322,1391197592,'d7f587051b3dc136c5648dbf60f721c2706f38d0','c22cc83493717a8bf279845f64955e5ac37aa6d8',0),(3321,1391197592,'d7f587051b3dc136c5648dbf60f721c2706f38d0','f6e98efb5e46c539824f777364f6adcfcbe6833c',0),(3320,1391197590,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5b7e2a1f20472dfb6b0e0b716921fd13c38a369a',0),(3319,1391197585,'d7f587051b3dc136c5648dbf60f721c2706f38d0','9c575df0d8c37ce673621e02e59a41c1afa1a6c7',0),(3318,1391197584,'d7f587051b3dc136c5648dbf60f721c2706f38d0','77b884c9e01094cef616d03ad93f5d6fd68d51ae',0),(3317,1391197569,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e3b1162adf4c2ede3de4eb7ca312de802e00e06d',0),(3316,1391197524,'d7f587051b3dc136c5648dbf60f721c2706f38d0','13d661bcac93ed9128348a8121e8dbe9291e21c6',1),(3315,1391197485,'d7f587051b3dc136c5648dbf60f721c2706f38d0','c8abca17870b3e47894859438bd2eadb6ea31b26',0),(3314,1391197485,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5e5574d6583d38c53584cedd114748679e8d6a6d',0),(3313,1391197485,'d7f587051b3dc136c5648dbf60f721c2706f38d0','98cb3d07c6f0ed497d8b41ce069c1d95f776a34e',0),(3312,1391197484,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a0b8d6f92bf53b002891c22c1382c91e969fed5a',0),(3311,1391196827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','abd3ea83b654cf44d12db927b8990a54dfe7baf9',0),(3310,1391196827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ccfd2cfe58374b1e7516c2ea3a11b7dc2cfa4788',0),(3309,1391196827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6e2e56caf87d472b662df8df0f72e8d4060d0740',0),(3308,1391196824,'d7f587051b3dc136c5648dbf60f721c2706f38d0','167b139973af662fdf20ea22ccca6558d075dd8e',0),(3307,1391196824,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6e4dcddae2783cc523c3c0668bec5d32f93b5a60',0),(3306,1391196816,'d7f587051b3dc136c5648dbf60f721c2706f38d0','32f6abe70d8efbc4e7a00de60ee98bfc6866596a',1),(3305,1391196816,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1754a13ea290323c3d5934f38f4bfe6005fa3260',0),(3304,1391196813,'d7f587051b3dc136c5648dbf60f721c2706f38d0','abd7486c6bb665c4e5eac159b1b63f632d930a79',1),(3303,1391196811,'d7f587051b3dc136c5648dbf60f721c2706f38d0','3fcba3dc51e67719f0025662fcbd6f2b5307095b',1),(3302,1391196795,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7714f4f227b20394fd863da07cdcb33972bfac3b',0),(3301,1391196795,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5deaad23bc33f25d24dbc0655105dd76e92ca339',0),(3300,1391196795,'d7f587051b3dc136c5648dbf60f721c2706f38d0','935123c526aa6067366055e48ab10734200eb176',0),(3299,1391196793,'d7f587051b3dc136c5648dbf60f721c2706f38d0','c8701330ab9665bcf3794709d4adab2caa0e1e99',1),(3298,1391196791,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5f80c50efe74b94a2101fca393a6c77e98bb6443',0),(3297,1391196783,'d7f587051b3dc136c5648dbf60f721c2706f38d0','eac2d4ebc56df5d87e4ea8b46ab56c875ea12fc7',0),(3296,1391196783,'0','c6a32d34daf04978bc1abaaebf96bd00cd90b5d4',0),(3295,1391196775,'0','06ae6406dc693a3711778bd3862151a37401b8b3',1),(3294,1391196775,'0','067c656f5ddc721776a05b49335e905af8329e15',0),(3293,1391196595,'0','a5b0ec7c3fb97dd5a149b49c82054ae1c6c66859',0),(3292,1391196595,'0','01501f7ac208958c39995bd9b2105baf0de65fb6',0),(3291,1391196594,'0','84c6aee938a2d45f18ce94baee6819a103c28b34',0),(3290,1391195462,'54d3cf74f6074c173350cd25145291b7d0b6cab0','433498872fb7ad77f84d6695c31c973762f5bc70',0),(3289,1391195461,'54d3cf74f6074c173350cd25145291b7d0b6cab0','106d846e9563652a4f1819507ffb9f5fb30ddba7',0),(3288,1391195447,'54d3cf74f6074c173350cd25145291b7d0b6cab0','77d0e4cb380e6e9cce2a7012aa7c1cf1195390ff',1),(3287,1391195445,'54d3cf74f6074c173350cd25145291b7d0b6cab0','5a406c8b79e48467cb6bda9752fff06e1a42b4b2',0),(3286,1391195444,'54d3cf74f6074c173350cd25145291b7d0b6cab0','e3b1607c9af48af8efc02470458cf05fbac8af8b',0),(3285,1391195368,'54d3cf74f6074c173350cd25145291b7d0b6cab0','c558ec0da4646df707403cd9a36a68cf34e95c8d',1),(3284,1391195364,'54d3cf74f6074c173350cd25145291b7d0b6cab0','9c1e2ac05f110d4a22d620f5a15666755d28b132',0),(3283,1391195364,'54d3cf74f6074c173350cd25145291b7d0b6cab0','f72874296e5d0c0645be47342d3af8e60ce1bcbc',0),(3282,1391195331,'54d3cf74f6074c173350cd25145291b7d0b6cab0','2fbac08505b28896f3c375e658a5cc82047f45e3',1),(3281,1391195320,'54d3cf74f6074c173350cd25145291b7d0b6cab0','75f2f52f8f68925b6c0ceaada323383d75cfabb1',0),(3280,1391195316,'54d3cf74f6074c173350cd25145291b7d0b6cab0','d1cb4331347285e4e8fc6a6e21f2927487dacb40',0),(3279,1391193924,'54d3cf74f6074c173350cd25145291b7d0b6cab0','7f489a876bfc27c78655e2a7fb33a9f53f2dee0e',0),(3278,1391193919,'54d3cf74f6074c173350cd25145291b7d0b6cab0','7f3d785cc9775cbfabb3d1502c2248fd3fe6382d',0),(3277,1391193919,'0','0ae929681d6b786f4962734d09f8a7fd454b4ab1',0),(3276,1391193915,'0','a24e68e929ce71b65daa5b03b1977e2130bd1eca',1),(3275,1391193915,'0','d697f51e0e449277b7f1d1a967053286560b7fc0',0),(3274,1391193915,'0','43fa57351ff9315e412195092b765ef0da3f2efe',0),(3273,1391193913,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','057a79c10241bdacdb133aab5ef8d32a41c9ec9c',0),(3272,1391193913,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','bcce5ad755bb8dcf1667f4a3bcbae37c9d2e9f21',0),(3271,1391193913,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','33c2db924dbaa8966f13686bb299a1f3925177b6',0),(3270,1391193121,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','6cc8c7687abb9eb5ea12f2f80db21c8203a1d12c',0),(3269,1391193121,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','624331fe43b47648e19d8be5053ad64cfa1822dc',0),(3268,1391193107,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','194ddffb0f58850e1c8b34168c08c1210f107414',1),(3267,1391193105,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','a8fb8456ef3e9f393e996f957a200c3b6e77f452',0),(3266,1391193104,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','edb57301cd1196803eef1074b02d31f232fd81a8',0),(3265,1391193090,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','7162df1876c52f54d4c4b9639dafbd3d57316206',1),(3264,1391193079,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','f22bfc18429943f032ea57516db17b37ea0f8343',0),(3263,1391193079,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','e8daef0d8c0b720150dad0a486c7657c6bba630c',0),(3262,1391193062,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','da91b672638563a4c7eb516913c8379df8277d4f',1),(3261,1391193058,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','46117f72eb990d40f438a61096cb99b6803a3455',0),(3260,1391193057,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','5fe623ede15057994c566af3c0029008456eb492',0),(3259,1391193034,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','8ca5fc22152e7c93c70af1ba1f0ef70f33bfeb3e',1),(3258,1391193030,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','d32b8ba851a4ecf9f191c8b50103105a367740de',0),(3257,1391193028,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','4d67955a38cfe9de82c716061d7b5da7b8c78577',0),(3256,1391193023,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','26c000c1964fb0db2799893c63d90135f36ff369',0),(3255,1391192642,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','03128ad84caa43039914050151f16d43ea8e9dcf',0),(3254,1391192642,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','3db2d8757aa222a00955aa5929c1d38b6b47a671',0),(3253,1391192640,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','a4518be904a9689e935d5e635adb56b230d43f57',1),(3252,1391192588,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','606a58fb8fcf370adc70b9b645b6be71232d32b8',0),(3251,1391192385,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','f6e7a0ab29c376c73ffdb2a99f321e343d481172',0),(3250,1391192378,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','579804738d308c50eb62e192f93d168f3a0aad61',0),(3249,1391192377,'0','bc9b9d193a3e2dabb8040c14307f26db0d8ad5fb',0),(3248,1391192373,'0','54c29a9e9266f7c42ff6d2dd4f1bf1bdc07a4913',1),(3247,1391192373,'0','aa93dcc5a623d6ff5fd08757ec4ecb39cbbf1961',0),(3246,1391192373,'0','a7b5f4e135a9818fef91d8d0f6e8f794d88a42ee',0),(3245,1391192372,'5f36237394f9097011b40a0ee8e3a141c333de2d','12a495e4a16e50b8980578db8e728734560ad9d7',0),(3244,1391192372,'5f36237394f9097011b40a0ee8e3a141c333de2d','29eb7f146dc129ac01600ee7ff77723eb71c4e3e',0),(3243,1391192371,'5f36237394f9097011b40a0ee8e3a141c333de2d','2f3d11f1edddaf94baadc7a407a9a0c5f0da41b8',0),(3242,1391192027,'0','eadc6d891dbf50880b3a81b3cd98eba8d9e84933',0),(3241,1391192027,'0','96d92ea99ae7dc0095b546d2817f5f404bacb0b6',0),(3240,1391191991,'0','e789c9338ffe0035cb36f0ddd6459007180826cf',0),(3239,1391191991,'0','342b3f77969e1a796901c857d5f3916075f20b68',0),(3238,1391191988,'0','fbd748e45b6e4001fe6d2ab3315dd6ad05d0c1aa',0),(3237,1391191723,'0','1323b65e1ff2695a797331131bbd48637f5aec9a',0),(3236,1391191723,'0','887ac8f1d18f7918fae0f1aefa36463793b30afc',0),(3235,1391191722,'0','e7cdb6935d602095687eac5187844567ba396d8d',0),(3234,1391191712,'0','2feeb1c4c5c12f370b41ad89ef509f3836b34e95',0),(3233,1391191711,'0','7baf687db0247a2ccba53c6a4dfd1cfc76ff6d2d',0),(3232,1391191711,'0','609d4b875eaa5249096b1734c87e4e56f2ccd169',0),(3231,1391191710,'0','516e6221eb8bf5344a20df172b241ded5d98f602',0),(3230,1391191669,'0','9d81876374b288d54d90cbe22baf70f5adf8694e',1),(3229,1391191669,'0','329810b29fc441fcb46554e5602877c50d08d430',0),(3228,1391191656,'0','5ad9b6e2218f76e7fad37202c836ff60665ad220',0),(3227,1391191656,'0','c3dd3b08830e98e699ea71fa84cd0cff2d291db9',0),(3226,1391189737,'5f36237394f9097011b40a0ee8e3a141c333de2d','7930e64d78aa8b0b03e327f218453441cb0bdfba',0),(3225,1391189737,'5f36237394f9097011b40a0ee8e3a141c333de2d','e41ded502e183a88cd53c2b18e54da7faf336a37',0),(3224,1391189737,'5f36237394f9097011b40a0ee8e3a141c333de2d','88c11447a3e1a3c9a651b206420efff763e59de0',0),(3223,1391189716,'5f36237394f9097011b40a0ee8e3a141c333de2d','3c003d8b7c36af27de350125b468183f77b368a1',1),(3222,1391189707,'5f36237394f9097011b40a0ee8e3a141c333de2d','7aecf9d878ba50f95b1a2f94bd825555da9c8240',0),(3221,1391189701,'5f36237394f9097011b40a0ee8e3a141c333de2d','dcab265a7b473926b5a6888a6c4cfba8350165c3',0),(3220,1391189701,'5f36237394f9097011b40a0ee8e3a141c333de2d','47e2bfacf55fc4020bbb224a5a38f1b9110b4552',0),(3219,1391189701,'5f36237394f9097011b40a0ee8e3a141c333de2d','c1cac5e1b1b2c7d6d5fc701f48f3b9ab3329dcdc',0),(3218,1391189696,'5f36237394f9097011b40a0ee8e3a141c333de2d','5bcd1e62db668230e898805ecaf69f0fa1fbd8dc',1),(3217,1391189692,'5f36237394f9097011b40a0ee8e3a141c333de2d','a36c5c255f77e0a49e0df9ea9249306fdb1532c5',0),(3216,1391189690,'5f36237394f9097011b40a0ee8e3a141c333de2d','e46a9136fad7b97f6c96dfef24f0d4e59b19b935',0),(3215,1391189690,'5f36237394f9097011b40a0ee8e3a141c333de2d','f90194bb906e3232587f667ea35521c8b92e9dfe',0),(3214,1391189690,'5f36237394f9097011b40a0ee8e3a141c333de2d','51d6e12c65a8cd7b6eb5085c3abff19f57d8c9e1',0),(3213,1391189649,'5f36237394f9097011b40a0ee8e3a141c333de2d','253342c84a642a52c3d25d63638ed4702966afdf',1),(3212,1391189643,'5f36237394f9097011b40a0ee8e3a141c333de2d','0b828c1e00544a85da6005ccb0f10b5605e0b3da',0),(3211,1391189619,'5f36237394f9097011b40a0ee8e3a141c333de2d','429fb4549df76e8218f05d2ff9d205a8715dc08b',0),(3210,1391189619,'5f36237394f9097011b40a0ee8e3a141c333de2d','59253e4c4e04454f152e786f8d3074bc3a232046',0),(3209,1391189619,'5f36237394f9097011b40a0ee8e3a141c333de2d','0b1f177419bf9fca3a9b91df5602bbafbd3dcfa9',0),(3208,1391189614,'5f36237394f9097011b40a0ee8e3a141c333de2d','37be5bf1a86da44b19e0eb6452788506333a622e',1),(3207,1391189613,'5f36237394f9097011b40a0ee8e3a141c333de2d','17dcd0940d67ccbb8adbdd78e0e9337760de2ff6',0),(3206,1391189612,'5f36237394f9097011b40a0ee8e3a141c333de2d','763658f2919853a045238b4c20d92ed0931c1d88',0),(3205,1391189612,'5f36237394f9097011b40a0ee8e3a141c333de2d','c31d20e16b4b211e945461730009db299ed94953',0),(3204,1391189608,'5f36237394f9097011b40a0ee8e3a141c333de2d','1b5c06336d3694f11fc261760350c7509b99f147',1),(3203,1391189606,'5f36237394f9097011b40a0ee8e3a141c333de2d','5c3c4f9c4de61fb31758e78f8c9a14855062869b',0),(3202,1391189606,'5f36237394f9097011b40a0ee8e3a141c333de2d','d3d06cd2b1ce01e3e813406f0cd5c918080a13db',0),(3201,1391189606,'5f36237394f9097011b40a0ee8e3a141c333de2d','8b954b8806e8b2dc5ea3e3bba75b2c8898ff8052',0),(3200,1391189601,'5f36237394f9097011b40a0ee8e3a141c333de2d','970343b97b7f44ad1c2a3de6808dd292d0e6c513',1),(3199,1391189593,'5f36237394f9097011b40a0ee8e3a141c333de2d','12aadc7c0529c588704d478f3a1baaf7e9074063',0),(3198,1391189593,'5f36237394f9097011b40a0ee8e3a141c333de2d','91dce62c16b7f9cace2f3ae033e676ed9fd2eeaf',0),(3197,1391189593,'5f36237394f9097011b40a0ee8e3a141c333de2d','339672ea29bdf9953627fbf78ecd91f1985beb2d',0),(3196,1391189588,'5f36237394f9097011b40a0ee8e3a141c333de2d','d5fbcf9a84564f35cbab976e8d726466ecf47400',1),(3195,1391189583,'5f36237394f9097011b40a0ee8e3a141c333de2d','1dbdb53056a1375cad4687509a96a97123b43f4d',0),(3194,1391189583,'5f36237394f9097011b40a0ee8e3a141c333de2d','4b1659d5c753a2e93e905fb808835e5c0c2ca28d',0),(3193,1391189583,'5f36237394f9097011b40a0ee8e3a141c333de2d','accc3ea2631518453f8a8f0d8a6b00bc79eaab4d',0),(3192,1391189578,'5f36237394f9097011b40a0ee8e3a141c333de2d','10f50c69e68aed3245d140e296741cd2a4edfe12',1),(3191,1391189576,'5f36237394f9097011b40a0ee8e3a141c333de2d','15101521f98211cdbb09ce4a9a517ecf54372d9a',0),(3190,1391189576,'5f36237394f9097011b40a0ee8e3a141c333de2d','5aaa7dc56ef5923ec74bb5dd300ccd1c342b9fe4',0),(3189,1391189576,'5f36237394f9097011b40a0ee8e3a141c333de2d','f7e0c9ac6f3fba0f94247ac07d63d8664467f845',0),(3188,1391189565,'5f36237394f9097011b40a0ee8e3a141c333de2d','29503348f0249cc724538a65e87a374bdbfd2378',1),(3187,1391189552,'5f36237394f9097011b40a0ee8e3a141c333de2d','cadee582ff696b513c1483cf0ac80647cae7526a',0),(3186,1391189545,'5f36237394f9097011b40a0ee8e3a141c333de2d','e8db0672bf9da1e05e536eae359301397cb70759',0),(3185,1391189543,'5f36237394f9097011b40a0ee8e3a141c333de2d','7fc773c09fb48ec4c30b0095ed472b0820d59bf6',0),(3184,1391189536,'5f36237394f9097011b40a0ee8e3a141c333de2d','bc31b574860e2c6f63683a5ad1f60c6634d3c4fb',0),(3183,1391189536,'0','b29f966986a8e7d8eedee7fbb2292bc6772fa78a',0),(3182,1391189466,'0','58b05847e44a2e0021bb0d9b21709d5b9ec241ad',1),(3181,1391189466,'0','94b0b07c361f6f96f993652e4b3f9211d9d499cc',0),(3180,1391189466,'0','7710b820b2308f67550c4f7d88e17fe1c49c741d',0),(3179,1391189464,'0','17c2b39912d819ba46a4acfb9d09f25713a6a83e',0),(3178,1391189464,'0','2f1637ea66ff97f29ec0d11567cbf2bcd42a4a7f',0),(3177,1391189463,'0','9a344ae2e0d12c2dbea337ace5c99084d00f5007',0),(3176,1391189462,'0','88a039e6c290d14edd6bde79e435f04351140997',0),(3175,1391138505,'0','01339bf0a21c6f000488948a928b1cea463cd9f3',0),(3174,1391138505,'0','8a3db8ef3537a2a16b2933f8fb863a40dd961cc4',0),(3173,1391138504,'0','53fbabc6cc18e8780b3f1f5163dbdc36458d7e42',0),(3172,1391138497,'0','8cc19f76bbcecaefc1131d5f0a5f75c8c2a395ea',0),(3171,1391138497,'0','2ddd14147d9d528f99be08b05d6ec503807c4967',0),(3170,1391138495,'0','ea2138ec032c67ed9f0b1fd35c0d0ecc8c7a3a66',0),(3169,1391131069,'0','fddd990a317396a9f3eaa3449ee3b9f62b8abc0b',0),(3168,1391131069,'0','c92379292e378f68a5be373d50249fa8156c4900',0),(3167,1391131028,'0','31061bda847fdc764be31855addf35a0cd7baf29',0),(3166,1391131028,'0','69f099036fc68d2a8bbdeb7e3de1e64037b73488',0),(3165,1391131028,'0','26703da004b4f1f09ce5282cb944d69656694b85',0),(3164,1391130604,'0','91a593a9f88aa4b4fb32bad3a716cc111c9bf352',0),(3163,1391130604,'0','baa1650ac57291c9662dfcfe54dde942f34f7004',0),(3162,1391130603,'0','8a0597d9b354c43ea712e33761890fa07f312a91',0),(3161,1391130602,'0','8e1c54cc79130c44dcbfd6e278a5799bb9278979',0),(3160,1391130601,'0','5ef907a89921f86285bb2384c4165d9a18cd5cc5',0),(3159,1391130598,'0','98261ce23790a63dd8db5ab287b9cdbbbf8c7b55',0),(3158,1391130597,'0','9a3240adc743a8ac08a810ac388daf911a5923b9',0),(3157,1391129885,'0','1b8747d222260388cb363f12ac5cb800593b42e5',0),(3156,1391129882,'0','ddc73676b222fc133f6ed91eacbe8407d6414182',0),(3155,1391129850,'0','0dba190515585a46cbc4ea4af84878e7691c122f',0),(3154,1391129850,'0','2ead759fadb92f6fcd2470150a054420c50460a1',0),(3153,1391129849,'0','81b17f23710dc49770dcf415ff46cb3d928779fb',0),(3152,1391129832,'0','46b13dd9f79dbc0c5616f27cb97eaafe7c595f16',0),(3151,1391129832,'0','2f5d43371279fece335b3cfeaca174dd5dbcef17',0),(3150,1391129831,'0','5cf7e3533f3378b87d90f4189098db53311de88a',0),(3149,1391127649,'449ce178ef3c221d46a87ea4f51a662ced2ff862','4921b1b4df79ac3fd2de7f46e9f214e7eb507101',0),(3148,1391127649,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3d40355d1faa413a465726a98ec7b8a546a4885b',0),(3147,1391127648,'449ce178ef3c221d46a87ea4f51a662ced2ff862','a8aa30b747de82f376ea7205618559853aeb179b',0),(3146,1391125650,'449ce178ef3c221d46a87ea4f51a662ced2ff862','b4fa505ef905cadcc29b7f5ca477e1819903e4e0',0),(3145,1391125650,'449ce178ef3c221d46a87ea4f51a662ced2ff862','149d5af2473197f93cef3d5f890c775a20fbe343',0),(3144,1391125649,'449ce178ef3c221d46a87ea4f51a662ced2ff862','5899f54edf6bbb4116cd371da794ee15644f2e8b',0),(3143,1391125643,'449ce178ef3c221d46a87ea4f51a662ced2ff862','e6c9593d7d66956914dd64b13f0e15fcd6bad100',0),(3142,1391125642,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f755a2f548c53352ad4afa2fd2b07bfae60c84cf',0),(3141,1391125642,'449ce178ef3c221d46a87ea4f51a662ced2ff862','67c9c4f54ccbe8c7ab9f1d31500a4b93e6ea0675',1),(3140,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','625bb96518de219b4bcb051ebacd065e890a33ee',0),(3139,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','9fc5d95ea23e1f31f8e4f110dd1172491cf141be',0),(3138,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','4f75b5f9638787425d751b8060ca8b48ec4d6bd3',0),(3137,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','15d8c9e94484d2019f52400732109c6ef4d83743',0),(3136,1391125579,'449ce178ef3c221d46a87ea4f51a662ced2ff862','a70f542d3d408c720e2e20a53bc76458c1c5cf75',1),(3135,1391125543,'449ce178ef3c221d46a87ea4f51a662ced2ff862','100035f46488db40dd6382ac6fa42e61e4c5641d',0),(3134,1391125543,'449ce178ef3c221d46a87ea4f51a662ced2ff862','d95075168812836df471d8ba2ce920bd78e9dcef',0),(3133,1391125542,'449ce178ef3c221d46a87ea4f51a662ced2ff862','309ff6e12b41f89822cbf07d61f498ce48325758',0),(3132,1391125526,'449ce178ef3c221d46a87ea4f51a662ced2ff862','0175c7b11c5b89ec1e3e2ffc38739660596cbb93',0),(3131,1391125524,'449ce178ef3c221d46a87ea4f51a662ced2ff862','01a1fe69d15e8df6120cf53ebd341969d0655039',0),(3130,1391125513,'449ce178ef3c221d46a87ea4f51a662ced2ff862','71955bc6345892ce97ee41214abebb33c92e777f',1),(3129,1391125448,'449ce178ef3c221d46a87ea4f51a662ced2ff862','147a5654bd255200f1b52d22f52d318ef532be31',0),(3128,1391125448,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f5d42fd30a3f58fc280d79be20a2b687394da198',0),(3127,1391125447,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f92bc1ee91f591f5d8eda4bdd43ecb796895af43',0),(3126,1391125447,'449ce178ef3c221d46a87ea4f51a662ced2ff862','a4f77551910828f04bf9c6d8745536528e6cc1c2',1),(3125,1391125440,'449ce178ef3c221d46a87ea4f51a662ced2ff862','78b2391d810ca8eb302a22b8415fdeb151ff4998',0),(3124,1391125440,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3107c440717cd944d726a494b94367b684619c7b',0),(3123,1391125440,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f2913ed50bae07de3a299f3ce91212e56970c04e',0),(3122,1391125429,'449ce178ef3c221d46a87ea4f51a662ced2ff862','91e3b70f5a31f29330ed975a124c00e7d5d19014',0),(3121,1391125429,'449ce178ef3c221d46a87ea4f51a662ced2ff862','28e6935295594222367e89daadafd7bd94015bd2',0),(3120,1391125424,'449ce178ef3c221d46a87ea4f51a662ced2ff862','c5a3bf834fcc2ab6ba0190aa89f6566ae785e059',0),(3119,1391125420,'449ce178ef3c221d46a87ea4f51a662ced2ff862','dbb1f123d19051d0e2c815603a5db85b7a1791fc',0),(3118,1391125420,'449ce178ef3c221d46a87ea4f51a662ced2ff862','c06ede3e79c212b2d36c48a10fb5497b70612208',0),(3117,1391125413,'449ce178ef3c221d46a87ea4f51a662ced2ff862','4c6d61f06ffe3ba6d0241c9bd0d4af2446d0cefd',0),(3116,1391125413,'449ce178ef3c221d46a87ea4f51a662ced2ff862','d0ee7a3d0412980e7e14996981ffd942f09b5e29',0),(3115,1391125412,'449ce178ef3c221d46a87ea4f51a662ced2ff862','44d0b85c2e8aa95c38f6853616e937800ea79fed',0),(3114,1391125412,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f1dba1561d029b63b6937be3888524ae745da4a1',1),(3113,1391125410,'449ce178ef3c221d46a87ea4f51a662ced2ff862','1e1cbb4308dc3e69d2cd65994465127b3b088289',0),(3112,1391123319,'0','c2da17f0381271c020c782e0d2c1101d54d86c85',0),(3111,1391123319,'0','d765d37fa19e67cbdcd7fc761a4b25db8bef49f4',0),(3110,1391123315,'0','c2f8769253f0f01eb8faf10304f8915eca22ca41',0),(3109,1391123246,'449ce178ef3c221d46a87ea4f51a662ced2ff862','22b3195221af5bac8e033388ca9645d43ce40517',0),(3108,1391123246,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f57ab167b002b869ae55243dfa6dd83f6a230170',0),(3107,1391123245,'449ce178ef3c221d46a87ea4f51a662ced2ff862','e8b17f6dd474b992b129e62933b8b031d8dd35bd',0),(3106,1391123226,'449ce178ef3c221d46a87ea4f51a662ced2ff862','7935dc13074f9fa663243f2521b9d40d9240cd3a',0),(3105,1391123226,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3dbe7cb7092619cb08b0f6ba3418dbad35fd4d63',0),(3104,1391123173,'449ce178ef3c221d46a87ea4f51a662ced2ff862','54c19f73e2d83556e10593f04a4c10f91931eb7f',1),(3103,1391123136,'449ce178ef3c221d46a87ea4f51a662ced2ff862','042df90c9da26010d16d9ad09d29e394de695da0',0),(3102,1391123136,'449ce178ef3c221d46a87ea4f51a662ced2ff862','43bb4b5c962094afdfd0992235fa975465f89adb',1),(3101,1391123133,'449ce178ef3c221d46a87ea4f51a662ced2ff862','adf5cfb815ba6b97366438dfcfd2e974a9f06474',0),(3100,1391123115,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3adbb3fd4c08eb9c1795df342f519282c8a4f157',1),(3099,1391123113,'449ce178ef3c221d46a87ea4f51a662ced2ff862','1211fb5b68acd16d7517d4ec3e4d80f370ca637c',1),(3098,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','6808e289d13165ad9c279034b47767d829cce94b',0),(3097,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','96ab4100ab54b5e2d13309a0d39c26f1e3bc783d',0),(3096,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','9c4713d57dae8c9e1cfec0294b112e3fb8f5c0c2',0),(3095,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','46e344852e502a23a516106bef09f9e2817cf4ce',1),(3094,1391122997,'449ce178ef3c221d46a87ea4f51a662ced2ff862','ce37e52a48d11bb26a97d9309fae1d69bd5b93b7',0),(3093,1391122997,'0','255cc97e524ce1a41a0c5a7deb4f4378c3383a21',0),(3092,1391122991,'0','7e90d07706c499502d5865a253afac370b3d8f92',1),(3091,1391122991,'0','85c4fda03a271784104adf386e50b4bad5e75ac6',0),(3090,1391122913,'0','43d10e08f002678bf29120ab06ac4d0ba173bfb8',0),(3089,1391122912,'0','6c47b2fcd5900ee5a05ec4bbc019642d8cb15f1a',0),(3088,1391122899,'0','bccdd1dc3724f915ea8165531dbad9b1be901b13',0),(3087,1391122899,'0','8aa4d8f72b0fa36cf02a50e06427f0edb0ce9569',0),(3086,1391122896,'0','b415d72161774b1ff1f06642d9ba0a6fd8b63b05',0),(3085,1391122866,'0','b5f028481f675d21a9afa6843052cd607e916480',0),(3084,1391122866,'0','2887c5fbc85337f1a8919dfcfb0c1a46328c0109',0),(3083,1391122860,'0','90cf37789820c5e40c05f127f19236ed3e00ecb8',0),(3082,1391122367,'0','8b12890e930b8f5380fbd035829b58849159bd07',0),(3081,1391122367,'0','09d6136bd4e9f9deb823b1a813543edc2cedea4b',0),(3033,1391116727,'0','ce7f14af9d22d32f2b9e8b3b1f8f74e43dfb4160',0),(3034,1391116728,'0','3f3425b967adc289ccd68ff8a405124e8af21195',0),(3035,1391116728,'0','b9994237223e1dbf50e81be5b0978b0f7e0850d4',0),(3036,1391116728,'0','49f611e14911451bfb726386968c8c6ebf459618',0),(3037,1391116747,'0','6cd0deac2534ab500ca5ad5c11249f48846e2d48',0),(3038,1391116747,'0','e561e3ff89c20bfff91bc3a49f60472d7784272c',0),(3039,1391116747,'0','0fa7fabe757f4712bf25dcb5576676f7cbece681',0),(3040,1391116747,'0','392915d06aec7c7254378e360bdc564b0475fc76',0),(3041,1391116770,'0','a9089eb1266cafb9b403a1ffa3650616b7975635',0),(3042,1391116770,'0','c831f2f09c76f53498f0843b5b1ddc429063722a',0),(3043,1391116770,'0','71b1c6a00fab406e31f631e3244a126c3e4d0070',0),(3044,1391116771,'0','cac3a47fb73436b4d7023a615f00868ccbfb499b',0),(3045,1391116783,'0','64869a630f000a7e4a28546526f746181cb3d4f8',0),(3046,1391116783,'0','39e4f42cd8f4930f86a08d224f7112de0aa2a48d',0),(3047,1391116783,'0','e06d6e31f71acee0d3b0b0ac85ee48d8b955fac8',0),(3048,1391116783,'0','ab99db5bc77ae300bbc5e23cabca0e6d2121fccc',0),(3049,1391116811,'0','5de657e194166fe5f644691ef5bd5d75c1df92f1',0),(3050,1391116811,'0','31704481fd78d2c64cfb9ccf26e354ec677eb5b9',0),(3051,1391116811,'0','49beb0b3f7ffbf70d560c43ad586337c9a940909',0),(3052,1391116811,'0','3649a4a6f8f6d38daa8068f166877017540837f1',0),(3053,1391116922,'0','1ad5478003480dcf41beb6ff5323fd39860f9f74',0),(3054,1391116922,'0','79ef82767b50684cc062863580b382844ea194f6',0),(3055,1391116922,'0','21db88b5f8c0d9c6bc724058bdaca989dfb7d946',0),(3056,1391116922,'0','99b34b342cb6433f0d75ff24a7d2ed8ecc310766',0),(3057,1391116929,'0','000ac9d5c46e1d2e13c3edd04b8516bd8c799797',0),(3058,1391116930,'0','6a6ca063318a414f8a2bbf7e3c79ad0ee7b7bdf9',0),(3059,1391116930,'0','bacf36e1ff70d39c879416ee1246c9e288bb2a80',0),(3060,1391116930,'0','420d82fda9d07c1e58c6a2a522e17f556fca8d69',0),(3061,1391117040,'0','7a57651bb8dedddf4e7635d8059004da4664b3d9',0),(3062,1391117040,'0','f80ebd81fe6862f38d2ef54d1c580fcd2e69821e',0),(3063,1391117040,'0','93b414501f807d1b0b10c28a83515f9e497cea29',0),(3064,1391117040,'0','b4aa63617197f483868c32c219eb3137544d04f2',0),(3065,1391119384,'0','7738310b62f3274adcf2b22a291c0a9a4f801045',0),(3066,1391119384,'0','542124643ee67efad30d446aed866ecf1daffe0c',0),(3067,1391119384,'0','6b972a41c1a31d7d501044c9c081af05a3fee902',0),(3068,1391119384,'0','df337c2ec52f163c6bab40f04b345e942bf895c4',0),(3069,1391120866,'0','d2bfbee8e2f7dbfdd8e04483c70c78e093f7799e',0),(3070,1391120867,'0','c3f5f110de95d888ceb2197bd006193e99501894',0),(3071,1391120867,'0','6c21c7e2990a96b8780b6eae46c787bd9e036df8',0),(3072,1391120867,'0','392bfac07731ad2718fc444b36bdea9505651e86',0),(3073,1391120883,'0','a1cff23b97efabc838e0a3d866243caa528d0d3f',0),(3074,1391121063,'0','03322d69f36c1fac74740a9e48be44a0afa5b19f',0),(3075,1391121067,'0','4c18802073a4c5af3370f55c6c4c8f374df10dd3',0),(3076,1391121067,'0','de05e9bc0036d2badefd267b94dfaa515018e083',0),(3077,1391122312,'0','1eb6f61f720a1fcd02bdf1b4af3ad7f11f51c358',0),(3078,1391122313,'0','58c6126de88397e7bfb3f9cc3be36484ac28013a',0),(3079,1391122313,'0','98c569d3a7bd20a6fb76d5cc6a1765f09021d06b',0),(3080,1391122364,'0','c5a506d310788c9dd85e6e2e6b72ec9113964997',0);
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
INSERT INTO `exp_sessions` VALUES ('5e3023664d63bd40107a00008b2b9fbd175953e4',1,1,'76.169.36.76','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.102 Safari/537.36','6f4751e7aaabefd9b8df3fccd3cf943b',1391198055,1391198065);
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
INSERT INTO `exp_stats` VALUES (1,1,8,8,'Megan Sheley',25,0,0,0,1391200380,0,0,1383699119,1,1383699119,1391727164);
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','','',1389247785,1,'n',0,'','n','y','o',0),(2,1,2,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'blog-index-page page\'  ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n      <div class=\"outer-container\">\n      <section class=\'carousel bottom\' ng-controller=\"bottomCarouselCtrl\">\n        <thumblist-nav>\n          <div>\n            <img src=\"uploads/home/feature/building_a_better_kibera.jpg\">\n            <h4>Global Hearing Mission</h4>\n            <button ng-click=\"slide(0)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/celebrity_film.jpg\">\n            <h4>Celebrity Support</h4>\n            <button ng-click=\"slide(1)\">watch video &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/changing_lives_with_sir_richard_branson_and_virgin_unite.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(2)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/listen_carefully.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(3)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/operation_change.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(4)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/philippines_film.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(5)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/providing_clean_water_in_tanzania.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(6)\">read stories &rarr;</button>\n          </div>\n        </thumblist-nav>\n      </section>\n      </div>\n\n      <div class=\"outer-container\">\n      <div ng-controller=\"PaginationController\">\n          <div class=\"pagination-featured\">\n            <div ng-repeat=\"featuredArticle in featured\">\n              <h1></h1>\n            </div>\n          </div>\n      \n          <div class=\"pagination\">\n            <ul>\n              <li ng-class=\"{disabled: currentPage == 0}\">\n                <a href ng-click=\"prevPage()\">Prev</a>\n              </li>\n              <li ng-repeat=\"n in range(pagedArticles.length)\"\n                ng-class=\"{active: n == currentPage}\"\n                ng-click=\"setPage()\">\n                <a href ng-bind=\"n + 1\">1</a>\n              </li>\n              <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                <a href ng-click=\"nextPage()\">Next</a>\n              </li>\n            </ul>\n          </div>\n          <div class=\"spacer\"></div>\n          <div class=\"outer-container\">\n            <div class=\"pagination-articles \" ng-repeat=\"articleCol in pagedArticles[currentPage]\">\n              <div ng-repeat=\"article in articleCol\">\n                <pagination article=\"article\" lightbox=\"lightbox\" add-tag=\"addTag\" class= \"row\"></pagination>\n              </div>\n            </div>\n          </div>\n          <div class=\"center\">\n            <div class=\"pagination\">\n              <ul>\n                <li ng-class=\"{disabled: currentPage == 0}\">\n                  <a href ng-click=\"prevPage()\">Prev</a>\n                </li>\n                <li ng-repeat=\"n in range(pagedArticles.length)\"\n                  ng-class=\"{active: n == currentPage}\"\n                  ng-click=\"setPage()\">\n                  <a href ng-bind=\"n + 1\">1</a>\n                </li>\n                <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                  <a href ng-click=\"nextPage()\">Next</a>\n                </li>\n              </ul>\n            </div>\n          </div>\n      \n        <div class=\"modal fade\" ng-class=\"{in: lightbox()}\">\n          <div class=\"modal-header\">\n            <button type=\"button\" class=\"close\" ng-click=\"lightbox(false)\">×</button>\n            <h2>{{lightbox().title}}</h2>\n          </div>\n          <div class=\"modal-body\">\n            <a href=\"{{lightbox().url}}\">\n            Modal\n            </a>\n            <p>{{lightbox().desc}}</p>\n            <p>\n              <span class=\"label label-info pagination-tag\" ng-repeat=\"tag in lightbox().tags\"></span>\n            </p>\n          </div>\n          <div class=\"modal-footer\">\n            <a href=\"{{lightbox().url}}\" class=\"btn btn-primary\">Check out the App</a>\n            <a ng-show=\"lightbox().src\" href=\"{{lightbox().src}}\" class=\"btn\">View the Source</a>\n            <a ng-show=\"lightbox().info\" href=\"{{lightbox().info}}\" class=\"btn\">Read More</a>\n          </div>\n        </div>\n        <div class=\"modal-backdrop fade\" ng-class=\"{in: lightbox()}\" ng-click=\'lightbox(false)\'></div>\n      \n      </div>\n      </div>\n\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1390174301,1,'n',0,'','n','n','o',0),(3,1,3,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'media-mentions-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n\n          <p>Put production slider here</p>\n\n      <div class=\"outer-container\">\n\n\n          <p>Put production pagination here</p>\n      </div>\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(4,1,4,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n\n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'programs-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n    <section class=\'page-leader\'>\n      <h1>Our programs</h1>\n      <p>Programs overview lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dnt lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam.</p>\n    </section>\n\n    <section class=\'tabbed-content\'>\n      <nav>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.operation-change\'>Operation Change</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.listen-carefully\'>Listen Carefully</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hear-now\'>Hear Now</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hearing-aid-recycling\'>Hearing Aid Recycling</a>\n            </li>\n          </ul>\n      </nav>\n\n      <article class=\'tab-content operation-change\'>\n        <div class=\"outer-container\">\n          <h1>Operation change</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n\n        <section class=\"carousel hero\" ng-controller=\"heroCarouselCtrl\">\n          <swiper class=\"swiper\" speed=\"5000\" continuous=\"true\" auto=\"false\">\n            <div class=\"slide\">\n              <article>\n                <img src=\"uploads/home/hero/vikings_mission.jpg\" />\n              </article>\n            </div>\n          </swiper>\n        </section>\n        <br/>\n        <div class=\"outer-container\">\n          <h1>Our partnerships</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content listen-carefully\'>\n        <div class=\"outer-container\">\n          <h1>Listen Carefully</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hear-now\'>\n        <div class=\"outer-container\">\n          <h1>Hear Now</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hearing-aid-recycling\'>\n        <div class=\"outer-container\">\n          <h1>Hearing Aid Recycling</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n    </section>\n    <br/>\n\n      <p>Put production thumblist_nav here</p>\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(6,1,6,'homepage_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"coords\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"5\"}\n        [\n            {homepage_map_item_lat},\n            {homepage_map_item_lon}\n        ],\n   {/exp:channel:entries}\n   ],\n   \"meta_data\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"6\"}\n       {\n          \"title\":\"{title}\",\n          \"text\":\"{if homepage_map_item_content}{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{homepage_map_item_content}{/exp:low_replace}{/if}\",\n          \"thumbnail_url\":\"{homepage_map_item_image}\",\n          \"action_target\":\"{homepage_map_item_cta_link}\"\n       },\n    {/exp:channel:entries}\n   ]\n}\n',NULL,1391025408,1,'n',0,'','n','n','o',0),(7,1,6,'blog','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"blog\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n      \"related_blog_items\": [],\n      \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n      \"title\": \"{title}\",\n      \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391025413,1,'n',0,'','n','n','o',0),(8,1,6,'press','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"media_mentions\" backspace=\"6\"}\n    {\n      \"id\":\"{entry_id}\",\n      \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n      \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n      \"featured\":\"{media_mention_featured}\",\n      \"thumbnail_image_url\":\"{media_mention_splash_image}\",\n      \"logo_image_url\":\"{media_mention_icon}\",\n      \"quote\":\"{media_mention_quote}\",\n      \"call_to_action_text\":\"{media_mention_cta_text}\",\n      \"call_to_action_link\":\"{media_mention_cta_link}\",\n      \"video_link\":\"{media_mention_video_url}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391025417,1,'n',0,'','n','n','o',0),(9,1,6,'featured_articles','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"homepage_main_carousel\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"thumbnail_title\":\"{title}\",\n      \"thumbnail_image_url\":\"{carousel_image}\",\n      \"thumbnail_call_to_action_text\":\"{carousel_cta}\",\n      \"panel_title\":\"{carousel_panel_title}\",\n      \"panel_image_url\":\"{carousel_panel_image}\",\n      \"video_link_url\":\"{carousel_video_url}\",\n      \"panel_call_to_action_text\":\"{carousel_panel_cta}\",\n      \"panel_call_to_action_link_url\":\"{carousel_panel_link}\",\n      \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{carousel_body}{/exp:low_replace}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391043561,1,'n',0,'','n','n','o',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
INSERT INTO `exp_upload_prefs` VALUES (1,1,'Image Uploads','/var/www/starkey/www/uploads/','http://starkey.ahundredyears.com/uploads/','img','','','','','','','','','','',NULL);
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

-- Dump completed on 2014-01-31 22:46:18
