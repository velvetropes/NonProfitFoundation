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
INSERT INTO `exp_channel_data` VALUES (2,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','Press Release','none',1376031600,'','none','','none','','none','<b>FOR IMMEDIATE RELEASE</b>\n\n <h1><b>PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE STARKEY HEARING FOUNDATION’S GLOBAL FIGHT AGAINST HEARING LOSS</b></h1>\n\n <h2><i>The former president helps provide the gift of hearing in Zambia and Rwanda.</i></h2>\n\n MINNEAPOLIS (August 9, 2013) – Earlier this week, during his ten-day Africa trip, former President Bill Clinton and Chelsea Clinton joined Starkey Hearing Foundation’s team of hearing professionals to give customized hearing devices to more than 375 people in Livingstone, Zambia and Kigali, Rwanda. They made the stops to see the progress the Foundation is making on its Clinton Global Initiative Commitment to Action of providing 1 million hearing aids to people in need this decade.&nbsp; Currently, Starkey Hearing Foundation is nearly 40 percent ahead of schedule on its commitment, and in the past year alone, the Foundation has fitted more than 165,000 hearing aids worldwide.\n\n “Starkey Hearing Foundation is empowering people around the world to achieve a better life through the gift of hearing,” said President Clinton. “Chelsea and I were honored, as we always are, to help the great Starkey staff fit people, many of whom had never heard before, for hearing aids.”\n\n President Clinton and Chelsea Clinton personally fitted patients with new hearing aids in both Zambia and Rwanda. President Clinton&nbsp;has spoken&nbsp;at Starkey’s annual&nbsp;<i>So the World May Hear</i>&nbsp;Awards Gala for the last four years, including most recently on July 28, in St. Paul, Minn. This was his third time volunteering&nbsp;on&nbsp;a mission. He joined the Foundation in Colombia and Uganda in 2012.\n\n Hearing loss is a global epidemic, with disabling hearing loss impacting more than 360 million people worldwide, according to the World Health Organization. Yet with the help of a hearing device, hearing loss can often be corrected in many cases, giving an individual the opportunity to better connect with family, the community and the world around them.\n\n “Hearing&nbsp;is the basis for communication and human connection. It opens doors and gives individuals the power to seize opportunities and reach their full potential in life,” said Bill Austin, founder of Starkey Hearing Foundation. “The support we received from President Clinton and the Clinton Global Initiative has enabled us to build vital partnerships and touch more lives than we ever thought possible.”\n\n Mission partners Global Health Corps and Bridge2Rwanda also worked with Starkey Hearing Foundation in Rwanda. Actors Jesse Eisenberg and Dakota Fanning joined the team in Zambia.\n\n In between missions in Zambia and Rwanda, Starkey Hearing Foundation, along with Tanzanian-born Hasheem Thabeet, of the NBA’s Oklahoma City Thunder, made an additional stop in Tanzania to give the gift of hearing to more than 200 people in need.\n\n Starkey Hearing Foundation&nbsp;uses hearing as a vehicle to improve the lives of individuals around the world. Its work in Zambia, Rwanda and Tanzania is part of the dozens of domestic and international missions conducted each year. The foundation fits more than 100,000 hearing aids to people in need annually and has pledged to fit one million hearing aids this decade.\n\n More information about the foundation’s work can be found on&nbsp;Starkey Hearing Foundation’s&nbsp;<a href=\"http://www.starkeyhearingfoundation.org/\" title=\"\">website</a>,&nbsp;<a href=\"https://www.facebook.com/starkeyhearing#!/StarkeyCares?fref=ts\" title=\"\">Facebook</a>&nbsp;and<a href=\"https://twitter.com/starkeycares\" title=\"\">Twitter</a>&nbsp;pages.\n\n <b><i>About Starkey Hearing Foundation</i></b>\n\n Starkey Hearing Foundation&nbsp;uses hearing as a vehicle to reflect caring and improve the lives of individuals, families and communities around the world, by helping them reach their full potential. Hearing loss affects one in 10 Americans, and 63 million children worldwide, yet many do not have access to the hearing devices that can help them. Starkey Hearing Foundation fits and gives more than 100,000 hearing aids annually, and as a member of President Clinton’s Global Initiative, it has pledged to fit one million hearing aids this decade. In addition to giving the gift of hearing through worldwide hearing missions, Starkey Hearing Foundation promotes hearing health awareness and education through the Listen Carefully initiative and provides hearing instruments to low-income Americans through the Hear Now program. For more information&nbsp;on&nbsp;Starkey Hearing Foundation, visit&nbsp;<ins><a href=\"http://www.starkeyhearingfoundation.org/\" title=\"\">www.starkeyhearingfoundation.org</a></ins>.\n\n <b>About the Clinton Global Initiative</b>\n\n  \n\n Established in 2005 by President Bill Clinton, the Clinton Global Initiative (CGI), an initiative of Bill, Hillary &amp; Chelsea Clinton Foundation, convenes global leaders to create and implement innovative solutions to the world’s most pressing challenges. CGI Annual Meetings have brought together more than 150 heads of state, 20 Nobel Prize laureates, and hundreds of leading CEOs, heads of foundations and NGOs, major philanthropists, and members of the media. To date CGI members have made more than 2,300 commitments, which are already improving the lives of more than 400 million people in over 180 countries. When fully funded and implemented, these commitments will be valued at $73.5 billion.','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(3,1,4,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'One of the greatest challenges for all children with hearing loss is communication and connection with the rest of the world.','none','{filedir_1}TaniAustin.jpg','none','{filedir_1}Clinton_Foundation_Logo.png','none','Media Mention','none',1390189140,'','none','http://www.clintonfoundation.org/blog/2013/08/02/starkey-executive-director-speaks-miracle-watching-patients-hear-very-first-tim','none','Clinton Foundation','none','','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(4,1,1,'In 2010, we committed to providing 100,000 hearing aids a year to those in need','none','{filedir_1}HERO-Commitment_to_Action_Film.jpg','none','http://www.youtube.com/watch?v=ScjOkoueDYg','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(5,1,1,'To truly make an impact, our efforts must be sustainable','none','{filedir_1}HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','none','http://www.youtube.com/watch?v=W50L7eNGT2U','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','Watch Video','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(6,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Celebrity_Film.jpg','none','Watch','none','Celebrity Support ','none','{filedir_1}CAROUSEL-Celebrity_Film.jpg','none','http://www.youtube.com/watch?v=03KTq85Y3wM','none','','none','','none','<p>Starkey Hearing Foundation is fortunate to have hundreds of high-profile friends to help us raise awareness and generate support for the gift of hearing.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(7,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','Watch ','none','Listen Carefully in Schools','none','{filedir_1}CAROUSEL-Listen_Carefully.jpg','none','http://www.youtube.com/watch?v=rlyH-ZcCf7o','none','','none','','none','<p>Disney and Nickelodeon stars Chris and Kyle Massey joined Grammy Award-winning songwriter/producer Dallas Austin to educate a crowd of more than 1,400 students at our launch event. The music and sound experience inspired not only a dance contest but also sent the right message: Your hearing is fragile. So don’t listen loudly. Listen Carefully.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(8,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','See the Process ','none','Recycling Sound','none','{filedir_1}CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','none','http://www.youtube.com/watch?v=tF-9R4UUWa8','none','','none','','none','<p>Every year thousands of used hearing aids are donated to our Hear Now program people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(9,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Where We Are Now ','none','{filedir_1}icon_now.png','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(10,1,3,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','28.6','none','77.2','none','India ','none','<p>The mission team is excited to be back in India working with our Starkey India team to give the gift of hearing across four cities.</p><ol>\n</ol>','none','',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','none','','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(11,1,2,'',NULL,'',NULL,'',NULL,' ','xhtml',NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'We use hearing as a vehicle to change lives around the world.','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(13,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_Philippines_.jpg','none','Hearing Missions','none',1387524240,'','none','<p><b>Caring for Our Friends in the Philippines</b></p>\n\n<p>&nbsp; Over 35 days, four countries and 10 cities, the hearing mission team finished the year strong, fitting more than 12,000 people. Crisscrossing Asia, we brought the gift of hearing to India, Cambodia, China and completed our tour with an impactful, four-city hearing mission in the Philippines.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; Typhoon Haiyan struck the Philippines three weeks before our long-scheduled hearing mission was set to take place. For a second after that tragedy, we paused to consider how to help, and we decided that the best thing we could do was go, as planned, to give the gift of hearing. Joined by boxing champion Manny Pacquiao, fresh from his victory in China, and singer Jessica Sanchez, we brought our love and care to more than 5,000 people in need.</p>\n\n<p>&nbsp; Excited to be as hands-on as possible with the patients, Sanchez worked and traveled with the team for the entire hearing mission. Her first day on the job she helped reconnect 88-year-old Maria Solis Sogon with her 12 children, 20 grandchildren and 5 great-grandchildren. Overwhelmed with gratitude, Maria broke into song to Sanchez’s delight. By the end of the hearing mission, it was Sanchez who was moved to song by all of the incredible people and lives she was able to help change. She performed for a captivated audience, giving many of them their first experience of music.</p>\n\n<p>&nbsp; From General Santos to Lipa City to Batangas to Manila, the team was inspired by the resilience of the Philippines. While many may have been knocked down by the impact of Typhoon Haiyan, from what we experienced, their spirit has not been broken. It will not take long for the Philippines to be just as strong, if not stronger than it was before.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; <b>Happy Holidays!</b></p>\n\n<p>&nbsp; With the holidays upon us, the team is busy preparing for another year of changing lives, while also spending some quality time with the people we love. From the Starkey Hearing Foundation family to yours, we wish you all love, light and peace this holiday season. Thank you for all you do to support our efforts around the world. May 2014 bring you inspiration and adventure!</p>\n\n<p>&nbsp; As you spend time with your friends and families this holiday season, remember the connecting power of hearing.</p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; <a href=\"https://action.starkeyhearingfoundation.org/\" title=\"\">Pledge your support</a> today and help us give that same connection to thousands of families around the world in 2014.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(14,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}Dave_Fabry.jpg','none','Hearing Missions','none',1388215620,'','none','<p>Dave Fabry, Ph.D. audiologist and Starkey Hearing Technologies’ Vice President of Audiology and Professional Services, has dedicated his life to hearing care. As a young man in college he was a pre-veterinary medicine major, and his love of animals led him to a hearing lab where scientists were studying the damage from noise exposure in chinchillas. There he found his calling. Since then Fabry has earned a doctorate in audiology from the University of Minnesota, published more than 50 articles and been a leader in the field for more than 30 years. However, he has never let go of his interest in noise exposure and raising awareness on how to prevent hearing loss. He has channeled this passion into our Listen Carefully campaign, and we sat down with him to gain a deeper understanding of the challenges and solutions surrounding preventable hearing loss.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/screen-shot-2013-09-30-at-9-06-05-am-2/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>How important is hearing protection?</b></p>\n\n<p>&nbsp; Hearing protection is critical for all age groups. Look at the history of OSHA and hearing protection in the workplace – we have done a very good job with occupational noise exposure in the workplace. However, recreational noise exposure has become an increasing problem for both adults and children, which could include anything from concerts to loud restaurants and bars to firearms.</p>\n\n<p>&nbsp; We don’t often think of children as being at risk for noise exposure, but in fact, it is a huge concern and an emerging problem in the United States with upwards of 20 percent of teens estimated to suffer from measurable hearing loss. We have to do better at protecting kids from preventable hearing loss.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/img_5019/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>Most of us have been told to wear hearing protection at concerts or to turn down the volume on our headphones to protect our hearing, but what are some of the lesser-known areas where hearing protection should be used?</b></p>\n\n<p>&nbsp; When looking at dangerous levels of noise exposure, it is all about the intensity of the sound and the duration of exposure. Any sound that is in excess of 85 dB, with extended exposure, will harm your hearing.</p>\n\n<p>&nbsp; There are some really strange places that we don’t often think of where dangerous levels of noise exposure can occur. Dentists, for example, are at high risk for noise exposure, due to the sound of the high-frequency drills they use daily. Likewise, the barista at your local coffee shop is at risk for noise exposure due to the sound of the grinder and the high-frequency sound of many cappuccino machines.</p>\n\n<p>&nbsp; In terms of teenagers, one of the places we don’t often think of is the school band. The students playing in those bands could be at risk for noise exposure, particularly percussionists and piccolo players and those positioned near them. Violinists are also at a high risk for hearing loss because as they play they place their ears directly against the instrument.</p>\n\n<p>&nbsp; It is important for all of us to take active measures to protect against preventable hearing loss. In my own life I use noise-cancelling headphones on airplanes when I travel to protect against the sounds produced during take off and landing. I also use musicians earplugs when I go to concerts to reduce the sound across the entire frequency spectrum without impacting the sound of the music. I wear those same earplugs when I ride my motorcycle so I can adequately hear other motorists around me while also protecting my hearing. In addition, whenever I mow the grass, I wear hearing protection.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/socm2639-00-ee-hf-listen-carefully-facts-facebook-1/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>What are the key issues surrounding noise exposure and iPods and MP3 players?</b></p>\n\n<p>&nbsp; A popular test of the volume of an iPod or MP3 player is that you should never allow the volume to go over half or two-thirds the maximum. Unfortunately, this is an oversimplification because with today’s technology it is actually the headphones that determine the output level. I don’t want parents and teens to be lulled into a false sense of security by keeping an iPod at or below half the maximum – that could still be a level that is damaging.</p>\n\n<p>&nbsp; In addition, years ago, we used to recommend that if someone could stand three feet away from you and sing along with the song you are listening to, the music is too loud. But again, due to the level of technology available for headphones, this also no longer applies.</p>\n\n<p>&nbsp; In an ideal world, we could measure on a simulated ear the level that someone listens to an iPod, and then set the limit, but this is not practical for real-world environments. I would encourage parents to listen to the iPod through your child’s headphones, and then set the volume at a level that is comfortable for them and not uncomfortably loud. You can also download sound level meter apps that are pretty accurate. You can then hold your child’s headphones up to the sound meter app to get an idea of the sound level and set the volume accordingly.</p>\n\n<p>&nbsp; <a href=\"http://www.starkeyhearingfoundation.org/blog/dave-fabry-lives-to-listen-carefully/dsc01235cc3/\" title=\"\"></a></p>\n\n<p>&nbsp; <b>How do you encourage your loved ones to protect their hearing?</b></p>\n\n<p>&nbsp; </p>\n\n<p>&nbsp; I am very particular with the level my daughter listens to music both in the car and on headphones. I always carry hearing protection with me when I go to concerts, so either my wife or my daughter will be encouraged to wear it when they are with me. I have always tried to stress the importance of protecting their hearing against recreational noise exposure.</p>','none','Listen Carefully','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','','none','','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(15,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}Blog_A_Knight.jpg','none','Hearing Missions','none',1382632260,'','none','<p><strong>A Knight and a Prince Help Kick Off Fall Missions</strong></p>\n\n<p>&nbsp; Striving for a strong finish to a record-breaking year, the mission team began its fall by spending October giving the gift of hearing in <a href=\"http://www.starkeyhearingfoundation.org/missions/africa/south-africa-10-2013/\" title=\"\">South Africa</a>, <a href=\"http://www.starkeyhearingfoundation.org/missions/africa/lesotho-10-2013/\" title=\"\">Lesotho</a> and Kenya.</p>\n\n<p>&nbsp; The team started out in South Africa where partnered with Sir Richard Branson and <a href=\"http://www.virgin.com/unite\" title=\"\">Virgin Unite</a> for the third time to bring the gift of hearing to hundreds of people in need at Virgin Unite&rsquo;s Bhubezi Healthcare Clinic.</p>\n\n<p>&nbsp; Next, we headed to Lesotho. It was our first hearing mission in the country where we had another wonderful partner in <a href=\"http://sentebale.org/\" title=\"\">Sentebale</a>, a nonprofit organization co-founded by Prince Harry and Prince Seeiso of Lesotho, who participated in the fittings. Patients, ranging from 4 to 101 years old, traveled from all parts of the small, landlocked country to have their hearing assessed and be fitted for hearing aids. For many it was an opportunity to hear for the very first time.</p>\n\n<p>&nbsp; After being honored at the 13th Annual Starkey Hearing Foundation&rsquo;s <em>So the World May Hear Awards</em>Gala in July, Branson joined us to bring the gift of hearing to Virgin Unite&rsquo;s Bhubezi Healthcare Clinic. More than 300 patients from the surrounding Bushbruckridge community were fit with hearing aids. Branson and the Virgin Unite team worked closely with us to ensure each patient left the mission with a new connection to sound and life.</p>\n\n<p>&nbsp; Discussing his continued dedication to the work of the Foundation, Branson said, &ldquo;I admire the Starkey Hearing Foundation for its tireless effort to transform lives with the gift of hearing. I hope it will inspire others, businesses and nonprofits alike, to seek new, innovative and entrepreneurial ways of making a difference in people&rsquo;s lives.&rdquo;</p>\n\n<p>&nbsp; Once the team wrapped up a successful mission in South Africa, we headed to our first mission in Lesotho with new partner <a href=\"http://sentebale.com\">Sentebale</a>.</p>\n\n<p>&nbsp; Prince Seeiso joined the team to help fit hearing aids and open up the world of sound to many living in silence and isolation. &ldquo;I have seen children wanting to talk to each other, and their eyes tell a thousand stories,&rdquo; Prince Seeiso said. &ldquo;On behalf of myself, Prince Harry and Sentebale, a big thanks goes to Starkey Hearing Foundation.&rdquo;</p>\n\n<p>&nbsp; The team is currently in Kenya, where we have traveled from Mombasa to Eldoret to one of the largest slums in Africa, Kibera, to Meru, all the while reflecting caring and connecting communities with the gift of hearing.</p>\n\n<p>&nbsp; <strong>2013 Gala Highlights</strong></p>\n\n<p>&nbsp; Whether it was the bald eagle soaring over the crowd as Nita Whitaker sang &ldquo;AmazingGrace,&rdquo; impassioned speeches from twin brothers Ashton and Michael Kutcher, or special surprise guests for Bill Austin, the 2013 <em>So the World May Hear</em> Awards Gala was an evening we will never forget. Our latest film brings you all the highlights and magic from this year&rsquo;s Gala.</p>\n\n<p>&nbsp; <a href=\"http://youtu.be/KD8h8zNpd48\" title=\"\">Watch as the world comes together to celebrate the power of caring.</a></p>\n\n<p>&nbsp; <strong>Listen Carefully with Tony Hawk and the Minnesota Vikings</strong></p>\n\n<p><span style=\"line-height:1.6em\">&nbsp; October is National Protect Your Hearing Month, and we&rsquo;ve been encouraging people toturn down the volume and Listen Carefully with Chris and Kyle Massey at skateboarding legend Tony Hawk&rsquo;s 2013 </span><a href=\"http://standupforskateparks.org/\" style=\"line-height: 1.6em;\" title=\"\">Stand Up for Skateparks</a><span style=\"line-height:1.6em\"> and with the help of the </span><a href=\"http://www.starkeyhearingfoundation.org/vikings/\" style=\"line-height: 1.6em;\" title=\"\">Minnesota Vikings</a><span style=\"line-height:1.6em\">.</span></p>\n\n<p>&nbsp; Remember: Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; Chris and Kyle Massey joined our team as we spread the word about the importance of protecting your hearing at the 2013 Stand Up for Skateparks, and we were encouraged to see the message stick as much of the audience wore the hearing protection we distributed during a headlining performance by Modest Mouse.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp; The Minnesota Vikings have teamed up with our Listen Carefully campaign to encourage fans to protect their hearing, and they are donating $500 to the Foundation for every touchdown scored this season by Adrian Peterson or Greg Jennings. Vikings fans should also be on the look out for Listen Carefully hearing protection at all home games.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(16,1,6,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'Hearing Missions','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(17,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>​testing</p>','none','','xhtml','','xhtml','','xhtml','',NULL,NULL,NULL,'',NULL,'','xhtml','','none','','none','','none','','none','','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(18,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','','none','{filedir_1}Clinton_Foundation_Logo.png','none','Media Mention','none',1376422980,'','none','http://www.clintonfoundation.org/main/clinton-foundation-blog.html/2013/08/06/africa-2013-day-5-recap','none','Clinton Foundation','none','','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','At the fitting, Starkey Hearing Foundation representatives fit children, some of whom have never heard before, with hearing aids','none','','none','','none','Read More ','none','','none','','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(19,1,10,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'<p>Our new docuseries - coming soon!&nbsp;</p>','none','<h1>Listen Carefully</h1>\n\n<p>Research shows that 1 in 8 children and teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures&ndash;such as lowering the volume&ndash;are taken.</p>\n\n<p>The program combines music and education to raise awareness about the fragility of hearing and the dangers of exposure to high decibel sounds.&nbsp;This year Starkey Hearing Foundation expanded Listen Carefully to offer educational support to more than 16,000 teachers and nearly 500,000 students nationwide.</p>\n\n<p>[gallery id=\"listen-carefully-gallery\"]</p>\n\n<h1>Make a Difference&nbsp;</h1>\n\n<p>Start with yourself. Your family. Your friends. Because you understand the transformative, interconnecting power of hearing. Because you know that 1 in 5 American teenagers has hearing loss-meaning we&rsquo;re losing our hearing faster, today, than our parents or grandparents did.</p>\n\n<p>[gallery id=\"listen-carefully-gallery-2\"]</p>\n\n<p>&nbsp;</p>\n\n<h1>Educate Yourself&nbsp;</h1>','none','<p>Starkey Hearing Foundation has provided more hearing help to people in the United States than to any other country. We do this through domestic missions and also Hear Now, our application-based program that provides hearing help to low-income Americans. Each person we help is fit with new, top-of-the-line digital hearing aids that are customized to their hearing loss.&nbsp;</p>\n\n<p>If you or someone you know is struggling with hearing loss and unable to afford hearing aids, call 1-800-328-8602 or complete the form below, and a Hear Now representative will be in touch with you.&nbsp;</p>\n\n<p>If you have already spoken with a representative and need an application, you can download one here:</p>','none','<p>Every year thousands of hearing aids are donated to our Hear Now program from hearing professionals and other people looking to help. Those hearing aids open up the world of sound to someone in need. Many of the hearing aids used on international missions come from the recycling program, making hearing aid donations vital to the success of the Foundation. However, the journey from donation to the mission field is an absolute labor of love.&nbsp;</p>','none','',NULL,NULL,NULL,'',NULL,'<p>Starkey Hearing Foundation&rsquo;s commitment to global hearing health begins right here at home.&nbsp;Along with our worldwide missions, our national programs contribute to an entire system of care.&nbsp;Everyone can make a difference in the lives of those across the world or just next-door. Together, we can create a movement that brings peace and understanding through the gift of hearing.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none',' ','xhtml',' ','xhtml','','xhtml'),(20,1,1,'Hearing Foundation has provided more hearing help to people in the United States than to any other country','none','{filedir_1}HERO-Vikings_Mission-IMG_6312.jpg','none','http://www.starkeyhearingfoundation.org/programs/hear-now/)','none','',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'Learn More ','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(21,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}September_Newsletter.jpg','none','News','none',1378791720,'','none','<p>Special Olympics Athletes Receive the Gift of Hearing</p>\n\n<p>After the team returned from fitting more than 10,000 people in&nbsp;Peru&nbsp;and&nbsp;Mexico, our campus was flooded with inspiration when 22 Special Olympics Minnesota athletes and their families arrived for a homegrown mission. The Foundation has partnered with Special Olympics Minnesota on its Healthy Hearing Athletes Initiative, and this mission kicked off what we hope will become a long and life-changing collaboration that will open up the world of sound to all Special Olympics athletes in need. Each athlete was fit with top-of-the-line, customized hearing aids that opened up the world of sound like never before.</p>\n\n<p>Discussing the significance of this mission, Bill Austin said, &ldquo;We don&rsquo;t believe in disabilities. We believe in ability. Everybody has it, and we have to find it and use it and maximize it.&rdquo;</p>\n\n<p>Former Minnesota Viking Matt Blair was also on hand to support the athletes, including his good friend Katie Timmer. She has been participating in Special Olympics for more than 30 years and met Blair at a golf tournament. Over the years, Blair has become Timmer&rsquo;s biggest fan. Unfortunately, She suffered from a hearing loss that had begun to affect her performance, but once she received the gift of hearing, she couldn&rsquo;t wait to get back out on the golf course.</p>\n\n<p>Special Olympics president, Dave Dorn, said the partnership with the Foundation would make a huge difference in each of the athlete&rsquo;s lives.</p>\n\n<p>&ldquo;It&rsquo;s a&nbsp;confidence&nbsp;builder,&rdquo; Dorn said. &ldquo;They can be engaged in conversations and hear the world around them. All of a sudden they are much more participatory and active in their surroundings because they can hear what&rsquo;s going on.&rdquo;</p>\n\n<p>The mission team is currently on its way to South Africa which will be followed by missions in Lesotho and Kenya.</p>\n\n<p>The Power of Partnerships</p>\n\n<p>President Bill Clinton and Chelsea Clinton once again joined the team on a recent mission swing through in Zambia, Tanzania and Rwanda to see our 1 million hearing aid commitment in action. Our latest film showcases the power of partnerships in providing the gift of hearing and tackling some of the world&rsquo;s most challenging issues.</p>\n\n<p>Watch as powerful organizations come together to create lasting change.</p>\n\n<p>Join us for a Hearing Protection Twitter Chat!</p>\n\n<p>October is National Protect Your Hearing Month! Research shows that 1 in 5 teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures &ndash; such as lowering the volume &ndash; are taken.</p>\n\n<p>Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</p>\n\n<p>Join us on Twitter Thursday, October 3, from 12-1 p.m. CDT as Starkey Hearing Foundation and Starkey Hearing Technologies discuss ways to protect your hearing and prevent hearing loss!</p>\n\n<p>If you&rsquo;re new to Twitter chats,&nbsp;here&rsquo;s an overview of how it works&hellip;</p>\n\n<p>Commit Today</p>\n\n<p>Pledge your support today&nbsp;and help us change a life during our upcoming missions in South Africa or Lesotho.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(22,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','Experience More','none','Gift of Hearing in Peru ','none','{filedir_1}CAROUSEL-Peru_Mission-02-DSC07062.jpg','none','','none','','none','','none','<p>Organizing a five city, nearly 20,000 hearing aid mission in Peru is no small feat! With the help of more than 70 Rotary clubs from across Peru and Minnesota, the mission team led the charge for this unprecedented 21-day mission to change thousands of lives.</p>','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','xhtml','','xhtml','','xhtml'),(23,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}PeaceinWestBank.jpg','none','News','none',1381950660,'','none','<p>Starkey Hearing Foundation&nbsp;is excited to be heading back to the West Bank soon for an upcoming hearing mission. Our work in the region has shown us how hearing brings people together and serves as a vehicle for peace and understanding.</p>\n\n<p>We wanted to share some feedback from a recent mission as we currently prepare for the next one.</p>\n\n<p>&ldquo;Before the mission &ndash; my first &ndash; I was so excited and really didn&rsquo;t know what to expect. Now I can definitely&nbsp;say it was not like anything I had done before. I have lived in this conflict all my life, and today, for the first time I met my neighbors who greeted me with nothing but love. I was amazed to see all the happy faces and know that my small efforts could give someone so much joy. I hope that this mission will take us one step closer to peace, and I hope it won&rsquo;t be the last.&rdquo;</p>\n\n<p>- Chen Cohen</p>\n\n<p>Our local partners have been hard at work, completing phase one by identifying patients and taking impressions. We look forward to contributing to peace building by continuing to foster connections between people and across cultures through the gift of hearing. Check out the photos below to see the preparation.</p>\n\n<p><img alt=\"\" src=\"{filedir_1}westbank2.jpeg\" style=\"height:250px; width:333px\" />&nbsp;</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(24,1,5,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}September_Newsletter.jpg','none','News','none',1379359200,'','none','<p>After the team returned from fitting more than 10,000 people in&nbsp;Peru&nbsp;and&nbsp;Mexico, our campus was flooded with inspiration when 22 Special Olympics Minnesota athletes and their families arrived for a homegrown mission. The Foundation has partnered with Special Olympics Minnesota on its Healthy Hearing Athletes Initiative, and this mission kicked off what we hope will become a long and life-changing collaboration that will open up the world of sound to all Special Olympics athletes in need. Each athlete was fit with top-of-the-line, customized hearing aids that opened up the world of sound like never before.</p>\n\n<p>Discussing the significance of this mission, Bill Austin said, &ldquo;We don&rsquo;t believe in disabilities. We believe in ability. Everybody has it, and we have to find it and use it and maximize it.&rdquo;</p>\n\n<p>Former Minnesota Viking Matt Blair was also on hand to support the athletes, including his good friend Katie Timmer. She has been participating in Special Olympics for more than 30 years and met Blair at a golf tournament. Over the years, Blair has become Timmer&rsquo;s biggest fan. Unfortunately, She suffered from a hearing loss that had begun to affect her performance, but once she received the gift of hearing, she couldn&rsquo;t wait to get back out on the golf course.</p>\n\n<p>Special Olympics president, Dave Dorn, said the partnership with the Foundation would make a huge difference in each of the athlete&rsquo;s lives.</p>\n\n<p>&ldquo;It&rsquo;s a&nbsp;confidence&nbsp;builder,&rdquo; Dorn said. &ldquo;They can be engaged in conversations and hear the world around them. All of a sudden they are much more participatory and active in their surroundings because they can hear what&rsquo;s going on.&rdquo;</p>\n\n<p>The mission team is currently on its way to South Africa which will be followed by missions in Lesotho and Kenya.</p>\n\n<h3>The Power of Partnerships</h3>\n\n<p>President Bill Clinton and Chelsea Clinton once again joined the team on a recent mission swing through in Zambia, Tanzania and Rwanda to see our 1 million hearing aid commitment in action. Our latest film showcases the power of partnerships in providing the gift of hearing and tackling some of the world&rsquo;s most challenging issues.</p>\n\n<p>Watch as powerful organizations come together to create lasting change.&nbsp;</p>\n\n<p style=\"margin-left: 480px;\"><img alt=\"\" src=\"{filedir_1}special_olympics_mission.jpg\" style=\"height:200px; width:300px\" /></p>\n\n<h3>Join us for a Hearing Protection Twitter Chat!</h3>\n\n<p>October is National Protect Your Hearing Month! Research shows that 1 in 5 teens in the United States has hearing loss, largely due to high-volume sounds in daily life, such as music streamed loudly into headphones. Most hearing loss among teens can be avoided if simple protective measures &ndash; such as lowering the volume &ndash; are taken.</p>\n\n<h3>Your hearing is fragile. So don&rsquo;t listen loudly. Listen Carefully.</h3>\n\n<p>Join us on Twitter Thursday, October 3, from 12-1 p.m. CDT as Starkey Hearing Foundation and Starkey Hearing Technologies discuss ways to protect your hearing and prevent hearing loss!</p>\n\n<p>If you&rsquo;re new to Twitter chats,&nbsp;here&rsquo;s an overview of how it works&hellip;</p>\n\n<p>Commit Today</p>\n\n<p>Pledge your support today&nbsp;and help us change a life during our upcoming missions in South Africa or <a href=\"http://lesotho.com\">Lesotho</a>.</p>','none','SHF Team','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','xhtml','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(25,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml'),(26,1,12,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,' ','xhtml'),(27,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}billaustin.jpg','none','{filedir_1}cnnlogo.png','none','Media Mention','none',0,NULL,'none','Watch Video ','none','CNN iReport','none','','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','','none','','none','','none','http://ireport.cnn.com/docs/DOC-616289','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(28,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'false','none','{filedir_1}HERO-Vikings_Mission-IMG_6312.jpg','none','','none','Press Release','none',1374263340,'','none','','none','SHF Team','none','<b>FOR IMMEDIATE RELEASE</b>\n\n <b>WORLD LEADERS, CELEBRITIES AND ATHLETES ATTEND STARKEY HEARING FOUNDATION GALA</b>\n\n <i>Starkey’s largest annual fundraiser drew support for&nbsp;continuing philanthropic work&nbsp;around the world.</i>\n\n ST. PAUL, MINN. (July 29, 2013) – On Sunday night, a host of celebrities and supporters celebrated the Starkey Hearing Foundation’s 2013&nbsp;<i>So the World May Hear&nbsp;</i>Gala in St. Paul, Minn., raising more than $8 million to support its charitable work around the world. VIPs and celebrities in attendance included President Bill Clinton, Sir Richard Branson, Ashton Kutcher, Marc Anthony, Lionel Richie, Barbara Bush, Sinbad, Kristi Yamaguchi, Mel B.&nbsp;of&nbsp;the Spice Girls, Lou Ferrigno, Bill Rancic, Greg Jennings, Tony Hawk, Forest Whitaker, Shannon Elizabeth, Kevin Sorbo and Verne Troyer, among others.\n\n The gala, which draws numerous celebrities and supporters annually, is the foundation’s largest fundraiser, raising money to continue its programs around the globe. The gala also honors men and women whose contributions to our world have made it a better place. It celebrates the spirit of giving and showcases the tremendous impact of reflecting caring and sharing into on the lives of others.\n\n Master of Ceremonies, Norm Crosby, started off the evening with a comedic welcome, followed by a moving performance by Nita Whitaker of “Amazing Grace,” which included a bald eagle flyover. The program was filled with speeches from presenters and honorees, a live auction and world-class entertainment.\n\n <b>2013 presenters included</b>&nbsp;President Bill Clinton, Forest Whitaker, Fred Whitfield, Bill Rancic, Evander Holyfield, Yank Barry and Michael Kutcher.\n\n An emotional introduction from Michael Kutcher captivated the audience as his twin brother and Starkey&nbsp;honoree, Ashton Kutcher prepared to take the stage. Michael described his brother as a protector, and related that same quality to Thorn: Digital Defenders of Children, the foundation Ashton Kutcher&nbsp;cofounded&nbsp;in 2009.&nbsp;Thorn&nbsp;was created to disrupt the predatory behavior of those who abuse and traffic children, solicit sex with children, or create and share child pornography.\n\n President Bill Clinton thanked Starkey founders Bill and Tani Austin for their inspirational work and recognized each of the evening’s honorees before he introduced Starkey honoree Chunli Zhao “Angel.” Angel was born with brittle bone disease and was raised in a rural fishing village near Yangshuo, China. The former president spoke of Angel’s spirit and determination to overcome obstacles unfathomable to most people. He told a story of how, at age 15, Angel was not allowed to meet him when he visited her village. The authorities hid her away because they were embarrassed by her disability. Angel has since become a leading advocate for disability rights.\n\n As a member of President Clinton’s Global Initiative, Starkey Hearing Foundation has pledged to fit and give more than 100,000 hearing aids annually to people in need, for a total of 1 million this decade.&nbsp; At the Gala, the Foundation announced it has fit more than 165,000 hearing aids in the last year alone and is nearly 40 percent ahead of schedule on their commitment.\n\n Another highlight of the evening came from Steven Sawalich, senior executive director of Starkey Hearing Foundation. He discussed Operation Change, a movement the Foundation is building to inspire young people to take action and be a driving force for good in their communities around the world.\n\n Sawalich&nbsp;also surprised Bill Austin&nbsp;with&nbsp;a very special guest, Endreas, a young man from Ethiopia. Austin not only gave Endreas the gift of hearing last year, he also arranged for him to receive life-saving medical care in Israel.&nbsp;Endreascalled Austin his “father” as he shared his story with the audience, moving many to tears.\n\n <b>2013 honorees included</b>&nbsp;Sir Richard Branson (founder, Virgin Group), Ashton Kutcher (cofounder, Thorn: Digital Defenders of Children), Barbara Bush (Global Health Corps), Jimmy Walker (Celebrity Fight Night), Dennis and Leslie Hansen (Hearing Angel Humanitarians) and Chunli Zhao “Angel” (Partners in Excellence).\n\n Honorees were recognized for the change they are making in the world, and each spoke about their causes and the work Starkey Hearing Foundation does around the world.\n\n “It is an honor just to do the work I do every day with&nbsp;Global Health Corps,” Barbara Bush, CEO and cofounder of Global Health Corps, said. “It is unbelievably inspiring and encouraging to go on the Starkey missions and see people’s lives change in one minute.” Bush has participated in three Starkey hearing missions, two in Uganda and one in New York City.\n\n Sir Richard Branson spoke about the power businesses have for creating change. “What we need to do, is get every single company in the world to adopt a problem. And if we can join with governments and social workers we can get on top of all of the problems of the world,” Branson stated. “Businesses can use their entrepreneurial skills to look at a problem and see it differently.” Branson concluded his speech by recognizing Foundation cofounder, Tani Austin’s birthday, and queuing the live orchestra to play “Happy Birthday” as the audience sang.\n\n <b>The evening included performances</b>&nbsp;by GRAMMY Award winners Lionel Richie and Marc Anthony, reggae and alternative rock musician Matisyahu, vocalist Nita Whitaker, stand-up comedian Sinbad, American Idol runner-up Jessica Sanchez and vocal group ARIA.\n\n Couples salsa danced around the ballroom while guests formed a conga line and made their way closer to the stage during Marc Anthony’s performance. Jessica Sanchez impressed the audience with her powerful rendition of Whitney Houston’s classic “I Will Always Love You.”&nbsp; Sinbad kicked-off his act with a musical impression of Prince, followed by a comedic routine that kept the crowd laughing. Lionel Richie closed the evening with a number of songs, including his hits “Dancing on the Ceiling” and “All Night Long.”\n\n Attended by more than 1,600 people, the 2013&nbsp;<i>So the World May Hear&nbsp;</i>Gala raised a record-breaking $8 million through ticket sales, sponsorships, donations, and live and silent auctions. All funds will be used to further the Starkey Hearing Foundation’s life-changing work.\n\n “Hearing is a way to improve lives around the world and empower individuals to reach their full potential,” said Bill Austin, founder of Starkey Hearing Foundation. “We are the only ones that can change the future of this world. We have to start by reflecting caring…by showing respect for life.”\n\n Hearing missions are the primary way Starkey Hearing Foundation realizes its goal:&nbsp;<i>So the World May Hear</i>. In the last year, the foundation’s team of audiologists and staff has conducted missions in 19 countries and has provided thousands of hearing aids to low-income Americans through the Hear Now program.\n\n More information about the foundation’s work can be found on&nbsp;Starkey Hearing Foundation’s&nbsp;<a href=\"http://www.starkeyhearingfoundation.org/\" title=\"\">website</a>,&nbsp;<a href=\"https://www.facebook.com/starkeyhearing#!/StarkeyCares?fref=ts\" title=\"\">Facebook</a>&nbsp;and<a href=\"https://twitter.com/starkeycares\" title=\"\">Twitter</a>&nbsp;pages.\n\n <b><i>About Starkey Hearing Foundation</i></b>\n\n  \n\n <span>Starkey Hearing Foundation</span>&nbsp;uses hearing as a vehicle to reflect caring and improve the lives of individuals, families and communities around the world, by helping them reach their full potential. Hearing loss affects one in 10 Americans, and 63 million children worldwide, yet many do not have access to the hearing devices that can help them. Starkey Hearing Foundation fits and gives more than 100,000 hearing aids annually, and as a member of President Clinton’s Global Initiative, it has pledged to fit one million hearing aids this decade. In addition to giving the gift of hearing through worldwide hearing missions, Starkey Hearing Foundation promotes hearing health awareness and education through the Listen Carefully initiative and provides hearing instruments to low-income Americans through the Hear Now program. For more information&nbsp;<span>on</span>&nbsp;<span>Starkey Hearing Foundation</span>, visit www.starkeyhearingfoundation.org.','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','','none','publicrelations@starkeyfoundation.org','none','','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(29,1,11,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'true','none','{filedir_1}CBSStarkey.jpg','none','{filedir_1}cbslogo.png','none','Media Mention','none',1390856040,'','none','http://minnesota.cbslocal.com/2014/01/27/twins-blog-the-first-starkey-mission/','none','CBS Minnesota ','none','','xhtml','',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'','none','If you watch Bill Austin in his element, you’ll quickly see he’s the real deal.','none','','none','','none','Read More ','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL),(30,1,7,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,0,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','none','Call-to-action','none','Testing...','none','{filedir_1}billaustin.jpg','none','','none','test-1-2-3','none','','none','','none','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,NULL,NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (15,1,5,1,NULL,'172.251.100.146','October Newsletter: A Knight and a Prince Help Kick Off Fall Missions','october-newsletter-a-knight-and-a-prince-help-kick-off-fall-missions','open','y',0,0,0,0,'y','n',1390239060,'2014','01','20',0,0,20140130014619,0,0),(2,1,4,1,NULL,'172.251.100.146','PRESIDENT AND CHELSEA CLINTON VISIT SITE TO SEE','president-and-chelsea-clinton-visit-site-to-see','open','y',0,0,0,0,'y','n',1390188000,'2014','01','19',0,0,20140120033810,0,0),(3,1,4,1,NULL,'172.251.100.146','Starkey Executive Director Speaks on the \'Miracle\' of Watching Patients Hear for the Very First Time','starkey-executive-director-speaks-on-the-miracle-of-watching-patients-hear','open','y',0,0,0,0,'y','n',1390189140,'2014','01','19',0,0,20140120054413,0,0),(4,1,1,1,NULL,'76.169.36.76','Commitment to Action','commitment-to-action1','open','y',0,0,0,0,'y','n',1390237920,'2014','01','20',0,0,20140120173933,0,0),(5,1,1,1,NULL,'76.169.36.76','Building Sustainable Systems of Hearing Care','building-sustainable-systems-of-hearing-care','open','y',0,0,0,0,'y','n',1390197600,'2014','01','19',0,0,20140120080637,0,0),(6,1,7,1,NULL,'172.251.100.146','Celebrity Support','celebrity-support','open','y',0,0,0,0,'y','n',1390198920,'2014','01','19',0,0,20140120064815,0,0),(7,1,7,1,NULL,'172.251.100.146','Listen Carefully in Schools','listen-carefully-in-schools','open','y',0,0,0,0,'y','n',1390199280,'2014','01','19',0,0,20140120064716,0,0),(8,1,7,1,NULL,'172.251.100.146','Recycling Sound','recycling-sound','open','y',0,0,0,0,'y','n',1390199700,'2014','01','19',0,0,20140120064658,0,0),(9,1,6,1,NULL,'172.251.100.146','Where We Are Now','where-we-are-now','open','y',0,0,0,0,'y','n',1390200540,'2014','01','19',0,0,20140120065030,0,0),(10,1,3,1,NULL,'172.251.100.146','Where we are now: India','where-we-are-now-india','open','y',0,0,0,0,'y','n',1390200600,'2014','01','19',0,0,20140120071358,0,0),(11,1,2,1,NULL,'67.53.113.42','We use hearing as a vehicle to change lives around the world.','we-use-hearing-as-a-vehicle-to-change-lives-around-the-world','open','y',0,0,0,0,'y','n',1390202040,'2014','01','19',0,0,20140130234722,0,0),(12,1,5,1,NULL,'172.251.100.146','December Newsletter: Caring for Our Friends in the Philippines','december-newsletter-caring-for-our-friends-in-the-philippines','open','y',0,0,0,0,'y','n',1390202100,'2014','01','19',0,0,20140120072346,0,0),(13,1,5,1,NULL,'76.169.36.76','December Newsletter: Caring for Our Friends in the Philippines','december-newsletter-caring-for-our-friends-in-the-philippines1','open','y',0,0,0,0,'y','n',1390202640,'2014','01','19',0,0,20140129200851,0,0),(14,1,5,1,NULL,'76.169.36.76','Dave Fabry Lives to Listen Carefully','dave-fabry-lives-to-listen-carefully','open','y',0,0,0,0,'y','n',1390202820,'2014','01','19',0,0,20140129200842,0,0),(16,1,6,1,NULL,'76.169.36.76','Hearing Missions','hearing-missions','open','y',0,0,0,0,'y','n',1390241640,'2014','01','20',0,0,20140120181456,0,0),(17,1,10,1,NULL,'76.169.36.76','Programs','programs','open','y',0,0,0,0,'y','n',1390963920,'2014','01','28',0,0,20140129025236,0,0),(18,1,11,6,NULL,'172.251.100.146','Africa 2013: Day 5 Recap','africa-2013-day-5-recap','open','y',0,0,0,0,'y','n',1391028180,'2014','01','29',0,0,20140129205002,0,0),(19,1,10,6,NULL,'67.53.113.42','Programs','programs1','open','y',0,0,0,0,'y','n',1391037960,'2014','01','29',0,0,20140201011508,0,0),(20,1,1,6,NULL,'172.251.100.146','Hear at Home','hear-at-home','open','y',0,0,0,0,'y','n',1391039400,'2014','01','29',0,0,20140130000323,0,0),(21,1,5,6,NULL,'172.251.100.146','September Newsletter: Special Olympics Athletes Receive the Gift of Hearing','september-newsletter-special-olympics-athletes-receive-the-gift-of-hearing','open','y',0,0,0,0,'y','n',1391064120,'2014','01','29',0,0,20140130064853,0,0),(22,1,7,6,NULL,'67.53.113.42','Gift of Hearing in Peru','gift-of-hearing-in-peru','open','y',0,0,0,0,'y','n',1391122980,'2014','01','30',0,0,20140131193344,0,0),(23,1,5,6,NULL,'67.53.113.42','Building Momentum for Peace in the West Bank','building-momentum-for-peace-in-the-west-bank','open','y',0,0,0,0,'y','n',1391199060,'2014','01','31',0,0,20140131201931,0,0),(24,1,5,6,NULL,'67.53.113.42','September Newsletter: Special Olympics Athletes Receive the Gift of Hearing','september-newsletter-special-olympics-athletes-receive-the-gift-of-hea','open','y',0,0,0,0,'y','n',1391199600,'2014','01','31',0,0,20140131202648,0,0),(25,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery','listen-carefully-gallery','open','y',0,0,0,0,'y','n',1391200080,'2014','01','31',0,0,20140131203009,0,0),(26,1,12,6,NULL,'67.53.113.42','Listen Carefully Gallery 2','listen-carefully-gallery-2','open','y',0,0,0,0,'y','n',1391200380,'2014','01','31',0,0,20140131203441,0,0),(27,1,11,6,NULL,'172.251.100.146','Starkey Hearing Foundation','starkey-hearing-foundation','open','y',0,0,0,0,'y','n',1391287200,'2014','02','01',0,0,20140201204822,0,0),(28,1,11,6,NULL,'172.251.100.146','World Leaders, Celebrities and Athletes Attend Starkey Hearing Foundation Gala','world-leaders-celebrities-and-athletes-attend-starkey-hearing-foundation-ga','open','y',0,0,0,0,'y','n',1391287740,'2014','02','01',0,0,20140201205407,0,0),(29,1,11,6,NULL,'172.251.100.146','Twins Blog: The First Starkey Mission','twins-blog-the-first-starkey-mission','open','y',0,0,0,0,'y','n',1391288040,'2014','02','01',0,0,20140201205939,0,0),(30,1,7,1,NULL,'66.215.94.39','TEST OP','test-op','open','y',0,0,0,0,'y','n',1391288940,'2014','02','01',0,0,20140201211428,0,0);
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
INSERT INTO `exp_channels` VALUES (1,1,'homepage_features','Homepage Hero Slider ','http://starkey.ahundredyears.com/','','en',3,0,1391039400,0,'',NULL,'open',1,1,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(2,1,'homepage_content','Homepage Mission and Pictograms ','http://starkey.ahundredyears.com/','','en',1,0,1390202040,0,'',NULL,'open',2,4,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(3,1,'homepage_map_items','Homepage Map Items','http://starkey.ahundredyears.com/',NULL,'en',1,0,1390200600,0,'',NULL,'open',3,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(4,1,'media_mentions_carousel','Media Mentions Carousel','http://starkey.ahundredyears.com/','','en',2,0,1390189140,0,'',NULL,'open',4,10,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(5,1,'blog','Blog','http://starkey.ahundredyears.com/',NULL,'en',7,0,1391199600,0,'',NULL,'open',5,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(6,1,'homepage_map_categories','Homepage Map Categories','http://starkey.ahundredyears.com/',NULL,'en',2,0,1390241640,0,'',NULL,'open',6,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(7,1,'homepage_main_carousel','Homepage Bottom Carousel','http://starkey.ahundredyears.com/','','en',5,0,1391288940,0,'',NULL,'open',7,33,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(8,1,'operation_change_carousel','Operation Change Carousel','http://starkey.ahundredyears.com/','','en',0,0,0,0,'',NULL,'open',7,NULL,'','y','y',NULL,'all','y','n','n','','','y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','y','','n',10,'','',0),(9,1,'listen_carefully','Listen Carefully','http://starkey.ahundredyears.com/',NULL,'en',0,0,0,0,'',NULL,'open',7,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(10,1,'programs','Programs','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391037960,0,'',NULL,'open',8,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(11,1,'media_mentions','Media Mentions','http://starkey.ahundredyears.com/',NULL,'en',4,0,1391288040,0,'',NULL,'open',4,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0),(12,1,'gallery','Gallery','http://starkey.ahundredyears.com/',NULL,'en',2,0,1391200380,0,'',NULL,'open',9,NULL,NULL,'y','y',NULL,'all','y','n','n',NULL,NULL,'y','n','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,'y',NULL,'n',10,'','',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'dev@100yea.rs','10.11.0.1',1389245396,'Logged in'),(2,1,1,'dev@100yea.rs','10.11.0.1',1389245511,'Site Updated&nbsp;&nbsp;Starkey Hearing Foundation'),(3,1,1,'dev@100yea.rs','10.11.0.1',1389255875,'Logged out'),(4,1,1,'dev@100yea.rs','10.11.0.1',1389306293,'Logged in'),(5,1,1,'dev@100yea.rs','67.53.113.42',1389658121,'Logged in'),(6,1,1,'dev@100yea.rs','67.53.113.42',1390001368,'Logged in'),(7,1,1,'dev@100yea.rs','67.53.113.42',1390001560,'Field Group Created:&nbsp;Homepage Features'),(8,1,1,'dev@100yea.rs','67.53.113.42',1390001825,'Field Group Created:&nbsp;Homepage Pictograms'),(9,1,1,'dev@100yea.rs','67.53.113.42',1390001855,'Field Group Created:&nbsp;Homepage Map Items'),(10,1,1,'dev@100yea.rs','67.53.113.42',1390001975,'Field Group Created:&nbsp;Media Mentions'),(11,1,1,'dev@100yea.rs','67.53.113.42',1390002133,'Field Group Created:&nbsp;Blog'),(12,1,1,'dev@100yea.rs','67.53.113.42',1390002338,'Channel Created:&nbsp;&nbsp;Homepage Features'),(13,1,1,'dev@100yea.rs','67.53.113.42',1390002360,'Channel Created:&nbsp;&nbsp;Homepage Pictograms'),(14,1,1,'dev@100yea.rs','67.53.113.42',1390002379,'Channel Created:&nbsp;&nbsp;Homepage Map Items'),(15,1,1,'dev@100yea.rs','67.53.113.42',1390002398,'Channel Created:&nbsp;&nbsp;Media Mentions'),(16,1,1,'dev@100yea.rs','67.53.113.42',1390002408,'Channel Created:&nbsp;&nbsp;Blog'),(17,1,1,'dev@100yea.rs','67.53.113.42',1390003402,'Logged in'),(18,1,1,'dev@100yea.rs','76.169.36.76',1390174434,'Logged in'),(19,1,1,'dev@100yea.rs','172.251.100.146',1390175990,'Logged in'),(20,1,1,'dev@100yea.rs','172.251.100.146',1390178704,'Logged out'),(21,1,1,'dev@100yea.rs','76.169.36.76',1390186504,'Logged in'),(22,1,1,'dev@100yea.rs','76.169.36.76',1390186888,'Field Group Created:&nbsp;Homepage Map Categories'),(23,1,1,'dev@100yea.rs','76.169.36.76',1390187000,'Channel Created:&nbsp;&nbsp;Homepage Map Categories'),(24,1,1,'dev@100yea.rs','76.169.36.76',1390187478,'Field Group Created:&nbsp;Homepage Main Carousel'),(25,1,1,'dev@100yea.rs','76.169.36.76',1390187711,'Channel Created:&nbsp;&nbsp;Main Carousel'),(26,1,1,'dev@100yea.rs','172.251.100.146',1390188000,'Logged in'),(27,1,1,'dev@100yea.rs','76.169.36.76',1390188084,'Channel Created:&nbsp;&nbsp;Operation Change'),(28,1,1,'dev@100yea.rs','76.169.36.76',1390188095,'Channel Created:&nbsp;&nbsp;Listen Carefully'),(29,1,1,'dev@100yea.rs','76.169.36.76',1390188185,'Channel Created:&nbsp;&nbsp;Programs'),(30,1,1,'dev@100yea.rs','76.169.36.76',1390188198,'Field Group Created:&nbsp;Programs'),(31,1,1,'dev@100yea.rs','76.169.36.76',1390190779,'Logged out'),(32,1,1,'dev@100yea.rs','172.251.100.146',1390192108,'Logged in'),(33,1,1,'dev@100yea.rs','172.251.100.146',1390192138,'Logged out'),(34,1,1,'dev@100yea.rs','172.251.100.146',1390192147,'Logged in'),(35,1,1,'dev@100yea.rs','76.169.36.76',1390195561,'Logged in'),(36,1,1,'dev@100yea.rs','172.251.100.146',1390196042,'Logged out'),(37,1,1,'dev@100yea.rs','172.251.100.146',1390196559,'Logged in'),(38,1,1,'dev@100yea.rs','76.169.36.76',1390197123,'Logged in'),(39,1,1,'dev@100yea.rs','76.169.36.76',1390198922,'Custom Field Deleted:&nbsp;carousel_title'),(40,1,1,'dev@100yea.rs','76.169.36.76',1390201092,'Logged in'),(41,1,1,'dev@100yea.rs','76.169.36.76',1390202448,'Custom Field Deleted:&nbsp;blog_link'),(42,1,1,'dev@100yea.rs','76.169.36.76',1390202491,'Custom Field Deleted:&nbsp;blog_source'),(43,1,1,'dev@100yea.rs','172.251.100.146',1390208228,'Logged out'),(44,1,1,'dev@100yea.rs','76.169.36.76',1390209177,'Logged out'),(45,1,1,'dev@100yea.rs','67.53.113.42',1390237918,'Logged in'),(46,1,1,'dev@100yea.rs','76.169.36.76',1390238882,'Logged in'),(47,1,1,'dev@100yea.rs','76.169.36.76',1390241230,'Logged in'),(48,1,1,'dev@100yea.rs','67.53.113.42',1390243995,'Logged out'),(49,1,1,'dev@100yea.rs','67.53.113.42',1390850253,'Logged in'),(50,1,1,'dev@100yea.rs','67.53.113.42',1390850428,'Member profile created:&nbsp;&nbsp;taylor_joseph'),(51,1,1,'dev@100yea.rs','67.53.113.42',1390850463,'Member profile created:&nbsp;&nbsp;trinh_mai'),(52,1,1,'dev@100yea.rs','67.53.113.42',1390850495,'Member profile created:&nbsp;&nbsp;laura_hetzel'),(53,1,1,'dev@100yea.rs','67.53.113.42',1390850564,'Member profile created:&nbsp;&nbsp;randall_ward'),(54,1,1,'dev@100yea.rs','67.53.113.42',1390850671,'Screen name was changed to:&nbsp;&nbsp;Trinh Mai'),(55,1,1,'dev@100yea.rs','67.53.113.42',1390864649,'Logged in'),(56,1,1,'dev@100yea.rs','67.53.113.42',1390865172,'Logged in'),(57,1,1,'dev@100yea.rs','67.53.113.42',1390865267,'Member profile created:&nbsp;&nbsp;julie@100yea.rs'),(58,1,6,'julie@100yea.rs','67.53.113.42',1390865391,'Logged in'),(59,1,6,'julie@100yea.rs','172.251.100.146',1390879909,'Logged in'),(60,1,1,'dev@100yea.rs','76.169.36.76',1390881643,'Logged in'),(61,1,1,'dev@100yea.rs','76.169.36.76',1390888793,'Logged in'),(62,1,1,'dev@100yea.rs','76.169.36.76',1390892415,'Logged out'),(63,1,6,'julie@100yea.rs','172.251.100.146',1390934637,'Logged in'),(64,1,1,'dev@100yea.rs','67.53.113.42',1390942116,'Logged in'),(65,1,1,'dev@100yea.rs','67.53.113.42',1390942173,'Logged in'),(66,1,6,'julie@100yea.rs','172.251.100.146',1390944299,'Logged out'),(67,1,6,'julie@100yea.rs','172.251.100.146',1390946652,'Logged in'),(68,1,6,'julie@100yea.rs','172.251.100.146',1390962146,'Logged in'),(69,1,1,'dev@100yea.rs','76.169.36.76',1390963929,'Logged in'),(70,1,6,'julie@100yea.rs','172.251.100.146',1390966989,'Logged out'),(71,1,6,'julie@100yea.rs','172.251.100.146',1390970002,'Logged in'),(72,1,1,'dev@100yea.rs','76.169.36.76',1390971428,'Logged in'),(73,1,6,'julie@100yea.rs','172.251.100.146',1390974780,'Logged in'),(74,1,1,'dev@100yea.rs','76.169.36.76',1390975337,'Logged in'),(75,1,1,'dev@100yea.rs','76.169.36.76',1390975463,'Member profile created:&nbsp;&nbsp;tulika_bose'),(76,1,1,'dev@100yea.rs','76.169.36.76',1390975508,'Member profile created:&nbsp;&nbsp;megan_sheley'),(77,1,6,'julie@100yea.rs','172.251.100.146',1390977916,'Logged out'),(78,1,1,'dev@100yea.rs','76.169.36.76',1390981911,'Logged out'),(79,1,1,'dev@100yea.rs','76.169.36.76',1390983433,'Logged in'),(80,1,1,'dev@100yea.rs','76.169.36.76',1390986303,'Logged in'),(81,1,1,'dev@100yea.rs','76.169.36.76',1390987040,'Logged out'),(82,1,1,'dev@100yea.rs','76.169.36.76',1390987518,'Logged in'),(83,1,1,'dev@100yea.rs','76.169.36.76',1390990723,'Logged out'),(84,1,6,'julie@100yea.rs','172.251.100.146',1391017243,'Logged in'),(85,1,1,'dev@100yea.rs','76.169.36.76',1391018846,'Logged in'),(86,1,6,'julie@100yea.rs','172.251.100.146',1391021598,'Logged in'),(87,1,1,'dev@100yea.rs','76.169.36.76',1391022070,'Logged out'),(88,1,1,'dev@100yea.rs','76.169.36.76',1391023429,'Logged in'),(89,1,6,'julie@100yea.rs','172.251.100.146',1391024368,'Logged in'),(90,1,1,'dev@100yea.rs','76.169.36.76',1391025187,'Channel Created:&nbsp;&nbsp;Media Mentions'),(91,1,6,'julie@100yea.rs','172.251.100.146',1391025819,'Logged out'),(92,1,6,'julie@100yea.rs','172.251.100.146',1391025824,'Logged in'),(93,1,1,'dev@100yea.rs','76.169.36.76',1391025894,'Logged out'),(94,1,1,'dev@100yea.rs','76.169.36.76',1391025897,'Logged in'),(95,1,6,'julie@100yea.rs','172.251.100.146',1391026118,'Logged in'),(96,1,6,'julie@100yea.rs','172.251.100.146',1391026128,'Logged in'),(97,1,6,'julie@100yea.rs','172.251.100.146',1391026387,'Logged in'),(98,1,1,'dev@100yea.rs','76.169.36.76',1391026426,'Logged in'),(99,1,1,'dev@100yea.rs','76.169.36.76',1391031302,'Logged in'),(100,1,6,'julie@100yea.rs','172.251.100.146',1391032109,'Logged in'),(101,1,1,'dev@100yea.rs','76.169.36.76',1391037048,'Logged in'),(102,1,6,'julie@100yea.rs','172.251.100.146',1391037612,'Logged out'),(103,1,6,'julie@100yea.rs','172.251.100.146',1391038002,'Logged in'),(104,1,1,'dev@100yea.rs','76.169.36.76',1391038930,'Custom Field Deleted:&nbsp;Hear Now Title'),(105,1,1,'dev@100yea.rs','76.169.36.76',1391040145,'Logged in'),(106,1,1,'dev@100yea.rs','76.169.36.76',1391042932,'Logged out'),(107,1,1,'dev@100yea.rs','76.169.36.76',1391043035,'Logged in'),(108,1,1,'dev@100yea.rs','76.169.36.76',1391048286,'Logged out'),(109,1,1,'dev@100yea.rs','76.169.36.76',1391053349,'Logged in'),(110,1,6,'julie@100yea.rs','172.251.100.146',1391063062,'Logged in'),(111,1,6,'julie@100yea.rs','172.251.100.146',1391067363,'Logged out'),(112,1,1,'dev@100yea.rs','67.53.113.42',1391105484,'Logged in'),(113,1,1,'dev@100yea.rs','67.53.113.42',1391108060,'Logged out'),(114,1,6,'julie@100yea.rs','67.53.113.42',1391108410,'Logged in'),(115,1,6,'julie@100yea.rs','67.53.113.42',1391111693,'Logged out'),(116,1,6,'julie@100yea.rs','67.53.113.42',1391122997,'Logged in'),(117,1,1,'dev@100yea.rs','76.169.36.76',1391189536,'Logged in'),(118,1,1,'dev@100yea.rs','76.169.36.76',1391192377,'Logged in'),(119,1,1,'dev@100yea.rs','76.169.36.76',1391192642,'Custom Field Deleted:&nbsp;homepage_map_item_subtitle'),(120,1,1,'dev@100yea.rs','76.169.36.76',1391193919,'Logged in'),(121,1,6,'julie@100yea.rs','67.53.113.42',1391196783,'Logged in'),(122,1,1,'dev@100yea.rs','76.169.36.76',1391198029,'Logged out'),(123,1,1,'dev@100yea.rs','76.169.36.76',1391198055,'Logged in'),(124,1,1,'dev@100yea.rs','76.169.36.76',1391198207,'Logged in'),(125,1,1,'dev@100yea.rs','76.169.36.76',1391199105,'Field Group Created:&nbsp;Gallery'),(126,1,1,'dev@100yea.rs','76.169.36.76',1391199167,'Channel Created:&nbsp;&nbsp;Gallery'),(127,1,1,'dev@100yea.rs','76.169.36.76',1391201583,'Logged out'),(128,1,6,'julie@100yea.rs','67.53.113.42',1391206034,'Logged out'),(129,1,1,'dev@100yea.rs','76.169.36.76',1391210574,'Logged in'),(130,1,1,'dev@100yea.rs','76.169.36.76',1391211049,'Logged in'),(131,1,6,'julie@100yea.rs','67.53.113.42',1391211422,'Logged in'),(132,1,6,'julie@100yea.rs','67.53.113.42',1391215453,'Logged in'),(133,1,1,'dev@100yea.rs','76.169.36.76',1391219603,'Logged in'),(134,1,6,'julie@100yea.rs','172.251.100.146',1391287070,'Logged in'),(135,1,1,'dev@100yea.rs','76.90.138.219',1391287092,'Logged in'),(136,1,1,'dev@100yea.rs','66.215.94.39',1391287166,'Logged in'),(137,1,1,'dev@100yea.rs','66.215.94.39',1391287445,'Logged in'),(138,1,1,'dev@100yea.rs','66.215.94.39',1391288259,'Logged in'),(139,1,1,'dev@100yea.rs','66.215.94.39',1391288473,'Logged in'),(140,1,1,'dev@100yea.rs','66.215.94.39',1391288998,'Logged in'),(141,1,1,'dev@100yea.rs','66.215.94.39',1391294402,'Logged out'),(142,1,1,'dev@100yea.rs','76.169.36.76',1391315976,'Logged in'),(143,1,1,'dev@100yea.rs','76.169.36.76',1391323405,'Logged in');
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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'Clinton_Foundation_Logo.png',1,'/var/www/starkey/www/uploads/Clinton_Foundation_Logo.png','image/png','Clinton_Foundation_Logo.png',38236,NULL,NULL,NULL,1,1390196588,1,1390196588,'200 200'),(2,1,'TaniAustin.jpg',1,'/var/www/starkey/www/uploads/TaniAustin.jpg','image/jpeg','TaniAustin.jpg',69284,NULL,NULL,NULL,1,1390196612,1,1390196612,'914 1920'),(3,1,'HERO-Commitment_to_Action_Film.jpg',1,'/var/www/starkey/www/uploads/HERO-Commitment_to_Action_Film.jpg','image/jpeg','HERO-Commitment_to_Action_Film.jpg',776028,NULL,NULL,NULL,1,1390197274,1,1390197274,'863 1537'),(4,1,'HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',1,'/var/www/starkey/www/uploads/HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg','image/jpeg','HERO-Building_Sustainable_Systems_of_Hearing_Care.jpg',593029,NULL,NULL,NULL,1,1390197738,1,1390197738,'901 1604'),(5,1,'CAROUSEL-Celebrity_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Celebrity_Film.jpg','image/jpeg','CAROUSEL-Celebrity_Film.jpg',475187,NULL,NULL,NULL,1,1390199154,1,1390199154,'932 1667'),(6,1,'CAROUSEL-Listen_Carefully.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Listen_Carefully.jpg','image/jpeg','CAROUSEL-Listen_Carefully.jpg',365844,NULL,NULL,NULL,1,1390199537,1,1390199537,'833 1484'),(7,1,'CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg','image/jpeg','CAROUSEL-Hear_Now-Hearing_Aid_Recycling_Program.jpg',670536,NULL,NULL,NULL,1,1390199867,1,1390199867,'943 1676'),(8,1,'CAROUSEL-William_F._Austin_Legacy_Film_.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_.jpg',472023,NULL,NULL,NULL,1,1390200146,1,1390200146,'909 1614'),(9,1,'CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film_1.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film_1.jpg',472023,NULL,NULL,NULL,1,1390200232,1,1390200232,'909 1614'),(10,1,'CAROUSEL-William_F._Austin_Legacy_Film.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-William_F._Austin_Legacy_Film.jpg','image/jpeg','CAROUSEL-William_F._Austin_Legacy_Film.jpg',472023,NULL,NULL,NULL,1,1390200330,1,1390200332,'909 1614'),(11,1,'icon_now.png',1,'/var/www/starkey/www/uploads/icon_now.png','image/png','icon_now.png',3574,NULL,NULL,NULL,1,1390200625,1,1390200625,'56 56'),(12,1,'CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg','image/jpeg','CAROUSEL-Where_We_Are_Now-India-DSC03269cc.jpg',497551,NULL,NULL,NULL,1,1390202028,1,1390202028,'520 936'),(13,1,'info_livesimpacted.jpg',1,'/var/www/starkey/www/uploads/info_livesimpacted.jpg','image/jpeg','info_livesimpacted.jpg',421949,NULL,NULL,NULL,1,1390202277,1,1390202277,'198 252'),(14,1,'info_livesindirectly.jpg',1,'/var/www/starkey/www/uploads/info_livesindirectly.jpg','image/jpeg','info_livesindirectly.jpg',419656,NULL,NULL,NULL,1,1390202291,1,1390202291,'198 252'),(15,1,'info_totalaids.jpg',1,'/var/www/starkey/www/uploads/info_totalaids.jpg','image/jpeg','info_totalaids.jpg',429588,NULL,NULL,NULL,1,1390202303,1,1390202303,'198 252'),(16,1,'Blog_Philippines_.jpg',1,'/var/www/starkey/www/uploads/Blog_Philippines_.jpg','image/jpeg','Blog_Philippines_.jpg',109435,NULL,NULL,NULL,1,1390202735,1,1390202735,'705 1024'),(17,1,'Dave_Fabry.jpg',1,'/var/www/starkey/www/uploads/Dave_Fabry.jpg','image/jpeg','Dave_Fabry.jpg',5586954,NULL,NULL,NULL,1,1390203283,1,1390203283,'3744 5616'),(18,1,'Blog_A_Knight.jpg',1,'/var/www/starkey/www/uploads/Blog_A_Knight.jpg','image/jpeg','Blog_A_Knight.jpg',489257,NULL,NULL,NULL,1,1390239202,1,1390239202,'1571 1992'),(19,1,'HERO-Vikings_Mission-IMG_6312.jpg',1,'/var/www/starkey/www/uploads/HERO-Vikings_Mission-IMG_6312.jpg','image/jpeg','HERO-Vikings_Mission-IMG_6312.jpg',416512,NULL,NULL,NULL,6,1391040192,6,1391040192,'496 936'),(20,1,'PeaceinWestBank.jpg',1,'/var/www/starkey/www/uploads/PeaceinWestBank.jpg','image/jpeg','PeaceinWestBank.jpg',121580,NULL,NULL,NULL,6,1391041006,6,1391041006,'680 1024'),(21,1,'September_Newsletter.jpg',1,'/var/www/starkey/www/uploads/September_Newsletter.jpg','image/jpeg','September_Newsletter.jpg',111923,NULL,NULL,NULL,6,1391064515,6,1391064515,'680 1024'),(22,1,'CAROUSEL-Peru_Mission-02-DSC07062.jpg',1,'/var/www/starkey/www/uploads/CAROUSEL-Peru_Mission-02-DSC07062.jpg','image/jpeg','CAROUSEL-Peru_Mission-02-DSC07062.jpg',582871,NULL,NULL,NULL,6,1391123133,6,1391123133,'639 936'),(23,1,'westbank2.jpeg',1,'/var/www/starkey/www/uploads/westbank2.jpeg','image/jpeg','westbank2.jpeg',110244,NULL,NULL,NULL,6,1391199395,6,1391199395,'480 640'),(24,1,'special_olympics_mission.jpg',1,'/var/www/starkey/www/uploads/special_olympics_mission.jpg','image/jpeg','special_olympics_mission.jpg',20900,NULL,NULL,NULL,6,1391199945,6,1391199945,'220 330'),(25,1,'Screen_Shot_2014-01-31_at_12.29.23_PM.png',1,'/var/www/starkey/www/uploads/Screen_Shot_2014-01-31_at_12.29.23_PM.png','image/png','Screen_Shot_2014-01-31_at_12.29.23_PM.png',959232,NULL,NULL,NULL,6,1391200188,6,1391200193,'474 1440'),(26,1,'listencarefullygallery2.png',1,'/var/www/starkey/www/uploads/listencarefullygallery2.png','image/png','listencarefullygallery2.png',1155901,NULL,NULL,NULL,6,1391200463,6,1391200475,'476 1440'),(27,1,'COVER_pianoboy_cc.jpg',1,'/var/www/starkey/www/uploads/COVER_pianoboy_cc.jpg','image/jpeg','COVER_pianoboy_cc.jpg',8653599,NULL,NULL,NULL,6,1391213845,6,1391214146,'3283 5410'),(29,1,'_DSC0608cc.jpg',1,'/var/www/starkey/www/uploads/_DSC0608cc.jpg','image/jpeg','_DSC0608cc.jpg',3682161,NULL,NULL,NULL,6,1391215984,6,1391215984,'3083 4635'),(30,1,'marleemartin.jpeg',1,'/var/www/starkey/www/uploads/marleemartin.jpeg','image/jpeg','marleemartin.jpeg',24873,NULL,NULL,NULL,6,1391217284,6,1391217284,'327 320'),(31,1,'cnnlogo.png',1,'/var/www/starkey/www/uploads/cnnlogo.png','image/png','cnnlogo.png',20982,NULL,NULL,NULL,6,1391287531,6,1391287531,'225 300'),(32,1,'billaustin.jpg',1,'/var/www/starkey/www/uploads/billaustin.jpg','image/jpeg','billaustin.jpg',32328,NULL,NULL,NULL,6,1391287698,6,1391287698,'342 500'),(33,1,'CBSStarkey.jpg',1,'/var/www/starkey/www/uploads/CBSStarkey.jpg','image/jpeg','CBSStarkey.jpg',28201,NULL,NULL,NULL,6,1391288289,6,1391288289,'349 620'),(34,1,'cbslogo.png',1,'/var/www/starkey/www/uploads/cbslogo.png','image/png','cbslogo.png',3932,NULL,NULL,NULL,6,1391288322,6,1391288322,'300 300');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_freeform_params`
--

LOCK TABLES `exp_freeform_params` WRITE;
/*!40000 ALTER TABLE `exp_freeform_params` DISABLE KEYS */;
INSERT INTO `exp_freeform_params` VALUES (10,1391322627,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),(11,1391323001,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}'),(12,1391323734,'{\"form_id\":\"2\",\"edit\":false,\"entry_id\":0,\"secure_action\":false,\"secure_return\":false,\"require_captcha\":false,\"require_ip\":true,\"return\":\"\\/#thank_you\",\"inline_error_return\":\"api\\/program_2\",\"error_page\":\"\",\"ajax\":true,\"restrict_edit_to_author\":true,\"inline_errors\":false,\"prevent_duplicate_on\":\"\",\"prevent_duplicate_per_site\":false,\"secure_duplicate_redirect\":false,\"duplicate_redirect\":\"\",\"error_on_duplicate\":false,\"required\":\"\",\"matching_fields\":\"\",\"last_page\":true,\"multipage\":false,\"redirect_on_timeout\":true,\"redirect_on_timeout_to\":\"\",\"page_marker\":\"page\",\"multipage_page\":\"\",\"paging_url\":\"\",\"multipage_page_names\":\"\",\"admin_notify\":\"dev@100yea.rs\",\"admin_cc_notify\":\"\",\"admin_bcc_notify\":\"\",\"notify_user\":false,\"notify_admin\":false,\"notify_on_edit\":false,\"user_email_field\":\"\",\"recipients\":false,\"recipients_limit\":\"3\",\"recipient_user_input\":false,\"recipient_user_limit\":\"3\",\"recipient_template\":\"\",\"recipient_user_template\":\"\",\"admin_notification_template\":\"0\",\"user_notification_template\":\"0\",\"status\":\"pending\",\"allow_status_edit\":false,\"recipients_list\":[]}');
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
INSERT INTO `exp_members` VALUES (1,1,'dev@100yea.rs','100YRS','a8a7b03cba67d17d2ab5be34c9079ba33d1a1cb6cb864a9aa5007ac25bd8b059d76a2f75350ac5f1bedcff3b71dd878f1be88dcfbdf5d3cab855dcf5187212a7','EkVtF:M>jnMhU/SMX(=q$*5gN28)NItXmg?K)|yJg7_H.Wi;4-`Ut<L1Wiu:dse}x;m/pqhGbh1aEGVlN2^%V{;=)FA6\'uOPR?mEDy5Nxu2Wax2v(knj(:eG>8BP\\\\,=','9f103e0f65ebdd0f0071291566aa0b4ec2c0ce3a','efa1131cff05bf5812eeffa169757ded10ce276e',NULL,'dev@100yea.rs',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'10.11.0.1',1383699021,1391294306,1391324025,16,0,0,0,1391289072,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18','',NULL,'n',0,'y',0),(2,1,'taylor_joseph','Taylor Joseph','d20885cf421ceae1fa04b3a1a3992b8dc6c42ca802a1180d8b032923319c9fb433baa5efeadd919f690f34add079a66f87a270c782ffe4b738122ae382313d13','^.~=fwa3Cemv@z:=#BSGn+iU-sVH$k8L8_6k|S6~@_lCql3fjB86rE1!u&DF6-FTo:kn/.\\4,$8RgD<v/_`K7K\\/\\\'GMq@7EAMp\'bO%Z\'[r\\]lY){pRW2R[KBat%dTX;','0f194eb9cb74f4354d309168b2cf28f22b33035a','ff6cfdb53f105bf771eebde3464924b440931c4a',NULL,'Taylor_Joseph@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850428,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(3,1,'trinh_mai','Trinh Mai','4af7e123cfd0eb006ff307e029e60d84a9605df47460ee2e9f8603c69d4ba6862e6cc7b311b91d59ddbc9a234dc738292fdd5424dc395d8722f637894f069533','fUd)AD)k(|_rjDR/bWfLOR%}?Kov_~\'q3Y\'~Skf?sYWZ`;Z4.agpI%+&l:I0C@S},}xzN/BI`O6*fCFlgR2pXh%C<X_NqS[^6$&,v8YeGuP7S>MU~Sc-8\'rp8cq93S5_','2a35c0eb5685fb2a80c82f6cf386813ccc5ebfec','7f16667d0fc7fa3c9cda673b2372442193108e2c',NULL,'Trinh_Mai@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(4,1,'laura_hetzel','Laura Hetzel','f31af15e4df9066600604e5241f9dcd4871ae789f67ade5d94d30ad98326beacd09e6a8fe61408c639d0ba0fd6bc65f63254b20342d50d9d052c5003a712c6bf','*q{*<U!9;t1[fdpy[8t4w]P<045n}5*\"hw]*,bZQo&zUoywdYSRT\\8z0KO5$mT\'Uj~u#2,Z&\"J]Xp5FCfJH3|LWFI7!}VyijN98},k40n7A*:?kK)fN)n(bTJ&r?H\\#c','968d5b7895b7e24e58be8e3575dd2d6c134fc476','332b1fb5073f09dbf7468e1a2b0d65bc8a56af92',NULL,'Laura_Hetzel@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850495,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(5,1,'randall_ward','Randall Ward','4ff34fe515b1476d91a1ab21fd22609af97f7c6c969320c18b49367dbd27c7ae9b227e2cee9ac01e4d8bfe00f3f9ee7b76383031c9eb10ede0ef177767f0d0e6','#$.Ln^2*0E}w#0pmZU\'JvCv\\:US04A5e#,_7?\'jQ/=z:\"`|EuoB6\"(L9QuOh/6nbtDrkeN7ST4O|\'zL[;+:!Mdl\\scJvO,t+?AN^}zyem@f(%W-@:?ph<xl%uVD{WDTE','0ea2c818353df42c5f031017b53739481035fb6a','0c30f8fcd22592abb65ce9399db9e0e0feede1bd',NULL,'Randall_Ward@starkeyhearingfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390850564,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(6,1,'julie@100yea.rs','Julie','2c1165ca027fa015339d532b45aac4472419a40f1cdcccac7db78ae4f7a7575c9b705301695a54265f2143ccd0aa1ea1e03d62f24f3a26bb50645b729a917ca9',']y\\X@r{`sR^Jh=#r#Q-9BW!}DD(yT6_x<$,\"N/xro:M`v}(:ui;TDePq!]_]dhx`~<.\\g_4x=^&\\:h}Xied@auH0\"g&KUTWDb\\hHM}@?Etk;E{,b6wHrh^B_m;G!bK|J','9444d23d017fe0fb04505a0d6c41e8ec9275578a','a86408905268b712456c93cc4b374b2293ab63a9',NULL,'julie@100yea.rs','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'67.53.113.42',1390865267,1391217549,1391288262,12,0,0,0,1391288379,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(7,5,'tulika_bose','Tulika Bose','b4326e7a34c0875c944e4c8f8fe242d78d1ba805a53b3307053ca5efa1430c2965207a465552c874f9d71875b3e829551d0cd65e741d5cd3ea37651f35fa8a86','I]$m=VBBlaB*+n\'`7,K1x?YhI,~t}qao0GN%^2_\'N@\'!\\DO\"Skmiu\'s{]:L)+g\"|&}JYyf1n:)t7{$w:jQzAl-Oi0.}\\9.]\\|Uq*8&y^>Bv\'dV3G;.i4hsjC]T:uA.ij','9ad103500d30fb95dede1cd734acfd2c566c34a6','f852d5c7028ebacdeed5f2442afad2d7cfc0da29',NULL,'Tulika_Bose@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975463,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0),(8,5,'megan_sheley','Megan Sheley','a8d94a9de0e8eaaeea268469640a73ba4d81930f6d4bfb5ca913861871a62fa9d89de6b08a1b7d4bb881519855e7ba4da3e16d41e3b7e7a8ba67e9ba99e4af7a','NQAOe2\"V<=~g}:~wBsF~B4Oy4$^NOj-CdW4+iRsoo-~2~6XE-@nBy0Ee4H7QW\\U^V.}AP3eX,~XO9J|z:g_*[xPhT(wzJ.YrMzRCdg6uus\"a]aAZt7YE\'3*+=6AY]G\\z','959e59ff8c8d14aec02135972b2757dbb5f08611','c134aecae31953d508b66a656cbe5632d6e77728',NULL,'Megan_Sheley@starkeyfoundation.org','','','','',NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'76.169.36.76',1390975508,0,0,0,0,0,0,0,0,0,0,'n','y','y','y','y','y','y','y','y','english','America/Los_Angeles','us',NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,NULL,'n',0,'y',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=7193 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (4740,1391294331,'0','f9fff90c544ea8b66b6e420165ab07a3d9c7d844',0),(4739,1391294331,'0','820999d353e9d2d7a41e157063f89c5796811c71',0),(4738,1391294331,'0','6f017f47d439469467f83a1c11e1e6aa72cb536e',0),(4736,1391294331,'0','58b7b7349ce700c31dd76a46c53cc13ba5511322',0),(4737,1391294331,'0','9db0d6c073dafc852c60d5370557e2db495cf63e',0),(4735,1391294331,'0','3de382c031a941dc4e63f8f88f0d65d75db81bb7',0),(4734,1391294331,'0','1a6ac8ce0af839ae2e0848b7a04f945dc827de1e',0),(4733,1391294331,'0','0d1cf37b8755a4f7a63bdd0a6db1bf55bcb68724',0),(4732,1391294331,'0','c559d6d765f199e0ca82eff0eba14ae6d1f49c6b',0),(4731,1391294331,'0','e2ac98651922482de6758aac12d958fcca52d5d2',0),(4730,1391294330,'0','4578317c8dc2c794991801a4ebe488d45ef7a518',0),(4729,1391294330,'0','24458fccf34192b9c95f5101e6400301f94f4421',0),(4728,1391294330,'0','6f0bae79c42ec773780d240b965d9505cb2384c1',0),(4727,1391294330,'0','66453ebdca034335ed96dc3e26edde55044cc084',0),(4726,1391294330,'0','c28aad53bb56d9a533a797710736e5633e1087d1',0),(4725,1391294330,'0','2af53c2bfee3a2ec299610785c9e72347f4465c3',0),(4724,1391294330,'0','da02237571f7e3940897959b27b93c6a6c7218a8',0),(4723,1391294329,'0','e635a356805677610735db72b910747a4afcf969',0),(4722,1391294329,'0','89a9adb0f06239eaa89885bdcad7195b41e38e7e',0),(4721,1391294329,'0','d555abb9ee754553b9b5ff5a921f06f5d71c8813',0),(4720,1391294329,'0','a5f67e0916248450a5b7d42c8921d0a0a2231895',0),(4719,1391294329,'0','589520293e3d6d018936a6d21cd463381e3705f0',0),(4718,1391294329,'0','9771aac55e56d754799b5c97dfa5f69d001255b8',0),(4717,1391294329,'0','4a0db708a8ceb51c75010f9b683f8b6496b36f29',0),(4716,1391294329,'0','bbca9e0a221849f6c9aa3bdce0c052708eb85e8f',0),(4715,1391294329,'0','e0b253d8d6fdeb83d571fdf6b88209db0304ee40',0),(4714,1391294329,'0','ef355bdd32c5af263dd519a7c2705d65709acd98',0),(4713,1391294329,'0','24d78bef67c93624990374fdf9f4b73da7b743ca',0),(4712,1391294328,'0','22765994184c9f7ac691341e2b6b91ae7025ffc6',0),(4711,1391294328,'0','2365b0baad2a71cde267dc82f0aeec63bec54248',0),(4710,1391294328,'0','598bbb866b299bcfc6d17e3fbe41e0a54b042dff',0),(4709,1391294328,'0','fddb7e299374739691a926e543d31acd587af984',0),(4708,1391294328,'0','028f0eaa1f739eafcd954e08938f71d1207f6100',0),(4707,1391294328,'0','c4a221578a60b1389b3ca87cb92ecf5aee521fda',0),(4706,1391294328,'0','95c8a4bccd58cb7dfbf0a9ed866d0d8ea297da1d',0),(4705,1391294328,'0','3274a8ca64addce4404665f21dc98408343e488d',0),(4704,1391294328,'0','ea608315912ce5cb2f14ccbe0706552a9f47884d',0),(4703,1391294328,'0','2f3dbf76274a29d2ef2f20fbfd339ebfbb5c6661',0),(4702,1391294328,'0','acd8382fd981469fcc29bfc6687c7224f6eca333',0),(4701,1391294327,'0','1521612793d6bd73903e7619959b6790e15a3c59',0),(4700,1391294327,'0','f8169da204fbed72b2a440e466d31612081ef685',0),(4699,1391294327,'0','1d5aeb6194890c0632a5855783f9af42369a37f5',0),(4698,1391294327,'0','dac32b796653bb0752068a621f7c6b51563d727a',0),(4697,1391294327,'0','ff37a2eeb1c3edce67362f0785ff491fa1293840',0),(4696,1391294327,'0','19996e453afe5837c35f48d61b95e7de67a7ff30',0),(4695,1391294326,'0','d553b16ca1ef77180b31a1fb25bce9d59b2f9a49',0),(4694,1391294326,'0','952c76c98eb0c78a6ab5faafeaaf25a3af373a7a',0),(4693,1391294326,'0','5dbaf6eabaea6e967f3d6c52a2124c2e2a44fcee',0),(4692,1391294306,'3d5d660e851ca2b0b086cbe997888007997febab','71ed2b6da52fed68d37a954c064190346faff8e5',0),(4691,1391294306,'3d5d660e851ca2b0b086cbe997888007997febab','8445c4b4f28294c031e1a42c0b79dafb43a5fb87',0),(4690,1391294270,'0','2d419e55ca1a277c1165f3fd815a943f873326c1',0),(4689,1391294259,'0','e91433cd7549fcd34c9f842c9f94a8fc2fb41229',0),(4688,1391294258,'0','5f150f6b8471ce92b5ec89d6196124770877843b',0),(4687,1391294247,'0','ab8c5f108508b57499610ff703e375b6df189633',0),(4686,1391294235,'0','e2314f9d92ba952b7f843fa1d20d958b6f49b9f7',0),(4685,1391294222,'0','25884271e09aee59f037f1bbad897b65bfdcb10a',0),(4684,1391294210,'0','c8cbffc0cb97ee8a2f17e530b21f451f3a5bdbee',0),(4683,1391294199,'0','31c76f698efaabb06eaee30784e8dbb80a9c1bc8',0),(4682,1391294199,'0','f68bff168435131460a4c7ddaceef93734737331',0),(4681,1391294198,'0','e080045dc6c95bf7eacf8e40ee06c6ba29d9f8a7',0),(4680,1391294189,'0','24b3b3d88c6f8e0150128e3b27c68ba09bf6d44a',0),(4679,1391294189,'0','9f403b4085bbec5a910d50a3751080a932d7945e',0),(4678,1391294186,'0','3bf5ea78023434304319f429d0a3026a3dd9a841',0),(4677,1391294186,'0','f6a3cd1a721658290e5b84217015dfac4a788b66',0),(4676,1391294186,'0','6d15f1296c8f6a5ae5ba7bd862f01686a071216e',0),(4675,1391294184,'0','3902296612e516ee1592621bccddd54b12400aff',0),(4674,1391294184,'0','755bc7e33de4cbdd31adc230aa096ecb045c595f',0),(4673,1391294183,'0','c9e2a3821e625116924cf03cb1e67179f3d714cd',0),(4672,1391294173,'0','c527cb960880ee8fe44295d81733435ed864d446',0),(4671,1391294161,'0','7b5e7460de54708abf1135d7dde98e83bbe61bb8',0),(4670,1391294149,'0','ac64252e636b956089c82304799ad1dc849c96d4',0),(4669,1391294138,'0','29d722c83e8607fb3de5e23336435a8b31bf4c74',0),(4668,1391294125,'0','2219bba3d4e9fb625062d26fcf69a19c0557b70e',0),(4666,1391294098,'0','8fa1de5573770eda2a4c7e48b5535f5f5205bd1b',0),(4667,1391294112,'0','60a031193251f67884656e97b44a826c875c6085',0),(4665,1391294087,'0','615af1f48f7b8f669c92b3370d2c259be426ae85',0),(4662,1391294036,'0','451b04163b39503f67b1351928fa1a7cc6a2af57',0),(4663,1391294056,'0','edbc04b1cdfd7cc58a3d36afda9ed95512fad76e',0),(4664,1391294069,'0','032b7b7bd92bcc4a77d52c91ed835f0d68f4eba3',0),(4660,1391294014,'0','e4b5af87e3d426c211a839ffdd5413b4fe5a1f7d',0),(4661,1391294025,'0','df6ac1ada24873ceb8fb1f9bff035be645ec4e24',0),(4659,1391294002,'0','a4f37b49f8ea9943d1a6fddf4864267d08a41dc5',0),(4658,1391293990,'0','abcda881fb917fb1383b26d0820684ad7538cc84',0),(4656,1391293968,'0','af7443ddb996ef9877e1a3fc0a6fa0138ad15994',0),(4657,1391293979,'0','8ac0d3eae8c93cb4b3d26f49f9e5c3a809929be8',0),(4655,1391293956,'0','556d22c7e3b746e0f4420465f367b98c7ba970bb',0),(4653,1391293933,'0','a71fda8df8e149bb2bdca0b5ec64676b1ad408d3',0),(4654,1391293945,'0','4be2d4a77e42d5659fd1f4879ac5f511076faaec',0),(4651,1391293910,'0','e1d77a194f4916d3f653ada69fdd5ffc65659635',0),(4652,1391293921,'0','52186ffa8ef6df115584d6faa219a560f1602187',0),(4650,1391293899,'0','42020907c5b633993c39e74db928c4525270878b',0),(4649,1391293888,'0','2088d5c95212aba580d26d6cac7ab6ba9a308208',0),(4648,1391293877,'0','9730df132d710629d17da6421a7eba1abe864b24',0),(4646,1391293855,'0','ccc4af422be785589869527fc2c0932bee213939',0),(4647,1391293865,'0','d37f87318d3c414e4ae93a7a0e78a47d6b0b970d',0),(4645,1391293844,'0','df04d06f59f60b9b4e8eba50983c35f5bc253546',0),(4643,1391293822,'0','71a7cf060219270fda2f09acb1ab8b0757059586',0),(4644,1391293833,'0','ebaf84af95d2fc4fa8bfc9b0202f8ca1476a4733',0),(4642,1391293821,'3d5d660e851ca2b0b086cbe997888007997febab','26d2cfdec62527fa9d4ad6dfd81992c75f833d11',0),(4640,1391293810,'0','1d72745a86d88fa05a6dd8cccf07e0b7cb831112',0),(4641,1391293821,'3d5d660e851ca2b0b086cbe997888007997febab','659751ec831c7ab55d04c82450273ef479d3b031',0),(4639,1391293805,'3d5d660e851ca2b0b086cbe997888007997febab','66c8788ef7737c26f9c438376d49b6512afcc5db',0),(4638,1391293805,'3d5d660e851ca2b0b086cbe997888007997febab','f6d210f9bd3bda739e37af7a481f1f72efcb7c8d',0),(4637,1391293798,'0','17ab6944cfded0c72bf672cbc458b84d2cb5728b',0),(4636,1391293788,'0','7ac190e113290a1781fcf28f43bd926ba7b9739c',0),(4635,1391293777,'0','ae0e5b8c310c25dd34a6c30ee0b91f36e27c5c7a',0),(4634,1391293766,'0','1500637dd7dd127a56e8e42af5f291f76e53628e',0),(4633,1391293754,'0','20404ff918b44af8028e1063af6f1ed2f676c60a',0),(4632,1391293742,'0','ef56e81270eb3f7544457bcb277f13eb0f309478',0),(4631,1391293730,'0','a2b704f2b0682a2e779fcb347ab5ca0d4b758fc2',0),(4630,1391293719,'0','e2f7a30aa3e6c9d2de658c57418e64c6578c37ec',0),(4629,1391293709,'0','736952ec82a475addd49df3dfd70c51d36890959',0),(4628,1391293698,'0','1e8902bd81f49e0efcc18f53606b1f17988e0ff5',0),(4627,1391293688,'0','0ac23bc6621fdd74ba4c72fd2e914d40cb679c1b',0),(4626,1391293677,'0','8c2edaf6c2d0a7e475262270014470d43956aeca',0),(4625,1391293666,'0','0ca35e1d46ff849192391e2d3789de1c419e2942',0),(4624,1391293656,'0','fc89c44de18f71689e9831f48e6a5f2971dcfa81',0),(4623,1391293646,'0','3a9d34131b4626b23e81dd38e8149a3a913b8b44',0),(4622,1391293636,'0','d974ad9b32ec6544f4e1c6e1d1a1ef8c681328e3',0),(4621,1391293626,'0','9fea5a113d4f32c65a4a3b632f481521cf2033d9',0),(4620,1391293616,'0','d1df5efa05bd9b53611537b32364043a37732db1',0),(4619,1391293605,'0','3b4a981139fb33dc12197298f6ff20aaf02a1299',0),(4618,1391293595,'0','db140b86286d8c75a8a93c0346558a14d51a35cc',0),(4617,1391293584,'0','725618285c5a867b191761624419988c9b8ab4f8',0),(4616,1391293574,'0','f4c4a6000cc2182b7c46c3d7f9bcc8f0a4e09237',0),(4615,1391293565,'0','1b4a318af9d37cf96f1f8c5ce534f9d3bf71b68a',0),(4614,1391293555,'0','bc0f0196c07e0a172a13dbf21025b9208c77ef67',0),(4613,1391293545,'0','1e0db88e9cac036f5dfaac99e27cbabf45dd6c3e',0),(4612,1391293535,'0','c8a25da8db539bdda7242b17fdea18521350e282',0),(4611,1391293526,'0','1f4c024de228c40ad0f6b06c0544917d8dccc42a',0),(4610,1391293516,'0','872684c03a9564933cb4a310c90a7a4c2fc86222',0),(4609,1391293507,'0','003245658a24014098f747f0447c0c899401d32f',0),(4608,1391293497,'0','b8a52d7407a77d5176f18be9dcf4413a95f7fd01',0),(4607,1391293486,'0','dc90b26166ffab9cb38ca4346982c0510352e181',0),(4606,1391293477,'0','31445814b2b13d9e03503952af92ed01702cb5a7',0),(4605,1391293466,'3d5d660e851ca2b0b086cbe997888007997febab','e8dbb15a25b66618706f41cf499441a8a4395eaa',0),(4604,1391293466,'3d5d660e851ca2b0b086cbe997888007997febab','6a7b87c4bf2036e5c3db157c63c0e329ecdabb51',0),(4603,1391293465,'0','a35d560ae07f9de0824e68eafbcc92f383250011',0),(4602,1391293456,'0','ab8f8852aa1658e96d67208127f9ff9012ab74c3',0),(4601,1391293447,'0','5507aff7075fef5ed3b56a47dd9cf729a49e7c4c',0),(4600,1391293437,'0','e9009429eaf2148e0b251822e2d892a25cb52e25',0),(4599,1391293428,'0','c8b792e78a66c6b1e263b4844b25b64302e1bee8',0),(4598,1391293418,'0','05dbc3429719a2f9319a9807971a5b69458cde2f',0),(4597,1391293408,'0','3dd0a069f71918654e8b7d8f669ee91fa6e46fa7',0),(4596,1391293399,'0','a9284353d04778a58b7edd409d02eea9aeb4997b',0),(4595,1391293390,'0','dc57e8ae0d5c26a41109e4ef281cc7858eece1cb',0),(4594,1391293381,'0','466d02651494902ba4d9abb8f3f3a651ec9927b6',0),(4593,1391293370,'0','577d34cf165a070b746910288b6a9b86097468e3',0),(4592,1391293361,'0','ba9471c464b424b08bfd92d3895723b2bdb2e9c0',0),(4591,1391293352,'0','784e9b923e5dc7d3613621e08e8bde8b8191bb89',0),(4590,1391293343,'0','625e542163d5ddaa330370e56f16dddc4e6d0128',0),(4589,1391293333,'0','a1f74b44a7328abd1723b6dd9dacb26dc6ac8a39',0),(4588,1391293324,'0','41fe8e37e504503b0bbc5da51c55812498b70323',0),(4587,1391293315,'0','3e9b863b0e7df267c56ca462b4e1db9138996b77',0),(4586,1391293307,'0','fade550874358ddf46b8fcefe130ab24d7cc3c77',0),(4585,1391293298,'0','2b9fd8944645205e4148a53805cf84ba311ad639',0),(4583,1391293278,'0','0c04be3c671409f8da7c5cd6f1a672450348901e',0),(4584,1391293289,'0','ba9e54631e76543fa0b9a60bab10ba84463efb76',0),(4582,1391293269,'0','ac800d06776dd0b994e57d468e36108333a813f7',0),(4581,1391293259,'0','dc9538d101149f1c5f3fa7bbc3e60aef3820173e',0),(4580,1391293251,'0','6e705501ed266ab571bae86c1d68a49356fef0f8',0),(4579,1391293242,'0','eab5d48a73a05694dd580264078b32c23e3b8e4e',0),(4578,1391293233,'0','02b56ac5857ad52a64e3d359c8d4d148290c5a17',0),(4577,1391293225,'0','d94874f1ded96b024d92ed29d27f961fd0306d1f',0),(4576,1391293216,'0','f86ffd0077c778c98f01df294901bca981106cb7',0),(4575,1391293206,'0','bcc72dde3d9bea96e4545049c43fa07c457d7878',0),(4574,1391293198,'0','76d846f2847ccc2068ca3aa995c39803ff8c11e6',0),(4573,1391293189,'0','045b1a101363b732b9d4fa988bf408369107d49c',0),(4572,1391293181,'0','6072e4f34a2dae5a21127bfc02cc9a95f78ea5c2',0),(4571,1391293173,'0','d6c2985d6ba665b2c7b750c0865f56d4a3095f4f',0),(4570,1391293165,'0','e94e96d0b17a23c74569041848ff54be879352c3',0),(4569,1391293157,'0','e74b47d1b53b0b6fca6547d67471aa4555144631',0),(4568,1391293150,'3d5d660e851ca2b0b086cbe997888007997febab','d16ecc48c4d77d99281e05ea8d0df864249ff5f4',0),(4567,1391293150,'3d5d660e851ca2b0b086cbe997888007997febab','794116689282c1552a8a52a00ab81ff59869c282',0),(4566,1391293147,'0','d6b6a9874b2d8bf99b91754bc25c68d6d51cd4ff',0),(4565,1391293138,'0','7a98a136a2b5c87404070a1a4ce118e6be67107c',0),(4564,1391293130,'0','13590b627b4414023f369e440472d1e18f9caafc',0),(4563,1391293121,'0','92b8b937e355b554bbddf6c8c5222c092adb736f',0),(4562,1391293114,'0','e7444ea85341923134d031608c6aef6dc3c9582c',0),(4561,1391293106,'0','3b7d17d4a78b9e7103de6f3c5c92854ff743958e',0),(4560,1391293098,'0','6e3fb3798532c86206e01c25bdef8b7be7e8464e',0),(4559,1391293090,'0','24490eb3af60e7d6babf342eee62f04c936f8f61',0),(4558,1391293086,'3d5d660e851ca2b0b086cbe997888007997febab','8df34c6aca0d82c7c5e1b1ea6eaf6ffef1544bfe',0),(4557,1391293086,'3d5d660e851ca2b0b086cbe997888007997febab','ee25338c9629d49ffb10bbed6aa5b2ef8ba60a3b',0),(4556,1391293081,'0','bb9654c03dbfd286a870042a3189f1863e85d6ea',0),(4555,1391293073,'0','4493c87f0654e38ed509c7ec98e031b34d955f22',0),(4554,1391293065,'0','7a83d95ebbe5a133aa5349acd7410ab90d196c4a',0),(4553,1391293057,'0','3b5dc4029d00400a5bbd0b100a4bc9cf09af28ec',0),(4552,1391293050,'0','c0cbc0b71a2e9e0f05abd5c33153aaf8dea66f6d',0),(4551,1391293042,'0','e71cd32f838121ba7eb43d46a7b5c442d6bf59bd',0),(4550,1391293034,'0','89dea6b157d0fa5fa6d26ce1c8fb296050070766',0),(4548,1391293027,'3d5d660e851ca2b0b086cbe997888007997febab','605617974f97fb70712bd15b790aa9527aee27c9',0),(4549,1391293027,'3d5d660e851ca2b0b086cbe997888007997febab','7f2076f0adc8d7dc135ee7a3d52e1480009957bf',0),(4547,1391293025,'0','7ff5683b1903247df070d05ec4be8cd3ebf1919b',0),(4545,1391293008,'0','bbdd3328dc9b609e781074c0438f048b88a7f27e',0),(4546,1391293017,'0','9469901688dd44d6bff1efbab9d5b7243c3d3067',0),(4544,1391293000,'0','35e1e3915e438f7fb3451f9d632b521ec7a87003',0),(4542,1391292985,'0','59d5c4af215422cedb53efffb4abdd54ddcaf4d2',0),(4543,1391292993,'0','c77b13dd3be1e080b276bb4b05905e2d4d676903',0),(4541,1391292978,'0','ad6fe09a6ad9fea3ecc720337886faa62351375a',0),(4540,1391292971,'0','d0c65e46c57e8d1cc7574cf4d7e911f2b6b55780',0),(4539,1391292964,'0','800520b9b4b15575e6049623ccff972966d6d6e4',0),(4538,1391292956,'0','8db7100b98786ba1b72531b3811177be6f5d6dcd',0),(4536,1391292941,'0','15e7ea5f8b9878c885aa8cd371761bfadb6273de',0),(4537,1391292949,'0','901613cc27d8fc0692ca5839bcf60333dc76d13a',0),(4535,1391292934,'0','9a43b940519e5218e150901685099f651c568c76',0),(4533,1391292920,'0','f2f61cd5291929a40269803b2d8aa7b2989fd815',0),(4534,1391292927,'0','d19bbf8fd2ca9e81eefe554f14258da0bccc82d2',0),(4532,1391292913,'0','c49dd98d67af3dfb66ad2b6b7cf99287da74456c',0),(4530,1391292899,'0','eaf7d08819336454237e29eddd309e1d5399fcdf',0),(4531,1391292906,'0','3cfdd6d74739e8421f9165ad60f24022a5bdd394',0),(4529,1391292892,'0','48b7cdadc2b848d1b5f6781863cbf04e94555516',0),(4528,1391292884,'0','dfed5c7345545a131f57bbb87af29af9510045de',0),(4526,1391292867,'0','cc57fba619898a80fdeaaf6b6714c0dc51eb42ce',0),(4527,1391292875,'0','d966073d6e097378ebbbbdd40533630e51b05e6a',0),(4524,1391292851,'0','dc7dc81fce823e6d74721aa0a2ad7d9f9946e9a4',0),(4525,1391292859,'0','ee447bc5c014ecea8b1fee5920849e887036e662',0),(4523,1391292841,'0','94ef9276847ca7ce1081fb4e649f992713666335',0),(4522,1391292833,'0','986d9a60f42faf0410c578cb3d99ed6ced491e01',0),(4521,1391292826,'0','3260dd8f43ce1e0c5ac9496782c22d8647e82e7e',0),(4520,1391292819,'0','d73c9ba74a40cc9bacd08e1637266e8dd9f31bfb',0),(4519,1391292812,'0','28b664b2396f2968ec2cbcbe54b8c6747c81b40f',0),(4518,1391292806,'0','a1597cb8f25d42c1ddf657c9583642d055f2048d',0),(4517,1391292799,'0','865f9298e5dfda32a51f60be528e0ce05731b18b',0),(4516,1391292792,'0','82c38b8c44f057486d02a207cc4e7d00189edb91',0),(4515,1391292786,'0','1b11c4026cecb32a638ee5e267aecd044cd6ee89',0),(4514,1391292779,'0','6a44129a24797b4d15dbd122905f854e97afb8e9',0),(4513,1391292773,'0','c15640637e2eefa4d0435b26b45ac265b9392616',0),(4512,1391292766,'0','6694f1c4ec2ab23a495f1c51ac42691311ccd3e3',0),(4511,1391292760,'0','3aae41ac22b49c20e77b7770ed5c7603d9a916a9',0),(4510,1391292753,'0','ca7e1de3db00b9e3b99b25aa53e07c8563e6ac1f',0),(4509,1391292747,'0','4b70a9b45021ea3694f776c6a582d04463882f64',0),(4508,1391292740,'0','8a04b55b66786e94419289832c25e394f565a37f',0),(4507,1391292734,'0','2b14fc2cfc27dc664a4f79e7873cd4776e31d9ac',0),(4506,1391292728,'0','9125deb1f31f827937b24903283e053590365337',0),(4505,1391292722,'0','a75988ee8e68db044c08ababd63128f63bd08010',0),(4504,1391292716,'0','ab855844d90cd8f437eefbb073e6e12d446a3633',0),(4503,1391292710,'0','4e0fd63139a757951080ff4930fc87c60c08832d',0),(4502,1391292703,'0','e6244739b5d0bbb15041aba4c7956a8f4107a8c9',0),(4501,1391292697,'0','f0121aa6272b1f10a0a715be894c7d00cf992f10',0),(4500,1391292691,'0','f7ffb1ead6790f07466b5f0e8de229f56c1c4891',0),(4499,1391292685,'0','cbae0805468493b02b27a014fe85de36d64f975c',0),(4498,1391292679,'0','5020e7e644665da909f644f7718673df0d78ee9f',0),(4497,1391292673,'0','02ea19f7077ed520ec4c9a0a59b68afad6954a3a',0),(4496,1391292667,'0','72df1748a6c2ed198fbb99a694a3a46651b7eae7',0),(4495,1391292660,'0','f79166378725601fcf76dcec4e8f7121b950d3c8',0),(4494,1391292653,'0','261570f9f171bbf7e1f055d0c58a9d79986acbfe',0),(4493,1391292647,'0','b7bb01fe4341d8df0eb0a9b9f874809306e5002a',0),(4492,1391292641,'0','90934873c8b3f43bb9f799e47fe9fb1c9e970fc3',0),(4491,1391292635,'0','28515f8e1ea5724a14ae08432432c1786d132359',0),(4490,1391292630,'0','61bd33196c51436e3c066270abb6635c4fe3541a',0),(4489,1391292624,'0','6e1760e2ed0437394328759fbc9bbd0b621b115d',0),(4487,1391292611,'0','e57e62da4850ae8aece00b9cf944192553414fe8',0),(4488,1391292617,'0','63f0463610c96dbee41b9962719b32be76570516',0),(4486,1391292605,'0','da0f40c65c06402fce4b415b87aa3f83584e0c23',0),(4484,1391292594,'0','d4ffd7c8c1e6402c84f6c7cf700e16d322e0b7be',0),(4485,1391292600,'0','5dfca74c8584f435415f9f92fe87d94bf7ae25d1',0),(4483,1391292588,'0','259c79af44c3d835171f6863a05c19b35b4d2393',0),(4481,1391292576,'0','2ea98d66fc8dd252540d15375a137dc8a8217667',0),(4482,1391292582,'0','262e2e8b407971c3639e91406d9832cff82ff829',0),(4480,1391292568,'0','ddd21b005bb45da63b2499266db09b3fde9ee211',0),(4479,1391292561,'0','b53b09f627e781d84cbee9e45466416100939efd',0),(4478,1391292556,'0','59793d979db72fb23ed756786a0e47a65259501c',0),(4477,1391292550,'0','716835246c6cdc92fa735bba475793ad4b1f09b8',0),(4476,1391292545,'0','4a188de60b3b1b4ddd5be5678faad9335c77b810',0),(4474,1391292533,'0','1090fd2c0d2197e48d396f18038343c063d827a4',0),(4475,1391292539,'0','a54bb58619c9446874e086268e33008e7fee32a4',0),(4473,1391292527,'0','a512d896e29076727ca3e0d76c2c8b220eb88d24',0),(4471,1391292515,'0','62a546789284dd376a23c576f91a733f6c35f7ca',0),(4472,1391292521,'0','b7d6e27a45baf7d193eafc60d6c01fa6073e7670',0),(4470,1391292510,'0','fb512333109a5b71d156320f99fa7a466531aeb5',0),(4469,1391292504,'0','5e4cdb2c67455b6912d77855121e31a6b28d6d60',0),(4468,1391292498,'0','b7c97683405a1df3a916a0c60fe21e2af46c8866',0),(4467,1391292492,'0','994d25980b86c5d026b47ea135b854c342cd625f',0),(4466,1391292487,'0','e301a9d594ae9d92d87ad477af784f4119da64bf',0),(4465,1391292482,'0','9b3f5232b7f7a77aafeed51c2934c4da68a8c09c',0),(4464,1391292476,'0','d95a2520da7c4c1983ecae082ac12825b0c8b042',0),(4463,1391292471,'0','c8c5c350f8b2526f2ac148de06fde80217a8b0d3',0),(4462,1391292466,'0','b1c0e7f025f388ed24c094d86fa05b839d27d303',0),(4461,1391292461,'0','be4bca0d6ded8982ab30a7835d3c594a99596c6b',0),(4459,1391292451,'0','2e569727ec0add766fc20c825b3cc66a94d3501c',0),(4460,1391292456,'0','de3a94a33f7927dbae571dffce658856aa5976cc',0),(4458,1391292446,'0','73e37f5008e47f901b4014e356eedf074910474b',0),(4456,1391292435,'0','bb8b3eaf8f75d2826cf65a7add57d2a4735da6a6',0),(4457,1391292441,'0','49fc8c0bc0d8c74341dcbacf1823df46ed35f5f4',0),(4455,1391292431,'0','be61fcb5f0881b0dfa97f6f3ed98c721aa3b3fa9',0),(4454,1391292424,'0','3c1741b953711fc5f1c3da7490737646463252d7',0),(4452,1391292414,'0','a215eeef330d603103ddd445df08e9cb90763898',0),(4453,1391292419,'0','b5ef2bc25c19e1ca74f5dbfbc623912819736290',0),(4450,1391292404,'0','e4e9af2494de9576d3acdb5ed3f43137858ae39a',0),(4451,1391292409,'0','a0d640881a72a2c40dc7056483047b2307240010',0),(4449,1391292400,'0','9e800867359bf039f6fefd3ee5a963667a7b1d16',0),(4448,1391292395,'0','bdf0e5078ab762e8224d372cba5a27dd064c9ebd',0),(4447,1391292390,'0','2b63aa872933c2b23685f9bf8200c577fbbb43ac',0),(4446,1391292385,'0','cf4f241d84ed1ab1468dc98321f3fa7559a94f3c',0),(4445,1391292381,'0','4cc10c75bdab1a197728c1a33847e6fe1f4a3154',0),(4444,1391292376,'0','88fd022d1d7316a0a89de8d499537a2ff3d24c89',0),(4443,1391292371,'0','3cceb8c5236d8cb8327c89f42fd82cfc663c88c4',0),(4442,1391292366,'0','158e21a364c8afcdc3b0ef43cd56c7e8416ff8e3',0),(4441,1391292362,'0','ee47d18c2897942d4f75ab905d95308fe6a0dcd6',0),(4440,1391292357,'0','2f3cb40eefb4ae20d5c1522e8e78de800a4a35f7',0),(4439,1391292353,'0','ad845663a2bf39e15b4c442f04b6a36f3ca8f4a6',0),(4438,1391292348,'0','71b5d5f5c640bd4727cc5c224cbb0f162307dd5d',0),(4437,1391292344,'0','e35af1db04fbdb15e4b4e390fe2e523d2f7b4714',0),(4436,1391292339,'0','11ec56a99cf8e6ee46da70309a12ec5270a8a1f6',0),(4435,1391292334,'0','990eda0c2e8a3763b378ee28a35b958fe38aa3cb',0),(4434,1391292329,'0','af0bbc4fd52ba7d136f252e1260e5542e4017fe1',0),(4433,1391292324,'0','3a27d4f8408cf60ee9957d5042c13076a8678326',0),(4432,1391292319,'0','15307b86614b1a7921aac2fff7a439d1bc335fef',0),(4431,1391292315,'0','02a7caf90eab4434e6f803a2959873debf58c2e7',0),(4430,1391292310,'0','bdd54714614cb115c3b98b10218d9fc15e8bbf0b',0),(4429,1391292306,'0','59043b55cf04bdb148b0493336b2bcab70a9e4f1',0),(4428,1391292302,'0','4ac4dc153628a33f624707bae21b5a692920e376',0),(4427,1391292298,'0','baf2b31f2f6935d5add30382e01a269e12a96af7',0),(4426,1391292293,'0','6780bcb3b631f81fff37cbcc0a9db5414bff88df',0),(4425,1391292289,'0','5aee26ec0231a51707feb750f000ca7ddd755304',0),(4424,1391292285,'0','726aa0f2457ec370537d55ee597d021cb92eb4ca',0),(4423,1391292281,'0','73b380a536a5e3a90aef21ec1c6f2fb8b1583652',0),(4422,1391292277,'0','0fa021cbb3dbc37ef1bc16e5e1e9f5299dfed9f1',0),(4421,1391292273,'0','41c8f8acf246e2ca5d911950bef14a0dc94c3319',0),(4420,1391292268,'0','7a10ebe9d1b327b0b7ff4ad9ef37c639d9410774',0),(4419,1391292265,'0','a75d7dab999a5a3ca13a8e3de518b4356089d49f',0),(4418,1391292260,'0','30655fe0932bd0fd0929a0a2fc21c20186f1c46e',0),(4417,1391292256,'0','e708785c898244768b627b2b6023d876e93dd2ec',0),(4416,1391292252,'0','40478ed59d7160014a7d7492f9a8f362ed445241',0),(4415,1391292248,'0','6bb5103175ef5d703e816fba3580ff8cb1d47aff',0),(4414,1391292244,'0','cec89bdbd3e5d3758d0c86696059dfadb8ccedbc',0),(4413,1391292240,'0','7063b8038b1dc513fcc6265d9df543bc742cd0f1',0),(4412,1391292236,'0','1311fbde6ba4efeab6e91e3006a0887b25a6e6f9',0),(4411,1391292233,'0','b9672a464c8b8e0f21ff6ba6df91a7bc77edc431',0),(4410,1391292229,'0','cc65ea14eb93ae968eb8a964b492c924cbdb7c82',0),(4409,1391292225,'0','1caac11e1f1e1c182c6c0fa1ef9519f74e74fe1b',0),(4408,1391292221,'0','778c2e77d3a2c087748583a819767ec812443ea0',0),(4407,1391292217,'0','65612d88400e42cf9ca06f52b25c8fa52e82801c',0),(4406,1391292213,'0','470555421a4c4a5187918781936967cde265eec2',0),(4405,1391292209,'0','24028a714c2df66c9d4fe039bb3fe420a1f84fa6',0),(4404,1391292206,'0','d1cec0c5c49ab4522a137961f01b2d149231c693',0),(4403,1391292202,'0','e0bed27d3e0259378ba0ed4a50b8fa6812d846c2',0),(4402,1391292198,'0','f46e036afe4a686aac5015bcbd48938a0cd623b1',0),(4401,1391292195,'0','bf2e11a3b8e2c5cd330220c4b47302b2a518296d',0),(4400,1391292191,'0','bcb3c617d8a31ec73d9fd4f30078a06c231f4322',0),(4399,1391292187,'0','2e04e8407807ae826f2fe60d656468f2083b9583',0),(4398,1391292183,'0','046d12cc100856c6ae0f252d6c89f5396c4d5c32',0),(4397,1391292180,'0','c3c17993d114437492b4ab70ac48c2971683c5a8',0),(4396,1391292176,'0','9abe8e62f2c6b9abadbf8f8a149da2229768dc86',0),(4395,1391292173,'0','b48d83b9ff6a3026491061700af474125090fdab',0),(4394,1391292169,'0','1e6972408b1be31a29e529d6a64b5369c3f0373f',0),(4393,1391292166,'0','f4f99314d82e812bc762dd3bea7b0f412bcd20d4',0),(4392,1391292162,'0','32e254ad269e3968a156fe6e712d84747236f4dc',0),(4391,1391292159,'0','e9d3954c457ef644ec5ba0b94ca1f3ac49f70a8e',0),(4390,1391292156,'0','4114c2d63732b9ea4fd485b31fc4494e044526db',0),(4389,1391292152,'0','ffd087c27f8e846cf50eb4b2418d47a242f08eae',0),(4388,1391292149,'0','e8122f8b591601dce1b6445771af2b09f44646ee',0),(4387,1391292145,'0','6383b787b392e8179133cad6f36054893b159fd2',0),(4386,1391292142,'0','0af63584e429e09e763e109773b5b5661039ddb4',0),(4385,1391292139,'0','a144849951c946fdf25d11a84560c337efa66076',0),(4384,1391292135,'0','f6c422b3901a588c7a40be170584a7755bb3cb85',0),(4383,1391292132,'0','7010a39bf725a95ebfa1c455eabc3f19a0ed87e8',0),(4382,1391292128,'0','af121583d5aecfb8aa8c8528e90bad24beb06d5e',0),(4381,1391292125,'0','67bebdd0686fe9e913a15fa346e84b7b9845c9fd',0),(4380,1391292122,'0','7afb7a4d8e086e3c0b87c3d10d460393f459fa91',0),(4379,1391292118,'0','95cda518eab2c89afe383dd416189393f773fb2a',0),(4378,1391292115,'0','2ab5f6b04e9693786d4299cfa628f0bda0b727f0',0),(4377,1391292112,'0','928c315ffb2b82bd61c6630dcb7bdd66f67d35a4',0),(4376,1391292109,'0','140a9584109fd31d3d973aaf67a9e186191c4bb2',0),(4375,1391292106,'0','1292999f0b3e7de9c8268a5dd459d7defc4ec88d',0),(4374,1391292102,'0','19cb4f94dfbae10575e2c753b9021c6f050094a1',0),(4373,1391292099,'0','5e55a07fa02011cdd544a0cb5685935e921cc422',0),(4372,1391292096,'0','3debc0d7803d71b69d5421fda78ccd3e8613da5d',0),(4371,1391292093,'0','ded3d288c5a2161e7e9d49c22f07cda2afbe74e8',0),(4370,1391292090,'0','d1829f79bbe4924308ab9d4dfb5ffbc9f9808283',0),(4369,1391292087,'0','8ee1e20144ce024740e3c12951c6b87ef74201f9',0),(4368,1391292083,'0','cb51f0b1f67c509a2a6f93d6818e85a6c54a9dcd',0),(4367,1391292080,'0','e59059c3f004029a45e431233485c21fe6f2584c',0),(4366,1391292077,'0','f519b8c0f3e6d58ebfc11e356c0214e13fffb568',0),(4365,1391292074,'0','7ba71876560d24095e18a32b9d704dc1f16501e6',0),(4364,1391292071,'0','d441cb1235f8ce4c453cd820c649daa08a1f7f96',0),(4363,1391292068,'0','38bde38c49ff911429ed6dc1361f57f3892a7f4d',0),(4362,1391292065,'0','3af8677b5a8db03d861b386afd4fdb73cb0d13f0',0),(4361,1391292062,'0','19ceb88cc566333d09226bce94f9274e2e32b8b5',0),(4360,1391292060,'0','62113330bf649abf5b01defeb001ae5b571e6dfa',0),(4359,1391292057,'0','48c3d2be6b295ffa0b9c876c9625311748903ecd',0),(4358,1391292054,'0','45997e652dac29bb68870f9e6bf708c7ceb09804',0),(4357,1391292051,'0','2ce81f379a87e7b2433a93419ab971bc3d384bf9',0),(4356,1391292048,'0','e45b50f215ea3efd28c9c8e9ba16503a166386ee',0),(4355,1391292045,'0','4dad7106ec606d10eb6ca5e854d9748c53a0f1bb',0),(4354,1391292042,'0','2949dab8422aa1bef589787da1fa63dd7e8a19ea',0),(4352,1391292036,'0','5e57bd9c4cec6e19d4758dfa1a719737851bb2dc',0),(4353,1391292039,'0','37dfcec44396b80cdcb1049627da2e1e663f2a37',0),(4351,1391292034,'0','5315909a08cbea1e1d5cad5aed765e95815187dd',0),(4350,1391292031,'0','71a93a9d58f7c32cc15f8cf0062bc99fd17b6ba6',0),(4349,1391292028,'0','066dae7ae4915d819a04716138044ac518d1a9a2',0),(4348,1391292026,'0','d66f4445c8c168f3e5a0d9348bc819af6e9056fe',0),(4347,1391292023,'0','f385b70514c93217b9cd948115da2e5e705675a6',0),(4346,1391292020,'0','3551cd498a93413e6bcdd25e47e38eb7a2276cbe',0),(4345,1391292017,'0','2b33cf7c1c7f49a1a266b1f5146e167930dca7f3',0),(4344,1391292015,'0','00107fbb7c2db3d54bd970432c444dfa03bdd430',0),(4343,1391292012,'0','ab08c3c6049e9796ceaf0066381e2527e86f6763',0),(4342,1391292009,'0','d8323eb6adbc595bb6c32c9c88ab08d67568bb93',0),(4341,1391292006,'0','11d3aa62be1cc9663287d815cfcd938691ef79ec',0),(4340,1391292003,'0','126eebaa73fbbb229b539d8fbb97655a82efae0c',0),(4339,1391292000,'0','5d0ac9a3df02ab455a1feb579e43ed9aed96c404',0),(4338,1391291998,'0','71d80c4b3970f0e5b6c9fdbb43f9a96d60d76fa2',0),(4337,1391291995,'0','1ea969825ee9087d36f50231ad46531087d52a16',0),(4336,1391291993,'0','f7e47f4e268c899f6a6a63a0649f0664c9052b52',0),(4335,1391291991,'0','f6394f165e9fcbb07e458d1c7ce3497579166eab',0),(4334,1391291988,'0','43bf997fd4568fd1da697fbb0ed0ee6c45c961f8',0),(4333,1391291986,'0','3ae44bee944289d5656f1ad3ebf57edebaab8ad3',0),(4332,1391291983,'0','61560805fc121922439329716495d4fd71b14022',0),(4331,1391291981,'0','3f256aa635931e930497d37cdb0b6dd7bbf4a65d',0),(4330,1391291978,'0','d5b0d56a2accbbf8501946fb515a569496227c35',0),(4329,1391291975,'0','f031a45a880484868164aeb1f5eadd8e45508d37',0),(4328,1391291973,'0','c3984efb11b10bfc8dcb40b91bcd64638aa4835f',0),(4327,1391291970,'0','184b3cb53640704340dc0567d53bf44d8dd06bd5',0),(4326,1391291968,'0','1cbe72533780bc09c8b5dc6b4396ffa638367941',0),(4324,1391291963,'0','bc691dc72343e114989e1faa203b25f84273cf95',0),(4325,1391291966,'0','a24514813290587bfc494da5de11130b041437ce',0),(4323,1391291961,'0','2e06b6223554fadaeedc7594a51b6f406e4b3596',0),(4322,1391291959,'0','9691c5d3ef4bac009a7e9c4f27b084fc09c6582a',0),(4320,1391291954,'0','1513ceb893bfc0ea9b5d215bc3f7aaa867b72738',0),(4321,1391291957,'0','72824f1afbf1cd15644fb807de441d893ce0bb4b',0),(4319,1391291952,'0','bb089ba7caf108632487653b7b5f5516bd55b126',0),(4318,1391291950,'0','75325a59453277b5eaa22dcf0d7c9723e5c208b0',0),(4317,1391291948,'0','33a0f38c19ce53782c4cfa6bb4d8a0daaa671d29',0),(4316,1391291946,'0','334dfdb902e92aaf5a26b43c215218d597a54aa7',0),(4315,1391291943,'0','3bcd8fa8f13f1b3e285e377d63b70190f658f309',0),(4314,1391291941,'0','37172d55ca1a3ae2598bc51bcf3b922d35426ab1',0),(4313,1391291938,'0','ed73d8dc1ee230cb1703d634a8f5dd28216cc2bc',0),(4312,1391291936,'0','0acc435781aab40fbbeba350b0f8935f99ffd887',0),(4311,1391291934,'0','ff862b7625cfcf09c749a4528234b658a766f141',0),(4310,1391291932,'0','73924319b0c0bf9946a906f47596cc61d95c0bbc',0),(4309,1391291930,'0','2f076fc4251f21c681f8da13aa3ada19cf8509b6',0),(4308,1391291928,'0','2a812b63d8fdde6c5a66bcd106c840e34a14e520',0),(4307,1391291926,'0','a8f5d48a47ef5dfd3468084897ab5cc48673e816',0),(4306,1391291924,'0','15db4dd41836098272258c75946ad9ab9bbeb65f',0),(4305,1391291921,'0','abe212cbdec23496375e7e7d4fbb4f4c3b4609cb',0),(4304,1391291919,'0','492aef193dd38401b5743ee30ed8775d9de31de0',0),(4303,1391291917,'0','e1d6ad11ff7b1466bd91d66bde91fdca2646651e',0),(4302,1391291915,'0','34449348949f5c65f5363f40526cc942209802c7',0),(4301,1391291913,'0','8529dd0216be7be8a94cea01f1ecf85597e9d99d',0),(4300,1391291911,'0','2d4676c572abb523c129831bf23a99507b6cd06a',0),(4299,1391291910,'0','9d3d41492ef0417c83e0f5313889416600dee383',0),(4298,1391291908,'0','ed6d6289b1b2599da9811d852b96ef8b740a31a6',0),(4297,1391291906,'0','ccc2391e4eeb5c0b89c2682d637b77a771f803bf',0),(4296,1391291904,'0','91fd503a8392d9e244facc990c9332225489b3d4',0),(4295,1391291902,'0','0293931a1e8e94f6c40629f94534b92f98b62c2d',0),(4294,1391291900,'0','ea0c38fa160a9cc5812cf7c3d6cdc50cb330aa06',0),(4293,1391291898,'0','de1cbb4215e1dfc499311b723fe6f4311cddac65',0),(4292,1391291896,'0','7c3e51bc466a64bc195dd5028b4a74b7dbb00166',0),(4291,1391291894,'0','a46d8464c68192a1259cad35f137b7c865a123de',0),(4290,1391291892,'0','388e1a48310c504ceca548ad222235081ec56ceb',0),(4289,1391291891,'3d5d660e851ca2b0b086cbe997888007997febab','5453e365aeb34e5d31d1f3eefeb5cca61278572e',0),(4288,1391291891,'3d5d660e851ca2b0b086cbe997888007997febab','37a8540435a50cef8d6bd856ec29fdae83d607c0',0),(4287,1391291890,'0','11debd426faf74094421361f01efc85aa0f5100e',0),(4286,1391291887,'0','0a0d4fb9687090285a6f8fc8787a745fd0bd81de',0),(4285,1391291884,'0','02a4ba1ed73ab5d63d44b11f9f4fec87cee488dd',0),(4284,1391291882,'0','fd44c338af9b7bcbe6d2d42bf7a6ece7c5ae7ebe',0),(4283,1391291881,'0','d9a70ab41d3266edfe39f1a8e5e3d0712e9ca1b6',0),(4282,1391291879,'0','009363301bd5d13c9bfc5a5d0af70b7c98226617',0),(4281,1391291877,'0','c828d81646b13011c22edb817b7ca0d8b18ae2b4',0),(4280,1391291875,'0','b001823e999dff9f9e5386b1860e1fbb93118cd8',0),(4279,1391291873,'0','83de34613cb5549bcea3046ecaba6cca7f839b82',0),(4278,1391291871,'0','b5799a338dcbfa44df5041c6a8922be7c0ad35f5',0),(4277,1391291870,'0','571fdc36adc2d3d89b04302d1413bab51b678b9d',0),(4276,1391291868,'0','0b97bed5162be62ee7ecf064c880b1a386696573',0),(4275,1391291867,'0','e9234fb1a0cc170efc9b3c670fe392e1e1da9830',0),(4274,1391291865,'0','f67393a8419d87b491603407d15cda52239baf53',0),(4273,1391291863,'0','15ceae82bf6e50cf87420653502c9b7cf31ef9fd',0),(4272,1391291862,'0','791ea83e9fc110dbe942f905ecb9f2996e1d46a9',0),(4271,1391291861,'0','3d6a30edb0df304ec1af8a2349812abb0678b35f',0),(4270,1391291859,'0','e2560610ce10b4c15caa4fb0b787361d32bf5cf0',0),(4269,1391291858,'0','ea82630851919fbad9d951c9f2420909796a05ce',0),(4268,1391291856,'0','1a9cece5fd4b3bb31801736f5970f67677895569',0),(4267,1391291855,'0','0897c0a7114c401765d6374237e60798f42c0453',0),(4266,1391291853,'0','18b14fbad6dd81fa40a0fcbfb59010d5e35b2d7e',0),(4265,1391291852,'0','574888e1e192ba805b43a32daaac7fa8bd4cf6f5',0),(4264,1391291850,'0','5964c3d4889ce23d5a8d057aa30369db35ad1584',0),(4263,1391291849,'0','00e91da97d672e51945c2216523fb7b2b76c84af',0),(4262,1391291847,'0','065c57a062c84048cbc1a58fa63ded4cbb2c0be7',0),(4261,1391291846,'0','5a98f003db941073c0b552d34577bb03f934b5f6',0),(4260,1391291844,'0','0e2eac89f62b14e2613fad1ae7fbdd7cbb8df475',0),(4259,1391291843,'0','de445eca249938e98641221bef73ef7a240d8b46',0),(4258,1391291842,'0','92b224743945292ce206b711fe111136437d1e99',0),(4257,1391291840,'0','1c82565b1cb4ca1a0ba304d30a931e3e34f939ad',0),(4256,1391291839,'0','5f78ec4b268acb8b39b4a22c8600a61ebca4899b',0),(4255,1391291838,'0','dae0a0b166eb59c79ec1043e1049b0d1aea0d0d7',0),(4254,1391291836,'0','aa0bb04094c0a5b4411b5abe91e76ffbf3bfa8e6',0),(4253,1391291835,'0','ae87e4d753dc2d183a316c293ffde5484974d0a8',0),(4252,1391291833,'0','c9f7ab29f6a2516e150ed26d359c9f528ab37ebb',0),(4251,1391291832,'0','09c4725cae06bac869715665770df8dde135bd67',0),(4250,1391291831,'0','cbef2c68aac9cc3f4747ec8ee9643c37a036b709',0),(4249,1391291829,'0','a32f42a33e32630693c24d9e485a748ff74f3089',0),(4248,1391291828,'0','cd49e50eca07c52a36b0180c0ed060fe74d63259',0),(4247,1391291827,'0','9106430e2dc73d85eed3686c98e05ad6b0faafe6',0),(4246,1391291826,'0','a412e52c6286904c7b4f9c75849de54f4a5006cb',0),(4245,1391291825,'0','b9984b39e04078ca64bf5d3ac8624c4a08b2154a',0),(4244,1391291823,'0','0ba48bfdc72dc87ebb5963bf59eb54b94f89aa88',0),(4243,1391291822,'0','8e9d6f434a169902410ce4aeba731a2184d1d25f',0),(4242,1391291821,'0','cdb6fd246b68f86416d9f272485edbb3e8bca912',0),(4241,1391291820,'0','886c41173e8a662b0634f15f9b917bd63f247865',0),(4240,1391291819,'0','e2b9ecc4d2e9d8d935c31828906b712465aff500',0),(4239,1391291817,'0','6c9ffbbc06f9855212084366cb2a11e2e0e203f7',0),(4238,1391291816,'0','96cb088cc0fd25c9fc9cc1573a5089e11c6ab5dc',0),(4237,1391291815,'0','bcff1400a66c740f235c1f71df62cfcd1a32c4ec',0),(4236,1391291814,'0','355f0a94b0bee38dc1890f8fe68f2a6dd2c7fe20',0),(4235,1391291813,'0','38aaab83de0b99d6b43cbe6e7ae0ca50781f0d9d',0),(4234,1391291811,'0','3bd90cb0ce8697eef45abd9af58093a867e39984',0),(4233,1391291810,'0','3a98db14723a866d28d2d7245f02d8a91cc33440',0),(4232,1391291809,'0','eae31967ba888fd3faea19c1a895e8793f30d4b6',0),(4231,1391291808,'0','21ede27849a73a85f4bf208f6df744974e106cc6',0),(4230,1391291807,'0','bd9683c96943091630d0627901b8c34b655cefc2',0),(4229,1391291806,'0','d03f4a0f8bb0d6ce42606692078a13a1aba65cef',0),(4228,1391291805,'0','ce3002da53d9d3359141a7adb773d812bd57ebe7',0),(4227,1391291803,'0','4b0f1f381b4062ce24c790d1c2e2ddd896d719cb',0),(4226,1391291802,'0','eab9ca7f634556ddcaed1cf4a824089930890a93',0),(4225,1391291801,'0','c68177269e27051162602b1f546b443b80ef3a56',0),(4224,1391291800,'0','b151a941b5d70b69d1c523e5691710cb6882aed3',0),(4223,1391291799,'0','2942ed1e1105df2a06adb21681a813f9882d4d3d',0),(4222,1391291798,'0','f0e4c9b447a5a1de8ffc65172e2f4b161a73ec0a',0),(4221,1391291797,'0','a341c19d5d40885ddeda659583a6624b156d0bc4',0),(4220,1391291796,'0','a49361c42f594bcd058b13fd94bfc49cfa667c5d',0),(4219,1391291795,'0','a911eaf458518150dddf2180171646f2c25cd4b7',0),(4218,1391291794,'0','b7deb1fb01d7fb2eb12ce27136bc6d39bb5000ae',0),(4217,1391291793,'0','5274ce2d8f53e3caf903667c49b8654e65843dce',0),(4216,1391291792,'0','c6b27a2799ca7b619f35e26c1d2e9a9f38394a96',0),(4215,1391291791,'0','80b70307ae7f8db684e222e0d64a44748244b08b',0),(4214,1391291790,'0','ab41026aa900dd6c0ef55728c38631177c202095',0),(4213,1391291789,'0','c3d7873363e0793b34093c23c6a95eb3cad539b4',0),(4212,1391291788,'0','e1cfcf2308a462fefc75ef28756492b0a7891a21',0),(4211,1391291787,'0','01b96d8b30165564493ef9ac600a3e9563c72db4',0),(4210,1391291786,'0','bbd6ee078ebc00034a8cad68f9070486cc6adb47',0),(4209,1391291785,'0','6bc5e5a87817177d4e87d8037a211018c3cd67ac',0),(4208,1391291784,'0','710a4bfe01d75fe0c0a38ec70a5c08f38ae72980',0),(4207,1391291783,'0','c232292562f210c5500a2aee83cc20c2a462e020',0),(4206,1391291782,'0','a7329ac83b22f9d75e381d7adb68411a05742a65',0),(4205,1391291781,'0','8c0dc4b7770e9b23bb478a58eb35f7304b76a79f',0),(4204,1391291780,'0','e86a3dc497307a1dbcfdaa02db49f78ad4da67e3',0),(4203,1391291779,'0','e7fd641b1c0b70458637dc97f8ebd028ff76b06e',0),(4202,1391291778,'0','59399e79208faf52547f8f84d0a60c40cb72e20b',0),(4201,1391291777,'0','e191cd5c4d2b935538893efb5edea7968660e651',0),(4200,1391291776,'0','85c131be521f1294795fba1c74487541aba5cf1a',0),(4199,1391291775,'0','8c32eb9e8dce0228e20a2788a78e169dff076e0c',0),(4198,1391291775,'0','f6fc41367b0c23bd9868c871a9ce1bb77c9a345f',0),(4197,1391291774,'0','8296abbf81082e7f71141b43f015708225f866f1',0),(4196,1391291773,'0','1656f6d29aad168400e692282a2acfa625d88279',0),(4195,1391291772,'0','7224593e1d5c3b994dfa41e078dec88c01b6ba79',0),(4194,1391291772,'0','a13bfe95b635e9e780b17cc3492ff44d912c0a39',0),(4193,1391291771,'0','d19df3609538e67c20947840e391aed3bc5e8c27',0),(4192,1391291770,'0','878b16043877d6bcdca586f3ba235daf644ec55c',0),(4191,1391291769,'0','4a878ec92c45b47c5e1f0bc86ac54ff48f1a16da',0),(4190,1391291768,'0','a5ab4b43dff6bcf4418e9aab0e315e415283ce3c',0),(4189,1391291767,'0','331379cb1022494f495c2b95a8c17a196451e3b9',0),(4188,1391291766,'0','bf5d518dbc30c2e70d03293619413a2621a7d2de',0),(4187,1391291765,'0','f627fb8085c3cf801a47542d9e932fc77ea40196',0),(4186,1391291765,'0','f430114efdb667b7a93b77669db27211820e6287',0),(4185,1391291764,'0','cdd8fb478e9ac7bd24f59451f84e3be47128e8b2',0),(4183,1391291762,'0','04c8dd7a84691eb0edb6abac438e723b6642fc2b',0),(4184,1391291763,'0','36ac9e94e42b5caebafc8c9800e8ea76f61c4239',0),(4182,1391291762,'0','f875204b8233a21c2e13ef074580642601dd79e5',0),(4181,1391291761,'0','98289c72a3e8d69dbcd72e1faea5c92de3e5a8cc',0),(4179,1391291759,'0','ed0d5534a93addaca98951e3436764b317e03154',0),(4180,1391291760,'0','63a9c5f296f8919bc20e22843919bef0f452155b',0),(4178,1391291759,'0','784d5a55ffebfca7b4b0f8c99163aeda50d88393',0),(4177,1391291758,'0','9a6e1f9b9ea0290b368c75bc162f8b9c2567310f',0),(4176,1391291757,'0','3c1f46d1d05bfcac5afd15118e959b25842d7dbe',0),(4175,1391291757,'3d5d660e851ca2b0b086cbe997888007997febab','1d8d1620049136d4f6724e515cc0517c301eb0c1',0),(4174,1391291757,'3d5d660e851ca2b0b086cbe997888007997febab','2065de28a18ed62bad25d9c371230158036ac9a3',0),(4173,1391291756,'0','14ac77c750070e9e9288519cd6aba3252e356707',0),(4172,1391291756,'0','a98b9d101939ddd586147a9b6cf4e0f3426bfeaf',0),(4171,1391291755,'0','3bb7b5e16cbfbf7cfa07b6051928cca559816ae1',0),(4170,1391291755,'3d5d660e851ca2b0b086cbe997888007997febab','c88e11016f90c923e5edbb96d281f99ee16c0f9e',0),(4169,1391291755,'3d5d660e851ca2b0b086cbe997888007997febab','e2b14c2a6f13dfad708b4e959fab74df78f42b70',0),(4168,1391291754,'0','fbd8bd41ee08a07769441f05ef17ddd026a2b28b',0),(4167,1391291753,'3d5d660e851ca2b0b086cbe997888007997febab','1ba2b5349b8c4014f946d3b6683b54d5470add58',0),(4166,1391291753,'0','ab17f40c0a0fa38bb570586faae17965981a9f90',0),(4165,1391291753,'0','7a009f5b2d6ed76ae0c3f43f3194ed01a662e728',0),(4164,1391291752,'0','a766e72cb02719e0f6b2f898c58416678cc27a98',0),(4162,1391291751,'0','0e391ccc5b1b8952ff7ba07e0ed666c8844145b9',0),(4163,1391291751,'0','a740b9e4e3c4c3da415663c43309703b70dc3c6b',0),(4161,1391291750,'0','658ee4a9350f7f646f73271dcd814c04cc03e15e',0),(4160,1391291750,'0','da1efe0ff8e26e88c04a799debb0481087b36f65',0),(4159,1391291749,'0','2b3a26d41411becfb67c6fbfc782460ee49f9531',0),(4157,1391291748,'0','5bea384e9e9bcc4f936b7eec968663a2f9429d6a',0),(4158,1391291748,'0','6503293f5556deaf2fbcf0ae896d40a98ed55f0f',0),(4156,1391291748,'3d5d660e851ca2b0b086cbe997888007997febab','604174589877629f0b6ff3f3a7284f8491005e8b',0),(4155,1391291748,'3d5d660e851ca2b0b086cbe997888007997febab','f32b5125edbe37a795bd264ecb8eb8098ad8e31f',0),(4154,1391291747,'0','9bcd2add2cacb3a80358721b94e7ba0904099968',0),(4153,1391291746,'0','c4462b76e70652ad1db35d8d4689b37301e69da8',0),(4152,1391291746,'0','49d253c5e6a72742f4ee12940b6a57cc4b62c44c',0),(4151,1391291745,'0','d65ccdc9d31cfb9beb52327dcb12de0f687fb340',0),(4150,1391291744,'0','088292a165f349c57b6320cbe31c4e6c725f7117',0),(4149,1391291744,'0','5ef39187217e1fed40d170bcc3c9194b6b008c97',0),(4148,1391291743,'0','4552f925c1851b53772796f05707860744613d9a',0),(4147,1391291743,'0','b80783e92ab5fcf948bc6be7717398b643454b80',0),(4146,1391291742,'0','27957c58238bb5d121ab1b22f7eb15dada06fbf3',0),(4145,1391291742,'0','2591828c2b064a9511be073d81db952a517ab000',0),(4144,1391291742,'0','63459bc91ec2e469c8b5207368b25068271670c2',0),(4143,1391291741,'0','c2032f7b7df6d511108e52ddd150eacd0bb64f4f',0),(4142,1391291741,'0','0f294a24717a4f43e1355fd01d75ce550226224a',0),(4141,1391291740,'0','50c5e278e735dc10f3f7c88813021df293346b4a',0),(4140,1391291740,'0','a9296c8ac8f9836c34f35d5c6b25be8d3f4f5e1d',0),(4139,1391291740,'0','2c9cdeedec50b16f33662f61e0693676a0e0a5f2',0),(4138,1391291739,'0','2a83375f1d897785c0dd12059bd3be58c3b17938',0),(4137,1391291739,'0','847887316d75ba3f10fc7c807812ab25c410edd7',0),(4136,1391291738,'0','b2d6ee3ac99f2c4c7105df44da96f7e422fe75b7',0),(4135,1391291738,'0','e50058a1fe8c19864c7cc1157dbca842847b838b',0),(4134,1391291738,'0','fa7e2b47274128b725ef3122bdab0bdd4db6f75b',0),(4133,1391291737,'0','15baa9b4212a52bc0e1f70637894fe1ee350360a',0),(4132,1391291737,'0','ff7d167c432f7b964f6f56b87838eac0b34fad4a',0),(4131,1391291737,'0','b79b2269b6896e09a64ba4fee44d00d520c9eb7f',0),(4129,1391291736,'0','447df7b83ca6af56c37c40c6c6c6358308bce7d3',0),(4130,1391291736,'0','1c5537a9abfdc81350a06d5e97fc618803e9b3e5',0),(4128,1391291736,'0','d7ecdf9a86018cec36e18f0913e51ac672779e56',0),(4127,1391291735,'0','adcd6fa3314d599dde5cd40c061473d073471ca5',0),(4126,1391291735,'0','4f40382301713c3a7578582e6b386bfd6f526602',0),(4125,1391291735,'0','92954ff58215d00cdfc77e7d4b031163604daa23',0),(4124,1391291734,'0','0f02253b48b4042a940681b715fca023e5847359',0),(4123,1391291734,'0','f0cca853de526e3b8183e797908c7d25f99e6c20',0),(4122,1391291734,'0','4baaf2c936e7d6b9ffbe2dcebf7aefc1a34b3f30',0),(4121,1391291733,'0','d6d30f98a96deb4c72b4a60397fd85cd35930600',0),(4120,1391291733,'0','a494333423599b85e11ee3d0dec5329fde9c0ef1',0),(4119,1391291733,'0','cf886fa51bdddc499657b225821e880005fa9b73',0),(4118,1391291732,'0','e128bcc9dd5688f23abcf8f82a8e4adde27f4bdb',0),(4117,1391291732,'0','c962ccf76448856ca25a85732f5a6029d096126e',0),(4116,1391291732,'0','36ba2b99d392d57ee0dbd0d866e0d845e5d68fea',0),(4115,1391291732,'0','06912a03e653fa8b3ae0476cb989872b27c10254',0),(4114,1391291731,'0','eab4d8272403d4ce5fa77a1a806aa7ef33fec9ee',0),(4113,1391291731,'0','8877d9d65f5f5fbe0630a248e2cc0a7601853100',0),(4112,1391291731,'0','8d03bd242986c83c947cc84daca7d629a5c40848',0),(4111,1391291730,'0','01742d3efe7edf9ee8ca825d004bda6813f222e7',0),(4110,1391291730,'0','4ebb8cce0a35aab93903a9a241df7921d6f0ac30',0),(4109,1391291730,'0','22ca185078a682f19e2b9509bfa3bd8f24bec280',0),(4108,1391291730,'0','dc5559999bb27701390ed469ab71a07aa4436e9d',0),(4107,1391291730,'0','b3571feb30a0b685ab953955e43f2d4aa7f55196',0),(4106,1391291730,'0','2d85d53defd6efd49a9db65bb1dbc2866c8cca84',0),(4105,1391291729,'0','48772bfe8756864095f49ae844451886234e50bf',0),(4104,1391291729,'0','b4b6febf59a98b80dee31e53505c7908df2690d8',0),(4103,1391291725,'0','0fff6df9d36f1cd8a035bdc06018a5684a0dd69b',0),(4102,1391291725,'0','72a2d3db2fc74f8331769aeaa81032b8cb365079',0),(4101,1391291725,'0','168e8bee890e73affe68f8864778a2c52e5a982a',0),(4100,1391291495,'3d5d660e851ca2b0b086cbe997888007997febab','dc728383e4b672f3b94118948038a3a0a4f5458c',0),(4099,1391291495,'3d5d660e851ca2b0b086cbe997888007997febab','b58735797fddc485524a8f4e231e41356e004245',0),(4098,1391291491,'3d5d660e851ca2b0b086cbe997888007997febab','b7777481bde0accc40d04c8f0a50db1a8868502c',0),(4097,1391291491,'3d5d660e851ca2b0b086cbe997888007997febab','5a4f1e4325d87f2e7f2513c2bc7fb4c9fd036239',0),(4096,1391291485,'3d5d660e851ca2b0b086cbe997888007997febab','d67ab2f6c5f3cd8f852db267b3fb1fdd0ce61699',0),(4095,1391291485,'3d5d660e851ca2b0b086cbe997888007997febab','5cb2b4face59c8e42769b267b46c297c609170b8',0),(4094,1391291473,'3d5d660e851ca2b0b086cbe997888007997febab','a315d3e661f5073bcb1a5163956540c006c97749',0),(4093,1391291473,'3d5d660e851ca2b0b086cbe997888007997febab','b46b20da6c2c9987565ab1157d75869ed421f9d9',0),(4092,1391291461,'3d5d660e851ca2b0b086cbe997888007997febab','5b2494a42901778a8c2df7358000fb703145db27',0),(4091,1391291461,'3d5d660e851ca2b0b086cbe997888007997febab','cde6db43a657026f606fe5b4d37a4361ca41c370',0),(4090,1391291438,'3d5d660e851ca2b0b086cbe997888007997febab','c8da4e89738eba1da6d1d3a21f48607f1c6948fb',0),(4089,1391291438,'3d5d660e851ca2b0b086cbe997888007997febab','e0c4b5fe584eda7312484a4e1c5194ef76dd07be',0),(4088,1391291427,'3d5d660e851ca2b0b086cbe997888007997febab','2837e697fec4f9abe9f0bd8026db2bd4b6c347c0',0),(4087,1391291427,'3d5d660e851ca2b0b086cbe997888007997febab','fe88a611d61441c985ee5c211a24252de13c6d04',0),(4086,1391291426,'3d5d660e851ca2b0b086cbe997888007997febab','ce80c170a55255b3e95e719aa91e9483a7775af1',0),(4085,1391290857,'0','286a4fe723650230619db6cc373e5615329bffd9',0),(4084,1391290856,'0','0975efa7d83f94590fbd34414065bc7c73a7d8d5',0),(4083,1391290856,'0','d89fedf8d68a4030fc1610add7cd0d9fc45bd00a',0),(4082,1391290855,'0','cdd547d396c78d6f7a1b25a24d8728b83029e3bc',0),(4081,1391289287,'0','ddd2ed830959c1185d3c3736643ce62004d407ed',0),(4080,1391289286,'0','c698dcc4ee1e68a9ade1db1796bdfc9df5780c77',0),(4079,1391289286,'0','dea9963978f5bcddc7a5235502bf7a12b82a3ba7',0),(4078,1391289286,'0','e1e5ac14d84eb498b01a82c769692a3ad62f1444',0),(4077,1391289276,'0','7ed9955003bc37259484fe70eedaa6a716baccbe',0),(4076,1391289275,'0','9d4e2d5133964bc35ac2367a137e1761cc5d86df',0),(4075,1391289275,'0','455aee0bce7310b4c05f4bae6271d0103c338d49',0),(4074,1391289274,'0','3ec4c712a6a5eed1c03e998076cd6dab032ab670',0),(4073,1391289268,'3d5d660e851ca2b0b086cbe997888007997febab','d03126101fd4569f9ec4f6aec0d14de4fbbcacc2',0),(4072,1391289268,'3d5d660e851ca2b0b086cbe997888007997febab','a79cdb8ff09b62f3be0741ecf4a5168dfe741928',0),(4071,1391289172,'3d5d660e851ca2b0b086cbe997888007997febab','c191ea4731b0e9b71e03556393aacf135827d235',0),(4070,1391289172,'3d5d660e851ca2b0b086cbe997888007997febab','31195cb919451cbc6ba0a7e536fb80f660865c6a',0),(4069,1391289172,'3d5d660e851ca2b0b086cbe997888007997febab','f034ac2458243985e76022f96ce8a372523e973f',0),(4068,1391289171,'3d5d660e851ca2b0b086cbe997888007997febab','07decb7aef10a7894dc5eac874c41473a3b2ae04',1),(4067,1391289152,'0','239d93940f73e3cf4c945bc4a8dac927b887aad6',0),(4066,1391289152,'0','109b6cc8cfef126cfe34d645d7d644950f56433f',0),(4065,1391289152,'0','f8bd122dcad1df93ac9b3cbb465f183a41f2e6fd',0),(4064,1391289149,'0','10027cd817a3e0e2ba33a68260466395f6c259cc',0),(4063,1391289146,'3d5d660e851ca2b0b086cbe997888007997febab','68b56eb9148154628bf5aff46c0084d370a4a58b',0),(4062,1391289146,'3d5d660e851ca2b0b086cbe997888007997febab','6b0f17298e2b2434d4a9e24ba2afc81dd0803acb',0),(4061,1391289101,'3d5d660e851ca2b0b086cbe997888007997febab','a0a0e0e584784743cd7eb4920e3521d6f23eb940',0),(4060,1391289101,'3d5d660e851ca2b0b086cbe997888007997febab','d7dc9c22d17c612a37075b0fb3448d3b2b9fb766',0),(4059,1391289100,'3d5d660e851ca2b0b086cbe997888007997febab','c7d29d5e2108df1157005c51b196fa2af201c0ed',0),(4058,1391289100,'3d5d660e851ca2b0b086cbe997888007997febab','4f6d26061e323b33e960f15a8e00b2754dabfffc',1),(4057,1391289087,'0','347427a2326a2dee0854dbc8f745f73e8d2a5cee',0),(4056,1391289087,'0','f017202a73bb69f3f7ef4d9bb8628b7634206631',0),(4055,1391289087,'0','fd24959e809e1cc8cac45258945f3a7f56d1eee1',0),(4054,1391289086,'0','22f45bbd7a682c581a47e59a3c684a184f115e26',0),(4053,1391289072,'3d5d660e851ca2b0b086cbe997888007997febab','042e0cf4a6ad59a335154a5e19f02edbdd7afba0',0),(4052,1391289072,'3d5d660e851ca2b0b086cbe997888007997febab','c1cf383441210f6bc1ddcf33bff089608edb4e50',0),(4051,1391289055,'3d5d660e851ca2b0b086cbe997888007997febab','16ee98dde4ba91350f41c85b01db5d27a65f6646',1),(4050,1391289055,'3d5d660e851ca2b0b086cbe997888007997febab','491a2f025314db254f0700881dcccdd09df65bca',0),(4049,1391289052,'3d5d660e851ca2b0b086cbe997888007997febab','c5e5ad26823176018c2f869ce88c96e0c3875599',1),(4048,1391289000,'3d5d660e851ca2b0b086cbe997888007997febab','90f84b0d0efb174230b89060cd9646a1d5f4907a',0),(4047,1391289000,'3d5d660e851ca2b0b086cbe997888007997febab','756f4dce460746a0998dcd50da9009babcbd1368',0),(4046,1391288999,'3d5d660e851ca2b0b086cbe997888007997febab','c9a86656dff0d5da42d6402bd0239a6f84c9abe9',0),(4045,1391288998,'3d5d660e851ca2b0b086cbe997888007997febab','ccec3058ce2627ee7969c346e867bf0b783d006d',1),(4044,1391288998,'0','088924edc57db7951defe32f415b5cbc348436cf',0),(4043,1391288994,'0','bd000a6e180482852696894ffc1e841f4dee69e6',1),(4042,1391288994,'0','01bfb023d939453c1f5d45983753d51fc90eac2c',0),(4041,1391288724,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','de4665608517beac9fd99ab6121cbd1b2dba19b3',0),(4040,1391288716,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','f4641cc7eddba94ba215927f443c2bea829a6310',0),(4039,1391288673,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','6e37a87ac330dd144f5bfdbc1a11dba5ce81fa80',0),(4038,1391288669,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','b253648ea3e51d158ce23e35c2198af1d318123a',0),(4037,1391288661,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','888b8c2794b7af1f1f3ebcd3979c5d6e4d952617',0),(4036,1391288661,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','ad1b0468a496744876d22e1e76863cfd0e54fc5d',0),(4035,1391288660,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','67b3972ae40ca1117d8dc636790b1f2fe98d16da',0),(4034,1391288655,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','6fe3cfeb6f89076015b4bdf6759d66979c553b6e',0),(4033,1391288645,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','24ec650690ff02ef9f7485985ad364b04693e554',0),(4032,1391288645,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','a709487a6b2bf1a779dd834d0dc77c21dc786385',0),(4031,1391288643,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','089d60f89ede1d504c3969a84ccc7c0336a7c0f6',0),(4030,1391288637,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','aa232c3d8d2966bd47d2270801531a988e28c563',0),(4029,1391288628,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','77c6e4e38f81a3ec46b9823741994429664c1859',0),(4028,1391288628,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','bf7bfe80b940f07e544cce8f8d83d295fc3f02b9',0),(4027,1391288627,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','98ed585343b3911ac3af46be2863934f68ef762c',0),(4026,1391288619,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','2796b1026862328cfd8993e8707a59fbc4a0d20b',0),(4025,1391288614,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','b82d1f09dabea5c39a25888e82ecb801bd2f43c8',0),(4024,1391288601,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','9c67142338017baef1e816a7928f4e8a18eb0bc5',0),(4023,1391288590,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','d271f59e36ab068d3bd5f4ac48e655cbc0691fa2',0),(4022,1391288567,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','3332e88d73ea35ee0b81e8dffdf669c8e85c4090',0),(4021,1391288548,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','0883dca59da1d3a1280ad5e59d20af83b4d97005',0),(4020,1391288542,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','ca5a98936971bab1d317b20beb55376fbb459f55',0),(4019,1391288538,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','e2290ea37fcda357a643d3db5396b104c27a8c4c',0),(4018,1391288528,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','e76e6b3cbbf84b8c0b4ff7a3d708f37638be6a37',0),(4017,1391288523,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','10e307eeed5f5a54fad812c94e2985e77afa9770',0),(4016,1391288511,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','955cf5d9b2f655f84b664d11d75ba31b4661c9a5',0),(4015,1391288481,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','0eedf007b0c76cab05b8f1b31b3c773564c2c79f',0),(4014,1391288481,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','2ef05727fe3ec1a5a4e7038c1deb7fb643cb5204',0),(4013,1391288480,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','925cc700dfa540bf1f7d84476249a7f9d595432c',0),(4012,1391288475,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','77339d2af160178e2d8fdd2876097053dd31d3c6',0),(4011,1391288475,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','35c1083f8d2a986e6af778b0a4b61ed50ac1dc82',0),(4010,1391288474,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','3597a233716a7ce3f5cbb5188a5138229c9f7d47',0),(4009,1391288473,'34e7bcd51775aef2ffeedf98a16ca04aef53545c','f9deae275276d8129a0dbda24322b7d1c87b631a',0),(4008,1391288473,'0','1b18635e380fad36ccd49c8dc0c12cb46aa3d81e',0),(4007,1391288468,'0','59e78ea2f597850afc998f8d37a059a47d5f05b3',1),(4006,1391288468,'0','100a4c68fc5cc3aefdd7ddb9f7ca51c078b475f2',0),(4005,1391288379,'75c5aff70c06eb56b222da1c3782169877550825','24f26a4c4ddb57b27653995df2f88820f3c8d688',0),(4004,1391288379,'75c5aff70c06eb56b222da1c3782169877550825','9b274c4a5db711f3fa944a7dce1e5905962b781b',0),(4003,1391288378,'421983e2dff44f9f89e113b3320de0dbf7b4597d','176a6ca7813636cc3677c9f94faf2aed9c5db01f',0),(4002,1391288377,'421983e2dff44f9f89e113b3320de0dbf7b4597d','a55a892c3cc6968ee1f5787026ec281f57498411',0),(4001,1391288377,'421983e2dff44f9f89e113b3320de0dbf7b4597d','8d2734639a0e946e9aaae92da32281bd058e1245',0),(4000,1391288376,'421983e2dff44f9f89e113b3320de0dbf7b4597d','fb81aaab8b45a895638ddb9a4c0aa6269b76d026',0),(3999,1391288373,'421983e2dff44f9f89e113b3320de0dbf7b4597d','f3a19b8c84ddef10e2e1975dd6bdc01a830c0a64',0),(3998,1391288366,'421983e2dff44f9f89e113b3320de0dbf7b4597d','6742252a46b9df61eee25d451f83b15d6f7acafc',0),(3997,1391288363,'421983e2dff44f9f89e113b3320de0dbf7b4597d','6fdb11978b2fbfbb5d91c1939775c3b91b513ee8',0),(3996,1391288348,'421983e2dff44f9f89e113b3320de0dbf7b4597d','acb76171ce528ced9d906a4c02f8c117bb9aa226',0),(3995,1391288339,'421983e2dff44f9f89e113b3320de0dbf7b4597d','48f68be86a229930dff6c3d5fde3b9a5287e7663',0),(3994,1391288338,'421983e2dff44f9f89e113b3320de0dbf7b4597d','e0071380a74747c268851191d8f1c22777ffb2fb',0),(3993,1391288338,'421983e2dff44f9f89e113b3320de0dbf7b4597d','48964037ca7afbeb3c5f8734c7d96c792358ce8e',0),(3992,1391288324,'75c5aff70c06eb56b222da1c3782169877550825','915466c9ef2ea0aa546cc51309686ef71b64e8f9',0),(3991,1391288324,'75c5aff70c06eb56b222da1c3782169877550825','5416ce054fc5ef4e66712bbd3aad9bcfe381505a',1),(3990,1391288322,'75c5aff70c06eb56b222da1c3782169877550825','c0aef59f3497eb7a2edd96a1c867aa10e6680b8c',0),(3989,1391288311,'421983e2dff44f9f89e113b3320de0dbf7b4597d','24641c4db6b0902530cd9caad074b8f19d58b183',0),(3988,1391288297,'75c5aff70c06eb56b222da1c3782169877550825','1a4958b88c6679b7f967c56b202ac20e0734de64',1),(3987,1391288295,'75c5aff70c06eb56b222da1c3782169877550825','b2062172c78348ec905c9e3e9940f7fc6cdec513',1),(3986,1391288294,'75c5aff70c06eb56b222da1c3782169877550825','b191380bf626616f51bd241b73cfa27b4740093a',1),(3985,1391288294,'75c5aff70c06eb56b222da1c3782169877550825','245964b6e1ba0e2c924c593def7f29ac0ca24d44',1),(3984,1391288290,'75c5aff70c06eb56b222da1c3782169877550825','9e8e856976a4552599df92bad574f8b2f26d6369',0),(3983,1391288290,'75c5aff70c06eb56b222da1c3782169877550825','8bfc80369162d791b19218aeccca83477b05f818',1),(3982,1391288289,'75c5aff70c06eb56b222da1c3782169877550825','8e5d8a4e4a4f25402f1c1fb5cdfacaf2fff89103',0),(3981,1391288282,'75c5aff70c06eb56b222da1c3782169877550825','f0a9a088d9b32aa8a306c4e78315684e3783a2aa',1),(3980,1391288276,'421983e2dff44f9f89e113b3320de0dbf7b4597d','7634357d279aafa614483d1fd6f6edbcf305bb77',0),(3979,1391288276,'421983e2dff44f9f89e113b3320de0dbf7b4597d','2ca81bb59e9af38eba09905836b401f32f403612',0),(3978,1391288276,'421983e2dff44f9f89e113b3320de0dbf7b4597d','802fb041c5875802d93ad4c532a5b875b8f2965a',0),(3977,1391288275,'421983e2dff44f9f89e113b3320de0dbf7b4597d','989f506153528aeb75b3cb32a80011057ab8b2f3',0),(3976,1391288265,'75c5aff70c06eb56b222da1c3782169877550825','73d8da2d6a5869af68aa18d410f9c6c05d1e1edc',1),(3975,1391288264,'75c5aff70c06eb56b222da1c3782169877550825','6c65c35fe4bda6c6a35edae15cd739877dc3e8ad',1),(3974,1391288264,'75c5aff70c06eb56b222da1c3782169877550825','79609494c176aa45aa052dad51418b787610ffb8',1),(3973,1391288262,'421983e2dff44f9f89e113b3320de0dbf7b4597d','35f148becf6bba0d7a26ad85202c8de54513a144',0),(3972,1391288262,'75c5aff70c06eb56b222da1c3782169877550825','14ea7ee9685d62867345ab2a1fee162c8cc75766',1),(3971,1391288261,'421983e2dff44f9f89e113b3320de0dbf7b4597d','5a9633312df01c8064cb8a26e0fa0817d02e1e5e',0),(3970,1391288261,'421983e2dff44f9f89e113b3320de0dbf7b4597d','1778bddb1578c5c110a4eb54b5340f9c6f12f424',0),(3969,1391288260,'421983e2dff44f9f89e113b3320de0dbf7b4597d','08bb486d12e050c3bed09fed65d320fe18ccddc4',0),(3968,1391288259,'421983e2dff44f9f89e113b3320de0dbf7b4597d','3d705818cf957aa527d0b31cf3d1fb5bba78f6f1',0),(3967,1391288259,'0','e45bfe8bc9459798f75cd288ac5477bb147455d3',0),(3966,1391288254,'0','026f38def1d7e1f8c3df2cb1048957d950c86ad5',1),(3965,1391288254,'0','80d8409b86597ae86b245a8441ab82e50c005e40',0),(3964,1391288215,'0','efc8b5a91d89ab2522f962a7dd2bb70fb97ab17a',0),(3963,1391288215,'0','407490de779205c232348c60dac854b688057fb4',0),(3962,1391288214,'0','0935e4bbcbee342d141c96d2e849234342499098',0),(3961,1391288198,'0','a741064117648a60e81602d2163c0ece3ff05333',0),(3960,1391288198,'0','ff674c4da0ac5ee72dd7ee70d3ea36837c0f3f49',0),(3959,1391288196,'0','6c1df3b07fb9c6a800ff8b801eb4c31fa329f61a',0),(3958,1391288081,'dcee01431a07d13ff43c0e7f9641569404e4ff74','2f86ab6720b148bd0b59d88e091edb27e81c8f3f',0),(3957,1391288081,'dcee01431a07d13ff43c0e7f9641569404e4ff74','919ee4f5463327fde61cb9cfde23d840e2d83d32',0),(3956,1391288080,'dcee01431a07d13ff43c0e7f9641569404e4ff74','c4a091f930ff6305b8d2422e72bfead38c42e5bd',0),(3955,1391288076,'75c5aff70c06eb56b222da1c3782169877550825','96fff2dfb70177cd63100c8db5845549e5b3f43b',0),(3954,1391288076,'75c5aff70c06eb56b222da1c3782169877550825','deb01df945bcfbd3de878e3fa11cfdb12c694937',0),(3953,1391288076,'75c5aff70c06eb56b222da1c3782169877550825','691f66c41550479c499cfa589cc86fb0da607a3a',0),(3952,1391288076,'75c5aff70c06eb56b222da1c3782169877550825','3e923cd5c18f5b96a1ec9c470cc036a3ef0e7561',1),(3951,1391288047,'75c5aff70c06eb56b222da1c3782169877550825','effad38c9e1f7f70e12fb69ba30f4ad28c97c432',0),(3950,1391288047,'75c5aff70c06eb56b222da1c3782169877550825','ce338bd6e183df7922e1ddd11dc1a983c5573aa2',0),(3949,1391288013,'75c5aff70c06eb56b222da1c3782169877550825','f86f4a23dc5a0b833d5fa78c6ba315c80ebe5d24',1),(3948,1391288011,'75c5aff70c06eb56b222da1c3782169877550825','1be23de4510d6191b85a82a94a69a60a4a0d00bc',0),(3947,1391287952,'dcee01431a07d13ff43c0e7f9641569404e4ff74','98e8b80e23935f5802c5d8c2f57d0f65e34c05b1',0),(3946,1391287952,'dcee01431a07d13ff43c0e7f9641569404e4ff74','3c54a9ae7a46d48515a34233a025b34ce4791dd2',0),(3945,1391287950,'dcee01431a07d13ff43c0e7f9641569404e4ff74','925f2bb8ff7220f06519d35bac992dd435ccb160',0),(3944,1391287918,'75c5aff70c06eb56b222da1c3782169877550825','dcebb8171b6d9a2857f13c2f306a933c11c6fa3b',1),(3943,1391287882,'75c5aff70c06eb56b222da1c3782169877550825','c63b77ddd2f8447735122cccefa957db39483e34',0),(3942,1391287872,'dcee01431a07d13ff43c0e7f9641569404e4ff74','6da2914e46c0be1f6d42c7b42b91c9b0f745f9d4',0),(3941,1391287872,'dcee01431a07d13ff43c0e7f9641569404e4ff74','6b5702f4d0802042d3d6fa0a9cfad2b9667c32f9',0),(3940,1391287870,'dcee01431a07d13ff43c0e7f9641569404e4ff74','5ed8400d84bb4e1c77b7e0eda7a0fa07f20e91e0',0),(3939,1391287869,'dcee01431a07d13ff43c0e7f9641569404e4ff74','762b0747010fa9516f19374fe5b7c5da3f9450ca',0),(3938,1391287859,'75c5aff70c06eb56b222da1c3782169877550825','ef2c8376679dc05908629b84a60453ec3afcc91f',1),(3937,1391287858,'75c5aff70c06eb56b222da1c3782169877550825','17594094cf3deb33debd17bd66753a0425db6b62',1),(3936,1391287836,'75c5aff70c06eb56b222da1c3782169877550825','d928b68c572a1124ae11af58b93167925dd4e5b7',1),(3934,1391287824,'0','2ccca477d08fdc9e1396d08e49b158be2ede15de',0),(3935,1391287824,'0','a4b705d9025934ddf5d37e289fa5b2a03d52c5c5',0),(3933,1391287823,'0','bf69900f63ef176950c99de94d3611dc0a20a0bd',0),(3932,1391287796,'75c5aff70c06eb56b222da1c3782169877550825','aadd2e0c7c7bd186ba7fe54e63b5d6adaf9cac70',1),(3931,1391287796,'75c5aff70c06eb56b222da1c3782169877550825','3f4eabbb491d8501f4b9d099a760af70b198fc27',0),(3930,1391287795,'75c5aff70c06eb56b222da1c3782169877550825','229deb115144e3d6920cd4ceba1acfd622fdd9ad',1),(3929,1391287795,'75c5aff70c06eb56b222da1c3782169877550825','e0e5e1bf721edaac83f8402cc639ace7234e4864',1),(3928,1391287795,'75c5aff70c06eb56b222da1c3782169877550825','374937a4d36a260ac8509014cf789084a498383d',1),(3927,1391287791,'75c5aff70c06eb56b222da1c3782169877550825','8d17b1611e36084da69315a2f85cedd944a8e8e0',1),(3926,1391287759,'75c5aff70c06eb56b222da1c3782169877550825','18d2055fba96f04cd45ea3ad9abea7642a51b4fb',0),(3925,1391287759,'75c5aff70c06eb56b222da1c3782169877550825','7af207d967e8496c00a4a0e9c91a3d22ff6ef87f',0),(3924,1391287759,'75c5aff70c06eb56b222da1c3782169877550825','f5bf2122076ac3d49fd7a90d12eb733d77e9949f',0),(3923,1391287758,'75c5aff70c06eb56b222da1c3782169877550825','b0af0b70e11ccd52851ad1713749723639306822',1),(3922,1391287748,'0','ee0e9334ce6d8aae8488ca1b74887caf55ab4d77',0),(3921,1391287748,'0','d97d28d2448cd5871ae31221bc231f2c9e42fc22',0),(3920,1391287746,'0','4b340c3956c76cdb98197b2fa524e714fcc7bf49',0),(3919,1391287738,'dcee01431a07d13ff43c0e7f9641569404e4ff74','2cf4b166531117f0158acb54549946cf72413e88',0),(3918,1391287738,'dcee01431a07d13ff43c0e7f9641569404e4ff74','527ef0dfb6a5a4d74dcca09a852264bdfd058b9c',0),(3917,1391287736,'dcee01431a07d13ff43c0e7f9641569404e4ff74','f0e01fb3184e339d2fca2909d278cff4f32eff70',0),(3916,1391287724,'75c5aff70c06eb56b222da1c3782169877550825','5cebab92bead99462bb2afe9c2af865244a57121',0),(3915,1391287714,'75c5aff70c06eb56b222da1c3782169877550825','9e8ea776a52dadae911cf2989f963d74b707ec60',1),(3914,1391287702,'75c5aff70c06eb56b222da1c3782169877550825','acf05551b057a4242f10d1770824275dea048063',0),(3913,1391287702,'75c5aff70c06eb56b222da1c3782169877550825','df0d45688bbce9d008ce5b4b5df6f2b25d594b41',0),(3912,1391287699,'75c5aff70c06eb56b222da1c3782169877550825','f01f6a56aaa400f9a4e82975013a50019fe579f3',0),(3911,1391287699,'75c5aff70c06eb56b222da1c3782169877550825','67d9ed1b3e11376ecf4d6807b00fbb3231529184',1),(3910,1391287698,'75c5aff70c06eb56b222da1c3782169877550825','642b8552378bda8ceb6f8741fc1d7acb3bcd5c6e',0),(3909,1391287667,'75c5aff70c06eb56b222da1c3782169877550825','2602cd740aa552c2e8aa7a756d1b207f4edb4f00',1),(3908,1391287666,'75c5aff70c06eb56b222da1c3782169877550825','fa8f45494165200156b2ad547dd3275bbc33523a',1),(3907,1391287601,'75c5aff70c06eb56b222da1c3782169877550825','a0638236b42bd58ef9231505df78fe4494a75253',1),(3906,1391287596,'75c5aff70c06eb56b222da1c3782169877550825','1b5cccc84583c8704b3be4cf2404854b6639de54',1),(3905,1391287593,'75c5aff70c06eb56b222da1c3782169877550825','f0bb93c7f6eaa199998375b3d0bbf84843258379',1),(3904,1391287592,'75c5aff70c06eb56b222da1c3782169877550825','3e81b626ca1958848ff184182e8467a600964bba',1),(3903,1391287592,'75c5aff70c06eb56b222da1c3782169877550825','228eb6194e60329a7997b06c86a8c38fc2ba64c0',1),(3902,1391287590,'75c5aff70c06eb56b222da1c3782169877550825','337ef1008d88cfbeb28dc4b2001acd4d18a69672',1),(3901,1391287590,'75c5aff70c06eb56b222da1c3782169877550825','a8a79514928c3af19e7bfedc78c679bcd6af6fd4',1),(3900,1391287588,'75c5aff70c06eb56b222da1c3782169877550825','38e0149f22dd2e49c654b109a412179bfc4d8a8e',1),(3899,1391287533,'75c5aff70c06eb56b222da1c3782169877550825','406f8553f49c55103005bd35e06f23dde7d2864c',0),(3898,1391287533,'75c5aff70c06eb56b222da1c3782169877550825','d2a554703aa101d89d8fabfb86d73cf391cea3ee',1),(3897,1391287531,'75c5aff70c06eb56b222da1c3782169877550825','2d83574d1db0f6d5f6f634ad3a6d866ee78cc5da',0),(3896,1391287527,'75c5aff70c06eb56b222da1c3782169877550825','c2ad0bce89b23714da9626c6216e1ddc3ce2feaa',1),(3895,1391287502,'dcee01431a07d13ff43c0e7f9641569404e4ff74','d0cb71c896839e01800eabc0674478aff00c4542',0),(3894,1391287502,'dcee01431a07d13ff43c0e7f9641569404e4ff74','604142f5551b54654cbc70b42eb0dc393d644799',0),(3893,1391287502,'75c5aff70c06eb56b222da1c3782169877550825','13254205d78f475907b78f342f6234ce3ede5a6e',1),(3892,1391287501,'dcee01431a07d13ff43c0e7f9641569404e4ff74','c1a7cfa4ab8b89ac17b2f4982cd2e7a2e46463fe',0),(3891,1391287498,'75c5aff70c06eb56b222da1c3782169877550825','da7704175ffe4aea8356dfe73f31df7afcedbd95',1),(3890,1391287496,'75c5aff70c06eb56b222da1c3782169877550825','2d7a29c17b8b3896d20e4548f58c7aa6012724fd',1),(3889,1391287487,'dcee01431a07d13ff43c0e7f9641569404e4ff74','99e07b3dd49fc3756584c2f942db4b6f2e06435c',0),(3888,1391287487,'dcee01431a07d13ff43c0e7f9641569404e4ff74','df647efe15d0b5fb9808c38fa970dd0327fcd53a',0),(3887,1391287486,'dcee01431a07d13ff43c0e7f9641569404e4ff74','639b121740c25899f32b37a031e5439b70555b07',0),(3886,1391287485,'0','247e565e8e8e85aaa540a2864fe9136dbf2e66f4',0),(3885,1391287485,'0','0f144caeceec7635fa43ae4162f72e89e854d6f5',0),(3884,1391287484,'0','5ea63cbd1aeaf207b6b91df0f602b250212e7913',0),(3883,1391287481,'0','2b9d2bdbfa5521012a848ea6a70e916f69571f24',0),(3882,1391287481,'0','1cc10fe108d3e8deacbed9dc7c482cdcd8e0ca96',0),(3881,1391287447,'dcee01431a07d13ff43c0e7f9641569404e4ff74','a485d13281bd41acb16fe9d8b607a8c6cbd9aebe',0),(3880,1391287447,'dcee01431a07d13ff43c0e7f9641569404e4ff74','f192485e183021e0d7c446e73e6b0c564e29cd9c',0),(3879,1391287447,'dcee01431a07d13ff43c0e7f9641569404e4ff74','37c27dfcc445b94d5a1bc0771780c1d83e79280a',0),(3878,1391287445,'dcee01431a07d13ff43c0e7f9641569404e4ff74','ad8d1d729f6d567fd446942243cdcde04d936572',0),(3877,1391287445,'0','614806d9a59550e3057cc27f51dc308f4a1bd7fc',0),(3876,1391287431,'0','59cb730b5490d2c3f52ac4712b62bc54c2b98046',0),(3875,1391287430,'0','7986a60f03f7f1e3e21336d56aee3be018e833bb',0),(3874,1391287424,'0','e1be01f50446fe3ef27a47618f7d77cb76bb33f8',0),(3873,1391287424,'0','f3c07320777f07acf31013b4bdeb686f3412b54f',0),(3872,1391287424,'0','21f70a213344341f181c24a027f71eca9e9b57c6',0),(3871,1391287420,'0','3cc9e14fb239fec6b7c2246186d11300f4fb6720',0),(3870,1391287418,'0','c4488f850dceb4291db878829e13348c1e39afa6',0),(3869,1391287418,'0','d479a89aba1c02aef0c48259d2608b111ae90bc2',0),(3868,1391287418,'0','ec593502dbb5f98f236413cd8697ccfc2cd8d4a7',0),(3867,1391287417,'0','69134a013370cac7956ea0eb8e38fc80b7132d02',0),(3866,1391287409,'0','ca17249d8064aa1d77582aa280582575e3ac10d3',1),(3865,1391287409,'0','00e416d6be9bb4c1083b64756784480a79c1bb58',0),(3864,1391287270,'0','550826a44fe79a79629edbd648b88d94f52b959e',0),(3863,1391287270,'0','cf1534961a92ee3618075cac5cbf101224753c67',0),(3862,1391287270,'0','6c22a952452f779503b4ad6ba3396fabd923a3e6',0),(3861,1391287264,'0','23a0645a0f0610d2ec06ba7417998c8da0014ff2',0),(3860,1391287263,'0','98365d4e9c0e79bae6dbf02eae78f488654e7463',0),(3859,1391287258,'0','94a4401f885364e5dd23236c045497e75f750f64',0),(3858,1391287258,'0','18029011baf2d510a8450e513fbc0c5815dbd0d5',0),(3857,1391287257,'0','74e20351c1e9f8aefd20a257b5f62e864238353a',0),(3856,1391287257,'0','da193502eaa9aea61e144d4a03a6839a217468cc',0),(3855,1391287253,'0','c891083ef280ec5409347654f0114a86a28bde59',0),(3854,1391287253,'0','f5e3347cd4cd6a1047696ead6c712fc0d47f99d2',0),(3853,1391287248,'0','df70e0ab9cfc065a95c4fb17738c0bdb1031ce39',0),(3852,1391287248,'0','28db5baa5f27a416ae863e2067affb44367ae6da',0),(3851,1391287247,'0','ee3550e1c2f13592a91efc08dd7c43467de6d068',0),(3850,1391287245,'75c5aff70c06eb56b222da1c3782169877550825','d2f38d8046226ae339cb0b26acd70cc2defba446',0),(3849,1391287245,'75c5aff70c06eb56b222da1c3782169877550825','a6fd201fc58006fcaf0f10028d3488fb2f4060b4',0),(3848,1391287245,'75c5aff70c06eb56b222da1c3782169877550825','cb8d39934427710ceedbd9d84af74a4e7b6b4ff9',0),(3847,1391287245,'75c5aff70c06eb56b222da1c3782169877550825','975083846180eeefc7bf63c5ffce2b37dfcd571a',1),(3846,1391287235,'0','543493f2f52b0bac2f03dc1cf4de7cc57f3ac08f',0),(3845,1391287235,'0','5539e65cce10389c180efa5f760a1a8f5a0b2a4d',0),(3844,1391287235,'0','d197bf7d59a4f76773d7bd8e820a5f72da4541b3',0),(3843,1391287229,'0','63c17c10b48303bc0afc8c38a66e8669371170d9',0),(3842,1391287229,'0','df1a1d72a7d23b9d1fae9de0d1e40749684b32b8',0),(3841,1391287229,'0','2d43d2daeae811aa7af877d43e29dde1ccc9a48b',0),(3840,1391287228,'0','3c9b4e6d69a494d7645b8423ceccf39d6c9027c4',0),(3839,1391287167,'ffaffec2582566581b742d1888b142d560408c61','fe099abd4d09ae3559f950d3cbd2c00f76916b4e',0),(3838,1391287166,'0','4902860f00acf5c1d56320131ee645386ec4d862',0),(3837,1391287153,'75c5aff70c06eb56b222da1c3782169877550825','061a2d184095d4d73b069d46397a5618994b8a76',0),(3836,1391287153,'75c5aff70c06eb56b222da1c3782169877550825','b273a6dd2bf777a02172573470a1646c1cfefa54',0),(3835,1391287152,'75c5aff70c06eb56b222da1c3782169877550825','01032a230a377f0ecc1fcffe2018747a5d511d8c',0),(3834,1391287093,'75c5aff70c06eb56b222da1c3782169877550825','57049e99432630684e536b62a853d4ba72d91140',0),(3833,1391287093,'75c5aff70c06eb56b222da1c3782169877550825','d92d6c199297c6e546df027c40115eb362037b1d',0),(3832,1391287093,'75c5aff70c06eb56b222da1c3782169877550825','0354ecff1afea0135edeec859dc43b29cc77d7ef',0),(3831,1391287093,'d4be76a845c2b519cbd3d0bd1014d67f5c134423','825a0f2bc809d9b744449892bb35c8f044df545f',0),(3830,1391287092,'0','fcc3092c7eb5023dd000e33f2278c894a83b3ebb',0),(3829,1391287092,'75c5aff70c06eb56b222da1c3782169877550825','833bbe25b112bf5fa031c4c9c8417ed34042eefa',0),(3828,1391287084,'0','51e6fbda3b4f6477ee8b129d30665e9712fd62a8',1),(3827,1391287077,'0','ef36b80bb39b8ad109e48045c6062bc258ae6632',1),(3826,1391287070,'75c5aff70c06eb56b222da1c3782169877550825','9ce84390a3e59428ae59723ec0bf180f81480951',0),(3825,1391287070,'0','cd5077515cbb5d67312e2a7021cc54e9ad0b2963',0),(3824,1391287051,'0','5d0418cb14edb4378647f21b3b6f3b26934ad85c',1),(3823,1391287051,'0','76859aa8cf710fdd66bcad556bbc5ac7d896e746',0),(3822,1391287051,'0','bc96cd821a6b4dad319cc2eb749d336e7acaef0f',0),(3821,1391287049,'0','356edea1a041faeb51d1ec057b3bac801c1a8826',0),(3820,1391287049,'0','71851a8a758a4241899816aac70359d4be1015e2',0),(3819,1391287048,'0','758efff9f97ec35daf013b123c89b6b0f905bc27',0),(3818,1391285636,'0','fcc47c6a06691b1d226fa304066e684f558b6fcf',0),(3817,1391285636,'0','499218b46ed7b5cf41e044b6be2fadfe200153fe',0),(3816,1391285635,'0','87d50dfa9aa3f2fa674bb1f5af0bab01dee7a2be',0),(3815,1391285544,'0','3d46eeeb55ec2fe0d4427c46210f42d1ed9ae8a2',0),(3814,1391285544,'0','07757e31c0dddaea9bfdf824512f66302a235337',0),(3813,1391285543,'0','d7c0d49c881b886a6781902f773eac7ffe55daf1',0),(3812,1391285440,'0','3018917ebe05c7324fcb9f31464806df110d36b4',0),(3811,1391285440,'0','21a78ccc685264dd48dd6998470b4faab686648c',0),(3810,1391285439,'0','3a2aa0619bb586e77b083611794e37be2dcafe52',0),(3809,1391285435,'0','19ded903a72f0ca8a85505fba044d6a3e1fe6010',0),(3808,1391284794,'0','93c6dc0765fb44ac693cdf7f2f8976f84e1ca87f',0),(3807,1391284794,'0','e5f78e6a08f5b5cfbcf6cbd0956299a1dfbe43ed',0),(3806,1391284793,'0','53980e7f500d0807f6177cff13b74cc720a3479d',0),(3805,1391284078,'0','2d746dc2999bdb720b664ad6bef52fbe08732f75',0),(3804,1391284078,'0','05fb35d8f4f61efc7fdeb1df4cd911b9dc6e1017',0),(3803,1391284076,'0','30e119ac5663092fd90bad645efa14620cae1ec2',0),(3802,1391283732,'0','14a7d0c11cfcd27c9a4c1ffe32a524a75e49e0c3',0),(3801,1391283732,'0','9505f248af86ecd7f413112e937afe2b88f7c603',0),(3800,1391283731,'0','a1c9d5c1fe0fd88ffd0596ca543f87b19036cee3',0),(3799,1391283723,'0','d6475a5c8f8d7b5ef055038b4bfe166c44df8da2',0),(3798,1391283029,'0','12f1b569af86c85242ecaadc4346dfa5a69385f9',0),(3797,1391282976,'0','92ac065482bd811cbdc81d5186e7048128da596f',0),(3796,1391282976,'0','63b7c3bf735d3b52856473cd04c8db702844157d',0),(3795,1391282976,'0','4da27243e3b5d1ad586535c423f3e8714ffa8bff',0),(3794,1391282965,'0','ef3fe076693f7cef06144d8842b1dd39a52fd06e',0),(3793,1391282963,'0','f9a3bab51128a296f8e2f9c377a5505144baf58f',0),(3792,1391282957,'0','a76787941033a661bb9d9c7d79f6d4785528d199',0),(3791,1391282957,'0','6293914d736a91e6951f272dd6f53f19754bf1c7',0),(3790,1391282952,'0','f20dd1d4d256aac59e30cbee86b3317e7b5d7642',0),(3789,1391281506,'0','4bc3644f1f8994959b249251fa3a12a2a6d5ab57',0),(3788,1391281506,'0','b627c1c30410790ca356697a3e3b36e47ad59872',0),(3787,1391281504,'0','a9aa3e39200ac4d377c8c87d9d9e8796e1370b9a',0),(3786,1391281504,'0','382ef6129ad7fd41afff3a48917ffd50a3ce9738',0),(3785,1391281502,'0','58755a430342407cfa3a661894be7c9c7f4b8e8f',0),(3784,1391281502,'0','0f60921209539448e2e22f09f9cd9ce65c9c2cf7',0),(3783,1391281497,'0','1343a9366234ca6b3ba3fd36d2b220928f869f80',0),(3782,1391281497,'0','87936f0c3a90c95b3875a2a1fc8e54a6b4dcc94c',0),(3781,1391281495,'0','ed3ed6906674ffa7f8754b0cba9e80beec31f9ca',0),(3780,1391281387,'0','1a9400df8c070a4142652116e94c227e15066ee8',0),(3779,1391281387,'0','84ba06332314a665fd5a85dd69c3c67566216958',0),(3778,1391281387,'0','8c861a9a5a6fdb31a8e3303b2a8b85805b21afe2',0),(3777,1391281379,'0','d33864f33a9840fb1b1cf7266aced56cb003131a',0),(3776,1391281379,'0','57df70bf55db22b4574dacd19cde35ec033f7230',0),(3775,1391280537,'0','508b0556839925bf34d63947702834945b2f8b7f',0),(3774,1391280537,'0','7ee9318d30ec77667fc73765d8e691a95576523b',0),(3773,1391280533,'0','7afa0d8309c8098c583145eb217adbce42ede3c2',0),(3772,1391280533,'0','5de72b7a636464856d2769b0cf018015bd514d79',0),(3771,1391280532,'0','4add8542a89dfcfb08b3f3cbbdd6697fc566661b',0),(3770,1391280526,'0','c7bf73f30cd710402f4ca182b85b90e6fc0ff662',0),(3769,1391280525,'0','50089cfc5e0af8ad74231c7b3d36e77dd7e7459e',0),(3768,1391280338,'0','1b2f31595c15e8ce4e1b167808a20ff4a52e1696',0),(3767,1391280337,'0','34fc0f26ee224106b2aa9d357f94599019061322',0),(3766,1391280179,'0','131d7f5227b86da9527e3d1686379fbf3e4e3e15',0),(3765,1391280179,'0','c41bc1e6325d34e6edd51e15c5dd1076d15f4de2',0),(3764,1391280179,'0','af34308a48f03cdfb03ff8e39e9334444764ed93',0),(3763,1391280179,'0','4a414205e574272abf3d09ffc867a248532d5948',0),(3762,1391280169,'0','b3a0c7f53a119f764b5864d72c3a081c9e33ad24',0),(3761,1391280160,'0','71c1a9f3668f395f6ecac92ca2af2f288d489ac5',0),(3760,1391280159,'0','7358b81638efa94772e3e26ebb7bb299a2d09913',0),(3759,1391280159,'0','6c445e2ead4e87249ef00f23c1389079529e1119',0),(3758,1391280159,'0','355faabf7a958006794fcade7f956ac791b7c8e6',0),(3757,1391280152,'0','1fb18bc45b4d7f39fdb4a1db3f3a7e9980aa7516',0),(3756,1391280152,'0','3b67bc124f26b9ee6337997442e05c6b41dfe6d2',0),(3755,1391280152,'0','b257ca2eb2ae3bfb435d706eb15d42a1b7639805',0),(3754,1391280145,'0','d3939ab42ae3a863603d49572005616d7502a897',0),(3753,1391280145,'0','088b783610ff37672c605ee72bd095ba03466bd8',0),(3752,1391280139,'0','c15260045dfff5ee8f86afff276330851a8639c6',0),(3751,1391280137,'0','350b23b8179afd398f2c1f0bfa65debf5da9db5a',0),(3750,1391279964,'0','8522e52c7d3ec46162279ab9102ccb00badd6109',0),(3749,1391279964,'0','b48eb4bfb6ee32f8b7e1a3922abf0a9b78955618',0),(3748,1391279957,'0','a3e40ce025cd78b4cb5691bfec027fde1c3e4968',0),(3747,1391279957,'0','dca9383876b9a76f3d61b8d3be2370139859e60c',0),(3746,1391279957,'0','58035fd4ad91ce6706c00f87b28db599e5342c57',0),(3745,1391279950,'0','092448806017676e8c219e3a6fa22f66b5213297',0),(3744,1391279950,'0','eefd6426104002fd89677474e1e58a004da1ad77',0),(3743,1391279948,'0','ef7d1c47f7ae5de9e724bd306b7dcf3382e247e1',0),(3742,1391279918,'0','b43b46d4e81b545dcd4435c3a329dcdfcf853a69',0),(3741,1391279918,'0','3dbd6efa516684e5a57dd347c2c4b9bf081a6c08',0),(3740,1391279914,'0','8bc11c160fe60feb57fac73635ad6f4cf48d85d5',0),(3739,1391279425,'0','8cd1b8ff48d16b2245fc4f9454b33f018960da09',0),(3738,1391279424,'0','3d73dbe1a83af8701ed2d562082d7e626a6288bd',0),(3737,1391279424,'0','5cdb468a46980c5eddeba9fcfcc6edb6aae22be4',0),(3736,1391279421,'0','5d874915753639be7692d84df0918419ce95c977',0),(3735,1391278859,'0','e78ddd9eb7ee715580a5efc24b08f1bf162f58d9',0),(3734,1391278859,'0','2a89c99c69a292f8d822015f2f155c60d128705d',0),(3733,1391278857,'0','a083093833cc4cc97968288cd4e7a0eb6c0346ad',0),(3732,1391278850,'0','54cc59034176bbee5d5981d131339fd963544886',0),(3731,1391278850,'0','c333d8c45e49be8cdab5151bcdfe8b7af7fb21bd',0),(3730,1391278850,'0','22606503af0b99b1d77895690b4851400e1ad1f8',0),(3729,1391219710,'668d6ff6ee0f8e738d529ac5d8072646b777708a','a97714218054f4ed25486713bfb753a6d92b1df1',0),(3728,1391219708,'668d6ff6ee0f8e738d529ac5d8072646b777708a','bd2f7ae5ea3bf905237c04cec5a2916d04682ab4',0),(3727,1391219612,'668d6ff6ee0f8e738d529ac5d8072646b777708a','ab205ae5d760a715cba9a1a81ae507fe6c660374',0),(3726,1391219612,'668d6ff6ee0f8e738d529ac5d8072646b777708a','993873b199317b5b6b231f3b501f20f167b364fa',0),(3725,1391219612,'668d6ff6ee0f8e738d529ac5d8072646b777708a','0e66dc30c1ce01079a5abca47d8d5eb7839d9901',0),(3724,1391219611,'668d6ff6ee0f8e738d529ac5d8072646b777708a','989ace1b1cb300b5f7e76c787b06eee75f41c44d',0),(3723,1391219610,'668d6ff6ee0f8e738d529ac5d8072646b777708a','fd6b38f437a2b48f8a1c47dff8a8c996cbd708af',0),(3722,1391219603,'668d6ff6ee0f8e738d529ac5d8072646b777708a','9dcc9233d8dcc162ea1ae838a63f6aa986d1af3c',0),(3721,1391219603,'0','41ccbdf34de3dfefe74bead92e82f4b75103c5f3',0),(3720,1391219599,'0','f33e25298919298330a73cd8ac0791422426fb23',1),(3719,1391219599,'0','a51e16c2f4739936ea59e6226e38bcc01806dcf7',0),(3718,1391219599,'0','e44600cc4266d7f6f87017fbc5c0ef2c776bba93',0),(3717,1391219590,'9d84e3459381e939f082e04cafc2014b06695cb5','5d4e374f9885b47245b669f4cd066a4d57ff96f1',0),(3716,1391219582,'9d84e3459381e939f082e04cafc2014b06695cb5','db650f491d75dc74b6fb01268a6f53771e46391a',0),(3715,1391219580,'9d84e3459381e939f082e04cafc2014b06695cb5','8209d135855cb568106d18fdc336e09f4fbd446a',0),(3714,1391219576,'9d84e3459381e939f082e04cafc2014b06695cb5','076e83561b30c23e1bea767cc695a65207b20bc6',0),(3713,1391218921,'0','ab4e9ad24cb4a072064ef67c7261293c16af6888',0),(3712,1391218921,'0','d7f9d9811b5335015ee6076d5e5ce8e05f065dbb',0),(3711,1391218920,'0','1c74ca8c4ad7001f46c69a844ced5a53b6b60cb6',0),(3710,1391218909,'0','a5a9992ba7793fea444b602a81be4c48e9809fd2',0),(3709,1391218814,'9d84e3459381e939f082e04cafc2014b06695cb5','ca6e36a0b820479f1affe23b0de48d6f4c283d78',0),(3708,1391218757,'0','92adc15dc1b86d3dce7fc993258f531a8a8d2ea0',0),(3707,1391218581,'0','96c36a0a86b0eeb0340dd2975bc28d4ce02c0bda',0),(3706,1391218581,'0','e01863a31067efd52cb37bcabbc89b5fefb1a734',0),(3705,1391218579,'0','f56142448177fd135a3ad7fb373baab17845ddde',0),(3704,1391218579,'0','dbb450e0a085b923b6a38866753cde2cb8a04b12',0),(3702,1391218578,'0','7380f14eca86e452aae1983c2efaf38f32e31122',0),(3703,1391218579,'0','84f89fda05f6558d03ea43948085e2e6c6a783ca',0),(3701,1391218578,'0','2c3fea30439cec0228ec9073576d51865ce27115',0),(3700,1391218493,'0','bd63cd9b6e8298069c01409c88f4cd5c5cf80765',0),(3698,1391218493,'0','9c026375946e89f4db4201c6bccc6f393764eef5',0),(3699,1391218493,'0','ef7c0b279c7e5e48731b6fc169f0b211f90075a1',0),(3697,1391218102,'0','dd28483492f5822f28bcba75b0fb8b716fd69b6e',0),(3695,1391218092,'0','05f37c2304d2507eb89e7da6e42d98d2aecaeb72',0),(3696,1391218101,'0','5682945419d8c28d56f611d24fbcf889fc79d546',0),(3694,1391218092,'0','dd55b9e7c13eeba5ff224c18a83c995874351fd4',0),(3693,1391218090,'0','698388f8a982e3df17e99a559fa50dce20f68034',0),(3692,1391217938,'9d84e3459381e939f082e04cafc2014b06695cb5','4bfdc644ea17fb5d25198d256f55d84cc8659c59',0),(3690,1391217746,'0','938ab108c533bac7e7ae0aaf7316f9554e3e87db',0),(3691,1391217932,'9d84e3459381e939f082e04cafc2014b06695cb5','23e9f8ccf471966578440a1ef108729ddd776932',0),(3689,1391217746,'0','815a13e0e5c6b976843e41fdbab3876470a447ba',0),(3688,1391217743,'0','7f20af2cd9df37a7eddc1c185a2e891a9e52516c',0),(3687,1391217550,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','7f118b75e90c3892d44c10fca5e7bb10f907dcba',0),(3686,1391217549,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','c7fafca6a414f186f2fc1d3385351b89e670f836',0),(3685,1391217477,'0','17abd6fdf9c937b5cd2b8481024fc0cf30269213',0),(3684,1391217477,'0','ce1d9daf63ebc5368ee313561d5b39a6e3db91f3',0),(3683,1391217476,'0','e0c60b652f51376f378c67db43500b67f3837fbc',0),(3681,1391217411,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','c015bf5529ebeb0718a6aae74f256d38cf40e62f',0),(3682,1391217412,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','f64b3062533eae0aedf9e994f0951061d1e1a6f1',0),(3680,1391217335,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','6d668b5be9d4a0945065849ffb80b7ad920c8ad2',0),(3679,1391217335,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','cacbc1611bce56b215b5a8229a5e57a101778682',0),(3678,1391217331,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','6a69357fc0111ab5f8f7f2617bfa55fe5046414a',0),(3677,1391217331,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','12cb778c5e9b289c69833d581144387fea0ca93b',0),(3676,1391217331,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','51b13c7f8e28df4ee0a1ed499b6abeeef3242eee',0),(3675,1391217330,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','1b2dac0bb0833cf5e0744eaa04cbe1e9c38207ed',0),(3674,1391217330,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','6f77bdf9c2ff747141d43f6b719263961a2458e3',0),(3673,1391217308,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','5684e37b8acb37390c024f4eea809b96a88f6399',0),(3672,1391217308,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','232c2d804f53a49b9aaf3228f1f60eb40bd20600',0),(3671,1391217304,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','798c217f80371d3206525a23d4d376d382c1ca81',0),(3670,1391217304,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','609d91670a86f065056115ec2c2e091526024aaf',1),(3669,1391217284,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','71e52fb36445d559547afa1c23cdb3bbefdfc3c0',0),(3668,1391217247,'0','7a72b491d70ca9490e4714e0758538e697bb610f',0),(3667,1391217246,'0','5aeb623dc35b060ea38e8d2bd0ab11ba35a0ed45',0),(3666,1391217238,'0','332bdc0012c60327a3aa8bdcdcdc0e49856bd863',0),(3665,1391217237,'0','fbf155f546e1dbb758e80bf1bea7350b0b4dcfe4',0),(3664,1391217231,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','671fdfbf53acedcf428fbe022c7f832baf942e5d',1),(3663,1391217220,'0','fd9e7123d34387004f34ebeaea8be4c4050102a3',0),(3662,1391217220,'0','abd81ea6e7b648046048ac4ecddbf864470ba1ee',0),(3661,1391217216,'0','64dab4e92de3fa843dd711c460f5ef8ec86ea0a4',0),(3660,1391217216,'0','ced21534ff8fe5d7bbb202824b5e8821f192632f',0),(3659,1391217215,'0','707109be96daec0e3af8d36316fce46af1273611',0),(3658,1391216071,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','50443b6349c820a5ad9004b4b5cd25abb06ce466',1),(3657,1391216071,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','adb39031b04e845672864385667604ca4b879065',0),(3656,1391215993,'0','6fea0fe77ddfddfd991d44fefa0f30e56e4ccffc',0),(3655,1391215984,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','53f525b5ab8ea897f8b0726a774f8cf3a1512d0a',0),(3654,1391215919,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','bf018c8f57fd5218d36637fa739c0bcc5b7272f4',1),(3653,1391215917,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','e68c622ae0eec1f4e4000c8556bb21dafada3f1d',1),(3652,1391215881,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','299a930f96eafed796ffafc657859a10d129e01b',0),(3651,1391215881,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','2176402c1bba017f6e3200ff4270cbf62c4df76e',0),(3650,1391215880,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','2938ca0a3f8eebb0684308e1029c01a9f045f35c',0),(3649,1391215880,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','8fbb9df6a09eceb62aa054b2b4cde8524dd4118d',1),(3648,1391215876,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','c5dd14cbe1a6cdbceb389bd8eaabe0bff3392192',0),(3647,1391215876,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','964fb153d13168e263adaae466153417f43a28e2',0),(3646,1391215876,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','f2bf57b7742cdabeabd588ca87ed9f1a171f6d29',0),(3645,1391215790,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','a352ae6ff16123ee39e4c8eeacf7edda7dfeae54',0),(3644,1391215790,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','c32f69e189bf8c0b90861e1d1af38ce2c1116c05',0),(3643,1391215789,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','110bf86cf4a18fff26f035b541e9653b91f474f9',0),(3642,1391215789,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','1642c8cb68333e1fc5bd94466bb5c17eece50080',0),(3641,1391215785,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','4ebc1f8c032b823055d4493856b2226a45d5600f',0),(3640,1391215784,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','1d2e1b63883fe3b01836c23ea7aa24b71519b8cb',0),(3639,1391215770,'0','2678ba95483f0bed2c091d35a03f9453e8b8fcc1',0),(3638,1391215755,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','801c3a0d60a63569a7719f839be550c13b39b4b1',1),(3637,1391215755,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','02f90ecb0c17488118e890b74bf9a59c2da3c684',0),(3636,1391215753,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','36ae754df469f896472d2d51b69703228ee3c6c7',1),(3635,1391215752,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','bfe0c6acc40acd6b280c473905b35eeacb05bf4a',1),(3634,1391215752,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','ec871732b5b6fb4e6f0605da27da88a1eb4f4622',1),(3633,1391215752,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','988675e74c9814ea94d6605c83aba55657c3514f',1),(3632,1391215749,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','0c4bdaaecc9212d76698c50823a5523bd94b9d13',1),(3631,1391215640,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','19b03fca30b7eed900ce4755127f534095e28e3e',0),(3630,1391215639,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','c2e92ee71f7ec827b249d5602b49495284aedbde',0),(3629,1391215639,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','d92e1df4c8822431d18feb7dc4d2f2e64249a5b4',0),(3628,1391215639,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','0ea364e8334d5333f3b5824347351247d3376f10',1),(3626,1391215624,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','326e6ec53bcf76a6e1d30bef3c3894dbd63c5049',0),(3627,1391215634,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','35913bcaa5b056d04b79c74d922e042c9c68d619',0),(3625,1391215623,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','3329cc047c80b73d81886c5df4c49409f1a899ad',0),(3624,1391215623,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','d74bcff1279f38f6916b047a03745a618dee6e40',0),(3623,1391215622,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','983d7678c7b9d085077a048b146f75ccf7ff2392',0),(3622,1391215608,'9d84e3459381e939f082e04cafc2014b06695cb5','b3692fc30e3839b08dc0e854c9c35738557ef209',0),(3621,1391215597,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','78a81d25ba4cbecb52f512dd27a0c096a785add7',0),(3620,1391215597,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','b66dba0e0aa0ec9a6e50373404df63ef841be50d',0),(3619,1391215518,'9d84e3459381e939f082e04cafc2014b06695cb5','644af28500d61227372de897da9b3aef2167cd40',0),(3618,1391215514,'9d84e3459381e939f082e04cafc2014b06695cb5','d49fdcac5804b6b11962908fbfc056a8131ca3e2',0),(3617,1391215500,'9d84e3459381e939f082e04cafc2014b06695cb5','4315c308c61f06986d85204c2a4e11038761b13d',0),(3616,1391215494,'9d84e3459381e939f082e04cafc2014b06695cb5','3c03855c78e04faa3dacee8aeaee00eb9ebbf82a',0),(3615,1391215492,'9d84e3459381e939f082e04cafc2014b06695cb5','20589b086db80c5f145bbc7992d6294d9171c466',0),(3614,1391215466,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','d6c46f74e5594fbd552d1bb83697e701c4d3a711',0),(3613,1391215453,'3e0e9285f4b28cc9e58f03a92af1a0e213b53a7d','f3ae6912ef9138e0a3a146518f8846cd1e9173a8',0),(3612,1391215453,'0','c37b165199835b124047251e8807c2ec62439162',0),(3611,1391215445,'0','9b8abdc69c9121aa636f5986cb26da390b7097e5',1),(3610,1391215445,'0','0046d4694409fa4ebd87e68ed8f25962e7374dae',0),(3609,1391215445,'0','80bb652fb2110b0f35f76b7fd3d602ba9fcd1578',0),(3608,1391215434,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','65983b3e3d0050abe5c1beb0a7a5d196360ee961',0),(3607,1391215433,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','923d57e7c4c888c725648451c92d2e5dad70f4a4',0),(3606,1391215425,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','acb44350bb607065fe367414ce602afa876a5cc3',0),(3605,1391215402,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','7d8f5c28c751b7836b28e4526b9d7cb1d135c177',0),(3604,1391215402,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','b5493a388e3799bca3935b4a29d0186852646f2b',0),(3603,1391215402,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','1385b99827508cea154afb07206c58760aa4dcf0',0),(3602,1391215401,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','8163dabb09af215619d0d7f25fb8648def91ad05',0),(3601,1391215391,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','6ac4010e91ed04c941228c29647052517ea117e0',0),(3600,1391215367,'a75efee6fedbeb4de9bf0d7a5d720dd423c9a1b3','67a061342a4f53d9a9f0e74053957458ef5ade11',0),(3599,1391215195,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','e950bd07ce489a68b866e78de93ee639e655528c',0),(3598,1391215195,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','c9bdf2e52e80756fc309b7702e3349c8a1600ef7',0),(3597,1391215191,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','fdba54b91c2b7e1dd78b18b31909554710306c88',0),(3596,1391215033,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','b4bd02fcfb06223453dfd1a802e904830dcbb026',0),(3595,1391214990,'9d84e3459381e939f082e04cafc2014b06695cb5','ab4afbfc080d48779e2f0007a9b101d20cde08f4',0),(3594,1391214990,'9d84e3459381e939f082e04cafc2014b06695cb5','8bdf6134c689dbc7d4788bef0239a92b8c2517bf',0),(3593,1391214983,'9d84e3459381e939f082e04cafc2014b06695cb5','e4dbb9fecb2bdd5380dd09eed9a04143c81e346c',0),(3592,1391214983,'9d84e3459381e939f082e04cafc2014b06695cb5','09681ac2c880f713c4146cc0cab35d9b423f9124',0),(3591,1391214983,'9d84e3459381e939f082e04cafc2014b06695cb5','40e80fda3ac7f3ca0956103ad51f5dfa542ab261',0),(3590,1391214982,'9d84e3459381e939f082e04cafc2014b06695cb5','785f1e6e6b82875faf9ea98b9d91e257c351c20f',1),(3589,1391214973,'9d84e3459381e939f082e04cafc2014b06695cb5','ed51f193d7cb9ca22c3b255719b4ef27509b2947',0),(3588,1391214973,'9d84e3459381e939f082e04cafc2014b06695cb5','3f5c6a09a5ca79a03f4e2d8a097950eb018488a7',0),(3587,1391214968,'9d84e3459381e939f082e04cafc2014b06695cb5','82ba375a490148cd8090fddae9e9e1427f1227a2',0),(3586,1391214968,'9d84e3459381e939f082e04cafc2014b06695cb5','78ae7b36889b2533fcbc10b48a68b3219bed171a',0),(3585,1391214954,'9d84e3459381e939f082e04cafc2014b06695cb5','3a209d0b0acacd27b553b1716bfbad6280656a86',0),(3584,1391214954,'9d84e3459381e939f082e04cafc2014b06695cb5','11030b7e3f1fa494d7bcb36b46f4771cb7a9a5c5',0),(3583,1391214953,'9d84e3459381e939f082e04cafc2014b06695cb5','4e25685235f977f3d01efbc4b7a7728eeb5aa9ff',0),(3582,1391214953,'9d84e3459381e939f082e04cafc2014b06695cb5','38f7a682a5a1b74d6bbf7c27714602bd83c35a1b',1),(3581,1391214951,'9d84e3459381e939f082e04cafc2014b06695cb5','ca4e7e4a27a3589fba4b3cf9a01c60a2df78a79a',0),(3580,1391214945,'9d84e3459381e939f082e04cafc2014b06695cb5','d588305f22195b0c967408d2fca5df97650c567e',0),(3579,1391214426,'0','053b28877c8a78a95b9d4ba23b395d23888c9fba',0),(3578,1391214356,'0','91c42f5e391c504367cc6939c28a5162e2b72d2d',0),(3577,1391214355,'0','4c5969421a33d26abacbb7d9786e215937b50696',0),(3576,1391214314,'0','76490fe83a1ea24ae2dcd9d1a93d8374a0c6df40',0),(3575,1391214176,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','06730fb2c9e52c3bc49f5d3dd882ea9abca2cde7',0),(3574,1391214154,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','04759f62d36a1e28af8cf4b90c5fe8efb850630c',0),(3573,1391214150,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','bfdb6a6d7c631d83cc28aeee98a6f7ba0949ae48',0),(3572,1391214146,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','78ce7d85fffd023d2bd9d57c9fb618b0bdfd7ed3',0),(3571,1391214097,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','138b37cf79df1d48c818d481616b8a064f8e195d',1),(3570,1391214083,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','2296720466bc283e9f1bc29829de94146affb517',1),(3569,1391213975,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','c3bf7a24ebe7442261b56a240964b5753d0fb549',0),(3568,1391213972,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','8917bf98d63673212edfa462265f1bae3916917e',0),(3567,1391213967,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','5b7c6f9db62fbf7458ea586d4c63c9d15b2002ff',0),(3566,1391213963,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','42d783974c89c40395c10b883e5ea908cee6311c',0),(3565,1391213955,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','e015b64d8372aa6d7af3bc57157192a16fcc07fa',0),(3564,1391213920,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','a9812e236073b3f9ad29326e2f445eee15724a44',0),(3563,1391213845,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','964163632c07cbcdbfc2ba696b089a72eb3ef79f',0),(3562,1391213807,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','89fc1740ba6c1a8f9397f1ee2e472e02ac8d0fa6',0),(3561,1391213800,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','e518364958f744877d4f25f05bec4094e4e37655',0),(3560,1391213771,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','4417e31ba79d70e0201df165322e79c7bc9698b7',1),(3559,1391213647,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','9982ebce4219e3601a4fc15ce905e3337f113025',0),(3558,1391213495,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','3c8d17997aa6cdb452c49c0c09926ab8f55e6f92',1),(3557,1391213494,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','f46bf12f903a279a1523b7119a2b0af023613045',0),(3556,1391213494,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','52e0a838e4560a9b9cbbc33a907de60e22d5e03e',0),(3555,1391213494,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','8361a677e48e23b1ab26d430d611ca6d6b58a5bb',1),(3554,1391213484,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','79ac572c29fab127d621bf5bd87a6ecd1c866206',0),(3553,1391213404,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','6dc356c2d8f11b79dcb7df82f9322f8cedd4774d',0),(3552,1391213404,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','0e6353337038edb60feb95689b39b19a6b65275d',0),(3551,1391213403,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','8a697a73bb92a2c3cd226eb094c39e87a10e9483',0),(3550,1391213403,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','4c8066e84bbe93fa36483d6f4181f04c6b79b5d4',0),(3549,1391211972,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','702e2e6e990583abfce5ecd4c307416cec4a426d',0),(3548,1391211972,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','eb3f50649e219af40d6bf1ebcb48ad7d310eaf27',0),(3547,1391211972,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','9f0f3bffc1c87c1d73a194c076751ccac70b56e0',0),(3546,1391211971,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','92ba2b35c3548aca9852dada4113a7d67f84c643',0),(3545,1391211581,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','518a949dd3d0db95a972758569cf2544ecfbf861',0),(3544,1391211449,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','7b8f69847e7e963e515cc97c4e5b0eff060f8f49',0),(3543,1391211449,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','016dea1259d13cc24b632b5eb3b737dae319fe45',0),(3542,1391211449,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','9d371d1ebc6cdc3357be57d3d4abcfb072ad3376',0),(3541,1391211449,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','3758ead768aef3bc128dfad5d023ad65e060dc8d',0),(3540,1391211422,'d014dfc3c56b2e3b0793fc817c770d5a25b4dbca','ca0a95d69b5050fed6a5d7f90697e2cec3a9b22a',0),(3539,1391211422,'0','9e3224743c0465c3fc29423deb53b1fa3c607f8d',0),(3538,1391211412,'0','e7148afc1ec8923f829d0fd98ec675414bb0e3e1',1),(3537,1391211412,'0','6b1ae6163cb68c8778f81027e6256dd157b9044b',0),(3536,1391211411,'0','1bc7a355c66a95df9ee683db272db9a4470751cc',0),(3535,1391211406,'0','bd8f2a362c6c9f773ba7185e9c716980b7d1e695',0),(3534,1391211406,'0','d722d1e450829da0c5ce61cb06220c1482423565',0),(3533,1391211405,'0','a191a458b85b4ffdd81f489d7815cd22cbfbccb3',0),(3532,1391211079,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','2422d9da60fd846e1f2bc6e6078bde858eb785d0',0),(3531,1391211079,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','1111e715904900f781179c20354d6b4d588f4b5c',0),(3530,1391211078,'0','2e9922c72b7723eae817061b3eff76b18d642236',0),(3529,1391211078,'0','845f70cc1a05d69ee42719bffc91625ec3c34e19',0),(3528,1391211078,'0','2fb684b1aed2f71aefa892b16e514ed39c013932',0),(3527,1391211074,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','db413f2b9f0fd5fc873e1738b75df77680e6174e',0),(3526,1391211074,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','3408967d7c19b6740ded9320812309c6ccb64dbc',0),(3525,1391211074,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','a9cb60a08af9af7cc1c712e7e94833eae08fabfb',0),(3524,1391211069,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','49ecce2f94a5e5910aed74d66ec6f2a7fe6d6c7c',0),(3523,1391211068,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','dfd1b139e941cc1f9f836b0690668a5e37f47af1',0),(3522,1391211059,'0','19a70bdc239ec8aab01035d3fec258f4f06b8c38',0),(3521,1391211058,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','3d2dc905706aa7b4bd2b0948edab9c109b456e40',0),(3520,1391211058,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','5e29bd37bdc01f987cfaf4a41ec8a240fd5d98aa',0),(3519,1391211058,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','22499e4d1640a0861a50fd1883111ffa78cec839',0),(3518,1391211057,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','0405a90ef22bc8d6c9698cb67876e1583d230191',1),(3517,1391211056,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','dabcdd48bf4898bb8baae4335db3e2689c96dd15',0),(3516,1391211049,'4f71aba90eb449fc41ad56d83b1ad8474ab086a4','b4e96ffcda97fc61c2fab2b964d32ad7c78a1159',0),(3515,1391211049,'0','2751a963331e192321748a515c0aeda20b50fefe',0),(3514,1391211048,'0','5cbb47a31fe410f0f7202462947fb0cebd620052',0),(3513,1391211045,'0','1ca17af07dabfccaa8246bd4b1c2d1764606494d',1),(3512,1391211045,'0','70cc1efd56a349fdc84912e8fcd9b9a107540f3e',0),(3511,1391211045,'0','2ed72fc381a18a9096f8f1536b109af9e5f07d31',0),(3510,1391211041,'0d8b79c57f674a0140dff83a5d649d8933ea0206','6bcd45c070675d31c71b85b809fb337c579fb876',0),(3509,1391211041,'0d8b79c57f674a0140dff83a5d649d8933ea0206','a9289ee4800faa733d604cd91778739fa7cba0a1',0),(3508,1391211041,'0d8b79c57f674a0140dff83a5d649d8933ea0206','14c2c18941fff478a905cc37bc030968ce7c1f68',0),(3507,1391210764,'0d8b79c57f674a0140dff83a5d649d8933ea0206','7c6ff903c9ae8fe155e5ed4c71b56ce169f5d32d',0),(3506,1391210751,'0d8b79c57f674a0140dff83a5d649d8933ea0206','0a234a8854035652a6b3808f1e1edfe05532029b',0),(3505,1391210639,'0d8b79c57f674a0140dff83a5d649d8933ea0206','86a3e781474d17a5179f242bec8e66c04f4631cf',0),(3504,1391210639,'0d8b79c57f674a0140dff83a5d649d8933ea0206','f5fa4c06ddf02939cdcbc80a1c0789c57cea6990',0),(3503,1391210629,'0d8b79c57f674a0140dff83a5d649d8933ea0206','fa41a974f79641dc965e635adb462923301dc480',1),(3502,1391210623,'0d8b79c57f674a0140dff83a5d649d8933ea0206','15dd4f56bee7f2e777b064b299daa7bf4c5981ef',0),(3501,1391210621,'0d8b79c57f674a0140dff83a5d649d8933ea0206','5e6a761c03c6d76c49a96778d7c008cde9d29b1b',0),(3500,1391210621,'0d8b79c57f674a0140dff83a5d649d8933ea0206','b3945de0053bd90e4db7706393c7400f91412469',0),(3499,1391210602,'0d8b79c57f674a0140dff83a5d649d8933ea0206','4bf546072d9bdb0423d884de2f6b85217f544439',1),(3498,1391210596,'0d8b79c57f674a0140dff83a5d649d8933ea0206','bce7578cbd0129d5811b3eca9de93caaad2fda39',0),(3497,1391210594,'0d8b79c57f674a0140dff83a5d649d8933ea0206','0753e9794305c8ed1d3192e964c17982f456839a',0),(3496,1391210583,'0d8b79c57f674a0140dff83a5d649d8933ea0206','92bf5e99ddb99130c41934467c86255d31db02f2',0),(3495,1391210578,'0d8b79c57f674a0140dff83a5d649d8933ea0206','0a856381dce2ab5419968a41c5fbe16d41cd5b36',0),(3494,1391210574,'0d8b79c57f674a0140dff83a5d649d8933ea0206','39545d94a465a8ade7c726c09470e3ce50095d35',0),(3493,1391210574,'0','62de1a9d0c605ab775610b7f51523c3eab93b1ba',0),(3492,1391210566,'0','438a907d0c095a22b5f044a77b56a40fbd608692',1),(3491,1391210566,'0','aeeb51d913122482fbf3ab1e0ff43fce2b92c16e',0),(3490,1391210566,'0','c5c9c509c2ec553be8624f66150acb24f1c2c390',0),(3489,1391207433,'0','e17da5b5870634667507fd25c5e09053d5404b9b',0),(3488,1391206050,'0','76116271e3add1f97b62da7a64db9da642873888',0),(3487,1391206050,'0','7007be4a50c88b7b2c6efce278852551f5813f0e',0),(3486,1391206034,'0','7120b120be509db984cbe59c78614504e4bd8f3e',0),(3485,1391206034,'64fcce012a2ca671aec570d552aa92c5863d5f75','43d007dd1ea374d27a804a4e8284e6c6b6ff154b',0),(3484,1391202818,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','0cc3b0b629cf7b790f691cd56c38b6664b506a3b',0),(3483,1391202817,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','33ebb44bebefd8d27bf5a939cb24bd03b9ae5c41',0),(3482,1391202747,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','9170646b6f6d96206d67233a599c4ae691ddd2ae',0),(3481,1391202747,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','9b7722c8b5e553527caaae913d3c7df57c533247',0),(3480,1391202746,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','1337f709ca23ca27e77035c115ea0edd3406da37',0),(3479,1391202107,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','5062c3c99d7227671d7ac2a48a34f3cceeece01b',0),(3478,1391202107,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','55065c647b23001cc442dcfb4545418a43101879',0),(3477,1391202106,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','51ea234c8204676ae3cbe2cf1bfbc9a81622c18a',0),(3476,1391201979,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','dc00dd31cb2ceb747b9e5d763259f2e137f17998',0),(3475,1391201973,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','9d5c130d8203f8b8228877a007afb031e83bff9e',0),(3474,1391201973,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','151616d5eb85cce5991162e9d1ffde54b74592f3',0),(3473,1391201599,'0','23176f5e8443e2b1282fdd7e3584ffa850e07c5b',0),(3472,1391201599,'0','6a52d8db3329f9a92af6067f7899f040e58f232a',0),(3471,1391201583,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','256d8339606b0caa1e9ad03c65caf14fa01fd953',0),(3470,1391200524,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','0074e20bd174401b9bf0f307495ead0449e2e6b7',0),(3469,1391200524,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','339eed80bd5df2cff6cb6efccff7c5d0ec3eb082',0),(3468,1391200523,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','0650e09c6f65d44d78bc23ea29cd1c3daf19daa0',0),(3467,1391200523,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','4a942bacd656c7ccb84d7ac57ab0d08c6d3f88ea',1),(3466,1391200521,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','38e9f4ffd40c9e7da1e8b56ba63e462df8f43ef3',0),(3465,1391200509,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','fdead7f07814bb32897d92b1ea20985ef398a2b3',0),(3464,1391200509,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','a15b16c02d8da879685952a3ec0e6420cc75a9d6',0),(3463,1391200509,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','b2230bbc7dd5516088187a4ad1aedede3cf45baa',0),(3462,1391200508,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','591bc060f31fbf6febac3ac781b461ced8f0bfee',0),(3461,1391200501,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','5a6b0ce66e9b9adcdb883f777f75ace6b2743fb5',0),(3460,1391200501,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','213ab763eff34f2cb8c75baab14b6eeb165c956c',0),(3459,1391200500,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6280d5ff5fca8918c7296a879e44a9b0cb065a33',0),(3458,1391200500,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','bda2dcf040282fdabbb6269b468c515245c0d48d',0),(3457,1391200481,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','b181f19e5661bc09134263a41b73692852b2b2a6',0),(3456,1391200481,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6863deef361d8716770dfa44476e14dd831df558',0),(3455,1391200478,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','8cdbbc7b2071107e531768fb85a59531cbd37d37',0),(3454,1391200478,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','357955b8439a434f07f4bc406aa64ff2a688f2e0',1),(3453,1391200475,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','03949fe8e98849ca25ac9345679523853c676d73',0),(3452,1391200463,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','61aa8ce69f4e7dd87c9be325cd412a0e53013b1c',1),(3451,1391200442,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6a06baf85d52eb6d8e5ef17d1567d014f6f89b5c',1),(3450,1391200438,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','3953c56efd27b5d73de1a6ea6005a9e2ef5641a8',1),(3449,1391200434,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','395b31b6163d74a0a00111f128e5a5eb5d44f87c',0),(3448,1391200434,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','bf55d71a04b2bef6880faa87cfc8908a4a6ab8ad',0),(3447,1391200433,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','7ee1d4c2bcf9bc22b803c3e0acf05c28214838d8',0),(3446,1391200433,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','3dc57cd5aebfa50efdecd5a8ae935a06677a3553',1),(3445,1391200431,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','dd884bbf55162046c8da69d65280bbdd5e19def6',0),(3444,1391200430,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','18a8b342ee04066ca78f9ecda10ab11ff8dd4437',0),(3443,1391200422,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','6e7e5fac34caed40ac5e7cdae5e54a0d6770c6b1',0),(3442,1391200422,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','fa0dfb962714cb65076e6eb627f9be85e3b31acd',0),(3441,1391200421,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','387ca4b578f93142967cf39422141bd097f08ff2',0),(3440,1391200421,'1896cb1169a98f13f21f8761618e11fa1bc8ee4b','df0dc3573ccff2c8c30f34b10ace88b57ba562cb',1),(3439,1391200299,'d7f587051b3dc136c5648dbf60f721c2706f38d0','83974dfc600d725dc3e9bdda123b8550cf74bc10',0),(3438,1391200288,'d7f587051b3dc136c5648dbf60f721c2706f38d0','bf12374f24d32ddcc82d337d5df087767731171a',0),(3437,1391200288,'d7f587051b3dc136c5648dbf60f721c2706f38d0','23947f260c19cc73f74b8acc653c7118e30d1b7c',0),(3436,1391200239,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6533e1daa914617f6cddc33fbf29d921f9660aa1',0),(3435,1391200239,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a6b4805db3d965c21c99779671a062c14be6f7e7',0),(3434,1391200238,'d7f587051b3dc136c5648dbf60f721c2706f38d0','dddb059156f80b6a5e237367ceb340a5cae287e4',0),(3433,1391200238,'d7f587051b3dc136c5648dbf60f721c2706f38d0','d6b1fa2cd1707b090cff73b822aac9b7049509a1',1),(3432,1391200236,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e9fc1ce31296980717e147d4137771502f4febe9',0),(3431,1391200223,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2bf8dde72340bea4f50b733145778ad428846d7a',0),(3430,1391200209,'d7f587051b3dc136c5648dbf60f721c2706f38d0','b9a13142020579f5ea061599f5e11ed4a2dd2c4e',0),(3429,1391200209,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7a681d425e6a42bb305522d34c00e76cc85efcb2',0),(3428,1391200203,'d7f587051b3dc136c5648dbf60f721c2706f38d0','b2d3da8cf10b69f58987e9c0d288635ba0a0cc9e',1),(3427,1391200203,'d7f587051b3dc136c5648dbf60f721c2706f38d0','70e917a0bb2fbfb8455810d89ebea3015eb93aaa',0),(3426,1391200196,'d7f587051b3dc136c5648dbf60f721c2706f38d0','f3c9ec7ee3d5babf2dc9cc8115c03487829b8971',0),(3425,1391200193,'d7f587051b3dc136c5648dbf60f721c2706f38d0','615cc4e46f90e7a04defaaca05de2fa348c7ea19',1),(3424,1391200188,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6d3b8d63320e4d473cb9c01172f39d5f9f764395',1),(3423,1391200177,'d7f587051b3dc136c5648dbf60f721c2706f38d0','8c85321bf7e71cdae764a588b029d6dc49d55d63',1),(3422,1391200176,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e0190f74c0e270a069fc0e875fb5d24fb87bc4ae',1),(3421,1391200160,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5f31aa0d4c9bec614ecd3823d820c77f8b431791',1),(3420,1391200096,'d7f587051b3dc136c5648dbf60f721c2706f38d0','acd15bcf1f3f35865d63ece3e008053c031b7673',0),(3419,1391200096,'d7f587051b3dc136c5648dbf60f721c2706f38d0','995d522ac39b376b19b31ff2bdc0484ebc4ba28c',0),(3418,1391200096,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ed6a753071a97634942e6fccdcc590528951b5b3',0),(3417,1391200095,'d7f587051b3dc136c5648dbf60f721c2706f38d0','0a8bff93ad419107bd2f97f888992538595f023f',1),(3416,1391200088,'d7f587051b3dc136c5648dbf60f721c2706f38d0','10be5c482ea10bf768193d84a6a00939a9a07b97',0),(3415,1391200080,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1d050414d5c144931635f79bd1003b280092763b',0),(3414,1391200008,'d7f587051b3dc136c5648dbf60f721c2706f38d0','da2f7b6c577b696d38504bef0f453c9fb2547465',0),(3413,1391200008,'d7f587051b3dc136c5648dbf60f721c2706f38d0','0d0661a42baf3696250256ec11953c4f2f4f71b1',0),(3412,1391199947,'d7f587051b3dc136c5648dbf60f721c2706f38d0','50869a65695bbf18e49ddef9f9b5a06cea643761',0),(3411,1391199947,'d7f587051b3dc136c5648dbf60f721c2706f38d0','77c1f38418d4e2265f4cd08e0576ebc69857e594',1),(3410,1391199945,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e95390bfd5ee1933c1fe5b82608060c20f92ce36',0),(3409,1391199936,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1491e02888bc1e7dd71661e84848d01d0494a197',1),(3408,1391199933,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ce70a08fa41d6aeb15ce903c6741e45b85c385c2',1),(3407,1391199933,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a8787a621cfc1dd7eaee0603f0f34832f25de67d',1),(3406,1391199933,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e2ea0157dba2ac271e0885074462a124f41c6f24',1),(3405,1391199925,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1da2614b084c27eaa797b1f5382fc85cf4b208aa',1),(3404,1391199846,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ef38b62f88da33d18cef2aedf24982b0b4828a55',1),(3403,1391199846,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2c9062ed35291421a3d30f3ef76adbc3f42151db',0),(3402,1391199844,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7e09722bf2e62d540138bcaca6f42b11608c9316',1),(3401,1391199844,'d7f587051b3dc136c5648dbf60f721c2706f38d0','3aa70cabe93e2fe10006375a87eccb617c9319bd',1),(3400,1391199844,'d7f587051b3dc136c5648dbf60f721c2706f38d0','12fac90ac5a78771bf825682d6bd4cd94c6062f9',1),(3399,1391199842,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2b8cce5376c38a4a13425c2366a5588fccf5c616',1),(3398,1391199839,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6395d2e4b14f6bc2c7ca8feb4f466a57b478091d',0),(3397,1391199839,'d7f587051b3dc136c5648dbf60f721c2706f38d0','53324520003f2dc69c988c6887a7762d88c6998f',0),(3396,1391199839,'d7f587051b3dc136c5648dbf60f721c2706f38d0','0151370c214a84989904e4315f8314fcfd52f3d6',0),(3395,1391199838,'d7f587051b3dc136c5648dbf60f721c2706f38d0','f553e2cb5aad9a0eaebaa04180a3fca3cee797f9',1),(3394,1391199835,'d7f587051b3dc136c5648dbf60f721c2706f38d0','59daf507923f45534a9c5aecc9cbecb4058d16d3',0),(3393,1391199835,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1ecc1461dc5c51886d55444e85af0745a42167d7',0),(3392,1391199832,'d7f587051b3dc136c5648dbf60f721c2706f38d0','9061fa9dcee78af5de85c0f9af1ad6168009bfb8',0),(3391,1391199832,'d7f587051b3dc136c5648dbf60f721c2706f38d0','793f32831ce9255b6e58d41e63155812586b256d',0),(3390,1391199832,'d7f587051b3dc136c5648dbf60f721c2706f38d0','06de2007766129c75dac051befd63d1ede0b4b9a',0),(3389,1391199831,'d7f587051b3dc136c5648dbf60f721c2706f38d0','8b0c5defcb4138f2f23aa9215d13a5f36e4d338d',1),(3388,1391199827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5ebc7ea47a9c6d58a128239b8bbfa076c633c94c',0),(3387,1391199827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','8e357fbed1606d448686b6906a9bf8b9a418f7c6',0),(3386,1391199721,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e7fef6d90ec53c8c28304355c28eaa737ee9f55d',1),(3385,1391199626,'d7f587051b3dc136c5648dbf60f721c2706f38d0','b19c4ae1f30b0c5c2f7746830ada9561020f54c0',0),(3384,1391199626,'d7f587051b3dc136c5648dbf60f721c2706f38d0','4fd5e464e5497fe88e39e49ff74444f2979b89fc',0),(3383,1391199626,'d7f587051b3dc136c5648dbf60f721c2706f38d0','2911a6eabb6b4b130fc7575cfea871eadcacab7f',0),(3382,1391199625,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a73b654f77efa08ae851831d6f94a98f9b264b53',1),(3381,1391199602,'d7f587051b3dc136c5648dbf60f721c2706f38d0','cedf46bbbc4a13789b5d75320eba938f0c8ece25',0),(3380,1391199598,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7e999e6947ff6fbb92541e50ec1cfd6231fb78dc',0),(3379,1391199572,'d7f587051b3dc136c5648dbf60f721c2706f38d0','98ca83375950300f53faa0b32b092836ef4997d5',0),(3378,1391199571,'d7f587051b3dc136c5648dbf60f721c2706f38d0','004154261400619e5e1f0166183b41df9c00802d',0),(3377,1391199571,'d7f587051b3dc136c5648dbf60f721c2706f38d0','cad19bbaedb3eeba3e228269eb20771f7ec793de',0),(3376,1391199439,'d7f587051b3dc136c5648dbf60f721c2706f38d0','846816573988b4ac2bea0eb9687ef1c25b2808a0',0),(3375,1391199439,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e87ec383f0809ef410b352edfdefc7dddfd830b4',1),(3374,1391199395,'d7f587051b3dc136c5648dbf60f721c2706f38d0','cfb8890c96c537b7d2802d5044eb70275ad4cfb8',0),(3373,1391199384,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7c1e9c8c59586103877d2896fc28635c7fff6e13',1),(3372,1391199382,'d7f587051b3dc136c5648dbf60f721c2706f38d0','4e13323c658f611c36e83a445a5595cd890c98cf',1),(3371,1391199340,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5099a454866c4a8c415a631a882f4d71de176092',1),(3370,1391199332,'d7f587051b3dc136c5648dbf60f721c2706f38d0','01d6bd41e3f1e025836b168d461dfe99e9844de6',1),(3369,1391199332,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7707c89e3b51afac2e49040d33ed6e6b419dcabc',0),(3368,1391199329,'d7f587051b3dc136c5648dbf60f721c2706f38d0','67cd2ae2c65ce5e0c2af46f7a1ae8fc5a3540986',1),(3367,1391199329,'d7f587051b3dc136c5648dbf60f721c2706f38d0','887f0574338b44785ab849d184a7993dad1d2805',1),(3366,1391199278,'d7f587051b3dc136c5648dbf60f721c2706f38d0','d6e94951d2500b8c34c85c11b11756c80ffcbe29',1),(3365,1391199224,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6531d3af71e264a7b4b6a31db56f4a6fc27e4061',1),(3364,1391199220,'d7f587051b3dc136c5648dbf60f721c2706f38d0','d8ed3daac073361ec9affaa1567c3796206af85a',1),(3363,1391199167,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','3222e561447255d9984b9e69fc146ae7f46bcd27',0),(3362,1391199167,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','437882cc618e0765ca8176bd800c3c929998a8e1',0),(3361,1391199159,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','59f7958f8c56c5ecdc512d19f5c254a4e8074bc7',1),(3360,1391199157,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','a63c4dc55de0ba5432829f51b441cf878f69b965',0),(3359,1391199151,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','14da7fea546f02f33ee44737069b5848ce7f48df',0),(3358,1391199151,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','9ace94fd4a7c371fc271cf4d7545caeffb90545c',0),(3357,1391199110,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','e3706b7d94ef1c8deff33c0503696202143b4996',1),(3356,1391199108,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','5346966c2de9bc777826ed6d19bd0e7c025e938e',0),(3355,1391199105,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','995a30c278ec8141a03e5a1909932d36c6717dc0',0),(3354,1391199105,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','6ed3362e35bb6102be078c65652f2356f5008592',0),(3353,1391199102,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ae7799b143e7e87e7c4d53c3cbaa46181104fe51',0),(3352,1391199102,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a9fedbe92353eb7616adb978dec76d8a219ca984',0),(3351,1391199101,'d7f587051b3dc136c5648dbf60f721c2706f38d0','06d944dd78736a4329fc8e8f9587a02d6cd3e2f6',0),(3350,1391199101,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','69d41bd3a58655c5bd765b8d87d64196003f8184',1),(3349,1391199098,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','8cc351ac18a7b06f9a8f3f87a88f81ca41d512c8',0),(3348,1391199091,'d7f587051b3dc136c5648dbf60f721c2706f38d0','453c74d93d1d48847e6eb956b2e7be352a617229',0),(3347,1391199091,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ec0f263c4e24546da78d80a79cc03fed8d46ea43',0),(3346,1391199091,'d7f587051b3dc136c5648dbf60f721c2706f38d0','73df44e7a1725b7dd5fd51596ac68e538ac1a439',0),(3345,1391199090,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6638f5934735f3a0d174deaa92b2a9cbbb79ee91',1),(3344,1391199089,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','13af1b0f49176a17aacc4b93955a69491f4d4b48',0),(3343,1391198689,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','9b4a3269f0b1aa9bc3eeab541628d522e61ca6b8',0),(3342,1391198685,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','38ceca4d3cf34bead139694e6b2f5463f79c7538',0),(3341,1391198523,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','777af0c81d1a081c62a2657697e1472fb9bc87e9',0),(3340,1391198207,'3e32bf22558902faadb2b3f5a5985d5c0d4d4205','4077f7a453ebfd863dd2c3b2c8e344a23064b996',0),(3339,1391198207,'0','d470760e756f53ad1cc05b6375a10bd8f60acb05',0),(3338,1391198065,'5e3023664d63bd40107a00008b2b9fbd175953e4','6d18f21543b7fd8f86aa167cbb167cbab67cc136',0),(3337,1391198055,'5e3023664d63bd40107a00008b2b9fbd175953e4','e8ec092fccbd9193028373d7f14ea073e0def367',0),(3336,1391198055,'0','d501e67b7521289d54b1465063417e06b33797c7',0),(3335,1391198038,'0','8373878c3463f5fe2068505cf64ad0506755b761',1),(3334,1391198038,'0','37e0a2ef195ea704757db64f34059eab273c8642',0),(3333,1391198038,'0','ac6cfe48e1b483ad38ceca04051c598110b27f37',0),(3332,1391198037,'0','6eaa1113dc8a1a5362821a01b17de25a37e3c972',0),(3331,1391198037,'0','148ecbd098b05a8dda1355243fffeeb6bcdefd66',0),(3330,1391198036,'0','8e134efc633421fd42ad0c89b337281635590465',0),(3329,1391198036,'0','ee68ce51d123d6aae2518d6fa5d4e8e963bb05f8',0),(3328,1391198036,'0','369336527147c755977027cc901d525305e570eb',1),(3327,1391198036,'0','73eb03970ae12c50af00632ce3e27d3123a82266',0),(3326,1391198036,'0','fd81b7abb289ea9b4dbe8926a055fc336062025d',0),(3325,1391198036,'0','7bb03358e0bc93a4bacaba6398eb12a7326a89a1',0),(3324,1391198029,'8091a16cf1ed7501dd6354382f176888d62bab5a','cfe37d8cb3ea7c6b4f925e43844b89a7c0bfd6b1',0),(3323,1391197592,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6a37e1555502c0d297d61bc9f169d992563e1ac1',0),(3322,1391197592,'d7f587051b3dc136c5648dbf60f721c2706f38d0','c22cc83493717a8bf279845f64955e5ac37aa6d8',0),(3321,1391197592,'d7f587051b3dc136c5648dbf60f721c2706f38d0','f6e98efb5e46c539824f777364f6adcfcbe6833c',0),(3320,1391197590,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5b7e2a1f20472dfb6b0e0b716921fd13c38a369a',0),(3319,1391197585,'d7f587051b3dc136c5648dbf60f721c2706f38d0','9c575df0d8c37ce673621e02e59a41c1afa1a6c7',0),(3318,1391197584,'d7f587051b3dc136c5648dbf60f721c2706f38d0','77b884c9e01094cef616d03ad93f5d6fd68d51ae',0),(3317,1391197569,'d7f587051b3dc136c5648dbf60f721c2706f38d0','e3b1162adf4c2ede3de4eb7ca312de802e00e06d',0),(3316,1391197524,'d7f587051b3dc136c5648dbf60f721c2706f38d0','13d661bcac93ed9128348a8121e8dbe9291e21c6',1),(3315,1391197485,'d7f587051b3dc136c5648dbf60f721c2706f38d0','c8abca17870b3e47894859438bd2eadb6ea31b26',0),(3314,1391197485,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5e5574d6583d38c53584cedd114748679e8d6a6d',0),(3313,1391197485,'d7f587051b3dc136c5648dbf60f721c2706f38d0','98cb3d07c6f0ed497d8b41ce069c1d95f776a34e',0),(3312,1391197484,'d7f587051b3dc136c5648dbf60f721c2706f38d0','a0b8d6f92bf53b002891c22c1382c91e969fed5a',0),(3311,1391196827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','abd3ea83b654cf44d12db927b8990a54dfe7baf9',0),(3310,1391196827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','ccfd2cfe58374b1e7516c2ea3a11b7dc2cfa4788',0),(3309,1391196827,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6e2e56caf87d472b662df8df0f72e8d4060d0740',0),(3308,1391196824,'d7f587051b3dc136c5648dbf60f721c2706f38d0','167b139973af662fdf20ea22ccca6558d075dd8e',0),(3307,1391196824,'d7f587051b3dc136c5648dbf60f721c2706f38d0','6e4dcddae2783cc523c3c0668bec5d32f93b5a60',0),(3306,1391196816,'d7f587051b3dc136c5648dbf60f721c2706f38d0','32f6abe70d8efbc4e7a00de60ee98bfc6866596a',1),(3305,1391196816,'d7f587051b3dc136c5648dbf60f721c2706f38d0','1754a13ea290323c3d5934f38f4bfe6005fa3260',0),(3304,1391196813,'d7f587051b3dc136c5648dbf60f721c2706f38d0','abd7486c6bb665c4e5eac159b1b63f632d930a79',1),(3303,1391196811,'d7f587051b3dc136c5648dbf60f721c2706f38d0','3fcba3dc51e67719f0025662fcbd6f2b5307095b',1),(3302,1391196795,'d7f587051b3dc136c5648dbf60f721c2706f38d0','7714f4f227b20394fd863da07cdcb33972bfac3b',0),(3301,1391196795,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5deaad23bc33f25d24dbc0655105dd76e92ca339',0),(3300,1391196795,'d7f587051b3dc136c5648dbf60f721c2706f38d0','935123c526aa6067366055e48ab10734200eb176',0),(3299,1391196793,'d7f587051b3dc136c5648dbf60f721c2706f38d0','c8701330ab9665bcf3794709d4adab2caa0e1e99',1),(3298,1391196791,'d7f587051b3dc136c5648dbf60f721c2706f38d0','5f80c50efe74b94a2101fca393a6c77e98bb6443',0),(3297,1391196783,'d7f587051b3dc136c5648dbf60f721c2706f38d0','eac2d4ebc56df5d87e4ea8b46ab56c875ea12fc7',0),(3296,1391196783,'0','c6a32d34daf04978bc1abaaebf96bd00cd90b5d4',0),(3295,1391196775,'0','06ae6406dc693a3711778bd3862151a37401b8b3',1),(3294,1391196775,'0','067c656f5ddc721776a05b49335e905af8329e15',0),(3293,1391196595,'0','a5b0ec7c3fb97dd5a149b49c82054ae1c6c66859',0),(3292,1391196595,'0','01501f7ac208958c39995bd9b2105baf0de65fb6',0),(3291,1391196594,'0','84c6aee938a2d45f18ce94baee6819a103c28b34',0),(3290,1391195462,'54d3cf74f6074c173350cd25145291b7d0b6cab0','433498872fb7ad77f84d6695c31c973762f5bc70',0),(3289,1391195461,'54d3cf74f6074c173350cd25145291b7d0b6cab0','106d846e9563652a4f1819507ffb9f5fb30ddba7',0),(3288,1391195447,'54d3cf74f6074c173350cd25145291b7d0b6cab0','77d0e4cb380e6e9cce2a7012aa7c1cf1195390ff',1),(3287,1391195445,'54d3cf74f6074c173350cd25145291b7d0b6cab0','5a406c8b79e48467cb6bda9752fff06e1a42b4b2',0),(3286,1391195444,'54d3cf74f6074c173350cd25145291b7d0b6cab0','e3b1607c9af48af8efc02470458cf05fbac8af8b',0),(3285,1391195368,'54d3cf74f6074c173350cd25145291b7d0b6cab0','c558ec0da4646df707403cd9a36a68cf34e95c8d',1),(3284,1391195364,'54d3cf74f6074c173350cd25145291b7d0b6cab0','9c1e2ac05f110d4a22d620f5a15666755d28b132',0),(3283,1391195364,'54d3cf74f6074c173350cd25145291b7d0b6cab0','f72874296e5d0c0645be47342d3af8e60ce1bcbc',0),(3282,1391195331,'54d3cf74f6074c173350cd25145291b7d0b6cab0','2fbac08505b28896f3c375e658a5cc82047f45e3',1),(3281,1391195320,'54d3cf74f6074c173350cd25145291b7d0b6cab0','75f2f52f8f68925b6c0ceaada323383d75cfabb1',0),(3280,1391195316,'54d3cf74f6074c173350cd25145291b7d0b6cab0','d1cb4331347285e4e8fc6a6e21f2927487dacb40',0),(3279,1391193924,'54d3cf74f6074c173350cd25145291b7d0b6cab0','7f489a876bfc27c78655e2a7fb33a9f53f2dee0e',0),(3278,1391193919,'54d3cf74f6074c173350cd25145291b7d0b6cab0','7f3d785cc9775cbfabb3d1502c2248fd3fe6382d',0),(3277,1391193919,'0','0ae929681d6b786f4962734d09f8a7fd454b4ab1',0),(3276,1391193915,'0','a24e68e929ce71b65daa5b03b1977e2130bd1eca',1),(3275,1391193915,'0','d697f51e0e449277b7f1d1a967053286560b7fc0',0),(3274,1391193915,'0','43fa57351ff9315e412195092b765ef0da3f2efe',0),(3273,1391193913,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','057a79c10241bdacdb133aab5ef8d32a41c9ec9c',0),(3272,1391193913,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','bcce5ad755bb8dcf1667f4a3bcbae37c9d2e9f21',0),(3271,1391193913,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','33c2db924dbaa8966f13686bb299a1f3925177b6',0),(3270,1391193121,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','6cc8c7687abb9eb5ea12f2f80db21c8203a1d12c',0),(3269,1391193121,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','624331fe43b47648e19d8be5053ad64cfa1822dc',0),(3268,1391193107,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','194ddffb0f58850e1c8b34168c08c1210f107414',1),(3267,1391193105,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','a8fb8456ef3e9f393e996f957a200c3b6e77f452',0),(3266,1391193104,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','edb57301cd1196803eef1074b02d31f232fd81a8',0),(3265,1391193090,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','7162df1876c52f54d4c4b9639dafbd3d57316206',1),(3264,1391193079,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','f22bfc18429943f032ea57516db17b37ea0f8343',0),(3263,1391193079,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','e8daef0d8c0b720150dad0a486c7657c6bba630c',0),(3262,1391193062,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','da91b672638563a4c7eb516913c8379df8277d4f',1),(3261,1391193058,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','46117f72eb990d40f438a61096cb99b6803a3455',0),(3260,1391193057,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','5fe623ede15057994c566af3c0029008456eb492',0),(3259,1391193034,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','8ca5fc22152e7c93c70af1ba1f0ef70f33bfeb3e',1),(3258,1391193030,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','d32b8ba851a4ecf9f191c8b50103105a367740de',0),(3257,1391193028,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','4d67955a38cfe9de82c716061d7b5da7b8c78577',0),(3256,1391193023,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','26c000c1964fb0db2799893c63d90135f36ff369',0),(3255,1391192642,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','03128ad84caa43039914050151f16d43ea8e9dcf',0),(3254,1391192642,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','3db2d8757aa222a00955aa5929c1d38b6b47a671',0),(3253,1391192640,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','a4518be904a9689e935d5e635adb56b230d43f57',1),(3252,1391192588,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','606a58fb8fcf370adc70b9b645b6be71232d32b8',0),(3251,1391192385,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','f6e7a0ab29c376c73ffdb2a99f321e343d481172',0),(3250,1391192378,'c4bd24ef3ed55d8506a6d9f34c6c341fe5c7ce9b','579804738d308c50eb62e192f93d168f3a0aad61',0),(3249,1391192377,'0','bc9b9d193a3e2dabb8040c14307f26db0d8ad5fb',0),(3248,1391192373,'0','54c29a9e9266f7c42ff6d2dd4f1bf1bdc07a4913',1),(3247,1391192373,'0','aa93dcc5a623d6ff5fd08757ec4ecb39cbbf1961',0),(3246,1391192373,'0','a7b5f4e135a9818fef91d8d0f6e8f794d88a42ee',0),(3245,1391192372,'5f36237394f9097011b40a0ee8e3a141c333de2d','12a495e4a16e50b8980578db8e728734560ad9d7',0),(3244,1391192372,'5f36237394f9097011b40a0ee8e3a141c333de2d','29eb7f146dc129ac01600ee7ff77723eb71c4e3e',0),(3243,1391192371,'5f36237394f9097011b40a0ee8e3a141c333de2d','2f3d11f1edddaf94baadc7a407a9a0c5f0da41b8',0),(3242,1391192027,'0','eadc6d891dbf50880b3a81b3cd98eba8d9e84933',0),(3241,1391192027,'0','96d92ea99ae7dc0095b546d2817f5f404bacb0b6',0),(3240,1391191991,'0','e789c9338ffe0035cb36f0ddd6459007180826cf',0),(3239,1391191991,'0','342b3f77969e1a796901c857d5f3916075f20b68',0),(3238,1391191988,'0','fbd748e45b6e4001fe6d2ab3315dd6ad05d0c1aa',0),(3237,1391191723,'0','1323b65e1ff2695a797331131bbd48637f5aec9a',0),(3236,1391191723,'0','887ac8f1d18f7918fae0f1aefa36463793b30afc',0),(3235,1391191722,'0','e7cdb6935d602095687eac5187844567ba396d8d',0),(3234,1391191712,'0','2feeb1c4c5c12f370b41ad89ef509f3836b34e95',0),(3233,1391191711,'0','7baf687db0247a2ccba53c6a4dfd1cfc76ff6d2d',0),(3232,1391191711,'0','609d4b875eaa5249096b1734c87e4e56f2ccd169',0),(3231,1391191710,'0','516e6221eb8bf5344a20df172b241ded5d98f602',0),(3230,1391191669,'0','9d81876374b288d54d90cbe22baf70f5adf8694e',1),(3229,1391191669,'0','329810b29fc441fcb46554e5602877c50d08d430',0),(3228,1391191656,'0','5ad9b6e2218f76e7fad37202c836ff60665ad220',0),(3227,1391191656,'0','c3dd3b08830e98e699ea71fa84cd0cff2d291db9',0),(3226,1391189737,'5f36237394f9097011b40a0ee8e3a141c333de2d','7930e64d78aa8b0b03e327f218453441cb0bdfba',0),(3225,1391189737,'5f36237394f9097011b40a0ee8e3a141c333de2d','e41ded502e183a88cd53c2b18e54da7faf336a37',0),(3224,1391189737,'5f36237394f9097011b40a0ee8e3a141c333de2d','88c11447a3e1a3c9a651b206420efff763e59de0',0),(3223,1391189716,'5f36237394f9097011b40a0ee8e3a141c333de2d','3c003d8b7c36af27de350125b468183f77b368a1',1),(3222,1391189707,'5f36237394f9097011b40a0ee8e3a141c333de2d','7aecf9d878ba50f95b1a2f94bd825555da9c8240',0),(3221,1391189701,'5f36237394f9097011b40a0ee8e3a141c333de2d','dcab265a7b473926b5a6888a6c4cfba8350165c3',0),(3220,1391189701,'5f36237394f9097011b40a0ee8e3a141c333de2d','47e2bfacf55fc4020bbb224a5a38f1b9110b4552',0),(3219,1391189701,'5f36237394f9097011b40a0ee8e3a141c333de2d','c1cac5e1b1b2c7d6d5fc701f48f3b9ab3329dcdc',0),(3218,1391189696,'5f36237394f9097011b40a0ee8e3a141c333de2d','5bcd1e62db668230e898805ecaf69f0fa1fbd8dc',1),(3217,1391189692,'5f36237394f9097011b40a0ee8e3a141c333de2d','a36c5c255f77e0a49e0df9ea9249306fdb1532c5',0),(3216,1391189690,'5f36237394f9097011b40a0ee8e3a141c333de2d','e46a9136fad7b97f6c96dfef24f0d4e59b19b935',0),(3215,1391189690,'5f36237394f9097011b40a0ee8e3a141c333de2d','f90194bb906e3232587f667ea35521c8b92e9dfe',0),(3214,1391189690,'5f36237394f9097011b40a0ee8e3a141c333de2d','51d6e12c65a8cd7b6eb5085c3abff19f57d8c9e1',0),(3213,1391189649,'5f36237394f9097011b40a0ee8e3a141c333de2d','253342c84a642a52c3d25d63638ed4702966afdf',1),(3212,1391189643,'5f36237394f9097011b40a0ee8e3a141c333de2d','0b828c1e00544a85da6005ccb0f10b5605e0b3da',0),(3211,1391189619,'5f36237394f9097011b40a0ee8e3a141c333de2d','429fb4549df76e8218f05d2ff9d205a8715dc08b',0),(3210,1391189619,'5f36237394f9097011b40a0ee8e3a141c333de2d','59253e4c4e04454f152e786f8d3074bc3a232046',0),(3209,1391189619,'5f36237394f9097011b40a0ee8e3a141c333de2d','0b1f177419bf9fca3a9b91df5602bbafbd3dcfa9',0),(3208,1391189614,'5f36237394f9097011b40a0ee8e3a141c333de2d','37be5bf1a86da44b19e0eb6452788506333a622e',1),(3207,1391189613,'5f36237394f9097011b40a0ee8e3a141c333de2d','17dcd0940d67ccbb8adbdd78e0e9337760de2ff6',0),(3206,1391189612,'5f36237394f9097011b40a0ee8e3a141c333de2d','763658f2919853a045238b4c20d92ed0931c1d88',0),(3205,1391189612,'5f36237394f9097011b40a0ee8e3a141c333de2d','c31d20e16b4b211e945461730009db299ed94953',0),(3204,1391189608,'5f36237394f9097011b40a0ee8e3a141c333de2d','1b5c06336d3694f11fc261760350c7509b99f147',1),(3203,1391189606,'5f36237394f9097011b40a0ee8e3a141c333de2d','5c3c4f9c4de61fb31758e78f8c9a14855062869b',0),(3202,1391189606,'5f36237394f9097011b40a0ee8e3a141c333de2d','d3d06cd2b1ce01e3e813406f0cd5c918080a13db',0),(3201,1391189606,'5f36237394f9097011b40a0ee8e3a141c333de2d','8b954b8806e8b2dc5ea3e3bba75b2c8898ff8052',0),(3200,1391189601,'5f36237394f9097011b40a0ee8e3a141c333de2d','970343b97b7f44ad1c2a3de6808dd292d0e6c513',1),(3199,1391189593,'5f36237394f9097011b40a0ee8e3a141c333de2d','12aadc7c0529c588704d478f3a1baaf7e9074063',0),(3198,1391189593,'5f36237394f9097011b40a0ee8e3a141c333de2d','91dce62c16b7f9cace2f3ae033e676ed9fd2eeaf',0),(3197,1391189593,'5f36237394f9097011b40a0ee8e3a141c333de2d','339672ea29bdf9953627fbf78ecd91f1985beb2d',0),(3196,1391189588,'5f36237394f9097011b40a0ee8e3a141c333de2d','d5fbcf9a84564f35cbab976e8d726466ecf47400',1),(3195,1391189583,'5f36237394f9097011b40a0ee8e3a141c333de2d','1dbdb53056a1375cad4687509a96a97123b43f4d',0),(3194,1391189583,'5f36237394f9097011b40a0ee8e3a141c333de2d','4b1659d5c753a2e93e905fb808835e5c0c2ca28d',0),(3193,1391189583,'5f36237394f9097011b40a0ee8e3a141c333de2d','accc3ea2631518453f8a8f0d8a6b00bc79eaab4d',0),(3192,1391189578,'5f36237394f9097011b40a0ee8e3a141c333de2d','10f50c69e68aed3245d140e296741cd2a4edfe12',1),(3191,1391189576,'5f36237394f9097011b40a0ee8e3a141c333de2d','15101521f98211cdbb09ce4a9a517ecf54372d9a',0),(3190,1391189576,'5f36237394f9097011b40a0ee8e3a141c333de2d','5aaa7dc56ef5923ec74bb5dd300ccd1c342b9fe4',0),(3189,1391189576,'5f36237394f9097011b40a0ee8e3a141c333de2d','f7e0c9ac6f3fba0f94247ac07d63d8664467f845',0),(3188,1391189565,'5f36237394f9097011b40a0ee8e3a141c333de2d','29503348f0249cc724538a65e87a374bdbfd2378',1),(3187,1391189552,'5f36237394f9097011b40a0ee8e3a141c333de2d','cadee582ff696b513c1483cf0ac80647cae7526a',0),(3186,1391189545,'5f36237394f9097011b40a0ee8e3a141c333de2d','e8db0672bf9da1e05e536eae359301397cb70759',0),(3185,1391189543,'5f36237394f9097011b40a0ee8e3a141c333de2d','7fc773c09fb48ec4c30b0095ed472b0820d59bf6',0),(3184,1391189536,'5f36237394f9097011b40a0ee8e3a141c333de2d','bc31b574860e2c6f63683a5ad1f60c6634d3c4fb',0),(3183,1391189536,'0','b29f966986a8e7d8eedee7fbb2292bc6772fa78a',0),(3182,1391189466,'0','58b05847e44a2e0021bb0d9b21709d5b9ec241ad',1),(3181,1391189466,'0','94b0b07c361f6f96f993652e4b3f9211d9d499cc',0),(3180,1391189466,'0','7710b820b2308f67550c4f7d88e17fe1c49c741d',0),(3179,1391189464,'0','17c2b39912d819ba46a4acfb9d09f25713a6a83e',0),(3178,1391189464,'0','2f1637ea66ff97f29ec0d11567cbf2bcd42a4a7f',0),(3177,1391189463,'0','9a344ae2e0d12c2dbea337ace5c99084d00f5007',0),(3176,1391189462,'0','88a039e6c290d14edd6bde79e435f04351140997',0),(3175,1391138505,'0','01339bf0a21c6f000488948a928b1cea463cd9f3',0),(3174,1391138505,'0','8a3db8ef3537a2a16b2933f8fb863a40dd961cc4',0),(3173,1391138504,'0','53fbabc6cc18e8780b3f1f5163dbdc36458d7e42',0),(3172,1391138497,'0','8cc19f76bbcecaefc1131d5f0a5f75c8c2a395ea',0),(3171,1391138497,'0','2ddd14147d9d528f99be08b05d6ec503807c4967',0),(3170,1391138495,'0','ea2138ec032c67ed9f0b1fd35c0d0ecc8c7a3a66',0),(3169,1391131069,'0','fddd990a317396a9f3eaa3449ee3b9f62b8abc0b',0),(3168,1391131069,'0','c92379292e378f68a5be373d50249fa8156c4900',0),(3167,1391131028,'0','31061bda847fdc764be31855addf35a0cd7baf29',0),(3166,1391131028,'0','69f099036fc68d2a8bbdeb7e3de1e64037b73488',0),(3165,1391131028,'0','26703da004b4f1f09ce5282cb944d69656694b85',0),(3164,1391130604,'0','91a593a9f88aa4b4fb32bad3a716cc111c9bf352',0),(3163,1391130604,'0','baa1650ac57291c9662dfcfe54dde942f34f7004',0),(3162,1391130603,'0','8a0597d9b354c43ea712e33761890fa07f312a91',0),(3161,1391130602,'0','8e1c54cc79130c44dcbfd6e278a5799bb9278979',0),(3160,1391130601,'0','5ef907a89921f86285bb2384c4165d9a18cd5cc5',0),(3159,1391130598,'0','98261ce23790a63dd8db5ab287b9cdbbbf8c7b55',0),(3158,1391130597,'0','9a3240adc743a8ac08a810ac388daf911a5923b9',0),(3157,1391129885,'0','1b8747d222260388cb363f12ac5cb800593b42e5',0),(3156,1391129882,'0','ddc73676b222fc133f6ed91eacbe8407d6414182',0),(3155,1391129850,'0','0dba190515585a46cbc4ea4af84878e7691c122f',0),(3154,1391129850,'0','2ead759fadb92f6fcd2470150a054420c50460a1',0),(3153,1391129849,'0','81b17f23710dc49770dcf415ff46cb3d928779fb',0),(3152,1391129832,'0','46b13dd9f79dbc0c5616f27cb97eaafe7c595f16',0),(3151,1391129832,'0','2f5d43371279fece335b3cfeaca174dd5dbcef17',0),(3150,1391129831,'0','5cf7e3533f3378b87d90f4189098db53311de88a',0),(3149,1391127649,'449ce178ef3c221d46a87ea4f51a662ced2ff862','4921b1b4df79ac3fd2de7f46e9f214e7eb507101',0),(3148,1391127649,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3d40355d1faa413a465726a98ec7b8a546a4885b',0),(3147,1391127648,'449ce178ef3c221d46a87ea4f51a662ced2ff862','a8aa30b747de82f376ea7205618559853aeb179b',0),(3146,1391125650,'449ce178ef3c221d46a87ea4f51a662ced2ff862','b4fa505ef905cadcc29b7f5ca477e1819903e4e0',0),(3145,1391125650,'449ce178ef3c221d46a87ea4f51a662ced2ff862','149d5af2473197f93cef3d5f890c775a20fbe343',0),(3144,1391125649,'449ce178ef3c221d46a87ea4f51a662ced2ff862','5899f54edf6bbb4116cd371da794ee15644f2e8b',0),(3143,1391125643,'449ce178ef3c221d46a87ea4f51a662ced2ff862','e6c9593d7d66956914dd64b13f0e15fcd6bad100',0),(3142,1391125642,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f755a2f548c53352ad4afa2fd2b07bfae60c84cf',0),(3141,1391125642,'449ce178ef3c221d46a87ea4f51a662ced2ff862','67c9c4f54ccbe8c7ab9f1d31500a4b93e6ea0675',1),(3140,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','625bb96518de219b4bcb051ebacd065e890a33ee',0),(3139,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','9fc5d95ea23e1f31f8e4f110dd1172491cf141be',0),(3138,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','4f75b5f9638787425d751b8060ca8b48ec4d6bd3',0),(3137,1391125580,'449ce178ef3c221d46a87ea4f51a662ced2ff862','15d8c9e94484d2019f52400732109c6ef4d83743',0),(3136,1391125579,'449ce178ef3c221d46a87ea4f51a662ced2ff862','a70f542d3d408c720e2e20a53bc76458c1c5cf75',1),(3135,1391125543,'449ce178ef3c221d46a87ea4f51a662ced2ff862','100035f46488db40dd6382ac6fa42e61e4c5641d',0),(3134,1391125543,'449ce178ef3c221d46a87ea4f51a662ced2ff862','d95075168812836df471d8ba2ce920bd78e9dcef',0),(3133,1391125542,'449ce178ef3c221d46a87ea4f51a662ced2ff862','309ff6e12b41f89822cbf07d61f498ce48325758',0),(3132,1391125526,'449ce178ef3c221d46a87ea4f51a662ced2ff862','0175c7b11c5b89ec1e3e2ffc38739660596cbb93',0),(3131,1391125524,'449ce178ef3c221d46a87ea4f51a662ced2ff862','01a1fe69d15e8df6120cf53ebd341969d0655039',0),(3130,1391125513,'449ce178ef3c221d46a87ea4f51a662ced2ff862','71955bc6345892ce97ee41214abebb33c92e777f',1),(3129,1391125448,'449ce178ef3c221d46a87ea4f51a662ced2ff862','147a5654bd255200f1b52d22f52d318ef532be31',0),(3128,1391125448,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f5d42fd30a3f58fc280d79be20a2b687394da198',0),(3127,1391125447,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f92bc1ee91f591f5d8eda4bdd43ecb796895af43',0),(3126,1391125447,'449ce178ef3c221d46a87ea4f51a662ced2ff862','a4f77551910828f04bf9c6d8745536528e6cc1c2',1),(3125,1391125440,'449ce178ef3c221d46a87ea4f51a662ced2ff862','78b2391d810ca8eb302a22b8415fdeb151ff4998',0),(3124,1391125440,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3107c440717cd944d726a494b94367b684619c7b',0),(3123,1391125440,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f2913ed50bae07de3a299f3ce91212e56970c04e',0),(3122,1391125429,'449ce178ef3c221d46a87ea4f51a662ced2ff862','91e3b70f5a31f29330ed975a124c00e7d5d19014',0),(3121,1391125429,'449ce178ef3c221d46a87ea4f51a662ced2ff862','28e6935295594222367e89daadafd7bd94015bd2',0),(3120,1391125424,'449ce178ef3c221d46a87ea4f51a662ced2ff862','c5a3bf834fcc2ab6ba0190aa89f6566ae785e059',0),(3119,1391125420,'449ce178ef3c221d46a87ea4f51a662ced2ff862','dbb1f123d19051d0e2c815603a5db85b7a1791fc',0),(3118,1391125420,'449ce178ef3c221d46a87ea4f51a662ced2ff862','c06ede3e79c212b2d36c48a10fb5497b70612208',0),(3117,1391125413,'449ce178ef3c221d46a87ea4f51a662ced2ff862','4c6d61f06ffe3ba6d0241c9bd0d4af2446d0cefd',0),(3116,1391125413,'449ce178ef3c221d46a87ea4f51a662ced2ff862','d0ee7a3d0412980e7e14996981ffd942f09b5e29',0),(3115,1391125412,'449ce178ef3c221d46a87ea4f51a662ced2ff862','44d0b85c2e8aa95c38f6853616e937800ea79fed',0),(3114,1391125412,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f1dba1561d029b63b6937be3888524ae745da4a1',1),(3113,1391125410,'449ce178ef3c221d46a87ea4f51a662ced2ff862','1e1cbb4308dc3e69d2cd65994465127b3b088289',0),(3112,1391123319,'0','c2da17f0381271c020c782e0d2c1101d54d86c85',0),(3111,1391123319,'0','d765d37fa19e67cbdcd7fc761a4b25db8bef49f4',0),(3110,1391123315,'0','c2f8769253f0f01eb8faf10304f8915eca22ca41',0),(3109,1391123246,'449ce178ef3c221d46a87ea4f51a662ced2ff862','22b3195221af5bac8e033388ca9645d43ce40517',0),(3108,1391123246,'449ce178ef3c221d46a87ea4f51a662ced2ff862','f57ab167b002b869ae55243dfa6dd83f6a230170',0),(3107,1391123245,'449ce178ef3c221d46a87ea4f51a662ced2ff862','e8b17f6dd474b992b129e62933b8b031d8dd35bd',0),(3106,1391123226,'449ce178ef3c221d46a87ea4f51a662ced2ff862','7935dc13074f9fa663243f2521b9d40d9240cd3a',0),(3105,1391123226,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3dbe7cb7092619cb08b0f6ba3418dbad35fd4d63',0),(3104,1391123173,'449ce178ef3c221d46a87ea4f51a662ced2ff862','54c19f73e2d83556e10593f04a4c10f91931eb7f',1),(3103,1391123136,'449ce178ef3c221d46a87ea4f51a662ced2ff862','042df90c9da26010d16d9ad09d29e394de695da0',0),(3102,1391123136,'449ce178ef3c221d46a87ea4f51a662ced2ff862','43bb4b5c962094afdfd0992235fa975465f89adb',1),(3101,1391123133,'449ce178ef3c221d46a87ea4f51a662ced2ff862','adf5cfb815ba6b97366438dfcfd2e974a9f06474',0),(3100,1391123115,'449ce178ef3c221d46a87ea4f51a662ced2ff862','3adbb3fd4c08eb9c1795df342f519282c8a4f157',1),(3099,1391123113,'449ce178ef3c221d46a87ea4f51a662ced2ff862','1211fb5b68acd16d7517d4ec3e4d80f370ca637c',1),(3098,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','6808e289d13165ad9c279034b47767d829cce94b',0),(3097,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','96ab4100ab54b5e2d13309a0d39c26f1e3bc783d',0),(3096,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','9c4713d57dae8c9e1cfec0294b112e3fb8f5c0c2',0),(3095,1391123026,'449ce178ef3c221d46a87ea4f51a662ced2ff862','46e344852e502a23a516106bef09f9e2817cf4ce',1),(3094,1391122997,'449ce178ef3c221d46a87ea4f51a662ced2ff862','ce37e52a48d11bb26a97d9309fae1d69bd5b93b7',0),(3093,1391122997,'0','255cc97e524ce1a41a0c5a7deb4f4378c3383a21',0),(3092,1391122991,'0','7e90d07706c499502d5865a253afac370b3d8f92',1),(3091,1391122991,'0','85c4fda03a271784104adf386e50b4bad5e75ac6',0),(3090,1391122913,'0','43d10e08f002678bf29120ab06ac4d0ba173bfb8',0),(3089,1391122912,'0','6c47b2fcd5900ee5a05ec4bbc019642d8cb15f1a',0),(3088,1391122899,'0','bccdd1dc3724f915ea8165531dbad9b1be901b13',0),(3087,1391122899,'0','8aa4d8f72b0fa36cf02a50e06427f0edb0ce9569',0),(3086,1391122896,'0','b415d72161774b1ff1f06642d9ba0a6fd8b63b05',0),(3085,1391122866,'0','b5f028481f675d21a9afa6843052cd607e916480',0),(3084,1391122866,'0','2887c5fbc85337f1a8919dfcfb0c1a46328c0109',0),(3083,1391122860,'0','90cf37789820c5e40c05f127f19236ed3e00ecb8',0),(3082,1391122367,'0','8b12890e930b8f5380fbd035829b58849159bd07',0),(3081,1391122367,'0','09d6136bd4e9f9deb823b1a813543edc2cedea4b',0),(3033,1391116727,'0','ce7f14af9d22d32f2b9e8b3b1f8f74e43dfb4160',0),(3034,1391116728,'0','3f3425b967adc289ccd68ff8a405124e8af21195',0),(3035,1391116728,'0','b9994237223e1dbf50e81be5b0978b0f7e0850d4',0),(3036,1391116728,'0','49f611e14911451bfb726386968c8c6ebf459618',0),(3037,1391116747,'0','6cd0deac2534ab500ca5ad5c11249f48846e2d48',0),(3038,1391116747,'0','e561e3ff89c20bfff91bc3a49f60472d7784272c',0),(3039,1391116747,'0','0fa7fabe757f4712bf25dcb5576676f7cbece681',0),(3040,1391116747,'0','392915d06aec7c7254378e360bdc564b0475fc76',0),(3041,1391116770,'0','a9089eb1266cafb9b403a1ffa3650616b7975635',0),(3042,1391116770,'0','c831f2f09c76f53498f0843b5b1ddc429063722a',0),(3043,1391116770,'0','71b1c6a00fab406e31f631e3244a126c3e4d0070',0),(3044,1391116771,'0','cac3a47fb73436b4d7023a615f00868ccbfb499b',0),(3045,1391116783,'0','64869a630f000a7e4a28546526f746181cb3d4f8',0),(3046,1391116783,'0','39e4f42cd8f4930f86a08d224f7112de0aa2a48d',0),(3047,1391116783,'0','e06d6e31f71acee0d3b0b0ac85ee48d8b955fac8',0),(3048,1391116783,'0','ab99db5bc77ae300bbc5e23cabca0e6d2121fccc',0),(3049,1391116811,'0','5de657e194166fe5f644691ef5bd5d75c1df92f1',0),(3050,1391116811,'0','31704481fd78d2c64cfb9ccf26e354ec677eb5b9',0),(3051,1391116811,'0','49beb0b3f7ffbf70d560c43ad586337c9a940909',0),(3052,1391116811,'0','3649a4a6f8f6d38daa8068f166877017540837f1',0),(3053,1391116922,'0','1ad5478003480dcf41beb6ff5323fd39860f9f74',0),(3054,1391116922,'0','79ef82767b50684cc062863580b382844ea194f6',0),(3055,1391116922,'0','21db88b5f8c0d9c6bc724058bdaca989dfb7d946',0),(3056,1391116922,'0','99b34b342cb6433f0d75ff24a7d2ed8ecc310766',0),(3057,1391116929,'0','000ac9d5c46e1d2e13c3edd04b8516bd8c799797',0),(3058,1391116930,'0','6a6ca063318a414f8a2bbf7e3c79ad0ee7b7bdf9',0),(3059,1391116930,'0','bacf36e1ff70d39c879416ee1246c9e288bb2a80',0),(3060,1391116930,'0','420d82fda9d07c1e58c6a2a522e17f556fca8d69',0),(3061,1391117040,'0','7a57651bb8dedddf4e7635d8059004da4664b3d9',0),(3062,1391117040,'0','f80ebd81fe6862f38d2ef54d1c580fcd2e69821e',0),(3063,1391117040,'0','93b414501f807d1b0b10c28a83515f9e497cea29',0),(3064,1391117040,'0','b4aa63617197f483868c32c219eb3137544d04f2',0),(3065,1391119384,'0','7738310b62f3274adcf2b22a291c0a9a4f801045',0),(3066,1391119384,'0','542124643ee67efad30d446aed866ecf1daffe0c',0),(3067,1391119384,'0','6b972a41c1a31d7d501044c9c081af05a3fee902',0),(3068,1391119384,'0','df337c2ec52f163c6bab40f04b345e942bf895c4',0),(3069,1391120866,'0','d2bfbee8e2f7dbfdd8e04483c70c78e093f7799e',0),(3070,1391120867,'0','c3f5f110de95d888ceb2197bd006193e99501894',0),(3071,1391120867,'0','6c21c7e2990a96b8780b6eae46c787bd9e036df8',0),(3072,1391120867,'0','392bfac07731ad2718fc444b36bdea9505651e86',0),(3073,1391120883,'0','a1cff23b97efabc838e0a3d866243caa528d0d3f',0),(3074,1391121063,'0','03322d69f36c1fac74740a9e48be44a0afa5b19f',0),(3075,1391121067,'0','4c18802073a4c5af3370f55c6c4c8f374df10dd3',0),(3076,1391121067,'0','de05e9bc0036d2badefd267b94dfaa515018e083',0),(3077,1391122312,'0','1eb6f61f720a1fcd02bdf1b4af3ad7f11f51c358',0),(3078,1391122313,'0','58c6126de88397e7bfb3f9cc3be36484ac28013a',0),(3079,1391122313,'0','98c569d3a7bd20a6fb76d5cc6a1765f09021d06b',0),(3080,1391122364,'0','c5a506d310788c9dd85e6e2e6b72ec9113964997',0),(4741,1391294332,'0','8cfba221919254d6b7d55e54ff88ab3e13386212',0),(4742,1391294332,'0','165b678011de62b4548aa657a62e521fa07527ba',0),(4743,1391294332,'0','46377fdcf0d908816cbcb9fe2f4bfd2725b2287f',0),(4744,1391294332,'0','35872c46a4505a21f1bced8b9bccff0d070f732d',0),(4745,1391294333,'0','a602237922d048f120ed9dcaeb8a2839abaa63cd',0),(4746,1391294333,'0','540250832fea27cd8a0c3fd36652fe92f4f4c4a9',0),(4747,1391294333,'0','95fd64a4d3ad9024d5b9481eaefe1122fff58cd8',0),(4748,1391294333,'0','888e23458ee1e8b294ddb0b71b7dc9726f5b3a3d',0),(4749,1391294333,'0','0e9c9cf8c78ce33bb8a0ff47e9fa53281af741f8',0),(4750,1391294333,'0','ae5582f956f3e15e5cf4aa0f5bf910abf3d74e1c',0),(4751,1391294333,'0','7c036738fe8715b643b007c350e6adede83e5c19',0),(4752,1391294333,'0','168e49d5d7c35cd0294fe605163e6ff6d687c653',0),(4753,1391294333,'0','4b80dfd8bcba3384aa468478f2591d95323074d3',0),(4754,1391294333,'0','15347f263496f21d41702de587e75f73b3e96c71',0),(4755,1391294333,'0','3fdc27997eb51d85ef8913f07c7f00ce059e71c1',0),(4756,1391294334,'0','be0ed2ec6b52ecace4e9ae090d901f128865e4bc',0),(4757,1391294334,'0','4f6b93bd925b134db6738af99588cc52ba542d7e',0),(4758,1391294334,'0','455087558d7e0237a2bb96bb5c1f3833146a01a1',0),(4759,1391294334,'0','245ddc42c818b6baefdb42611152b4b0c2c298d9',0),(4760,1391294334,'0','1343ed35cbaf87ac6c07a9412b40a16210419f7a',0),(4761,1391294334,'0','62c342f9b25fed4da690f01fd5d49b01168e2662',0),(4762,1391294334,'0','7b3ec291596b960be1847f22f47f126721d534a9',0),(4763,1391294334,'0','926233e7271b8eb433cbf947464adf9f12f762ca',0),(4764,1391294334,'0','b94b1f1e009fcc62b456c3eaa490856c05d1befa',0),(4765,1391294334,'0','f54878a41d60303ef5048ae54d36090e98b6f97e',0),(4766,1391294335,'0','5187b84c7a9cffbc72cf0ea79cb153399925fac2',0),(4767,1391294335,'0','8377629fd4a7c98baf037050045b920ff882c2f3',0),(4768,1391294335,'0','cb2ef783a54f0b5eaae391a78277b54560b222ad',0),(4769,1391294335,'0','7879a9588421eb07c99221918e16948f86ad12a9',0),(4770,1391294335,'0','12d323b9d776a7fef673ce201ce4e874a0c8abb2',0),(4771,1391294335,'0','faa09591491d4fc5b2f6dc2d093e47c8468986df',0),(4772,1391294335,'0','3581bf07c9b74a1384dfdeb7ac5d4f68933e6c8a',0),(4773,1391294335,'0','18f746ef7f7ec5649215b30417ff2daf488ca7b3',0),(4774,1391294335,'0','d29948ce0e7b00e8b7e9c71bddacf0271d0d5360',0),(4775,1391294335,'0','aacb7c877941c94613e8d4e3575cf39c471bca95',0),(4776,1391294335,'0','d3bb0b6c5210e542ea0677c4637f6098f939e8fa',0),(4777,1391294336,'0','217816c0318e439d7d8b8953348d36c2d6ee2f25',0),(4778,1391294336,'0','91fa9c4337c6062d8706b61e325e99b894c2be45',0),(4779,1391294336,'0','d7e173d2df8040841b0c167fdb23532820ef30dc',0),(4780,1391294336,'0','6441edc6efe4a8b20f85069a51525fa65526be76',0),(4781,1391294336,'0','80fc94004f897fff60ea16a85c8da15015335c2a',0),(4782,1391294336,'0','0924a832f08b45c372caa7235492735a5f06f2c7',0),(4783,1391294336,'0','a4efd4ff279e0574d2c503948ed8edd6058f2530',0),(4784,1391294336,'0','f2b320fb7d10dd88a731d07adebff8569c815d67',0),(4785,1391294336,'0','5d292fd6ff09027d9b7ba53a121bb0dc144f4753',0),(4786,1391294336,'0','971e3f59f77bb6635353899bd0ad0c7c239db1b1',0),(4787,1391294336,'0','3497c7026197bb5a6d5831ae9964a8f388d8ab4e',0),(4788,1391294336,'0','d536ac53b60ba48f4428f20c0a398915bef18870',0),(4789,1391294336,'0','51116e0cbe86a35bb256c6110e0eb7f0b833734a',0),(4790,1391294337,'0','d23521788b5ef69d061376b6e1a5d0488e77eacd',0),(4791,1391294337,'0','1ce56a54f088a6d4d5d8f2512fbcb3a8365743f3',0),(4792,1391294337,'0','fb623110823190a898ed168e832a1e017ae09955',0),(4793,1391294337,'0','fffac9d2d82c63055783810fdba70f8a84b36adf',0),(4794,1391294337,'0','5facc397392429d49defa2c6c2b38d129cb48037',0),(4795,1391294337,'0','e2bc3c82623afc56060f25a19385ea7e637f07c8',0),(4796,1391294337,'0','6136ac3c978e5e72b81aa605de9d657f1db6fc69',0),(4797,1391294337,'0','59f121983ea2c642b83aa8e42f31bce96b437aa9',0),(4798,1391294337,'0','ca6fcae29ff9c65f374374bc6f552ff8c16bc510',0),(4799,1391294337,'0','cbd6072c38e4b0675f17a90ba389e2cdb1cf7c1d',0),(4800,1391294337,'0','99f83b29d8c68bc1b0e4f7c7a9ceb1470c95f3b7',0),(4801,1391294338,'0','59d11a972c59cd9852571f6ea17ef699056cd0d0',0),(4802,1391294338,'0','9c8882f95e657af4176b9d29716416187190be88',0),(4803,1391294338,'0','6086018cafde725cc6d52086783626159f8a3bd0',0),(4804,1391294338,'0','30515768bfb117ea94ccdc1124fbf597e5bac338',0),(4805,1391294338,'0','c26405ee5a62231eb507d88df226a9f7991afb84',0),(4806,1391294338,'0','c4fa3b1790e5c32a24b395bac0489ac126132efb',0),(4807,1391294338,'0','e0dd85ea9e8985e81e3512c1c39416e5f015bfe2',0),(4808,1391294338,'0','7f10d9f50d03aa8c2f1425dcead4ec1b6808c10b',0),(4809,1391294338,'0','bb76d874784e4a2ea4a4242a4d123497b868d463',0),(4810,1391294338,'0','85e90e03e06df3ebed7c38cfa64076afce4d5b01',0),(4811,1391294339,'0','079346087dbd481ec3aceb4d058b9f66254d4a01',0),(4812,1391294339,'0','7f7196bebce2da8348f8e21c4d291c03a0556439',0),(4813,1391294339,'0','1abf19768e88bfa494f067352d2db4852eec9573',0),(4814,1391294339,'0','9e824d61a7aa26c14548cefb374199f3d6aa09f5',0),(4815,1391294339,'0','1ada24a9a907245885d73c97c0e1946f7bde8079',0),(4816,1391294339,'0','e9e5a2ca4a401e0d8f3d4a0fcb1382366bc5ab11',0),(4817,1391294339,'0','d22cd834ed61eb69f5075d9a7c3efcc0abfac10d',0),(4818,1391294339,'0','93d71a49ce165a8aa4a1ee41c7e97ae5039ef1f5',0),(4819,1391294339,'0','e32970c4a0760aaabf286fd7282cd14e5a820fdd',0),(4820,1391294339,'0','a1b2bbf774ccda6509520521ff41869bf4e5196f',0),(4821,1391294339,'0','a8577298dc5fe2f42d1b5c4ff5372de17f6ed084',0),(4822,1391294340,'0','30e12205e4267f21644e2b78654c6c07ea7390a3',0),(4823,1391294340,'0','e2bfdd4f0d567751382857f0cf144ed8b4407a47',0),(4824,1391294340,'0','47f14d84b43237a3060cd8c85e7a330f4e96fac9',0),(4825,1391294340,'0','bd9e91a2361c7b40369e801806204967e7143ab0',0),(4826,1391294340,'0','14c2ce02ac062a84dcb3875d2e00bc0ad5322af8',0),(4827,1391294340,'0','b11607f0fb2c2b9142939946f038a31239d87780',0),(4828,1391294340,'0','da92c188db0aaf1ac1378bafd0a968438e340a5e',0),(4829,1391294340,'0','3245e39b2369549dedd2f3dbddf7638ff26462ed',0),(4830,1391294340,'0','13b26a6657fcd0d8d3550e90ecfe12429e0df454',0),(4831,1391294340,'0','540cff63c7c7d3be0a86fa6fb3040b177fa2ed20',0),(4832,1391294341,'0','06e3622166c43316c7f1ebd0d9e68bf5c75ee8a0',0),(4833,1391294341,'0','576305e3aad331fd5ee6effa6476a39466368023',0),(4834,1391294341,'0','e59758a623c8bbb53919cabb242fae69ca04cdd5',0),(4835,1391294341,'0','a858a7a8ccb9da7baf0d024c27024c62b2eceae7',0),(4836,1391294341,'0','4887b7db34466ac3885e05caf1dcb76904275bbf',0),(4837,1391294341,'0','725633fb67e4aaf3da71d948c7714f1e3d487219',0),(4838,1391294341,'0','eec8ecae10cbe8f1dde6b8fc63e507fb6f61e639',0),(4839,1391294342,'0','e3258774f24131fd7a0a0c666ec832b988fd5ba6',0),(4840,1391294342,'0','c0e6106aaa2ba19dea69f1d0b6014db9bf195a0a',0),(4841,1391294342,'0','8c214ece3ad2e52ba546d4bb8fb30cfb33a12d0e',0),(4842,1391294342,'0','6954ff81dc48212b61fb1771e0de5d44a8cbbe42',0),(4843,1391294342,'0','012cce671114170e931f1e6e0848c6b0fe72be94',0),(4844,1391294342,'0','ce06db5e94b649bfc0a16ecb3b94c338360e76c7',0),(4845,1391294343,'0','9cb518e752d9d54e0d3fd65cf6e37f21929f59ae',0),(4846,1391294343,'0','ada2e61d2ad961bdd25644a67a111fb10244abe9',0),(4847,1391294343,'0','39992b513daa55c885aaa4b9c6108dd4dfafc852',0),(4848,1391294343,'0','1020d7b3399d58fb5295a167fcf9befe3f03301a',0),(4849,1391294343,'0','673e78adf026d5449923c451aaaca27d8612a696',0),(4850,1391294343,'0','7794adca8659b53f27af3ffa06c3afcba778880c',0),(4851,1391294343,'0','4705d990721873785b13fc56639f62a46437a347',0),(4852,1391294343,'0','9771d2c025152c89766867d652a051f7c62a058b',0),(4853,1391294343,'0','d7e96e6c8ce89f2bbd8f5e594dcba1d412482502',0),(4854,1391294344,'0','99ebccfc01d44b438e7cb422a8c8fc9e1aa3c00a',0),(4855,1391294344,'0','eca5a4ab877b4d0008dbd3cd00c400698041f66c',0),(4856,1391294344,'0','509190b52c9211a5ecbcc7be289a29d007bfd97e',0),(4857,1391294344,'0','eb890dceaf38551c0a26896c2085302413da6c02',0),(4858,1391294344,'0','220d3d7f04c2a8a33c7b9506ee54e8f6ab061860',0),(4859,1391294344,'0','d6a728a2099a9d54161e204cb0f376385a54658e',0),(4860,1391294344,'0','08bec42b9c2f9b2a38a50618a32bf9a47f23a9f5',0),(4861,1391294344,'0','3d5e103e8fe657671c35f743fd689d3ea64afa73',0),(4862,1391294344,'0','8e1706cdc5103134014d85e00da2c77807a186f1',0),(4863,1391294344,'0','9dc219015e143f44ff0c40fe6aed21390fa76fc0',0),(4864,1391294345,'0','61a6916f75e72a9b4104a4b91fb42871fb15fade',0),(4865,1391294345,'0','0bfbc804219591882e6941f499cf51525a9848ba',0),(4866,1391294345,'0','2c78bc6b37ddd70f4aed946b310ed3a63e2365e3',0),(4867,1391294345,'0','6a3ee2076386b624ed62c86bea91c42cd6e04aa6',0),(4868,1391294345,'0','bf8685d75a796caf80a51fbeb2474dd2734ab32d',0),(4869,1391294345,'0','b36ab2133a8ecf029fb7052632d1733631c5ff6e',0),(4870,1391294345,'0','4e281d2da27166290a3c9295a35f93e1eaa1a17a',0),(4871,1391294345,'0','9f005103d068200e14a37985d98c127f1654cada',0),(4872,1391294345,'0','889667766c6742d97efb1b0defa385b7d0938e50',0),(4873,1391294345,'0','b5dc893ec31518763ccc086ac1df00c6bab77270',0),(4874,1391294346,'0','26b9c06d084f82557d3d2c08694e66ba747e960c',0),(4875,1391294346,'0','54dd69380622d80f0c839874472f00ae0d14ad29',0),(4876,1391294346,'0','ed76b97c91c35a570b5858621225f80ee4ebfa2c',0),(4877,1391294346,'0','ab2828a7583479f4d51d4affa81011bd6c88fcb1',0),(4878,1391294346,'0','154deb5ffd1f1113c9f697263b52e241341a3b13',0),(4879,1391294346,'0','e85af1e4ba4b33441a632f6f319d2115a6216b71',0),(4880,1391294346,'0','a290af2bbea6b55079cbf0ce851b09ce7e62ec63',0),(4881,1391294346,'0','f7369a829731d07a2eb8bd13e2e2f15a721c767a',0),(4882,1391294346,'0','3c4f49fc251c81ef0e5c48ed92e3bccdb9d51f80',0),(4883,1391294346,'0','1e2b436bf41a6095cedca2dcefb2c3cbcbb26882',0),(4884,1391294346,'0','b8d7e7300812b98d00504b245cf81d91050f8bac',0),(4885,1391294347,'0','7a8db99c4742a1fc34f3ee3a7ccd708f0f5e5de8',0),(4886,1391294347,'0','18cf9180e09859f91dc6dfec8c86cea84436f8b5',0),(4887,1391294347,'0','0fc856046d81494b2818b645cb079a02c3a474e4',0),(4888,1391294347,'0','f6034c73fdf698bb19b3f6f62291b77da53569d1',0),(4889,1391294347,'0','e070b01637d2f1c0a7f86c91a7e5c8c52defb9c0',0),(4890,1391294347,'0','b0d705f8f7e305d5b041bfe75a5d65f8c65394d5',0),(4891,1391294347,'0','e493c79b7376b1b37cfb525a4ce4364041e68ffd',0),(4892,1391294347,'0','9ed2c3a6d7d0d06aa46acbfd87331527dcc26cbc',0),(4893,1391294347,'0','c13269829ac22e804ada65effc1a9b9c0565e91f',0),(4894,1391294348,'0','32c2ee5f442d7d63b49db3e82bf881dff033657f',0),(4895,1391294348,'0','3f6ca1e5b3d4bda4cbdb2c3207285548c425d5bc',0),(4896,1391294348,'0','4388a25b017124088c26152ea4af8e07c52bd6ec',0),(4897,1391294348,'0','226ed5941d1578e0553b3f9a33741bfc54a41838',0),(4898,1391294348,'0','0fbcfba8b9280f063fbc57ddc0484c1c1fb10b17',0),(4899,1391294348,'0','60af6e60c408b9f92ea0fcffb6954f417a4f45de',0),(4900,1391294348,'0','bd97c9899cd3f64be6525dc668578072c84d4d3f',0),(4901,1391294348,'0','317196da4b45787e7c7542fee18c18d95cdb9cdd',0),(4902,1391294348,'0','b54f8484b77c1483283d03fa2dba05d6b4c9451f',0),(4903,1391294348,'0','451b6e6e83330b732f2d0e99149bd7c0f0a48aa5',0),(4904,1391294349,'0','ddd4d18525226aa2a64e8e55bd16d8299d8dc0a9',0),(4905,1391294349,'0','30cc153c315922858164bd78d8c5f98b411a961b',0),(4906,1391294391,'0','fbdf22264998ec68485d18fa3eef7325c3d2b9da',0),(4907,1391294391,'0','2722d779400b3fea1c33e374694a752b5e1221bb',0),(4908,1391294391,'0','e498fff53383be5f8f33ce9747fa1725270b6b30',0),(4909,1391294392,'0','6a54cacda12b37d0500e93a9666170c81b36e6c0',0),(4910,1391294392,'0','0ecaaf2f9e2563fdc10772c0747a7d35e5d8d343',0),(4911,1391294392,'0','17abbbb40c3b662f63c35e2a58e6989b265929a9',0),(4912,1391294392,'0','f15211973c1d38c0f6c2309a37c1475aaadae5b7',0),(4913,1391294392,'0','cc542b9e4a967012610c3542f81be032f9981f74',0),(4914,1391294392,'0','a17c2959c533de50cfce871fc3d45fbdeecf7a1c',0),(4915,1391294392,'0','8ffe0d00e6a64e7f01c6fab73def1cb826b6cb1a',0),(4916,1391294392,'0','3f23e8d77813a37b6035a0e8839af5282c89be53',0),(4917,1391294392,'0','b37982ccd7c28ccd7c64269c36fe080e7ba51659',0),(4918,1391294392,'0','c3f0d2d40e39905b7b01df1795847f94047757e5',0),(4919,1391294393,'0','0200cb255740752db5023f659c8993b3463ef270',0),(4920,1391294393,'0','a6ecadae3d7d64c68d73489a3427f27295cf7868',0),(4921,1391294394,'0','065e8d95ed596d317a48840ac29b7040346b8343',0),(4922,1391294394,'0','597947b55e70747e7283c6bbb87c9e9bb7ff8832',0),(4923,1391294394,'0','910fda0f1714de520a6c2bbc9403309698ed1a35',0),(4924,1391294394,'0','cf2b4fe2476edcd944365ed81c4d27b04b4148ac',0),(4925,1391294394,'0','6c9221d2db922b2263d26716e6dd1710aab480e5',0),(4926,1391294394,'0','45b8a25b2fd9d57a95e65affe22352159f67bebc',0),(4927,1391294394,'0','c7633496b9cf895bf747611fb6cd7f979fab1ee6',0),(4928,1391294394,'0','8826d26c41d3bd3bb10bef63c590d3ffe8a6db6d',0),(4929,1391294394,'0','07d758d7abe90a02ad1719f67b3a84d25dd3fe90',0),(4930,1391294395,'0','8e6afcf02c5f18f5f7028a64211c300a9ad6782a',0),(4931,1391294395,'0','3a72ab7a8a12e37b5b1ab681ee3172fe3f811682',0),(4932,1391294395,'0','b3b04ed0da0f2e5064df6ee268f5531fa238259f',0),(4933,1391294395,'0','e798c067ffd79eba45c9ce96c2491df7f44e979f',0),(4934,1391294395,'0','cc5572e36421bd56d4e63a84aa1d076848d11fe5',0),(4935,1391294395,'0','c85b0781a1db7ef63a6920cac959d148bd4cd554',0),(4936,1391294395,'0','71790dc5a9cd990fd8bfe045f603e9b407b276bf',0),(4937,1391294395,'0','72ca48fd4035b5dc6f9a3f9453c047b0211d22dc',0),(4938,1391294395,'0','a567e5ef90d4c9854714e1b4b1e1f2b5bbc742b1',0),(4939,1391294395,'0','7c9f3b83beb55dff6226e73c73af97d136729f96',0),(4940,1391294395,'0','e60702eabf6155b0a092b2c8f5143596373a35d4',0),(4941,1391294395,'0','1033acde3ce90bdc74d72d5b961a0156cc184808',0),(4942,1391294396,'0','4c58011b3bd74c141e469babc4f0db945e919308',0),(4943,1391294396,'0','7cbfef7e923bf9c52eba5acae30b785a5db1f255',0),(4944,1391294396,'0','8f5db673066f19b4b7bbdd1bfd11a88d55c9446b',0),(4945,1391294396,'0','11e7b29d7475bc18f04b8e93ac063ecb02d9d051',0),(4946,1391294396,'0','d426d68b6efe7f972568cd3011265ae5595e6741',0),(4947,1391294397,'0','27fbbdaa2cebf691820c9587cf59a3515e2fda18',0),(4948,1391294397,'0','6fda0891ea8333b4d6fca8dba0109e581dc02802',0),(4949,1391294397,'0','05a54117e6c1392551a4b3386985d9a0ac871312',0),(4950,1391294397,'0','13908bf874edfa6b47ee53d9b15920e12d346a0c',0),(4951,1391294397,'0','f18323393138700b75d166595921a7e8210e9b97',0),(4952,1391294397,'0','45a80055dbbeed47218dc3bbc9745753f69772b2',0),(4953,1391294398,'0','ab14cb9938c10e734d5efbf51c4a1be0fa78c911',0),(4954,1391294398,'0','8e884010a94664176b2d5599b1c466ae862bdbf1',0),(4955,1391294398,'0','e4cdf0434601ab55750340e36c51a6f9d92807ae',0),(4956,1391294398,'0','6eec5fc7c0fdc45d5ed8e1cf943a52eab2bff020',0),(4957,1391294398,'0','76f93128e31d93a00bd8e1e2192e572e1bf88b06',0),(4958,1391294398,'0','9bb92d77c0d0a0f79b358a883abb9900396d69bc',0),(4959,1391294398,'0','ffbcbcbebbd20e9a4ce9bfbe63a3498a81eb157a',0),(4960,1391294398,'0','e684ebf20bc64d71026a3523a678ea6e7f61a844',0),(4961,1391294398,'0','b3359232b5968be70f5edfd2db6fc84e00e4a0dd',0),(4962,1391294398,'0','dbbb142fbde4b0ddf774ffc70192955da29ee1b5',0),(4963,1391294399,'0','956fa35983f4169951ff6b30f4f27025a244f1aa',0),(4964,1391294399,'0','c46c3130390b746478a4da3be8a76957c0f2319c',0),(4965,1391294399,'0','3848d5534eb32b845bff9ed0bab790a9f893a835',0),(4966,1391294399,'0','4f568bdd42476ed81cfce455c443c0b2a1fb3400',0),(4967,1391294399,'0','e81aaa5bb5b4203c0d013afa059dac83c5dbafb3',0),(4968,1391294399,'0','fc52cd25d8a4eab26bd38e8969cb52e16963c006',0),(4969,1391294399,'0','1ad494327dc0e8361a4090f96df36d788fcdc1aa',0),(4970,1391294399,'0','b48290df83b261775ff473b5c42ce1a86ba862bd',0),(4971,1391294399,'0','d48f09073e840d9812d16960c27e412e16f99d64',0),(4972,1391294399,'0','cd2a85d01a5783640c4f0e1f012d428d700ea1be',0),(4973,1391294399,'0','a10e21a25eaa6e3b1cb164a52f260fbcd8a6ba62',0),(4974,1391294399,'0','1ed4330447869bc6da03883856b5c9bea9e5940e',0),(4975,1391294400,'0','ce1d60295531dff4860d168658b890fd5c980f55',0),(4976,1391294400,'0','b63ad676c5b985106d91e4800d10ca1fa4ba3154',0),(4977,1391294400,'0','38728671450c84d858eb99349c933182a3692c08',0),(4978,1391294400,'0','387f6bd4c6e7e000f723f58718ea133ce13d6ced',0),(4979,1391294400,'0','35a2dfefcd20e7dbc387cd3b0c273c229049800c',0),(4980,1391294400,'0','8cd74b6e58497d04e0932e7bd5a85764405d4f30',0),(4981,1391294400,'0','8380029c2a2cc1e0be099c976d97d532afdd6e59',0),(4982,1391294400,'0','499b69dbeeeef0da1eff3835e1c4be6cbab23d1e',0),(4983,1391294400,'0','45a1965f309122d2d5d841a11f55a29a6300c0ff',0),(4984,1391294400,'0','dee2a7a1614ebabed83741f4a2a9b9debfbd2567',0),(4985,1391294400,'0','d9e1e62e22254e05d1aafe2b5f30d71ab6c98d0e',0),(4986,1391294401,'0','fce3df2c09b3653283d77d7b42f0437ebbd2feb4',0),(4987,1391294401,'0','b864984b895d808190a90c89db038c3a8ab783b5',0),(4988,1391294401,'0','0ecf99708b42ebd5b7766a4b5ede1a43f026c49d',0),(4989,1391294401,'0','7dcfc1326d526b2345d0aa6300765bae0e7b5a19',0),(4990,1391294401,'0','48d9d524b0e770842434dc9ab805b1f960592d6a',0),(4991,1391294401,'0','6072eac9283457f221e1423dcaea8b6e5579f1bc',0),(4992,1391294401,'0','46912f7fc503e41d8096dbd8f4343ca778c8ba80',0),(4993,1391294401,'0','a902e55ac9cb9ef12915e2e27cbfb6ebb470fd27',0),(4994,1391294401,'0','1c71eceb7997fe4aaa647c423f9f1e438d918b6a',0),(4995,1391294402,'0','e056a410cf121a13cd383719dee5d485eef33674',0),(4996,1391294402,'0','5a04c46d43c779fd78ff063d1f5166df95bf0b94',0),(4997,1391294402,'48ede466a41b4d62f815d644000a47fa587bfd3f','e80d6a655cfd1fc11eb7c0a37eb9075a07b9932f',0),(4998,1391294402,'0','41952ce72da19ab7f36007c89f86ea6af39f38a3',0),(4999,1391294402,'0','3df8d14327956f8b55b093bc7f2eac5ed248b471',0),(5000,1391294402,'0','696f91bd6d8852f49fdd2207ea3be8f996bbf6ab',0),(5001,1391294402,'0','3c9fa1e9ebb38ad163467a6a27f78fa26614d013',0),(5002,1391294402,'0','c3bdcade3f9f3d2f8460bd1faffbf6bbae05172a',0),(5003,1391294402,'0','52d791bb75d895df9b6662678bf2ec1f2c60dbef',0),(5004,1391294402,'0','3d2b4b54b960b667d229694c05dec75b4d76481d',0),(5005,1391294402,'0','2e82cd3ebdfb5cdfc966c06ec17098643e8d0a12',0),(5006,1391294403,'0','6a7b36a4b6734d0be589b0092892dd8d911faf36',0),(5007,1391294403,'0','d0f08de85df5b4c0f3bab92c9661f084da59d651',0),(5008,1391294403,'0','71f4bf06b35b6857e73228607e352e83483ff19e',0),(5009,1391294403,'0','bb060e832637e5794852bd4639be671a5ac06fe7',0),(5010,1391294403,'0','625b8fe36f741a8e0bd6910e1f39a2399c53a3ef',0),(5011,1391294403,'0','7c4e601ac273a6ea5d90dac7e26dbd03522a812d',0),(5012,1391294404,'0','a63af591e138c6306a376760850a56c4013e8a01',0),(5013,1391294404,'0','3881077f9534b22679472042411f8c79822ac349',0),(5014,1391294404,'0','09d5d0b932b55579678d781f8ddf22f2c0d25e41',0),(5015,1391294404,'0','9ed20454a5637f1806368835594a3907a0a00f54',0),(5016,1391294404,'0','559a720849095a688370a390f81e04421b335e19',0),(5017,1391294404,'0','5058af0e6cbc13d2493e88d2654142b401144841',0),(5018,1391294404,'0','161094cb14f2a7d56b769a1080bba6bf48ed9b3f',0),(5019,1391294404,'0','0fdb338621cfcda07a846541f18d7673f8621b42',0),(5020,1391294404,'0','c91a8c8bea3352b2d2afe1cac40001e1259443ca',0),(5021,1391294405,'0','82a8ce2be19f6f76076dc1f6980f3c8c14e293d0',0),(5022,1391294405,'0','5c8ad03196590d02306ba51952bf7dfd307f5a96',0),(5023,1391294405,'0','5c8f9e7c83d46c6e456b5ec346c3788bc739759a',0),(5024,1391294405,'0','b9616d316dc8f47a7d36fa8dd63255d2f28e078d',0),(5025,1391294405,'0','7e2757f89fd5046038a9b99907cff2ebad997eec',0),(5026,1391294405,'0','cbeae033e3c8c5a1c99340d7f3d8975cc0188398',0),(5027,1391294405,'0','4e06d743c75e79b45753eed9ab0dfea828279e5e',0),(5028,1391294405,'0','591c264b81d6c0eaa29560275bf8edb1f9fd1376',0),(5029,1391294405,'0','3dbb6c3da5965ffefd277888146e3204017b4c71',0),(5030,1391294405,'0','9fcf9cd6762a9209e7d9012951d426057c8ebc5d',0),(5031,1391294405,'0','76c28122f63429cd14d6357e66b7233178a2b0c2',0),(5032,1391294406,'0','a1acdd887141ec8b269838ecf1a5f191bc081fb0',0),(5033,1391294406,'0','ddd2abe8afce1a1b6fc2ed61eec12a5efdaf8299',0),(5034,1391294406,'0','ef1272b65ca826b125842185836dc81b8d384a41',0),(5035,1391294406,'0','0092ca0ef2e3f1378327807116059a4afaea7628',0),(5036,1391294406,'0','5d612e59a58e14cd9eea4d1d156c9f937e9164b4',0),(5037,1391294406,'0','b1aa95ed12e95b77d150a459f90f10df4a44046d',0),(5038,1391294406,'0','fb692d233c08be9014940cc0c3dc2ca799ba4dea',0),(5039,1391294406,'0','a310b5dc53ce1ff533b2e00543e25bc789c319df',0),(5040,1391294406,'0','aa41540f2aa9f44f6789ef50eaa24e16fc3327ea',0),(5041,1391294406,'0','ead7b3d2a6f9d1e4e6636e85cb4f8ff663e23bbd',0),(5042,1391294406,'0','e9f499e569b0608435042e5f4304457be923edae',0),(5043,1391294406,'0','5b78997d46c00ff64edf42a07e34754f09338a4b',0),(5044,1391294407,'0','5433b55edb2bcc09280ed98b5cadb1060629fa4f',0),(5045,1391294407,'0','0c0e6f1ec4039cebb8c62747a22eaced48eac543',0),(5046,1391294407,'0','cb5ba63fcf13a638b211de5fbdcd318076b3f342',0),(5047,1391294407,'0','0ffd7a1cb23ef6b829f911a175b09df76103bb88',0),(5048,1391294407,'0','afe9c6d5e7176ce3cab909a0a120acd453012ed7',0),(5049,1391294407,'0','369cae97b303210c9da85254b183897e1fe314f4',0),(5050,1391294407,'0','324d441341f33d2a54ae4b84d760b0be195cb8ac',0),(5051,1391294407,'0','e9836bbd15b04cf51ec29399bf0e32d0c4f5fd9f',0),(5052,1391294407,'0','48d91f9ef9bc9c31a3c057ac3e97998adc8f5d30',0),(5053,1391294407,'0','c9db090c0479bafccbc67b5e7d3b115304f9a675',0),(5054,1391294407,'0','faefe9d407ab62070866ac101a710a0c6e62974b',0),(5055,1391294408,'0','b0968eb50f95b0fc8851c40afa2fbccb6cd9b27f',0),(5056,1391294408,'0','34a6f19a1e7b202be5916e24a6b79423a0a197a0',0),(5057,1391294408,'0','f0cbdf302d9963828fa6aaeda9ef04fdf2a059b0',0),(5058,1391294408,'0','48e1e50e1562ae1b3d07ad902ea77442da803f4b',0),(5059,1391294408,'0','ac2d49263b7d753377867e0798e4e3e9e0694e97',0),(5060,1391294408,'0','fc3ff3d5964ad073a235ea8ab6c1ce98306555f4',0),(5061,1391294408,'0','d06564e749228a4cd155a6cf669e58fbffb43e8b',0),(5062,1391294408,'0','1fab57ca46fcbb04242b0b25e7bb641c3e495add',0),(5063,1391294408,'0','7771e02701132ed5c300f52bdba6052d4a80172c',0),(5064,1391294408,'0','e934170364bfaadeec02b21cc33c3a158d3dd1cf',0),(5065,1391294408,'0','87c6e37309e2f81213dee54ef55409a884402544',0),(5066,1391294409,'0','66eeb3080ccff56dcbfca865183a2b0fee1252b7',0),(5067,1391294409,'0','b2490eb05b61fc3188f2f10f3b73c1a55f8658aa',0),(5068,1391294409,'0','422eccb75f943caf1e22faa0f43375d9c0fd7f25',0),(5069,1391294409,'0','ea42a5b22710cd4e7e8cea237f44b1feb2521bb3',0),(5070,1391294409,'0','8a90bc71d349e87b75102e3a1710ac02a362e3fa',0),(5071,1391294409,'0','d9aa660142ab46935f5a71dc78bd4658b0858b60',0),(5072,1391294409,'0','f1751c693b408dcf3b994c782bd15151093e13d7',0),(5073,1391294409,'0','b43e134b15e67d7e4663cab5c99d10f52a734e0a',0),(5074,1391294409,'0','061b86b4a4072ade2f7917ec2fe72b8c5094e624',0),(5075,1391294409,'0','1aec16da84a59539a207320e55f1a123c0152393',0),(5076,1391294410,'0','e27878dd90c47230e4a0024879410b7956900a6d',0),(5077,1391294410,'0','1b193ddb82b58cf564396c28c94eb3d8129d25c9',0),(5078,1391294410,'0','102fa4448dd2259493bd2f2986555728d15b3601',0),(5079,1391294410,'0','22d5445c8402912128a927bff363291e9258484f',0),(5080,1391294410,'0','1439f81ee8d52f0c4aa16e6da45c79e44227174d',0),(5081,1391294410,'0','6884eadef992770fbcba2f4c103238216824b113',0),(5082,1391294410,'0','79b790da6fc6c7e9680cc1fcd48fac9c806967e3',0),(5083,1391294410,'0','d165c99ccbd586c266f703b07577172ee2112b97',0),(5084,1391294410,'0','f1860c5b168d8ff4290d2ec94b20e82b4fc39e16',0),(5085,1391294410,'0','c956551ac69388689f675248cdf68303f571c125',0),(5086,1391294411,'0','bf2f567c82a9befd102781b3e3ab969664d91df3',0),(5087,1391294411,'0','c072f71ceb2c343bc44f9d3bbfccb3bd15b8b6dc',0),(5088,1391294411,'0','e98dfdef1953d15216b3752e1dd8ccb227c84be7',0),(5089,1391294411,'0','7da30a08a8284fc6ce5773de9278ca69a82b4fa0',0),(5090,1391294411,'0','5857d17e481c8ed874898757fd795aba2961db2e',0),(5091,1391294411,'0','87db0aa33f048cbf5c67bea6ce676e54c37883e9',0),(5092,1391294411,'0','6003eba3b6a3a47570dd25e9b47cd85e4728f549',0),(5093,1391294411,'0','ecd1f18bc2254441d6e522915a411c9393b4e013',0),(5094,1391294411,'0','682da269a1a4504f2f78322de059a4f85d7519f8',0),(5095,1391294412,'0','5cee324ad8db73bb1e5c204f7ff5791b6b26d712',0),(5096,1391294412,'0','211f38caa5e834fc7f3df5e75fde2b5875456dd5',0),(5097,1391294412,'0','79df55510ebcdd249a543069efceb51a437ecbf1',0),(5098,1391294412,'0','dbc782ec1f5fdb0fb6f053eb8b95e2aba9c64bbf',0),(5099,1391294412,'0','1fba1796e6b2c60e350818432df82b5a4e330290',0),(5100,1391294412,'0','a7174ac26b5f1f349a9a2235178decdd5f0ecc24',0),(5101,1391294412,'0','bbd19ed4cff1fec63b3c008c5291facc78764e7b',0),(5102,1391294412,'0','b3734da68e030e2e06057f26aafaaec8b4dd5108',0),(5103,1391294412,'0','28d64197efc25c4c4574b57d89df6e629904c69e',0),(5104,1391294412,'0','aa70d95b4c0873c775b9fa0950db9edd52485075',0),(5105,1391294412,'0','dbb62b416b301a3c7820600f4bb34218672136fb',0),(5106,1391294413,'0','5da177fa883c1b99372d11117c0f0c05337bfb22',0),(5107,1391294413,'0','2a8d912a3ab60a78ca790ef3fc7e50fdc67b52bb',0),(5108,1391294413,'0','761a33b60dcb552bc378d85305430a5ef184596f',0),(5109,1391294413,'0','fa114fd90deadb800b96836fdc5d973af2869ef5',0),(5110,1391294413,'0','19348d21cd85f2a1edb476d53af3c24605533a03',0),(5111,1391294413,'0','35830af07a2c1581643a7e6aaafc239e2543fc5c',0),(5112,1391294413,'0','6ce10d594ff308793f54092aff97215614de4df9',0),(5113,1391294413,'0','3258bac7eeaec140478649759a7b71d377df56a5',0),(5114,1391294414,'0','faa55d98cf6a427e9a25656cab2507554fd5e946',0),(5115,1391294414,'0','79774156d80055d869b336260d76221161a5a8bd',0),(5116,1391294414,'0','a15dc112c9392f606db47eb58c893e3f4a617d12',0),(5117,1391294414,'0','a1465221eb9522f30030fd84e38899a7c1d94c0a',0),(5118,1391294414,'0','c4220e7ea4ac7d2ed5b8d3c6f5abf111b81ad409',0),(5119,1391294414,'0','9c38b5b4cce891c7c4d8fb0a3c3614315a26d514',0),(5120,1391294414,'0','dcfce1d2d4fb3621180a71835fd4bc0af3ad576c',0),(5121,1391294414,'0','66cf722c7b0774cc2e52936835bc8020b0728443',0),(5122,1391294414,'0','ca398f1e4039e1f04f0537001875cba567514104',0),(5123,1391294414,'0','a62bcbe7b89828140a92132ce027fcb82629df1b',0),(5124,1391294415,'0','cfea3ba9b1250e48959fd2d926ba08a368581fd7',0),(5125,1391294415,'0','9954653cc677b86388ef974ae8649ace67321a27',0),(5126,1391294415,'0','c6a084c7bb682cb3f66fcb170cadeb4b7cd54f89',0),(5127,1391294415,'0','21cfe30681fb13e511e7ff2a7352e3666155f7ef',0),(5128,1391294415,'0','bc3b55b68b5177004f61e5cd1a5cd09833b2402f',0),(5129,1391294415,'0','cdd165f117cfa9b18682ad2d62e2e1488cd0a358',0),(5130,1391294415,'0','6e5870fb85a9e5acb9fff519ae5bd4ce4f233afc',0),(5131,1391294415,'0','5d1ced545a6308a92a1b0c01de41eb9e4aa68b60',0),(5132,1391294415,'0','ad318e742b5d7a72890b40107477d525bb1854d4',0),(5133,1391294415,'0','874afb33d89d01b86be54dbde9b7ee1ec71c442b',0),(5134,1391294415,'0','d88a751bb00bdcd3c5ee7dd8d80597a4abf60dc8',0),(5135,1391294416,'0','f8432bef09193f5f2d31d7a1e29b02eb0dc54ce3',0),(5136,1391294416,'0','972e93d440b6e47a3695461ae7e4446b740b3e51',0),(5137,1391294416,'0','09f9b81fe444344a037ef09e020242e60a2e0910',0),(5138,1391294416,'0','216466837997500de99edd4fb09e86cd3366169a',0),(5139,1391294416,'0','08c4a6c9fc938a047181108c0d146ee90642b85e',0),(5140,1391294416,'0','66abfc3617bda994aa0b0b476c8a191a71dd25f7',0),(5141,1391294416,'0','f4f8c9c48512917a96cf4ad5e6590129f5754a6f',0),(5142,1391294416,'0','db5455efb719ad45227fc4f6e4561a0e7ff0ee69',0),(5143,1391294416,'0','00cae11f379e089398c1d6854fc3e601d43186d9',0),(5144,1391294416,'0','09d9802c34ea72694dbeff7a8fbdde12072af931',0),(5145,1391294416,'0','250bb606aa7b08c95e745d5c4a06ec796d2eb154',0),(5146,1391294416,'0','93d33a77027d6659a4b7b8a78124cd2c6fe3daf5',0),(5147,1391294417,'0','a294d61d3c8dbea491d3343e74ed5694aa6bf88f',0),(5148,1391294417,'0','a782ed545be1d9d498f7e7c11230e8ea5501009c',0),(5149,1391294417,'0','bed50e38b7a29dd1349796669be8dd7720da4044',0),(5150,1391294417,'0','fd14e95f07ab5d5a4ec6eb7196efba40714fdae3',0),(5151,1391294417,'0','12545af802bde74c31d3f3a407e778d526741d67',0),(5152,1391294417,'0','9e2e24e6c6aa478f10a19abc3e967a89699342fc',0),(5153,1391294417,'0','69ddec49791e2cb0d6bdadea5e48803f93b5bc2f',0),(5154,1391294417,'0','ba1ebaa0b0c338179aaa6113349a80fe59ad8eec',0),(5155,1391294417,'0','8399c449ca8d437d84d3438d6ff1a75e79a52b21',0),(5156,1391294417,'0','c31a28c390c12cc41be65aa6cc902a3b2cd761ee',0),(5157,1391294417,'0','667073ede200989000f5c0d888d8612a8674a6b0',0),(5158,1391294418,'0','8a6803991dd12c67d3638c8af69d8ee035d32de7',0),(5159,1391294418,'0','646b2a68081e8ea8abd58da75950712194b35e4c',0),(5160,1391294418,'0','f8665d736c0ffdf3336f4bee9f277479bd5ccde0',0),(5161,1391294418,'0','89e4cc0d61261a1bb5709acb6da445f2e71ec3e2',0),(5162,1391294418,'0','c602fb16b84f7d489ac7842e874f3f82bb52e70e',0),(5163,1391294418,'0','ad8014596cb4a032d9406177172c921b6ec12fc0',0),(5164,1391294418,'0','4749c324cc7fdab17c1800a6003b63e56576a21b',0),(5165,1391294418,'0','69204318cb529c69f42e0b80af31301916f79288',0),(5166,1391294418,'0','7801d868ebe3783a966319ae4d6027e3a835bef5',0),(5167,1391294418,'0','a98f2292127ed8731a3e4a054790d4852a542a74',0),(5168,1391294418,'0','4a2d0728a13b4c179ef576efce6883d4bb91dd79',0),(5169,1391294418,'0','c692d47e240a11326687bfbfb1c8326b1e783f77',0),(5170,1391294418,'0','e7276166bc59899d1c90360aa809a903d7c66854',0),(5171,1391294419,'0','b904bee44f218685b606ffc691a75d8f6a8e0432',0),(5172,1391294419,'0','580da57bd3c32c8010d7cd6207535fbae8e1bb9a',0),(5173,1391294419,'0','458202685f49f38357e21cb1ccc459f433fd9d5d',0),(5174,1391294419,'0','837d17f8795009a5fdd4c620abc3aef2c2c057e4',0),(5175,1391294419,'0','12c0f9a6fb318805afad0113d0e2bc8582df8f56',0),(5176,1391294419,'0','d3e83caafbec82a49e8867e748baa1b8f7fa9f68',0),(5177,1391294419,'0','4d35acff660e033c7783d420a85fdce830988e6a',0),(5178,1391294419,'0','f660cbcf2d2274bc20c6c4b09e184064345ca19e',0),(5179,1391294419,'0','9cf02ae413fa5df19067f9abcbdbe99beff56c8d',0),(5180,1391294419,'0','64bd63f67dd468fc3e2dc0d5654becf6f50bc9e4',0),(5181,1391294420,'0','4de4a2a98b5c0ba566314c27ae22ded738b11b69',0),(5182,1391294420,'0','50c61cabed0422126b18b603673d890b32e0b3e2',0),(5183,1391294420,'0','4d424ff5134ba153e626e3dd21d779f8b343c2ea',0),(5184,1391294420,'0','7dccac2bb5bca0faac5e0e9e552e4ff0b401aa29',0),(5185,1391294420,'0','e390815a7bf57f0755a496af344aab4c66d659fd',0),(5186,1391294420,'0','3acfb3019d402fcc88507749ec2cef132d757a8b',0),(5187,1391294420,'0','550b1934d4d35c2bb9603af041f5dafdabbf2b4e',0),(5188,1391294420,'0','a7cc1be7f4ef3c89c7cdabc21d5e28883b602a38',0),(5189,1391294420,'0','f32e9ba05e9f640b051e35ba7b78ba3b58701678',0),(5190,1391294420,'0','1ac7197677619460a66c89c6c1bc07dcd31c1e4e',0),(5191,1391294420,'0','73b0eefdc2cdcf42fdad0282db5efdf150663277',0),(5192,1391294421,'0','ffd3febf5934f29c45b375214095e6b8dc529e42',0),(5193,1391294421,'0','568e9f6be26559084340ca90a904f9855203ddaf',0),(5194,1391294421,'0','2de2649287ffc38e2e40be50879e941487c0dd07',0),(5195,1391294421,'0','e8003fae999b20dca23a44ae408245865e2738dd',0),(5196,1391294421,'0','c1f632574fad70a58b219921f0d065c36921d296',0),(5197,1391294421,'0','5641ac516a054a9f79d43d1f14dc7bbf97743152',0),(5198,1391294421,'0','b12bae3dcf8059dd7f471d623d7a0a184027d952',0),(5199,1391294421,'0','5671f7fb62c9a1dcf9350310659a332f57b3b15e',0),(5200,1391294422,'0','7410d532132c284787d396ac0887ba1b7b930300',0),(5201,1391294422,'0','cd517cc80c6cd8d176792174f9d6aa12412aa334',0),(5202,1391294422,'0','91af0c5dbfbb33413bb7c6af8c4cf8f8a5b0e022',0),(5203,1391294422,'0','d14b4c3e4399dd8d6e8a9689d725cca4964a0a75',0),(5204,1391294422,'0','936d59c46c7ebf7dd1090d8172eb82d3ee64a6ca',0),(5205,1391294422,'0','67c891d308d81c26a85f21e2909452118df1ba9d',0),(5206,1391294422,'0','4dfe955cc3c64b839d9009d6f5ea3e9222d8a664',0),(5207,1391294422,'0','b1d0b7b10f3d02a0fb5c5093aa481582d1a54696',0),(5208,1391294422,'0','84e670d7a7b31fd8041fb8a1c3fecb750c6bf05e',0),(5209,1391294422,'0','8b627dfc3f741627dbcfca7f76082d979e023087',0),(5210,1391294422,'0','7154812151c6ca3c45cc9e682d62c9e3cf027bdf',0),(5211,1391294423,'0','196f6ce3c8657686469eefd7a8c6af8414acb74e',0),(5212,1391294423,'0','5cc5b03c699f61143302acf1768b962da9fe3430',0),(5213,1391294423,'0','1c3bfd08212fa8e6ad093b59609796ce25087684',0),(5214,1391294423,'0','81c0e841a97803fff79500f3bda7f0bf3ee62f83',0),(5215,1391294423,'0','1d5d1515b8a5592731d5528aed7422f03e44b3ba',0),(5216,1391294423,'0','d928c589f17496da6c45aadd663861450599660c',0),(5217,1391294423,'0','306710d80576c761c290da4301d62a3f2a3e04a4',0),(5218,1391294423,'0','eb33673e199b0237fd2e056f279a997b55352dfd',0),(5219,1391294423,'0','1c5b229b031894350e73ee42e3b571bebab77b8c',0),(5220,1391294423,'0','a6e10d8c1cba7ed679de1faf6fdac673088c3804',0),(5221,1391294424,'0','74800258f86c7a406725422acb9a0cac16ec63f9',0),(5222,1391294424,'0','9db20dfc2afb767df4b93229ebf97be0eece6290',0),(5223,1391294424,'0','0ae46d159804655940c02d71c51acd8615772a90',0),(5224,1391294424,'0','70ef969649bbe54c8d513eabc83a8f60b8e7447b',0),(5225,1391294424,'0','c57f2d3c4a742dc9a6882c2def7df1e51ea5389b',0),(5226,1391294424,'0','3961e118f71a58ce81ea381e9a25b179fe1e8ec1',0),(5227,1391294424,'0','538e1adb79667c6620b50447bcd088fd448b2957',0),(5228,1391294424,'0','1d2fcba2319003680456c8fd9c769919bd5522db',0),(5229,1391294424,'0','5f753b38538e4d87f5fd35c0a11005ff6f34a6b2',0),(5230,1391294424,'0','780f531c750cad878cdc1bf6f2aa46b7c2a5b1f3',0),(5231,1391294424,'0','2e94368056ea59f1a089ac72725c150b5344ab39',0),(5232,1391294424,'0','aa090b3aaa5141b6acddc193947d0b2350a3a140',0),(5233,1391294424,'0','15cd867618bc845a3fca5341697f80c176948b73',0),(5234,1391294425,'0','29d33c651958053d3cc041fdc3ba2540d4756faf',0),(5235,1391294425,'0','765a191caf878d515bbfd97d2379989ace5d9c78',0),(5236,1391294425,'0','9a1fab707e65e6a1648cc7568580c6dbaac5fd3d',0),(5237,1391294425,'0','719fcf617ee39b0e9e7fbfadcd5b44670450339e',0),(5238,1391294425,'0','1503adc0f90320c2faf7e61a848bca35bcbc128d',0),(5239,1391294425,'0','1ad952ba0d7cc2ce5a1ac8d8015e5f6f4cc1d4b1',0),(5240,1391294425,'0','7610c8aa60c9f7f10a5e200444ea7d550d339f55',0),(5241,1391294425,'0','b226744f1898700226028d0b4b4b987b9cc2742c',0),(5242,1391294425,'0','d9d92eb64690d8412429bfa30134e217b98b1105',0),(5243,1391294425,'0','2b331f393fd9df547d920af7538eefbc67858ff6',0),(5244,1391294426,'0','16b48abb600f5d4b73b58d5b5f453e36559a148e',0),(5245,1391294426,'0','02e7806a5986619421903f098b4be24943e5de70',0),(5246,1391294426,'0','3fd5c3e21f90bcb9707b148f5c74a012ff9d0c2c',0),(5247,1391294426,'0','25875dc2782cf8bdd5739aaedff4cf5adc4dd9b7',0),(5248,1391294426,'0','7a0ac469d484fc6cdbec0a4db4c2933669bedb94',0),(5249,1391294426,'0','b3b0c933f215dbe43de097cfa065ed9e98f9812d',0),(5250,1391294426,'0','7965a86865ce91aba5eb1299695e9ba3b1ef0a76',0),(5251,1391294426,'0','190e6170c753394271a71d4a70614b154e75203a',0),(5252,1391294426,'0','4fabc8b2dab7cc9bf54a1d50ddee2bc3f7913eb0',0),(5253,1391294426,'0','b1c056f9aeec1543edaaba2d33e3726e697a5e23',0),(5254,1391294427,'0','eef485872c22656a8d27efa50eda0cbb67e78f32',0),(5255,1391294427,'0','1bb75e2697e0d89ced802ae50049c7b084dc53e6',0),(5256,1391294427,'0','144483059f650d7fdc799f7c90224d759683bc63',0),(5257,1391294427,'0','e4569b50d7543146ad1fc2e3168ca81be0f9305f',0),(5258,1391294427,'0','2d8a0649f23aabb703b1890c962f4cdffabf9e60',0),(5259,1391294427,'0','9b54fff8c2a70f9cd13d9a56905889b7c55a9448',0),(5260,1391294427,'0','4de024f98d6ef2f0ccd9a17b6c30fbb4ad0b92b2',0),(5261,1391294427,'0','d628432f86f99a43ad75a22f956342cccf2c5850',0),(5262,1391294428,'0','92310f0ff22201dbcedc6a8de548bf8adab77515',0),(5263,1391294428,'0','a6fbe05672202dd0db72686fb63d9f44a07ba9c4',0),(5264,1391294428,'0','526d872bc948bbd74581c789624e9944035c0afe',0),(5265,1391294428,'0','215f5384a1ca6b7be150873891876ae2a6ada8d2',0),(5266,1391294428,'0','18488bfed661c09c858b33a3e4a4cf3e215caa4c',0),(5267,1391294428,'0','bbefb203f244a0abac5691a3ee6b87fa67e0bac5',0),(5268,1391294428,'0','33b79c5754865b8bdd2209e7bba1142defcc9205',0),(5269,1391294428,'0','c2baca108573397386f80e3e149e7aa36bfe3fe6',0),(5270,1391294428,'0','1a9d17a2c8d5ce7273d1c4a245f1117c526d324c',0),(5271,1391294428,'0','201fcb5ff3d248626db1b59fd2c863dbedcafdb9',0),(5272,1391294428,'0','26a48b7e44485e31726fb17bc84fedc0b73500be',0),(5273,1391294429,'0','c654f84767637434b68047ccc5482a5620c697f8',0),(5274,1391294429,'0','2c04dd59ff99ab918b5bc2eaf710f70de3432db4',0),(5275,1391294429,'0','5088e43b736500a08c5819c2459a14fb8d1e4e42',0),(5276,1391294429,'0','07b2cdbfbb55f04f97218e38c0f39ff26e4b9bde',0),(5277,1391294429,'0','2474147ece53d057231bc647f905f9c476c957ca',0),(5278,1391294429,'0','b8c0e5d5396dde87547cc6bb2777d1c6bf396497',0),(5279,1391294429,'0','168c5e76037e420e95c9044e6d8b5efaa215a601',0),(5280,1391294429,'0','fdc4184b387d44701b6bc3cbfa0336f00cc519e5',0),(5281,1391294429,'0','5b3ea5a95df09d4ba91c8f7468d5280ff4d5ed79',0),(5282,1391294429,'0','b39610c74af61f0653050d51471f14d6f6568368',0),(5283,1391294429,'0','d061413b669394e74d08b24e9e9e09e538700085',0),(5284,1391294429,'0','7aca09c430295a160fc8f4e6234c7c4d411a5b01',0),(5285,1391294430,'0','cd69bdffa65e68d473b95175d931b0894eb02c91',0),(5286,1391294430,'0','901d0b538a5dd97c51a789234f48d28d13aad5c6',0),(5287,1391294430,'0','a7390508366ffc1015085e9f72d491aadb6480aa',0),(5288,1391294430,'0','934bc6d31660f501de938af1e79567a9da24ba3a',0),(5289,1391294430,'0','168e8239453c807293641c4a5be66db7afce1a59',0),(5290,1391294430,'0','db44724384bae84110408549c40ca15693783d68',0),(5291,1391294430,'0','4a95c2cbc1c8945e337d6f6e8c4ace0d21c87ece',0),(5292,1391294430,'0','3af6671026d0c6c27cfade40362463c2682702a4',0),(5293,1391294430,'0','3951058eb4d7779dc09794fe4af0f6ddcfc7ad7d',0),(5294,1391294430,'0','8673c94cf13414016ea2d268bebd0484698fe3c3',0),(5295,1391294431,'0','b824fa73b2be667c6a93f1872167f129b1a4e990',0),(5296,1391294431,'0','be3a1042a80711e9ef2e8b9076c028aa058b3bd6',0),(5297,1391294431,'0','5fc0fd4c2e276cf2b3e4e71daf337c7b46f28fb5',0),(5298,1391294431,'0','07a9503c77587033c315acaaf7cb931ed2cddbd6',0),(5299,1391294431,'0','5e5947f1de37eba39d4bdc3d7995f59831468f9d',0),(5300,1391294431,'0','5923183cffd87a5aa3405e49eca8b9e2c0599100',0),(5301,1391294431,'0','1e0b677b520ef0f2871f1a370873f360db4dc78e',0),(5302,1391294431,'0','a8491b13b7c6e9de94d62d1ed67f03039613568e',0),(5303,1391294431,'0','ac3bdfcac0223d0398803ed8a3a96a175a1df7ce',0),(5304,1391294431,'0','50a88cc3c6ef3c3180af25c056466f12756e823d',0),(5305,1391294431,'0','8544c6053c9769e7117d8f7a69e1303482edc8a2',0),(5306,1391294432,'0','27cec76a13be06011122d7b62218ccb3e06e8ce3',0),(5307,1391294432,'0','b6c9692852c05040c2f8ae145e1ea80d6517005f',0),(5308,1391294432,'0','3a9816e3fc3779bacae9360cb1c124e09bf776c3',0),(5309,1391294432,'0','127f9d8de17b31dfe716cfce056ccd0429d148b8',0),(5310,1391294432,'0','67e86b2b3d53f15a2046cc3e4e929930cd924e32',0),(5311,1391294432,'0','4c066aaed30796975bf7cc9bdc919006cd1c6b13',0),(5312,1391294432,'0','df391a8b0c8fa43776e81fa773d88da9b494267e',0),(5313,1391294432,'0','4b996b78f8d2414834e4807e4062587852ea5053',0),(5314,1391294432,'0','41b29802ac66031cf47d5c67f14837043d97c408',0),(5315,1391294432,'0','ecedda5c22e30080cd3916d35e8a2b0edbd607c3',0),(5316,1391294432,'0','8af18421673a3fcff80494c0651722a9e146d84b',0),(5317,1391294433,'0','284c28001671cd1d9ca7a99ce9bcb487366cd885',0),(5318,1391294433,'0','2ea5b887e38953c54ffac3b22c3dfd5ea0171f48',0),(5319,1391294433,'0','ed41da4ad8b5f31eaba4acf4cb915c260f2df1e5',0),(5320,1391294433,'0','b695020b78e2a59e206588e2793908214aa1cbe0',0),(5321,1391294433,'0','bf344e32416e895f79238f3b9f27accc76225a65',0),(5322,1391294433,'0','31f12b82180f82a4040799f02e74ff8962bccce5',0),(5323,1391294433,'0','8c92294e671e241a55a9d19374b02c30a228be58',0),(5324,1391294433,'0','67c63931730aa1dfe2f84f856d2024f288b6915c',0),(5325,1391294433,'0','e591ab4db62925979343e2fc0a92a0c45346966e',0),(5326,1391294433,'0','80b13149005e48da131ecb3fa9769ef2f60a5f2a',0),(5327,1391294433,'0','90a27eb892e11f7b94b33e4723f27507a561fb0e',0),(5328,1391294434,'0','e1c418ec0add6d4030f56440223b72f462f7caec',0),(5329,1391294434,'0','00d0b45fdeb4ef2a391d275516ea0b8b9aec2d51',0),(5330,1391294434,'0','b1fdc60c85e75b93426b8ef0540d13d7e47c2aed',0),(5331,1391294434,'0','70a87cda3d8e740cea9b0d2eabc5315ce624e837',0),(5332,1391294434,'0','c134725126115ed093d53d2c02278ffaccdf9a1c',0),(5333,1391294434,'0','20262c69419eb7649984dbcca3c3ac76ecbc79b4',0),(5334,1391294434,'0','529750cd5ec206ec3ad6ef152b8284abd4abb492',0),(5335,1391294434,'0','a6b0c1c6ea8ffaa84b00402ba7e16460260320b2',0),(5336,1391294434,'0','d38fe9588f762fc7da1289114120fe526c4a5803',0),(5337,1391294434,'0','a14f3a7d3d5a442d2de109b0fde58f0ad597ed95',0),(5338,1391294435,'0','c2e22322299363cc02ac7b0f38ed575ae23bcc15',0),(5339,1391294435,'0','0a866e6950d270c012f6b52b7d559d470db01be8',0),(5340,1391294435,'0','4c6a3362b533732f6e3ae4620242b6b187bb2297',0),(5341,1391294435,'0','d16740c6db9673dc4cd3b21bab9557677141d12e',0),(5342,1391294435,'0','9a9db4f70e768ff9fc61ec64634bd4deb0e00d39',0),(5343,1391294435,'0','0120c99cb38fb13dcab2d657c2041616bdf57719',0),(5344,1391294435,'0','1faf246f2b498342dbb3f00d9eb8f1a5a313e5a7',0),(5345,1391294435,'0','e4b0b10bcbae43dcb7d90d791b6102b9ef85e128',0),(5346,1391294435,'0','57cc149cd66e4dac95229d2692fe46990307eb02',0),(5347,1391294435,'0','381f8f2b63fefaa612c909cd031ce3d772dbfe0f',0),(5348,1391294435,'0','7300aae4f3ea120e578e0a74449d067fdeea76ea',0),(5349,1391294436,'0','539ec493099d061f146f304b1520a9860b3c4efb',0),(5350,1391294436,'0','f37478494a14c2fe010d87b512df50b0d4e16330',0),(5351,1391294436,'0','63dcc60fad88b7d53ffb6d55d9e12022d6307d12',0),(5352,1391294436,'0','8f966ac39c31e00284934d8e9bb63b8cea5fecc8',0),(5353,1391294436,'0','cbef744e193142d921de33f4e3de3d8b17e3b6cc',0),(5354,1391294436,'0','82640e9d541bf2034faaa413b4da7236809da595',0),(5355,1391294436,'0','8c4bd6cbe7bdc377daf855dbd26afeae298779bd',0),(5356,1391294436,'0','00cc43d7a58e7dede322f988443b86e5857ccb16',0),(5357,1391294436,'0','9adf46fc9350447c9a63315d799be95a73f7b38e',0),(5358,1391294436,'0','8e98456d83f53c3980aac4719787c95b1c2680fa',0),(5359,1391294436,'0','5d86c4b6f15de363a10c9b655d545bed6a77f8ac',0),(5360,1391294437,'0','6aa4c4b44e639750349d1460b719569d451de237',0),(5361,1391294437,'0','7f78e535cc41ca30257501c0a8b4ddcb66a7ccfe',0),(5362,1391294437,'0','46eef443ed0f2fdf8188887a7575d2f9e92c8da8',0),(5363,1391294437,'0','a8ebae5da96a311e93ab7b496cfc7e1d2d7b436e',0),(5364,1391294437,'0','834bf4fa8e5d45df18cabe005dd40519b4954169',0),(5365,1391294437,'0','8579583986b18010dfcb71f7993218fe868dd3a2',0),(5366,1391294437,'0','4f46ef057998e51379b4df78a854c21e0ceb4e67',0),(5367,1391294437,'0','f24b8ab8700b0415f87f8b51c73d9445db5d2003',0),(5368,1391294437,'0','d829596defec348c04f7abb430a181c231b9fed5',0),(5369,1391294437,'0','a35105141bc44754910ae032569909df7a6f7503',0),(5370,1391294437,'0','275e734859530219beafdb6038fa67fa0afb133c',0),(5371,1391294438,'0','2b5650d6f5a8929d28492d46fee24eca1e73bc93',0),(5372,1391294438,'0','6d3b4fb20411ea86c80851e9e9ed5bb345e77ee7',0),(5373,1391294438,'0','c018873bc09c4ab72a792dc0d3637681d67634c8',0),(5374,1391294438,'0','a3c697f8306ced7c0d9f697975f630e9db18d9e9',0),(5375,1391294438,'0','36fa14341169f5ba05ba25c1d77645847d59e469',0),(5376,1391294438,'0','a1f4aac04caa124a124e16a9887a17b473a914ce',0),(5377,1391294438,'0','c46c59169dca376d462947612e3034723f7d39d6',0),(5378,1391294438,'0','ec587e9a62584c2f8c6c702c90abb02a28dbd7c9',0),(5379,1391294438,'0','1b2cb6a0f499467e98ce106560d69885e3383633',0),(5380,1391294438,'0','7c2f3a11014a3d24f793cc624dd7f142c39cd29d',0),(5381,1391294438,'0','623b3502568b9890f855c55d25f0f5b88f3296d8',0),(5382,1391294439,'0','090828555c66ebe2f40716a7f3994158c6baba65',0),(5383,1391294439,'0','ec4e5bdd1fbc1f56d06dc9daf229be85a9e8c9d4',0),(5384,1391294439,'0','a4678cccdca7f21c1b95ef01d6a65085537a7470',0),(5385,1391294439,'0','ef5cad474f4f79812fe47c122e77991dbc35aa55',0),(5386,1391294439,'0','ab2cb8a58d6aa04ce2be4bd0ea015ee90b8cfe54',0),(5387,1391294439,'0','d51e483581892113262948a9883f78e0668ba092',0),(5388,1391294439,'0','f0409b6194b64fb898bc28ff804caa88512d51a5',0),(5389,1391294439,'0','c0799ea60c913a99ccc547192f2268965f85a1bb',0),(5390,1391294439,'0','07f15567d83060454dc0375083928a229213cd90',0),(5391,1391294439,'0','dfbb3b85b6e7db17c7d2d285be3d2808afcc5a42',0),(5392,1391294439,'0','4aaf60936be86fb968b55583986f7de7936962d3',0),(5393,1391294439,'0','50f975543b01c870a59f24e50817bea44519e06a',0),(5394,1391294440,'0','7251acbd8e932eb36f3ed09fbf950f12ac73e127',0),(5395,1391294440,'0','742cda0e7b96ee0168914d13fb34b9e00187a3f6',0),(5396,1391294440,'0','c57e289cd01ca9e6c40a9d80169d7e35bc36cf60',0),(5397,1391294440,'0','23b7df4b7bc1488041c6a3da2153c0be8010dc45',0),(5398,1391294440,'0','fe1a26e0cdb228777ae04c48055ea083604729af',0),(5399,1391294440,'0','c16c9a20815958c87e4943c1b4f2c7b40e5896a0',0),(5400,1391294440,'0','cba72c102f21400b589d36151ee1aa86f819d4a2',0),(5401,1391294441,'0','9cc0e27e1939a8bb84d8b9028bee56538982783b',0),(5402,1391294441,'0','85683b1e246d48c30e91974312530b8126151967',0),(5403,1391294441,'0','c642ad180d66c1485c3207311677569c1d987d33',0),(5404,1391294441,'0','355182dea217ffc38b5b3b282fcb5c9fbd8acb63',0),(5405,1391294441,'0','f82013203ec65ff93b9a7903d77cf8f1fb0708ab',0),(5406,1391294441,'0','0ff2a95dc4d0b3feda0766b60e4e198ef0347041',0),(5407,1391294441,'0','434b586529b3a782ae267b6ea4b3b5610d5db2ce',0),(5408,1391294441,'0','cecae44a5c2e69f4c36918bd3ccc679b4585b7c4',0),(5409,1391294441,'0','675d08553327cac98da927c60f890b8ef01fcf5f',0),(5410,1391294441,'0','2f53ee17e03aa5f3e0f8d6ad5c42b81faa9fa7f5',0),(5411,1391294441,'0','22ff1d8966b16186d138557bdff11ce4a5296c00',0),(5412,1391294442,'0','9a0628936a2c66ae5571a3d1955856a153a2881a',0),(5413,1391294442,'0','213a17d20e11d7cbcd9eb9857e8286cd43e06c02',0),(5414,1391294442,'0','f398dc91e45fe9022551679a38b77610708d3671',0),(5415,1391294442,'0','269ddfb48d13a5e6248edd3c0f7532a350cd8f87',0),(5416,1391294442,'0','b57aac27c40c401b65b60fc6e0ce9d56deb37bdf',0),(5417,1391294442,'0','6f2bbf66a6ee6d61a8b707f2460a31cbe05fc7fe',0),(5418,1391294442,'0','ebd92d61325333ad2f77ac110093773875eb29a6',0),(5419,1391294442,'0','fb93d15995df263c56360a3d581174dcad571a67',0),(5420,1391294442,'0','00f314da0dc4e16a107fa6eb930fdfa3222dc4b2',0),(5421,1391294442,'0','03c0a0a8ac9f1d357d608c5d59aa63d41cfdcbb5',0),(5422,1391294442,'0','af69c4a67ee84bac9c33b186fe4c1838dbac4b5f',0),(5423,1391294443,'0','33bf96087b37f04dc2cd2c6fade8de3d48fbb2d2',0),(5424,1391294443,'0','3492c0eb8fcc6615e4bff3bf19766d08bbaea941',0),(5425,1391294443,'0','772ff67fdd832b1ce5e62309c2535efc47a83e76',0),(5426,1391294443,'0','22ee46892bef7144b30f651ca074c26e60bcb035',0),(5427,1391294443,'0','a9f68edee15b28a9dd73489fdfb9572caecd4ddc',0),(5428,1391294443,'0','2458ca9c892ae0b0347833ed3f457e1c1fefb6b8',0),(5429,1391294443,'0','276e4efd86fbde743d55a813a9204f017abe632f',0),(5430,1391294443,'0','7d501a44f0103a2756e167047cc67bf5211dee80',0),(5431,1391294443,'0','6d840ded70f475cd019b2c0e1208e7a8f39be853',0),(5432,1391294443,'0','c8ce1310e2f22bdd44d3b2b8ec9024e6cc486a48',0),(5433,1391294443,'0','e90e5b120a29a621f731890bbed774e6d0a2a29c',0),(5434,1391294444,'0','9106d4bc53b0f5912ea12231de1e0a48fe145760',0),(5435,1391294444,'0','9765ecc5c82cfe2efb800cbc6e1be9695b6208b7',0),(5436,1391294444,'0','6b3788360f0c66e331c34e735c84e64a1e9f7145',0),(5437,1391294444,'0','e7c4876ddcbbdbf9988e9e7d6e1ee0ef4f44b8da',0),(5438,1391294444,'0','b33e600b950aa7c7d52dedbaa6e58ea9b1d5e116',0),(5439,1391294444,'0','896024b8d734c3873020f75fc8117095bb6935a8',0),(5440,1391294444,'0','0d5c54d0e5b74a1d90c9dad0505b11531099bafb',0),(5441,1391294444,'0','b6156079298935b623e1432aaf1dfeec230d5685',0),(5442,1391294444,'0','9861a814e7321d3c94d310cbfb5471ed0605e4ab',0),(5443,1391294444,'0','fe51e19ed1a3fbebb3b30b093ef3b7f9b8756434',0),(5444,1391294444,'0','06188cf95e8c9d112781846ec440625115a3c879',0),(5445,1391294444,'0','e0882f5394099fb0978ee36ccbc2291cc6f1ddf8',0),(5446,1391294445,'0','d40308f48faf6cafd58c30e40183709467f4735e',0),(5447,1391294445,'0','95febcf9893947bd08651f39f3a8a359010c4edc',0),(5448,1391294445,'0','c564db9a112aaac6dfbc2ac2d858f61ccf59bd54',0),(5449,1391294445,'0','0a255a51266c722b42c2666200ec04ef5f110c07',0),(5450,1391294445,'0','e6b9e21cc42f7da3f77f82f5ddb13ec144f31150',0),(5451,1391294445,'0','080217e94892f2b32630a4e4756079bd21db9f84',0),(5452,1391294445,'0','b5354515975ef756b35a47a897f9804cb97d66f7',0),(5453,1391294445,'0','ce9944e539159451d8e5c656bcb99d41f256b33a',0),(5454,1391294445,'0','e1f5387ff878ff1b3447d6804244dfd945b45601',0),(5455,1391294445,'0','f6d337b7f2ad5e946b8f6d945c9c818c166244ac',0),(5456,1391294445,'0','b7fb9e6f4e09ae538506a50cd2619053498a86b9',0),(5457,1391294446,'0','e992b08581d98232fa9fafba1d19be985b3dd223',0),(5458,1391294446,'0','1a1dd7bb9c0f2e75b432d8936aa40db521bcef8a',0),(5459,1391294446,'0','aacdcba6464c07105093fbf838cd07b57a451f28',0),(5460,1391294446,'0','ba2608601ad656f42e7915870cdddcc4168ef952',0),(5461,1391294446,'0','c6081dfff120200b53518e87071ddbdef812d85b',0),(5462,1391294446,'0','9cc6339d250a4112d9849e44daa2b101a3f3e58f',0),(5463,1391294446,'0','5063031cfa078ed2cfa1d123a7e7f4c272eb1ab8',0),(5464,1391294446,'0','c4a23c1040ceb4667a00eed495a24b73a39665c1',0),(5465,1391294446,'0','d60d437ac90b832a32b36910a7dd79ee8260d573',0),(5466,1391294446,'0','6bda41f72336c1802da7b08417047c1b59280877',0),(5467,1391294447,'0','ef72cd4b4d57a4dd21a8bfc5c6aa1928517af961',0),(5468,1391294447,'0','f1fffb585b9fd07d361b8ab080fcdde654acdc7d',0),(5469,1391294447,'0','6c2315218f6a5540eded635b224f51ecd4f634ca',0),(5470,1391294447,'0','b3a5e5e01eed455493854da6e5c83196bccebec0',0),(5471,1391294447,'0','4f3320ac09dff78098f42c0563188ab446cd3a81',0),(5472,1391294447,'0','c36a0bcb14f205ddbfdca9ed7cb962491532c33f',0),(5473,1391294447,'0','e57ac2126c100e36da1b7162075679929b506c6d',0),(5474,1391294447,'0','8f5c5c877e5f10fa8acf9b333a28988cc1a6a4c3',0),(5475,1391294447,'0','920eccbbb260df1692311567cf01e553574ec185',0),(5476,1391294447,'0','584876876b8b32d64e26f444fdcbae6c3c63510a',0),(5477,1391294447,'0','80486c04660248c9bb26cffd6aaa93e8023b0e98',0),(5478,1391294448,'0','f190ad6dc728cf64553285fb3b4cc4c16e00c05b',0),(5479,1391294448,'0','4df91af2495cebd5b3592a27a9a3b0cbf9f01f32',0),(5480,1391294448,'0','6d9490c476f5d022e05ad35e5a3ea7cbcdb05c6d',0),(5481,1391294448,'0','64ec06acbe237c137f401acd74e184ecf9479b98',0),(5482,1391294448,'0','2a9a0175f25945597e45a12acf0a38ccc716ed64',0),(5483,1391294448,'0','d28e3d0092c8f4cce49d7f3e3e92a3ddec41763f',0),(5484,1391294448,'0','135f7edaae8d15be8db0b8aa3d95cea7a6d41c10',0),(5485,1391294448,'0','49bce79a2fd6c1a5069275e22d8aa2b4a0029aaf',0),(5486,1391294448,'0','f08a44ce8450b1e968ea180db129796393be39ae',0),(5487,1391294448,'0','6bc366a9b506865895878b3e559e5529e9251087',0),(5488,1391294449,'0','51710b537bc6d54cee9d139f7b4bc7d4a3d6241e',0),(5489,1391294449,'0','443472e1563b2611ffef2ee8572494bb131d52dc',0),(5490,1391294449,'0','31e14998d2524d1a939cf5b8e6dc00b07472b997',0),(5491,1391294449,'0','35e5dcb735e28d0b3431b153095d0edb52a5ddc3',0),(5492,1391294449,'0','3ef0edda02efdd35797401964c00115abc7e2dc1',0),(5493,1391294449,'0','6c0990e8115836e743f09bf115ba710ca9262fdf',0),(5494,1391294449,'0','eacb0a384de927193eb6a7e5f58e737f1e8236c8',0),(5495,1391294449,'0','f110e1255243c0c23368ee2fa257178636486e0d',0),(5496,1391294449,'0','8521647b4abd684cc9382d299d7a43210e877ebb',0),(5497,1391294449,'0','3b18e9d402e9ea5749927c3e1f79a55604b41df6',0),(5498,1391294449,'0','dba4c07d1501417a1722786220df53a983d09ac9',0),(5499,1391294450,'0','2a5fefd47037cd47760fe408d7ae304f4157bd21',0),(5500,1391294450,'0','381954377636bd091dff342abf532eeeb3db53f2',0),(5501,1391294450,'0','0394e4b444caba33fa0cb892d68f74f471c5ce71',0),(5502,1391294450,'0','f1b0af7d82023584030a0a55d7e2f18b5d9e84c3',0),(5503,1391294450,'0','96fcc8a488e808a8e391a41e68a31f97fc9b0979',0),(5504,1391294450,'0','6fcca1be66e729ad4a7c83dc588b54b4e176e77d',0),(5505,1391294450,'0','6917d53b6afa79d9ce8ab9297924f3c463fce39a',0),(5506,1391294450,'0','fda86c33cb807988f66061ead8a20b4f3a8f11e1',0),(5507,1391294450,'0','d5ae0c49266cadd9628918915071556a60b1644d',0),(5508,1391294451,'0','fe3751efcabd92838b78689c75b6afec0fb78cac',0),(5509,1391294451,'0','34efa1fc75fefc5c479c22d2769e41351dad1c93',0),(5510,1391294451,'0','7b1040f24869a45e943d019e46801ed419bec45c',0),(5511,1391294451,'0','8ecc1108edfd87126005dbaba54b5e9471bcf84e',0),(5512,1391294451,'0','11fc958892740c1c9394fb16a4f3db10c150c3a9',0),(5513,1391294451,'0','4eb327e30f4cabf8a40288a25c7cf3b4707bfe8a',0),(5514,1391294451,'0','bbb9a3a0309612788ae227b0e4e6491bdf82ba3e',0),(5515,1391294451,'0','16e1b81e4c0dba24eb6d9f2516747a6e12d46cae',0),(5516,1391294451,'0','96f84178e741965774df499526c4a2194a1671ce',0),(5517,1391294451,'0','9b0450c0855696aa01b4a565add068d6872707f6',0),(5518,1391294452,'0','43f8b7f345213086dc513c62469dc65a92280ec8',0),(5519,1391294452,'0','cf74eab5f8c37fec8edd74cb099147372e1f80cd',0),(5520,1391294452,'0','5a86ee27efbed8b6f4d2eed64c9511494c93a4dc',0),(5521,1391294452,'0','fd12018ae660842c5105970bc910ec66e1e67571',0),(5522,1391294452,'0','faa356fbb46b060639b7c7066701b6635d547bd1',0),(5523,1391294452,'0','13692801e4685d9c30277991214001cc475dba34',0),(5524,1391294452,'0','b6a99d2fe87cfa776360989c03b23e34ab01cd4a',0),(5525,1391294452,'0','43c3849eb42419f287849270a67f65e71be20d4e',0),(5526,1391294452,'0','dc462e7ed83cf588f83628b3f64fe5c8a6bbdb97',0),(5527,1391294453,'0','2d0ed6e69c2efada7a9a841d7b5a82b1a1e7009f',0),(5528,1391294453,'0','eece84ec070c29dec7a0f19303861b457a1cd575',0),(5529,1391294453,'0','c9cea0f3754033678c7a627d0dcc5153e734b568',0),(5530,1391294453,'0','9d8cde601ec79d273de4161f7edea6be733bca05',0),(5531,1391294453,'0','868542f60297896a41195a66d35fb0e418bd6ec5',0),(5532,1391294453,'0','598ed5631e1dd69b17b166a33b5e9eb9fad0ac04',0),(5533,1391294453,'0','740b3387db44c5b4ea4b6e92e12762eb420ad997',0),(5534,1391294454,'0','14d687a1d85680cd193fa63a9d592f900e11ab4c',0),(5535,1391294454,'0','59b020682618e62540eebf6ca267130b875b971a',0),(5536,1391294454,'0','5cd284c728be602fedf8e875c4567d447de13d9a',0),(5537,1391294454,'0','c2eca829c50e95d145310f1ff2da8d97143bc8a4',0),(5538,1391294454,'0','3f423ebcef5ab6658d08abff43b8609c65ee5d3f',0),(5539,1391294454,'0','ae57abe3d85deec2decdcc37b0578f4ee3c27e98',0),(5540,1391294454,'0','0c73956c225a1e79049c9f3a96932a8939467846',0),(5541,1391294454,'0','88fe4f74f882f35aca85b6d2152b1aff7c459513',0),(5542,1391294454,'0','0e9838d8ec2073c4ab4ea0f711a3c3093dcfc834',0),(5543,1391294454,'0','389192848c9a52cf51083793bee1032ca11e6904',0),(5544,1391294454,'0','10c962aa299b0f593d3fbc0000c41b896e8b04b2',0),(5545,1391294455,'0','c87beeb4dba4d5454c8bce410a7b6223d93f22ab',0),(5546,1391294455,'0','ecbe5aee8166b27eaddfac486b98c6dcdfae4185',0),(5547,1391294455,'0','5083762fe99e2ee290156d19b593a7c7526926f4',0),(5548,1391294455,'0','9ca532eca278532f279a06f728a07146205b15b4',0),(5549,1391294455,'0','1c84fc7b1e897a5b0c1b7f28f185897a9bff9757',0),(5550,1391294455,'0','22891650fa63f164da955475c20ddcd6e29f0224',0),(5551,1391294455,'0','fb930e77a8d6a53fd164063618d80ad2cb5e1429',0),(5552,1391294455,'0','082d1b64a405e5b754016ed53dbeb7ae2b53232a',0),(5553,1391294455,'0','7f676283b7a9bf16f4feb322991fc3b0a245269e',0),(5554,1391294455,'0','67e9eb16183b8f7ba6d70b6af723fae6dcb3e9ea',0),(5555,1391294456,'0','a19ab0357928e20171f7afefd1d9de172d6be441',0),(5556,1391294456,'0','d9eaa0822db4c8ff99326409cf800bcefb305710',0),(5557,1391294456,'0','3a3a4a6eaadbf98d5996e724dc7d9a19e10c568e',0),(5558,1391294456,'0','edb61188fab8aa3b0a4841ef3a53b400da497df0',0),(5559,1391294456,'0','1c9f5e9e980119c336308ed7660a9133a3347fb1',0),(5560,1391294456,'0','487ec6033d42388242e8df950e9080727a1a9635',0),(5561,1391294456,'0','426f95854d0a7e1ec4457d686c2f75301eac01e5',0),(5562,1391294456,'0','d3444232168141b6d2a82878f691c9fb9b893100',0),(5563,1391294456,'0','4a731c17a4b6fa4238430ce8b9a77b6b4d317110',0),(5564,1391294456,'0','b1593bc1c344b930214ea69c9e2fb746aa3861b3',0),(5565,1391294457,'0','6ce951b8cfc14a84950a313a2407a522f29f3482',0),(5566,1391294457,'0','89c1303df40a79a20c542d39b9bc296b80792319',0),(5567,1391294457,'0','ea1bd4162653a6c735234894ddd5d8d5e05badfb',0),(5568,1391294457,'0','9419e061dd3f82f1de0a142aaa6be97ba6db4f11',0),(5569,1391294457,'0','f6554b2c2fa53b1097c5a64de53c762c42ae1c76',0),(5570,1391294457,'0','2f0e5ccea450295f0dd8f668675b5ea4bdb50382',0),(5571,1391294457,'0','e50604584b918a1714b42a33a248ee84e2cf35d5',0),(5572,1391294457,'0','d0fc298afb146c332f4573286de290d5b9e03ab4',0),(5573,1391294457,'0','a8afbeb5a74db45f5242fec0b986bb27ea73f98c',0),(5574,1391294457,'0','faa2eb93e8c8354090bbf7de436d9f220179c3b3',0),(5575,1391294457,'0','c3d99c4d44f7d1e2d863e04f9e7e2c19f702d0d7',0),(5576,1391294458,'0','53bf4fa99c6453084e63f6f7148f19e0386ec0ee',0),(5577,1391294458,'0','116c77621543b80e61eda9e3bffe60e1d425fd31',0),(5578,1391294458,'0','116eddbf1a006c2171917b8920444893f28340cd',0),(5579,1391294458,'0','9d6ae981e19fb6b5ecdcd5f75b73d9b397a843f4',0),(5580,1391294458,'0','3c923b3f8cf7ee35bc01aeb7b7ded424be781593',0),(5581,1391294458,'0','6823447d8f57152c7a3cf45d1f4729adc14eb0b0',0),(5582,1391294458,'0','a9180dfb56f9968ddd5a8ef449f48f6bfbb0d62c',0),(5583,1391294458,'0','51b2655f67b5791aa352b0f1f6a944850b9a57c8',0),(5584,1391294459,'0','40bcc6507e6e891d7b30146a249f0cd3f92954d8',0),(5585,1391294459,'0','7bb149ea4c9a42b28e7b8f64fca4414973253d3f',0),(5586,1391294459,'0','7dca6da6afe2d3f50c40f818facaadb9903ba699',0),(5587,1391294459,'0','c8e03ddbbb01e7da9a08f9d133b0670c6e7cb33f',0),(5588,1391294459,'0','94ff7401ddb9d45350add2935f5359a00ad05bd7',0),(5589,1391294459,'0','9d7aea55941c8daae9ce453b0c9350784893d519',0),(5590,1391294459,'0','bc81c46989761029a9ee7095e46dd0eeb579fb0c',0),(5591,1391294459,'0','c569f36ba60f1aad312e762f2539e3816a5411bd',0),(5592,1391294459,'0','27a408fc372aa4e85fa596e1a8efc6322c332ea4',0),(5593,1391294459,'0','344f56330b9cb5c0fea8872920a205eaacd274ea',0),(5594,1391294459,'0','9cb0501a49fbd35e8e6992616f7bf217ebce518f',0),(5595,1391294460,'0','f36a8d99df17b8bf7d3c338c8f4ed9394244bdce',0),(5596,1391294460,'0','32569333a5705e72a3519506dd598e198c709adb',0),(5597,1391294460,'0','9ba2dcf1c327e3513d936de5272f4deec124183a',0),(5598,1391294460,'0','72b823609db182b218213d5c3f0ceac344f9e879',0),(5599,1391294460,'0','edbb04bd0c1df7a68a98ee9c6f6cf4eb52b83344',0),(5600,1391294460,'0','5d56f0c5b8852572b78f755294acb7e19f347aa0',0),(5601,1391294460,'0','9a6f68062ab26a6a26161f298f931dbe24372b96',0),(5602,1391294460,'0','787ff0dd5d6c550833d10028e51210a3c44467de',0),(5603,1391294461,'0','ceeae81ff37a24fbb8165bfedc4c218392247f05',0),(5604,1391294461,'0','9b2f42b4b47b41a47010d09ab998ba3b0ec200be',0),(5605,1391294461,'0','8d42b672dc75bfe365eb479658a095901ddcfd3c',0),(5606,1391294461,'0','c0ebd9a606c3c18f222b0b900d4600a7f79818c3',0),(5607,1391294461,'0','62bbea3155b78f559c45bdbb4a72c6a04370eb97',0),(5608,1391294461,'0','2ee44eb1559848439408b3b5d32ef2b98e4345eb',0),(5609,1391294461,'0','6cccc6b181c8e5afa1f9e55e8b9bfa818e1df8b6',0),(5610,1391294461,'0','e098334012e927b35a309373bafd66b8f6de7760',0),(5611,1391294461,'0','cac3e3f841e4915e37b5a97abcd653fa726d25b4',0),(5612,1391294462,'0','258a2e7118a6dda076eb36cd03d888e169917178',0),(5613,1391294462,'0','9086c693a51a9d446690d2fbcce8736ca4e8f676',0),(5614,1391294462,'0','38933e819f45f560cd995b0b7e828b2ed01366b9',0),(5615,1391294462,'0','8765f2a5b87631aba62a2ff2b722df4ed07ab96c',0),(5616,1391294462,'0','2f6b296ec1b3ae7791c6313a6d371d8be094b7da',0),(5617,1391294462,'0','11c951ecbeb3710712c70df3574869940056824d',0),(5618,1391294462,'0','c7ea0303ea26f0775d47b22c7b55d034de95d36d',0),(5619,1391294463,'0','c29020594b0d183ab6fab5f3d95b90e859958854',0),(5620,1391294463,'0','cf77cea9be3af3c826272edc41366b3386c3e3ca',0),(5621,1391294463,'0','104ed574bd489eb6c1999f56e60711fea7847eb6',0),(5622,1391294463,'0','34ae126f839db8c733828fb09ad01ddd9cf8ffd4',0),(5623,1391294463,'0','6e30fbbea5c8a05f6fa8b8e616f7db6f509d9e61',0),(5624,1391294463,'0','a962d0fc47d5ce2201105be5f4d78cc2e3f29a5e',0),(5625,1391294463,'0','3b5966a4aca5c81ce64f6beebbc2c19ce45210ea',0),(5626,1391294463,'0','cf726a500f129c8092b7d33f5108351667267bde',0),(5627,1391294463,'0','5f8218b342b6271828260ac60e40ca9b3235c6c7',0),(5628,1391294463,'0','4fadff746648a9594217e71ad1dceecf96f2c5c6',0),(5629,1391294463,'0','df4a4290348b2c7192a8e063eeefa07d72b47780',0),(5630,1391294464,'0','3756bbbcfb9203aea4e8ca395c259e8e0556c2d9',0),(5631,1391294464,'0','63f1c3e5526ff4ddb25ac24716ef2bf6310fbd57',0),(5632,1391294464,'0','6fff00969a83d50249804b33f36c0e934bce7c3e',0),(5633,1391294464,'0','52563036897ac4f68a0828d7c471073ffc6bbd76',0),(5634,1391294464,'0','95a5e31ab14130771cd26d15d36e403f0955c6a2',0),(5635,1391294464,'0','81eaf95232424ef5841a44decaab8ddfe7a857c2',0),(5636,1391294464,'0','19bb209dcccbff21f1ffbc5488a2dd3e01a86374',0),(5637,1391294464,'0','2ea6db9775dadef3230b7d198d1e36d5291af6c7',0),(5638,1391294464,'0','57567970857e4256fa897d5754e5b3efc3f194b9',0),(5639,1391294464,'0','64f882ef5e94a1bca00655bae5d120c008c99378',0),(5640,1391294465,'0','bff25a0d9a44e6e785ce3d238ba3b74f64f7bd70',0),(5641,1391294465,'0','940cdd30ee0d4e4018402656d58c76ebe0e04c76',0),(5642,1391294465,'0','685736da7f5ab63277aacde73e1dfa40f11a54e8',0),(5643,1391294465,'0','f9408ea1905a8e527f621c36325f69e55e45c3b2',0),(5644,1391294465,'0','4860acf97a3538685fa13cb694fadfba48d4fd57',0),(5645,1391294465,'0','4dd8adc701ae0cb7ee0b72831c4f2c66f930bff2',0),(5646,1391294465,'0','62ac40731307ad1fcc1b65e391527336bd79abc6',0),(5647,1391294465,'0','98e13bd366c3219d6a370aaf156c926858091fdb',0),(5648,1391294465,'0','430459de744f2f6500b212da6ec56bb465fe25e9',0),(5649,1391294465,'0','0c74f316ae42d05a131996b1f4c1382afddae4ed',0),(5650,1391294465,'0','b7e89ac3f276740d1c3f86a843618396348d8c0c',0),(5651,1391294466,'0','83d5b441ee928e4a8d0f032e8f34cc3bdaefc8de',0),(5652,1391294466,'0','82751ec694345f3425d925ea2319e3e4cd278408',0),(5653,1391294466,'0','1802873436bc1231c73568520530ab31b78e07e7',0),(5654,1391294466,'0','39ea18c21cad206c1508b094c563ef92c5690ad8',0),(5655,1391294466,'0','f4cffaefe6133eb90e0244975e066ac3d60207f5',0),(5656,1391294466,'0','96aa40c6ede3fffa7863ca4c0fc5fe43fe1e6f89',0),(5657,1391294466,'0','87f651358974da6bf2663060c2eaaa261fe1beb4',0),(5658,1391294466,'0','502011cfd4c5529cc37b6c88f9b5c89f90fd7ad0',0),(5659,1391294466,'0','36f99143e59273ab0c7003d46e9bdc63fdd309ac',0),(5660,1391294466,'0','c65908d8e1501c97e3a83fd4d73c5a1e1f598ebe',0),(5661,1391294467,'0','4e4a2d55d615a68b6db4365b031de66e01decf9c',0),(5662,1391294467,'0','e20939f0d7bc5dc8ae5ba6cdb9057df23b2ee394',0),(5663,1391294467,'0','00e6a2f04efccc120e225fc8c682cf2d2fcf2403',0),(5664,1391294467,'0','f228b2e3a415ab6a1d3ed90952ea2a01261185f3',0),(5665,1391294467,'0','efdde4e1eef80e671ab0c54c2ffcd5d3f2561ee3',0),(5666,1391294467,'0','25c3eb0d922302237c46362ad3650b7f3b644b5a',0),(5667,1391294467,'0','f1bff91ec2a767eb742880723a893004a8e280d6',0),(5668,1391294467,'0','6898653f229a706f12e59ebc3ff5ea49d555b2ce',0),(5669,1391294467,'0','f525e049d6c689f16a7593a2565bcf06de3588e9',0),(5670,1391294467,'0','eb7a04766b75318423b53704a0fd6b96286e7d1f',0),(5671,1391294467,'0','2211835fd66d185e8e1d7f734837b07f5b352f3c',0),(5672,1391294468,'0','d9e282b88b5a5f319770b0d63c6b06c855217856',0),(5673,1391294468,'0','a7e4529b93a58b1e6f2462ff705a84f4f2175ac2',0),(5674,1391294468,'0','3c71acb7c4db02920bc9c7027b28e4ee54572cff',0),(5675,1391294468,'0','901820d9ac82d7d39f935ec968ccd41ced46125b',0),(5676,1391294468,'0','69d7c7a44c7dcd90f7f641b635946b77970316bf',0),(5677,1391294468,'0','5461aaf05107f6acb8baace7f214f06cf1bfde2d',0),(5678,1391294468,'0','e69d3f426daa7d91752cb2883af3f94cbba31dc5',0),(5679,1391294468,'0','042e4afcdf01d54215e1805a0b7e59b34a03e849',0),(5680,1391294469,'0','b37cf742feab268400ad93c4ec6fb341b6b49d10',0),(5681,1391294469,'0','9f3f823eefe48005d7787d1ef5e4665de41f61a0',0),(5682,1391294469,'0','2d7873dcfc87d149340b4ab8e33cfba6a136cce9',0),(5683,1391294469,'0','eb5019e2f153a67888df4c148ffc0479865898b9',0),(5684,1391294469,'0','f0453541db06e5fd30f9577b25f7a1d848592765',0),(5685,1391294469,'0','c5a1a8dc0e3cc166a9207e4985631b76615617d8',0),(5686,1391294469,'0','fb024454d1a7ba46290494e745272328f54bf2d5',0),(5687,1391294469,'0','6442fd31e9d7a6e847f6e14b3b9b3626bf4d7492',0),(5688,1391294469,'0','7b06d2c9a36e52d1f8fdd54ca75d1a570a9e4c50',0),(5689,1391294470,'0','2d435d527de33b6b9daf814785a6b4d34b62f7e2',0),(5690,1391294470,'0','38b63f058af68c6afe3a73d800ba74a38d48c9d5',0),(5691,1391294470,'0','3af2f88e69db266f21c3eea729b4ea5e90e5a1fc',0),(5692,1391294470,'0','562705c5bdb20dd7d8f993dd20f29bb8c0e4ee09',0),(5693,1391294470,'0','5b5a9d2e3c3300b9343d0fcf7cba84423b11090e',0),(5694,1391294470,'0','a4f8a3887123c2d80e52bf96b6a40708db1eb0dc',0),(5695,1391294470,'0','1bb5b1ef57954bd28dd0ee15bdd635f17120c8f4',0),(5696,1391294470,'0','907a51ffa2baf79573326cf27a9b9e36e8bbd11a',0),(5697,1391294470,'0','3b793ad9d4660f662c2278d5af96ac81a7d97dfe',0),(5698,1391294470,'0','09717325d28d5b8c1213e86bacaea541a944aafb',0),(5699,1391294470,'0','79fa4d3ba225bacaef9d66c465d50b3ada7c336c',0),(5700,1391294471,'0','800e59e44bf3097d8b447b7077398a2b242ff068',0),(5701,1391294471,'0','305819cf290cbf036461bad6695ea1b26077612f',0),(5702,1391294471,'0','ec0d30f7b245438951eb2eb12a071024f9a5ed76',0),(5703,1391294471,'0','2861e149d742400f8084e02f016e94b8cdf1fca9',0),(5704,1391294471,'0','0681f925204a85641136a1be4bdeebddd8eb5aac',0),(5705,1391294471,'0','a3048439db46100251bdf9989178a16f894fe71c',0),(5706,1391294471,'0','f3d9a33909ad60ee33d92da8b13c654c2eb42450',0),(5707,1391294471,'0','4ec7c750b1a56d5153c23b1cc7f72cab51b7e5d1',0),(5708,1391294471,'0','4faf39f3c8a8c9ae0021c06114a2606787b50b23',0),(5709,1391294471,'0','adb1be697988067dffe821b39db948391bc3e881',0),(5710,1391294472,'0','1e01298420c3c47728987c309f752685c886a148',0),(5711,1391294472,'0','84177a66b546d03606928e9724054281fa58e9d0',0),(5712,1391294472,'0','d2ceda80efced525cdd466a10cea9f025af34daa',0),(5713,1391294472,'0','17007e565c6de0c43526c942b3962a200225b927',0),(5714,1391294472,'0','6f9c6c7911d4be0e03a1a9f6e4c3c66b92e8ea60',0),(5715,1391294472,'0','080df703df7c7b17f1ec818e0c7925a6fbe36bae',0),(5716,1391294472,'0','0a07a027d1157a81791f3d4ee7da306804e6cd8a',0),(5717,1391294472,'0','4f4375d734ddd22a5f43631a0e01eb41afa347a8',0),(5718,1391294472,'0','42f66d0314d02c970ca930e1a02af5a97d0bc763',0),(5719,1391294473,'0','f8a0c8d1e12c8c3e241bb9077e16c416475a716e',0),(5720,1391294473,'0','5ded6cb3a754b838e53aaa98854cdff950385ff2',0),(5721,1391294473,'0','6fffc0b9040f0e9df7e5e09d0865b086733a73c4',0),(5722,1391294473,'0','e57f6f4c6f0892aa5eef31123e4e0230e4c9d316',0),(5723,1391294473,'0','2821e984b51b3832694589d7e69cf373b103d117',0),(5724,1391294473,'0','55597f54986ea4b5d2f922e90be95215002448ca',0),(5725,1391294473,'0','e3160e7f42f5c3f929e992ee186be968afd1ecce',0),(5726,1391294473,'0','1d0bd5bbe7eef9cd577d6b2def385d3bb69f7899',0),(5727,1391294473,'0','dde2bf68934bcda8614a9bc5f231db0220693f29',0),(5728,1391294473,'0','65916595a6d45b75e5534a8d61ba0cf05cd37fab',0),(5729,1391294474,'0','734d7706cc2ae904c700af0120f149873e3e114d',0),(5730,1391294474,'0','7a8cbaec1b3b387c5405ce7c73bd2ee31adeacca',0),(5731,1391294474,'0','0bf0c572306bb77e3925a864286a2244458c260c',0),(5732,1391294474,'0','dfafaece86d20ad15e10a6d61143e79b2125cd2d',0),(5733,1391294474,'0','6acbbc5efc26f8c0051cb260d31cd58049884f68',0),(5734,1391294474,'0','d924935883ed86bf5d386051ea50062840436fbf',0),(5735,1391294474,'0','009bb9a8de25a16ab711ca8cb5ff159bbe6f08f7',0),(5736,1391294474,'0','f10945928f0c6fb7d9fb5ab742cc32d319ee2152',0),(5737,1391294474,'0','5570410f823caf833415d586f5c581d1ab6aec04',0),(5738,1391294474,'0','4ec53c8aaedfb24adc0d7410f5570502f6b35ebc',0),(5739,1391294475,'0','c8b0989b3f9fdbbc0e6353ed351e7b3f922a2579',0),(5740,1391294475,'0','3b0f6a6141e21c1bf1dd4fd684f16d9b9e654f0c',0),(5741,1391294475,'0','2f96df68da027f98e1680cffd09e255e69c0356c',0),(5742,1391294475,'0','37e09cc9bc97b7adbdd5ea27d3ee22c1395a9d51',0),(5743,1391294475,'0','ac8cc7e0dc0d33ebaf6e352495a67f26eacc729f',0),(5744,1391294475,'0','0d21d01387b7327779e0098debd9dec72a2ca301',0),(5745,1391294475,'0','c59405a32ffde08c6cdfc60e235fc19d1a754448',0),(5746,1391294475,'0','04ed4986383e2390011596295f877093aef7bcbe',0),(5747,1391294475,'0','82ad464078bcc8ed4f782406964d11536ebc0f41',0),(5748,1391294475,'0','d311234a10d19d3f0aa5b791ea42a12cde802d89',0),(5749,1391294475,'0','68f854700c5af8529126c04897ce0f0ed3b471be',0),(5750,1391294476,'0','9114a1d23ff0af2e50415d239b4aaa97d89e7d20',0),(5751,1391294476,'0','9627db6e7bea7e01f16abb761cc2740f38daa9a0',0),(5752,1391294476,'0','86ae03b0878e494962b16eb4589fdf4a931a2b4b',0),(5753,1391294476,'0','6ad8e02e42532d85de9b3e7efb18e3e0cd0eea9a',0),(5754,1391294476,'0','552b0d2ece869722ebdfbd9f7b1918d532648b82',0),(5755,1391294476,'0','d51f49165e68e04b0a15970c4f267e4b6087329f',0),(5756,1391294476,'0','2e11e84ed7212328fa44baf4f0823420e2ba4437',0),(5757,1391294476,'0','88151704616c2e7f339fb34395bb0817f3f7374e',0),(5758,1391294476,'0','a448dc42866ca9039bf598d4b9635da2af8512b9',0),(5759,1391294477,'0','7a8b19f4cade2f91cb2c18e9ab578313ac6cb4d4',0),(5760,1391294477,'0','3b5e46b85d8757c9acee1ce7ce4775452d5427a4',0),(5761,1391294477,'0','87fbcd49523ced00ae47e919e21d3ee67438bd2b',0),(5762,1391294477,'0','ce590e179c8aab2fa446026e7ad4bbed9bfac06b',0),(5763,1391294477,'0','be51ca7055eba62c964a23e502dc025f553214da',0),(5764,1391294477,'0','db9d10eddc5692327f68c12cec706d6360674126',0),(5765,1391294477,'0','f184fa46bf4e51ad1998028bda68bd37dfd36641',0),(5766,1391294477,'0','51a278ca0719e12e12191011fa0ade42edd14b6d',0),(5767,1391294477,'0','e5c41bc0e22ef4f7b0fb51a455f7f4e91e5cbea8',0),(5768,1391294478,'0','5217816fdbbbe4210b556171a4158ed33b696e90',0),(5769,1391294478,'0','d66a91b61ae3617e17e8303ff123d47f59d30281',0),(5770,1391294478,'0','c12391b7974fc8ffcc1c248cf84e6c87829e1786',0),(5771,1391294478,'0','9dad8a9c325db9e7911603fb19b23809361788a3',0),(5772,1391294478,'0','86508e0393b1b80cd6089dad7472c3f779ded414',0),(5773,1391294478,'0','5916086e3fd86863b6614b72c98c27960b116970',0),(5774,1391294478,'0','a24ec1c98f4f9d3323a9960472fbabe827c7a4e8',0),(5775,1391294478,'0','6d72706e112939a204b7c917e591e7b1e3c3b989',0),(5776,1391294478,'0','66da6e86b5dac7ce50f8184980d9636ee348d80d',0),(5777,1391294478,'0','66b42ff756b4b3fd59d009e85e03b4f8619fa3b2',0),(5778,1391294479,'0','41f48af26485d5d739c2460803bc946bba60c580',0),(5779,1391294479,'0','edb0345906edaa9951a2edde16e9bc32a903ae30',0),(5780,1391294479,'0','560ea1e4d53e447b207049ef7dba7d6a94641ffc',0),(5781,1391294479,'0','bac7aad0033f4a254b4eec0db3d69f011d222d50',0),(5782,1391294479,'0','1cea09e3771b716e28547f3c9be0bb738f149048',0),(5783,1391294479,'0','920daafcaa79b4496f1bc6a0c5813b394239eda8',0),(5784,1391294479,'0','566e8518484aa30b8c155c2ed91ed640f846bdc7',0),(5785,1391294479,'0','9907a8e08743c7aaa04ad35348d2d8c75a7bab33',0),(5786,1391294479,'0','bf02dadd9f4d5f4d9d3103a8696fef8f82115a1d',0),(5787,1391294479,'0','cc8c29dbf255c18a8bfe78d944b08cc8520f655b',0),(5788,1391294479,'0','6be6334854020e88f53c9b54110d92adbf963125',0),(5789,1391294480,'0','544c6700f72e01d887ecacf8a58b5d84fc986318',0),(5790,1391294480,'0','238f9f43de689bbcdbfeec50e9744f20cebf2178',0),(5791,1391294480,'0','d16da31ea49a8808c410cbbc355dd715ed1bf882',0),(5792,1391294480,'0','3c28dd2d7a816007c7eb57ba9f2ea3357f7d2d4e',0),(5793,1391294480,'0','68f89c103790abcc4f08d2f47c7db7b7a1de83ff',0),(5794,1391294480,'0','431047422bd206d3b15f7157d0075d6eadb72571',0),(5795,1391294480,'0','b3ac1cc9a184a47ffc869e9a287f23e2641a73b5',0),(5796,1391294480,'0','031b2ea796feaf576108262975ff90ce65eb127e',0),(5797,1391294480,'0','da684d17acc2db67f93b7c6825f80a1c82fc6d84',0),(5798,1391294480,'0','afdf14a0351078f92ccd632eee441d2f79f7cbd2',0),(5799,1391294481,'0','16a43755d8fd3021e6ea5f65e6ee71f407faa14a',0),(5800,1391294481,'0','5b9bf808fe8b4f45cb8072b0644963e20bcdad79',0),(5801,1391294481,'0','f89ae7bb067c564fa7f7d5f516be1546f406f9a3',0),(5802,1391294481,'0','38629da2cb43818cbac10c3f9b450c8bef9c3f59',0),(5803,1391294481,'0','e7461fa221a0239d5f987197b240b95e7a971f66',0),(5804,1391294481,'0','40f8dd7838156de9475ca15f56013ccd160f86b8',0),(5805,1391294481,'0','df325500179208c1cf5ca419849a849289c01186',0),(5806,1391294481,'0','8045b07e54e30c2d4239d69e97eb1c80f5cc551e',0),(5807,1391294481,'0','ec0e45e099e2188e100a6b550fb7e01290242f0c',0),(5808,1391294481,'0','fbd23970a66a1369c1ad5d8b0ff5eae5300109bf',0),(5809,1391294481,'0','977379f7d0e5a76cce9f59d565b93e8c0cc48f85',0),(5810,1391294482,'0','d4f060b8665dc7473319d870e64b8a63bd59b639',0),(5811,1391294482,'0','37825dc9d7a6e1edd330f16e932c206832d49151',0),(5812,1391294482,'0','2d9b5b5a2ac66c0a981350ae1e4c0b64ef70ca71',0),(5813,1391294482,'0','f867f7948c0ed0aa6e7249d8fc74fe555e5e6e6b',0),(5814,1391294482,'0','028c8dbaed0e56dc1063e582c6c2ccf5e21ae7d8',0),(5815,1391294482,'0','4e8faa7f266e4967447e0d04bfa84df7f18083e1',0),(5816,1391294482,'0','4ec0d8b75abad132ef18d8d972874249587fb8b5',0),(5817,1391294482,'0','1ad97217928553ed1e8058da832d3d1185f73c11',0),(5818,1391294482,'0','3994c7ada81dab8bbc80e7558f3686aaf76a238a',0),(5819,1391294482,'0','b79d6d42051e7b648f7d75cae66f57eb049b7061',0),(5820,1391294482,'0','d4e85effc1914fee09bcdf2c9c9013bbbbcb87a8',0),(5821,1391294483,'0','330bd6304ace5ac8d103f14357b3e58367a2012c',0),(5822,1391294483,'0','8c58a1f8b268b82c5f1f9bbfccdcee7009209f42',0),(5823,1391294483,'0','29e79e74282a1f1f5b91d107b7a311d4f8b5e5ff',0),(5824,1391294483,'0','3f2b04300ec821f40e8f3d403402b0343822445f',0),(5825,1391294483,'0','cbb841e725c030c4232be124504091a1b10bd6c1',0),(5826,1391294483,'0','e986582f760e121038e7f0a3140a3aaa9536c534',0),(5827,1391294483,'0','8dc09e7b01ed32bd57ae76ccc5b749b4f4d73994',0),(5828,1391294483,'0','c5d3cfce0ddf0acadbef428549e2ee4bbf8c4e31',0),(5829,1391294483,'0','bce7d2aedb3b3e0475eb8b11f817eaaf6bae3ea1',0),(5830,1391294484,'0','c136d9536734805a09e66eb58e99b89491db0b10',0),(5831,1391294484,'0','b68e061f1ae6c70dc3b12d3081d1df1d0df8c6ac',0),(5832,1391294484,'0','de0e9b8dc18b79064e537cf5ecf39c2fad894abf',0),(5833,1391294484,'0','56bc0dcf7ab696d181de154067b92b26fdfb0510',0),(5834,1391294484,'0','cef1f8470f7cfe5be3dcae87ad0617600b1240b5',0),(5835,1391294484,'0','c5e811523e8dea7e3cd0f1582be6d0ac58b2c694',0),(5836,1391294484,'0','88968352827cfef2c3af907d61e610fb4341ed9b',0),(5837,1391294484,'0','324cf9107331e9eef918694df181da99b03c2aa8',0),(5838,1391294484,'0','5758aa788746423c7a66375fc86f37bdf74fdc31',0),(5839,1391294484,'0','271540e2cffd42d3efdd1fad4d8ed9bb50a9414e',0),(5840,1391294485,'0','22e938b51a47ed9fca0b9f6a10aa64ddb44b489c',0),(5841,1391294485,'0','1bd3d40d350f5b644ed252381429964afdc3d0bf',0),(5842,1391294485,'0','0148f55fdc79f96c782de406a49384a6388f4fd4',0),(5843,1391294485,'0','d72d061bd3134c7c6d013903e12274a215111c6e',0),(5844,1391294485,'0','7efa53eaa21c28135a5f49d0d253f7805dc68d76',0),(5845,1391294485,'0','48093d762a80613d91675037e9d4243d8a7262e0',0),(5846,1391294485,'0','bfb122bf6d67f8fe1df38d9c435a0c30dc46bcea',0),(5847,1391294485,'0','931c4d775e202059ab1a3096f8f3d740f274abc6',0),(5848,1391294485,'0','35a39b77f6b59945a92f21e0f3307730e2a31ae2',0),(5849,1391294485,'0','9acc7212280001df944863a6c767bc5d18b70745',0),(5850,1391294485,'0','4bef2896d8b8e95c5717047f21f61c042a1fc1cb',0),(5851,1391294486,'0','de3a2801df4b8e66994b1966410fe7d021dbf1bd',0),(5852,1391294486,'0','a73b436ff0f9ff6335b4cc2e795ba0953fc88c5b',0),(5853,1391294486,'0','c0526a8b6bf48b5742df2074ae032a9d644731fd',0),(5854,1391294486,'0','bbef57513068f096cc980fd09aca57621f5fb656',0),(5855,1391294486,'0','bd949592f4b085f5ddf7d2679d3df3d41b5bf76a',0),(5856,1391294486,'0','da0f7b2e1eff316219bc0c19dba4755db26b363e',0),(5857,1391294486,'0','335f916d6fea9b5f1f1ff1b113e4b6017daa76ac',0),(5858,1391294486,'0','ee498b447e5a9313c5df41b6c35947f3264b82bb',0),(5859,1391294486,'0','edb19188798ab68f9357742a602f9906104cca9f',0),(5860,1391294486,'0','8f02968b1f4cc150b89006ff25a4b5dec9a60e01',0),(5861,1391294487,'0','075bb12fe88a1c982b7489247529831158f81328',0),(5862,1391294487,'0','f34c52956d39769c78e674900148e45d44d34bb8',0),(5863,1391294487,'0','5a1f2a78979d6f232f62fe03b5a8bfe86a777a3f',0),(5864,1391294487,'0','3423e176080514c0774a64380eeb1b5ffbfb1c00',0),(5865,1391294487,'0','52c0712c637d8d51c629497b850d910bc49c54c5',0),(5866,1391294487,'0','0320edf28a0f2f8d079f06cdeab4e1c272b817db',0),(5867,1391294487,'0','ddef521f97569396bef48a0c6686bffc7624f7fd',0),(5868,1391294487,'0','383e5ab85f5322fd2ac90df1b50adc2289844a10',0),(5869,1391294487,'0','4b42c5907e03f6f67f31d0db189cf31cbdba8863',0),(5870,1391294487,'0','664d76113c6c72370c419a8467b9ea162393feda',0),(5871,1391294487,'0','762399d4a97a9b90c8aaee9bbf1c1ea8902cbe12',0),(5872,1391294488,'0','a109372ffe4863b7694d5f9393fe18c5124fb23b',0),(5873,1391294488,'0','3b773a3fc6cc4d9d0d18efdb9656702466bcd0aa',0),(5874,1391294488,'0','38d4a23069446aed983f376825f7d8f2d6408370',0),(5875,1391294488,'0','e5abd780d3bdeadfe0b1b19ec046a28de2db4e54',0),(5876,1391294488,'0','a6734a4665ccd67651f27838c164204d08314cd5',0),(5877,1391294488,'0','1081861bba5056b7a25df5e8cceef8083b5fccd8',0),(5878,1391294488,'0','24d65f862fa63423fe703674c2028d057d04059b',0),(5879,1391294488,'0','429ed79af36b3438a6112ffc632a24a8e4ff3081',0),(5880,1391294488,'0','e61431ef22b0fdd1ccaaf03ecda6e74e2661aac5',0),(5881,1391294488,'0','96ba22b1e58f537ceac9000d42fba92f434f60dc',0),(5882,1391294488,'0','4fd5dfa934c43a8c946cd280a73f9c73622e20f1',0),(5883,1391294489,'0','970e873fb6f950957c3087d7baecf9ca55366ca8',0),(5884,1391294489,'0','004762545cf6fdf774428e5b216c50562504d3ef',0),(5885,1391294489,'0','194978f8dd60a61362b68509531141709757d96b',0),(5886,1391294489,'0','2b6aec92cb79e9ebfa13a45a5c95346277827509',0),(5887,1391294489,'0','6363639093ee3c0cdae03090c22ab8679c3ae608',0),(5888,1391294489,'0','4bab4ef3e15f78841cfe66f80f52f17b11f118cf',0),(5889,1391294490,'0','cea545b62371bbe5f076bb8ae959795ba87fd2e1',0),(5890,1391294490,'0','821fdc05875b567dcb4f38dfded5eb21761810d1',0),(5891,1391294490,'0','9731258746cf47d77912b9a5f71d426fd21585e5',0),(5892,1391294490,'0','846ca62674a66003695ed4f61ecf0ae9c93b3e09',0),(5893,1391294490,'0','81cfab0eb206e784aa0420cb02d280fde9de9b0e',0),(5894,1391294490,'0','78fe641509ceac2551b9ec855a2d1bdca351b698',0),(5895,1391294490,'0','6a3d9bd5d2797f6426d6fcd07c55b95cf76210f4',0),(5896,1391294490,'0','4ef52559dfcdb215ff2ee0ca59d618a859907725',0),(5897,1391294490,'0','afb1dd7e167e070e4e44d75d2cf9acb52781674e',0),(5898,1391294490,'0','0468d40becbf7f3d81b5bcc10be5d62151e2cbab',0),(5899,1391294491,'0','ada0c521fc5711f765e055c934edcdf9db79a24a',0),(5900,1391294491,'0','b075cd917b8ac8476ce917db8e4002927f83a8dc',0),(5901,1391294491,'0','da217954af3647b7701b84db7771a0d28d3c4d33',0),(5902,1391294491,'0','2c89655a7b751d4a405d3d4581050e90df66d6d5',0),(5903,1391294491,'0','26fd29898ac35c6ed82bf842d0e2cc89941a04ed',0),(5904,1391294491,'0','ba774f98b4eb95015516551d8d11c6f68b6a570c',0),(5905,1391294491,'0','c66685f18790218c673faca9e6b629d98ace8715',0),(5906,1391294491,'0','814be4f73a0983a9f460581272787ccb7680611a',0),(5907,1391294491,'0','0763ae665067fc6b9949341a8fbc18f6035fd35e',0),(5908,1391294491,'0','929fd1c8b14016b510aa76d7cd0a3d4dd8ac3277',0),(5909,1391294491,'0','e149f87ad9bc59c46218fe8c6862b4b26290a394',0),(5910,1391294492,'0','3988589659d9ee2a555d4242175bf04740015815',0),(5911,1391294492,'0','12d9e4e612cdc12fd93b1f5576271c449ab1acc9',0),(5912,1391294492,'0','0cc9d80d0e5a24546af2ab961ce6f4749e43889e',0),(5913,1391294492,'0','c5619e36af398d39390fc0b9b739530a48a4c3ed',0),(5914,1391294492,'0','c8636720120fc8addeef948e9243fa58694ff478',0),(5915,1391294492,'0','8d63cdb4bdff4fa3922bdd0ddd977638eb04028c',0),(5916,1391294492,'0','c6d73334cc269291661d7627f18f0e0f2ddd3baa',0),(5917,1391294492,'0','b88fb939f021c4632b7b19833d838c321fa67740',0),(5918,1391294492,'0','697ae01fab759a6333a5933b1f33a514f22ed28c',0),(5919,1391294492,'0','a86f0390f9e92679e6040b712b465e0d5601ec2e',0),(5920,1391294492,'0','7e4146f0d978604ffa14141c12b778579ebb66f6',0),(5921,1391294493,'0','785566a1d529669347af53cda38890904f8188d6',0),(5922,1391294493,'0','99723eb357cb27644554d73a098df63b4c7eb5b4',0),(5923,1391294493,'0','f6d1632f8782a8fd369addaf9b36df0cc421180e',0),(5924,1391294493,'0','4d697e41439d19fa29a5f7a0f3545ec9c094e932',0),(5925,1391294493,'0','fa15faf64824e2258b9257edd97f9d16464f3852',0),(5926,1391294493,'0','4b88a71c300dae511df96f64f14b10bf86b0d9f6',0),(5927,1391294493,'0','d1b06f2e7c6b2f8290d9b6fff825d7bd97adc5ee',0),(5928,1391294493,'0','465b82724e6893e913f9a89e585f06adbf98096b',0),(5929,1391294493,'0','8738a460bde16778233942905a96a1820a822ec9',0),(5930,1391294493,'0','3da350716222387d38ebb56923a51804cc11cbfb',0),(5931,1391294493,'0','3a5d42b4bbbc15a8a7493cff787b438de48985d7',0),(5932,1391294494,'0','5d5596f9021e82e77972558b9652d0e45fd0d8e4',0),(5933,1391294494,'0','34fe2e99f34fae49ffd90708b1837868b2d442d6',0),(5934,1391294494,'0','d8898ea8fb9d899e9247f2064aae6797d714b126',0),(5935,1391294494,'0','ebfa77fe50c160a5689f568970c0b9445dc4ce56',0),(5936,1391294494,'0','bc63c2fc3b80e0705165bb4dfcc39a99897f16bc',0),(5937,1391294494,'0','21e3f0b0ee6fb24e9fe204b731b14fdd028a0032',0),(5938,1391294494,'0','5bab9ef9d0388acacd9a3335ca58e64ee0d8fc42',0),(5939,1391294494,'0','86f3e3bf6c7b5b22896118f69b165b5c3defc2d9',0),(5940,1391294494,'0','3a82466121c34f965dbfbf6a2588419dc93a605d',0),(5941,1391294494,'0','4d77217cd29aae872797eb7df9008c46c8a8dc70',0),(5942,1391294495,'0','3fc21761d7efa0a08756790c5646ac5c3ed64a8f',0),(5943,1391294495,'0','c45f5e933fefa49ca3862fe7f9d9857722e98022',0),(5944,1391294495,'0','28e32295df544f1c94dfe35049a8c8fadedbc915',0),(5945,1391294495,'0','35cf877b7e0934c15475d3ccbab760903d690ac5',0),(5946,1391294495,'0','b368365abbee03aa0f3e77ac02e49bfda66b1bfa',0),(5947,1391294495,'0','fe1472565e576d26111722b00b70eda8eddf8dd4',0),(5948,1391294495,'0','bb9017cb8894b501a0e0c2cefe2d8943bdf71473',0),(5949,1391294495,'0','8426a18ffca09151575c8620c9c824206c137dcb',0),(5950,1391294495,'0','65ebbb08d7cba604785ff3b9736ac87b0678033f',0),(5951,1391294495,'0','24b284585e2c19b24112878111b33c4d3558a662',0),(5952,1391294496,'0','d549eec6f1b44478151fc477252a218cf009991b',0),(5953,1391294496,'0','e3924fc129d6cb464481cd767596da81a60bee8c',0),(5954,1391294496,'0','af2ab8a7d087d11c032cf5eceba13b18fc66b245',0),(5955,1391294496,'0','d8cde215746c19c9b0c0654e0048c8b310570156',0),(5956,1391294496,'0','63ac200423e8f18c0e6d576f6204c7c39ab34e2b',0),(5957,1391294496,'0','fc9ac46842e1cc8200a0d6cec1bda25b9cbd18ad',0),(5958,1391294496,'0','9687cfd71cec5d789bcdf6f111ccb3919c27ba4d',0),(5959,1391294496,'0','422bf6652ce6b840eadc89530053a0b6988450eb',0),(5960,1391294496,'0','b960bf4a22af8be15c1111844b4c6295d75defbe',0),(5961,1391294496,'0','5738f711cb3a7c836fc47d8e03c291bcfbc78510',0),(5962,1391294497,'0','a2df98b2f3231b3e3152f7bc920c95a05b6cdade',0),(5963,1391294497,'0','07d21e315e0aced76fba32caa19f53fb19b13e4a',0),(5964,1391294497,'0','80ebfa52913b24e3cacf38e707ebcfdd414810c3',0),(5965,1391294497,'0','6536f973fb1251245caab926535901df39ed33c0',0),(5966,1391294497,'0','cf22e51fec53628fea79923493fa6ae8efe97848',0),(5967,1391294497,'0','b0ceffeeb9f7a0a6174100f5402354080b882e9a',0),(5968,1391294497,'0','10ea865688be8c15aa64fecf2832899034fafab8',0),(5969,1391294497,'0','74393818cc2fed60a445f3474c8c550de7adca39',0),(5970,1391294497,'0','b54eb037dd48a6e4ca15db696c97470dca0d7648',0),(5971,1391294497,'0','b86adee58b32cb69a4249539317b2bc39557f77e',0),(5972,1391294498,'0','4572f0d186d657777181f600ddc8d24e7728aaf8',0),(5973,1391294498,'0','9356e78f2a5fdc84d4ecf58dd418644b8d1539c6',0),(5974,1391294498,'0','f63383da34f649b2b1f016ce60af338b16b71d3a',0),(5975,1391294498,'0','8b601d432e075eb2d8afef336e0dcf0c5dcd1801',0),(5976,1391294498,'0','d93065380c838f3c5a20cd81d55306f898fe124d',0),(5977,1391294498,'0','411cf55628da91cb31489452565bcf5ee22a4e3a',0),(5978,1391294498,'0','0ac3814a6a21d1dcc363e5a3e8ba173b390551d6',0),(5979,1391294498,'0','68280af67bc39e49b2781fc55cfdff7c4cfc93b2',0),(5980,1391294498,'0','e26c808179a51682c2dd879426ff3c2fa35740e1',0),(5981,1391294498,'0','52911031da3a873ef863e988af0d605676671812',0),(5982,1391294498,'0','7048fe6775631c52162c233ec8bd45776cf7439a',0),(5983,1391294498,'0','fd4fc05ca674cf13979aaf8ebe5dd7ee5ff9e05e',0),(5984,1391294499,'0','8814b88238ce6831f057a958fe83e8659bdb2e85',0),(5985,1391294499,'0','e9bc856c52d6482cb5893751a98b152fd2f822d7',0),(5986,1391294499,'0','9da4dc2e0a351dbcb2a10a252bda0898c9aba6fb',0),(5987,1391294499,'0','9c638479fa6c7c049a761b38e1f4f77212b59c64',0),(5988,1391294499,'0','774614a82750c1cd13a941a496bc0e81b3fa93aa',0),(5989,1391294499,'0','f958e90802841c356120ff9f93c9f68734f03aaf',0),(5990,1391294499,'0','a480861a1713ebec27aa68946ed7b3d9f5aa7285',0),(5991,1391294499,'0','724235a4301a5b27e53f361e6562069ff3899d3c',0),(5992,1391294499,'0','aa066b816241efd34c75e0348bfc3ae112aa3837',0),(5993,1391294500,'0','ac3afc4863f16a54c7d61fc9cac5cb59b42a0acd',0),(5994,1391294500,'0','13cc89d91cc7e59db1a18cb55467b70dfc606716',0),(5995,1391294500,'0','a9fb72e874382c87f8c4dd69f8420e658cf45c2e',0),(5996,1391294500,'0','cd3cf1875c13a10dd273e3044660f4ea36e8fbb2',0),(5997,1391294500,'0','e593c849459a6af46a3fa009d9c70008cabc47f2',0),(5998,1391294500,'0','7cf560b8f041561c934faf09c9fa2b1e4448a7a2',0),(5999,1391294500,'0','13906a92652381e451008ab64bb7795282cdb301',0),(6000,1391294500,'0','ec9324a3e8a49a546f476442e9095399fd4ae865',0),(6001,1391294500,'0','6e1b70628d1f13a3f9b3d8aa3db60a3b18eb02b6',0),(6002,1391294500,'0','6f0a4ca1382e94d53f47903b28aedf9c7e32861a',0),(6003,1391294501,'0','1a20df68e7821f7fc802f79fcc273a2c2be6f4ed',0),(6004,1391294501,'0','b897e762d0f87ce78ad50315bbaf2667bbd0a4e4',0),(6005,1391294501,'0','14d9cf4cd72c84fa86528b4c8a5e16687c2452e9',0),(6006,1391294501,'0','c87053d935b1460d62b9c862592220482c583fe1',0),(6007,1391294501,'0','9d39aa7399a3e08f72897a13d71f7d2595003b27',0),(6008,1391294501,'0','8dd7b669638bb95451712bcee18d7b09aa515ee2',0),(6009,1391294501,'0','ba113e94156a39149979297833947396089c4464',0),(6010,1391294501,'0','31c725bc644d7eaac9f4a623499e14e97944a9cd',0),(6011,1391294501,'0','0fb19939ff4e7fb905f60fb156457c8d7a940129',0),(6012,1391294501,'0','f7962003512a7ca37d891a7aa4e0728752f2e7a3',0),(6013,1391294501,'0','69d37f33191beed3f5581e2017b43ec959c577a1',0),(6014,1391294502,'0','5d7e4ebe3a1d2b69b7b49883820fae9ee76400c1',0),(6015,1391294502,'0','20d88b6fecd2183501da34da48c80397e54246bc',0),(6016,1391294502,'0','442fa3849a27d45be3b6e4e722ccd7c93fc2e72f',0),(6017,1391294502,'0','bdd00583896d620deed3aa3275a53bf4e9a10dd1',0),(6018,1391294502,'0','e35f7cf598f4db3fd721bf37234dcd512d8d9785',0),(6019,1391294502,'0','4c357905a0854d39acb2f66ae161c71f88a5f705',0),(6020,1391294502,'0','298bf9bf2e60a99722e18ea7e56dfeabf6027f52',0),(6021,1391294502,'0','0e09e3d4d7ce59d5230475ef555b3a5fb5edbbd9',0),(6022,1391294502,'0','05cbf09691dd6eb00aa8bf6b4f4623beccd7ea2b',0),(6023,1391294503,'0','8193cddf461afad0c321c0f5c661fe33e737a13c',0),(6024,1391294503,'0','f3f6689c7f169b7491b28588e5159b20b31e9df3',0),(6025,1391294503,'0','bb8a2cc00402ac545fb3bbd1f644a78973072d1a',0),(6026,1391294503,'0','de3e7f83f37c0b4a20982cf81fb66a212a81bda4',0),(6027,1391294503,'0','2fc8c8a94ff12e5ec53aa55ac52202fe61b9f0ca',0),(6028,1391294503,'0','91b852e1b3c09f3097f2dea74ea91bd7019296a7',0),(6029,1391294503,'0','455b514393f6fdba4bcac0e36c482c1a3eaca60d',0),(6030,1391294503,'0','7e08218923577f893a71bcb82dd77f07fd4e0eb0',0),(6031,1391294503,'0','ed42a713580b8004d2a65088cc7e00f3d1e7e38b',0),(6032,1391294503,'0','6cfcc3ceab7824b66a8434b18fb53c2207ef0e67',0),(6033,1391294504,'0','4c2348f94ccca9696c81fdf90aca10d7002552d5',0),(6034,1391294504,'0','8928b5c8ca41e5d8bd1568e8a19e3e4d063bb5be',0),(6035,1391294504,'0','ccaa71ec89afee25a4807e88472d9ec4278b31db',0),(6036,1391294504,'0','4a372f8b52b961423eace499eeaea316ffb83ad5',0),(6037,1391294504,'0','e4245d168b9c81edbf0dc02cf738a52225c934e6',0),(6038,1391294504,'0','a4a2ad096b5a06dc3a6db720af2cc6f890059a73',0),(6039,1391294504,'0','2e476f60635eb70513d2986a55f1ce1392f1adce',0),(6040,1391294504,'0','49d2bf9788773979d9474b241ad619c1b3d7f6c6',0),(6041,1391294505,'0','4487365b804634210a8d8d677fea8c02d04a6c8d',0),(6042,1391294505,'0','21d3f3ed6e7ef941171a141d0e820f99a147f58e',0),(6043,1391294505,'0','2221ef8ad1e18ab81a386c5c0aef42283b2e3e68',0),(6044,1391294505,'0','928c5bf820c3f345477a75805da2de17b24d11d7',0),(6045,1391294505,'0','2e7a8e09cdc46867e30671101fa20fb9e0f50d15',0),(6046,1391294505,'0','62ee7d465dae0b6a60863d979fb7ae97018e920d',0),(6047,1391294505,'0','c3cd17cf7042dabe54e3222219de7b0fd9e4f878',0),(6048,1391294505,'0','2516a7b1ea3ed0b81caa4eb7ef78563438f95afd',0),(6049,1391294505,'0','d11211b8fdff55dbc03c5405edce52a5f4b8cfde',0),(6050,1391294505,'0','aa16ad17661107fd074a0ae6bf5ef0454973801a',0),(6051,1391294506,'0','b84ca4a13fd6a8d2995d7ea34396ff462c4d3828',0),(6052,1391294506,'0','aa03f568bdaaec4f77dc676770f372c5fad3b4ee',0),(6053,1391294506,'0','487ae94ae5733a3bc428494ed4c4627ea36fe4b8',0),(6054,1391294506,'0','c01510db86a57578bb725e884329640aa4d762ee',0),(6055,1391294506,'0','6e7844d8c0fac85b4786ebb8e4dfa96cfab99205',0),(6056,1391294506,'0','eb37b40bf4e2fcde045e472a17287584879c5a77',0),(6057,1391294506,'0','22b15f76e694ce5239b8988ed2e060d797341836',0),(6058,1391294506,'0','66d3a5feb10998e694dde30143ff37b652c36950',0),(6059,1391294506,'0','8be8490ca7ca30cf98e4fc3b4b61ace56060352c',0),(6060,1391294507,'0','ea1cfdf6d5011294ff424e4a5f3468b3447f9ee4',0),(6061,1391294507,'0','f09f8cf58f3099a71760e7271d388903a475d759',0),(6062,1391294507,'0','2cffbd9ad7030f8e1dfb9c7c0dbd4d037176cf3b',0),(6063,1391294507,'0','27b670bf18baf586a0fee95c51c8bb63a237fe4b',0),(6064,1391294507,'0','835abdeaf5529467a3f2bff70f886cd45d068e22',0),(6065,1391294507,'0','2b429fa6f6c6cac973b7262cbeb4e132f2ef8a36',0),(6066,1391294507,'0','ed29fff435f07de0ef9bf725658ed13bebac9f7b',0),(6067,1391294507,'0','14b429a8600c0935dadfa8eabb03341c58fec0c0',0),(6068,1391294507,'0','e0f85801a5aba5da6a26ff5a6fbd5bb32eb84c7c',0),(6069,1391294507,'0','77f45d12af3332ad15869b38b60b8ba5bf143d6a',0),(6070,1391294507,'0','4c5b8e1130c80db09b972f6a8c8f45d03b790e18',0),(6071,1391294507,'0','78936789c2227a4f14f00597b51516916d990c0e',0),(6072,1391294508,'0','87fd5e5a08b97a2c8ebd9f2efd1308a10be38a82',0),(6073,1391294508,'0','64b65cb80d3db34fb03c57b99b9d67b4faf7a2c1',0),(6074,1391294508,'0','1fa478e54dc5669b9a0c1037f55649eca974a286',0),(6075,1391294508,'0','d780a50ac90798a4cb8ee014e3743c4763db86f9',0),(6076,1391294508,'0','886e456478c284eeb57117a076702b910e8dcd7c',0),(6077,1391294508,'0','9cfb90fa5e96515de5aca6253eff7637730e1f79',0),(6078,1391294508,'0','d234e692d68b9c14176c87019ae7469a1831cbf2',0),(6079,1391294508,'0','617495bd8f14f1260876a1d6fe37b2c768afb2a1',0),(6080,1391294508,'0','f62eec2a94a028258311d2e0577956119c59fd86',0),(6081,1391294508,'0','6da0c355aaebacbd3d03074ca71ba3c204ed584b',0),(6082,1391294508,'0','aa3f71fdc8c803f1bf22abedd0de908c9482ef9f',0),(6083,1391294509,'0','cabeb3c1ba8d1913a8cddb20d5262e7d2cecc059',0),(6084,1391294509,'0','fb2ad1696281772ec6dd02a6a30b137c896c2257',0),(6085,1391294509,'0','f22b073554905c299ea50dddd6c530369558c9d4',0),(6086,1391294509,'0','5ffa0870072969bb2002ef6a657ec7bdd1032715',0),(6087,1391294509,'0','d42ddd9cf0b0e5ff7a4b178a28f97e115aa459ca',0),(6088,1391294509,'0','7aa9cf9a8e2a677103a79749669f9284898fd93b',0),(6089,1391294509,'0','9ff7890ada5b8a575c57179bdd783d9224a6dfdb',0),(6090,1391294509,'0','abb49ed568c12958eb92b47e299d565d5ef462fd',0),(6091,1391294510,'0','0e75504e823dc2c59eabf5a739d11e425e99a253',0),(6092,1391294510,'0','9c3e962db72864ce1489e97c7727f772399ced08',0),(6093,1391294510,'0','30992b8234b7457999ac5db0119923ee03da4bcd',0),(6094,1391294510,'0','c6325cdb8d49c6eae19bb2d0cb40bb705257592c',0),(6095,1391294510,'0','d6ca449da6b4d114f7e453a9a2f1ba586fd10a20',0),(6096,1391294510,'0','2f4672bda12f0619d06c411930b26ffdea8b9dcc',0),(6097,1391294510,'0','e876e6dce661fcbb54d896b8b2a184cd672a1786',0),(6098,1391294510,'0','1bac9d2678208f5c1bc99ba99fc215754bbef941',0),(6099,1391294510,'0','dcb73772e274f958385af41f4fc6bae7ffa98641',0),(6100,1391294510,'0','542289f14a03e364bd90726700250a2fc9b41a63',0),(6101,1391294511,'0','b7d22b13135ddc64e04bf903e35f0d8fc9cfca44',0),(6102,1391294511,'0','d19b3c1a502bc767c3892e8fd748be7131fbc4e7',0),(6103,1391294511,'0','c1e8f29ce6e89d4c618a5a8335d5787fd38a5c19',0),(6104,1391294511,'0','835281bf03cca892ff54d6bf8e5c12531cb4d3c9',0),(6105,1391294511,'0','a069aaa26e3295d04b25dd7afbcb33d26da057ba',0),(6106,1391294511,'0','0e186965e6d8edd8eedce1f7c4fc0efded12f9d5',0),(6107,1391294511,'0','4462614f7ea0bfdeb2faab9ad06dacc7702c01aa',0),(6108,1391294511,'0','c3d06fff214d786585867fbbfc0fc4edbcc3d74c',0),(6109,1391294512,'0','d8db47324872680192c375130aa5c0006c6d8c51',0),(6110,1391294512,'0','1bb96ab8751e28acbe79ace4b50e460c631141eb',0),(6111,1391294512,'0','eeb0780feda390231cdaf5356c912b2c68531ef0',0),(6112,1391294512,'0','a9427519d46d0568cac2b60481bcec299c39b7bc',0),(6113,1391294512,'0','2de2acbee23a80a8c42f6d5d0e9ff182d9f6dd83',0),(6114,1391294512,'0','847bc4f310d2a98e671ff87a6deb6d491a508f24',0),(6115,1391294512,'0','91a29e1bdaa878f38f8150089180e734f0c778eb',0),(6116,1391294512,'0','fe8e181951359635b7eaa2fe1ced44280483b1cc',0),(6117,1391294512,'0','d633668761b6c981464087018b25c080630e03c7',0),(6118,1391294512,'0','91745680d500fc4e50137c0f0a02774f7fd59eb7',0),(6119,1391294513,'0','1083945ccb3f52b7cea17300104fe0e3cb980578',0),(6120,1391294513,'0','bd157834955143897016069e2aba7e1793a24ef2',0),(6121,1391294513,'0','90bed296e178ef4397d94d812cf87cb0a57d9803',0),(6122,1391294513,'0','9944f97de0ad6912db3a33ff9bd313cbdd710107',0),(6123,1391294513,'0','8499e924918b25dd90c884147c3951884a37cdc4',0),(6124,1391294513,'0','c2438ff0171eb3bfdc44ddadbfe7671dd7cf31d9',0),(6125,1391294513,'0','81390baa4229a7eff8e91d25d86f769757380e8b',0),(6126,1391294514,'0','0d9d368a526b9821dd264d7de17fe7edd6f0de58',0),(6127,1391294514,'0','27a5c7d58f1f3992e6eb98495af9ae3fac362bc0',0),(6128,1391294514,'0','935bd6ae90db3590d80a8b9bd66bc9a0cf7baf6b',0),(6129,1391294514,'0','fb20343acfbc9b04a5d26d68cb65e72c5aed075a',0),(6130,1391294514,'0','a065aae731e3219b99c6c1362cb50b2235f8a82e',0),(6131,1391294514,'0','eeaa51a349b1aa4c51194bf930d33b6844b60abd',0),(6132,1391294514,'0','7ce1af5d0fe2fc09f3e98dcec880663ac6055450',0),(6133,1391294514,'0','6aa357c698e00741799f7c60332fce2cf74f0d26',0),(6134,1391294514,'0','a861635649320bdac4a1a23a04274509d8e0e901',0),(6135,1391294514,'0','c4c366a60bec72b1ed4574f43635762a59855779',0),(6136,1391294514,'0','893b2c6015a0118b5092ae07e4e1b65a292ff0f2',0),(6137,1391294515,'0','0d67cb26543acea301a4dc8e14152fc7ebf9d13c',0),(6138,1391294515,'0','d82869a3171e125109d45b046521771f36d34f75',0),(6139,1391294515,'0','3be532e78f559304f4fc571bbe2745c81b613e4f',0),(6140,1391294515,'0','a90a3cad9b65bcc641fdc930b9f56dc14062077a',0),(6141,1391294515,'0','9a43209fd9cfa05824b46940c46689d1444dd963',0),(6142,1391294515,'0','d36160f8fcdea613c7c9ff0d512bf12fd7eac711',0),(6143,1391294515,'0','c45e29360d6ead81c0c82dc1269fb0e781fec77c',0),(6144,1391294515,'0','450d67f76347f6cbed992bf1c7d3da2b95ed57c3',0),(6145,1391294516,'0','748b5bb634754c6115e6cdcedd2f967f829f7030',0),(6146,1391294516,'0','8237991f7a547520da0d1db2bd4d1ea65d00a6a9',0),(6147,1391294516,'0','9be74e48e8d6aac00a6afe853a40e116e4db34a7',0),(6148,1391294516,'0','1fa71f4d4d25526feacd6a9aad1c4ab833af1b7e',0),(6149,1391294516,'0','44f71fa88cc3d37d86e5c0bde92694cda3732fd0',0),(6150,1391294516,'0','3ec8c48ce8edd4b0560fd958136634e4a269013f',0),(6151,1391294516,'0','3e1cd111b1b9a7e3164715c98096a8e553ab487e',0),(6152,1391294516,'0','393d8ea648118b5c38420684e91ca0a28a0c95d7',0),(6153,1391294516,'0','7fcdfd9cf595e8c30a3cbe0711604ca118e1d3c3',0),(6154,1391294516,'0','d82c0cef27596a6dff4a6241e88af54b6ba71df5',0),(6155,1391294517,'0','44138c635529d294cfb03db809d0b0dafd07408c',0),(6156,1391294517,'0','3bc17b2c4b392b3901155b1c63be9e6c5225e66d',0),(6157,1391294517,'0','97c8e4811d0244521b47287f452b3f9ffd52d1ba',0),(6158,1391294517,'0','9d8ea69894143b0071e3d8147eefdf060b56c236',0),(6159,1391294517,'0','f1aec289078d8936f059562024117769a23272b0',0),(6160,1391294517,'0','09e271f8eeb4965a5e9862cb3e59428031d4e6c3',0),(6161,1391294517,'0','3352340b7064762f17d41db3d975b73472f0ab52',0),(6162,1391294517,'0','94f02367067d1db2b5cccfe860d7f78f1e2ed117',0),(6163,1391294517,'0','45d52221609096e914f84db0e8bcd96be97a4667',0),(6164,1391294517,'0','c843f2ef7392fed26edf65147c90441d01ab3578',0),(6165,1391294518,'0','91f14858feefdb9e6696ef8ec7266e0590b8ac91',0),(6166,1391294518,'0','e5c39236db9e795710077e5be0bef132db64566f',0),(6167,1391294518,'0','60ccc0172624220b89e259e7e171975366f62c4e',0),(6168,1391294518,'0','4a05cae9b6ce9b7aff8d5bafb6c78e7ccc94ea3d',0),(6169,1391294518,'0','f0403f37a62526c5ae55285d1c4c245b22d16a3a',0),(6170,1391294518,'0','addc8c6b2c818dc02386c348dbdb5f0305ca3a6e',0),(6171,1391294518,'0','98df722c9963f565361290b1c8e4f43e015439df',0),(6172,1391294518,'0','cdc37e08c2b5b2f5eb90486e8b4d3245aa4d7d31',0),(6173,1391294518,'0','79d023e277c9fd9047f926e5c005dc64896d291a',0),(6174,1391294518,'0','48fe400a40337e71d8191a90df014683fd623822',0),(6175,1391294518,'0','65d33087454516da3d027c5a7b501672d889386d',0),(6176,1391294519,'0','ca1abea18c83f494ffbb11183eac96250cf47082',0),(6177,1391294519,'0','cd6b5c10615bfa05b98088eb9fa0bf4f52908bf9',0),(6178,1391294519,'0','cd351f8fdc0ecab5d0f08d93156a5a387515930b',0),(6179,1391294519,'0','d6b17e9cc8a1df9367a6dc6d4e6a6bd5b61ebbe9',0),(6180,1391294519,'0','f34d7cce75ee54facd4fe966f1aa296981fa8d86',0),(6181,1391294519,'0','a1c970213f4504f1cd2e279eaa5b262013e51031',0),(6182,1391294519,'0','e0d6f59e0ef2159e43a5d330f8787d273ed61844',0),(6183,1391294519,'0','87c0cc09ebfc0f5fe77334e2834efb71a46a181b',0),(6184,1391294519,'0','f190b920f69b31949dbccf26a6e6da65778c2a53',0),(6185,1391294519,'0','95adec9be1439212924d5afbbe613e135344a8b8',0),(6186,1391294519,'0','c6b0bbe37667dec8e9db33182eb7aeb9e8653f5b',0),(6187,1391294520,'0','8400c189d50c7a59b2cb9d9a72924164e3b8fb90',0),(6188,1391294520,'0','5865feee50faef5718184b3a3c1d9d7e24947025',0),(6189,1391294520,'0','2a0d74962105792c1d01980fe501e777b07b2425',0),(6190,1391294520,'0','c041b193a64be6ae2a1ecd60009b4408e296910e',0),(6191,1391294520,'0','78754687ed70b1fa9853bea6c94b4a272394a454',0),(6192,1391294520,'0','fd1c97fae773129521d63385cc1499cb8019947b',0),(6193,1391294520,'0','d39710de43942d12c29b3e5fe4da2d24a1422dbb',0),(6194,1391294520,'0','01c3e63a4df52af554fcdf2b376ec895f353e71b',0),(6195,1391294520,'0','968ec47342e98fb33521541777ec879f12f63286',0),(6196,1391294520,'0','e3854166af563b4bb2db0d3761942bbc9553be17',0),(6197,1391294521,'0','b6f64f2916554b64d4e8981a2ab51dcebaf68c42',0),(6198,1391294521,'0','553563d118e9c85d311377e485e975d11e1163b9',0),(6199,1391294521,'0','a4bbff70eae1e554b2d4443381733efe2d82958e',0),(6200,1391294521,'0','b3a4f1111ca8fc77ad996872a847849654c43748',0),(6201,1391294521,'0','2b591455e96d3a4ad1e6d8b2411e30d1e4dc19a6',0),(6202,1391294521,'0','6f0bccfeeda7d8049fdda8e07e5c2a44e311ac45',0),(6203,1391294521,'0','bb6055106f98e4a258e2c61d7795726d77809bec',0),(6204,1391294521,'0','b83bb5d393a99f462808a7a2bdbb8cfa56134cce',0),(6205,1391294521,'0','11c2b04d6a61c11c23dd1f74a9612b43e931baba',0),(6206,1391294521,'0','ffeef3f7b7fd757aa7fd435d399cd2d85856aa2e',0),(6207,1391294521,'0','8b1a58e641f95536c82cab6494e2274286a9a8a6',0),(6208,1391294522,'0','b06a91b42530051d77aeaba6bfb8ec1d32b39f13',0),(6209,1391294522,'0','b286f5171a120b27ed0b12a70bf3d7843a38533f',0),(6210,1391294522,'0','efafee7e37e94616ced134113fd88b8c83baa70b',0),(6211,1391294522,'0','00caff415f212d175335b744e09e15d81e5e0ea4',0),(6212,1391294522,'0','5f4e0cf495262136e9ba1123da583ab961f2f615',0),(6213,1391294522,'0','eb042b9cbb3dd2d0010446ae460b52974697a0a5',0),(6214,1391294522,'0','a89e62a88d7fb1ec3494ef5a37d10bc6914a8783',0),(6215,1391294522,'0','ac81e47002e157fd87bf0d610d5acb5665b71710',0),(6216,1391294522,'0','3cf3515b7035b0a288221695640f804fd0586343',0),(6217,1391294522,'0','494e1966941abf75b0b8f3541e9a8b2aa72f83ff',0),(6218,1391294523,'0','4349003c55501e84ea97973e419533a161792341',0),(6219,1391294523,'0','57be2cc671f1d718cc87b19c47db72fe14b128e7',0),(6220,1391294523,'0','b82d6f6442c2e2811d0ccce9a75080991f71c4c0',0),(6221,1391294523,'0','d93ae84f91248f17affd2d82e685c0e29962376a',0),(6222,1391294523,'0','0579a96a15fff552a102b162a80054f68a8d8eff',0),(6223,1391294523,'0','829c388da148442e8c54b1b4603dfefa467d1467',0),(6224,1391294523,'0','b9a90140859e897e2859b87aa935f2a9030c27cc',0),(6225,1391294523,'0','94c30b994cfd1caaaee64529da10a47a223b1e16',0),(6226,1391294523,'0','dbc4f53f545b437a9a8bd5b68a84248362ad5161',0),(6227,1391294523,'0','a7d49412d9101749654bc6af78e936ad041a10f9',0),(6228,1391294523,'0','74197df7ad552c43a928fccf8950c22f687a53fc',0),(6229,1391294524,'0','3d453361587b0f588a6f7de86f4e9babd991553b',0),(6230,1391294524,'0','6fc452bbc6f3e123bbe76005582e2e20394104b9',0),(6231,1391294524,'0','a98851ce80908735725195dcc3d45063f243f539',0),(6232,1391294524,'0','4986f42545d6ab167d4b201c4243deaee4e6d2bd',0),(6233,1391294524,'0','70803f6fa49e0ae2d4713db1c618af07fbef344c',0),(6234,1391294524,'0','b7eafa4d174facbb57a10bda6cfba686d8b5ec21',0),(6235,1391294524,'0','15e81f551d2e1d6d50847bf62c09a0fb6e4a9fbd',0),(6236,1391294524,'0','5690b57c87c244f3027541637a1b49250a46e50a',0),(6237,1391294524,'0','d5d249881a51ff93772ade635754d67ac2a8b042',0),(6238,1391294525,'0','f1c52dfd283c6104f155be21dbd60df522f92374',0),(6239,1391294525,'0','127c6d6175cd39b3f9f5951a5dd65013f1efe28a',0),(6240,1391294525,'0','fcd2f339b95529515a2466fc41d616e1579a14cf',0),(6241,1391294525,'0','08256fddbf4335188489a8f0201f9760ae0d8341',0),(6242,1391294525,'0','cff9c83a0c714585871db4f4915bdb95a0c1ca89',0),(6243,1391294525,'0','9c4fb281ff09a59f3257868916195a43cdcb6feb',0),(6244,1391294525,'0','3f66453cc005605f42642134fea9b310bc97d9f1',0),(6245,1391294525,'0','12e00ab0e7285853b2b2e97ec9403031de314cb1',0),(6246,1391294525,'0','f2995ef129d65753275a1081a72fc64b85d11005',0),(6247,1391294525,'0','3743e0d5c989d224d9943d0668f5cbace3a40814',0),(6248,1391294526,'0','630a547c35d22c14ae6c5b391a0b9749080c4485',0),(6249,1391294526,'0','dd9977f318094af7f88fa37ab1ce6a90fcb4240d',0),(6250,1391294526,'0','efdb487c987d3659186430a5121c55a6e618b3c0',0),(6251,1391294526,'0','236639d8cf611557ea3687549c207eb3ff9afe10',0),(6252,1391294526,'0','edf6028a12677f7ec11676df55349a9bb79e47cc',0),(6253,1391294526,'0','ca99b11aabb43d5a179de325ffe10ebd3c734b92',0),(6254,1391294526,'0','22df782f2d019f33528c85bc7dc45e7b8005f639',0),(6255,1391294526,'0','7dd22c7a909c59ac6663a10156282fd997e430c4',0),(6256,1391294526,'0','24d55381bd38bcf5c44492fc5128962ecd7581a6',0),(6257,1391294526,'0','45ec2deae52a14310ad5f87820ef5bb547243187',0),(6258,1391294526,'0','df895fe9e9d31bb9af25185ca19ef2a267826e8c',0),(6259,1391294527,'0','0b34314106a5a50cdbf2d7003868fad0d1fa539d',0),(6260,1391294527,'0','9e4e91b0522b3b8515beda3b8d77d76a22b617a5',0),(6261,1391294527,'0','512afdef6924031ff14151c8d4fc68295bb7ad96',0),(6262,1391294527,'0','e8f6ed864361065d1a8ff87b8928bb2351740a9f',0),(6263,1391294527,'0','31ae4e053efa7a22f685dd0fab28ba60d22264f8',0),(6264,1391294527,'0','2c578256eaf59f3528982b4a02c632844a846162',0),(6265,1391294527,'0','83ec453b6b3053131871882ae31566b0820d2cc6',0),(6266,1391294527,'0','3aeeb156995589726d2c54515ef42d9063ee92c5',0),(6267,1391294527,'0','a148ef3b7fd67433f5b3a6997b05e8ac4589db10',0),(6268,1391294527,'0','0ff22fd94e788399748e01d4efa1f3dc76f47f13',0),(6269,1391294527,'0','d45a59bbab98a5c0b725d8d9a5c34049947f690a',0),(6270,1391294528,'0','fd5d0e1645b90fe5843acce893a5560beaa71011',0),(6271,1391294528,'0','05473666e4568662902a9c4b031659785ef599f2',0),(6272,1391294528,'0','20dfc6c5fb9a237659161493316cf4696764fcfb',0),(6273,1391294528,'0','9ab9152940b1f6a56c5e5c32cbda8efd261d7ed3',0),(6274,1391294528,'0','954c1c550d7550e1dfc0f6b5f332baca897653ae',0),(6275,1391294528,'0','93d0e40b278b4cd1a48a25c181a99d19e5ff2bc5',0),(6276,1391294528,'0','82c2f7f04807f77a5fd5b11da6530008b8a5b066',0),(6277,1391294528,'0','991ea7ca4af6ec88fdbfd36416d559f6db1968dd',0),(6278,1391294528,'0','a8d614821de0cf339dada3e69048865e165782e3',0),(6279,1391294528,'0','af4a6d58fd37ad750b8574b338c155f4812e3820',0),(6280,1391294528,'0','b682960c718e9ea7735c3c988c382ec0ef1c0a54',0),(6281,1391294529,'0','d98a28b4a0c7c3add9df2770ee0ca2529409df56',0),(6282,1391294529,'0','bee6eee6cfdd7d0d09a5d1f6fdc2e119b3fd95e2',0),(6283,1391294529,'0','3fca0d98544099dc704ec888b97c22b2d0214de9',0),(6284,1391294529,'0','434aefdeb6bd36310fd0e3369fe8537f52e05697',0),(6285,1391294529,'0','44a45701f660eb028999afd853681c2e836834a2',0),(6286,1391294529,'0','5aa4006dab9d45a8d906309451ba9d63fc8439a0',0),(6287,1391294529,'0','3682a869a9dee01ecc4d8ef43f4acf4650c47571',0),(6288,1391294529,'0','5cbe2dd19e7c36ed2664e3cabee5b9524352e337',0),(6289,1391294529,'0','8b7013bd55b9ba9095a6d52f2911dd1e4b993eed',0),(6290,1391294529,'0','7089430d5b3b049ab71c8d537eef737956846b95',0),(6291,1391294529,'0','0792310b4b0e51665bebbcd75e540b2647f2d65b',0),(6292,1391294530,'0','646833a1af6aa7b47774fdacc08879d49523d7ea',0),(6293,1391294530,'0','9972bc83100774143db82e0d9179e5e06603c0c5',0),(6294,1391294530,'0','2791e36f292bb5ec1e62627d94d0aa72232a71a3',0),(6295,1391294530,'0','4922795d96299fc4698d2afef60ef21b26791499',0),(6296,1391294530,'0','52bb83c5b9d33998c4e2b0d115af89757c325667',0),(6297,1391294530,'0','7faafa1bfdddb27e0da449a18b7b12ab69c7bf0a',0),(6298,1391294530,'0','71a51a097abf1b456406e973a773afadb8f7cdce',0),(6299,1391294530,'0','0825b7a43ac8c89078c07115d8865cdcc3d5a84e',0),(6300,1391294531,'0','35ed72a2860bfb2d930945a9a906e1beca31e9e7',0),(6301,1391294531,'0','3a003296333308f1338ba808308c808aa4f55e66',0),(6302,1391294531,'0','03a8b9de55babc4b8dfc82df1d3ef8723695390f',0),(6303,1391294531,'0','673b0520d66467150098d27fdc09070f381130d6',0),(6304,1391294531,'0','520714e1be892ec032aded987d034c25ef9e896b',0),(6305,1391294531,'0','92b8201b04ea7f6ce362e7ddd2418f651a71ec98',0),(6306,1391294531,'0','5991bb53303099ecd464ed94d7cad1f8f006edcb',0),(6307,1391294531,'0','d2fbaa9903bf41530c6aba5e6be91f2e69a1f9c4',0),(6308,1391294531,'0','bd281e4bbf85adc1f185a7826b435fed30f10afa',0),(6309,1391294531,'0','802087bb2dab8de4924f5788ee102cbed3b977aa',0),(6310,1391294531,'0','83158f3334ed7889721c06875ba94fc105213ec2',0),(6311,1391294532,'0','e17705a6e8bde073bdf69f21093fea7d12e634c1',0),(6312,1391294532,'0','09eb0237c4b73bbd2df6469dac62e3a0adc78d66',0),(6313,1391294532,'0','30afa9dc34c9bf2c3bca2e99e2d7490226cf2b20',0),(6314,1391294532,'0','3840dbd4c15d4b9be0ec897523d98af77ab0123c',0),(6315,1391294532,'0','7cb66db6571f9eb60d56e6a817e081eb587392dd',0),(6316,1391294532,'0','3b680453fe335965a6cea4fc128b3ffa599729a1',0),(6317,1391294532,'0','90031c643a3155c896cf83dc70e97faf89b6daf0',0),(6318,1391294532,'0','a807c030c83c5fb035828f932cbb2314fccbc503',0),(6319,1391294532,'0','9a1acea537208081878a77e3ddbdcddcc5605471',0),(6320,1391294532,'0','9358ee474769f8ff335ee42aab9887a5feab0ccf',0),(6321,1391294533,'0','842703619d8363e3153bb523855fa99ab93a98e6',0),(6322,1391294533,'0','8106d8180438bab8850f410b33c5004b94738550',0),(6323,1391294533,'0','3301e992ecd66458f9091acfcbb05b4e248c0d54',0),(6324,1391294533,'0','ae98868a93e72a474280e2ff2b224e8b1724b692',0),(6325,1391294533,'0','914261e40400489afe5e3778f0814fe90d9a50b4',0),(6326,1391294533,'0','29e7583aedf716d75998c1cf0d68ec4e932630ff',0),(6327,1391294533,'0','1f0005f0e6953e90f0d303aabae9721670a102be',0),(6328,1391294533,'0','b2cd8251719c65e505f60a9c24a63aa2176ea417',0),(6329,1391294533,'0','5431d38ac14377b55860d2218d3e7e2b57daeb62',0),(6330,1391294533,'0','8ec91dff45b738269971bd3d90028dcee5934ad6',0),(6331,1391294533,'0','086b3872c2c670cbe4d45cbf364714a677b3760b',0),(6332,1391294534,'0','49bae57633a3fd08206945579bbcf303e0d2bdc5',0),(6333,1391294534,'0','55a56ffc47c24baec2f146d15dd7073d7abe65a0',0),(6334,1391294534,'0','c1818c71b1c85086f503e0e501ace0b6c8286915',0),(6335,1391294534,'0','a70dddb035b7087efe8a05cdf9446208441a5951',0),(6336,1391294534,'0','318364713e63e73f7e1803e27946ed41a9aee9bc',0),(6337,1391294534,'0','06f8609ed6fcfb681c1241a1ad67fa3a5b2630de',0),(6338,1391294534,'0','6afdc1a5afc18e6cda1c240773e08fb1f43cb931',0),(6339,1391294534,'0','d621828444215b1b681be7e736032a3d92366106',0),(6340,1391294535,'0','50aea6e51f972375882b388452074d74cdf66e1c',0),(6341,1391294535,'0','9aa1af167f0fc700ca7017a4bace5b295b6f3f0c',0),(6342,1391294535,'0','056a38df7ea155c2dc0bb139b40358ae0e9d379c',0),(6343,1391294535,'0','2c9f611f944428b3a41ee08c7f7cf01ecd1638e6',0),(6344,1391294535,'0','1d925ab9464a08ead1caec6244c6aaa42e4248dc',0),(6345,1391294535,'0','d9639e44f5b1ca3bf5f8e6a02143adf8317ba36f',0),(6346,1391294535,'0','110b0c338a8de57daeeb309ae4824126c218b23d',0),(6347,1391294535,'0','81523d1fc4e38e63aa3007d66c2cfb618858903f',0),(6348,1391294535,'0','35cb0d8008667ab3100170e0c5a2e833d4eb1703',0),(6349,1391294536,'0','7031ad4bf5893a73eb089de1fd6e58df9fa4a6d1',0),(6350,1391294536,'0','0aa9c6f4fb42cf3ff867b867458dc520a95efb63',0),(6351,1391294536,'0','ce2d566672f7ab185e6f91ae1cf6e3eb74714335',0),(6352,1391294536,'0','0983d136ca987268c8cda046f89a1a9c5a7a83bf',0),(6353,1391294536,'0','972ccbb87e96bda556bc58b98ce8f3b34abf2196',0),(6354,1391294536,'0','ba7ff6294194a1652e1d4d842bc5142786be786b',0),(6355,1391294536,'0','037d9722756d986709ca1e065cf1fd5308a63797',0),(6356,1391294536,'0','84c84d07d840593f11aed06943f1b7f25471dc5f',0),(6357,1391294536,'0','614dc1d3edfde6d55de87c705ffe8603f53d5bba',0),(6358,1391294537,'0','f5d6d8e6860e57f791d4e2086dfbdd3487e17979',0),(6359,1391294537,'0','46b0c55332897994e21b61dd0c7b30e452affc32',0),(6360,1391294537,'0','a6e1356724b35ea53f7192cc327d92da58943c01',0),(6361,1391294537,'0','3f0cf56fb846281f2b21b88451f6ad705158ecdc',0),(6362,1391294537,'0','6e4a8e8e020261077921483b2d42d961dc1652f0',0),(6363,1391294537,'0','2f4ba4901954018a97dce0117a8d9c6415a31447',0),(6364,1391294537,'0','5b020f9edbabfee80bbf031f43e1e4a0e62fe653',0),(6365,1391294537,'0','2595c9b9887cf30d843dbdeef0bc57124e0e5a66',0),(6366,1391294538,'0','92d0cc753cb5f120e6777c74736fd337bd3e206b',0),(6367,1391294538,'0','77d53151168adc250ea8d5b82767615fd9a5def2',0),(6368,1391294538,'0','a3e121d4c67cb37218a85fd036c63e04e6f2d9a8',0),(6369,1391294538,'0','73c816f302bcf8a9c864caaebea30adb2139c056',0),(6370,1391294538,'0','67db7871193b7a73286211cf137c13f409d4cac8',0),(6371,1391294538,'0','4424ffcb8ec5ed9b4412cf46ba3cda87eca97ebf',0),(6372,1391294538,'0','53e49375d3258b760f0e0fdebfb88d6bacb2ccec',0),(6373,1391294538,'0','0777eee6b2b84a60658ae3bf1215ad477fd6cb66',0),(6374,1391294539,'0','adfb9b55f61c67669a614c66b6e17d58d0deaa57',0),(6375,1391294539,'0','1e1a4ebf5d015e872668fb90541e9eba22e5407e',0),(6376,1391294539,'0','b773d8e41f477070a20880e6cd6c540dd9153a55',0),(6377,1391294539,'0','8be69993bc982f4fc64b9782f8024788fdfba923',0),(6378,1391294539,'0','1a5b48bc411ad9c28e56374c5f74e7d0ffda9e6d',0),(6379,1391294539,'0','65f3bd6d69fbfc87eb779ae812a7f6caa10ffa66',0),(6380,1391294539,'0','67e1ef2c17a6c7577842e0c7cf4e7f22aabbb87a',0),(6381,1391294539,'0','194c4b1013b74f05aa39ea8eb4a91dbe9ff1f6b1',0),(6382,1391294539,'0','e9202af348e3d0fe213d6e1af7e2a31db4bc3cf1',0),(6383,1391294540,'0','aa45285b279482011638f31340643dbda9f6bcf2',0),(6384,1391294540,'0','0bc7673e45f2cf592040c4742c9d7bdf3bd608de',0),(6385,1391294540,'0','00b325992b0e05d38bf61efd2d9ec7f10c7fd09a',0),(6386,1391294540,'0','f7fb1e041d5a60a143a6b18631f8bd9bbb2d5b79',0),(6387,1391294540,'0','3ada728d8a9661d8fcf156ff768ae098603ada2e',0),(6388,1391294540,'0','67e65c01ae0a0b574a22b2a56e27717a5e202576',0),(6389,1391294540,'0','d8baa59c3fbafaab51317ed53e635c601c09215e',0),(6390,1391294540,'0','6fa656ec3b06f7e1e04ab414213c211f9c5fa833',0),(6391,1391294540,'0','a96489e6277bbccb2453824de808c240baacf695',0),(6392,1391294541,'0','fe1448f27d2ded3d2a7d60abbcdeacbe956670fe',0),(6393,1391294541,'0','b368886b61e64e8f40376d0ccc4cdf31854cc91d',0),(6394,1391294541,'0','38ff98b9a60a23869b849fc53c5d066f7e47e10f',0),(6395,1391294541,'0','cbbc872d15c5b74622294759f84b8812098a27f9',0),(6396,1391294541,'0','cc8c31ea2e5eecce5b1ed25caa05224621d4ea4d',0),(6397,1391294541,'0','34d95ebce8c7b6c9f69d16d4a4aaf1357cad5fea',0),(6398,1391294541,'0','f8639e76e627d300875e83992332b020f70c7661',0),(6399,1391294541,'0','487b6059f112ed1ed4f2f14ee6cac25ba138e57c',0),(6400,1391294541,'0','abac39123643d0d37cd223c89a68d7496c305f95',0),(6401,1391294541,'0','f6999290e4173a83fa82fc8c75db2a1f1cb9d1ab',0),(6402,1391294542,'0','e48c0bd96b6da8b6d034d6d4cb5b721aa71724df',0),(6403,1391294542,'0','ee586dc6d4f028576a2912144392d55696ab063a',0),(6404,1391294542,'0','29a9a25548358af719af05be736425415a0b5cac',0),(6405,1391294542,'0','cf6bef29e9669ccbfdd0ad5b081268355ba259f1',0),(6406,1391294542,'0','3a5dc0cd3f5f6cc4dcdc6f194b5c70eebe5e6dc1',0),(6407,1391294542,'0','6d83f8da48a5e365f0d15253d6b05fdfcd557a13',0),(6408,1391294542,'0','603b2decdea300d05354c046951a4136e35ac739',0),(6409,1391294542,'0','bc530a74d8ab349c8c6c582dc9f9705ba933750e',0),(6410,1391294542,'0','3b4aa27ca914981e391f0429155163217ed512b4',0),(6411,1391294543,'0','4847ac274a5b503ebd353de0e5a852a375436b1a',0),(6412,1391294543,'0','e133eeae122ef607955c2119dcfac3747b4608a7',0),(6413,1391294543,'0','2b351e36187b91fb8c9f18dfae0df680ed4d1f15',0),(6414,1391294543,'0','0175f1ce95a0d496d0862e2d30be45dd2b1a4dad',0),(6415,1391294543,'0','9b54566ddd71b4923c4717eaccc2c0d500975070',0),(6416,1391294543,'0','c6a24c15d9f27d1313693b80c003d788a1788a10',0),(6417,1391294543,'0','8177ca5f1cd3cdf752cf882e1b5683c9693f9746',0),(6418,1391294543,'0','302a556cb6ed7bbc120475fe956d6a57af7ed204',0),(6419,1391294543,'0','94301e7843194a86fe8833ca75d956e6cdcb0b31',0),(6420,1391294543,'0','4d2c00c41940b2a50b1446dc0fb222e06179c363',0),(6421,1391294544,'0','f41baef8915052ca43ce45898b16911f56b16e1d',0),(6422,1391294544,'0','e093c364f7a980d0020717cbd495cb7b76b67ee5',0),(6423,1391294544,'0','100e7b4bf03f108883fef561ce2ee2db86035a00',0),(6424,1391294544,'0','133adba26a6bbd270a21d0a706baa76e3caa323b',0),(6425,1391294544,'0','69e6de970a66aa9bb71ef25895342ae8a331f54c',0),(6426,1391294544,'0','af0c2c66f791819c7e9bc57be2a0d2b1d1eb025d',0),(6427,1391294544,'0','9769372b829e6b337acc0e6e70094d44c0b698f4',0),(6428,1391294545,'0','7b52d5236a3fe4c2e6cfa449b8b26ad778ac11a4',0),(6429,1391294545,'0','9fa722b58cecac151041cbb2632efd5534223fe6',0),(6430,1391294545,'0','ea033497dfccb78b4327e85ddf5330e7eb13bdeb',0),(6431,1391294545,'0','972eb8e80f4916a024dec5b7bb54626fed24fabe',0),(6432,1391294545,'0','35fb9f70df89c6ed0b1ee7752deea69fde643868',0),(6433,1391294545,'0','ef6de7c7c48068e667190305db7d30862f1690dc',0),(6434,1391294545,'0','f94e6b9aaba68732f25ac498a721a82ba21dd0d4',0),(6435,1391294545,'0','ea50a3e5c2deb523c3beaf68784f7ccccd699a7a',0),(6436,1391294545,'0','b8fc08f28f747894979c2a02b2162f504cdbeddd',0),(6437,1391294545,'0','206553c5a0ddcba22b2de9b5cc84ce8b8a55a287',0),(6438,1391294546,'0','0d7388f1e54b289436a8e84a1189bb1392f2ae31',0),(6439,1391294546,'0','5b4dd6e5bde055159e67bd0f372f64b1d69ef066',0),(6440,1391294546,'0','595ad5135d7f60e2ed68a3a267b8ed4aea1b1ce7',0),(6441,1391294546,'0','1aa6f279d2cc8beb4036a30668d312ea258b8882',0),(6442,1391294546,'0','a5f15e1b8aebaad0834cffd4df4d734a49007b49',0),(6443,1391294546,'0','44c07b1e837ce132f6f430c591ebbc688d61ff97',0),(6444,1391294546,'0','7a9a9fbba5a054b37414e9967082c427e3834a13',0),(6445,1391294546,'0','cad54403beb9afa52d4b0e54a134433381089489',0),(6446,1391294546,'0','384f0410bab7648123fb6979a0f03604537ea75f',0),(6447,1391294547,'0','c5b4357b746f9d4bb7fa07095d3c9247ba1be012',0),(6448,1391294547,'0','18f596bd97a13a4da5ce5a983b58f4ba9b9af985',0),(6449,1391294547,'0','f01a0c9a993bd91eb8730bfbe7770fc5b2e69c83',0),(6450,1391294547,'0','7840ea7342484ad8b4c1c986094c79382c1d59e3',0),(6451,1391294547,'0','b71a240999ded89d8810d82b1ffe96b03057f7c2',0),(6452,1391294547,'0','9e61a8172809a8e611519d8217684412f4addfff',0),(6453,1391294547,'0','097a1b877a3710c3fc5fa1440fe4bce6e976c9f9',0),(6454,1391294547,'0','901e9429666a6a6cf789585ee9f3ab69c864c19b',0),(6455,1391294548,'0','7b9557d19fbd7821a6f29380f22a8455db2d4153',0),(6456,1391294548,'0','2ac1710d593b967787f220b5c623a90b7827b493',0),(6457,1391294548,'0','72cf2a3aac1c1a50cf219b8ecd5b15b588abb268',0),(6458,1391294548,'0','98895a06ae078f707f57f5c8fed0354b20e33702',0),(6459,1391294548,'0','b0071d82850105f7a628b577442282069e33036a',0),(6460,1391294548,'0','c7928db8c5dca8fbe5a0ca1fa904135ab38c6e81',0),(6461,1391294548,'0','b3c9e19d71968dea5642003c44650dcfb7084116',0),(6462,1391294548,'0','7aee0ac4b090df5321fe8404de8634afcc539909',0),(6463,1391294548,'0','c919e23093322ca7559dcaffa1bd1ee1d608f978',0),(6464,1391294549,'0','7c68f0f6d4959044437c2bbddafdefd33a1ea3a6',0),(6465,1391294549,'0','dc31755ccfa438f497ba1880f5d1d7ce593d7ef2',0),(6466,1391294549,'0','05d4916235f6388c97960be73c3e7dace5ea7098',0),(6467,1391294549,'0','6f66e08102b1220e39ff28ee5d1b8b889646e04e',0),(6468,1391294549,'0','39db073d2d52242b5863867b2475066ce6ee6137',0),(6469,1391294549,'0','e3d3ecb86b3c5e9388398ade15cd959d4effb983',0),(6470,1391294549,'0','599fa4b492e08abc6b29d24f75ed220cb382c300',0),(6471,1391294549,'0','40562875d75f0374056f3cf8666ec7871c05eae1',0),(6472,1391294549,'0','87d04f3100928e3a2f71794fccdab5989ee1393a',0),(6473,1391294550,'0','41655b249697404d3498d200167f905a3800379b',0),(6474,1391294550,'0','9098b1889756dbb71f12d398a1f6879b910ed608',0),(6475,1391294550,'0','f4e83e21502a5d53a548d17abd1cafc76cd23e93',0),(6476,1391294550,'0','3efd8877e8d8d307565ac2e98dcfe86cd97e03e7',0),(6477,1391294550,'0','ec69e28b609f74f01b1ce7345a6267794436dab8',0),(6478,1391294550,'0','d52bdec9f35dd9718088f34350170aa8005f1593',0),(6479,1391294550,'0','a6b1cb6b3fa2d327651ce2b0402db9af14b95dae',0),(6480,1391294550,'0','1b29519af8936a453cc73a2362db9fe6835ada90',0),(6481,1391294551,'0','6d2e8147c10442dd8d0ac0c512538539b4ffea02',0),(6482,1391294551,'0','9651c38df234a9c5e7a1f7a3a29c020fde522930',0),(6483,1391294551,'0','dd9a298442deba0d4c65aef2107d4f6c6dd11caf',0),(6484,1391294551,'0','523ae505afdce4452cde577d5e2250511aaa16d2',0),(6485,1391294551,'0','9b81a422ae6d4f5e38c4b8d32637b3732cc2691b',0),(6486,1391294551,'0','cb0730b821ade028bd6fe3b2fd06887999dd6aa8',0),(6487,1391294551,'0','3bff723a7610c3ccc0ec8608d029a0a7fab62f28',0),(6488,1391294551,'0','422d56a111520de18e2d341dde96aaa20b7a2601',0),(6489,1391294551,'0','7572d056ee7fe3b0d71d4eae6e043984e479bccd',0),(6490,1391294552,'0','021db30c2902c31c0e6475ed727a4241ed089e8e',0),(6491,1391294552,'0','67fbfab2670f8c848d5e65a8b727b5e9b16756ab',0),(6492,1391294552,'0','1f0df218de3b54ebd3e3205eea3ffc9e09574823',0),(6493,1391294552,'0','8f751b8bae476b0cbcc65d29c8bd6a652070f38c',0),(6494,1391294552,'0','7fee4f147ef8f80b7b28d2a3b42389b8fb668f7d',0),(6495,1391294552,'0','45d635d323dd0b48167fc9f4d15844cdee9e058e',0),(6496,1391294552,'0','dd2463b5bd8d91a99c150527589672452fded0ef',0),(6497,1391294552,'0','8d613f354ac856e8f79e640fd4c08e07c3dc2148',0),(6498,1391294552,'0','1c5c9d9cf48b9c226197d6d44923d3fb6a298b69',0),(6499,1391294553,'0','52cc04120e61cbbe186c969c9bdac0c8e39c5390',0),(6500,1391294553,'0','a0e6b614c3a9c53aa798c6b64785572ad04392bb',0),(6501,1391294553,'0','dc2d4b33cce6b91811cc9ae8494fd62c1dfa453c',0),(6502,1391294553,'0','b9c37947ea43e69a277806bb66eb0dece1969091',0),(6503,1391294553,'0','f65bbaf1b5a2d3725159785d63737944a81abee5',0),(6504,1391294553,'0','7e4850725083c39668e616f8394a5c336ab33332',0),(6505,1391294553,'0','44f8d525dd58d5326664434e1ebffc1f11c4eae7',0),(6506,1391294553,'0','94b900602beceb5ae4ca98f7cc511c9d48c9de81',0),(6507,1391294553,'0','44cd7b4236c385b7945300e59be8002f7596b6ee',0),(6508,1391294554,'0','bf1a8fde93df25eccc9b94f9314f14dfbca0808a',0),(6509,1391294554,'0','9bf07a090a87881a43efc7ed2d251a9f6ddf8fe2',0),(6510,1391294554,'0','1e402a91c7cdea150ef6fb9cffb2786b6eae2c64',0),(6511,1391294554,'0','f44f3dfe9fe9257c90773a6f7cddc33ef8c87898',0),(6512,1391294554,'0','c6929e57522dd5632d77ccc6ed3381c8ae9e3b85',0),(6513,1391294554,'0','f962fd06d75b6b9c6b9cdb4031eed60b602adac1',0),(6514,1391294554,'0','1ef246813ddf0a2c018b9d0efa986326bd8026b6',0),(6515,1391294554,'0','95441e8917885c281494057aba6cfc71343d36e5',0),(6516,1391294554,'0','d15ef1aba18863894103f87abd578566e6e83196',0),(6517,1391294554,'0','be2f072a845132603bf7654a2a4af928f3836801',0),(6518,1391294555,'0','f48c66babd84cb41abe63324a2399f632209b277',0),(6519,1391294555,'0','b5dca286d962ecd49a8c45a996296c0e2be0137c',0),(6520,1391294555,'0','778895e1235161fcbdbbd2acf975ee6800e977c7',0),(6521,1391294555,'0','71ac45f007e3c34870692bf2a6d8bb84b1e6589d',0),(6522,1391294555,'0','db07e88b97365e1da14977d47e2a6b2ff03ce3cc',0),(6523,1391294555,'0','be4f15ce415080b155e8027a8f993fd2c61bd403',0),(6524,1391294555,'0','7ce30bb247b9666587e36aa15c675023e30c7080',0),(6525,1391294555,'0','4450a2d49912318b6b0293e088693600a130198c',0),(6526,1391294555,'0','f31ec5a5e9b1b9297204d0210d3f747469dcd298',0),(6527,1391294556,'0','d177b2a2702c001b053d75d4ff2a4e9f3e8a1d1e',0),(6528,1391294556,'0','4b98ceaf1ccbd8abd25e4c1c2baee1c30a7872fe',0),(6529,1391294556,'0','f3ef6f484586f675572173a69648ec7f4ee1d7eb',0),(6530,1391294556,'0','94f98c4bb59154259815b76e3b9d566309a3890c',0),(6531,1391294556,'0','25c527b6da7d0510d1fb31ffd030b4643ee17491',0),(6532,1391294556,'0','50bedbef694cb08552c26f141f7b4a56947f94f1',0),(6533,1391294556,'0','9035c35bb5342f6b7661467d5180a1cb7656c53b',0),(6534,1391294556,'0','67de52b5e40e4c8cd9b22ea73df2a0afe77441d3',0),(6535,1391294556,'0','afbcedf1da77191ec0366dda201bfa7073e9cfc7',0),(6536,1391294557,'0','5ba34cf2607ed9c12f1fea3a05f43574b268ba33',0),(6537,1391294557,'0','8928df40b2f346d93ca30e427f45cdb03d166b46',0),(6538,1391294557,'0','00f82dfe1bfffb1f2251b4f0958ceb70b983b833',0),(6539,1391294557,'0','a4c41f9fe899c909c11b29f9bc0aa6a851b2d1be',0),(6540,1391294557,'0','4bd76cb97b1bae1912d857d501da12155034e6e3',0),(6541,1391294557,'0','ede75d81144d34e4d858a97d1a48f79f94afb790',0),(6542,1391294557,'0','1098c5de6d47c326c8bde96662af4799fabb6c1b',0),(6543,1391294557,'0','57a439969ee5c5a0ed09c28ecfbe4f80a9140693',0),(6544,1391294557,'0','736723ba92bf34bfc9a2057040c0d1b2393de20c',0),(6545,1391294558,'0','7af20b48d40d5fc3c9bf7da6cc7558c6496212f1',0),(6546,1391294558,'0','439615bbf4961cd385e0fb7d44f8c17a58d4d959',0),(6547,1391294558,'0','fba8680dcc75287970e8e4cc070c978391a54954',0),(6548,1391294558,'0','fc689fcdeefe696cc9ea0a3f38bd8bf51065d8d2',0),(6549,1391294558,'0','d12ef33be92c66af84fd7322a99bc601a351423a',0),(6550,1391294558,'0','4c6e7720665e3511d5608076064450595461a2f0',0),(6551,1391294558,'0','6562c8d7290b9f38b01286da68d6d9f4689e6324',0),(6552,1391294559,'0','65080e7216c49a120a5377b87cf07257cb38de18',0),(6553,1391294559,'0','ae801670a06abd7ebd951ea126c3acc854bf3132',0),(6554,1391294559,'0','9fae12e1a0226ef267348d6ed56fb0a171e55893',0),(6555,1391294559,'0','520eb3f4508156e580e3e6a3859fbc4738ac43a9',0),(6556,1391294559,'0','ff0e3d7b6616643266267440b9e5a2dc6ead2396',0),(6557,1391294559,'0','6932bb9d13fcd4f0ff0e21edee95d82cb1a842da',0),(6558,1391294559,'0','56fb8ffe58cd9fc21b2d07898db6d9d805e6e0b9',0),(6559,1391294559,'0','978590a9d9023e71d5e04ab0c8d89107b53bf024',0),(6560,1391294559,'0','46b6298c1114623830e0935d9b595d3e9a022c16',0),(6561,1391294560,'0','015f393056aedfd72d0f284286db77f433d38248',0),(6562,1391294560,'0','e7ab5fa54f18fbc8d9db697e3007b500f83c0f6b',0),(6563,1391294560,'0','a07421aba3e7916b2ecfc97cb1194427d1c6733a',0),(6564,1391294560,'0','e42fe2a60853c47a337dae8592a39f1b56666b43',0),(6565,1391294560,'0','d26ee1ef41c59849514d492e4883d00d7abe90c9',0),(6566,1391294560,'0','b953e73b9ef4ff899017c748768e9e62e5d875c5',0),(6567,1391294560,'0','bd5d2e16be06e992ab28a8e5651072a1dadeca9b',0),(6568,1391294560,'0','71dc5f39c5adfbbfd437caa603367b7f46159a03',0),(6569,1391294560,'0','e706685e02e1add8545a552b9f74ae485d445d87',0),(6570,1391294560,'0','709ac657d1a288bd1d1249dfbd9c04cbeb89320c',0),(6571,1391294561,'0','df93d4abcd926a899cddcc68c304a528baa1ff14',0),(6572,1391294561,'0','4cd1e3fb0f3a00d705880c453d99f0d27a42bb18',0),(6573,1391294561,'0','3158dc07a8d7b985de21c7fa0a9789ebeb386d7a',0),(6574,1391294561,'0','c6525f902c9493b9104ea0070041686708bd5fad',0),(6575,1391294561,'0','f5b5bc5ab9294fb38e7b9b5360fd0c06952de96d',0),(6576,1391294561,'0','5e3c623105ef9a7266bdfb226cec9eaf62a36e08',0),(6577,1391294561,'0','ce7676dcde80f7cc8f8af084f149471470b2254d',0),(6578,1391294561,'0','3b7ad83b3f95681ae0130da6ac160d4f1e00cd59',0),(6579,1391294561,'0','f9d47869102296851827f278a2a08e5baa4f5435',0),(6580,1391294561,'0','4fc4857859fa3c3f63d2ce2046fd5b4ee0769aec',0),(6581,1391294561,'0','bef62eb5425a5a508ff3b19c7211392ce356c54d',0),(6582,1391294562,'0','b8bbc1be0d7796b2750ee7909f3778de41c48880',0),(6583,1391294562,'0','1c72346dddb92dfdaeb2dbff45ed56bd89907476',0),(6584,1391294562,'0','9c8f72c820499775f379b056ac088f00ca6ef487',0),(6585,1391294562,'0','35be4ff72599b7bbdca460381ef45a11e1149ff6',0),(6586,1391294562,'0','4fa2abc5a5cba9b368ec777b03104f0bafb741ea',0),(6587,1391294562,'0','c99ae979eebb4931ea1877243c1cfbf93db64b80',0),(6588,1391294562,'0','3a7721799ae8752b5568f13233f4288199fa3b83',0),(6589,1391294562,'0','b6d2af1d4edcf4f20f9d299aee235e3f715237e7',0),(6590,1391294562,'0','ceb1dbf867fc7bba21225deca531f3f7e51ba04f',0),(6591,1391294562,'0','269c381c1fbb54fd39233ca42baff81c0a7abb62',0),(6592,1391294563,'0','f5a131aecb112018b5076788a08c5228ae34d4b8',0),(6593,1391294563,'0','7bcfe9c2fb8da18de086c24b394f57651fd4649e',0),(6594,1391294563,'0','3d5927ec779fc82eb936ad56e12303dae036b250',0),(6595,1391294563,'0','9cba8e0055a0049f1d2f91552bc81a6e9d4aa1f5',0),(6596,1391294563,'0','0319206c428a25414fd88ef7ac772f642d679fc6',0),(6597,1391294563,'0','af1238cfe08afa2e99373f008395011eacf61c7b',0),(6598,1391294563,'0','f81ca92cc91cf88babb960d2fa52e0cc4b0bac0c',0),(6599,1391294563,'0','e71de519af76e0cde68d446107cfeef87286ce7c',0),(6600,1391294563,'0','f26c4cd7673e79167280a676543f33e33eb747ca',0),(6601,1391294564,'0','aa69cf52019ae9e4e48adf879da605e7f52bcab4',0),(6602,1391294564,'0','3b8f52706c3e57b5995998283e61bd5253a96baa',0),(6603,1391294564,'0','df9a809db4cd34d36990c9f62a80c42db8288b71',0),(6604,1391294564,'0','31878458cfb5ffa0179f0df903bc37e45e0b49a9',0),(6605,1391294564,'0','8b893b18e9c66000a49f8b3e9b913eaa600051a2',0),(6606,1391294564,'0','c9e7a544db0a8b73bb43dce80c4de334baa511e5',0),(6607,1391294564,'0','b65186e776fa95158656067cf304aa1c3bb61ea7',0),(6608,1391294564,'0','43a13faef3521785cf2128925ff8a3a1c90c75fc',0),(6609,1391294564,'0','d215f6d9bfb6b44a5523f2cfd0ddc0bb35bd3fdf',0),(6610,1391294564,'0','6ea707ea21404c066f472f7dfd7f9d5850ad32ff',0),(6611,1391294565,'0','da1c59e1faa1f4cb34feec8a5d6a9e2a7ab87a0d',0),(6612,1391294565,'0','f824ffdc51c4c8e1e1581b224530b9ffb8d3f32c',0),(6613,1391294565,'0','fbad72b901426693744d34faaea65cf3797ad81a',0),(6614,1391294565,'0','a627676bb4ce512ce14bb8012ca0143134f17ed4',0),(6615,1391294565,'0','7ebe84015c360181f4bfc7cb446690852226a340',0),(6616,1391294565,'0','1a1b78d3b99162ebe095be811317e0e9086bde8b',0),(6617,1391294565,'0','df475a1f2361900a764c7c0ddb2189ae8cabf97b',0),(6618,1391294565,'0','2ba1ea92f7c30b74499af4f76943ef09dd1c1c3b',0),(6619,1391294566,'0','0b5189780d17d57c8cfe5fcabba42b7027594d9f',0),(6620,1391294566,'0','1cc4cc0225594fc09f63f031a2a25286495d8769',0),(6621,1391294566,'0','aa594c0f737dd2b614bf3c1bccb692f7f0d687bd',0),(6622,1391294566,'0','1bf29db63cc51053c5180024507f751897566728',0),(6623,1391294566,'0','289a25a344257f7dca88069f74bbee2ae9a93052',0),(6624,1391294566,'0','4690f3043131c4e20ff8d2b2adb0f45b0daa3d6d',0),(6625,1391294566,'0','b6b503c57b9b764fe47bab1f11924b47eeb6b2e0',0),(6626,1391294566,'0','1a180642aff849f643be748040c4f5a0e72dc7d8',0),(6627,1391294567,'0','e9442ba96985981b337fc2ee6a70ca4eb1405d66',0),(6628,1391294567,'0','89572289a2f1b80a4c38b2c90d74fd65890c6f4d',0),(6629,1391294567,'0','2a245aed98646fb2c841634ff21b8ed17471d723',0),(6630,1391294567,'0','c495d90965d99d19ef1f0c64bb8cd9273057eca0',0),(6631,1391294567,'0','860ba1fe3dfd29e8741c53c8627cb8b32c853029',0),(6632,1391294567,'0','61a1604aaa16ea7affa4a3e216715ee15e97e648',0),(6633,1391294567,'0','7d5614bf00279c1f1d75ac622d1e173616291b62',0),(6634,1391294567,'0','06228c4eb2814843af720f099b1fda763e7e5859',0),(6635,1391294568,'0','cf0b3890841522ee0127b0ef546f3628d656c9d6',0),(6636,1391294568,'0','f35f8a28cccd517fdbc7a2631d36ab3c51d95c6a',0),(6637,1391294568,'0','8d78ac3acb6a1eea13eddcaf8e028778c47223f9',0),(6638,1391294568,'0','ad6c6ec543dd9c7a07f63809526ad5b4cc19160d',0),(6639,1391294568,'0','9a203e590d9e0f7ea142b4c89c507aa45c766a88',0),(6640,1391294568,'0','5f4ec0fa7b93d14d19c772dffe84f9a0b6e4d682',0),(6641,1391294568,'0','9cdd9664406c068062bd7db4ab29c4fcc3e8317e',0),(6642,1391294568,'0','f1603aa059e7b111d2db9ed0039fdb1a1b86b4d8',0),(6643,1391294568,'0','4a9d4c1f8c96362da2c2cdd01638ceccfa25cc83',0),(6644,1391294569,'0','4407428a2d2ea289211bc4a7c3affd51f7a22f3a',0),(6645,1391294569,'0','e17345761d9b579af0377dab58176fcad5bf5aec',0),(6646,1391294569,'0','5c7f61881719e1755833f1bf22adfeabb9c3cc7c',0),(6647,1391294569,'0','64c9355b90d19adb31c8e669704f69709d301233',0),(6648,1391294569,'0','a8de631d56c9cb9c90c84ccdb2b2a4b1be394a3a',0),(6649,1391294569,'0','309132a530d321e4cfdfa6cf0056f8a8394a4c47',0),(6650,1391294569,'0','29ff618621111864dc2aff6e8835077ab1e05db8',0),(6651,1391294569,'0','c052b1f2cded67761b3f5bfdfa868c0da496a52f',0),(6652,1391294570,'0','c9c1c7ceb0b17e088e0b5a26c720d914bf709558',0),(6653,1391294570,'0','5b64b90f6f24f7a58c3c7005cfd6e3d939b45816',0),(6654,1391294570,'0','6a5a8578a85487bf2094cc9a94ff2b7d26dd0384',0),(6655,1391294570,'0','483310b3dd0a0318d119458f08179abdb3f5a1b7',0),(6656,1391294570,'0','42b8921ffe02fb144b8d0257e4e18f8f7d6da9fa',0),(6657,1391294570,'0','ba810e4035bfb08f0e0915653433b1e58d07dd39',0),(6658,1391294570,'0','c02f4cfdf40b07c4aa00ee870fb686e86853e331',0),(6659,1391294570,'0','5e4dbfa398721cabb38d253f6e735da9b6b80f15',0),(6660,1391294570,'0','9bd7e0ea26da0f5a0c024a0b644059e80e3a5722',0),(6661,1391294571,'0','05544505f9e0069ebf39a04c4ce17b7eb06d469a',0),(6662,1391294571,'0','f8554500e9f7d580b311412e1e1900ee3557eb8e',0),(6663,1391294571,'0','c352f560c14665af1b2c8448cfa39d02fb13a297',0),(6664,1391294571,'0','1a776777f69594dfa8680bf2e7c1f16bb26b1b7a',0),(6665,1391294571,'0','96c1556909c7df60cbff159add85564f7fb924db',0),(6666,1391294571,'0','f2ae2d81cc47a88dd07c03999ce93aa565c7aed6',0),(6667,1391294571,'0','c5f873f534a181edc5a51cbb0e22cd66db1ca59e',0),(6668,1391294571,'0','5c6914115c1d155b62dcb0eee1d98d011ee274af',0),(6669,1391294571,'0','330e1655bea559df12a6b282f18d33130c3f15a4',0),(6670,1391294572,'0','1bae36fb06343e77fc0b4671c65685fb5f3d8963',0),(6671,1391294572,'0','cb80e72349052a0f81c82705598c25b508069965',0),(6672,1391294572,'0','a706e5f089e477d7c8228733f4a37bb0fc4f7c00',0),(6673,1391294572,'0','651f239eda38cfcbf204c810dd905f395d601a2a',0),(6674,1391294572,'0','5ef9eb91ecc002a6d06178120e0549560c69c059',0),(6675,1391294572,'0','3b95d9279a47f160aca7e719e2a5529b71c48c39',0),(6676,1391294572,'0','5b25ed489598dbbbc8e8827b5c09ccc062af9b43',0),(6677,1391294572,'0','d0705c5dc83eb780bae4c4dc7ba7c799b70587d6',0),(6678,1391294572,'0','b1abeb7bf88d3fa769b6d775cda783606a65a632',0),(6679,1391294573,'0','8000d1d90c14893b8b7b104da91799608d7c6fd1',0),(6680,1391294573,'0','72a50c2edc4984e458d99785dcf2b71c7ad2061e',0),(6681,1391294573,'0','fa8685bf5bef1657ce601259d024dfe3f5e98c27',0),(6682,1391294573,'0','eba9172efa5928e9c1ad99617f7f98dfe6d1ffd0',0),(6683,1391294573,'0','2c06b2a8f5d1fe5e2bee4d1b1ef70b6af1ed8e1d',0),(6684,1391294573,'0','6cf9f96f120eedf684961a39ccd656096c095410',0),(6685,1391294573,'0','4af97a8444565b6b45d4b32313bf9054d2b03190',0),(6686,1391294573,'0','f4f315730ee9e2e3860449265322157bea210d13',0),(6687,1391294574,'0','874fad4ec5a4d177482a4e545ab762dce27a0a0f',0),(6688,1391294574,'0','09629e0717f20bd3bbd3eb88a2d58394fc2e3518',0),(6689,1391294574,'0','c7448327cca77446c85bd6ceef74c46aa2bbda64',0),(6690,1391294574,'0','ccc533ebc46027922e2f03461312a416a2944334',0),(6691,1391294574,'0','06596fdd90697817d96589b056d6b4ecf894f4a3',0),(6692,1391294574,'0','31936e8656981f35f8d437d545f1b33a84587d82',0),(6693,1391294574,'0','2c875a8302b8f7f60fc2207d7438443b364cb578',0),(6694,1391294574,'0','603f9a7af86f8c81c255ea494c362b4805fea16f',0),(6695,1391294574,'0','98a1c36956923314a5c0506702c189f75f3bb330',0),(6696,1391294575,'0','e4fe94a8efe1ca5b7c6f431142f0269cbcf8af45',0),(6697,1391294575,'0','cf189a0bec0c4c2dedc420b99aeb967bfcfbb548',0),(6698,1391294575,'0','617999e39cb71eba4090e948e8849a0f9bb5ddc8',0),(6699,1391294575,'0','6a0ba149838edfcdb847fda0161b1fad02878562',0),(6700,1391294575,'0','63e7d8e651252bd733e2d721850c30d87bbdd4b5',0),(6701,1391294575,'0','dfdf86a0f4a3d37b5263ebf96abe063bc27b8a30',0),(6702,1391294575,'0','956b049d78829c8f0f160a8b6f352e0975d6c8f6',0),(6703,1391294575,'0','a386fe64df76fb00c921cb999e606618782bb8a9',0),(6704,1391294575,'0','508c2dd5e945e53dc347d54ef230f120febe094d',0),(6705,1391294576,'0','b6cb6b581b4160a67f46a38503a572a680d74434',0),(6706,1391294576,'0','1cf1d934683d07095ac78b31ba9046ece5a88511',0),(6707,1391294576,'0','fa5288125d298d0549efc83a7a276dfda5af3221',0),(6708,1391294576,'0','194fa60a39b6a7e6d304e8d4584bd5a278d8cdec',0),(6709,1391294576,'0','bb23151b32bee0ca520f25019e6fd9f36c05a237',0),(6710,1391294576,'0','1b0a17219bf25aaa9821126040f2953093b2555d',0),(6711,1391294576,'0','ecf75728bdf0d0fa72f071a9f10b036969771047',0),(6712,1391294576,'0','c653f20f5575a153e71213f47a9a4b2772365dea',0),(6713,1391294576,'0','04f74ab0a01c8e430030b06a058e3d28a62bfdf9',0),(6714,1391294576,'0','a7801b19dca638b8fa4a4918a666bc80fb015098',0),(6715,1391294577,'0','5b9ae4ed0278bb47957896a0c1663236caa06ae9',0),(6716,1391294577,'0','1aae5cd937381c8acc2da27c3adc370614d7725c',0),(6717,1391294577,'0','b43b0fd66b14f98b65d68669ef15f151db9d448e',0),(6718,1391294577,'0','6815749d5d9cc97d0adda0df79b042d0725ebc0f',0),(6719,1391294577,'0','ffaae074f024696f2e76f86161888b9de4c35b44',0),(6720,1391294577,'0','8f76d236d687de060e4128e7f40acff6c85dd29a',0),(6721,1391294577,'0','b6962a34bcf29bf8a18e124fb01bebb600de280a',0),(6722,1391294577,'0','c4c7f96466cdf2bf0c91fff8afe6286f060d9124',0),(6723,1391294577,'0','ec28701e6e12e3b7a62e5aacacb43d968b2128b0',0),(6724,1391294578,'0','24bc83cd7f7e370d67097cf7e237af028078a2e8',0),(6725,1391294578,'0','f0cb4aa01b2eeed6715c528103c91c2d9ca3eeff',0),(6726,1391294578,'0','5a9e260485cc6613d9bf8e4188f81053671fdaf3',0),(6727,1391294578,'0','c6ee634682799a75f90cf0c63f163e3b441b69b4',0),(6728,1391294578,'0','1e30aedab620975b8ee5cabcabbd83e3a1b453a2',0),(6729,1391294578,'0','75132d6f282843df9168877b3b09a13109240998',0),(6730,1391294578,'0','0ec5d66766bb634a0a0fb83aa79eb217a63bdbe2',0),(6731,1391294578,'0','34a1ce1061097bb081b3a654381da07d9030da6b',0),(6732,1391294578,'0','fa38dcef4767b92d2cc3c539679982349d4e9f13',0),(6733,1391294579,'0','d9f8896aa0858bbd967f97bda3115d081ba9620e',0),(6734,1391294579,'0','8456ec3d9228e5c212eb39d88c64de68428a76d3',0),(6735,1391294579,'0','9110aa1ad52494c55c64828bf1487aba4d9c36fc',0),(6736,1391294579,'0','cc4d784987276f2bab7282eef2ce2c03d2819159',0),(6737,1391294579,'0','ba2dd4447a485ba7ab28b32cd03ff3ee4506c517',0),(6738,1391294579,'0','a2cb8a521bf4460d312a47fe6ce21cb527b9c57f',0),(6739,1391294579,'0','ba33a97e91e16d336749a47455bfdcf861490938',0),(6740,1391294579,'0','ec99b924aa397b628e0acf3e5a0a3fe885c8a389',0),(6741,1391294579,'0','0b3ab3c31688b8ac01666fec98061ceb84c65621',0),(6742,1391294579,'0','adc5ca7177a0e64753a04df5ca7cf0bdaf6fb779',0),(6743,1391294580,'0','2af09119a4d2d38430a68a459ab44e23af44785b',0),(6744,1391294580,'0','e7de2529d66726c9ca7cc68120c9a16ac26fc72b',0),(6745,1391294580,'0','01b1de34600ec625e7a892a8bb048fdfed74ad64',0),(6746,1391294580,'0','19e1bab969881cda4107c51dadfa1dc2dff4db44',0),(6747,1391294580,'0','169f2c57a4a0fefad215e87bf069b6cf814246f8',0),(6748,1391294580,'0','0db338f51b860f6b86a3f6842f5dfacf617f4cc4',0),(6749,1391294580,'0','9e8c2819eec10af28af14da0beed10b30e777aeb',0),(6750,1391294580,'0','5412af6b1eaf4cf5e06a68ba5c83c50960f8ff71',0),(6751,1391294580,'0','c630d7fb854cb17993aa9fb1bd57ac7985e15e1c',0),(6752,1391294580,'0','aac0487c2e4428e6d23c5d86af5e2637a7230296',0),(6753,1391294581,'0','d591063e2d8fd83c7e24dbadb5775ce1568baa0c',0),(6754,1391294581,'0','32b31c6baa7e0011aedcc90cefd81719ad5b336a',0),(6755,1391294581,'0','fe06416d29069ade2eb3d95699706d1e3b5052d8',0),(6756,1391294581,'0','85738f66163fa88a1d0798c6540ea8fe79950cd4',0),(6757,1391294581,'0','9c7409be53f7a640691f7d4cbb0c5242b8d73cd9',0),(6758,1391294581,'0','c52cf2a5a3e42ab91af7e7d0b7a39bd3c0667e4b',0),(6759,1391294581,'0','9e9f6c87e058b527a7ec33d14c91374c2cfd03cd',0),(6760,1391294581,'0','293c2cf304c0380d4cf54851e670ad4c7421591b',0),(6761,1391294581,'0','126cfeb68c33417618cd8dc354400274eb6885a0',0),(6762,1391294581,'0','7d6f8fdf937f3c0575f90c12f41dff864c87d742',0),(6763,1391294582,'0','4ff93d4edd255a557adeb15eb646ac0ad707ebcf',0),(6764,1391294582,'0','52bb77ea9bfed83e886e2ef254239b0402d5c25f',0),(6765,1391294582,'0','c5aee636dfda4e587896d5c379d440d900bff28a',0),(6766,1391294582,'0','8822b9eaf10d4734bc463a349d0a26f18875a45d',0),(6767,1391294582,'0','07e5c906b19ee5c4270cbba38fcd897d99a2d181',0),(6768,1391294582,'0','1f386266d0231e075d9eed29cfddb13397390c0d',0),(6769,1391294582,'0','1511f5503e5b1edc0ae3217f9c1ab29ca84563f4',0),(6770,1391294582,'0','8d3838bb8d5396167732d52e54ac7369df36713d',0),(6771,1391294582,'0','1c6abd237702a49afe06ce978932f52bb2686787',0),(6772,1391294582,'0','e7507132dbdd469a02fc9cf1068ceaee667663b8',0),(6773,1391294583,'0','f8e7bfbfdf16168df87122fddb4c896e1c85711a',0),(6774,1391294583,'0','689850966f3913822befbc5086064048732d9dd4',0),(6775,1391294583,'0','9653d83bde8e094a26e5f00fafb1dcfea724c9a2',0),(6776,1391294583,'0','47c134c09133d4c94b72793e89078a6614b2f08f',0),(6777,1391294583,'0','4d38bed74c8fb388fede6885d402fa5e53a9297f',0),(6778,1391294583,'0','2d4b52ad192887ff4a270dcba52ab6af422cc1f1',0),(6779,1391294583,'0','f9953215d1a5f2e3923520362e1df9e7945825a2',0),(6780,1391294583,'0','a7f3092e9f9f27f04e92a48979801861f2fee9ea',0),(6781,1391294583,'0','7fa19681404609f09f2b90f7ab5b1afc02d71f2a',0),(6782,1391294583,'0','7f016229fb2fffb42b328843d9b0322cce7c5dba',0),(6783,1391294584,'0','0140d3ecf2929fd718aae9a4e9dbb268ff64582c',0),(6784,1391294584,'0','a8dca839cd25cfc86b961a8c7e674e22269c8211',0),(6785,1391294584,'0','f481347c3754bb48226d3bac259eb0ab74f45945',0),(6786,1391294584,'0','b211acd28d05afb47ef924afaf0b79c67d9b0e93',0),(6787,1391294584,'0','437d6d4ccd5335103e7abd01fcb52a946d629565',0),(6788,1391294584,'0','f153325577f5527de6bbd37cd571507116c17945',0),(6789,1391294584,'0','873ebbe45e7ef877b1e8256ff1ac498475800efd',0),(6790,1391294584,'0','0051e20bced7af75d0a7fe9827e828ef4341e122',0),(6791,1391294585,'0','de16d670054fbe92201401386123238b901aea84',0),(6792,1391294585,'0','6b19002fbbfe33166ca585658a85e122ca32b59e',0),(6793,1391294585,'0','dcde31a521a00a8a9915ff17242befefed976915',0),(6794,1391294585,'0','37b699f59e19a43d35d31eb7bb97e31985dc43b1',0),(6795,1391294585,'0','a0eecb7901954a363d3b7ca855ad6da2a7d64a53',0),(6796,1391294585,'0','ac750ea7bb04b62ba5fe0c47f3bf1eec7e8a1338',0),(6797,1391294585,'0','61662e47e32b114ee3f0c45d4d7036f6d4d5e8e7',0),(6798,1391294585,'0','09755f5a1b963e830f4eb1616dd1464a37f668f0',0),(6799,1391294585,'0','468f4a726c7718ce2d586b2bc81e4a404cd4e311',0),(6800,1391294585,'0','ae2c2c48118cf6a1a2c7cd943fb8f66d61267ca5',0),(6801,1391294586,'0','a9ad436f9a5991f911b2fb94a78a2b206ec154cb',0),(6802,1391294586,'0','b7c3c588ecd3ea636109043d7510a0b807bcd4dc',0),(6803,1391294586,'0','8293c5a1e4e90d389bd507a51a28ecaefaeec052',0),(6804,1391294586,'0','32f7f2a34c6c526e64f2ed5be6f61487ca290b6f',0),(6805,1391294586,'0','25c9441f96a0ba6b01f26dca5a3696a256f58531',0),(6806,1391294586,'0','7dd1046070e864aeda26f64fdb037df8f582b526',0),(6807,1391294586,'0','127d962b26881205f075680f1f590ba921477b4e',0),(6808,1391294586,'0','803cf4076ef39d2729aa63db84c4d5ebfef837ba',0),(6809,1391294586,'0','3fba89294eff22c24de9d932adc5cb84d56e9ef5',0),(6810,1391294587,'0','5b7a97f0a05f336b786a1f1d98852cd7eb666c29',0),(6811,1391294587,'0','c0ac2a3769c81881a912dd4a0e985d8fb935af36',0),(6812,1391294587,'0','cdf31fcc1a5318eda9aa4111ce1283d052908ab1',0),(6813,1391294587,'0','31029cadbbe07e0fd4a5986140522f5115cc2b6c',0),(6814,1391294587,'0','eabb6489f51b5299159680557beddb7e066109cf',0),(6815,1391294587,'0','111691656e8cb2e6defdf4f3d659a5ec6d33867e',0),(6816,1391294587,'0','a6f026912df1c6ae40f753e1cdf9b2a112c0052d',0),(6817,1391294587,'0','88781afdf5028f14a266701225dc543dee1eb573',0),(6818,1391294587,'0','2c0523b6742a279c1cac01d368fec62bba693a0b',0),(6819,1391294588,'0','6803490fa3d03e0336c616ab8b407b867b428559',0),(6820,1391294588,'0','ebae4083efdc64303b0f59e499beaeddfaddc1ee',0),(6821,1391294588,'0','2e3337669159b6198bf20045aac65be9b5734876',0),(6822,1391294588,'0','edd74e5e5e21cae5033a81dcdb9b90c278842e52',0),(6823,1391294588,'0','202302426937cb4e9e901f884846c46a43920ccd',0),(6824,1391294588,'0','0c46693938cfd824d1578a853acfe6d3ffedde86',0),(6825,1391294588,'0','56cd75bcbdf57d8b19e34d827b94254155f6eee7',0),(6826,1391294588,'0','1d8a71a8e5fe4baea16c726dc11329ff2db65f16',0),(6827,1391294588,'0','2a161733ecaba5aeeadd3ea2da966c0f5f7990c7',0),(6828,1391294588,'0','4857687f30d567193137e4e02487fc8c1d019feb',0),(6829,1391294589,'0','2e55ce8bd49d9bcac634cb2dccaf98247407e8bb',0),(6830,1391294589,'0','5d404e794fd032be3a9df6d68c1a2c415d39847b',0),(6831,1391294589,'0','037cae4ced61185098dd672398ecc4fe7b8c79a4',0),(6832,1391294589,'0','24adf40516811597b99445f6ec812056dc3a1278',0),(6833,1391294589,'0','399c37feb3260644cf6622495288140d4ea3a832',0),(6834,1391294589,'0','181f799ea7def9e502d1066301c0ca7c5c38bf79',0),(6835,1391294589,'0','b50584c5dc396ab882995b078debf5d52f9a9799',0),(6836,1391294589,'0','2d0d9e9d730b617702fa8b3e0c3521e34482ec05',0),(6837,1391294589,'0','83fd2187c47cc6765a9ca55ca96eef2bbbaa33af',0),(6838,1391294590,'0','81da6e9c41897f88410323681e18378d9c681967',0),(6839,1391294590,'0','0e9594ac9c598a3d0980fe43a83506059091d32c',0),(6840,1391294590,'0','8109f300226ffb1a116822c0fc1a7c5275a3464d',0),(6841,1391294590,'0','94cfbee65933bb849fa8ad04c903d4da01e12ed6',0),(6842,1391294590,'0','689bbecd78e64d788c4b07c6b39a3f985167c519',0),(6843,1391294590,'0','b5b28121187e2418a153b29f161b939d4dd9488a',0),(6844,1391294590,'0','588c6fe2545232e8d2118c27b839023550e1a03a',0),(6845,1391294590,'0','6b9a04bdb102717d901a4c81f4fd32d13f59c3c3',0),(6846,1391294590,'0','f3c784b68b7d077fdc6fc60a624e921364e71196',0),(6847,1391294590,'0','4308578f6f014829a00349dfa312bd0ece8f3cf9',0),(6848,1391294591,'0','3bce24d25e883a6df86161964e7a04821130f370',0),(6849,1391294591,'0','dee9d57c4592027f2c923f50b29cc3f8c7fcb43b',0),(6850,1391294591,'0','c4bdfd365c4fdfa225319f44197cc99326a02911',0),(6851,1391294591,'0','0ca47e7f93cc041ca1f9befc690125a77df0f41b',0),(6852,1391294591,'0','c0706b131aa934522af2d94114859de1ed83b83f',0),(6853,1391294591,'0','8866972415a3fd155ee644ad83efe1c532e87ce9',0),(6854,1391294591,'0','046c9be3babc25e58b781a9aa39209d9563ae0ee',0),(6855,1391294591,'0','6de23431da9662fed655a4e2b5a65939f1037d58',0),(6856,1391294591,'0','46b20fc874071d129cfc092665641ff440fcf5a6',0),(6857,1391294591,'0','341fbdeedabf40050c3ab46ab64dad4ba49ae950',0),(6858,1391294592,'0','64a66cb03e979def9feccf5c1e8510f2f2f39a47',0),(6859,1391294592,'0','b926d80380f1d5aca4e79bd03094d7442d5e23da',0),(6860,1391294592,'0','b3caf72a5ea4e4e61b6f783555cbbf6841ecf2a2',0),(6861,1391294592,'0','967989a34a67b9c5c757c0559267e774b25c245d',0),(6862,1391294592,'0','6967010e024280d537341e4f3ba855725b7a2a74',0),(6863,1391294592,'0','9db2e52c8490760643ed09543a56e27ce5fc93a4',0),(6864,1391294592,'0','f33808289945e941bef58453fe4e5d12976ac615',0),(6865,1391294592,'0','9b8247fd38fe2577b7d1ec29cf04fdc91c43c560',0),(6866,1391294592,'0','624f0958a4063dc226b16468f45d6879ac6a658a',0),(6867,1391294592,'0','278727babc8b81e195cf64247cf6379da3b5b88e',0),(6868,1391294593,'0','7126808257deb202f80dec62b8373ff7f986434e',0),(6869,1391294593,'0','a8149826f133a776d4d6fc6556d704213372a872',0),(6870,1391294593,'0','76809301f2d1cf78646d0279b8dc3229bc1c612f',0),(6871,1391294593,'0','0931d59ef61f1e4b1bc9289f0286791c1ddf30d7',0),(6872,1391294593,'0','73ff4bbbfee23ef7ef6233f519c1fd42fc03c8d7',0),(6873,1391294593,'0','59ca9c13bca3ec0ab15fb8df443023d32202e36e',0),(6874,1391294593,'0','7cc355e31b020ce40602492066aa056ff4109d76',0),(6875,1391294593,'0','219c25110e2df89b7e37cbbb79733cd46b50147a',0),(6876,1391294593,'0','feae88d2c4880030215811dc3dd0cb3b51532e12',0),(6877,1391294593,'0','6fd0f0efaa37521c39c94010d75548e23d4db0a0',0),(6878,1391294593,'0','0837a46872eb4f66f049c491bd6047eb445861d6',0),(6879,1391294594,'0','424ebad2fa1d78517a82aca60819e68a58023ee8',0),(6880,1391294594,'0','0f7e1c89d06d2cd432070a2387c72d92004373c5',0),(6881,1391294594,'0','dd76c35e4e111d829ec4c98d972e1b844a036360',0),(6882,1391294594,'0','b018622c735f75f4a1b9e9dfb91dc6a20f62805f',0),(6883,1391294594,'0','1ded9d5054fb3d71aef72816d6125393a837e1f6',0),(6884,1391294594,'0','6e5ecb5c25526d177382f32994d5d8d697a41ec6',0),(6885,1391294594,'0','7fbb98175249e814e474dd07f4aeb2cfa735a298',0),(6886,1391294594,'0','1909517eb498714a37b580ea1e9024da2e854efd',0),(6887,1391294594,'0','142930180bd5a974e2298eb9c25c66b3097cd25f',0),(6888,1391294594,'0','e2cd503a4dda65ba4850ed24fb80a8946cc33679',0),(6889,1391294594,'0','688c6362a73027d0569a61d9fdb1df4f8c0739fd',0),(6890,1391294594,'0','80cb2ff9a5b4e63e4964904365dd1c5f6a359115',0),(6891,1391294595,'0','26edf2341e7761a40d55d066dbd9dadb4f0e34ce',0),(6892,1391294595,'0','284f202a081b83ce35212f503dfffb69b73bfa4e',0),(6893,1391294595,'0','2571f4aac20801e6cb81ef3b196182039e3db929',0),(6894,1391294595,'0','c4aa8abc17bfc66feda8212f5dfd55aaf55a1dd7',0),(6895,1391294595,'0','668f6b70dcfabcde19079b8b52cbd02cc6a2d46e',0),(6896,1391294595,'0','86299825d705e6e52c1e0ea654361b45670dd92e',0),(6897,1391294595,'0','5010ba5a158ece132cde73dafbacd611c5fd7066',0),(6898,1391294595,'0','52c3c017f9f4264035db9b4d18277667a917f3ff',0),(6899,1391294595,'0','232db70b9c53249b3eb564b92625b2eacd1e6929',0),(6900,1391294596,'0','2038d298f89be5147b1d8fc4ca638150f0fe28dc',0),(6901,1391294596,'0','94ea7c8fa1055d83a5e9b504c8f87775f4f71cc4',0),(6902,1391294596,'0','fca10065d9111305528eb8cf410e6d0ef0863ed7',0),(6903,1391294596,'0','90069c571e130c9e0a69a4ea557b9e02a428f5eb',0),(6904,1391294596,'0','fe73d084d86a6884a9780447f459aaf4e45f98b9',0),(6905,1391294596,'0','2f3dd07b81296af0361f41c387959f83c4ee24ef',0),(6906,1391294596,'0','5cf0ba6afcdc1246b8c268f9b18d01640447a1bc',0),(6907,1391294596,'0','3fd8678e5a792207863854bde47e6761ce4019ac',0),(6908,1391294597,'0','f21ca6ce7a1062192311e0b33bd93863c649bea3',0),(6909,1391294597,'0','86e37892666a614f75ae50e5d3b5f1d624c23f90',0),(6910,1391294597,'0','10e07ca26e20f9ecde43847f4d46e33e7e88c316',0),(6911,1391294597,'0','12f4445d268b3e429b316c407cd6d9191438b5d6',0),(6912,1391294597,'0','638d553985beb09aa3010e8c36898b8e2fb60e2f',0),(6913,1391294597,'0','f050fada21c76d3f1c9801423d0dafea99bf2b41',0),(6914,1391294597,'0','538468003d0967946c28ada07eb9595966acf909',0),(6915,1391294597,'0','7dd4def783f4e1321742ad508807d6df246fc522',0),(6916,1391294597,'0','513771fa404e7d1bb7da737dd6087d61f5af4a1f',0),(6917,1391294597,'0','1274da50e6e925ebc0dc73133023afb48f1d07ac',0),(6918,1391294598,'0','41f100e7e78399d1dedfba02a6ece8701411046e',0),(6919,1391294598,'0','1f3644e865763bec18e40a0f1b63fae98feecb5f',0),(6920,1391294598,'0','c3ccae5440b45978d8d7cb05726d025700c5d5f5',0),(6921,1391294598,'0','c97625a8349fd8fc91fb2df38f65a74349906aea',0),(6922,1391294598,'0','2b1161a44e1556be971234620290bd9350e4c86c',0),(6923,1391294598,'0','a49381a9d0f93b75e64e85ef0f30e4f120e0762c',0),(6924,1391294598,'0','7204f2ca8d7dc8540579164cf245f49e4be0a7a6',0),(6925,1391294598,'0','530e1c5f33415fa1de374f209da992486494fca6',0),(6926,1391294598,'0','e254a8cda286f0f6e752e2e1ffcdbf45a2b8dcda',0),(6927,1391294598,'0','85f049cdfa79d3b23d674aed3e5d333c7485bd4f',0),(6928,1391294598,'0','250032b6256113a96182139e3ecd8cdc9c07f906',0),(6929,1391294599,'0','fa973f169417d740a08d2c759dae1a8c5ab8bd24',0),(6930,1391294599,'0','6f0498bf322c3da84660262d0a14325b2f47efc9',0),(6931,1391294599,'0','02aa2a464945e2a93c5af43102118f24f3485600',0),(6932,1391294599,'0','cf67b4d0baae381a63106a8798d2c34654456c9f',0),(6933,1391294599,'0','8b5e348779214b6852fcfb688b10432a31a48f07',0),(6934,1391294599,'0','f4047f6d5e542868d200ad8de59ee90e0b31c49b',0),(6935,1391294599,'0','d5ea245edc5ad1ef1f48268b88062d9ee5183a17',0),(6936,1391294599,'0','2698a346f4decf06baa7f97497c66d5ac551265e',0),(6937,1391294599,'0','b1254d6635b098fcc8cb0182137531f9ad873cbb',0),(6938,1391294600,'0','f828ae83ff76c25a4d3680cd837c8e5b8d340380',0),(6939,1391294600,'0','39f627592817dde19824952d4738c9d354ab909f',0),(6940,1391294600,'0','2eeb8b5ca852a0adca8c1f1d70d35195f0217153',0),(6941,1391294600,'0','600b50f7ff7c0150a5db6685dae548a20382bf6d',0),(6942,1391294600,'0','001540989660e56c7137ea21958811fe63da35de',0),(6943,1391294600,'0','e5506b249e5c733cf7a4509bf436d491715a5555',0),(6944,1391294600,'0','968fadf522ba8fa4bca2eae700aafd0e5652865e',0),(6945,1391294600,'0','a6e08f37f4e8b24a5a0518c0de18e24e58d32eff',0),(6946,1391294600,'0','22683204028dc21e59c745bb73d74b56ddc9bd79',0),(6947,1391294601,'0','8d8f52095a5aed025dff389057dbed7948c69b43',0),(6948,1391294601,'0','78250912b9684b7d9e909621f2ac2c5bf521db54',0),(6949,1391294601,'0','b7371ce3479feadc3b6dd1036b5bac06c69394fd',0),(6950,1391294601,'0','e1ea4cae3e795c44305490deecba7000e7b2cb44',0),(6951,1391294601,'0','616b9ea97e61300cd32e1d3e242672b270813eec',0),(6952,1391294601,'0','a42f4b242ea662fbc979b5eb2d105a6a48252ddf',0),(6953,1391294602,'0','9eae644cab1991025f9c9ab49ec3e90e71474c0a',0),(6954,1391294602,'0','f057062602d2f1832f035033856c3d49d6551e6d',0),(6955,1391294602,'0','d5969f9b687112ac575dbc0c793ae88b52dd8a56',0),(6956,1391294602,'0','b464999d0e5efb23dc298156733c0cce4cd8b77d',0),(6957,1391294602,'0','1c86dfe6f0edb0c8489c46e3dfdcf7a28342687b',0),(6958,1391294602,'0','87e009f98676776d59221a4220fa8ed092299844',0),(6959,1391294603,'0','ebac03496df60459276db25feef325c0f02387d1',0),(6960,1391294603,'0','e750fcd01adb89bad1222d1a2a6b5e985dcc17b1',0),(6961,1391294603,'0','f45de54db658ebe3947ba1ced27c639166cd9283',0),(6962,1391294603,'0','3e3891067353fd7cc27c339e1528a1d30feda569',0),(6963,1391294603,'0','8234912382002a405a22271b0d6c4a22ad102dc6',0),(6964,1391294604,'0','8507b6fe467d9114f8d22baf2c5f901c9be0c274',0),(6965,1391294604,'0','83990e046634721fae3f4360552d84e81aac80a5',0),(6966,1391294604,'0','79012d41abed46ac9691ef247da07b883071b908',0),(6967,1391294604,'0','2025e4f23ebce569531718b83228a515ef050d14',0),(6968,1391294604,'0','4d5c5e539312bead41cfa40e5c415a02d8ed6f90',0),(6969,1391294605,'0','e7cbe6009cd50415763d8b92ed12e639a68a5bec',0),(6970,1391294605,'0','65c928426a2c689719703f073b7d60ec8ed277a5',0),(6971,1391294605,'0','4a989d65b3c466a2f0d6e902b65929cf5d980379',0),(6972,1391294605,'0','ada14bc8c7f066c70cb2e382cd057b614542c839',0),(6973,1391294605,'0','1e6a0ee3922ce7651ac227e67b064f250cefa8c6',0),(6974,1391294606,'0','7934843f8669224ccc1703d31fe61ded5a8b3771',0),(6975,1391294606,'0','90ca074cc637191e744c2d8e406540f51bd2a830',0),(6976,1391294606,'0','9debe584cee1e6f25f6ab9fb92d1dca48318f2e0',0),(6977,1391294606,'0','0211366f280ea3ca6521009a4fdc8a3e7049214c',0),(6978,1391294606,'0','80f97ddbcc51783e6bd1ab56fb79f0c5bbf2edc0',0),(6979,1391294607,'0','6e88c40add9f9530070b60d3f8c30ad9e92e0ba5',0),(6980,1391294607,'0','be5b8b5a4cc2aba54359468d138e54ded0533c1a',0),(6981,1391294607,'0','5b8ae549e066cfe2dcb5722614d3765a00b16533',0),(6982,1391294607,'0','c704097f6b527e7e2da1d266e1b9b94a49db4093',0),(6983,1391294607,'0','2ee67a79583e0c492df4498c929d46a9728e0c43',0),(6984,1391294608,'0','db3991450374feecc6b91cb54b87faf472dbf595',0),(6985,1391294608,'0','7830d8d0cb4fb9fa720e9b67edc82196568c6901',0),(6986,1391294608,'0','9a5e8ad084b3d81a1ae3c5fedefe21cde1cfd8f6',0),(6987,1391294608,'0','5da80b5d9ac9e740e0760675fdc8e3f683938b68',0),(6988,1391294608,'0','fcfd8993c3488637a15d379185087c827e8434cf',0),(6989,1391294609,'0','92aaa34feb0e8a028153ac469eb664a4635d643d',0),(6990,1391294609,'0','2ef44f53b8eecb1289ae1f92ee9fc63cda019595',0),(6991,1391294609,'0','4d1bdb6b523a3e14321f69c1b1d40e7f2ed8919d',0),(6992,1391294609,'0','dc9a9ac9d79014c59e91c1f917bbcc95b9502d17',0),(6993,1391294609,'0','7d1d8ac92cc99434ceb63eebe7c27808fff4b103',0),(6994,1391294610,'0','70b334b563967fa0d7af4a5d411cb30faf1a93df',0),(6995,1391294610,'0','a37a185af86289f6197c64d078a7e6758e6525a5',0),(6996,1391294610,'0','43a13438e1ef2219c81d1a961ae0e0c56db2ccf3',0),(6997,1391294610,'0','091563ff59c1d16d340c16472992f5f6706d91bd',0),(6998,1391294610,'0','dba386f98f9e40223be96ee193131fc3778e052d',0),(6999,1391294611,'0','63d8ac8ad10f9478955e61cd6d8bb4a0dc98c4a2',0),(7000,1391294611,'0','bf7c7091e49ce09b69b9f99025e6cf098d6f89a7',0),(7001,1391294611,'0','3a83e3d115988fb54b369e3d98d874e010416301',0),(7002,1391294611,'0','ac1e29092cef3cebb90bcc28b6fed73c410bd818',0),(7003,1391294611,'0','09aa1558859522f37afa12fdf388d7cfe52f2c7c',0),(7004,1391294612,'0','d2a4718e1cb2701c5e4987693d540e263b134a76',0),(7005,1391294612,'0','dc105527b6fcbb43556b2216352ddd3089142b91',0),(7006,1391294612,'0','2b9bdffbb76eb11753734c5e23b3cefd5bc25a07',0),(7007,1391294612,'0','ca4f3e1764cbe4c3e6bd852ba05a0088288478df',0),(7008,1391294612,'0','0d2418b277bfaf48f6dd3189a26861c280122f81',0),(7009,1391294613,'0','46b217c0c2db0d48e4bf1a68a97e25badfceaa9f',0),(7010,1391294613,'0','2f8e44a53d34e7676e2a39c2e8a6d3c6bda11504',0),(7011,1391294613,'0','a7a69fb1b9ea870eb60c5e27fb39605fb236b4f7',0),(7012,1391294613,'0','6c4cf0f879d9e3f9f8928bda5cdea334d6af33c8',0),(7013,1391294613,'0','3968611f246ede730bff7968de27bcbe1e37cfcd',0),(7014,1391294614,'0','2c7a7bff7b642e9c6d9c27630cce361c7fd0ec98',0),(7015,1391294614,'0','e2fe27eff7c68c77708f077cd71d1ddd6eade295',0),(7016,1391294614,'0','d3d92893da38ff170d71ebb658290c2561d23308',0),(7017,1391294614,'0','5062366143a1576dd949bc3c5068efec60b30d95',0),(7018,1391294614,'0','12286aba19d7e9abd47cfbc63d7091e8d26d6ef6',0),(7019,1391294615,'0','303b8594a2e5a90652c35818892adb295ba071ad',0),(7020,1391294615,'0','0efe5b83ac56dbc88c9bd68a0eb547f7584d33d1',0),(7021,1391294615,'0','909d324cfcb039655f69c08b1aadc6c4807b1e95',0),(7022,1391294615,'0','0065f1d2b0112331641fc3c9fd85c2fa09eae1df',0),(7023,1391294615,'0','6daf0589489c8bda28285c3417fcfd0783f377d3',0),(7024,1391294616,'0','70a8b208d093d5f956b278787fca53475e3f5360',0),(7025,1391294616,'0','6c15f4609e01295efb139d08686013b727adf750',0),(7026,1391294616,'0','e3dc686fd623ecebe1e875a7a01ed2c8447cc5d6',0),(7027,1391294616,'0','42bd2eeadbbc63fcf1a6670f948e40dc6fcdeea9',0),(7028,1391294617,'0','d399d77645079f4c4e11d52376857b373dc435c5',0),(7029,1391294617,'0','24f8ef5f09f40b52a1c26c32e1f31400a1359ba0',0),(7030,1391294617,'0','9433dba2d195cd234b283753bfb5c4f9ef0cfd28',0),(7031,1391294617,'0','f28f437b6fdb9ff4aa523817073e61360cd3fb33',0),(7032,1391294618,'0','bdcc2dc874965b0cf1c8c6530b0021bf74c337d6',0),(7033,1391294618,'0','71b43ad55476c0aca10e18be5501bf3d4c8fd98c',0),(7034,1391294618,'0','8d2a34f4e3b27b43d241c593bc677706bd0cc53e',0),(7035,1391294618,'0','c9c1cb59fa40c831f38593daabafd2f7f198b6a1',0),(7036,1391294618,'0','3a961b149a6c523a50bd4a67fa6cf7ee18b0d579',0),(7037,1391294619,'0','10386320e597a8b0d27bfa2085e82fac86c0dadc',0),(7038,1391294619,'0','fd39a14e3249390880d4f7634a1ff099ff6d1b45',0),(7039,1391294619,'0','b062bee8388eb8722b683a03e5582814eac0eb73',0),(7040,1391294619,'0','f7d2728b0c557907326b1d653ad255c6251cc1b0',0),(7041,1391294619,'0','ca32b4527107fbee233efe621dbad1a910107f6a',0),(7042,1391294620,'0','4ba275979432258eeb16d6dd9022ba97293d70c5',0),(7043,1391294620,'0','a336964b0e680b8417760b6dcea61066a059a3ec',0),(7044,1391294620,'0','19ea839df988e9ea014c4c381113a4baa2468c6b',0),(7045,1391294620,'0','bcf9e7fb0c6bca93af71aa671ba8936b3300d8f0',0),(7046,1391294620,'0','dc4710519260b046cbe7728f37ed06f9efb5a15c',0),(7047,1391294620,'0','c691baf36531da6f191e23c5c351b18dd38cb4ef',0),(7048,1391294621,'0','238f0054914811a5eaa27966c23068a9c51397ec',0),(7049,1391294621,'0','7a8c8f794ef96edf8d83a1e4416a81b2c7c6b3d2',0),(7050,1391294621,'0','e6e66c4593395619b8e21246859c6a22099caee3',0),(7051,1391294621,'0','690acc9bd1da19fdd58385b2ad7ab2dc58fc1e6f',0),(7052,1391294622,'0','a36ca4b0f7417d09f86c780f7c59479afca2ab80',0),(7053,1391294622,'0','35a28dd89c3ea7162cd48687bdd34687ad21a1f2',0),(7054,1391294622,'0','3bf84c28222678c79825d9a11134b8a6bf654480',0),(7055,1391294622,'0','52b9dce80a3bef32bd7e63700404eb85f7998415',0),(7056,1391296955,'0','48b707170e9ab7007f0f6ea0480f6207516fb44c',0),(7057,1391296956,'0','1b8ba4d1342509fbc9b600b993d927791d481284',0),(7058,1391296956,'0','78884bd687cb4f94a14a9b0e2efda64704319371',0),(7059,1391296958,'0','578ccf83ca31cdddeac039d86fa899c2ec05e491',0),(7060,1391296958,'0','bf29c175778c03320f1ec3c50468436c99efd588',0),(7061,1391296958,'0','a93e774b27277b515ddd73d02c88b0ff5041b049',0),(7062,1391296958,'0','5137c9222f40553c03495ae62c4ba9d96728fd7b',0),(7063,1391296958,'0','109bdcf5ac73a1cca574207ed903aab5f9bb94d3',0),(7064,1391296959,'0','df22486d0230e6badd47201083cc8682fe38ee0a',0),(7065,1391296959,'0','2d5677031b4ccc3c5033817f7dcb100cf47081d0',0),(7066,1391300346,'0','9e72bfc9622170e1a730fa1dad2b7d4211233ef5',0),(7067,1391300348,'0','565beb05201d75c943444db0f289db4b47ab9e51',0),(7068,1391300348,'0','caf6d6f89642fc772fc091a0f58a92b9c346bc83',0),(7069,1391300348,'0','2e5cd5e114ca4ab741e3302ef30dfd784f1e3200',0),(7070,1391300348,'0','e3e97bf9aa9940802a48ec4262a6d9a5443af3ef',0),(7071,1391301788,'0','bcb18fdce39cb794254bdc6fd752b9a029858f9b',0),(7072,1391301788,'0','b1caa6ab7b896f84da1200315f414c846620a12e',0),(7073,1391301788,'0','3c0e0c65126421cfe71fef501a6bb25a0ef8c09a',0),(7074,1391301789,'0','0d800146835419ca109fa77338af3d2a4994a38c',0),(7075,1391301801,'0','899619a66370e2d1f408714a22e0f3bd2093d102',0),(7076,1391301801,'0','122ce22462c49946b3859caf7af6b5e2a467a19f',0),(7077,1391301801,'0','a273e9a043dd4c46bfc98f51e25e94d8578ce839',0),(7078,1391301801,'0','8859049180650409f4cf34e9c4dee0657add4d4e',0),(7079,1391301807,'0','c9c71728960a21720d5f2b0f5d7dda499c0fc935',0),(7080,1391301807,'0','f1554e1b3eec86208f7f4e499b8bc54736bd6552',0),(7081,1391301812,'0','cc899d73932f6f1e06cc77dbac6f365e75a6f046',0),(7082,1391301812,'0','9c22bee4c70771bace57eb190eb49d2204ee0826',0),(7083,1391301812,'0','36a19bd6fc9ccf4a7c5e04848e59105e8eb9c84b',0),(7084,1391301822,'0','96319871e419f0a608ed87eca9e72c028a7b6ac4',0),(7085,1391302110,'0','913e3e6c3e0f5bbb29aa9e3d1398c82216d5d3c5',0),(7086,1391302110,'0','2259463c95972858bf276ef0df948a44a70a70c1',0),(7087,1391302110,'0','7323e6a54a5a72003e65ba16e9c88bce4ab136b7',0),(7088,1391302111,'0','506cd44e27cc593289a5489f2e061afa7b9de3cb',0),(7089,1391303465,'0','c26bc0d36d53afe1e956f3019b5240bc49f86049',0),(7090,1391303465,'0','910d2dbdb69bb99b2679ee4c2dc5adbc9380d4e5',0),(7091,1391303465,'0','6e7b3be2cb514c24ec205cf91377251a928958b9',0),(7092,1391303506,'0','012a26651eea8327a9f960790b400a8ac9ea115d',0),(7093,1391315010,'0','c5ab5e059036bb6276c351aab45fd7f9aafe4cc7',0),(7094,1391315011,'0','ab33759999a0de1cd9a762b399762e53ffe1bfdf',0),(7095,1391315011,'0','4f4668d3b5b856f860eaa065d0c55a61189d5145',0),(7096,1391315012,'0','6ee6cf899fc3f03493f81b623bd02789aa4cbc5c',0),(7097,1391315019,'0','a283f0cc6f01b53631a188775c3b04014d194a4a',0),(7098,1391315690,'0','6be16e0fcee2e93ea78c210d57a02b21801baf03',0),(7099,1391315691,'0','b4ba17db7e646621faa333eea939e56aab739831',0),(7100,1391315691,'0','589bc686a8a558987beacd1db0485a294c79d649',0),(7101,1391315692,'0','71e6ea596bd9ef3673ce09b2e065d78f2b55e780',0),(7102,1391315955,'0','8b07b611968931d0746959a4b365e578fd5fc8bc',0),(7103,1391315956,'0','2ec630a4b804021fcc2f527269ca8789e80c8ade',0),(7104,1391315957,'0','b76841c7274ad5ddf5ea9214d8e6147bfd75b59b',0),(7105,1391315957,'0','5a641be65d26a26eaa3606bacb668ec7d563c2d9',0),(7106,1391315963,'0','387acf4f704743fb7063712003c6c9a62ef20709',0),(7107,1391315963,'0','d7c7466a9cc79679981c6d54b8918ba047528b1b',0),(7108,1391315963,'0','b0ae73fee59aa541a6014d6c5ad8516a4bfa954b',1),(7109,1391315976,'0','b0b30362a7b7a3a839ff1e9849a052075b9696ed',0),(7110,1391315976,'a2100c5b8f815120e73474eca591d83f4d5e9017','59d9f88fb6aed14f8bab8da6203f3ba00261fcb8',0),(7111,1391315983,'a2100c5b8f815120e73474eca591d83f4d5e9017','c300eb15655888f719d43ecfd85b2c3e397397d1',0),(7112,1391315986,'a2100c5b8f815120e73474eca591d83f4d5e9017','f578963c4077dad4c8e22f96b8eda437ad37d094',0),(7113,1391316009,'a2100c5b8f815120e73474eca591d83f4d5e9017','1b528e6b69cb9aa992a5366b2862a23ba9585e64',0),(7114,1391316244,'a2100c5b8f815120e73474eca591d83f4d5e9017','43a9e8cbaab197706f6993738834deffa9efbfe5',0),(7115,1391316247,'a2100c5b8f815120e73474eca591d83f4d5e9017','f5ae8c01c4e98b362a60de87fc8533fed20929a6',0),(7116,1391316411,'0','05e692746eacdaa73c40636c5eae55f56ba26974',0),(7117,1391316563,'a2100c5b8f815120e73474eca591d83f4d5e9017','8fc6a00fd6ca04b6d5515b3c71f50bbc89d085c6',0),(7118,1391316568,'a2100c5b8f815120e73474eca591d83f4d5e9017','90691611a632635ec09cafdc74eeb97aa9cc303c',0),(7119,1391316569,'a2100c5b8f815120e73474eca591d83f4d5e9017','bd0d97c330521ee02041502821306c36de9dbaee',0),(7120,1391316617,'a2100c5b8f815120e73474eca591d83f4d5e9017','a417bde758531100a20a005fc65992227b596a13',0),(7121,1391316619,'a2100c5b8f815120e73474eca591d83f4d5e9017','52bdb616d0260808d91faf45573e299a2d4cee43',0),(7122,1391316631,'a2100c5b8f815120e73474eca591d83f4d5e9017','af9f279b3bfe021e0ed1cfbcb092dcbf8e17075a',0),(7123,1391316637,'a2100c5b8f815120e73474eca591d83f4d5e9017','ff18a1075ceb21e750eb947050df5d56cc4c34ff',0),(7124,1391316702,'a2100c5b8f815120e73474eca591d83f4d5e9017','59a1cff9341529c70653d3baa9575ba3644895b6',0),(7125,1391316707,'a2100c5b8f815120e73474eca591d83f4d5e9017','e3c317e89542a5b9c4a730ff96947c4379207aa7',0),(7126,1391316920,'0','452951d0b5be7a70e0c59fdf75e60896148e7e4a',0),(7127,1391317586,'a2100c5b8f815120e73474eca591d83f4d5e9017','fd08a65650867f9519a3a3301f63e19d9d526fd1',0),(7128,1391317591,'a2100c5b8f815120e73474eca591d83f4d5e9017','e021e11fd3e8332291d56e81d9a71c9ca4164afa',0),(7129,1391317654,'0','8c26749d3d5e72ba25e7814c7fbb77080b901426',0),(7130,1391318186,'a2100c5b8f815120e73474eca591d83f4d5e9017','e88352910a6d03cde1a94b182c80753a1103d74d',0),(7131,1391319175,'a2100c5b8f815120e73474eca591d83f4d5e9017','e9c44b6b100967d557a76d02ee9253f12943bd60',1),(7132,1391319181,'a2100c5b8f815120e73474eca591d83f4d5e9017','69c64a97868c46dba6c336c6d326bcac2ddad593',1),(7133,1391319188,'a2100c5b8f815120e73474eca591d83f4d5e9017','c4ed248d00c0a7ebedc06c5842a013d5628f9bb5',0),(7134,1391319350,'0','d1a038796af5d95e2ef319fb87f5867f550fcf01',0),(7135,1391319351,'0','400f6ba4fe3282ebf65be5ff3cd49fdc01b05fd8',0),(7136,1391319351,'0','d74b93883c46f4aeac65712ca9220213e5969e76',0),(7137,1391319351,'0','a24cd84f447a6822c5617a2f43bb4e6d6d20a31c',0),(7138,1391319360,'0','1d5651469f89871e7015c545b9ce6b23235725fc',0),(7139,1391319361,'0','de84475862967b20e5a21c1d5d3ad01c47449e03',0),(7140,1391320621,'0','2ac46850a508c8883cb761acac073d48aa6acad1',0),(7141,1391320622,'0','ac2ed48ca0319854c6184a390b91208d748d7755',0),(7142,1391320660,'a2100c5b8f815120e73474eca591d83f4d5e9017','0cf71e867ba4d7f5f76f43b9cba976f260989d30',0),(7143,1391320666,'0','b7a1d2384d429ee33373d1a57ff00bed6c14d3c5',0),(7144,1391320666,'0','606297d8e0819322d3649978d2e6337ff90d57a9',0),(7145,1391320666,'0','3d37b18cfdeab942da42603e781f2ef53a4d693c',0),(7146,1391320675,'0','388fb62d4a78f4833e58af1a9f95f17098b91f55',0),(7147,1391320681,'0','ceac44e7be5d80e98993c5de010ec7f4821b8882',0),(7148,1391320681,'0','676ebda9165f35eef8c73f7d957e35834f7a01c2',0),(7149,1391320681,'0','9152a1285f0e64134c3546db85197a67033d228a',0),(7150,1391320682,'0','9d3fe93e7070c1f8591a3903366e458856ede8f0',0),(7151,1391320695,'0','54cc8d1e3657b4d8604ee29804f6e15e99fb29bc',0),(7152,1391321117,'0','85f1a531760b14702caa18d247f2a6eb6aed1763',0),(7153,1391321608,'0','fe1c91b0be2e4c782dcac4c7670edbf383c916d6',0),(7154,1391321628,'0','bae268b074d90d4f8ecfea871f9f1055553557a3',0),(7155,1391322398,'0','ed66cfb356be35cae4f36f2bc705b874770bd9b1',0),(7156,1391322627,'0','8909abc68a34e081f05a81594ceb17596ff34eb0',0),(7157,1391322627,'0','1f84a0629f55366694e1000b73df5cd4755f99a2',0),(7158,1391322745,'0','7f66c24c9bfe0ecd96eb5964224a83268545cff4',0),(7159,1391323001,'0','68d7aa5822caf815a9594167ce01e3fb73c15510',0),(7160,1391323001,'0','576bc3fa86af8adab7c55e69139ea9d5d2ace287',0),(7161,1391323005,'0','052b70ee74baf8819f563b22774097c14e0c2673',0),(7162,1391323011,'0','291016d47bfdc1165ef16642e2cc5b9b45a66ab9',0),(7163,1391323013,'0','ae5cbda1804139ffb661d38890ec2f5e01099b49',0),(7164,1391323234,'0','15eb42b003efe3d807c0eee993e01aff64e74ff0',0),(7165,1391323238,'0','338370aa35d63df87450d80d58b53cec8a3c0766',0),(7166,1391323330,'38822ec9f329aecef9ea3d77bbb5b3be5ed186c3','dac170b733b075a5cc8f634b209ed2d0f5207417',0),(7167,1391323367,'0','e4ce8cb0747c1cefb8cbed99718a1da55ec33588',0),(7168,1391323394,'0','299074a82c57914f148cf5d4603954796710df3c',0),(7169,1391323394,'0','9005b69023a9b3eb4e2423f2eccf8090d17edf4e',0),(7170,1391323394,'0','7965a23252f2894263365cccb44ad64c4870efda',1),(7171,1391323405,'0','7c5b23ef17d60353af9c21b46fc97a84035984d5',0),(7172,1391323405,'a1103ceee655579ff143ee2c46775d3aa0f2029a','82db0289828b87e2a5b9d1d260c9a811cd2dc74a',0),(7173,1391323435,'a1103ceee655579ff143ee2c46775d3aa0f2029a','a9da69d9129d7fcefadd0df6ac085341961e5a84',0),(7174,1391323437,'a1103ceee655579ff143ee2c46775d3aa0f2029a','48d12f66f1326a86bcd26109e45e1609ef876b22',0),(7175,1391323437,'a1103ceee655579ff143ee2c46775d3aa0f2029a','bf2abf20b7ea80fcd3ae8ae42d57112db440959d',0),(7176,1391323438,'a1103ceee655579ff143ee2c46775d3aa0f2029a','d7bbd7049ae1234eb3487b32e13ca1426ffb626a',0),(7177,1391323438,'a1103ceee655579ff143ee2c46775d3aa0f2029a','95dfe8acab98460da68bc8cce9f976f19fc5c800',0),(7178,1391323501,'a1103ceee655579ff143ee2c46775d3aa0f2029a','1d18f108effba1c0adf650c70d6e7ee64237a582',0),(7179,1391323502,'a1103ceee655579ff143ee2c46775d3aa0f2029a','9dc0bbdc807b491509fb2b7b1ee730648db5932f',0),(7180,1391323503,'a1103ceee655579ff143ee2c46775d3aa0f2029a','f99a8a6adced58423208b8bc77741228f1d59bb0',0),(7181,1391323503,'a1103ceee655579ff143ee2c46775d3aa0f2029a','b3d9a7f037876781d4c3b94c98a5b190e256fa45',0),(7182,1391323505,'a1103ceee655579ff143ee2c46775d3aa0f2029a','5b13e5180cab2551aae1993fa1e34e98346245da',0),(7183,1391323505,'a1103ceee655579ff143ee2c46775d3aa0f2029a','e10e41a5c4e246398b200a69173bddcb18f226e8',0),(7184,1391323505,'a1103ceee655579ff143ee2c46775d3aa0f2029a','aa5489739755105655ac7eb6336208c6a0eb8bf2',0),(7185,1391323671,'a1103ceee655579ff143ee2c46775d3aa0f2029a','f65c9367de116465f1e3fa7729d735f91aafd406',0),(7186,1391323734,'0','e22d5e0527c1c8be0ec38ec1f9b6e2fae337af6e',0),(7187,1391323734,'0','69d88cab0e072c3f16a877aaa13f8a4632a3ffc8',0),(7188,1391323907,'a1103ceee655579ff143ee2c46775d3aa0f2029a','341fc468e22ffff5f12899c624d9876802777271',0),(7189,1391324025,'a1103ceee655579ff143ee2c46775d3aa0f2029a','e5dd60e7cce966953694dd060708ddd07f026f42',0),(7190,1391361662,'0','69b676654b537dae942d96bfc25dbbb1ee53c3ef',0),(7191,1391361672,'0','7896b0626dac34d5fe2dc98e053602f63c951105',0),(7192,1391361681,'0','c4378d4ca72dc5cd62729f4a6b92acb136abea1a',0);
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
INSERT INTO `exp_stats` VALUES (1,1,8,8,'Megan Sheley',29,0,0,0,1391288940,0,0,1383699119,1,1383699119,1391727164);
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (1,1,1,'index','y','webpage','','',1389247785,1,'n',0,'','n','y','o',0),(2,1,2,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'blog-index-page page\'  ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n      <div class=\"outer-container\">\n      <section class=\'carousel bottom\' ng-controller=\"bottomCarouselCtrl\">\n        <thumblist-nav>\n          <div>\n            <img src=\"uploads/home/feature/building_a_better_kibera.jpg\">\n            <h4>Global Hearing Mission</h4>\n            <button ng-click=\"slide(0)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/celebrity_film.jpg\">\n            <h4>Celebrity Support</h4>\n            <button ng-click=\"slide(1)\">watch video &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/changing_lives_with_sir_richard_branson_and_virgin_unite.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(2)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/listen_carefully.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(3)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/operation_change.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(4)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/philippines_film.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(5)\">read stories &rarr;</button>\n          </div>\n          <div>\n            <img src=\"uploads/home/feature/providing_clean_water_in_tanzania.jpg\">\n            <h4>Lorem ipsum</h4>\n            <button ng-click=\"slide(6)\">read stories &rarr;</button>\n          </div>\n        </thumblist-nav>\n      </section>\n      </div>\n\n      <div class=\"outer-container\">\n      <div ng-controller=\"PaginationController\">\n          <div class=\"pagination-featured\">\n            <div ng-repeat=\"featuredArticle in featured\">\n              <h1></h1>\n            </div>\n          </div>\n      \n          <div class=\"pagination\">\n            <ul>\n              <li ng-class=\"{disabled: currentPage == 0}\">\n                <a href ng-click=\"prevPage()\">Prev</a>\n              </li>\n              <li ng-repeat=\"n in range(pagedArticles.length)\"\n                ng-class=\"{active: n == currentPage}\"\n                ng-click=\"setPage()\">\n                <a href ng-bind=\"n + 1\">1</a>\n              </li>\n              <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                <a href ng-click=\"nextPage()\">Next</a>\n              </li>\n            </ul>\n          </div>\n          <div class=\"spacer\"></div>\n          <div class=\"outer-container\">\n            <div class=\"pagination-articles \" ng-repeat=\"articleCol in pagedArticles[currentPage]\">\n              <div ng-repeat=\"article in articleCol\">\n                <pagination article=\"article\" lightbox=\"lightbox\" add-tag=\"addTag\" class= \"row\"></pagination>\n              </div>\n            </div>\n          </div>\n          <div class=\"center\">\n            <div class=\"pagination\">\n              <ul>\n                <li ng-class=\"{disabled: currentPage == 0}\">\n                  <a href ng-click=\"prevPage()\">Prev</a>\n                </li>\n                <li ng-repeat=\"n in range(pagedArticles.length)\"\n                  ng-class=\"{active: n == currentPage}\"\n                  ng-click=\"setPage()\">\n                  <a href ng-bind=\"n + 1\">1</a>\n                </li>\n                <li ng-class=\"{disabled: currentPage == pagedArticles.length - 1}\">\n                  <a href ng-click=\"nextPage()\">Next</a>\n                </li>\n              </ul>\n            </div>\n          </div>\n      \n        <div class=\"modal fade\" ng-class=\"{in: lightbox()}\">\n          <div class=\"modal-header\">\n            <button type=\"button\" class=\"close\" ng-click=\"lightbox(false)\">×</button>\n            <h2>{{lightbox().title}}</h2>\n          </div>\n          <div class=\"modal-body\">\n            <a href=\"{{lightbox().url}}\">\n            Modal\n            </a>\n            <p>{{lightbox().desc}}</p>\n            <p>\n              <span class=\"label label-info pagination-tag\" ng-repeat=\"tag in lightbox().tags\"></span>\n            </p>\n          </div>\n          <div class=\"modal-footer\">\n            <a href=\"{{lightbox().url}}\" class=\"btn btn-primary\">Check out the App</a>\n            <a ng-show=\"lightbox().src\" href=\"{{lightbox().src}}\" class=\"btn\">View the Source</a>\n            <a ng-show=\"lightbox().info\" href=\"{{lightbox().info}}\" class=\"btn\">Read More</a>\n          </div>\n        </div>\n        <div class=\"modal-backdrop fade\" ng-class=\"{in: lightbox()}\" ng-click=\'lightbox(false)\'></div>\n      \n      </div>\n      </div>\n\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n\n</body>\n</html>\n',NULL,1390174301,1,'n',0,'','n','n','o',0),(3,1,3,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'media-mentions-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n\n          <p>Put production slider here</p>\n\n      <div class=\"outer-container\">\n\n\n          <p>Put production pagination here</p>\n      </div>\n    <!-- end main content section -->\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(4,1,4,'index','y','webpage','<!doctype html xmlns:ng=\"http://angularjs.org/\">\n<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n  <head>\n    <meta charset=\"utf-8\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <title>Starkey Hearing Foundation</title>\n    <meta name=\"description\" content=\"\">\n    <meta name=\"viewport\" content=\"width=device-width\">\n    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\n    \n\n    <link rel=\"stylesheet\" href=\"assets/styles/8f2c6af1.main.css\"/>\n  </head>\n  <body class=\'programs-page page\' ng:app=\"starkey\">\n\n    <!--[if lt IE 10]>\n      <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> to improve your experience.</p>\n    <![endif]-->\n\n    <header>\n      <div class=\"logo\">\n\n          <img src=\"images/starkey/starkey_logo.svg\">\n      </div>\n    \n      <div class=\'tagline\'>\n        <h1>So The World May Hear.</h1>\n      </div>\n    \n      <div class=\'social-links\'>\n        <ul>\n          <li>\n            <a href=\'#\' class=\"icon starkey-twitter-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-fb-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-insta-link\"></a>\n          </li>\n          <li>\n            <a href=\'#\' class=\"icon starkey-youtube\"></a>\n          </li>\n        </ul>\n      </div>\n    </header>\n    \n    <section class=\'outer-container\'>\n      <nav class=\'header-nav\'>\n        <div class=\'centered-half-container\'>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.who-we-are\'>Who we are</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.what-we-do\'>What we do</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.get-involved\'>Get involved</a>\n            </li>\n          </ul>\n        </div>\n          <!-- <hr/> -->\n        <article class=\'tab-content who-we-are\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">About Us</h3>\n                <h2>Our Mission</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Team</h3>\n                <h2>Lorem ipsum dolor sit amet, vixtua</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'media_mentions/index\'}\">\n                <h3 class=\"highlight\">Media Mentions</h3>\n                <h2>Lorem ipsum dolot, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Contact</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content what-we-do\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Mission</h3>\n                <h2>Our Global Impact</h2>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'programs/index\'}\">\n                <h3 class=\"highlight\">Programs</h3>\n                <h2>Help on the homefront</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Gala</h3>\n                <h2>So the world may hear</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n            <li>\n\n              <a href=\"{path=\'blog/index\'}\">\n                <h3 class=\"highlight\">Blog</h3>\n                <h2>Daily Action</h2>\n                <p>Lorem ipsum dolor sit amet, vix dico voluptua</p>\n              </a>\n            </li>\n          </ul>\n        </article>\n        <article class=\'tab-content get-involved\'>\n          <ul>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Take Action</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n            <li>\n              <a href=\"#\">\n                <h3 class=\"highlight\">Donate Now</h3>\n                <h2>Lorem ipsum dolor sit amet, vix dico voluptua</h2>\n              </a>\n            </li>\n          </ul>\n        </article>\n      </nav>\n    </section>\n    \n\n    <!-- Main content section -->\n\n    <section class=\'page-leader\'>\n      <h1>Our programs</h1>\n      <p>Programs overview lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dnt lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam.</p>\n    </section>\n\n    <section class=\'tabbed-content\'>\n      <nav>\n          <ul class=\'tabs row-table\'>\n            <li>\n              <a href=\'#\' data-content-class=\'.operation-change\'>Operation Change</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.listen-carefully\'>Listen Carefully</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hear-now\'>Hear Now</a>\n            </li>\n            <li>\n              <a href=\'#\' data-content-class=\'.hearing-aid-recycling\'>Hearing Aid Recycling</a>\n            </li>\n          </ul>\n      </nav>\n\n      <article class=\'tab-content operation-change\'>\n        <div class=\"outer-container\">\n          <h1>Operation change</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n\n        <section class=\"carousel hero\" ng-controller=\"heroCarouselCtrl\">\n          <swiper class=\"swiper\" speed=\"5000\" continuous=\"true\" auto=\"false\">\n            <div class=\"slide\">\n              <article>\n                <img src=\"uploads/home/hero/vikings_mission.jpg\" />\n              </article>\n            </div>\n          </swiper>\n        </section>\n        <br/>\n        <div class=\"outer-container\">\n          <h1>Our partnerships</h1>\n\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content listen-carefully\'>\n        <div class=\"outer-container\">\n          <h1>Listen Carefully</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hear-now\'>\n        <div class=\"outer-container\">\n          <h1>Hear Now</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n\n      <article class=\'tab-content hearing-aid-recycling\'>\n        <div class=\"outer-container\">\n          <h1>Hearing Aid Recycling</h1>\n          <p>Lorem ipsum dolor sit amet, vix dico voluptua iracundia ut, ut eam voluptatum adversarium. Omittam electram te has, ex usu novum dicunt. Everti iudicabit eu quo. Has postea sententiae an.</p>\n\n          <p>Ei nostro menandri sit, vitae urbanitas et cum, mel te lorem appareat disputationi. Id probo concludaturque nec, ex pri labore discere. Vim ei nonumes senserit suscipiantur, nibh animal quo an, ei vel assum bonorum invenire. In vis scripta inermis antiopam. Te mea repudiare gloriatur, error scribentur per ad. Eu alia moderatius vis, eos atqui assum incorrupte at.</p>\n        </div>\n      </article>\n    </section>\n    <br/>\n\n      <p>Put production thumblist_nav here</p>\n\n    <footer>\n      <div>\n        <section class=\'social-info\'>\n          <ul>\n            <li class=\'blog\'>\n              <span class=\"icon starkey-blog\"></span>\n              <div>\n                <h4>From our blog</h4>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\n              </div>\n              <p><a href=\'#\'>Check out our blog &rarr;</a></p>\n            </li>\n            <li class=\'facebook\'>\n              <span class=\"icon starkey-fb\"></span>\n              <div>\n                <h1>29,000 <strong>fans</strong></h1>\n              </div>\n              <p><a href=\'#\'>Like us</a></p>\n            </li>\n            <li class=\'instagram\'>\n              <span class=\"icon starkey-insta\"></span>\n              <div>\n                <ul class=\'thumbs\'>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                  <li>\n                    <img src=\"http://placehold.it/40x40\">\n                  </li>\n                </ul>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n            </li>\n            <li class=\'twitter\'>\n              <span class=\"icon starkey-share-twitter\"></span>\n              <div>\n                <p class=\'tweet\'>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In, ducimus atque veniam magni debitis dignissimos.</p>\n                <span class=\"time\">15 sec ago</span>\n              </div>\n              <p><a href=\'#\'>Follow us &rarr;</a></p>\n    \n            </li>\n          </ul>\n        </section>\n        <section class=\'footer-links\'>\n          <ul>\n            <li><a href=\'#\'>Legal/financials &rarr;</a></li>\n            <li><a href=\'#\'>Subscribe to our newsletter &rarr;</a></li>\n            <li><p>&copy; Starkey Hearing Foundation 2013</p></li>\n          </ul>\n        </section>\n      </div>\n    </footer>\n\n    <script src=\"/assets/scripts/b90c57c9.vendor.js\"></script>\n    \n    <script src=\"/assets/scripts/dbf7d947.main.js\"></script>\n    \n    <script src=\"/assets/scripts/d41d8cd9.plugins.js\"></script>\n    \n</body>\n</html>\n',NULL,1390174542,1,'n',0,'','n','n','o',0),(6,1,6,'homepage_markers','y','webpage','{exp:http_header content_type=\"application/json\"}{\n   \"coords\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"5\"}\n        [\n            {homepage_map_item_lat},\n            {homepage_map_item_lon}\n        ],\n   {/exp:channel:entries}\n   ],\n   \"meta_data\":[\n   {exp:channel:entries channel=\"homepage_map_items\" backspace=\"6\"}\n       {\n          \"title\":\"{title}\",\n          \"text\":\"{if homepage_map_item_content}{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{homepage_map_item_content}{/exp:low_replace}{/if}\",\n          \"thumbnail_url\":\"{homepage_map_item_image}\",\n          \"action_target\":\"{homepage_map_item_cta_link}\"\n       },\n    {/exp:channel:entries}\n   ]\n}\n',NULL,1391025408,1,'n',0,'','n','n','o',0),(7,1,6,'blog','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"blog\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"blog_item_category\": \"{if blog_category}{blog_category}{/if}\",\n      \"related_blog_items\": [],\n      \"featured\": \"{if blog_featured}{blog_featured}{/if}\",\n      \"title\": \"{title}\",\n      \"thumbnail_image_url\": \"{if blog_image}{blog_image}{/if}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391025413,1,'n',0,'','n','n','o',0),(8,1,6,'press','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"media_mentions\" backspace=\"6\"}\n    {\n      \"id\":\"{entry_id}\",\n      \"date\":\"{entry_date format=\'%m %d %Y\'}\",\n      \"category\":\"{if blog_category}{media_mention_category}{/if}\",\n      \"featured\":\"{media_mention_featured}\",\n      \"thumbnail_image_url\":\"{media_mention_splash_image}\",\n      \"logo_image_url\":\"{media_mention_icon}\",\n      \"quote\":\"{media_mention_quote}\",\n      \"call_to_action_text\":\"{media_mention_cta_text}\",\n      \"call_to_action_link\":\"{media_mention_cta_link}\",\n      \"video_link\":\"{media_mention_video_url}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391025417,1,'n',0,'','n','n','o',0),(9,1,6,'featured_articles','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"homepage_main_carousel\" backspace=\"6\"}\n    {\n      \"id\": \"{entry_id}\",\n      \"date\": \"{entry_date format=\'%m %d %Y\'}\",\n      \"thumbnail_title\":\"{title}\",\n      \"thumbnail_image_url\":\"{carousel_image}\",\n      \"thumbnail_call_to_action_text\":\"{carousel_cta}\",\n      \"panel_title\":\"{carousel_panel_title}\",\n      \"panel_image_url\":\"{carousel_panel_image}\",\n      \"video_link_url\":\"{carousel_video_url}\",\n      \"panel_call_to_action_text\":\"{carousel_panel_cta}\",\n      \"panel_call_to_action_link_url\":\"{carousel_panel_link}\",\n      \"body\":\"{exp:low_replace find=\"QUOTE|NEWLINE\" replace=\"\\QUOTE|SPACE\" multiple=\"yes\"}{carousel_body}{/exp:low_replace}\"\n    },\n    {/exp:channel:entries}\n]\n',NULL,1391043561,1,'n',0,'','n','n','o',0),(10,1,6,'program_partnerships','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{operation_change_partnerships}\n    {\n      \"id\":\"{operation_change_partnerships:row_id}\",\n      \"date\":\"{operation_change_partnerships:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{operation_change_partnerships:image}\",\n      \"thumbnail_title\":\"{operation_change_partnerships:title}\",\n      \"link_cta\":\"{operation_change_partnerships:cta}\",\n      \"link_url\":\"{operation_change_partnerships:link}\"\n    },\n    {/operation_change_partnerships}{/exp:channel:entries}\n]\n',NULL,1391210764,1,'n',0,'','n','n','o',0),(11,1,6,'program_resources','y','webpage','{exp:http_header content_type=\"application/json\"}[\n    {exp:channel:entries channel=\"programs\" backspace=\"6\"}{listen_carefully_additional_reso}\n    {\n      \"id\":\"{listen_carefully_additional_reso:row_id}\",\n      \"date\":\"{listen_carefully_additional_reso:date format=\'%F %d%S %Y\'}\",\n      \"thumbnail_image_url\":\"{listen_carefully_additional_reso:image}\",\n      \"thumbnail_title\":\"{listen_carefully_additional_reso:title}\",\n      \"link_cta\":\"{listen_carefully_additional_reso:cta}\",\n      \"link_url\":\"{listen_carefully_additional_reso:link}\"\n    },\n    {/listen_carefully_additional_reso}{/exp:channel:entries}\n]\n',NULL,1391211059,1,'n',0,'','n','n','o',0),(12,1,6,'index','y','webpage','',NULL,1391288619,1,'n',0,'','n','n','o',0),(13,1,6,'programs','n','webpage','',NULL,1391319181,1,'n',0,'','n','y','o',0),(14,1,6,'program_0','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'operation-change reveal\'>\n  <div class=\"outer-container\">\n    <h1>Operation change</h1>\n\n    {exp:hundies_shortcode}{operation_change_content}{/exp:hundies_shortcode}\n    <br/>\n    <h2>Our Partnerships</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programPartnerships\">\n      <div ng-repeat=\"article in programPartnerships\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391320660,1,'n',0,'','n','n','o',0),(15,1,6,'program_1','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'listen-carefully reveal\'>\n  <div class=\"outer-container\">\n\n    {exp:hundies_shortcode}{listen_carefully_content}{/exp:hundies_shortcode}\n\n    <br/>\n    <h2>Additional Resources</h2>\n  </div>\n  <section class=\'carousel thumblist\'>\n    <thumblist-nav articles=\"programResources\">\n      <div ng-repeat=\"article in programResources\">\n        <div class=\"image\" ng-style=\"{\'background-image\': \'url(\' + article.thumbnail_image_url + \')\'}\"></div>\n        <div class=\"content\">\n          <h4 ng-bind=\"article.thumbnail_title\"></h4>\n          <p class=\'call-to-action align-right\'>\n            <a href=\'\' ng-bind=\"article.link_cta\">\n               &rarr;\n            </a>\n          </p>\n        </div>\n      </div>\n    </thumblist-nav>\n  </section>\n</article>\n{/exp:channel:entries}\n',NULL,1391321117,1,'n',0,'','n','n','o',0),(16,1,6,'program_2','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hear-now reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hear Now</h1>\n\n    {exp:hundies_shortcode}{hear_now_content}{/exp:hundies_shortcode}\n\n    <p class=\"centered\"><a href=\"mailto:{hear_now_form_contact}\" class=\"link-with-border\">Contact us</a></p>\n\n\n    <p>{hear_now_download_copy}</p>\n\n    <div class=\"share-this-post\">\n      <ul>\n        <li><span class=\"note\">Download application</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_english}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n        <li><span class=\"note\">Descargar Solicitud</span></li>\n        <li>\n          <a href=\"{hear_now_form_download_spanish}\">\n            <span class=\"icon starkey-pdf\"></span>\n          </a>\n        </li>\n      </ul>\n    </div>\n\n    <hr class=\"separator padded\"/>\n    <br/>\n    <h1>Providers Looking to Give Back</h1>\n    <p>Help us give the gift of hearing into the lives of people in need. If you are a hearing professional, we need your help! Become a Hear Now volunteer and volunteer to fit and follow up with our Hear Now recipients. Your crucial support will help change lives forever and have a lasting impact on your community.</p>\n    <br/>\n    <hr class=\"separator padded\"/>\n    <h3><a href ng-click=\"toggle(isVisible)\" class=\"highlight\">Become a Provider</a></h3>\n    <br/>\n    <div class=\"become-a-provider-container reveal\" ng-show=\"isVisible\">\n      <br/>\n\n      {exp:freeform:form form_id=\"2\" form:id=\"become_a_provider_form\" form:class=\"flatform invert\" return=\"/#thank_you\"}\n          <ul>\n              <li class=\"leftHalf\">\n                  {freeform:field:first_name attr:placeholder=\"First Name\"}\n              </li>\n\n              <li class=\"rightHalf\">\n                  {freeform:field:last_name attr:placeholder=\"Last Name\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:practice attr:placeholder=\"Practice\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:phone attr:placeholder=\"Phone\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:fax attr:placeholder=\"FAX\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:email attr:placeholder=\"Email\"}\n              </li>\n\n              <li class=\"leftFourth\">\n                  {freeform:field:address attr:placeholder=\"Address\"}\n              </li>\n\n              <li class=\"middleFourthFirst\">\n                  {freeform:field:city attr:placeholder=\"City\"}\n              </li>\n\n              <li class=\"middleFourthSecond\">\n                  {freeform:field:state attr:placeholder=\"State\"}\n              </li>\n\n              <li class=\"rightFourth\">\n                  {freeform:field:zip attr:placeholder=\"Zip\"}\n              </li>\n\n              <li class=\"full\">\n                <br/>\n                  {freeform:submit attr:id=\"become_a_provider_submit\"}\n              </li>\n          </ul>\n\n      {/exp:freeform:form}\n    </div>\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322627,1,'n',0,'','n','n','o',0),(17,1,6,'program_3','y','webpage','{exp:channel:entries channel=\"programs\" limit=\"1\"}\n<article class=\'hearing-aid-recycling reveal\'>\n  <div class=\"outer-container\">\n    <h1>Hearing Aid Recycling</h1>\n\n    {exp:hundies_shortcode}{hearing_aid_recycling_content}{/exp:hundies_shortcode}\n\n  </div>\n</article>\n{/exp:channel:entries}\n',NULL,1391322745,1,'n',0,'','n','n','o',0);
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

-- Dump completed on 2014-02-02 17:25:08
