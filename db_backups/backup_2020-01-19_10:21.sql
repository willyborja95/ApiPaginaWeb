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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_category`
--

LOCK TABLES `core_category` WRITE;
/*!40000 ALTER TABLE `core_category` DISABLE KEYS */;
INSERT INTO `core_category` VALUES (1,'Titulación',1),(2,'Tipo de contenido',1),(3,'Tipo de contacto',1),(4,'Periodo Académico',1),(5,'a',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_content`
--

LOCK TABLES `core_content` WRITE;
/*!40000 ALTER TABLE `core_content` DISABLE KEYS */;
INSERT INTO `core_content` VALUES (2,'prueba','hola','2020-01-17 04:00:33.416913','2020-01-17 04:00:33.416923',2,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_content_media`
--

LOCK TABLES `core_content_media` WRITE;
/*!40000 ALTER TABLE `core_content_media` DISABLE KEYS */;
INSERT INTO `core_content_media` VALUES (2,'prueba',2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_event`
--

LOCK TABLES `core_event` WRITE;
/*!40000 ALTER TABLE `core_event` DISABLE KEYS */;
INSERT INTO `core_event` VALUES (1,'2020-01-17 04:01:00.807671','edifcio 4','prueba form2','www.youtube.com3',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_group`
--

LOCK TABLES `core_group` WRITE;
/*!40000 ALTER TABLE `core_group` DISABLE KEYS */;
INSERT INTO `core_group` VALUES (1,'Inclusive Human Computer Interaction',1),(2,'Knowledge-Based Systems',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_group_contact`
--

LOCK TABLES `core_group_contact` WRITE;
/*!40000 ALTER TABLE `core_group_contact` DISABLE KEYS */;
INSERT INTO `core_group_contact` VALUES (2,'095951254',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_group_event`
--

LOCK TABLES `core_group_event` WRITE;
/*!40000 ALTER TABLE `core_group_event` DISABLE KEYS */;
INSERT INTO `core_group_event` VALUES (1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_item_category`
--

LOCK TABLES `core_item_category` WRITE;
/*!40000 ALTER TABLE `core_item_category` DISABLE KEYS */;
INSERT INTO `core_item_category` VALUES (1,'Sistemas Informáticos y Computación',1,1),(2,'Octubre 2019 - Febrero 2020',1,4),(3,'Video',1,2),(4,'Correo electrónico',1,3),(5,'Extensión',1,3),(9,'Nro celular',1,3),(10,'Arquitectura',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person`
--

LOCK TABLES `core_person` WRITE;
/*!40000 ALTER TABLE `core_person` DISABLE KEYS */;
INSERT INTO `core_person` VALUES (1,'Renato','Johao','Balcázar','Loaiza'),(2,'Jose','','Abad',''),(3,'Admin','Admin','Admin','Admin'),(4,'Fernanda','Maricela','Soto','Guerrero'),(5,'Luis','Rodrigo','Barba','Guamán'),(8,'prueba','prueba','prueba','prueba'),(10,'Marco','S','Polo','L');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_contact`
--

LOCK TABLES `core_person_contact` WRITE;
/*!40000 ALTER TABLE `core_person_contact` DISABLE KEYS */;
INSERT INTO `core_person_contact` VALUES (1,'lrbarba@utpl.edu.ec',4,5),(2,'2674',5,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_media`
--

LOCK TABLES `core_person_media` WRITE;
/*!40000 ALTER TABLE `core_person_media` DISABLE KEYS */;
INSERT INTO `core_person_media` VALUES (2,'prueba',1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_role`
--

LOCK TABLES `core_person_role` WRITE;
/*!40000 ALTER TABLE `core_person_role` DISABLE KEYS */;
INSERT INTO `core_person_role` VALUES (1,1,1,1),(2,2,1,1),(3,4,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_section`
--

LOCK TABLES `core_person_section` WRITE;
/*!40000 ALTER TABLE `core_person_section` DISABLE KEYS */;
INSERT INTO `core_person_section` VALUES (1,5,1),(4,5,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_requirement`
--

LOCK TABLES `core_requirement` WRITE;
/*!40000 ALTER TABLE `core_requirement` DISABLE KEYS */;
INSERT INTO `core_requirement` VALUES (1,18,4),(2,25,4),(4,22,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_subject_matter`
--

LOCK TABLES `core_subject_matter` WRITE;
/*!40000 ALTER TABLE `core_subject_matter` DISABLE KEYS */;
INSERT INTO `core_subject_matter` VALUES (1,'Lógica de la Programación',1,1),(2,'Fundamentos Informáticos',1,1),(3,'Fundamentos Matemáticos',1,1),(4,'Desarrollo Espiritual I',1,1),(5,'Emprendimiento',1,1),(6,'Realidad Nacional y Ambiental',1,1),(7,'Expresión Oral y Escrita',1,1),(8,'Fundamentos de Programación',2,1),(9,'Contabilidad',2,1),(10,'Matemáticas Discretas',2,1),(11,'Desarrollo Espiritual II',2,1),(12,'Inglés I',2,1),(13,'Gestión Productiva 1.1 Pasantía en Cittes',2,1),(14,'Estructura de Datos y Algoritmos',3,1),(15,'Programación de Algoritmos',3,1),(16,'Física',3,1),(17,'Cálculo',3,1),(18,'Desarrollo Espiritual III',3,1),(19,'Inglés II',3,1),(20,'Gestión Productiva 1.2 Pasantía en Cittes',3,1),(21,'Programación Avanzada',4,1),(22,'Electrónica Digital',4,1),(23,'Estadística',4,1),(24,'Organización y Administración Empresarial',4,1),(25,'Libre Configuración 1',4,1),(26,'Inglés III',4,1),(27,'Gestión Productiva 1.3 Formación en Academias',4,1),(28,'Arquitectura de Computadores',5,1),(29,'Fundamentos de Bases de Datos',5,1),(30,'Economía, Finanzas e Inversiones',5,1),(31,'Métodos Cuantitativos',5,1),(32,'Libre Configuración 2',5,1),(33,'inglés IV',5,1),(34,'Gestión Productiva 2.1 Práctica en Cittes',5,1),(35,'Fundamentos de Ingeniería de Software',6,1),(36,'Sistemas Operativos',6,1),(37,'Bases de Datos Avanzadas',6,1),(38,'Libre Configuración 3',6,1),(39,'Complementaria 1',6,1),(40,'Gestión Productiva 2.2 Práctica en Cittes',6,1),(41,'Fundamentos de Redes y Telecomunicaciones',7,1),(42,'Teoría de Autómatas y Compiladores',7,1),(43,'Gestión de Proyectos',7,1),(44,'Ingeniería de Requisitos',7,1),(45,'Libre Configuración 4',7,1),(46,'Complementaria 2',7,1),(47,'Gestión Productiva 3.1 Formación en Academias',7,1),(48,'Ingeniería Web',8,1),(49,'Gestión de Tecnologías de la Información',8,1),(50,'Redes y Sistemas Distribuidos',8,1),(51,'Libre Configuración 5',8,1),(52,'Complementaria 3',8,1),(53,'Gestión Productiva 3.2 Práctica en Cittes',8,1),(54,'Arquitectura y Computación Paralela',9,1),(55,'Arquitectura y Seguridad de Redes',9,1),(56,'Inteligencia Artificial',9,1),(57,'Arquitectura de Aplicaciones',9,1),(58,'Libre Configuración 6',9,1),(59,'GP Proyecto Fin de Carrera 4.1',9,1),(60,'Procesos de Ingeniería de Software',10,1),(61,'IA Avanzado',10,1),(62,'Sistemas Basados en Conocimiento',10,1),(63,'Auditoría Informática',10,1),(64,'Libre Configuración 7',10,1),(65,'GP Proyecto Fin de Carrera 4.2',10,1),(68,'computacion',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$120000$RFM54yk8DFfO$mUgLNILzjpAjc0GbcxpKuLCL0zsiFOE3oNldx1Nvb8Q=','2020-01-17 17:39:23.580089','renatojobal','renatojobal@gmail.com',1,1,1,'2019-11-30 06:26:22.000000','2019-11-30 06:26:22.000000',1),(2,'pbkdf2_sha256$120000$ITEgWjbJzSER$wYEcKpK/5m/kzAyvV9zJBhu6PYy9TeplCUwQsIUpxa4=','2019-12-10 19:12:43.817231','jose','jose@gmail.com',1,1,1,'2019-11-30 06:31:37.000000','2019-11-30 06:31:37.000000',2),(3,'pbkdf2_sha256$120000$dHxWGqmjMqkR$V6FOZQLAeLxxwiHf95gxd0JYcWND9iQJgMYReEkHxng=','2020-01-10 21:51:57.604500','william','superadmin@utpl.edu.ec',0,0,1,'2019-12-02 03:06:07.386706','2019-12-02 03:06:07.386716',3),(4,'pbkdf2_sha256$120000$fcMAg9a8ZRaD$qwZPOYBOEotSeUu2Nel2kLqQ0vHvWGK+dyNFdenkIu8=',NULL,'fernanda','fmsoto@utpl.edu.ec',0,1,1,'2019-12-02 03:07:50.328798','2019-12-02 03:07:50.328810',4),(5,'password123',NULL,'marco','marco@email.com',1,1,1,'2020-01-17 18:15:45.000000','2020-01-17 18:15:45.000000',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-30 16:45:40.194780','1','Role object (1)',1,'[{\"added\": {}}]',23,1),(2,'2019-11-30 16:46:06.151459','2','Role object (2)',1,'[{\"added\": {}}]',23,1),(3,'2019-11-30 18:03:35.315724','3','Admin Admin',1,'[{\"added\": {}}]',17,1),(4,'2019-11-30 18:03:45.166305','3','superadmin@utpl.edu.ec',1,'[{\"added\": {}}]',7,1),(5,'2019-11-30 18:04:10.834564','3','superadmin@utpl.edu.ec',3,'',7,1),(6,'2019-11-30 18:05:29.899600','4','Fernanda Soto',1,'[{\"added\": {}}]',17,1),(7,'2019-11-30 18:21:13.748930','2','jose@gmail.com',2,'[]',7,1),(8,'2019-11-30 18:21:22.641016','1','renatojobal@gmail.com',2,'[]',7,1),(9,'2019-12-01 16:55:55.129154','1','Titulación',1,'[{\"added\": {}}]',8,2),(10,'2019-12-01 16:56:18.640807','2','Tipo de contenido',1,'[{\"added\": {}}]',8,2),(11,'2019-12-01 16:56:36.440395','3','Tipo de contacto',1,'[{\"added\": {}}]',8,2),(12,'2019-12-06 06:02:07.804137','1','Person_Role object (1)',1,'[{\"added\": {}}]',20,1),(13,'2019-12-06 06:02:30.746351','2','Person_Role object (2)',1,'[{\"added\": {}}]',20,1),(14,'2019-12-06 06:02:30.989893','3','Person_Role object (3)',1,'[{\"added\": {}}]',20,1),(15,'2019-12-06 06:02:54.047752','3','Person_Role object (3)',3,'',20,1),(16,'2019-12-10 20:33:52.893632','4','Fernanda Soto',2,'[{\"changed\": {\"fields\": [\"second_last_name\"]}}]',17,2),(17,'2019-12-11 15:13:49.447842','4','Periodo Académico',1,'[{\"added\": {}}]',8,2),(18,'2019-12-11 15:41:42.525433','2','Octubre 2019 - Febrero 2020',1,'[{\"added\": {}}]',15,2),(19,'2019-12-11 15:42:08.416774','3','Video',1,'[{\"added\": {}}]',15,2),(20,'2019-12-11 15:48:14.363927','1','Group object (1)',1,'[{\"added\": {}}]',12,2),(21,'2019-12-11 15:48:58.905643','2','Group object (2)',1,'[{\"added\": {}}]',12,2),(22,'2019-12-11 16:22:53.551645','4','Correo electrónico',1,'[{\"added\": {}}]',15,2),(23,'2019-12-11 16:23:10.836407','5','Extensión',1,'[{\"added\": {}}]',15,2),(24,'2019-12-11 16:23:47.757102','1','Person_Contact object (1)',1,'[{\"added\": {}}]',18,2),(25,'2019-12-11 16:25:29.162359','2','Person_Contact object (2)',1,'[{\"added\": {}}]',18,2),(26,'2019-12-14 23:08:57.404662','5','userPrueba@gmail.com',1,'[{\"added\": {}}]',7,3),(27,'2019-12-16 17:10:29.154428','5','userPrueba@gmail.com',3,'',7,3),(28,'2019-12-22 02:56:05.877253','3','Person_Role object (3)',1,'[{\"added\": {}}]',20,3),(29,'2020-01-17 17:43:15.254796','10','Marco Polo',1,'[{\"added\": {}}]',17,1),(30,'2020-01-17 18:16:25.323266','5','marco@email.com',1,'[{\"added\": {}}]',7,1),(31,'2020-01-17 18:17:25.829978','10','Arquitectura',1,'[{\"added\": {}}]',15,1);
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
INSERT INTO `django_session` VALUES ('hadtoowfrkw91j13o7jyf6ce29us77sq','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2019-12-24 19:12:43.827132'),('knvaqx0s02d9qwlbgokxz1li8oqr4fji','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-01-31 17:39:23.590280'),('pjrrtg6g346tl6v40lvvhymrweqxlnvn','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2020-01-04 02:15:01.649969'),('uuvae5qh7kh5diyw7d09oj86zf757qj5','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2019-12-26 23:42:17.798660'),('ykfd5vkkgtfat9vjolgcbp4ikm8w8s42','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2019-12-14 06:28:19.870952'),('ywzuzaag5yfxozodu80oya2nnw0mgdvs','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2019-12-30 17:10:05.196371'),('z1roexnd1av003bkbjhleqfz8yq0ewek','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2020-01-24 21:51:57.614439');
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTI5NzI1NiwianRpIjoiODlmODE3YTE5YmRhNDk3MWI2ZWY4YjU5ZWUzMzY3MjEiLCJ1c2VyX2lkIjoxfQ.AsXtjQYNSkN7Cv6QnYVOQV4S3js4210In9YpLxbjWkU','2019-12-01 14:34:16.880479','2019-12-02 14:34:16.000000',1,'89f817a19bda4971b6ef8b59ee336721'),(2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMTU3NCwianRpIjoiNjRlZjBkZDljYTQ0NGNlNjkzZmY4YTRmOGI4Y2NjNzMiLCJ1c2VyX2lkIjoxfQ.TcgFnaV3vSKAfEtQiLfDSI_DT47FRP9j1ERT6I-eks0','2019-12-03 23:19:34.638799','2019-12-04 23:19:34.000000',1,'64ef0dd9ca444ce693ff8a4f8b8ccc73'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMTYxMSwianRpIjoiOWU1ODg0YjM5NTkyNGMxZmI1ZDMwODljZWY2MzZkN2QiLCJ1c2VyX2lkIjoxfQ.VPSi2gDHLDpan_UGgM7a6z9Yfg0XFqu8QpkAGC-2a54','2019-12-03 23:20:11.998680','2019-12-04 23:20:11.000000',1,'9e5884b395924c1fb5d3089cef636d7d'),(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMjkxMiwianRpIjoiNTFlNmFhNzI1NmI2NGNiZTkwNDhiZDQ3N2U5ZjE3OTgiLCJ1c2VyX2lkIjoxfQ.kuFLRItSfNV-8nrYnpPyEcPdnZaOB48Akredk2mXx30','2019-12-03 23:41:52.115080','2019-12-04 23:41:52.000000',1,'51e6aa7256b64cbe9048bd477e9f1798'),(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMjkxNSwianRpIjoiMGIzNzg3NmEyY2U1NDU2Y2E0M2RiZGE2Mjg2YzhlZWMiLCJ1c2VyX2lkIjoxfQ.y9Iz-ZPM3jXtaMXyh8BE5pSOhJfe_Z7EHuH_b3NmQSs','2019-12-03 23:41:55.609748','2019-12-04 23:41:55.000000',1,'0b37876a2ce5456ca43dbda6286c8eec'),(6,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMjkxNywianRpIjoiMzI3NDAyYTliMDkzNGFiMGI1OGIyYzBhZmYwNDZkNmQiLCJ1c2VyX2lkIjoxfQ.7tx5NFn0qzFVW6BKm274zC11YTS_vgBURsJRe7fa_iI','2019-12-03 23:41:57.416885','2019-12-04 23:41:57.000000',1,'327402a9b0934ab0b58b2c0aff046d6d'),(7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMzgxNywianRpIjoiYzk4NzhkN2VkYTc3NGM4OGIxNjMwOGVmMmQzMTZiZTgiLCJ1c2VyX2lkIjoxfQ.Rx2As2MplF35HSmvSrGLFokhJXw8sLUDvcybZudaoow','2019-12-03 23:56:57.924530','2019-12-04 23:56:57.000000',1,'c9878d7eda774c88b16308ef2d316be8'),(8,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNTc0NSwianRpIjoiZTBhMjVhNjk3ZTg3NDlkZGJmZGUyMDQ3NDFkZDI0MzEiLCJ1c2VyX2lkIjoxfQ.eEyywepbAjHuTuLVxuNILM71e1rR4iS4ITbW6Z415tc','2019-12-04 00:29:05.088768','2019-12-05 00:29:05.000000',1,'e0a25a697e8749ddbfde204741dd2431'),(9,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNTkzNywianRpIjoiYTg4ODg4ZjBiNDNjNDQ0Y2I2MDk5NzEwZWIxNzk4MzciLCJ1c2VyX2lkIjoxfQ.fsCHb5IhtxdKkS-2Rvz__1BmvhZWOeMwchNTR81YT3s','2019-12-04 00:32:17.395821','2019-12-05 00:32:17.000000',1,'a88888f0b43c444cb6099710eb179837'),(10,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNjQxOCwianRpIjoiZDI0OGM5ZjE5YTZmNDQ0NmI5YTY5YTRjNTIxYTQ3YTYiLCJ1c2VyX2lkIjoxfQ.X2Q1WrpNBd7pHIbeVrP7EBhajAOpyks1oQl_3mHldnY','2019-12-04 00:40:18.443837','2019-12-05 00:40:18.000000',1,'d248c9f19a6f4446b9a69a4c521a47a6'),(11,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNjU2NywianRpIjoiZjIzZGViMTE3MzFlNDExNmI0YTVlNjAxNjUzYjM3YzEiLCJ1c2VyX2lkIjoxfQ.EyotH2t0sdp_3Wozkk4Q132K7YIh5FlCU4Y73rObT94','2019-12-04 00:42:47.655490','2019-12-05 00:42:47.000000',1,'f23deb11731e4116b4a5e601653b37c1'),(12,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNjc1MiwianRpIjoiNTNiOWI0YTcxODhhNDE3NzhlOWVjZmYzM2YxNmUxOWQiLCJ1c2VyX2lkIjoxfQ.pbnrYIb5H7jReO5GI7paUeqC53J-QcfYMmuKP0R1eMU','2019-12-04 00:45:52.301487','2019-12-05 00:45:52.000000',1,'53b9b4a7188a41778e9ecff33f16e19d'),(13,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1MDkxNiwianRpIjoiOTdlZTFhZWIzZTlmNDQ2NmFkZjkzNzY3Y2JiNzAzNjEiLCJ1c2VyX2lkIjoxfQ.H9gcZa7WOck7Qyn9zSrPRCglJZlANYIamrZAWiH88bg','2019-12-05 16:48:36.788563','2019-12-06 16:48:36.000000',1,'97ee1aeb3e9f4466adf93767cbb70361'),(14,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1MTEzMywianRpIjoiMjQwMDA5ODU3ODA1NDc3OTlhNmZjMmZmMTkyYTczMWYiLCJ1c2VyX2lkIjoxfQ.v0zsvtuPSqwmv81ouHgLtMRPg5DWoVu9bf4KGCgruHM','2019-12-05 16:52:13.003658','2019-12-06 16:52:13.000000',1,'24000985780547799a6fc2ff192a731f'),(15,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1MzM2NSwianRpIjoiMTVkNmRiYjBhYTA0NDMxNGFkNzljOTVkZjA5YjYxMmIiLCJ1c2VyX2lkIjoxfQ.C712xlBxBLRcU9H_PiiNjVGlEJnS-EKTbFUPUk4BjJ4','2019-12-05 17:29:25.186041','2019-12-06 17:29:25.000000',1,'15d6dbb0aa044314ad79c95df09b612b'),(16,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1NTQwMiwianRpIjoiOTI1ZjNmNDEyYmI3NDBiYmJlOTVkMjAxYmU2ZTMyMGMiLCJ1c2VyX2lkIjoxfQ.1xBCv8wGZgE9hKuY_8CIwuLP35z1BF6NGmZ8P6ZhS0c','2019-12-05 18:03:22.826049','2019-12-06 18:03:22.000000',1,'925f3f412bb740bbbe95d201be6e320c'),(17,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTkyNjk1OCwianRpIjoiODU3ZmVkZDM2OWY1NDExMDgxYjYzZTI3MzM0NzIzMWQiLCJ1c2VyX2lkIjoxfQ.Sd0BSdWFkEqzENaTduTZtZmBjVEZ51l4eq3pt2n-CMM','2019-12-08 21:29:18.255852','2019-12-09 21:29:18.000000',1,'857fedd369f5411081b63e273347231d'),(18,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Njc5MTk1OSwianRpIjoiYmExMDhmNWViZWIzNGQwZTllMDc2NDNhNzA1NzJkYzciLCJ1c2VyX2lkIjoxfQ.hlT_w3VMpV8yKC9wWd3FlHQgJFAGAoAmbmxWn74xrrc','2019-12-08 21:45:59.057786','2019-12-19 21:45:59.000000',1,'ba108f5ebeb34d0e9e07643a70572dc7'),(19,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Njk3NzU1OSwianRpIjoiOWQyNjgzYzJmMTI4NGIzYjljNGNmZThjNGY3ZWZmZmMiLCJ1c2VyX2lkIjoxfQ.ATD_R0WddluAaRAE3VxYO85f7oZrjcuiqABLhMaaFqo','2019-12-11 01:19:19.239477','2019-12-22 01:19:19.000000',1,'9d2683c2f1284b3b9c4cfe8c4f7efffc'),(20,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Njk3NzgzNywianRpIjoiOTBjNmVlYzUzMjFkNDMxNGJmMTIwYzZhZTllNjU1NWQiLCJ1c2VyX2lkIjoyfQ.77lzQ9dQEw10FspySCCUoS5IZ6gI33qwBAKiAM6g02Q','2019-12-11 01:23:57.343103','2019-12-22 01:23:57.000000',2,'90c6eec5321d4314bf120c6ae9e6555d'),(21,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyMzE0MywianRpIjoiZGQxNDQ5ZDY4MDE5NDdlZjliMjU4ZDhhMTYxM2Y0MjUiLCJ1c2VyX2lkIjoxfQ.6AuL5-rReEAcaF8aWa3FKpZtC_MOQBdwyItbIly4D7w','2019-12-12 17:45:43.792424','2019-12-23 17:45:43.000000',1,'dd1449d6801947ef9b258d8a1613f425'),(22,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyMzQ5NiwianRpIjoiOGJmZmRmM2QzNDU3NDBkYzk3YmQ5N2Q5ZDM2YThmOTciLCJ1c2VyX2lkIjoxfQ.8M0MGgn2jMUCijhcfL5v5Cx9uDLWGlwN34QfkRBHiZs','2019-12-12 17:51:36.344711','2019-12-23 17:51:36.000000',1,'8bffdf3d345740dc97bd97d9d36a8f97'),(23,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyMzY2MSwianRpIjoiNTNhZWEyZmI2ZWRhNDg0NTg5MGY1ZTJmOTZiMzVlMjQiLCJ1c2VyX2lkIjoxfQ._T_Y6frOtznSVKTlqz_XJtHXd9eQyC6KjSM1v-fG-kY','2019-12-12 17:54:21.407479','2019-12-23 17:54:21.000000',1,'53aea2fb6eda4845890f5e2f96b35e24'),(24,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyNDcyOSwianRpIjoiYTAzNmQxMjFkNjc0NDYxZWIyOWRmOGRkYjkyMjJmMmIiLCJ1c2VyX2lkIjoxfQ.2ti7b693GP0yt5vK3AnE0n6in4D6ciDkXAMKGUAxJ88','2019-12-12 18:12:09.514290','2019-12-23 18:12:09.000000',1,'a036d121d674461eb29df8ddb9222f2b'),(25,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEzMTU5OSwianRpIjoiMTQyNjRmYWQzZGNlNDY3NzkyOWFlOTExYjQ4YjVhYjAiLCJ1c2VyX2lkIjoxfQ.-0EcVyBLuWqLhXPV78nODz1Yo6nZVN8dzsGhk_F-4G0','2019-12-12 20:06:39.171049','2019-12-23 20:06:39.000000',1,'14264fad3dce4677929ae911b48b5ab0'),(26,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzIwODE0MiwianRpIjoiYjMwYzQ5M2MxMDNhNDgyNDk5OWRhNWIzYjQ0YzA2NWIiLCJ1c2VyX2lkIjoxfQ.93YSoD9nJOJEeX0f-JdrLDLDGqWEK1qdQKiGVN3Nh-8','2019-12-13 17:22:22.142934','2019-12-24 17:22:22.000000',1,'b30c493c103a4824999da5b3b44c065b'),(27,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxMjkyNywianRpIjoiYzJiNjU2NzQwN2VkNDFhYjkxMDE2ZjQyZDBiMGY1YzIiLCJ1c2VyX2lkIjoxfQ.YnMMiQAd7ETGOTpij3KbOhjRvvXLgDwde7svpDd4ph8','2019-12-14 22:28:47.954549','2019-12-25 22:28:47.000000',1,'c2b6567407ed41ab91016f42d0b0f5c2'),(28,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxMjk1NywianRpIjoiMjU2MjhiZGI4MWI2NGU5OTkxMjAxOTgwNWFjODMyYjciLCJ1c2VyX2lkIjoxfQ.X292Cd9sdne47LyFQ5lYt-vk9EBHS3Xv189nCM4pjp4','2019-12-14 22:29:17.749886','2019-12-25 22:29:17.000000',1,'25628bdb81b64e99912019805ac832b7'),(29,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxNTc0NCwianRpIjoiZTk2MDQ4ZmQ1Y2VkNGMyNmE3Y2NlNTcwOTczNDBiMDciLCJ1c2VyX2lkIjoxfQ.JpzpoYfb3bV_h_VEgoa0AEBBmEkNaZ_BMjWMljMfL9E','2019-12-14 23:15:44.476496','2019-12-25 23:15:44.000000',1,'e96048fd5ced4c26a7cce57097340b07'),(30,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxNTg0NiwianRpIjoiYWRlOWRmN2ZiZjFjNDdmODk5ZTBiNDhjNGFlN2UxMjciLCJ1c2VyX2lkIjoxfQ.Say-0fmeBye8G37f-yP1_vaF_nH9aoJ8x5e6Ex_34Vk','2019-12-14 23:17:26.982034','2019-12-25 23:17:26.000000',1,'ade9df7fbf1c47f899e0b48c4ae7e127'),(31,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMyNDU1MiwianRpIjoiODkyZjYyYmJmYzRkNDNlNzk4YWNlZjhjZGE3NjM1MmQiLCJ1c2VyX2lkIjoxfQ.68J8JifgN731NTC3_RYnMW1IlmuRKLYtbAArnpjI_-g','2019-12-15 01:42:32.225822','2019-12-26 01:42:32.000000',1,'892f62bbfc4d43e798acef8cda76352d'),(32,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMyNDcwNSwianRpIjoiYjljMmM2MTc5MjFjNGQ1MjhjNTIzYTVlNDNkMzllZDgiLCJ1c2VyX2lkIjoxfQ.G6UfWfL0kGhlVlP-yavChGjaD_V75ImvZ_29DO84RnA','2019-12-15 01:45:05.858287','2019-12-26 01:45:05.000000',1,'b9c2c617921c4d528c523a5e43d39ed8'),(33,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2MzM5MywianRpIjoiZWJkZmY0YmNhNDc3NDc2YWFiYTU3ODc0NmJiMmQ0NDEiLCJ1c2VyX2lkIjoxfQ.qB8TUUrT7i82U7cyArYw9i0JMMLXsZ7SMjONbETFOY8','2019-12-16 16:16:33.335163','2019-12-27 16:16:33.000000',1,'ebdff4bca477476aaba578746bb2d441'),(34,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2NTYxMCwianRpIjoiODBhNGFhNjkwYzQwNGE2Y2JjOGFhODNjM2I4YmFmYzgiLCJ1c2VyX2lkIjoxfQ.f8thckg85fYcS4rZSxejv3KuQnycLhLq_z64sOuA8L8','2019-12-16 16:53:30.684216','2019-12-27 16:53:30.000000',1,'80a4aa690c404a6cbc8aa83c3b8bafc8'),(35,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2NjY2MCwianRpIjoiOGRjMTJhMjUyOTFkNDU3N2FlMDQ3OTg2ZTYxMjRkMzAiLCJ1c2VyX2lkIjoxfQ.nyIffVFD78-7Xgpfby4c-cKYgtgtAWBXuYjKS2JAzjs','2019-12-16 17:11:00.325933','2019-12-27 17:11:00.000000',1,'8dc12a25291d4577ae047986e6124d30'),(36,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2NjgwMCwianRpIjoiZDQ1ZWU0NmU4NDMzNGI5YzhhOWZjYjUyMDFlYzM3Y2QiLCJ1c2VyX2lkIjoxfQ.hb3UbGlZ7rsRRirl48iKtBZIdxBBR3I9YZMNQROUy_s','2019-12-16 17:13:20.660060','2019-12-27 17:13:20.000000',1,'d45ee46e84334b9c8a9fcb5201ec37cd'),(37,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2ODE4OCwianRpIjoiNjM3ODk2OTJmZDNjNDdjOWFmYzFmZGI4YjE2ZThkMjUiLCJ1c2VyX2lkIjoxfQ.dtOE_pmuKFaTYZj23z_OmOqFM2kQykrShhaade9QYX4','2019-12-16 17:36:28.614364','2019-12-27 17:36:28.000000',1,'63789692fd3c47c9afc1fdb8b16e8d25'),(38,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzU5MjQyMSwianRpIjoiMWU1ZDFlNzlhYjQ3NGE3NWIyYTlmYTI3OTY1OTlhN2QiLCJ1c2VyX2lkIjoxfQ.s1_hwuji8f-q5K-ALMFvsFCVbmZgYjta5e8sVXyfm4w','2019-12-18 04:07:01.798841','2019-12-29 04:07:01.000000',1,'1e5d1e79ab474a75b2a9fa2796599a7d'),(39,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzU5MjYzNiwianRpIjoiMTdkNjg1NWFkMzU3NDY5MTgyZTA4OTgwZGU3N2ZjNDMiLCJ1c2VyX2lkIjoxfQ.98PIDeePgRG3zZ2d7ecMDJ82lgDrX0zSiqMMj6PqCoA','2019-12-18 04:10:36.137760','2019-12-29 04:10:36.000000',1,'17d6855ad357469182e08980de77fc43'),(40,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzU5MzA2MCwianRpIjoiZDAzMjI5MzU0YWRkNGE4YzliNWExZDU1NWE0N2M2ZmMiLCJ1c2VyX2lkIjoxfQ.BmGwciNWwk_LDSUfPNV0SA9p5Oh_C6guGJuKU6WStAE','2019-12-18 04:17:40.281613','2019-12-29 04:17:40.000000',1,'d03229354add4a8c9b5a1d555a47c6fc'),(41,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjc4MiwianRpIjoiMGM5OGFlZTBkNjRhNDE2MjlkOWFjY2U3NmRlNjFlMDYiLCJ1c2VyX2lkIjozfQ.pSa61_I23MlR0hmKWEX6X9ZhzfEArXpHybu5UrCzK58','2019-12-18 06:59:42.980736','2019-12-29 06:59:42.000000',3,'0c98aee0d64a41629d9acce76de61e06'),(42,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjgyNiwianRpIjoiNmY0MzdmYmQ1YzMzNDA3NjlmY2I4ZTEzZjQyYjEwMzMiLCJ1c2VyX2lkIjoxfQ.R3rg3snxrbuM-oQ9Qp7-v0iDQupXyti1XqAfKKScr3I','2019-12-18 07:00:26.354168','2019-12-29 07:00:26.000000',1,'6f437fbd5c3340769fcb8e13f42b1033'),(43,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjg0NSwianRpIjoiZjIzYmI4OWIxOTNmNDAwMWFkNDJiNDlhOTA1NjVhNWUiLCJ1c2VyX2lkIjoxfQ.JweHkEaFpLbiXeVsTNn4XgJeUb3xHwL1x9uwwm7WxBg','2019-12-18 07:00:45.630350','2019-12-29 07:00:45.000000',1,'f23bb89b193f4001ad42b49a90565a5e'),(44,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjg2MywianRpIjoiNmFmNDM3MjNiZjVkNDM2OGI2MTBhZWQ2NzE3Zjc1OTUiLCJ1c2VyX2lkIjoxfQ.vA1Q4-r5-hkvXfK0_EoKmRExVLXO0uSSUSZi_za35yg','2019-12-18 07:01:03.400875','2019-12-29 07:01:03.000000',1,'6af43723bf5d4368b610aed6717f7595'),(45,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzA3MCwianRpIjoiOGQxZGMwMTIyZDJkNGJjODkxYWE3MjEzMjM3NGZjYzEiLCJ1c2VyX2lkIjoxfQ.w7AFhlkb54SRe7FHuE60zFqzGazfjU2sIC32g-f40SQ','2019-12-18 07:04:30.531967','2019-12-29 07:04:30.000000',1,'8d1dc0122d2d4bc891aa72132374fcc1'),(46,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzIyMSwianRpIjoiYjA1YTUwZWE3NzY5NGIzOThiMmFjZjRlZWZlYmM0MjciLCJ1c2VyX2lkIjoxfQ.8n5H5vXWH74JbsyB-7ZQmWVBja1Uo3jeXK6dB7LI_XM','2019-12-18 07:07:01.826291','2019-12-29 07:07:01.000000',1,'b05a50ea77694b398b2acf4eefebc427'),(47,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzMyNywianRpIjoiZDNiYTI1Yjg5YWU2NDY5NDg5MjIyMWQwMzgyMTlmZmIiLCJ1c2VyX2lkIjoxfQ.yFxMNBNRZopxEjX32MTMLHtrFWbDqIUEFJ58vprCye0','2019-12-18 07:08:47.946965','2019-12-29 07:08:47.000000',1,'d3ba25b89ae64694892221d038219ffb'),(48,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzY5NywianRpIjoiMTNlOThjYzRlN2FiNDBhMWExYWZmNzljYTUxNWU5ZmEiLCJ1c2VyX2lkIjoxfQ.x9kdKRadQg12Vwtxm7v1sNDEZ9JEnztn7zjBNekO7oE','2019-12-18 07:14:57.186344','2019-12-29 07:14:57.000000',1,'13e98cc4e7ab40a1a1aff79ca515e9fa'),(49,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NDc1MiwianRpIjoiN2MwZmQ5NTNiOGY3NDEwYzgxN2U3MmI0ZGJmYjE2MjUiLCJ1c2VyX2lkIjoxfQ.ytGs_vThvDa5eMiCPL8G5bwq9L9LuXfsowCRA-XX8Lg','2019-12-18 18:39:12.226680','2019-12-29 18:39:12.000000',1,'7c0fd953b8f7410c817e72b4dbfb1625'),(50,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NTAwOCwianRpIjoiNmI5OTdjMmIxNDFkNDViM2I5ODg5OGJkZTNjMDAyZjAiLCJ1c2VyX2lkIjoxfQ.ZcowE-fkE_5Y0FypLVpBewJyXiuf_nBsgoGP5Z5qK_A','2019-12-18 18:43:28.551414','2019-12-29 18:43:28.000000',1,'6b997c2b141d45b3b98898bde3c002f0'),(51,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NTQxMywianRpIjoiODY5ZjJlYmMwZTk0NDNiNDliN2JlYTI4NGZkMTNjYjIiLCJ1c2VyX2lkIjoxfQ.5edjj1VC3Vf7wuAPBZjFMw4cMHRRRi0TdMIi8iY-DRA','2019-12-18 18:50:13.351902','2019-12-29 18:50:13.000000',1,'869f2ebc0e9443b49b7bea284fd13cb2'),(52,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NTY0NiwianRpIjoiYzJhYWFhZjdmZWY4NGE1YmEwODQzMGNhZTFkMDkyOWIiLCJ1c2VyX2lkIjoxfQ.GdhFRvjAgF1PvyxPhaXNIz4omnpbtEDR7_oGq91bKqI','2019-12-18 18:54:06.135425','2019-12-29 18:54:06.000000',1,'c2aaaaf7fef84a5ba08430cae1d0929b'),(53,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NjQ5OCwianRpIjoiZmJkNzRkOTc0MzljNGJhNjg1YzI0NjY5ZGM0YjU4NjEiLCJ1c2VyX2lkIjoxfQ.5xiqECVFsSn-DxTQUIPjDCfIAm2damH4UNRprN9FOow','2019-12-18 19:08:18.452077','2019-12-29 19:08:18.000000',1,'fbd74d97439c4ba685c24669dc4b5861'),(54,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY1MTQ4NCwianRpIjoiZmJkMDFjMTRjNjAzNDYwY2I1ZWQ5MjQwYjM4YWQ5MWMiLCJ1c2VyX2lkIjoxfQ.wdF2GMOtbxqxt6ZAN7iPlxqM9p4Kb2uGnEHsGJW3ap8','2019-12-18 20:31:24.733955','2019-12-29 20:31:24.000000',1,'fbd01c14c603460cb5ed9240b38ad91c'),(55,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY1MTQ5OSwianRpIjoiMjA5YWExYWUxNDg3NGFjZDhjYTg4NmQ3OWY5M2M1MzQiLCJ1c2VyX2lkIjoxfQ.-YdmRJubo_-TkasJrn3IFvZMieR72LVpiT4OOqPG-h0','2019-12-18 20:31:39.267890','2019-12-29 20:31:39.000000',1,'209aa1ae14874acd8ca886d79f93c534'),(56,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzkzMzQyMiwianRpIjoiZmEyMDhhZDU2NDg4NDk2ZGE3ODE4ZTgyZmRjZDM5NTMiLCJ1c2VyX2lkIjo0fQ.gD0Cvxn3e3HF0oaqAPfXduMfrhMUD8pSKmIShxSRlIw','2019-12-22 02:50:22.363147','2020-01-02 02:50:22.000000',4,'fa208ad56488496da7818e82fdcd3953'),(57,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzkzNDAwMSwianRpIjoiN2E4OWE1ZTdlODliNGJhNGI1MzU3MzkxOTM3ZTI0ZGUiLCJ1c2VyX2lkIjoxfQ.2u1RUTPFapJryLdB5MI-oaDBwK0akimYjklHfiJUkGg','2019-12-22 03:00:01.461056','2020-01-02 03:00:01.000000',1,'7a89a5e7e89b4ba4b5357391937e24de'),(58,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Nzk5MjUxOCwianRpIjoiZDBlNDcwZjBlNDVmNGYyM2IyMTZjMDczMjNhN2NmMDQiLCJ1c2VyX2lkIjoxfQ.DcMHEVGi2i-xwHMi3XkEPiKzWnXozjvaZPNY2PZZEak','2019-12-22 19:15:18.650539','2020-01-02 19:15:18.000000',1,'d0e470f0e45f4f23b216c07323a7cf04'),(59,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM0OSwianRpIjoiY2RiNzk5MWE0NTI1NGRkMGI3MzRmZmEwODUyNzIwNWQiLCJ1c2VyX2lkIjoxfQ.FTGz7ptzY9lDWGI-Ty7EkZAqNv_e_ymuiPOgyAHZrLI','2019-12-23 01:35:49.100042','2020-01-03 01:35:49.000000',1,'cdb7991a45254dd0b734ffa08527205d'),(60,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1MywianRpIjoiNGZjMzI4YjE0ZDdjNDg1NGI4MjBlYTQ1NTZhZjczMjUiLCJ1c2VyX2lkIjoxfQ.E1U5gqorw_OD2q7cI8fh_hOipzJ7fiNswffNjCD8eMw','2019-12-23 01:35:53.370911','2020-01-03 01:35:53.000000',1,'4fc328b14d7c4854b820ea4556af7325'),(61,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1NSwianRpIjoiODI0N2MzNjgzNWRmNDM1Y2FhMmY5OGY3ZTE2MzhlNTQiLCJ1c2VyX2lkIjoxfQ.EPw2tkbp3D-9k5ibE0xqhRIqSEbBV1g-LrOtl5iG0dU','2019-12-23 01:35:55.215907','2020-01-03 01:35:55.000000',1,'8247c36835df435caa2f98f7e1638e54'),(62,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1NiwianRpIjoiN2M5ZGE0YjE2N2U4NDI1MTlkOWU5NzI3YTZkMTgxNTQiLCJ1c2VyX2lkIjoxfQ.-ILQyHY636mKO6jf29RBiP4diRjddug9sxYPIujDvPA','2019-12-23 01:35:56.682563','2020-01-03 01:35:56.000000',1,'7c9da4b167e842519d9e9727a6d18154'),(63,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1OCwianRpIjoiNWM0MmVmYzVkMTA2NDEwMWJhYzI5Mzc3OGNiZWY2MzciLCJ1c2VyX2lkIjoxfQ.ebrMJDR2xuzf3Qymdk5tGGgsGxCQ77Pf-xqpjjT_S9A','2019-12-23 01:35:58.278855','2020-01-03 01:35:58.000000',1,'5c42efc5d1064101bac293778cbef637'),(64,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM2MCwianRpIjoiOWM4OTFiMzRlMWYwNDVhMmJjYWI2NmEzMTBmOTJjNzIiLCJ1c2VyX2lkIjoxfQ.KPlrFTsIEZrzXII969ndD_UTYPUC2tTixOxjrNjH0oU','2019-12-23 01:36:00.778797','2020-01-03 01:36:00.000000',1,'9c891b34e1f045a2bcab66a310f92c72'),(65,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM2MiwianRpIjoiNGI5ZDUwZjNkYjc0NGNjMThkNjBjMzFlOTVjMGU1M2UiLCJ1c2VyX2lkIjoxfQ.iksfcBvN4E_EyQSVO2ng2Zzx5JtVVRfLBkklYAmCr7w','2019-12-23 01:36:02.358375','2020-01-03 01:36:02.000000',1,'4b9d50f3db744cc18d60c31e95c0e53e'),(66,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM2NCwianRpIjoiOTQxYmMzNmI4ZGZhNGM4Y2JiN2JlYTEzN2M1MzVjM2UiLCJ1c2VyX2lkIjoxfQ.kH13uQCZbPMMmy0odS73vGlSFWaSZmw1MBozlbaYLhA','2019-12-23 01:36:04.172010','2020-01-03 01:36:04.000000',1,'941bc36b8dfa4c8cbb7bea137c535c3e'),(67,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM3NiwianRpIjoiZWY0YzgxOGQ0NmE2NGIzNjlkM2MxZjgzYzZlNTUwMTMiLCJ1c2VyX2lkIjoxfQ.HEWpxy937mHBC5RvJWrDJZm-s9BJK1hqdIagumcvHp4','2019-12-23 01:36:16.774985','2020-01-03 01:36:16.000000',1,'ef4c818d46a64b369d3c1f83c6e55013'),(68,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4MSwianRpIjoiZmY5NDljMTEzZGQxNGE4MjgyNTY0ZDMyOWE4OTkyMDUiLCJ1c2VyX2lkIjoxfQ.Fo9GYt28Y8IW83KvX33RYbOAZsH01lNqcemSIn2AnmY','2019-12-23 01:36:21.179712','2020-01-03 01:36:21.000000',1,'ff949c113dd14a8282564d329a899205'),(69,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4MiwianRpIjoiMjY3ZWE4M2ExMjQ3NDJlNmIzYmRmYmYyYjEzOTk5ZTAiLCJ1c2VyX2lkIjoxfQ.wkuxWD0WgzTUMxumL_SynGxHOljbKs2EZRpK63mGZxI','2019-12-23 01:36:22.955854','2020-01-03 01:36:22.000000',1,'267ea83a124742e6b3bdfbf2b13999e0'),(70,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4NSwianRpIjoiODNjZmU4Y2E3NWQ4NDEwZTk2NGYyMGYwYzM0ZTczOGEiLCJ1c2VyX2lkIjoxfQ.DMeJKewPaUCgPFbwbsrJ8xA42MMen-GSs1bCUAi-vls','2019-12-23 01:36:25.026227','2020-01-03 01:36:25.000000',1,'83cfe8ca75d8410e964f20f0c34e738a'),(71,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4NiwianRpIjoiN2M0OWUwZGYzNmViNDk3ODg0Y2ZkMDY3OWI0ZDE1ZDEiLCJ1c2VyX2lkIjoxfQ.arMIJ58_VeqFw8PLmHKJ-mvy50jwunezmGYf3x3uL6Y','2019-12-23 01:36:26.873075','2020-01-03 01:36:26.000000',1,'7c49e0df36eb497884cfd0679b4d15d1'),(72,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTQ2MiwianRpIjoiYTkwNDlkYmJjODZmNDJhOWE2N2M0ZDk2Y2U5MzViNmYiLCJ1c2VyX2lkIjoxfQ.GhJlSapfXowLL3NXue76kocvV6AbSXUGORTK7qybUEs','2019-12-23 01:37:42.666697','2020-01-03 01:37:42.000000',1,'a9049dbbc86f42a9a67c4d96ce935b6f'),(73,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3OTYxMTkwOSwianRpIjoiYjA2MDMxYmM1ZjY1NDIyOWJmYmFlODcwMzVmYmQ0YzkiLCJ1c2VyX2lkIjoxfQ.wLqNw1ruo2LOdqL86ypWjE6TbXireouc5PUy-ACv6c4','2020-01-10 13:05:09.913842','2020-01-21 13:05:09.000000',1,'b06031bc5f654229bfbae87035fbd4c9'),(74,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3OTYxNjM3NCwianRpIjoiMGJiZTgyMWM1Y2M1NDMzNmFiYWI0NjUyYzU1ODUwYjAiLCJ1c2VyX2lkIjoxfQ.ASubsPhCMP44dZd_sDhlkV4fChrmORcT1jq6Ep5NDOs','2020-01-10 14:19:34.219177','2020-01-21 14:19:34.000000',1,'0bbe821c5cc54336abab4652c55850b0'),(75,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3OTY0NDg1NywianRpIjoiNDRhMjkwYjAwNGFiNGMzOGE1MTQyNzA5MGRkYzZmODgiLCJ1c2VyX2lkIjo0fQ.o-CMthY2G7ULxd8ME-yaQ9CQFsn1nRIfkmlx73KJHUA','2020-01-10 22:14:17.945592','2020-01-21 22:14:17.000000',4,'44a290b004ab4c38a51427090ddc6f88'),(76,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDA3Nzk0NSwianRpIjoiMDU0YzRiY2JkMjlmNDM1ZTlhOTUxMDAwYjQzZThiNzEiLCJ1c2VyX2lkIjoxfQ.nWCG-z5LpOxrObgos6NdhGKggnMs0HtB4XdaxFoPVuM','2020-01-15 22:32:25.750454','2020-01-26 22:32:25.000000',1,'054c4bcbd29f435e9a951000b43e8b71'),(77,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDEzNDA1NywianRpIjoiZGIyYzAwMDdkNWI3NDE3MjlmODkxY2M1NjQ2NDQ5ODQiLCJ1c2VyX2lkIjoxfQ.sWwx4GIA21SgaVTcG6n_M42zwOOwuRzzBzaHorjMM9o','2020-01-16 14:07:37.085042','2020-01-27 14:07:37.000000',1,'db2c0007d5b741729f891cc564644984'),(78,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjAxMSwianRpIjoiM2YzZWY5YTc3M2E0NGQ4ZTg4NzAwMjc1ZjQ3NTZlNTciLCJ1c2VyX2lkIjoxfQ.VJRAjTMrd8rIjoI_cXeyOhv3Jhp3uR_IZYZ60K4D4nM','2020-01-17 17:20:11.588727','2020-01-28 17:20:11.000000',1,'3f3ef9a773a44d8e88700275f4756e57'),(79,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjQ3MywianRpIjoiMGRkOGM0ZjBkN2ZlNDM2MDhiNDQ4YWNhZjExYTkyYTEiLCJ1c2VyX2lkIjo0fQ.fwf9GODBDDIQZUwuTStELg35HpcMrcCa0vyZiEkCxKQ','2020-01-17 17:27:53.055477','2020-01-28 17:27:53.000000',4,'0dd8c4f0d7fe43608b448acaf11a92a1'),(80,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjcxMiwianRpIjoiMDA1Y2YyYTczOTNmNDU0NTkzMzBiNjE4YTY5NjA0ZjEiLCJ1c2VyX2lkIjo0fQ.39JGvSYQUybhNCGACGYBMNY3UnXc-BKNSgwMpiiDig4','2020-01-17 17:31:52.576498','2020-01-28 17:31:52.000000',4,'005cf2a7393f45459330b618a69604f1'),(81,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjc1MSwianRpIjoiMDhhMDhlNzk5OGY0NDQ3ZWExNDZmOWNkMDAxMjBhYjEiLCJ1c2VyX2lkIjoxfQ.fcS3wkh2ZtVhGWocIzxCrseTse8yIhHz0yV8fU21JZM','2020-01-17 17:32:31.941549','2020-01-28 17:32:31.000000',1,'08a08e7998f4447ea146f9cd00120ab1'),(82,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMzIzNywianRpIjoiMTQ5Njg1OGZmNWUyNDY3NDliZDZkYjNjMTMzZWFlMzkiLCJ1c2VyX2lkIjoxfQ.3ZNkb8pyGXuFsPh5l7gN03w0oaa4uztysEPiHaP23Ps','2020-01-17 17:40:37.898587','2020-01-28 17:40:37.000000',1,'1496858ff5e246749bd6db3c133eae39'),(83,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzNDIyNSwianRpIjoiZTRkYmMyZDhmM2E5NDc4NWI3NjRhMGI4NWE2OWU0MWYiLCJ1c2VyX2lkIjo0fQ.Z5qPuLAq9tV337FoP6D1a6EV3b6xNzy2Q1z8WMrmtc8','2020-01-17 17:57:05.109580','2020-01-28 17:57:05.000000',4,'e4dbc2d8f3a94785b764a0b85a69e41f'),(84,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDM5MzQ0NywianRpIjoiYTc4NjJhMjMwOTFmNDgwYmEzMTYxZTkxYzAzMDQ0Y2YiLCJ1c2VyX2lkIjo0fQ.3zTlLuHb6H9U7TYkvPeHcFB8Tldd4BKLLeljuKA3rl8','2020-01-19 14:10:47.790502','2020-01-30 14:10:47.000000',4,'a7862a23091f480ba3161e91c03044cf'),(85,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDM5MzQ2NywianRpIjoiODFkYTFmNzE5NDU2NDhiZjg1ODhhYmNmYjEyOGFhNzAiLCJ1c2VyX2lkIjoxfQ.d27YQzu0YmnakfQIDefTC_DBJ-Nttm8uapavllzXF-8','2020-01-19 14:11:07.264764','2020-01-30 14:11:07.000000',1,'81da1f71945648bf8588abcfb128aa70');
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

-- Dump completed on 2020-01-19 15:21:22
