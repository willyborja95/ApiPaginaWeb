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
  KEY `account_emailaddress_user_id_2c513194_fk_login_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add site',4,'add_site'),(14,'Can change site',4,'change_site'),(15,'Can delete site',4,'delete_site'),(16,'Can view site',4,'view_site'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add email address',8,'add_emailaddress'),(30,'Can change email address',8,'change_emailaddress'),(31,'Can delete email address',8,'delete_emailaddress'),(32,'Can view email address',8,'view_emailaddress'),(33,'Can add email confirmation',9,'add_emailconfirmation'),(34,'Can change email confirmation',9,'change_emailconfirmation'),(35,'Can delete email confirmation',9,'delete_emailconfirmation'),(36,'Can view email confirmation',9,'view_emailconfirmation'),(37,'Can add social account',10,'add_socialaccount'),(38,'Can change social account',10,'change_socialaccount'),(39,'Can delete social account',10,'delete_socialaccount'),(40,'Can view social account',10,'view_socialaccount'),(41,'Can add social application',11,'add_socialapp'),(42,'Can change social application',11,'change_socialapp'),(43,'Can delete social application',11,'delete_socialapp'),(44,'Can view social application',11,'view_socialapp'),(45,'Can add social application token',12,'add_socialtoken'),(46,'Can change social application token',12,'change_socialtoken'),(47,'Can delete social application token',12,'delete_socialtoken'),(48,'Can view social application token',12,'view_socialtoken'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add category',14,'add_category'),(54,'Can change category',14,'change_category'),(55,'Can delete category',14,'delete_category'),(56,'Can view category',14,'view_category'),(57,'Can add content',15,'add_content'),(58,'Can change content',15,'change_content'),(59,'Can delete content',15,'delete_content'),(60,'Can view content',15,'view_content'),(61,'Can add content_ media',16,'add_content_media'),(62,'Can change content_ media',16,'change_content_media'),(63,'Can delete content_ media',16,'delete_content_media'),(64,'Can view content_ media',16,'view_content_media'),(65,'Can add event',17,'add_event'),(66,'Can change event',17,'change_event'),(67,'Can delete event',17,'delete_event'),(68,'Can view event',17,'view_event'),(69,'Can add group',18,'add_group'),(70,'Can change group',18,'change_group'),(71,'Can delete group',18,'delete_group'),(72,'Can view group',18,'view_group'),(73,'Can add group_ contact',19,'add_group_contact'),(74,'Can change group_ contact',19,'change_group_contact'),(75,'Can delete group_ contact',19,'delete_group_contact'),(76,'Can view group_ contact',19,'view_group_contact'),(77,'Can add group_ event',20,'add_group_event'),(78,'Can change group_ event',20,'change_group_event'),(79,'Can delete group_ event',20,'delete_group_event'),(80,'Can view group_ event',20,'view_group_event'),(81,'Can add item_ category',21,'add_item_category'),(82,'Can change item_ category',21,'change_item_category'),(83,'Can delete item_ category',21,'delete_item_category'),(84,'Can view item_ category',21,'view_item_category'),(85,'Can add menu',22,'add_menu'),(86,'Can change menu',22,'change_menu'),(87,'Can delete menu',22,'delete_menu'),(88,'Can view menu',22,'view_menu'),(89,'Can add person',23,'add_person'),(90,'Can change person',23,'change_person'),(91,'Can delete person',23,'delete_person'),(92,'Can view person',23,'view_person'),(93,'Can add person_ contact',24,'add_person_contact'),(94,'Can change person_ contact',24,'change_person_contact'),(95,'Can delete person_ contact',24,'delete_person_contact'),(96,'Can view person_ contact',24,'view_person_contact'),(97,'Can add person_ media',25,'add_person_media'),(98,'Can change person_ media',25,'change_person_media'),(99,'Can delete person_ media',25,'delete_person_media'),(100,'Can view person_ media',25,'view_person_media'),(101,'Can add person_ role',26,'add_person_role'),(102,'Can change person_ role',26,'change_person_role'),(103,'Can delete person_ role',26,'delete_person_role'),(104,'Can view person_ role',26,'view_person_role'),(105,'Can add person_ section',27,'add_person_section'),(106,'Can change person_ section',27,'change_person_section'),(107,'Can delete person_ section',27,'delete_person_section'),(108,'Can view person_ section',27,'view_person_section'),(109,'Can add requirement',28,'add_requirement'),(110,'Can change requirement',28,'change_requirement'),(111,'Can delete requirement',28,'delete_requirement'),(112,'Can view requirement',28,'view_requirement'),(113,'Can add role',29,'add_role'),(114,'Can change role',29,'change_role'),(115,'Can delete role',29,'delete_role'),(116,'Can view role',29,'view_role'),(117,'Can add section',30,'add_section'),(118,'Can change section',30,'change_section'),(119,'Can delete section',30,'delete_section'),(120,'Can view section',30,'view_section'),(121,'Can add subject_ matter',31,'add_subject_matter'),(122,'Can change subject_ matter',31,'change_subject_matter'),(123,'Can delete subject_ matter',31,'delete_subject_matter'),(124,'Can view subject_ matter',31,'view_subject_matter');
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
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`)
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
  KEY `django_admin_log_user_id_c564eba6_fk_login_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(7,'authtoken','token'),(5,'contenttypes','contenttype'),(14,'login','category'),(15,'login','content'),(16,'login','content_media'),(17,'login','event'),(18,'login','group'),(19,'login','group_contact'),(20,'login','group_event'),(21,'login','item_category'),(22,'login','menu'),(23,'login','person'),(24,'login','person_contact'),(25,'login','person_media'),(26,'login','person_role'),(27,'login','person_section'),(28,'login','requirement'),(29,'login','role'),(30,'login','section'),(31,'login','subject_matter'),(13,'login','user'),(6,'sessions','session'),(4,'sites','site'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-22 23:04:56.799594'),(2,'contenttypes','0002_remove_content_type_name','2019-11-22 23:04:57.074982'),(3,'auth','0001_initial','2019-11-22 23:04:58.004898'),(4,'auth','0002_alter_permission_name_max_length','2019-11-22 23:04:58.034431'),(5,'auth','0003_alter_user_email_max_length','2019-11-22 23:04:58.048518'),(6,'auth','0004_alter_user_username_opts','2019-11-22 23:04:58.059286'),(7,'auth','0005_alter_user_last_login_null','2019-11-22 23:04:58.067681'),(8,'auth','0006_require_contenttypes_0002','2019-11-22 23:04:58.073215'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-22 23:04:58.087061'),(10,'auth','0008_alter_user_username_max_length','2019-11-22 23:04:58.096777'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-22 23:04:58.106491'),(12,'login','0001_initial','2019-11-22 23:05:07.134493'),(13,'account','0001_initial','2019-11-22 23:05:07.701226'),(14,'account','0002_email_max_length','2019-11-22 23:05:07.732536'),(15,'admin','0001_initial','2019-11-22 23:05:08.191306'),(16,'admin','0002_logentry_remove_auto_add','2019-11-22 23:05:08.210310'),(17,'admin','0003_logentry_add_action_flag_choices','2019-11-22 23:05:08.222025'),(18,'authtoken','0001_initial','2019-11-22 23:05:08.481448'),(19,'authtoken','0002_auto_20160226_1747','2019-11-22 23:05:08.715283'),(20,'sessions','0001_initial','2019-11-22 23:05:08.851508'),(21,'sites','0001_initial','2019-11-22 23:05:08.930763'),(22,'sites','0002_alter_domain_unique','2019-11-22 23:05:08.997898'),(23,'socialaccount','0001_initial','2019-11-22 23:05:10.409440'),(24,'socialaccount','0002_token_max_lengths','2019-11-22 23:05:10.484723'),(25,'socialaccount','0003_extra_data_default_dict','2019-11-22 23:05:10.504685');
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
-- Table structure for table `login_category`
--

DROP TABLE IF EXISTS `login_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_category`
--

LOCK TABLES `login_category` WRITE;
/*!40000 ALTER TABLE `login_category` DISABLE KEYS */;
INSERT INTO `login_category` VALUES (1,'Titulación',1),(2,'Tipo de contenido',1),(3,'Periodo Académico',1),(4,'university_career',0);
/*!40000 ALTER TABLE `login_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_content`
--

DROP TABLE IF EXISTS `login_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `academic_period_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`),
  KEY `login_content_academic_period_id_f801ad8d_fk_login_ite` (`academic_period_id`),
  KEY `login_content_contact_type_id_220d9f30_fk_login_ite` (`contact_type_id`),
  KEY `login_content_university_career_id_26e27cef_fk_login_ite` (`university_career_id`),
  CONSTRAINT `login_content_academic_period_id_f801ad8d_fk_login_ite` FOREIGN KEY (`academic_period_id`) REFERENCES `login_item_category` (`item_category_id`),
  CONSTRAINT `login_content_contact_type_id_220d9f30_fk_login_ite` FOREIGN KEY (`contact_type_id`) REFERENCES `login_item_category` (`item_category_id`),
  CONSTRAINT `login_content_university_career_id_26e27cef_fk_login_ite` FOREIGN KEY (`university_career_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_content`
--

LOCK TABLES `login_content` WRITE;
/*!40000 ALTER TABLE `login_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_content_media`
--

DROP TABLE IF EXISTS `login_content_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_content_media` (
  `content_media_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(500) NOT NULL,
  `content_id` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  PRIMARY KEY (`content_media_id`),
  KEY `login_content_media_content_id_cd075dec_fk_login_con` (`content_id`),
  KEY `login_content_media_item_category_id_32bd6104_fk_login_ite` (`item_category_id`),
  CONSTRAINT `login_content_media_content_id_cd075dec_fk_login_con` FOREIGN KEY (`content_id`) REFERENCES `login_content` (`content_id`),
  CONSTRAINT `login_content_media_item_category_id_32bd6104_fk_login_ite` FOREIGN KEY (`item_category_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_content_media`
--

LOCK TABLES `login_content_media` WRITE;
/*!40000 ALTER TABLE `login_content_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_content_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_event`
--

DROP TABLE IF EXISTS `login_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `place` varchar(255) NOT NULL,
  `link_form` varchar(255) NOT NULL,
  `url_info` varchar(255) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `login_event_content_id_6ae6e42a_fk_login_content_content_id` (`content_id`),
  CONSTRAINT `login_event_content_id_6ae6e42a_fk_login_content_content_id` FOREIGN KEY (`content_id`) REFERENCES `login_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_event`
--

LOCK TABLES `login_event` WRITE;
/*!40000 ALTER TABLE `login_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_group`
--

DROP TABLE IF EXISTS `login_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `name` (`name`),
  KEY `login_group_university_career_id_71367880_fk_login_ite` (`university_career_id`),
  CONSTRAINT `login_group_university_career_id_71367880_fk_login_ite` FOREIGN KEY (`university_career_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_group`
--

LOCK TABLES `login_group` WRITE;
/*!40000 ALTER TABLE `login_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_group_contact`
--

DROP TABLE IF EXISTS `login_group_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_group_contact` (
  `group_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`group_contact_id`),
  KEY `login_group_contact_contact_type_id_05c91603_fk_login_ite` (`contact_type_id`),
  KEY `login_group_contact_group_id_1218d98d_fk_login_group_group_id` (`group_id`),
  CONSTRAINT `login_group_contact_contact_type_id_05c91603_fk_login_ite` FOREIGN KEY (`contact_type_id`) REFERENCES `login_item_category` (`item_category_id`),
  CONSTRAINT `login_group_contact_group_id_1218d98d_fk_login_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `login_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_group_contact`
--

LOCK TABLES `login_group_contact` WRITE;
/*!40000 ALTER TABLE `login_group_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_group_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_group_event`
--

DROP TABLE IF EXISTS `login_group_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_group_event` (
  `group_event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`group_event_id`),
  KEY `login_group_event_event_id_f9a55d54_fk_login_event_event_id` (`event_id`),
  KEY `login_group_event_group_id_75c2d028_fk_login_group_group_id` (`group_id`),
  CONSTRAINT `login_group_event_event_id_f9a55d54_fk_login_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `login_event` (`event_id`),
  CONSTRAINT `login_group_event_group_id_75c2d028_fk_login_group_group_id` FOREIGN KEY (`group_id`) REFERENCES `login_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_group_event`
--

LOCK TABLES `login_group_event` WRITE;
/*!40000 ALTER TABLE `login_group_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_group_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_item_category`
--

DROP TABLE IF EXISTS `login_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_item_category` (
  `item_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`item_category_id`),
  UNIQUE KEY `name` (`name`),
  KEY `login_item_category_category_id_01320920_fk_login_cat` (`category_id`),
  CONSTRAINT `login_item_category_category_id_01320920_fk_login_cat` FOREIGN KEY (`category_id`) REFERENCES `login_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_item_category`
--

LOCK TABLES `login_item_category` WRITE;
/*!40000 ALTER TABLE `login_item_category` DISABLE KEYS */;
INSERT INTO `login_item_category` VALUES (1,'Sistemas Informáticos y Computación',1,1),(2,'Arquitectura',1,1),(3,'Octubre 2019 - Febrero 2020',1,3);
/*!40000 ALTER TABLE `login_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_menu`
--

DROP TABLE IF EXISTS `login_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `name` (`name`),
  KEY `login_menu_item_category_id_b1b3f6bd_fk_login_ite` (`item_category_id`),
  CONSTRAINT `login_menu_item_category_id_b1b3f6bd_fk_login_ite` FOREIGN KEY (`item_category_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_menu`
--

LOCK TABLES `login_menu` WRITE;
/*!40000 ALTER TABLE `login_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_person`
--

DROP TABLE IF EXISTS `login_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `first_last_name` varchar(255) NOT NULL,
  `second_last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_person`
--

LOCK TABLES `login_person` WRITE;
/*!40000 ALTER TABLE `login_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_person_contact`
--

DROP TABLE IF EXISTS `login_person_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_person_contact` (
  `person_contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_contact_id`),
  KEY `login_person_contact_contact_type_id_2aab9653_fk_login_ite` (`contact_type_id`),
  KEY `login_person_contact_person_id_f33c192b_fk_login_per` (`person_id`),
  CONSTRAINT `login_person_contact_contact_type_id_2aab9653_fk_login_ite` FOREIGN KEY (`contact_type_id`) REFERENCES `login_item_category` (`item_category_id`),
  CONSTRAINT `login_person_contact_person_id_f33c192b_fk_login_per` FOREIGN KEY (`person_id`) REFERENCES `login_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_person_contact`
--

LOCK TABLES `login_person_contact` WRITE;
/*!40000 ALTER TABLE `login_person_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_person_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_person_media`
--

DROP TABLE IF EXISTS `login_person_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_person_media` (
  `person_media_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`person_media_id`),
  KEY `login_person_media_item_category_id_f2ce3349_fk_login_ite` (`item_category_id`),
  KEY `login_person_media_person_id_c0641dc9_fk_login_person_person_id` (`person_id`),
  CONSTRAINT `login_person_media_item_category_id_f2ce3349_fk_login_ite` FOREIGN KEY (`item_category_id`) REFERENCES `login_item_category` (`item_category_id`),
  CONSTRAINT `login_person_media_person_id_c0641dc9_fk_login_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `login_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_person_media`
--

LOCK TABLES `login_person_media` WRITE;
/*!40000 ALTER TABLE `login_person_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_person_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_person_role`
--

DROP TABLE IF EXISTS `login_person_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_person_role` (
  `person_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`person_role_id`),
  KEY `login_person_role_person_id_0e27e662_fk_login_person_person_id` (`person_id`),
  KEY `login_person_role_role_id_bcc9807a_fk_login_role_role_id` (`role_id`),
  KEY `login_person_role_university_career_id_6b223183_fk_login_ite` (`university_career_id`),
  CONSTRAINT `login_person_role_person_id_0e27e662_fk_login_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `login_person` (`person_id`),
  CONSTRAINT `login_person_role_role_id_bcc9807a_fk_login_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `login_role` (`role_id`),
  CONSTRAINT `login_person_role_university_career_id_6b223183_fk_login_ite` FOREIGN KEY (`university_career_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_person_role`
--

LOCK TABLES `login_person_role` WRITE;
/*!40000 ALTER TABLE `login_person_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_person_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_person_section`
--

DROP TABLE IF EXISTS `login_person_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_person_section` (
  `person_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`person_section_id`),
  KEY `login_person_section_person_id_85cec45c_fk_login_per` (`person_id`),
  KEY `login_person_section_section_id_13797f4a_fk_login_sec` (`section_id`),
  CONSTRAINT `login_person_section_person_id_85cec45c_fk_login_per` FOREIGN KEY (`person_id`) REFERENCES `login_person` (`person_id`),
  CONSTRAINT `login_person_section_section_id_13797f4a_fk_login_sec` FOREIGN KEY (`section_id`) REFERENCES `login_section` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_person_section`
--

LOCK TABLES `login_person_section` WRITE;
/*!40000 ALTER TABLE `login_person_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_person_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_requirement`
--

DROP TABLE IF EXISTS `login_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_requirement` (
  `requirement_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_matter_id` int(11) NOT NULL,
  `subject_matter_requirement_id` int(11) NOT NULL,
  PRIMARY KEY (`requirement_id`),
  KEY `login_requirement_subject_matter_id_0828e9fe_fk_login_sub` (`subject_matter_id`),
  KEY `login_requirement_subject_matter_requi_b449f924_fk_login_sub` (`subject_matter_requirement_id`),
  CONSTRAINT `login_requirement_subject_matter_id_0828e9fe_fk_login_sub` FOREIGN KEY (`subject_matter_id`) REFERENCES `login_subject_matter` (`subject_matter_id`),
  CONSTRAINT `login_requirement_subject_matter_requi_b449f924_fk_login_sub` FOREIGN KEY (`subject_matter_requirement_id`) REFERENCES `login_subject_matter` (`subject_matter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_requirement`
--

LOCK TABLES `login_requirement` WRITE;
/*!40000 ALTER TABLE `login_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_role`
--

DROP TABLE IF EXISTS `login_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_role`
--

LOCK TABLES `login_role` WRITE;
/*!40000 ALTER TABLE `login_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_section`
--

DROP TABLE IF EXISTS `login_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `name` (`name`),
  KEY `login_section_university_career_id_41d0734b_fk_login_ite` (`university_career_id`),
  CONSTRAINT `login_section_university_career_id_41d0734b_fk_login_ite` FOREIGN KEY (`university_career_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_section`
--

LOCK TABLES `login_section` WRITE;
/*!40000 ALTER TABLE `login_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_subject_matter`
--

DROP TABLE IF EXISTS `login_subject_matter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_subject_matter` (
  `subject_matter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `semester` int(11) NOT NULL,
  `university_career_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_matter_id`),
  KEY `login_subject_matter_university_career_id_21a4da60_fk_login_ite` (`university_career_id`),
  CONSTRAINT `login_subject_matter_university_career_id_21a4da60_fk_login_ite` FOREIGN KEY (`university_career_id`) REFERENCES `login_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_subject_matter`
--

LOCK TABLES `login_subject_matter` WRITE;
/*!40000 ALTER TABLE `login_subject_matter` DISABLE KEYS */;
INSERT INTO `login_subject_matter` VALUES (1,'Lógica de la Programación',1,1),(2,'Fundamentos Informáticos',1,1),(3,'Fundamentos Matemáticos',1,1),(4,'Desarrollo Espiritual I',1,1),(5,'Emprendimiento',1,1),(6,'Realidad Nacional y Ambiental',1,1),(7,'Expresión Oral y Escrita',1,1),(8,'Fundamentos de Programación',2,1),(9,'Contabilidad',2,1),(10,'Matemáticas Discretas',2,1),(11,'Desarrollo Espiritual II',2,1),(12,'Inglés I',2,1),(13,'Gestión Productiva 1.1 Pasantía en Cittes',2,1),(14,'Estructura de Datos y Algoritmos',3,1),(15,'Programación de Algoritmos',3,1),(16,'Física',3,1),(17,'Cálculo',3,1),(18,'Desarrollo Espiritual III',3,1),(19,'Inglés II',3,1),(20,'Gestión Productiva 1.2 Pasantía en Cittes',3,1),(21,'Programación Avanzada',4,1),(22,'Electrónica Digital',4,1),(23,'Estadística',4,1),(24,'Organización y Administración Empresarial',4,1),(25,'Inglés III',4,1),(26,'Gestión Productiva 1.3 Formación en Academias',4,1),(27,'Libre Configuración 1',4,1),(28,'Libre Configuración 2',5,1),(29,'Libre Configuración 3',6,1),(30,'Libre Configuración 4',7,1),(31,'Libre Configuración 5',8,1),(32,'Libre Configuración 6',9,1),(33,'Libre Configuración 7',10,1),(34,'Arquitectura de Computadores',5,1),(35,'Fundamentos de Bases de Datos',5,1),(36,'Economía, Finanzas e Inversiones',5,1),(37,'Métodos Cuantitativos',5,1),(38,'inglés IV',5,1),(39,'Gestión Productiva 2.1 Práctica en Cittes',5,1),(40,'Gestión Productiva 2.2 Práctica en Cittes',6,1),(41,'Gestión Productiva 3.1 Formación en Academias',7,1),(42,'Gestión Productiva 3.2 Práctica en Cittes',8,1),(43,'GP Proyecto Fin de Carrera 4.1',9,1),(44,'GP Proyecto Fin de Carrera 4.2',10,1),(45,'Complementaria 1',6,1),(46,'Complementaria 2',7,1),(47,'Complementaria 3',8,1),(48,'Fundamentos de Ingeniería de Software',6,1),(49,'Sistemas Operativos',6,1),(50,'Bases de Datos Avanzadas',6,1),(51,'Ingeniería de Requisitos',7,1),(52,'Teoría de Autómatas y Compiladores',7,1),(53,'Fundamentos de Redes y Telecomunicaciones',7,1),(54,'Gestión de Proyectos',7,1),(55,'Ingeniería Web',8,1),(56,'Gestión de Tecnologías de la Información',8,1),(57,'Redes y Sistemas Distribuidos',8,1),(58,'Arquitectura de Aplicaciones',9,1),(59,'Inteligencia Artificial',9,1),(60,'Arquitectura y Seguridad de Redes',9,1),(61,'Arquitectura y Computación Paralela',9,1),(62,'Auditoría Informática',10,1),(63,'Sistemas Basados en Conocimiento',10,1),(64,'IA Avanzado',10,1),(65,'Procesos de Ingeniería de Software',10,1);
/*!40000 ALTER TABLE `login_subject_matter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
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
  CONSTRAINT `login_user_person_id_48ec541c_fk_login_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `login_person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user_groups`
--

DROP TABLE IF EXISTS `login_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_user_groups_user_id_group_id_e039d177_uniq` (`user_id`,`group_id`),
  KEY `login_user_groups_group_id_a8810f0d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `login_user_groups_group_id_a8810f0d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `login_user_groups_user_id_f6fabf84_fk_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user_groups`
--

LOCK TABLES `login_user_groups` WRITE;
/*!40000 ALTER TABLE `login_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user_user_permissions`
--

DROP TABLE IF EXISTS `login_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_user_user_permissions_user_id_permission_id_a985464b_uniq` (`user_id`,`permission_id`),
  KEY `login_user_user_perm_permission_id_08d04f9c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `login_user_user_perm_permission_id_08d04f9c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `login_user_user_permissions_user_id_2a4ce843_fk_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user_user_permissions`
--

LOCK TABLES `login_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `login_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_user_user_permissions` ENABLE KEYS */;
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
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_login_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_login_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_user` (`id`)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26 23:42:10
