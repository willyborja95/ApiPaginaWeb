-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: paginaSistemas
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_core_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add site',4,'add_site'),(14,'Can change site',4,'change_site'),(15,'Can delete site',4,'delete_site'),(16,'Can view site',4,'view_site'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add content',9,'add_content'),(34,'Can change content',9,'change_content'),(35,'Can delete content',9,'delete_content'),(36,'Can view content',9,'view_content'),(37,'Can add content_ media',10,'add_content_media'),(38,'Can change content_ media',10,'change_content_media'),(39,'Can delete content_ media',10,'delete_content_media'),(40,'Can view content_ media',10,'view_content_media'),(41,'Can add event',11,'add_event'),(42,'Can change event',11,'change_event'),(43,'Can delete event',11,'delete_event'),(44,'Can view event',11,'view_event'),(45,'Can add group',12,'add_group'),(46,'Can change group',12,'change_group'),(47,'Can delete group',12,'delete_group'),(48,'Can view group',12,'view_group'),(49,'Can add group_ contact',13,'add_group_contact'),(50,'Can change group_ contact',13,'change_group_contact'),(51,'Can delete group_ contact',13,'delete_group_contact'),(52,'Can view group_ contact',13,'view_group_contact'),(53,'Can add group_ event',14,'add_group_event'),(54,'Can change group_ event',14,'change_group_event'),(55,'Can delete group_ event',14,'delete_group_event'),(56,'Can view group_ event',14,'view_group_event'),(57,'Can add item_ category',15,'add_item_category'),(58,'Can change item_ category',15,'change_item_category'),(59,'Can delete item_ category',15,'delete_item_category'),(60,'Can view item_ category',15,'view_item_category'),(61,'Can add menu',16,'add_menu'),(62,'Can change menu',16,'change_menu'),(63,'Can delete menu',16,'delete_menu'),(64,'Can view menu',16,'view_menu'),(65,'Can add person',17,'add_person'),(66,'Can change person',17,'change_person'),(67,'Can delete person',17,'delete_person'),(68,'Can view person',17,'view_person'),(69,'Can add person_ contact',18,'add_person_contact'),(70,'Can change person_ contact',18,'change_person_contact'),(71,'Can delete person_ contact',18,'delete_person_contact'),(72,'Can view person_ contact',18,'view_person_contact'),(73,'Can add person_ media',19,'add_person_media'),(74,'Can change person_ media',19,'change_person_media'),(75,'Can delete person_ media',19,'delete_person_media'),(76,'Can view person_ media',19,'view_person_media'),(77,'Can add person_ role',20,'add_person_role'),(78,'Can change person_ role',20,'change_person_role'),(79,'Can delete person_ role',20,'delete_person_role'),(80,'Can view person_ role',20,'view_person_role'),(81,'Can add person_ section',21,'add_person_section'),(82,'Can change person_ section',21,'change_person_section'),(83,'Can delete person_ section',21,'delete_person_section'),(84,'Can view person_ section',21,'view_person_section'),(85,'Can add requirement',22,'add_requirement'),(86,'Can change requirement',22,'change_requirement'),(87,'Can delete requirement',22,'delete_requirement'),(88,'Can view requirement',22,'view_requirement'),(89,'Can add role',23,'add_role'),(90,'Can change role',23,'change_role'),(91,'Can delete role',23,'delete_role'),(92,'Can view role',23,'view_role'),(93,'Can add section',24,'add_section'),(94,'Can change section',24,'change_section'),(95,'Can delete section',24,'delete_section'),(96,'Can view section',24,'view_section'),(97,'Can add subject_ matter',25,'add_subject_matter'),(98,'Can change subject_ matter',25,'change_subject_matter'),(99,'Can delete subject_ matter',25,'delete_subject_matter'),(100,'Can view subject_ matter',25,'view_subject_matter'),(101,'Can add Token',26,'add_token'),(102,'Can change Token',26,'change_token'),(103,'Can delete Token',26,'delete_token'),(104,'Can view Token',26,'view_token'),(105,'Can add email address',27,'add_emailaddress'),(106,'Can change email address',27,'change_emailaddress'),(107,'Can delete email address',27,'delete_emailaddress'),(108,'Can view email address',27,'view_emailaddress'),(109,'Can add email confirmation',28,'add_emailconfirmation'),(110,'Can change email confirmation',28,'change_emailconfirmation'),(111,'Can delete email confirmation',28,'delete_emailconfirmation'),(112,'Can view email confirmation',28,'view_emailconfirmation'),(113,'Can add social account',29,'add_socialaccount'),(114,'Can change social account',29,'change_socialaccount'),(115,'Can delete social account',29,'delete_socialaccount'),(116,'Can view social account',29,'view_socialaccount'),(117,'Can add social application',30,'add_socialapp'),(118,'Can change social application',30,'change_socialapp'),(119,'Can delete social application',30,'delete_socialapp'),(120,'Can view social application',30,'view_socialapp'),(121,'Can add social application token',31,'add_socialtoken'),(122,'Can change social application token',31,'change_socialtoken'),(123,'Can delete social application token',31,'delete_socialtoken'),(124,'Can view social application token',31,'view_socialtoken'),(125,'Can add blacklisted token',32,'add_blacklistedtoken'),(126,'Can change blacklisted token',32,'change_blacklistedtoken'),(127,'Can delete blacklisted token',32,'delete_blacklistedtoken'),(128,'Can view blacklisted token',32,'view_blacklistedtoken'),(129,'Can add outstanding token',33,'add_outstandingtoken'),(130,'Can change outstanding token',33,'change_outstandingtoken'),(131,'Can delete outstanding token',33,'delete_outstandingtoken'),(132,'Can view outstanding token',33,'view_outstandingtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_category`
--

DROP TABLE IF EXISTS `core_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_category`
--

LOCK TABLES `core_category` WRITE;
/*!40000 ALTER TABLE `core_category` DISABLE KEYS */;
INSERT INTO `core_category` VALUES (1,'Titulación',1),(2,'Tipo de contenido',1),(3,'Tipo de contacto',1);
/*!40000 ALTER TABLE `core_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_content`
--

DROP TABLE IF EXISTS `core_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `academic_period_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`),
  KEY `core_content_academic_period_id_557f696c_fk_core_item` (`academic_period_id`),
  KEY `core_content_contact_type_id_865e9f5b_fk_core_item` (`contact_type_id`),
  KEY `core_content_university_career_id_aab813f0_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_content_academic_period_id_557f696c_fk_core_item` FOREIGN KEY (`academic_period_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_content_contact_type_id_865e9f5b_fk_core_item` FOREIGN KEY (`contact_type_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_content_university_career_id_aab813f0_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_content`
--

LOCK TABLES `core_content` WRITE;
/*!40000 ALTER TABLE `core_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_content_media`
--

DROP TABLE IF EXISTS `core_content_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_content_media` (
  `content_media_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(500) NOT NULL,
  `content_id` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  PRIMARY KEY (`content_media_id`),
  KEY `core_content_media_content_id_b0bd4353_fk_core_cont` (`content_id`),
  KEY `core_content_media_item_category_id_66dac686_fk_core_item` (`item_category_id`),
  CONSTRAINT `core_content_media_content_id_b0bd4353_fk_core_cont` FOREIGN KEY (`content_id`) REFERENCES `core_content` (`content_id`),
  CONSTRAINT `core_content_media_item_category_id_66dac686_fk_core_item` FOREIGN KEY (`item_category_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_content_media`
--

LOCK TABLES `core_content_media` WRITE;
/*!40000 ALTER TABLE `core_content_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_content_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_event`
--

DROP TABLE IF EXISTS `core_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `place` varchar(255) NOT NULL,
  `link_form` varchar(255) NOT NULL,
  `url_info` varchar(255) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `core_event_content_id_9bd467a1_fk_core_content_content_id` (`content_id`),
  CONSTRAINT `core_event_content_id_9bd467a1_fk_core_content_content_id` FOREIGN KEY (`content_id`) REFERENCES `core_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_event`
--

LOCK TABLES `core_event` WRITE;
/*!40000 ALTER TABLE `core_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_group`
--

DROP TABLE IF EXISTS `core_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_group_university_career_id_39063862_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_group_university_career_id_39063862_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_group`
--

LOCK TABLES `core_group` WRITE;
/*!40000 ALTER TABLE `core_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_group_contact`
--

DROP TABLE IF EXISTS `core_group_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_group_contact` (
  `group_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`group_contact_id`),
  KEY `core_group_contact_contact_type_id_cc574dcc_fk_core_item` (`contact_type_id`),
  KEY `core_group_contact_group_id_d57ecb53_fk_core_group_group_id` (`group_id`),
  CONSTRAINT `core_group_contact_contact_type_id_cc574dcc_fk_core_item` FOREIGN KEY (`contact_type_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_group_contact_group_id_d57ecb53_fk_core_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `core_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_group_contact`
--

LOCK TABLES `core_group_contact` WRITE;
/*!40000 ALTER TABLE `core_group_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_group_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_group_event`
--

DROP TABLE IF EXISTS `core_group_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_group_event` (
  `group_event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`group_event_id`),
  KEY `core_group_event_event_id_a616e4a9_fk_core_event_event_id` (`event_id`),
  KEY `core_group_event_group_id_b13af07f_fk_core_group_group_id` (`group_id`),
  CONSTRAINT `core_group_event_event_id_a616e4a9_fk_core_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `core_event` (`event_id`),
  CONSTRAINT `core_group_event_group_id_b13af07f_fk_core_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `core_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_group_event`
--

LOCK TABLES `core_group_event` WRITE;
/*!40000 ALTER TABLE `core_group_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_group_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_item_category`
--

DROP TABLE IF EXISTS `core_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_item_category` (
  `item_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`item_category_id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_item_category_category_id_941bfee9_fk_core_cate` (`category_id`),
  CONSTRAINT `core_item_category_category_id_941bfee9_fk_core_cate` FOREIGN KEY (`category_id`) REFERENCES `core_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_item_category`
--

LOCK TABLES `core_item_category` WRITE;
/*!40000 ALTER TABLE `core_item_category` DISABLE KEYS */;
INSERT INTO `core_item_category` VALUES (1,'Sistemas Informáticos y Computación',1,1);
/*!40000 ALTER TABLE `core_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_menu`
--

DROP TABLE IF EXISTS `core_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_menu_item_category_id_0af0abd9_fk_core_item` (`item_category_id`),
  CONSTRAINT `core_menu_item_category_id_0af0abd9_fk_core_item` FOREIGN KEY (`item_category_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_menu`
--

LOCK TABLES `core_menu` WRITE;
/*!40000 ALTER TABLE `core_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_person`
--

DROP TABLE IF EXISTS `core_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `first_last_name` varchar(255) NOT NULL,
  `second_last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person`
--

LOCK TABLES `core_person` WRITE;
/*!40000 ALTER TABLE `core_person` DISABLE KEYS */;
INSERT INTO `core_person` VALUES (1,'Renato','Johao','Balcázar','Loaiza'),(2,'Jose','','Abad',''),(3,'Admin','Admin','Admin','Admin'),(4,'Fernanda','Maricela','Soto','.');
/*!40000 ALTER TABLE `core_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_person_contact`
--

DROP TABLE IF EXISTS `core_person_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_person_contact` (
  `person_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_contact_id`),
  KEY `core_person_contact_contact_type_id_7ce55f97_fk_core_item` (`contact_type_id`),
  KEY `core_person_contact_person_id_fc3e8512_fk_core_person_person_id` (`person_id`),
  CONSTRAINT `core_person_contact_contact_type_id_7ce55f97_fk_core_item` FOREIGN KEY (`contact_type_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_person_contact_person_id_fc3e8512_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_contact`
--

LOCK TABLES `core_person_contact` WRITE;
/*!40000 ALTER TABLE `core_person_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_person_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_person_media`
--

DROP TABLE IF EXISTS `core_person_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_person_media` (
  `person_media_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_media_id`),
  KEY `core_person_media_item_category_id_a751f04d_fk_core_item` (`item_category_id`),
  KEY `core_person_media_person_id_997d293f_fk_core_person_person_id` (`person_id`),
  CONSTRAINT `core_person_media_item_category_id_a751f04d_fk_core_item` FOREIGN KEY (`item_category_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_person_media_person_id_997d293f_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_media`
--

LOCK TABLES `core_person_media` WRITE;
/*!40000 ALTER TABLE `core_person_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_person_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_person_role`
--

DROP TABLE IF EXISTS `core_person_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_person_role` (
  `person_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`person_role_id`),
  KEY `core_person_role_person_id_2c0c1d2e_fk_core_person_person_id` (`person_id`),
  KEY `core_person_role_role_id_8b23e5b6_fk_core_role_role_id` (`role_id`),
  KEY `core_person_role_university_career_id_1fdb165c_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_person_role_person_id_2c0c1d2e_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`),
  CONSTRAINT `core_person_role_role_id_8b23e5b6_fk_core_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `core_role` (`role_id`),
  CONSTRAINT `core_person_role_university_career_id_1fdb165c_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_role`
--

LOCK TABLES `core_person_role` WRITE;
/*!40000 ALTER TABLE `core_person_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_person_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_person_section`
--

DROP TABLE IF EXISTS `core_person_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_person_section` (
  `person_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`person_section_id`),
  KEY `core_person_section_person_id_69e0f916_fk_core_person_person_id` (`person_id`),
  KEY `core_person_section_section_id_90fab099_fk_core_sect` (`section_id`),
  CONSTRAINT `core_person_section_person_id_69e0f916_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`),
  CONSTRAINT `core_person_section_section_id_90fab099_fk_core_sect` FOREIGN KEY (`section_id`) REFERENCES `core_section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_section`
--

LOCK TABLES `core_person_section` WRITE;
/*!40000 ALTER TABLE `core_person_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_person_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_requirement`
--

DROP TABLE IF EXISTS `core_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_requirement` (
  `requirement_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_matter_id` int(11) NOT NULL,
  `subject_matter_requirement_id` int(11) NOT NULL,
  PRIMARY KEY (`requirement_id`),
  KEY `core_requirement_subject_matter_id_1b10d3bd_fk_core_subj` (`subject_matter_id`),
  KEY `core_requirement_subject_matter_requi_11a7d38b_fk_core_subj` (`subject_matter_requirement_id`),
  CONSTRAINT `core_requirement_subject_matter_id_1b10d3bd_fk_core_subj` FOREIGN KEY (`subject_matter_id`) REFERENCES `core_subject_matter` (`subject_matter_id`),
  CONSTRAINT `core_requirement_subject_matter_requi_11a7d38b_fk_core_subj` FOREIGN KEY (`subject_matter_requirement_id`) REFERENCES `core_subject_matter` (`subject_matter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_requirement`
--

LOCK TABLES `core_requirement` WRITE;
/*!40000 ALTER TABLE `core_requirement` DISABLE KEYS */;
INSERT INTO `core_requirement` VALUES (1,18,4),(2,18,11),(3,11,4);
/*!40000 ALTER TABLE `core_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_role`
--

DROP TABLE IF EXISTS `core_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role`
--

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
INSERT INTO `core_role` VALUES (2,'coordinador'),(1,'superadmin');
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_section`
--

DROP TABLE IF EXISTS `core_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_section_university_career_id_794330ec_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_section_university_career_id_794330ec_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_section`
--

LOCK TABLES `core_section` WRITE;
/*!40000 ALTER TABLE `core_section` DISABLE KEYS */;
INSERT INTO `core_section` VALUES (1,'Inteligencia Artificial',1),(2,'Tecnologías Avanzadas de la Web',1);
/*!40000 ALTER TABLE `core_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_subject_matter`
--

DROP TABLE IF EXISTS `core_subject_matter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_subject_matter` (
  `subject_matter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `semester` int(11) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_matter_id`),
  KEY `core_subject_matter_university_career_id_8f1f8695_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_subject_matter_university_career_id_8f1f8695_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_subject_matter`
--

LOCK TABLES `core_subject_matter` WRITE;
/*!40000 ALTER TABLE `core_subject_matter` DISABLE KEYS */;
INSERT INTO `core_subject_matter` VALUES (1,'Lógica de la Programación',1,1),(2,'Fundamentos Informáticos',1,1),(3,'Fundamentos Matemáticos',1,1),(4,'Desarrollo Espiritual I',1,1),(5,'Emprendimiento',1,1),(6,'Realidad Nacional y Ambiental',1,1),(7,'Expresión Oral y Escrita',1,1),(8,'Fundamentos de Programación',2,1),(9,'Contabilidad',2,1),(10,'Matemáticas Discretas',2,1),(11,'Desarrollo Espiritual II',2,1),(12,'Inglés I',2,1),(13,'Gestión Productiva 1.1 Pasantía en Cittes',2,1),(14,'Estructura de Datos y Algoritmos',3,1),(15,'Programación de Algoritmos',3,1),(16,'Física',3,1),(17,'Cálculo',3,1),(18,'Desarrollo Espiritual III',3,1),(19,'Inglés II',3,1),(20,'Gestión Productiva 1.2 Pasantía en Cittes',3,1),(21,'Programación Avanzada',4,1),(22,'Electrónica Digital',4,1),(23,'Estadística',4,1),(24,'Organización y Administración Empresarial',4,1),(25,'Libre Configuración 1',4,1),(26,'Inglés III',4,1),(27,'Gestión Productiva 1.3 Formación en Academias',4,1),(28,'Arquitectura de Computadores',5,1),(29,'Fundamentos de Bases de Datos',5,1),(30,'Economía, Finanzas e Inversiones',5,1),(31,'Métodos Cuantitativos',5,1),(32,'Libre Configuración 2',5,1),(33,'inglés IV',5,1),(34,'Gestión Productiva 2.1 Práctica en Cittes',5,1),(35,'Fundamentos de Ingeniería de Software',6,1),(36,'Sistemas Operativos',6,1),(37,'Bases de Datos Avanzadas',6,1),(38,'Libre Configuración 3',6,1),(39,'Complementaria 1',6,1),(40,'Gestión Productiva 2.2 Práctica en Cittes',6,1),(41,'Fundamentos de Redes y Telecomunicaciones',7,1),(42,'Teoría de Autómatas y Compiladores',7,1),(43,'Gestión de Proyectos',7,1),(44,'Ingeniería de Requisitos',7,1),(45,'Libre Configuración 4',7,1),(46,'Complementaria 2',7,1),(47,'Gestión Productiva 3.1 Formación en Academias',7,1),(48,'Ingeniería Web',8,1),(49,'Gestión de Tecnologías de la Información',8,1),(50,'Redes y Sistemas Distribuidos',8,1),(51,'Libre Configuración 5',8,1),(52,'Complementaria 3',8,1),(53,'Gestión Productiva 3.2 Práctica en Cittes',8,1),(54,'Arquitectura y Computación Paralela',9,1),(55,'Arquitectura y Seguridad de Redes',9,1),(56,'Inteligencia Artificial',9,1),(57,'Arquitectura de Aplicaciones',9,1),(58,'Libre Configuración 6',9,1),(59,'GP Proyecto Fin de Carrera 4.1',9,1),(60,'Procesos de Ingeniería de Software',10,1),(61,'IA Avanzado',10,1),(62,'Sistemas Basados en Conocimiento',10,1),(63,'Auditoría Informática',10,1),(64,'Libre Configuración 7',10,1),(65,'GP Proyecto Fin de Carrera 4.2',10,1);
/*!40000 ALTER TABLE `core_subject_matter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `person_id` (`person_id`),
  CONSTRAINT `core_user_person_id_f854b357_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$120000$RFM54yk8DFfO$mUgLNILzjpAjc0GbcxpKuLCL0zsiFOE3oNldx1Nvb8Q=','2019-11-30 07:20:25.000000','renatojobal','renatojobal@gmail.com',1,1,1,'2019-11-30 06:26:22.000000','2019-11-30 06:26:22.000000',1),(2,'pbkdf2_sha256$120000$ITEgWjbJzSER$wYEcKpK/5m/kzAyvV9zJBhu6PYy9TeplCUwQsIUpxa4=','2019-12-01 16:54:37.978748','jose','jose@gmail.com',1,1,1,'2019-11-30 06:31:37.000000','2019-11-30 06:31:37.000000',2);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_groups`
--

DROP TABLE IF EXISTS `core_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_groups_user_id_group_id_c82fcad1_uniq` (`user_id`,`group_id`),
  KEY `core_user_groups_group_id_fe8c697f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `core_user_groups_group_id_fe8c697f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `core_user_groups_user_id_70b4d9b8_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_groups`
--

LOCK TABLES `core_user_groups` WRITE;
/*!40000 ALTER TABLE `core_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_user_user_permissions`
--

DROP TABLE IF EXISTS `core_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_user_user_permissions_user_id_permission_id_73ea0daa_uniq` (`user_id`,`permission_id`),
  KEY `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` (`permission_id`),
  CONSTRAINT `core_user_user_permi_permission_id_35ccf601_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `core_user_user_permissions_user_id_085123d3_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user_user_permissions`
--

LOCK TABLES `core_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `core_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_core_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-30 16:45:40.194780','1','Role object (1)',1,'[{\"added\": {}}]',23,1),(2,'2019-11-30 16:46:06.151459','2','Role object (2)',1,'[{\"added\": {}}]',23,1),(3,'2019-11-30 18:03:35.315724','3','Admin Admin',1,'[{\"added\": {}}]',17,1),(4,'2019-11-30 18:03:45.166305','3','superadmin@utpl.edu.ec',1,'[{\"added\": {}}]',7,1),(5,'2019-11-30 18:04:10.834564','3','superadmin@utpl.edu.ec',3,'',7,1),(6,'2019-11-30 18:05:29.899600','4','Fernanda Soto',1,'[{\"added\": {}}]',17,1),(7,'2019-11-30 18:21:13.748930','2','jose@gmail.com',2,'[]',7,1),(8,'2019-11-30 18:21:22.641016','1','renatojobal@gmail.com',2,'[]',7,1),(9,'2019-12-01 16:55:55.129154','1','Titulación',1,'[{\"added\": {}}]',8,2),(10,'2019-12-01 16:56:18.640807','2','Tipo de contenido',1,'[{\"added\": {}}]',8,2),(11,'2019-12-01 16:56:36.440395','3','Tipo de contacto',1,'[{\"added\": {}}]',8,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (27,'account','emailaddress'),(28,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(26,'authtoken','token'),(5,'contenttypes','contenttype'),(8,'core','category'),(9,'core','content'),(10,'core','content_media'),(11,'core','event'),(12,'core','group'),(13,'core','group_contact'),(14,'core','group_event'),(15,'core','item_category'),(16,'core','menu'),(17,'core','person'),(18,'core','person_contact'),(19,'core','person_media'),(20,'core','person_role'),(21,'core','person_section'),(22,'core','requirement'),(23,'core','role'),(24,'core','section'),(25,'core','subject_matter'),(7,'core','user'),(6,'sessions','session'),(4,'sites','site'),(29,'socialaccount','socialaccount'),(30,'socialaccount','socialapp'),(31,'socialaccount','socialtoken'),(32,'token_blacklist','blacklistedtoken'),(33,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-30 06:18:57.013936'),(2,'contenttypes','0002_remove_content_type_name','2019-11-30 06:18:58.376418'),(3,'auth','0001_initial','2019-11-30 06:19:03.287766'),(4,'auth','0002_alter_permission_name_max_length','2019-11-30 06:19:03.432941'),(5,'auth','0003_alter_user_email_max_length','2019-11-30 06:19:03.484248'),(6,'auth','0004_alter_user_username_opts','2019-11-30 06:19:03.524120'),(7,'auth','0005_alter_user_last_login_null','2019-11-30 06:19:03.561303'),(8,'auth','0006_require_contenttypes_0002','2019-11-30 06:19:03.598629'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-30 06:19:03.637704'),(10,'auth','0008_alter_user_username_max_length','2019-11-30 06:19:03.671489'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-30 06:19:03.704252'),(12,'core','0001_initial','2019-11-30 06:19:51.085853'),(13,'account','0001_initial','2019-11-30 06:19:54.408342'),(14,'account','0002_email_max_length','2019-11-30 06:19:54.520153'),(15,'admin','0001_initial','2019-11-30 06:19:56.906036'),(16,'admin','0002_logentry_remove_auto_add','2019-11-30 06:19:56.984331'),(17,'admin','0003_logentry_add_action_flag_choices','2019-11-30 06:19:57.026295'),(18,'authtoken','0001_initial','2019-11-30 06:19:58.390704'),(19,'authtoken','0002_auto_20160226_1747','2019-11-30 06:19:59.507196'),(20,'sessions','0001_initial','2019-11-30 06:20:00.307443'),(21,'sites','0001_initial','2019-11-30 06:20:00.766201'),(22,'sites','0002_alter_domain_unique','2019-11-30 06:20:01.165572'),(23,'socialaccount','0001_initial','2019-11-30 06:20:09.596556'),(24,'socialaccount','0002_token_max_lengths','2019-11-30 06:20:10.095959'),(25,'socialaccount','0003_extra_data_default_dict','2019-11-30 06:20:10.162242'),(26,'token_blacklist','0001_initial','2019-11-30 06:20:14.337287'),(27,'token_blacklist','0002_outstandingtoken_jti_hex','2019-11-30 06:20:15.201023'),(28,'token_blacklist','0003_auto_20171017_2007','2019-11-30 06:20:15.294694'),(29,'token_blacklist','0004_auto_20171017_2013','2019-11-30 06:20:16.370170'),(30,'token_blacklist','0005_remove_outstandingtoken_jti','2019-11-30 06:20:17.284383'),(31,'token_blacklist','0006_auto_20171017_2113','2019-11-30 06:20:17.443650'),(32,'token_blacklist','0007_auto_20171017_2214','2019-11-30 06:20:20.287945');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m0q6bbrhboh4vqmq48aoxdsg59z72yr7','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2019-12-14 07:20:25.904595'),('u6nmog5sbafvpmi2crt1xqwa6ivwxom3','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2019-12-15 16:54:37.988952'),('ykfd5vkkgtfat9vjolgcbp4ikm8w8s42','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2019-12-14 06:28:19.870952');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_core_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_core_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blac_token_id_3cc7fe56_fk_token_bla` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_core_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_core_user` FOREIGN KEY (`user_id`) REFERENCES `core_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTI5NzI1NiwianRpIjoiODlmODE3YTE5YmRhNDk3MWI2ZWY4YjU5ZWUzMzY3MjEiLCJ1c2VyX2lkIjoxfQ.AsXtjQYNSkN7Cv6QnYVOQV4S3js4210In9YpLxbjWkU','2019-12-01 14:34:16.880479','2019-12-02 14:34:16.000000',1,'89f817a19bda4971b6ef8b59ee336721');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 18:30:56
