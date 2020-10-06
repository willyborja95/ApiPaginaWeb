-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: paginaSistemas
-- ------------------------------------------------------
-- Server version	5.7.29

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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add site',4,'add_site'),(14,'Can change site',4,'change_site'),(15,'Can delete site',4,'delete_site'),(16,'Can view site',4,'view_site'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add content',9,'add_content'),(34,'Can change content',9,'change_content'),(35,'Can delete content',9,'delete_content'),(36,'Can view content',9,'view_content'),(37,'Can add content_ media',10,'add_content_media'),(38,'Can change content_ media',10,'change_content_media'),(39,'Can delete content_ media',10,'delete_content_media'),(40,'Can view content_ media',10,'view_content_media'),(41,'Can add event',11,'add_event'),(42,'Can change event',11,'change_event'),(43,'Can delete event',11,'delete_event'),(44,'Can view event',11,'view_event'),(45,'Can add group',12,'add_group'),(46,'Can change group',12,'change_group'),(47,'Can delete group',12,'delete_group'),(48,'Can view group',12,'view_group'),(49,'Can add group_ contact',13,'add_group_contact'),(50,'Can change group_ contact',13,'change_group_contact'),(51,'Can delete group_ contact',13,'delete_group_contact'),(52,'Can view group_ contact',13,'view_group_contact'),(53,'Can add group_ event',14,'add_group_event'),(54,'Can change group_ event',14,'change_group_event'),(55,'Can delete group_ event',14,'delete_group_event'),(56,'Can view group_ event',14,'view_group_event'),(57,'Can add item_ category',15,'add_item_category'),(58,'Can change item_ category',15,'change_item_category'),(59,'Can delete item_ category',15,'delete_item_category'),(60,'Can view item_ category',15,'view_item_category'),(61,'Can add menu',16,'add_menu'),(62,'Can change menu',16,'change_menu'),(63,'Can delete menu',16,'delete_menu'),(64,'Can view menu',16,'view_menu'),(65,'Can add person',17,'add_person'),(66,'Can change person',17,'change_person'),(67,'Can delete person',17,'delete_person'),(68,'Can view person',17,'view_person'),(69,'Can add person_ contact',18,'add_person_contact'),(70,'Can change person_ contact',18,'change_person_contact'),(71,'Can delete person_ contact',18,'delete_person_contact'),(72,'Can view person_ contact',18,'view_person_contact'),(73,'Can add person_ media',19,'add_person_media'),(74,'Can change person_ media',19,'change_person_media'),(75,'Can delete person_ media',19,'delete_person_media'),(76,'Can view person_ media',19,'view_person_media'),(77,'Can add person_ role',20,'add_person_role'),(78,'Can change person_ role',20,'change_person_role'),(79,'Can delete person_ role',20,'delete_person_role'),(80,'Can view person_ role',20,'view_person_role'),(81,'Can add person_ section',21,'add_person_section'),(82,'Can change person_ section',21,'change_person_section'),(83,'Can delete person_ section',21,'delete_person_section'),(84,'Can view person_ section',21,'view_person_section'),(85,'Can add requirement',22,'add_requirement'),(86,'Can change requirement',22,'change_requirement'),(87,'Can delete requirement',22,'delete_requirement'),(88,'Can view requirement',22,'view_requirement'),(89,'Can add role',23,'add_role'),(90,'Can change role',23,'change_role'),(91,'Can delete role',23,'delete_role'),(92,'Can view role',23,'view_role'),(93,'Can add section',24,'add_section'),(94,'Can change section',24,'change_section'),(95,'Can delete section',24,'delete_section'),(96,'Can view section',24,'view_section'),(97,'Can add subject_ matter',25,'add_subject_matter'),(98,'Can change subject_ matter',25,'change_subject_matter'),(99,'Can delete subject_ matter',25,'delete_subject_matter'),(100,'Can view subject_ matter',25,'view_subject_matter'),(101,'Can add Token',26,'add_token'),(102,'Can change Token',26,'change_token'),(103,'Can delete Token',26,'delete_token'),(104,'Can view Token',26,'view_token'),(105,'Can add email address',27,'add_emailaddress'),(106,'Can change email address',27,'change_emailaddress'),(107,'Can delete email address',27,'delete_emailaddress'),(108,'Can view email address',27,'view_emailaddress'),(109,'Can add email confirmation',28,'add_emailconfirmation'),(110,'Can change email confirmation',28,'change_emailconfirmation'),(111,'Can delete email confirmation',28,'delete_emailconfirmation'),(112,'Can view email confirmation',28,'view_emailconfirmation'),(113,'Can add social account',29,'add_socialaccount'),(114,'Can change social account',29,'change_socialaccount'),(115,'Can delete social account',29,'delete_socialaccount'),(116,'Can view social account',29,'view_socialaccount'),(117,'Can add social application',30,'add_socialapp'),(118,'Can change social application',30,'change_socialapp'),(119,'Can delete social application',30,'delete_socialapp'),(120,'Can view social application',30,'view_socialapp'),(121,'Can add social application token',31,'add_socialtoken'),(122,'Can change social application token',31,'change_socialtoken'),(123,'Can delete social application token',31,'delete_socialtoken'),(124,'Can view social application token',31,'view_socialtoken'),(125,'Can add blacklisted token',32,'add_blacklistedtoken'),(126,'Can change blacklisted token',32,'change_blacklistedtoken'),(127,'Can delete blacklisted token',32,'delete_blacklistedtoken'),(128,'Can view blacklisted token',32,'view_blacklistedtoken'),(129,'Can add outstanding token',33,'add_outstandingtoken'),(130,'Can change outstanding token',33,'change_outstandingtoken'),(131,'Can delete outstanding token',33,'delete_outstandingtoken'),(132,'Can view outstanding token',33,'view_outstandingtoken'),(133,'Can add menu_ item',34,'add_menu_item'),(134,'Can change menu_ item',34,'change_menu_item'),(135,'Can delete menu_ item',34,'delete_menu_item'),(136,'Can view menu_ item',34,'view_menu_item');
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
INSERT INTO `authtoken_token` VALUES ('d96125e5587e07dd78d80b587ee5514f38cef87a','2020-07-25 15:48:48.039560',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_category`
--

LOCK TABLES `core_category` WRITE;
/*!40000 ALTER TABLE `core_category` DISABLE KEYS */;
INSERT INTO `core_category` VALUES (1,'Titulación',1),(2,'Tipo de contenido',1),(3,'Tipo de contacto',1),(4,'Periodo Académico',1),(6,'Menú',1),(7,'Tipo de contenido media',1),(8,'Rol',1);
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
  `description` varchar(1020) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `academic_period_id` int(11) DEFAULT NULL,
  `contact_type_id` int(11) NOT NULL,
  `university_career_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  KEY `core_content_academic_period_id_557f696c_fk_core_item` (`academic_period_id`),
  KEY `core_content_contact_type_id_865e9f5b_fk_core_item` (`contact_type_id`),
  KEY `core_content_university_career_id_aab813f0_fk_core_item` (`university_career_id`),
  KEY `core_content_person_id_8b7cc82d_fk_core_person_person_id` (`person_id`),
  CONSTRAINT `core_content_academic_period_id_557f696c_fk_core_item` FOREIGN KEY (`academic_period_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_content_contact_type_id_865e9f5b_fk_core_item` FOREIGN KEY (`contact_type_id`) REFERENCES `core_item_category` (`item_category_id`),
  CONSTRAINT `core_content_person_id_8b7cc82d_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`),
  CONSTRAINT `core_content_university_career_id_aab813f0_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_content`
--

LOCK TABLES `core_content` WRITE;
/*!40000 ALTER TABLE `core_content` DISABLE KEYS */;
INSERT INTO `core_content` VALUES (2,'prueba','hola','2020-01-17 04:00:33.416913','2020-01-17 04:00:33.416923',2,4,1,NULL),(5,'Expotech 2020','Se invita a todas las personas a presenciar los proyectos trabajados en el periodo octubre 2019 - febrero 2020 de la carrera de Sistemas Informáticos el día 19 de Febrero','2020-02-14 13:59:09.000000','2020-02-14 13:59:09.000000',2,30,1,NULL),(6,'Estudiantes Exponen sus Ideas','Leonardo Izquierdo, director del Área Administrativa de la UTPL, cree que el aporte al desarrollo de la economía ecuatoriana no solo está en el sector público sino también en el privado.','2020-02-14 14:00:34.000000','2020-02-14 14:00:34.000000',2,31,1,NULL),(7,'Mensaje de bienvenida','Las Ciencias de la Computación son la base del desarrollo técnico y científico de diferentes campos del conocimiento, por lo que el mercado demanda profesionales que sean capaces de desarrollar soluciones integrales de base tecnológica que apoyen en la obtención de ventajas competitivas, gracias a la integración de conocimientos, habilidades y actitudes que desarrollará el estudiante en esta carrera. Este es el principal objetivo y el motor que nos mueve a crear y fortalecer este espítiru en nuevo','2020-02-14 14:13:31.000000','2020-02-14 14:13:31.000000',2,24,1,NULL),(9,'Capacitación de Blender','Curso de Capacitación para aprendizaje en Blender de lunes a viernes de 9am a 12pm en el Vicerrectorado','2020-02-17 22:42:05.701493','2020-02-17 22:42:05.701507',2,30,1,NULL),(10,'Oferta Laboral - EdiLoja','Postulación para los estudiantes de la titulación de Sistemas Informáticos para laborar en Ediloja - UTPL, se recibirá carpetas en horario de 8 a 10 am','2020-02-17 22:46:38.502912','2020-02-17 22:46:38.502923',2,30,1,NULL),(11,'Seminario Python','Se dictará capacitación gratuita en el aula 722 los dias Jueves a las 16h00 pm','2020-02-17 22:49:30.636851','2020-02-17 22:49:30.636862',2,30,1,NULL),(12,'Cuando decides ser más, todos lo reconocen.','La facilidad que le brinda, la modalidad a distancia, para poder organizarse con su trabajo y su familia, no tiene nombre. La UTPL es una excelente opción. Ahora tenemos tanta facilidad para acceder a este tipo de estudio.','2020-02-17 22:51:27.698006','2020-02-17 22:51:27.698020',2,31,1,NULL),(13,'Innova 2020','Están abiertas las postulaciones para participar en la Feria de Innovación 2020 en la UTPL','2020-02-17 22:55:15.641036','2020-02-17 22:55:15.641050',2,30,1,NULL),(14,'Matriculas Ordinarias','Las matriculas para el periodo abril - agosto 2020 serán a partir del 26 de Febrero','2020-02-17 22:56:04.957810','2020-02-17 22:56:04.957824',2,30,1,NULL),(15,'Prueba 2','prueba 2','2020-07-25 16:14:01.243732','2020-07-25 16:14:01.243745',2,31,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_content_media`
--

LOCK TABLES `core_content_media` WRITE;
/*!40000 ALTER TABLE `core_content_media` DISABLE KEYS */;
INSERT INTO `core_content_media` VALUES (3,'https://www.youtube.com/embed/sUhJwmuBzp4',12,28),(4,'https://www.youtube.com/embed/sUhJwmuBzp4',6,28),(5,'https://scontent.fgye7-1.fna.fbcdn.net/v/t31.0-8/s960x960/27355964_10156243932670921_437707382350184340_o.jpg?_nc_cat=102&_nc_ohc=SkCKtAkWcHoAX8BDAO4&_nc_ht=scontent.fgye7-1.fna&_nc_tp=7&oh=815df3ab70f960d60b273af7a9e4c225&oe=5F0261D5',9,30),(6,'https://scontent.fgye8-1.fna.fbcdn.net/v/t1.0-0/p180x540/67834871_10157647021680921_8007173122673344512_o.jpg?_nc_cat=104&_nc_ohc=hac_cQWtHw4AX83CgcZ&_nc_ht=scontent.fgye8-1.fna&_nc_tp=6&oh=bf5e9b9f5337cee16c83c1b97dc062ae&oe=5EC5AAA3',5,30),(7,'https://scontent.fgye7-1.fna.fbcdn.net/v/t31.0-0/p640x640/18738982_10155452782610921_5311111370915740685_o.jpg?_nc_cat=107&_nc_ohc=Isms4XniddMAX8DGlPb&_nc_ht=scontent.fgye7-1.fna&_nc_tp=6&oh=b839aef59729099e5c11084a823fdbce&oe=5EC89E99',10,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_item_category`
--

LOCK TABLES `core_item_category` WRITE;
/*!40000 ALTER TABLE `core_item_category` DISABLE KEYS */;
INSERT INTO `core_item_category` VALUES (1,'Sistemas Informáticos y Computación',1,1),(2,'Octubre 2019 - Febrero 2020',1,4),(3,'Video',1,2),(4,'Correo electrónico',1,3),(5,'Extensión',1,3),(9,'Nro celular',1,3),(10,'Arquitectura',1,1),(11,'Economia',1,1),(12,'Civil',1,1),(13,'Medicina',1,1),(14,'Computacion',1,1),(21,'Hoteleria y Turismo',1,1),(22,'octubre 2019 -febrero 2020',1,4),(24,'Mensajes',1,6),(25,'Quienes Somos',1,6),(26,'Secciones',1,6),(27,'Autoridades',1,6),(28,'Testimonios',1,6),(29,'Menu',1,6),(30,'Noticia',1,2),(31,'Testimonio',0,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_menu`
--

LOCK TABLES `core_menu` WRITE;
/*!40000 ALTER TABLE `core_menu` DISABLE KEYS */;
INSERT INTO `core_menu` VALUES (2,'Mensajes',1,24),(3,'Quienes Somos',2,25),(4,'Secciones',3,26),(5,'Autoridades',4,27),(6,'Testimonios',5,28);
/*!40000 ALTER TABLE `core_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_menu_item`
--

DROP TABLE IF EXISTS `core_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_menu_item` (
  `menu_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1020) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `item_category_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_item_id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_menu_item_item_category_id_d85311ff_fk_core_item` (`item_category_id`),
  CONSTRAINT `core_menu_item_item_category_id_d85311ff_fk_core_item` FOREIGN KEY (`item_category_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_menu_item`
--

LOCK TABLES `core_menu_item` WRITE;
/*!40000 ALTER TABLE `core_menu_item` DISABLE KEYS */;
INSERT INTO `core_menu_item` VALUES (5,'https://scontent.fgye7-1.fna.fbcdn.net/v/t1.0-9/s960x960/67619789_10157654911695921_1478465993985490944_o.png?_nc_cat=100&_nc_ohc=weCXBNtO1o8AX-45Sa6&_nc_ht=scontent.fgye7-1.fna&oh=c67d2102d27571c7db30bc2a09d0b861&oe=5EFA819B','Noticias',2,29),(6,'https://scontent.fgye7-1.fna.fbcdn.net/v/t1.0-9/s960x960/67619789_10157654911695921_1478465993985490944_o.png?_nc_cat=100&_nc_ohc=weCXBNtO1o8AX-45Sa6&_nc_ht=scontent.fgye7-1.fna&oh=c67d2102d27571c7db30bc2a09d0b861&oe=5EFA819B','Mensaje',3,29),(7,'https://scontent.fgye7-1.fna.fbcdn.net/v/t1.0-9/s960x960/67619789_10157654911695921_1478465993985490944_o.png?_nc_cat=100&_nc_ohc=weCXBNtO1o8AX-45Sa6&_nc_ht=scontent.fgye7-1.fna&oh=c67d2102d27571c7db30bc2a09d0b861&oe=5EFA819B','Secciones',4,29),(8,'https://scontent.fgye7-1.fna.fbcdn.net/v/t1.0-9/s960x960/67619789_10157654911695921_1478465993985490944_o.png?_nc_cat=100&_nc_ohc=weCXBNtO1o8AX-45Sa6&_nc_ht=scontent.fgye7-1.fna&oh=c67d2102d27571c7db30bc2a09d0b861&oe=5EFA819B','Autoridades',5,29),(9,'https://scontent.fgye7-1.fna.fbcdn.net/v/t1.0-9/s960x960/67619789_10157654911695921_1478465993985490944_o.png?_nc_cat=100&_nc_ohc=weCXBNtO1o8AX-45Sa6&_nc_ht=scontent.fgye7-1.fna&oh=c67d2102d27571c7db30bc2a09d0b861&oe=5EFA819B','Testimonios',6,29),(13,'https://scontent.fgye7-1.fna.fbcdn.net/v/t1.0-9/s960x960/67619789_10157654911695921_1478465993985490944_o.png?_nc_cat=100&_nc_ohc=weCXBNtO1o8AX-45Sa6&_nc_ht=scontent.fgye7-1.fna&oh=c67d2102d27571c7db30bc2a09d0b861&oe=5EFA819B','Desarrollo',7,29);
/*!40000 ALTER TABLE `core_menu_item` ENABLE KEYS */;
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
  `second_name` varchar(255) DEFAULT NULL,
  `first_last_name` varchar(255) NOT NULL,
  `second_last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person`
--

LOCK TABLES `core_person` WRITE;
/*!40000 ALTER TABLE `core_person` DISABLE KEYS */;
INSERT INTO `core_person` VALUES (1,'Renato','Johao','Balcázar','Loaiza'),(2,'Jose','Enrique','Abad','Abad'),(3,'Admin','Admin','Admin','Admin'),(4,'Fernanda','Maricela','Soto','Guerrero'),(5,'Luis','Rodrigo','Barba','Guamán'),(8,'prueba','prueba','prueba','prueba'),(10,'Marco','S','Polo','L'),(11,'ultimo','ultimo','ultimo','ultimo'),(12,'Armando','Agusto','Cabrera','Silva'),(13,'Jorge','Afranio','Lopez','Vargas'),(14,'Romel','s/n','Torres','Tandazo'),(15,'María','Belén','Mora','Arciniegas'),(16,'Guido','Eduardo','Ríofrío','Calderón'),(17,'Francisco','Alberto','Sandoval','Noreña'),(18,'Segundo','Raymundo','Benítez','Hurtado'),(19,'Janneth','Alexandra','Chicaiza','Ezpinoza'),(20,'Fanny','Beatriz','Cevallos','Macas'),(21,'Priscila','Marisela','Valdiviezo','Días'),(22,'Samanta','Patricial','Cueva','Carrión'),(23,'Karla','Alexandra','Romero','Gonzalez'),(24,'Marco','Patricio','Abad','Espinoza'),(25,'Martha','Vanessa','Agila','Palacios'),(26,'René','Rolando','Elizalde','Solano'),(27,'Omar','Alexander','Ruiz','Vivanco'),(28,'Luis','Rodrigo','Barba','Guamán'),(29,'Irma','Elizabeth','Cadme','Samaniego'),(30,'Jorge','Marcos','Cordero','Zambrano'),(31,'Lorena','del Cisne','Condolo','Herrera'),(32,'Verónica','Alexandra','Segarra','Faggioni'),(33,'Angel','Eduardo','Encalada','Encalada'),(34,'Liliana','Elvira','Enciso','Quispe'),(35,'María','Paula','Espinosa','Velez'),(36,'Alexandra','Cristina','González','Eras'),(37,'Franco','Olivio','Guamán','Bastidas'),(38,'Gladys','Alicia','Tenesaca','Luna'),(39,'Pedro','Daniel','Irene','Robalino'),(40,'Dunia','Inés','Jara','Roa'),(41,'Danilo','Rubén','Jaramillo','Hurtado'),(42,'Vicente','Miguel','Martínez','Chuquimarca'),(43,'Juan','Carlos','Morocho','Yunga'),(44,'Manuel','Fernando','Quiñones','Cuenca'),(45,'Ramiro','Leonardo','Ramirez','Coronel'),(46,'Ruth','Maria','Reategui','Rojas'),(47,'Germania','Del Rocío','Rodríguez','Morales'),(48,'Katty','Alexandra','Rohoden','Jaramillo'),(49,'Audrey','Elizabeth','Romero','Pelaez'),(50,'Celia','Paola','Sarango','Lapo'),(51,'Manuel','Eduardo','Sucunuta','España'),(52,'Juan','Carlos','Torres','Díaz'),(53,'Tuesman','Daniel','Castillo','Calvas'),(54,'Marlon','Santiago','Viñan','Ludeña'),(55,'María','del Carmen','Cabrera','Loayza'),(56,'Roddy','Andrés','Correa','Tenesaca'),(57,'Javier','Francisco','Martínez','Curipoma'),(58,'Byron','Paul','Maza','Chalán'),(59,'Lady','Cecilia','Sanmartín','Prado'),(60,'Sofia','s/n','Sanz','Gonzalez'),(61,'Holger','Patricio','Cuadrado','Torres'),(62,'Katherine','Haidee','Soto','Toledo'),(63,'Alicia','Mercedes','Arciniegas','Naula'),(64,'Eduardo','Bladimir','Aguirre','Maldonado'),(65,'Diego','Salvador','Gonzalez','Ojeda'),(66,'Cristian','Andre','Balcazar','Arciniega'),(67,'Carlos','Byron','Bermeo','Leon'),(68,'Claudia','Paola','Cartuche','Flores'),(69,'Ramiro','Alberto','Correa','Jaramillo'),(70,'Marlon','Antonio','Chamba','Toledo'),(71,'Maria','de los Angeles','Cuenca','Rosillo'),(72,'Leonardo','Heriberto','Chavez','Jaramillo'),(73,'Maria','Jose','Delgado','Cruz'),(74,'Diego','Baltazar','Espinosa','Leon'),(75,'Jose','Luis','Galarza','Viera'),(76,'Maria','Magdalena','Guajala','Michay'),(77,'Iliana','Elizabeth','Herrera','Herrera'),(78,'Silvia','Elena','Malo','Martinez'),(79,'Carlos','Francisco','Mena','Ruiz'),(80,'Karina','s/n','Monteros','Cueva'),(81,'Ruth','Jacqueline','Simaluiza','Masabanda'),(82,'Lorena','Fernanda','Alvarado','Rodriguez'),(83,'Maria','Gabriela','Camargo','Mora'),(84,'Valentina','s/n','Dall','Orto'),(85,'Rosa','Elizabeth','Medina','Alvarado'),(86,'Alexandra','del Rosario','Moncayo','Vega'),(87,'Veronica','s/n','Noriega','Armijos'),(88,'Maria','Gabriela','Punin','Burneo'),(89,'Sandra','Vanessa','Valarezo','Jaramillo'),(90,'Carlos','Alberto','Calderón','Córdova'),(91,'Ángel','Leonardo','Valdivieso','Caraguay'),(92,'José','Luis','López','Presa'),(93,'Arq. Lopez',NULL,'Giordano',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_contact`
--

LOCK TABLES `core_person_contact` WRITE;
/*!40000 ALTER TABLE `core_person_contact` DISABLE KEYS */;
INSERT INTO `core_person_contact` VALUES (1,'lrbarba@utpl.edu.ec',4,5),(2,'2674',5,5),(3,'efmsoto@utpl.edu.ec',4,4),(4,'lrbarba@utpl.edu.ec',4,5),(5,'aacabrera@utpl.edu.ec',4,12),(6,'jalopez2@utpl.edu.ec',4,13),(7,'arovitor@utpl.edu.ec',4,14),(8,'mbmora@utpl.edu.ec',4,15),(9,'griofrio@utpl.edu.ec',4,16),(10,'fasandoval@utpl.edu.ec',4,17),(11,'srbenitez@utpl.edu.ec',4,18),(12,'jachicaiza@utpl.edu.ec',4,19),(13,'fbcevallos@utpl.edu.ec',4,20),(14,'pmvaldiviezo@utpl.edu.ec',4,21),(15,'spcueva@utpl.edu.ec',4,22),(16,'krromero@utpl.edu.ec',4,23),(17,'mpabad@utpl.edu.ec',4,24),(18,'mvagila@utpl.edu.ec',4,25),(19,'rrelizalde@utpl.edu.ec',4,26),(20,'oaruiz@utpl.edu.ec',4,27),(21,'lrbarba@utpl.edu.ec',4,28),(22,'iecadme@utpl.edu.ec',4,29),(23,'jmcordero@utpl.edu.ec',4,30),(24,'ldcondolo@utpl.edu.ec',4,31),(25,'vasegarra@utpl.edu.ec',4,32),(26,'aeencalada@utpl.edu.ec',4,33),(27,'lenciso@utpl.edu.ec',4,34),(28,'mpespinoza@utpl.edu.ec',4,35),(29,'acgonzalez@utpl.edu.ec',4,36),(30,'foguaman@utpl.edu.ec',4,37),(31,'gtenesaca@utpl.edu.ec',4,38),(32,'pdirene@utpl.edu.ec',4,39),(33,'dijara@utpl.edu.ec',4,40),(34,'djaramillo@utpl.edu.ec',4,41),(35,'vmmartines@utpl.edu.ec',4,42),(36,'jomorocho@utpl.edu.ec',4,43),(37,'mfquinonez@utpl.edu.ec',4,44),(38,'rlramierz@utpl.edu.ec',4,45),(39,'rmreategui@utpl.edu.ec',4,46),(40,'grrodriguez@utpl.edu.ec',4,47),(41,'karohoden@utpl.edu.ec',4,48),(42,'aeromero2@utpl.edu.ec',4,49),(43,'cpsarango@utpl.edu.ec',4,50),(44,'mesucunuta@utpl.edu.ec',4,51),(45,'jctorres@utpl.edu.ec',4,52),(46,'tdcastillo@utpl.edu.ec',4,53),(47,'msvinan@utpl.edu.ec',4,54),(48,'mccabrerax@utpl.edu.ec',4,55),(49,'racorrea2@utpl.edu.ec',4,56),(50,'jfmartinez1@utpl.edu.ec',4,57),(51,'bpmaza@utpl.edu.ec',4,58),(52,'lcsanmartin@utpl.edu.ec',4,59),(53,'ssanz@utpl.edu.ec;',4,60),(54,'hpcuadrado@utpl.edu.ec',4,61),(55,'khsotox@utpl.edu.ec',4,62),(56,'amarciniegas@utpl.edu.ec',4,63),(57,'ebaguirre@utpl.edu.ec',4,64),(58,'dsgonzales@utpl.edu.ec',4,65),(59,'cabalcazar@utpl.edu.ec',4,66),(60,'cbbermeo@utpl.edu.ec',4,67),(61,'cpcartuche@utpl.edu.ec',4,68),(62,'racorrea@utpl.edu.ec',4,69),(63,'machamba1@utpl.edu.ec',4,70),(64,'mdcuenca@utpl.edu.ec',4,71),(65,'lhchavez@utpl.edu.ec',4,72),(66,'mjdelgado@utpl.edu.ec',4,73),(67,'dbespinosa@utpl.edu.ec',4,74),(68,'jlgalarza@utpl.edu.ec',4,75),(69,'mmguajala@utpl.edu.ec',4,76),(70,'ieherrera@utpl.edu.ec',4,77),(71,'emalo@utpl.edu.ec',4,78),(72,'cfmena@utpl.edu.ec',4,79),(73,'kmonteros@utpl.edu.ec',4,80),(74,'rjsimaluiza@utpl.edu.ec',4,81),(75,'lfalvarado@utpl.edu.ec',4,82),(76,'mgcamargo@utpl.edu.ec',4,83),(77,'vdallorto@utpl.edu.ec',4,84),(78,'remedina@utpl.edu.ec',4,85),(79,'admoncayo@utpl.edu.ec',4,86),(80,'vnoriega@utpl.edu.ec',4,87),(81,'mgpuninx@utpl.edu.ec',4,88),(82,'svvalarezo@utpl.edu.ec',4,89),(83,'2511',5,4),(84,'2517',5,12),(85,'2532',5,13),(86,'2675',5,14),(87,'2530',5,15),(88,'2525',5,16),(89,'2535',5,17),(90,'2523',5,18),(91,'2529',5,19),(92,'2534',5,20),(93,'2525',5,21),(94,'2519',5,22),(95,'2521',5,23),(96,'2520',5,24),(97,'2520',5,24),(98,'2206',5,25),(99,'2533',5,26),(100,'2528',5,27),(101,'2674',5,5),(102,'2533',5,29),(103,'2526',5,30),(104,'2522',5,31),(105,'2531',5,32),(106,'2532',5,33),(107,'2536',5,34),(108,'2707',5,35),(109,'2528',5,36),(110,'2527',5,37),(111,'2530',5,38),(112,'2531',5,39),(113,'2231',5,40),(114,'2524',5,41),(115,'2516',5,42),(116,'2532',5,43),(117,'2675',5,44),(118,'2531',5,45),(119,'2528',5,46),(120,'2520',5,47),(121,'2638',5,48),(122,'2533',5,49),(123,'2231',5,50),(124,'2521',5,51),(125,'2526',5,52),(126,'2516',5,53),(127,'2533',5,54),(128,'2533',5,55),(129,'2518',5,56),(130,'2537',5,57),(131,'2449',5,58),(132,'2687',5,59),(133,'2511',5,60),(134,'2542',5,61),(135,'2511',5,62),(136,'2681',5,63),(137,'2794',5,64),(138,'2544',5,65),(139,'2547',5,66),(140,'2545',5,67),(141,'2546',5,68),(142,'2500',5,69),(143,'2545',5,70),(144,'2542',5,71),(145,'2325',5,72),(146,'2548',5,73),(147,'2545',5,74),(148,'2541',5,75),(149,'2545',5,76),(150,'2900',5,77),(151,'2548',5,78),(152,'2545',5,79),(153,'2496',5,80),(154,'02-23947220',5,81),(155,'2552',5,82),(156,'2539',5,83),(157,'2547',5,84),(158,'2538',5,85),(159,'2541',5,86),(160,'2548',5,87),(161,'2543',5,88),(162,'2974',5,89),(163,'2498496153',9,93),(164,'jcmorocho@utpl.edu.ec',4,43);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_media`
--

LOCK TABLES `core_person_media` WRITE;
/*!40000 ALTER TABLE `core_person_media` DISABLE KEYS */;
INSERT INTO `core_person_media` VALUES (2,'prueba',1,3),(3,'http://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg',10,93);
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
  `university_career_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_role_id`),
  KEY `core_person_role_person_id_2c0c1d2e_fk_core_person_person_id` (`person_id`),
  KEY `core_person_role_role_id_8b23e5b6_fk_core_role_role_id` (`role_id`),
  KEY `core_person_role_university_career_id_1fdb165c_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_person_role_person_id_2c0c1d2e_fk_core_person_person_id` FOREIGN KEY (`person_id`) REFERENCES `core_person` (`person_id`),
  CONSTRAINT `core_person_role_role_id_8b23e5b6_fk_core_role_role_id` FOREIGN KEY (`role_id`) REFERENCES `core_role` (`role_id`),
  CONSTRAINT `core_person_role_university_career_id_1fdb165c_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_role`
--

LOCK TABLES `core_person_role` WRITE;
/*!40000 ALTER TABLE `core_person_role` DISABLE KEYS */;
INSERT INTO `core_person_role` VALUES (1,1,1,1),(2,2,1,1),(3,4,2,1),(5,43,1,1),(6,30,6,1),(7,14,7,1),(8,15,4,1),(9,12,5,1),(10,12,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_person_section`
--

LOCK TABLES `core_person_section` WRITE;
/*!40000 ALTER TABLE `core_person_section` DISABLE KEYS */;
INSERT INTO `core_person_section` VALUES (4,5,1),(6,4,5),(7,16,1),(8,21,1),(9,25,1),(10,5,1),(11,30,1),(12,46,1),(13,50,1),(14,52,1),(15,13,3),(16,15,3),(17,19,3),(18,29,3),(19,31,3),(20,32,3),(21,33,3),(22,39,3),(23,43,3),(24,45,3),(25,49,3),(26,54,3),(27,12,5),(28,20,5),(29,22,5),(30,24,5),(31,4,5),(32,35,5),(33,41,5),(34,47,5),(35,51,5),(36,55,5),(37,56,5),(38,17,4),(39,90,4),(40,91,4),(41,34,4),(42,38,4),(43,92,4),(44,14,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_requirement`
--

LOCK TABLES `core_requirement` WRITE;
/*!40000 ALTER TABLE `core_requirement` DISABLE KEYS */;
INSERT INTO `core_requirement` VALUES (8,21,15),(9,10,2),(10,13,12),(11,14,8),(12,15,8),(13,19,12),(14,26,19),(15,33,26),(16,29,14),(17,29,15),(18,36,21),(19,36,28),(20,35,21),(21,37,29),(22,43,35),(23,44,35),(24,42,15),(25,42,14),(26,48,29),(27,48,35),(28,11,4),(29,18,4),(30,18,11),(31,61,56),(36,20,13),(37,27,20),(38,34,27),(39,40,34),(40,47,40),(41,53,47),(42,59,53),(43,65,59),(44,21,14);
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
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_role`
--

LOCK TABLES `core_role` WRITE;
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
INSERT INTO `core_role` VALUES (2,'Coordinadora Sistemas Informáticos y Computación'),(3,'Director del Depto. de Ciencias de la Computación y Electrónica'),(7,'Responsable Sección Departamental Electrónica y Telecomunicaciones'),(5,'Responsable Sección Departamental Ingeniería de Sofware y Gestión de Tecnologías de la Información'),(6,'Responsable Sección Departamental Inteligencia Artificial'),(4,'Responsable Sección Departamental Tecnologías Avanzadas de la Web y Sistemas Basados en Conocimiento'),(1,'superadmin');
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
  `description` varchar(1020) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `name` (`name`),
  KEY `core_section_university_career_id_794330ec_fk_core_item` (`university_career_id`),
  CONSTRAINT `core_section_university_career_id_794330ec_fk_core_item` FOREIGN KEY (`university_career_id`) REFERENCES `core_item_category` (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_section`
--

LOCK TABLES `core_section` WRITE;
/*!40000 ALTER TABLE `core_section` DISABLE KEYS */;
INSERT INTO `core_section` VALUES (1,'Inteligencia Artificial',1,'La inteligencia artificial (IA) es una de las ramas de la Informática, con fuertes raíces en otras áreas como la lógica y las ciencias cognitivas. Se basa en la necesidad de validar el trabajo mediante programas.'),(3,'Tecnologías Avanzadas de la Web y Sistemas Basados en Conocimiento',1,'A través de esta sección se pretende dar una visión global de las tecnologías y tendencias actuales para el desarrollo software basado en Internet, así como de las arquitecturas web y metodologías actuales para la construcción de aplicaciones y soluciones en este ámbito.'),(4,'Electrónica y Telecomunicaciones',1,'Sección encargada del estudio de las implicaciones que se tiene desde la electrónica y las telecomunicaciones en los sistemas informáticos y las ciencias de la computación.'),(5,'Ingeniería de Software y Gestión de Tecnologías de la Información',1,'Seccion responsable de la formación de estudiantes capaces de brindar soluciones de software confiables y de calidad aplicando métodos de ingeniería.');
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_subject_matter`
--

LOCK TABLES `core_subject_matter` WRITE;
/*!40000 ALTER TABLE `core_subject_matter` DISABLE KEYS */;
INSERT INTO `core_subject_matter` VALUES (1,'Lógica de la Programación',1,1),(2,'Fundamentos Informáticos',1,1),(3,'Fundamentos Matemáticos',1,1),(4,'Desarrollo Espiritual I',1,1),(5,'Emprendimiento',1,1),(6,'Realidad Nacional y Ambiental',1,1),(7,'Expresión Oral y Escrita',1,1),(8,'Fundamentos de Programación',2,1),(9,'Contabilidad',2,1),(10,'Matemáticas Discretas',2,1),(11,'Desarrollo Espiritual II',2,1),(12,'Inglés I',2,1),(13,'Gestión Productiva 1.1 Pasantía en Cittes',2,1),(14,'Estructura de Datos y Algoritmos',3,1),(15,'Programación de Algoritmos',3,1),(16,'Física',3,1),(17,'Cálculo',3,1),(18,'Desarrollo Espiritual III',3,1),(19,'Inglés II',3,1),(20,'Gestión Productiva 1.2 Pasantía en Cittes',3,1),(21,'Programación Avanzada',4,1),(22,'Electrónica Digital',4,1),(23,'Estadística',4,1),(24,'Organización y Administración Empresarial',4,1),(25,'Libre Configuración 1',4,1),(26,'Inglés III',4,1),(27,'Gestión Productiva 1.3 Formación en Academias',4,1),(28,'Arquitectura de Computadores',5,1),(29,'Fundamentos de Bases de Datos',5,1),(30,'Economía, Finanzas e Inversiones',5,1),(31,'Métodos Cuantitativos',5,1),(32,'Libre Configuración 2',5,1),(33,'Inglés IV',5,1),(34,'Gestión Productiva 2.1 Práctica en Cittes',5,1),(35,'Fundamentos de Ingeniería de Software',6,1),(36,'Sistemas Operativos',6,1),(37,'Bases de Datos Avanzadas',6,1),(38,'Libre Configuración 3',6,1),(39,'Complementaria 1',6,1),(40,'Gestión Productiva 2.2 Práctica en Cittes',6,1),(41,'Fundamentos de Redes y Telecomunicaciones',7,1),(42,'Teoría de Autómatas y Compiladores',7,1),(43,'Gestión de Proyectos',7,1),(44,'Ingeniería de Requisitos',7,1),(45,'Libre Configuración 4',7,1),(46,'Complementaria 2',7,1),(47,'Gestión Productiva 3.1 Formación en Academias',7,1),(48,'Ingeniería Web',8,1),(49,'Gestión de Tecnologías de la Información',8,1),(50,'Redes y Sistemas Distribuidos',8,1),(51,'Libre Configuración 5',8,1),(52,'Complementaria 3',8,1),(53,'Gestión Productiva 3.2 Práctica en Cittes',8,1),(54,'Arquitectura y Computación Paralela',9,1),(55,'Arquitectura y Seguridad de Redes',9,1),(56,'Inteligencia Artificial',9,1),(57,'Arquitectura de Aplicaciones',9,1),(58,'Libre Configuración 6',9,1),(59,'GP Proyecto Fin de Carrera 4.1',9,1),(60,'Procesos de Ingeniería de Software',10,1),(61,'IA Avanzado',10,1),(62,'Sistemas Basados en Conocimiento',10,1),(63,'Auditoría Informática',10,1),(64,'Libre Configuración 7',10,1),(65,'GP Proyecto Fin de Carrera 4.2',10,1),(69,'Prórroga I',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_user`
--

LOCK TABLES `core_user` WRITE;
/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` VALUES (1,'pbkdf2_sha256$120000$RFM54yk8DFfO$mUgLNILzjpAjc0GbcxpKuLCL0zsiFOE3oNldx1Nvb8Q=','2020-08-28 14:22:44.706380','renatojobal','renatojobal@gmail.com',1,1,1,'2019-11-30 06:26:22.000000','2019-11-30 06:26:22.000000',1),(2,'pbkdf2_sha256$120000$ITEgWjbJzSER$wYEcKpK/5m/kzAyvV9zJBhu6PYy9TeplCUwQsIUpxa4=','2020-08-24 16:23:59.840597','jose','jose@gmail.com',1,1,1,'2019-11-30 06:31:37.000000','2019-11-30 06:31:37.000000',2),(3,'pbkdf2_sha256$120000$dHxWGqmjMqkR$V6FOZQLAeLxxwiHf95gxd0JYcWND9iQJgMYReEkHxng=','2020-01-10 21:51:57.604500','william','superadmin@utpl.edu.ec',0,0,1,'2019-12-02 03:06:07.386706','2019-12-02 03:06:07.386716',3),(4,'pbkdf2_sha256$120000$fcMAg9a8ZRaD$qwZPOYBOEotSeUu2Nel2kLqQ0vHvWGK+dyNFdenkIu8=','2020-05-07 19:15:55.000000','fernanda','fmsoto@utpl.edu.ec',0,0,1,'2019-12-02 03:07:50.000000','2019-12-02 03:07:50.000000',4),(7,'Password11','2020-08-24 16:21:12.000000','marco','marco@mail.com',1,0,1,'2020-08-24 16:20:37.000000','2020-08-24 16:20:37.000000',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-30 16:45:40.194780','1','Role object (1)',1,'[{\"added\": {}}]',23,1),(2,'2019-11-30 16:46:06.151459','2','Role object (2)',1,'[{\"added\": {}}]',23,1),(3,'2019-11-30 18:03:35.315724','3','Admin Admin',1,'[{\"added\": {}}]',17,1),(4,'2019-11-30 18:03:45.166305','3','superadmin@utpl.edu.ec',1,'[{\"added\": {}}]',7,1),(5,'2019-11-30 18:04:10.834564','3','superadmin@utpl.edu.ec',3,'',7,1),(6,'2019-11-30 18:05:29.899600','4','Fernanda Soto',1,'[{\"added\": {}}]',17,1),(7,'2019-11-30 18:21:13.748930','2','jose@gmail.com',2,'[]',7,1),(8,'2019-11-30 18:21:22.641016','1','renatojobal@gmail.com',2,'[]',7,1),(9,'2019-12-01 16:55:55.129154','1','Titulación',1,'[{\"added\": {}}]',8,2),(10,'2019-12-01 16:56:18.640807','2','Tipo de contenido',1,'[{\"added\": {}}]',8,2),(11,'2019-12-01 16:56:36.440395','3','Tipo de contacto',1,'[{\"added\": {}}]',8,2),(12,'2019-12-06 06:02:07.804137','1','Person_Role object (1)',1,'[{\"added\": {}}]',20,1),(13,'2019-12-06 06:02:30.746351','2','Person_Role object (2)',1,'[{\"added\": {}}]',20,1),(14,'2019-12-06 06:02:30.989893','3','Person_Role object (3)',1,'[{\"added\": {}}]',20,1),(15,'2019-12-06 06:02:54.047752','3','Person_Role object (3)',3,'',20,1),(16,'2019-12-10 20:33:52.893632','4','Fernanda Soto',2,'[{\"changed\": {\"fields\": [\"second_last_name\"]}}]',17,2),(17,'2019-12-11 15:13:49.447842','4','Periodo Académico',1,'[{\"added\": {}}]',8,2),(18,'2019-12-11 15:41:42.525433','2','Octubre 2019 - Febrero 2020',1,'[{\"added\": {}}]',15,2),(19,'2019-12-11 15:42:08.416774','3','Video',1,'[{\"added\": {}}]',15,2),(20,'2019-12-11 15:48:14.363927','1','Group object (1)',1,'[{\"added\": {}}]',12,2),(21,'2019-12-11 15:48:58.905643','2','Group object (2)',1,'[{\"added\": {}}]',12,2),(22,'2019-12-11 16:22:53.551645','4','Correo electrónico',1,'[{\"added\": {}}]',15,2),(23,'2019-12-11 16:23:10.836407','5','Extensión',1,'[{\"added\": {}}]',15,2),(24,'2019-12-11 16:23:47.757102','1','Person_Contact object (1)',1,'[{\"added\": {}}]',18,2),(25,'2019-12-11 16:25:29.162359','2','Person_Contact object (2)',1,'[{\"added\": {}}]',18,2),(26,'2019-12-14 23:08:57.404662','5','userPrueba@gmail.com',1,'[{\"added\": {}}]',7,3),(27,'2019-12-16 17:10:29.154428','5','userPrueba@gmail.com',3,'',7,3),(28,'2019-12-22 02:56:05.877253','3','Person_Role object (3)',1,'[{\"added\": {}}]',20,3),(29,'2020-01-17 17:43:15.254796','10','Marco Polo',1,'[{\"added\": {}}]',17,1),(30,'2020-01-17 18:16:25.323266','5','marco@email.com',1,'[{\"added\": {}}]',7,1),(31,'2020-01-17 18:17:25.829978','10','Arquitectura',1,'[{\"added\": {}}]',15,1),(32,'2020-01-31 16:10:23.405332','12','Armando Cabrera',1,'[{\"added\": {}}]',17,2),(33,'2020-01-31 16:10:54.427958','13','Jorge Lopez',1,'[{\"added\": {}}]',17,2),(34,'2020-01-31 16:11:35.821101','14','Romel Torres',1,'[{\"added\": {}}]',17,2),(35,'2020-01-31 16:12:20.267883','15','María Mora',1,'[{\"added\": {}}]',17,2),(36,'2020-01-31 16:15:54.885934','16','Guido Ríofrío',1,'[{\"added\": {}}]',17,2),(37,'2020-01-31 16:16:23.844368','17','Francisco Sandoval',1,'[{\"added\": {}}]',17,2),(38,'2020-01-31 16:16:48.535493','18','Segundo Benítez',1,'[{\"added\": {}}]',17,2),(39,'2020-01-31 16:17:11.327447','19','Janneth Chicaiza',1,'[{\"added\": {}}]',17,2),(40,'2020-01-31 16:17:29.720489','20','Fanny Cevallos',1,'[{\"added\": {}}]',17,2),(41,'2020-01-31 16:17:47.845827','21','Priscila Valdiviezo',1,'[{\"added\": {}}]',17,2),(42,'2020-01-31 16:18:06.725991','22','Samanta Cueva',1,'[{\"added\": {}}]',17,2),(43,'2020-01-31 16:18:29.398206','23','Karla Romero',1,'[{\"added\": {}}]',17,2),(44,'2020-01-31 16:18:50.706020','24','Marco Abad',1,'[{\"added\": {}}]',17,2),(45,'2020-01-31 16:19:14.223075','25','Martha Agila',1,'[{\"added\": {}}]',17,2),(46,'2020-01-31 16:19:42.759720','26','René Elizalde',1,'[{\"added\": {}}]',17,2),(47,'2020-01-31 16:20:05.310885','27','Omar Ruiz',1,'[{\"added\": {}}]',17,2),(48,'2020-01-31 16:20:26.266529','28','Luis Barba',1,'[{\"added\": {}}]',17,2),(49,'2020-01-31 16:20:47.119006','29','Irma Cadme',1,'[{\"added\": {}}]',17,2),(50,'2020-01-31 16:21:07.518537','30','Jorge Cordero',1,'[{\"added\": {}}]',17,2),(51,'2020-01-31 16:21:32.062903','31','Lorena Condolo',1,'[{\"added\": {}}]',17,2),(52,'2020-01-31 16:21:55.581236','32','Verónica Segarra',1,'[{\"added\": {}}]',17,2),(53,'2020-01-31 16:22:11.218036','33','Angel Encalada',1,'[{\"added\": {}}]',17,2),(54,'2020-01-31 16:22:29.430570','34','Liliana Enciso',1,'[{\"added\": {}}]',17,2),(55,'2020-01-31 16:22:48.847637','35','María Espinosa',1,'[{\"added\": {}}]',17,2),(56,'2020-01-31 16:23:25.553191','36','Alexandra Gonzalz',1,'[{\"added\": {}}]',17,2),(57,'2020-01-31 16:23:45.946423','37','Franco Guamán',1,'[{\"added\": {}}]',17,2),(58,'2020-01-31 16:24:46.640350','38','Gladys Tenesaca',1,'[{\"added\": {}}]',17,2),(59,'2020-01-31 16:25:05.975230','39','Pedro Irene',1,'[{\"added\": {}}]',17,2),(60,'2020-01-31 16:25:23.049491','40','Dunia Jara',1,'[{\"added\": {}}]',17,2),(61,'2020-01-31 16:25:40.288719','41','Danilo Jaramillo',1,'[{\"added\": {}}]',17,2),(62,'2020-01-31 16:25:57.604363','42','Vicente Martínez',1,'[{\"added\": {}}]',17,2),(63,'2020-01-31 16:26:23.239094','43','Juan Morocho',1,'[{\"added\": {}}]',17,2),(64,'2020-01-31 16:26:46.698036','44','Manuel Quiñones',1,'[{\"added\": {}}]',17,2),(65,'2020-01-31 16:27:06.387115','45','Ramiro Ramirez',1,'[{\"added\": {}}]',17,2),(66,'2020-01-31 16:27:32.177466','46','Ruth Reategui',1,'[{\"added\": {}}]',17,2),(67,'2020-01-31 16:27:51.305448','47','Germania Rodríguez',1,'[{\"added\": {}}]',17,2),(68,'2020-01-31 16:28:08.363410','48','Katty Rohoden',1,'[{\"added\": {}}]',17,2),(69,'2020-01-31 16:28:25.296292','49','Audrey Romero',1,'[{\"added\": {}}]',17,2),(70,'2020-01-31 16:28:40.154044','50','Celia Sarango',1,'[{\"added\": {}}]',17,2),(71,'2020-01-31 16:28:55.361004','51','Manuel Sucunuta',1,'[{\"added\": {}}]',17,2),(72,'2020-01-31 16:29:09.432877','52','Juan Torres',1,'[{\"added\": {}}]',17,2),(73,'2020-01-31 16:29:24.523595','53','Tuesman Castillo',1,'[{\"added\": {}}]',17,2),(74,'2020-01-31 16:29:44.002134','54','Marlon Viña',1,'[{\"added\": {}}]',17,2),(75,'2020-01-31 16:29:59.316153','55','María Cabrera',1,'[{\"added\": {}}]',17,2),(76,'2020-01-31 16:30:16.338397','56','Roddy Correa',1,'[{\"added\": {}}]',17,2),(77,'2020-01-31 16:30:29.898213','57','Javier Martínez',1,'[{\"added\": {}}]',17,2),(78,'2020-01-31 16:30:42.326189','58','Maza Byron',1,'[{\"added\": {}}]',17,2),(79,'2020-01-31 16:30:53.070321','59','Lady Sanmartín',1,'[{\"added\": {}}]',17,2),(80,'2020-01-31 16:33:18.383244','60','Sofia Sanz',1,'[{\"added\": {}}]',17,2),(81,'2020-01-31 16:33:48.233762','61','Holger Cuadrado',1,'[{\"added\": {}}]',17,2),(82,'2020-01-31 16:40:27.129543','3','Person_Contact object (3)',1,'[{\"added\": {}}]',18,2),(83,'2020-01-31 16:40:50.813285','62','Katherine Soto',1,'[{\"added\": {}}]',17,2),(84,'2020-01-31 16:42:49.182869','63','Alicia Arciniegas',1,'[{\"added\": {}}]',17,2),(85,'2020-01-31 16:43:06.475853','64','Eduardo Aguirre',1,'[{\"added\": {}}]',17,2),(86,'2020-01-31 16:43:25.856467','65','Diego Gonzalez',1,'[{\"added\": {}}]',17,2),(87,'2020-01-31 16:43:39.626813','66','Cristian Balcazar',1,'[{\"added\": {}}]',17,2),(88,'2020-01-31 16:44:02.100120','67','Carlos Bermeo',1,'[{\"added\": {}}]',17,2),(89,'2020-01-31 16:44:17.392077','68','Claudia Cartuche',1,'[{\"added\": {}}]',17,2),(90,'2020-01-31 16:44:19.060402','4','Person_Contact object (4)',1,'[{\"added\": {}}]',18,2),(91,'2020-01-31 16:44:37.058159','69','Ramiro Correa',1,'[{\"added\": {}}]',17,2),(92,'2020-01-31 16:44:59.547698','70','Marlon Chamba',1,'[{\"added\": {}}]',17,2),(93,'2020-01-31 16:45:18.539287','71','Maria Cuenca',1,'[{\"added\": {}}]',17,2),(94,'2020-01-31 16:45:34.794210','72','Leonardo Chavez',1,'[{\"added\": {}}]',17,2),(95,'2020-01-31 16:45:41.077693','5','Person_Contact object (5)',1,'[{\"added\": {}}]',18,2),(96,'2020-01-31 16:45:55.477114','73','Maria Delgado',1,'[{\"added\": {}}]',17,2),(97,'2020-01-31 16:46:11.942056','74','Diego Espinosa',1,'[{\"added\": {}}]',17,2),(98,'2020-01-31 16:46:25.242597','6','Person_Contact object (6)',1,'[{\"added\": {}}]',18,2),(99,'2020-01-31 16:46:31.518034','75','Jose Galarza',1,'[{\"added\": {}}]',17,2),(100,'2020-01-31 16:47:13.482221','7','Person_Contact object (7)',1,'[{\"added\": {}}]',18,2),(101,'2020-01-31 16:47:28.398857','8','Person_Contact object (8)',1,'[{\"added\": {}}]',18,2),(102,'2020-01-31 16:47:28.703323','76','Maria Guajala',1,'[{\"added\": {}}]',17,2),(103,'2020-01-31 16:47:43.266721','77','Iliana Herrera',1,'[{\"added\": {}}]',17,2),(104,'2020-01-31 16:48:02.939624','78','Silvia Malo',1,'[{\"added\": {}}]',17,2),(105,'2020-01-31 16:48:09.477153','9','Person_Contact object (9)',1,'[{\"added\": {}}]',18,2),(106,'2020-01-31 16:48:18.324586','79','Carlos Mena',1,'[{\"added\": {}}]',17,2),(107,'2020-01-31 16:48:33.244281','80','Cueva Monteros',1,'[{\"added\": {}}]',17,2),(108,'2020-01-31 16:48:50.196783','81','Ruth Simaluiza',1,'[{\"added\": {}}]',17,2),(109,'2020-01-31 16:48:55.674158','10','Person_Contact object (10)',1,'[{\"added\": {}}]',18,2),(110,'2020-01-31 16:49:07.369495','82','Lorena Alvarado',1,'[{\"added\": {}}]',17,2),(111,'2020-01-31 16:49:17.530654','11','Person_Contact object (11)',1,'[{\"added\": {}}]',18,2),(112,'2020-01-31 16:49:27.324539','83','Maria Camargo',1,'[{\"added\": {}}]',17,2),(113,'2020-01-31 16:50:20.073481','84','Valentina Dall',1,'[{\"added\": {}}]',17,2),(114,'2020-01-31 16:50:35.123623','85','Rosa Medina',1,'[{\"added\": {}}]',17,2),(115,'2020-01-31 16:50:42.947669','12','Person_Contact object (12)',1,'[{\"added\": {}}]',18,2),(116,'2020-01-31 16:50:53.349723','86','Alexandra Moncayo',1,'[{\"added\": {}}]',17,2),(117,'2020-01-31 16:51:11.750262','87','Veronica Noriega',1,'[{\"added\": {}}]',17,2),(118,'2020-01-31 16:51:25.340062','88','Maria Punin',1,'[{\"added\": {}}]',17,2),(119,'2020-01-31 16:51:27.849965','13','Person_Contact object (13)',1,'[{\"added\": {}}]',18,2),(120,'2020-01-31 16:51:38.061958','89','Sandra Valarezo',1,'[{\"added\": {}}]',17,2),(121,'2020-01-31 16:51:51.861140','14','Person_Contact object (14)',1,'[{\"added\": {}}]',18,2),(122,'2020-01-31 16:55:58.804186','15','Person_Contact object (15)',1,'[{\"added\": {}}]',18,2),(123,'2020-01-31 16:57:36.365095','16','Person_Contact object (16)',1,'[{\"added\": {}}]',18,2),(124,'2020-01-31 16:57:48.126958','17','Person_Contact object (17)',1,'[{\"added\": {}}]',18,2),(125,'2020-01-31 16:58:02.212612','18','Person_Contact object (18)',1,'[{\"added\": {}}]',18,2),(126,'2020-01-31 16:58:21.915898','19','Person_Contact object (19)',1,'[{\"added\": {}}]',18,2),(127,'2020-01-31 16:58:33.830287','20','Person_Contact object (20)',1,'[{\"added\": {}}]',18,2),(128,'2020-01-31 16:58:45.494856','21','Person_Contact object (21)',1,'[{\"added\": {}}]',18,2),(129,'2020-01-31 16:58:55.189656','22','Person_Contact object (22)',1,'[{\"added\": {}}]',18,2),(130,'2020-01-31 16:59:25.843734','23','Person_Contact object (23)',1,'[{\"added\": {}}]',18,2),(131,'2020-01-31 16:59:39.796305','24','Person_Contact object (24)',1,'[{\"added\": {}}]',18,2),(132,'2020-01-31 16:59:51.350692','25','Person_Contact object (25)',1,'[{\"added\": {}}]',18,2),(133,'2020-01-31 17:00:04.374025','26','Person_Contact object (26)',1,'[{\"added\": {}}]',18,2),(134,'2020-01-31 17:00:14.997331','27','Person_Contact object (27)',1,'[{\"added\": {}}]',18,2),(135,'2020-01-31 17:00:34.613559','28','Person_Contact object (28)',1,'[{\"added\": {}}]',18,2),(136,'2020-01-31 17:00:49.880496','29','Person_Contact object (29)',1,'[{\"added\": {}}]',18,2),(137,'2020-01-31 17:01:02.168952','30','Person_Contact object (30)',1,'[{\"added\": {}}]',18,2),(138,'2020-01-31 17:01:14.132594','31','Person_Contact object (31)',1,'[{\"added\": {}}]',18,2),(139,'2020-01-31 17:01:25.741202','32','Person_Contact object (32)',1,'[{\"added\": {}}]',18,2),(140,'2020-01-31 17:02:18.814272','33','Person_Contact object (33)',1,'[{\"added\": {}}]',18,2),(141,'2020-01-31 17:02:39.919338','34','Person_Contact object (34)',1,'[{\"added\": {}}]',18,2),(142,'2020-01-31 17:02:54.524522','35','Person_Contact object (35)',1,'[{\"added\": {}}]',18,2),(143,'2020-01-31 17:03:11.100886','36','Person_Contact object (36)',1,'[{\"added\": {}}]',18,2),(144,'2020-01-31 17:03:41.221016','37','Person_Contact object (37)',1,'[{\"added\": {}}]',18,2),(145,'2020-01-31 17:03:55.325100','38','Person_Contact object (38)',1,'[{\"added\": {}}]',18,2),(146,'2020-01-31 17:04:10.518964','39','Person_Contact object (39)',1,'[{\"added\": {}}]',18,2),(147,'2020-01-31 17:04:27.044513','40','Person_Contact object (40)',1,'[{\"added\": {}}]',18,2),(148,'2020-01-31 17:04:44.933214','41','Person_Contact object (41)',1,'[{\"added\": {}}]',18,2),(149,'2020-01-31 17:05:08.062673','42','Person_Contact object (42)',1,'[{\"added\": {}}]',18,2),(150,'2020-01-31 17:05:30.014595','43','Person_Contact object (43)',1,'[{\"added\": {}}]',18,2),(151,'2020-01-31 17:05:42.582033','44','Person_Contact object (44)',1,'[{\"added\": {}}]',18,2),(152,'2020-01-31 17:05:53.720239','45','Person_Contact object (45)',1,'[{\"added\": {}}]',18,2),(153,'2020-01-31 17:06:09.709073','46','Person_Contact object (46)',1,'[{\"added\": {}}]',18,2),(154,'2020-01-31 17:06:45.716770','47','Person_Contact object (47)',1,'[{\"added\": {}}]',18,2),(155,'2020-01-31 17:07:01.189751','48','Person_Contact object (48)',1,'[{\"added\": {}}]',18,2),(156,'2020-01-31 17:07:16.119134','49','Person_Contact object (49)',1,'[{\"added\": {}}]',18,2),(157,'2020-01-31 17:07:30.652680','50','Person_Contact object (50)',1,'[{\"added\": {}}]',18,2),(158,'2020-01-31 17:07:47.903769','51','Person_Contact object (51)',1,'[{\"added\": {}}]',18,2),(159,'2020-01-31 17:08:05.298721','52','Person_Contact object (52)',1,'[{\"added\": {}}]',18,2),(160,'2020-01-31 17:10:57.038570','53','Person_Contact object (53)',1,'[{\"added\": {}}]',18,2),(161,'2020-01-31 17:11:19.631951','54','Person_Contact object (54)',1,'[{\"added\": {}}]',18,2),(162,'2020-01-31 17:11:34.622192','55','Person_Contact object (55)',1,'[{\"added\": {}}]',18,2),(163,'2020-01-31 17:12:07.190426','56','Person_Contact object (56)',1,'[{\"added\": {}}]',18,2),(164,'2020-01-31 17:12:27.661321','57','Person_Contact object (57)',1,'[{\"added\": {}}]',18,2),(165,'2020-01-31 17:12:39.566724','58','Person_Contact object (58)',1,'[{\"added\": {}}]',18,2),(166,'2020-01-31 17:12:53.696485','59','Person_Contact object (59)',1,'[{\"added\": {}}]',18,2),(167,'2020-01-31 17:13:04.352584','60','Person_Contact object (60)',1,'[{\"added\": {}}]',18,2),(168,'2020-01-31 17:13:17.773965','61','Person_Contact object (61)',1,'[{\"added\": {}}]',18,2),(169,'2020-01-31 17:13:35.182269','62','Person_Contact object (62)',1,'[{\"added\": {}}]',18,2),(170,'2020-01-31 17:13:50.654643','63','Person_Contact object (63)',1,'[{\"added\": {}}]',18,2),(171,'2020-01-31 17:14:09.824360','64','Person_Contact object (64)',1,'[{\"added\": {}}]',18,2),(172,'2020-01-31 17:14:25.271686','65','Person_Contact object (65)',1,'[{\"added\": {}}]',18,2),(173,'2020-01-31 17:14:45.581802','66','Person_Contact object (66)',1,'[{\"added\": {}}]',18,2),(174,'2020-01-31 17:15:08.369533','67','Person_Contact object (67)',1,'[{\"added\": {}}]',18,2),(175,'2020-01-31 17:15:23.078755','68','Person_Contact object (68)',1,'[{\"added\": {}}]',18,2),(176,'2020-01-31 17:15:48.073488','69','Person_Contact object (69)',1,'[{\"added\": {}}]',18,2),(177,'2020-01-31 17:16:01.256551','70','Person_Contact object (70)',1,'[{\"added\": {}}]',18,2),(178,'2020-01-31 17:16:15.581494','71','Person_Contact object (71)',1,'[{\"added\": {}}]',18,2),(179,'2020-01-31 17:16:30.358707','72','Person_Contact object (72)',1,'[{\"added\": {}}]',18,2),(180,'2020-01-31 17:17:16.815147','73','Person_Contact object (73)',1,'[{\"added\": {}}]',18,2),(181,'2020-01-31 17:17:36.534717','74','Person_Contact object (74)',1,'[{\"added\": {}}]',18,2),(182,'2020-01-31 17:18:25.757650','75','Person_Contact object (75)',1,'[{\"added\": {}}]',18,2),(183,'2020-01-31 17:18:40.802309','76','Person_Contact object (76)',1,'[{\"added\": {}}]',18,2),(184,'2020-01-31 17:18:52.984774','77','Person_Contact object (77)',1,'[{\"added\": {}}]',18,2),(185,'2020-01-31 17:19:05.502408','78','Person_Contact object (78)',1,'[{\"added\": {}}]',18,2),(186,'2020-01-31 17:19:19.374737','79','Person_Contact object (79)',1,'[{\"added\": {}}]',18,2),(187,'2020-01-31 17:19:31.414501','80','Person_Contact object (80)',1,'[{\"added\": {}}]',18,2),(188,'2020-01-31 17:19:47.369239','81','Person_Contact object (81)',1,'[{\"added\": {}}]',18,2),(189,'2020-01-31 17:19:58.792796','82','Person_Contact object (82)',1,'[{\"added\": {}}]',18,2),(190,'2020-01-31 18:02:38.607194','83','Person_Contact object (83)',1,'[{\"added\": {}}]',18,2),(191,'2020-01-31 18:03:03.611565','84','Person_Contact object (84)',1,'[{\"added\": {}}]',18,2),(192,'2020-01-31 18:03:52.083170','85','Person_Contact object (85)',1,'[{\"added\": {}}]',18,2),(193,'2020-01-31 18:04:52.172216','86','Person_Contact object (86)',1,'[{\"added\": {}}]',18,2),(194,'2020-01-31 18:05:14.513127','87','Person_Contact object (87)',1,'[{\"added\": {}}]',18,2),(195,'2020-01-31 18:05:33.733724','88','Person_Contact object (88)',1,'[{\"added\": {}}]',18,2),(196,'2020-01-31 18:06:02.125088','89','Person_Contact object (89)',1,'[{\"added\": {}}]',18,2),(197,'2020-01-31 18:07:33.637334','85','Person_Contact object (85)',2,'[{\"changed\": {\"fields\": [\"contact_type_id\"]}}]',18,2),(198,'2020-01-31 18:07:49.743791','84','Person_Contact object (84)',2,'[{\"changed\": {\"fields\": [\"contact_type_id\"]}}]',18,2),(199,'2020-01-31 18:10:02.763489','85','Person_Contact object (85)',2,'[{\"changed\": {\"fields\": [\"contact\"]}}]',18,2),(200,'2020-01-31 18:11:19.562208','87','Person_Contact object (87)',2,'[{\"changed\": {\"fields\": [\"person_id\"]}}]',18,2),(201,'2020-01-31 18:11:37.998875','88','Person_Contact object (88)',2,'[{\"changed\": {\"fields\": [\"person_id\"]}}]',18,2),(202,'2020-01-31 18:11:52.663066','89','Person_Contact object (89)',2,'[]',18,2),(203,'2020-01-31 18:12:41.501645','90','Person_Contact object (90)',1,'[{\"added\": {}}]',18,2),(204,'2020-01-31 18:13:31.152682','91','Person_Contact object (91)',1,'[{\"added\": {}}]',18,2),(205,'2020-01-31 18:14:15.895654','92','Person_Contact object (92)',1,'[{\"added\": {}}]',18,2),(206,'2020-01-31 18:15:43.549362','93','Person_Contact object (93)',1,'[{\"added\": {}}]',18,2),(207,'2020-01-31 18:16:12.942378','94','Person_Contact object (94)',1,'[{\"added\": {}}]',18,2),(208,'2020-01-31 18:17:14.259788','95','Person_Contact object (95)',1,'[{\"added\": {}}]',18,2),(209,'2020-01-31 18:17:31.348981','96','Person_Contact object (96)',1,'[{\"added\": {}}]',18,2),(210,'2020-01-31 18:17:31.459805','97','Person_Contact object (97)',1,'[{\"added\": {}}]',18,2),(211,'2020-01-31 18:17:57.322227','98','Person_Contact object (98)',1,'[{\"added\": {}}]',18,2),(212,'2020-01-31 18:18:16.073627','99','Person_Contact object (99)',1,'[{\"added\": {}}]',18,2),(213,'2020-01-31 18:18:39.871371','100','Person_Contact object (100)',1,'[{\"added\": {}}]',18,2),(214,'2020-01-31 18:19:00.197292','101','Person_Contact object (101)',1,'[{\"added\": {}}]',18,2),(215,'2020-01-31 18:19:21.144394','102','Person_Contact object (102)',1,'[{\"added\": {}}]',18,2),(216,'2020-01-31 18:20:01.961395','103','Person_Contact object (103)',1,'[{\"added\": {}}]',18,2),(217,'2020-01-31 18:20:29.648749','104','Person_Contact object (104)',1,'[{\"added\": {}}]',18,2),(218,'2020-01-31 18:20:57.450636','105','Person_Contact object (105)',1,'[{\"added\": {}}]',18,2),(219,'2020-01-31 18:21:20.784210','106','Person_Contact object (106)',1,'[{\"added\": {}}]',18,2),(220,'2020-01-31 18:21:49.002124','107','Person_Contact object (107)',1,'[{\"added\": {}}]',18,2),(221,'2020-01-31 18:22:26.843385','108','Person_Contact object (108)',1,'[{\"added\": {}}]',18,2),(222,'2020-01-31 18:23:24.781904','36','Alexandra González',2,'[{\"changed\": {\"fields\": [\"first_last_name\"]}}]',17,2),(223,'2020-01-31 18:23:30.798222','109','Person_Contact object (109)',1,'[{\"added\": {}}]',18,2),(224,'2020-01-31 18:25:38.703160','110','Person_Contact object (110)',1,'[{\"added\": {}}]',18,2),(225,'2020-01-31 18:26:15.930026','111','Person_Contact object (111)',1,'[{\"added\": {}}]',18,2),(226,'2020-01-31 18:26:37.273729','112','Person_Contact object (112)',1,'[{\"added\": {}}]',18,2),(227,'2020-01-31 18:26:56.802339','113','Person_Contact object (113)',1,'[{\"added\": {}}]',18,2),(228,'2020-01-31 18:27:20.644630','114','Person_Contact object (114)',1,'[{\"added\": {}}]',18,2),(229,'2020-01-31 18:27:47.645267','115','Person_Contact object (115)',1,'[{\"added\": {}}]',18,2),(230,'2020-01-31 18:28:15.216803','116','Person_Contact object (116)',1,'[{\"added\": {}}]',18,2),(231,'2020-01-31 18:28:40.375840','117','Person_Contact object (117)',1,'[{\"added\": {}}]',18,2),(232,'2020-01-31 18:29:00.103465','118','Person_Contact object (118)',1,'[{\"added\": {}}]',18,2),(233,'2020-01-31 18:29:24.669717','119','Person_Contact object (119)',1,'[{\"added\": {}}]',18,2),(234,'2020-01-31 18:29:51.133425','120','Person_Contact object (120)',1,'[{\"added\": {}}]',18,2),(235,'2020-01-31 18:30:12.661182','121','Person_Contact object (121)',1,'[{\"added\": {}}]',18,2),(236,'2020-01-31 18:30:59.057060','122','Person_Contact object (122)',1,'[{\"added\": {}}]',18,2),(237,'2020-01-31 18:31:27.703521','123','Person_Contact object (123)',1,'[{\"added\": {}}]',18,2),(238,'2020-01-31 18:31:50.933941','124','Person_Contact object (124)',1,'[{\"added\": {}}]',18,2),(239,'2020-01-31 18:32:10.641782','125','Person_Contact object (125)',1,'[{\"added\": {}}]',18,2),(240,'2020-01-31 18:32:30.139293','126','Person_Contact object (126)',1,'[{\"added\": {}}]',18,2),(241,'2020-01-31 18:32:58.855613','127','Person_Contact object (127)',1,'[{\"added\": {}}]',18,2),(242,'2020-01-31 18:33:36.268216','128','Person_Contact object (128)',1,'[{\"added\": {}}]',18,2),(243,'2020-01-31 18:34:04.368234','129','Person_Contact object (129)',1,'[{\"added\": {}}]',18,2),(244,'2020-01-31 18:34:39.052366','130','Person_Contact object (130)',1,'[{\"added\": {}}]',18,2),(245,'2020-01-31 18:35:50.493587','58','Byron Maza',2,'[{\"changed\": {\"fields\": [\"first_name\", \"second_name\", \"first_last_name\", \"second_last_name\"]}}]',17,2),(246,'2020-01-31 18:35:57.731223','131','Person_Contact object (131)',1,'[{\"added\": {}}]',18,2),(247,'2020-01-31 18:36:20.120864','132','Person_Contact object (132)',1,'[{\"added\": {}}]',18,2),(248,'2020-01-31 20:23:11.515168','133','Person_Contact object (133)',1,'[{\"added\": {}}]',18,2),(249,'2020-01-31 20:23:30.784359','134','Person_Contact object (134)',1,'[{\"added\": {}}]',18,2),(250,'2020-01-31 20:24:05.942746','135','Person_Contact object (135)',1,'[{\"added\": {}}]',18,2),(251,'2020-01-31 20:28:37.265273','135','Person_Contact object (135)',2,'[]',18,2),(252,'2020-01-31 20:29:11.446297','136','Person_Contact object (136)',1,'[{\"added\": {}}]',18,2),(253,'2020-01-31 20:29:35.046838','137','Person_Contact object (137)',1,'[{\"added\": {}}]',18,2),(254,'2020-01-31 20:30:22.729973','138','Person_Contact object (138)',1,'[{\"added\": {}}]',18,2),(255,'2020-01-31 20:30:41.050244','139','Person_Contact object (139)',1,'[{\"added\": {}}]',18,2),(256,'2020-01-31 20:31:14.410433','140','Person_Contact object (140)',1,'[{\"added\": {}}]',18,2),(257,'2020-01-31 20:31:40.344022','141','Person_Contact object (141)',1,'[{\"added\": {}}]',18,2),(258,'2020-01-31 20:32:06.231169','142','Person_Contact object (142)',1,'[{\"added\": {}}]',18,2),(259,'2020-01-31 20:32:34.210769','143','Person_Contact object (143)',1,'[{\"added\": {}}]',18,2),(260,'2020-01-31 20:32:59.797692','144','Person_Contact object (144)',1,'[{\"added\": {}}]',18,2),(261,'2020-01-31 20:33:26.201273','145','Person_Contact object (145)',1,'[{\"added\": {}}]',18,2),(262,'2020-01-31 20:33:49.309626','146','Person_Contact object (146)',1,'[{\"added\": {}}]',18,2),(263,'2020-01-31 20:34:20.111526','147','Person_Contact object (147)',1,'[{\"added\": {}}]',18,2),(264,'2020-01-31 20:34:44.976321','148','Person_Contact object (148)',1,'[{\"added\": {}}]',18,2),(265,'2020-01-31 20:35:17.264258','149','Person_Contact object (149)',1,'[{\"added\": {}}]',18,2),(266,'2020-01-31 20:35:40.498054','150','Person_Contact object (150)',1,'[{\"added\": {}}]',18,2),(267,'2020-01-31 20:38:05.391442','78','Silvia Malo',2,'[]',17,2),(268,'2020-01-31 20:38:12.747654','151','Person_Contact object (151)',1,'[{\"added\": {}}]',18,2),(269,'2020-01-31 20:38:45.723263','152','Person_Contact object (152)',1,'[{\"added\": {}}]',18,2),(270,'2020-01-31 20:40:44.608592','80','Karina Monteros',2,'[{\"changed\": {\"fields\": [\"first_name\", \"second_name\", \"second_last_name\"]}}]',17,2),(271,'2020-01-31 20:40:56.695124','153','Person_Contact object (153)',1,'[{\"added\": {}}]',18,2),(272,'2020-01-31 20:41:49.250460','154','Person_Contact object (154)',1,'[{\"added\": {}}]',18,2),(273,'2020-01-31 20:43:09.774905','155','Person_Contact object (155)',1,'[{\"added\": {}}]',18,2),(274,'2020-01-31 20:43:46.281050','156','Person_Contact object (156)',1,'[{\"added\": {}}]',18,2),(275,'2020-01-31 20:44:20.302579','157','Person_Contact object (157)',1,'[{\"added\": {}}]',18,2),(276,'2020-01-31 20:44:58.193299','158','Person_Contact object (158)',1,'[{\"added\": {}}]',18,2),(277,'2020-01-31 20:45:34.759435','159','Person_Contact object (159)',1,'[{\"added\": {}}]',18,2),(278,'2020-01-31 20:46:16.034765','160','Person_Contact object (160)',1,'[{\"added\": {}}]',18,2),(279,'2020-01-31 20:47:06.870069','161','Person_Contact object (161)',1,'[{\"added\": {}}]',18,2),(280,'2020-01-31 20:47:30.818052','162','Person_Contact object (162)',1,'[{\"added\": {}}]',18,2),(281,'2020-02-01 22:22:34.432421','4','Section object (4)',3,'',24,2),(282,'2020-02-01 22:23:32.479984','1','Person_Section object (1)',3,'',21,2),(283,'2020-02-01 22:23:59.180752','3','Section object (3)',3,'',24,2),(284,'2020-02-01 22:48:33.943260','6','Menu',1,'[{\"added\": {}}]',8,1),(285,'2020-02-01 22:48:57.436499','7','Tipo de contenido media',1,'[{\"added\": {}}]',8,1),(286,'2020-02-03 15:36:03.113335','2','Person_Role object (2)',2,'[{\"changed\": {\"fields\": [\"university_career_id\"]}}]',20,1),(287,'2020-02-03 15:36:09.430615','1','Person_Role object (1)',2,'[{\"changed\": {\"fields\": [\"university_career_id\"]}}]',20,1),(288,'2020-02-03 19:37:21.572281','3','Section\'s name: Tecnologías Avanzadas de la Web y SBC, University Career: Sistemas Informáticos y Computación',1,'[{\"added\": {}}]',24,2),(289,'2020-02-03 19:37:47.470354','4','Section\'s name: Electrónica y Telecomunicaciones, University Career: Sistemas Informáticos y Computación',1,'[{\"added\": {}}]',24,2),(290,'2020-02-03 19:40:23.025431','5','Section\'s name: Ingeniería de Software y Gestión de Tecnologías de la Información, University Career: Sistemas Informáticos y Computación',1,'[{\"added\": {}}]',24,2),(291,'2020-02-03 19:41:00.648976','4','Person_Section object (4)',2,'[{\"changed\": {\"fields\": [\"section_id\"]}}]',21,2),(292,'2020-02-03 19:41:26.913063','5','Person_Section object (5)',3,'',21,2),(293,'2020-02-03 19:41:39.873824','4','Person_Section object (4)',2,'[]',21,2),(294,'2020-02-03 19:42:53.711154','2','Section\'s name: Tecnologías Avanzadas de la Web, University Career: Sistemas Informáticos y Computación',3,'',24,2),(295,'2020-02-03 19:43:36.139339','4','Person_Section object (4)',2,'[]',21,2),(296,'2020-02-03 19:43:47.001171','4','Person_Section object (4)',2,'[]',21,2),(297,'2020-02-03 19:44:04.890858','6','Person_Section object (6)',1,'[{\"added\": {}}]',21,2),(298,'2020-02-03 19:45:49.353207','7','Person_Section object (7)',1,'[{\"added\": {}}]',21,2),(299,'2020-02-03 19:46:20.222070','8','Person_Section object (8)',1,'[{\"added\": {}}]',21,2),(300,'2020-02-03 19:46:42.582222','9','Person_Section object (9)',1,'[{\"added\": {}}]',21,2),(301,'2020-02-03 19:46:57.886502','10','Person_Section object (10)',1,'[{\"added\": {}}]',21,2),(302,'2020-02-03 19:47:19.803630','11','Person_Section object (11)',1,'[{\"added\": {}}]',21,2),(303,'2020-02-03 19:48:22.930544','12','Person_Section object (12)',1,'[{\"added\": {}}]',21,2),(304,'2020-02-03 19:48:42.146126','13','Person_Section object (13)',1,'[{\"added\": {}}]',21,2),(305,'2020-02-03 19:49:39.948386','14','Person_Section object (14)',1,'[{\"added\": {}}]',21,2),(306,'2020-02-03 19:50:52.807452','15','Person_Section object (15)',1,'[{\"added\": {}}]',21,2),(307,'2020-02-03 19:51:05.701273','16','Person_Section object (16)',1,'[{\"added\": {}}]',21,2),(308,'2020-02-03 19:51:17.471036','17','Person_Section object (17)',1,'[{\"added\": {}}]',21,2),(309,'2020-02-03 19:51:47.274842','18','Person_Section object (18)',1,'[{\"added\": {}}]',21,2),(310,'2020-02-03 19:52:13.529835','19','Person_Section object (19)',1,'[{\"added\": {}}]',21,2),(311,'2020-02-03 19:52:37.116987','20','Person_Section object (20)',1,'[{\"added\": {}}]',21,2),(312,'2020-02-03 19:52:57.592712','20','Person_Section object (20)',2,'[]',21,2),(313,'2020-02-03 19:53:16.401940','21','Person_Section object (21)',1,'[{\"added\": {}}]',21,2),(314,'2020-02-03 19:53:50.204698','22','Person_Section object (22)',1,'[{\"added\": {}}]',21,2),(315,'2020-02-03 19:55:22.947863','23','Person_Section object (23)',1,'[{\"added\": {}}]',21,2),(316,'2020-02-03 19:56:21.102367','24','Person_Section object (24)',1,'[{\"added\": {}}]',21,2),(317,'2020-02-03 19:56:39.828835','25','Person_Section object (25)',1,'[{\"added\": {}}]',21,2),(318,'2020-02-03 19:57:06.251960','54','Marlon Viñan',2,'[{\"changed\": {\"fields\": [\"first_last_name\"]}}]',17,2),(319,'2020-02-03 19:57:19.636922','26','Person_Section object (26)',1,'[{\"added\": {}}]',21,2),(320,'2020-02-03 20:02:00.252747','27','Person_Section object (27)',1,'[{\"added\": {}}]',21,2),(321,'2020-02-03 20:02:25.792382','28','Person_Section object (28)',1,'[{\"added\": {}}]',21,2),(322,'2020-02-03 20:02:40.926904','29','Person_Section object (29)',1,'[{\"added\": {}}]',21,2),(323,'2020-02-03 20:03:00.322401','30','Person_Section object (30)',1,'[{\"added\": {}}]',21,2),(324,'2020-02-03 20:03:12.725666','31','Person_Section object (31)',1,'[{\"added\": {}}]',21,2),(325,'2020-02-03 20:03:49.106429','32','Person_Section object (32)',1,'[{\"added\": {}}]',21,2),(326,'2020-02-03 20:04:04.156912','33','Person_Section object (33)',1,'[{\"added\": {}}]',21,2),(327,'2020-02-03 20:04:18.052092','34','Person_Section object (34)',1,'[{\"added\": {}}]',21,2),(328,'2020-02-03 20:04:43.455226','35','Person_Section object (35)',1,'[{\"added\": {}}]',21,2),(329,'2020-02-03 20:05:23.874039','36','Person_Section object (36)',1,'[{\"added\": {}}]',21,2),(330,'2020-02-03 20:06:15.027193','37','Person_Section object (37)',1,'[{\"added\": {}}]',21,2),(331,'2020-02-03 20:06:48.772227','38','Person_Section object (38)',1,'[{\"added\": {}}]',21,2),(332,'2020-02-03 20:08:41.662219','90','Carlos Calderón',1,'[{\"added\": {}}]',17,2),(333,'2020-02-03 20:08:48.901227','39','Person_Section object (39)',1,'[{\"added\": {}}]',21,2),(334,'2020-02-03 20:10:02.745864','91','Ángel Valdivieso',1,'[{\"added\": {}}]',17,2),(335,'2020-02-03 20:10:08.762795','40','Person_Section object (40)',1,'[{\"added\": {}}]',21,2),(336,'2020-02-03 20:10:36.129905','41','Person_Section object (41)',1,'[{\"added\": {}}]',21,2),(337,'2020-02-03 20:10:48.095080','42','Person_Section object (42)',1,'[{\"added\": {}}]',21,2),(338,'2020-02-03 20:11:54.104369','92','José López',1,'[{\"added\": {}}]',17,2),(339,'2020-02-03 20:12:03.046461','43','Person_Section object (43)',1,'[{\"added\": {}}]',21,2),(340,'2020-02-03 20:12:47.740818','44','Person_Section object (44)',1,'[{\"added\": {}}]',21,2),(341,'2020-02-04 04:24:46.372443','3','Mensaje de bienvenida',1,'[{\"added\": {}}]',9,1),(342,'2020-02-04 04:25:15.165862','4','Mensaje de bienvenida',1,'[{\"added\": {}}]',9,1),(343,'2020-02-04 04:28:41.129869','93','Arq. Lopez Giordano',1,'[{\"added\": {}}]',17,1),(344,'2020-02-04 04:29:18.272281','4','Person_Role object (4)',1,'[{\"added\": {}}]',20,1),(345,'2020-02-04 04:30:30.354262','3','Path: http://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg',1,'[{\"added\": {}}]',19,1),(346,'2020-02-04 04:31:18.068090','163','Contact: 2498496153',1,'[{\"added\": {}}]',18,1),(347,'2020-02-07 15:13:47.515229','3','Mensaje de bienvenida',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(348,'2020-02-11 19:49:37.711960','4','fmsoto@utpl.edu.ec',2,'[{\"changed\": {\"fields\": [\"is_superuser\"]}}]',7,1),(349,'2020-02-14 04:26:15.336141','29','Menu',1,'[{\"added\": {}}]',15,1),(350,'2020-02-14 04:26:19.554898','1','Testimonios',1,'[{\"added\": {}}]',34,1),(351,'2020-02-14 13:59:44.565220','30','Noticia',1,'[{\"added\": {}}]',15,1),(352,'2020-02-14 14:00:30.770234','5','Noticia de prueba',1,'[{\"added\": {}}]',9,1),(353,'2020-02-14 14:01:24.896337','31','Testimonio',1,'[{\"added\": {}}]',15,1),(354,'2020-02-14 14:01:31.295886','6','Testimonio de una persona',1,'[{\"added\": {}}]',9,1),(355,'2020-02-14 14:02:54.211135','4','Mensaje de bienvenida',3,'',9,1),(356,'2020-02-14 14:03:04.954145','3','Mensaje de bienvenida',3,'',9,1),(357,'2020-02-14 14:04:06.062415','2','Noticias',1,'[{\"added\": {}}]',34,1),(358,'2020-02-14 14:04:26.676893','3','Pagina principal',1,'[{\"added\": {}}]',34,1),(359,'2020-02-14 14:18:33.094570','7','Mensaje de bienvenida',1,'[{\"added\": {}}]',9,1),(360,'2020-02-14 14:19:02.688266','8','Mensaje de bienvenida',1,'[{\"added\": {}}]',9,1),(361,'2020-02-17 15:38:22.728666','28','\'Desarrollo Espiritual I\' as requirement of \'Desarrollo Espiritual II\'',1,'[{\"added\": {}}]',22,2),(362,'2020-02-17 15:38:39.989231','29','\'Desarrollo Espiritual I\' as requirement of \'Desarrollo Espiritual III\'',1,'[{\"added\": {}}]',22,2),(363,'2020-02-17 15:38:51.768487','30','\'Desarrollo Espiritual II\' as requirement of \'Desarrollo Espiritual III\'',1,'[{\"added\": {}}]',22,2),(364,'2020-02-17 15:40:07.169829','31','\'Inteligencia Artificial\' as requirement of \'IA Avanzado\'',1,'[{\"added\": {}}]',22,2),(365,'2020-02-17 15:44:03.011490','1','\'Desarrollo Espiritual I\' as requirement of \'Desarrollo Espiritual III\'',3,'',22,2),(366,'2020-02-17 16:09:31.718323','6','Estudiantes Exponen sus Ideas',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',9,2),(367,'2020-02-17 17:00:11.653237','1','Section\'s name: Inteligencia Artificial, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(368,'2020-02-17 17:00:58.163142','3','Section\'s name: Tecnologías Avanzadas de la Web y SBC, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(369,'2020-02-17 17:01:41.824254','4','Section\'s name: Electrónica y Telecomunicaciones, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(370,'2020-02-17 17:02:14.699738','5','Section\'s name: Ingeniería de Software y Gestión de Tecnologías de la Información, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(371,'2020-02-17 17:02:54.184859','3','Section\'s name: Tecnologías Avanzadas de la Web y Sistema Basados en el Conocimiento, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',24,2),(372,'2020-02-17 17:03:23.500599','3','Section\'s name: Tecnologías Avanzadas de la Web y Sistema Basados en el Conocimiento, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(373,'2020-02-17 17:04:00.591674','3','Section\'s name: Tecnologías Avanzadas de la Web y Sistemas Basados en el Conocimiento, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"name\", \"description\"]}}]',24,2),(374,'2020-02-17 17:09:30.661700','32','\'Fundamentos Informáticos\' as requirement of \'Sistemas Operativos\'',1,'[{\"added\": {}}]',22,2),(375,'2020-02-17 17:09:49.427528','33','\'Fundamentos de Programación\' as requirement of \'Sistemas Operativos\'',1,'[{\"added\": {}}]',22,2),(376,'2020-02-17 17:11:29.412235','34','\'Programación de Algoritmos\' as requirement of \'Sistemas Operativos\'',1,'[{\"added\": {}}]',22,2),(377,'2020-02-17 17:11:39.784371','35','\'Estructura de Datos y Algoritmos\' as requirement of \'Sistemas Operativos\'',1,'[{\"added\": {}}]',22,2),(378,'2020-02-17 17:15:29.515420','36','\'Gestión Productiva 1.1 Pasantía en Cittes\' as requirement of \'Gestión Productiva 1.2 Pasantía en Cittes\'',1,'[{\"added\": {}}]',22,2),(379,'2020-02-17 17:15:41.045716','37','\'Gestión Productiva 1.2 Pasantía en Cittes\' as requirement of \'Gestión Productiva 1.3 Formación en Academias\'',1,'[{\"added\": {}}]',22,2),(380,'2020-02-17 17:16:01.789194','38','\'Gestión Productiva 1.3 Formación en Academias\' as requirement of \'Gestión Productiva 2.1 Práctica en Cittes\'',1,'[{\"added\": {}}]',22,2),(381,'2020-02-17 17:16:14.627636','39','\'Gestión Productiva 2.1 Práctica en Cittes\' as requirement of \'Gestión Productiva 2.2 Práctica en Cittes\'',1,'[{\"added\": {}}]',22,2),(382,'2020-02-17 17:16:35.708584','40','\'Gestión Productiva 2.2 Práctica en Cittes\' as requirement of \'Gestión Productiva 3.1 Formación en Academias\'',1,'[{\"added\": {}}]',22,2),(383,'2020-02-17 17:17:01.156769','41','\'Gestión Productiva 3.1 Formación en Academias\' as requirement of \'Gestión Productiva 3.2 Práctica en Cittes\'',1,'[{\"added\": {}}]',22,2),(384,'2020-02-17 17:17:29.550994','42','\'Gestión Productiva 3.2 Práctica en Cittes\' as requirement of \'GP Proyecto Fin de Carrera 4.1\'',1,'[{\"added\": {}}]',22,2),(385,'2020-02-17 17:18:14.345420','43','\'GP Proyecto Fin de Carrera 4.1\' as requirement of \'GP Proyecto Fin de Carrera 4.2\'',1,'[{\"added\": {}}]',22,2),(386,'2020-02-19 05:59:42.314419','1','Section\'s name: Inteligencia Artificial, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(387,'2020-02-19 06:44:13.281726','4','Section\'s name: Electrónica y Telecomunicaciones, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(388,'2020-02-19 06:52:18.347176','5','Section\'s name: Ingeniería de Software y Gestión de Tecnologías de la Información, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(389,'2020-02-19 06:56:20.655491','3','Section\'s name: Tecnologías Avanzadas de la Web y Sistemas Basados en el Conocimiento, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',24,2),(390,'2020-02-19 13:53:06.677820','6','Section\'s name: Nueva seccion de ayudantes de cátedra, University Career: Sistemas Informáticos y Computación',3,'',24,2),(391,'2020-02-19 13:53:39.718170','5','a',3,'',8,2),(392,'2020-02-19 14:03:14.789663','3','Section\'s name: Tecnologías Avanzadas de la Web y Sistemas Basados en Conocimiento, University Career: Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',24,2),(393,'2020-02-19 14:11:23.287144','8','Rol',1,'[{\"added\": {}}]',8,2),(394,'2020-02-19 14:23:05.121522','3','Role\'s name: Director departamental',1,'[{\"added\": {}}]',23,2),(395,'2020-02-19 14:26:07.285250','4','Role\'s name: Resp. Sec. Deptal. Tecnologias Avanzadas Web',1,'[{\"added\": {}}]',23,2),(396,'2020-02-19 14:27:20.326212','5','Role\'s name: Resp. Sec. Deptal.Ing Sofware y Gest Tec Inf',1,'[{\"added\": {}}]',23,2),(397,'2020-02-19 14:28:45.086155','6','Role\'s name: Resp. Sec. Deptal. Ingenieria Artificial',1,'[{\"added\": {}}]',23,2),(398,'2020-02-19 14:31:16.550138','7','Role\'s name: Resp. Sec. Deptal. Elec. y Telecomunicaciones',1,'[{\"added\": {}}]',23,2),(399,'2020-02-19 14:32:50.650851','6','Person_Role object (6)',1,'[{\"added\": {}}]',20,2),(400,'2020-02-19 14:33:50.659503','7','Person_Role object (7)',1,'[{\"added\": {}}]',20,2),(401,'2020-02-19 14:34:43.288953','8','Person_Role object (8)',1,'[{\"added\": {}}]',20,2),(402,'2020-02-19 14:35:32.643632','9','Person_Role object (9)',1,'[{\"added\": {}}]',20,2),(403,'2020-02-19 14:37:26.206291','10','Person_Role object (10)',1,'[{\"added\": {}}]',20,2),(404,'2020-02-19 14:38:35.767945','33','Inglés IV',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',25,2),(405,'2020-02-20 17:40:40.486045','4','Role\'s name: Responsable Sección Departamental Tecnologías Avanzadas de la Web y Sistemas Basados en Conocimiento',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,2),(406,'2020-02-20 17:41:20.694628','5','Role\'s name: Responsable Sección Departamental Ingeniería de Sofware y Gestión de Tecnologías de la Información',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,2),(407,'2020-02-20 17:41:54.907189','6','Role\'s name: Responsable Sección Departamental Inteligencia Artificial',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,2),(408,'2020-02-20 17:43:24.388963','7','Role\'s name: Responsable Sección Departamental Electrónica y Telecomunicaciones',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,2),(409,'2020-02-20 17:44:05.519380','3','Role\'s name: Director del Depto. de Ciencias de la Computación y Electrónica',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,2),(410,'2020-02-20 17:44:45.449648','2','Role\'s name: Coordinadora Sistemas Informáticos y Computación',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,2),(411,'2020-02-20 17:45:07.753897','9','Person_Role object (9)',2,'[]',20,2),(412,'2020-02-20 17:45:16.043954','1','Person_Role object (1)',2,'[]',20,2),(413,'2020-02-20 17:45:23.785015','2','Person_Role object (2)',2,'[]',20,2),(414,'2020-02-20 17:46:04.175596','3','Person_Role object (3)',2,'[]',20,2),(415,'2020-02-20 17:46:12.235709','3','Person_Role object (3)',2,'[]',20,2),(416,'2020-02-20 17:46:30.914129','4','Person_Role object (4)',3,'',20,2),(417,'2020-07-25 15:48:48.121273','d96125e5587e07dd78d80b587ee5514f38cef87a','d96125e5587e07dd78d80b587ee5514f38cef87a',1,'[{\"added\": {}}]',26,2),(418,'2020-08-24 16:14:22.383577','13','Desarrollo',1,'[{\"added\": {}}]',34,2),(419,'2020-08-24 16:20:05.337077','6','ejemplo@gmail.com',3,'',7,2),(420,'2020-08-24 16:20:27.104185','5','marco@email.com',3,'',7,2),(421,'2020-08-24 16:22:16.463374','7','marco@mail.com',1,'[{\"added\": {}}]',7,2),(422,'2020-08-24 16:25:05.326222','4','fmsoto@utpl.edu.ec',2,'[]',7,2),(423,'2020-08-24 16:26:51.971366','7','marco@mail.com',2,'[]',7,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (27,'account','emailaddress'),(28,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(26,'authtoken','token'),(5,'contenttypes','contenttype'),(8,'core','category'),(9,'core','content'),(10,'core','content_media'),(11,'core','event'),(12,'core','group'),(13,'core','group_contact'),(14,'core','group_event'),(15,'core','item_category'),(16,'core','menu'),(34,'core','menu_item'),(17,'core','person'),(18,'core','person_contact'),(19,'core','person_media'),(20,'core','person_role'),(21,'core','person_section'),(22,'core','requirement'),(23,'core','role'),(24,'core','section'),(25,'core','subject_matter'),(7,'core','user'),(6,'sessions','session'),(4,'sites','site'),(29,'socialaccount','socialaccount'),(30,'socialaccount','socialapp'),(31,'socialaccount','socialtoken'),(32,'token_blacklist','blacklistedtoken'),(33,'token_blacklist','outstandingtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-30 06:18:57.013936'),(2,'contenttypes','0002_remove_content_type_name','2019-11-30 06:18:58.376418'),(3,'auth','0001_initial','2019-11-30 06:19:03.287766'),(4,'auth','0002_alter_permission_name_max_length','2019-11-30 06:19:03.432941'),(5,'auth','0003_alter_user_email_max_length','2019-11-30 06:19:03.484248'),(6,'auth','0004_alter_user_username_opts','2019-11-30 06:19:03.524120'),(7,'auth','0005_alter_user_last_login_null','2019-11-30 06:19:03.561303'),(8,'auth','0006_require_contenttypes_0002','2019-11-30 06:19:03.598629'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-30 06:19:03.637704'),(10,'auth','0008_alter_user_username_max_length','2019-11-30 06:19:03.671489'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-30 06:19:03.704252'),(12,'core','0001_initial','2019-11-30 06:19:51.085853'),(13,'account','0001_initial','2019-11-30 06:19:54.408342'),(14,'account','0002_email_max_length','2019-11-30 06:19:54.520153'),(15,'admin','0001_initial','2019-11-30 06:19:56.906036'),(16,'admin','0002_logentry_remove_auto_add','2019-11-30 06:19:56.984331'),(17,'admin','0003_logentry_add_action_flag_choices','2019-11-30 06:19:57.026295'),(18,'authtoken','0001_initial','2019-11-30 06:19:58.390704'),(19,'authtoken','0002_auto_20160226_1747','2019-11-30 06:19:59.507196'),(20,'sessions','0001_initial','2019-11-30 06:20:00.307443'),(21,'sites','0001_initial','2019-11-30 06:20:00.766201'),(22,'sites','0002_alter_domain_unique','2019-11-30 06:20:01.165572'),(23,'socialaccount','0001_initial','2019-11-30 06:20:09.596556'),(24,'socialaccount','0002_token_max_lengths','2019-11-30 06:20:10.095959'),(25,'socialaccount','0003_extra_data_default_dict','2019-11-30 06:20:10.162242'),(26,'token_blacklist','0001_initial','2019-11-30 06:20:14.337287'),(27,'token_blacklist','0002_outstandingtoken_jti_hex','2019-11-30 06:20:15.201023'),(28,'token_blacklist','0003_auto_20171017_2007','2019-11-30 06:20:15.294694'),(29,'token_blacklist','0004_auto_20171017_2013','2019-11-30 06:20:16.370170'),(30,'token_blacklist','0005_remove_outstandingtoken_jti','2019-11-30 06:20:17.284383'),(31,'token_blacklist','0006_auto_20171017_2113','2019-11-30 06:20:17.443650'),(32,'token_blacklist','0007_auto_20171017_2214','2019-11-30 06:20:20.287945'),(33,'core','0002_auto_20200203_1410','2020-02-03 15:18:34.488101'),(34,'core','0003_auto_20200207_1533','2020-02-07 15:44:31.030727'),(35,'core','0004_auto_20200209_0122','2020-02-09 01:39:10.936859'),(36,'core','0005_auto_20200212_0009','2020-02-12 19:40:01.635792'),(37,'core','0006_auto_20200214_0302','2020-02-14 04:17:43.645019'),(38,'core','0007_auto_20200219_1849','2020-02-19 18:54:57.324086');
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
INSERT INTO `django_session` VALUES ('132ee9780lcrnp588d96qv9l777rp4xv','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-02-25 19:44:25.045344'),('3pcjw3nbfinm6t4guo3d4qrz8hmqhdnt','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-05-08 14:38:10.706991'),('4if4lvxmwexryan3okwprxck3uyyjy1p','NTdmMTg2OWNjMTAwNDE2MDg4ZTdhZDhhY2U3YzQxMmNjOWFjMDBiNjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YjI4NDc1YWE2YzQwYzI1NzM0ZTFmODVmNGM4OTgwZDM5MTQ2Y2JhIn0=','2020-05-21 19:15:55.983284'),('70rcju9il7epi0j3p353ozjwbg48836g','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-02-12 18:27:42.837614'),('aeza2h43d2iit7je1t4fwhsiuumqhi3i','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-08-01 21:53:09.239844'),('azz70w1r1eseskff9k15a1oklzuh2hz1','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-08-07 19:43:23.082509'),('c0mbgv3virp0qq6fvl0wu07n3x60aj8q','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-02-14 16:04:55.705563'),('ezmox8qnf8g69qrvxvp6vv0s12iz5e1n','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-02-28 13:58:55.521025'),('hadtoowfrkw91j13o7jyf6ce29us77sq','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2019-12-24 19:12:43.827132'),('ixb24g92jvhxnn5h12v21dlcm8vnrq67','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-06-18 01:27:01.117989'),('k08tov2t6v6gfg2q0d144gw47szu7bjr','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-09-11 14:22:44.715498'),('knvaqx0s02d9qwlbgokxz1li8oqr4fji','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-01-31 17:39:23.590280'),('laqquwd3sih1ma529e7x7wgmetgnpb8k','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-02-14 16:08:37.574455'),('n3wsfrinonzslklull0girl2u6jsvw8l','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-05-28 04:06:09.790836'),('o6nthtiihu6vscjre6prf4j680lau0u5','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-05-28 12:53:21.145427'),('pjrrtg6g346tl6v40lvvhymrweqxlnvn','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2020-01-04 02:15:01.649969'),('uuvae5qh7kh5diyw7d09oj86zf757qj5','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2019-12-26 23:42:17.798660'),('uyjb0wn2uhk8qk5famyaa7h1pv1v684u','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-02-17 19:36:06.531127'),('v3hovvf3dkhf3e45yil77ct8oxprufnc','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2020-02-26 19:24:13.299135'),('xyb1fkxobgrhyowl5ciksi9yplev4few','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-09-07 16:23:59.850514'),('ykfd5vkkgtfat9vjolgcbp4ikm8w8s42','NzMwZDVmYWY4MTc1NGUzZjFhYTk4M2YwYWZiNTVjNTJmN2I1ODhmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMyNjdiOTczMDA5YjgzODVjODU5ZTBkMTBjZGI0YWVkNGVkZDM3In0=','2019-12-14 06:28:19.870952'),('ywzuzaag5yfxozodu80oya2nnw0mgdvs','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2019-12-30 17:10:05.196371'),('z1roexnd1av003bkbjhleqfz8yq0ewek','ZTgzMWNiM2NmNzdlMzY1NGI0NWE1NTMwZTdkNWVkYWQ3YWRhMzMxMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDU1MGU1ZDRmNWU2ZGJmZjdkZDk2YjZiOWUxYWRkZWJkMjBjY2FmIn0=','2020-01-24 21:51:57.614439'),('zqnulboh4s8nu3ur96pbcvi5lo3v995m','ZGVmYjlmYzBiMGMzNDkxNzZkN2M5NWVjY2NmODcyMzA4Y2RhYjYwNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZGUyNTliMWUxZjg3MGQ1Zjc4MTNlZDgyZTljMjhjNGY0MmM2NjkyIn0=','2020-03-04 14:21:12.795415');
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
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTI5NzI1NiwianRpIjoiODlmODE3YTE5YmRhNDk3MWI2ZWY4YjU5ZWUzMzY3MjEiLCJ1c2VyX2lkIjoxfQ.AsXtjQYNSkN7Cv6QnYVOQV4S3js4210In9YpLxbjWkU','2019-12-01 14:34:16.880479','2019-12-02 14:34:16.000000',1,'89f817a19bda4971b6ef8b59ee336721'),(2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMTU3NCwianRpIjoiNjRlZjBkZDljYTQ0NGNlNjkzZmY4YTRmOGI4Y2NjNzMiLCJ1c2VyX2lkIjoxfQ.TcgFnaV3vSKAfEtQiLfDSI_DT47FRP9j1ERT6I-eks0','2019-12-03 23:19:34.638799','2019-12-04 23:19:34.000000',1,'64ef0dd9ca444ce693ff8a4f8b8ccc73'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMTYxMSwianRpIjoiOWU1ODg0YjM5NTkyNGMxZmI1ZDMwODljZWY2MzZkN2QiLCJ1c2VyX2lkIjoxfQ.VPSi2gDHLDpan_UGgM7a6z9Yfg0XFqu8QpkAGC-2a54','2019-12-03 23:20:11.998680','2019-12-04 23:20:11.000000',1,'9e5884b395924c1fb5d3089cef636d7d'),(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMjkxMiwianRpIjoiNTFlNmFhNzI1NmI2NGNiZTkwNDhiZDQ3N2U5ZjE3OTgiLCJ1c2VyX2lkIjoxfQ.kuFLRItSfNV-8nrYnpPyEcPdnZaOB48Akredk2mXx30','2019-12-03 23:41:52.115080','2019-12-04 23:41:52.000000',1,'51e6aa7256b64cbe9048bd477e9f1798'),(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMjkxNSwianRpIjoiMGIzNzg3NmEyY2U1NDU2Y2E0M2RiZGE2Mjg2YzhlZWMiLCJ1c2VyX2lkIjoxfQ.y9Iz-ZPM3jXtaMXyh8BE5pSOhJfe_Z7EHuH_b3NmQSs','2019-12-03 23:41:55.609748','2019-12-04 23:41:55.000000',1,'0b37876a2ce5456ca43dbda6286c8eec'),(6,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMjkxNywianRpIjoiMzI3NDAyYTliMDkzNGFiMGI1OGIyYzBhZmYwNDZkNmQiLCJ1c2VyX2lkIjoxfQ.7tx5NFn0qzFVW6BKm274zC11YTS_vgBURsJRe7fa_iI','2019-12-03 23:41:57.416885','2019-12-04 23:41:57.000000',1,'327402a9b0934ab0b58b2c0aff046d6d'),(7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwMzgxNywianRpIjoiYzk4NzhkN2VkYTc3NGM4OGIxNjMwOGVmMmQzMTZiZTgiLCJ1c2VyX2lkIjoxfQ.Rx2As2MplF35HSmvSrGLFokhJXw8sLUDvcybZudaoow','2019-12-03 23:56:57.924530','2019-12-04 23:56:57.000000',1,'c9878d7eda774c88b16308ef2d316be8'),(8,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNTc0NSwianRpIjoiZTBhMjVhNjk3ZTg3NDlkZGJmZGUyMDQ3NDFkZDI0MzEiLCJ1c2VyX2lkIjoxfQ.eEyywepbAjHuTuLVxuNILM71e1rR4iS4ITbW6Z415tc','2019-12-04 00:29:05.088768','2019-12-05 00:29:05.000000',1,'e0a25a697e8749ddbfde204741dd2431'),(9,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNTkzNywianRpIjoiYTg4ODg4ZjBiNDNjNDQ0Y2I2MDk5NzEwZWIxNzk4MzciLCJ1c2VyX2lkIjoxfQ.fsCHb5IhtxdKkS-2Rvz__1BmvhZWOeMwchNTR81YT3s','2019-12-04 00:32:17.395821','2019-12-05 00:32:17.000000',1,'a88888f0b43c444cb6099710eb179837'),(10,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNjQxOCwianRpIjoiZDI0OGM5ZjE5YTZmNDQ0NmI5YTY5YTRjNTIxYTQ3YTYiLCJ1c2VyX2lkIjoxfQ.X2Q1WrpNBd7pHIbeVrP7EBhajAOpyks1oQl_3mHldnY','2019-12-04 00:40:18.443837','2019-12-05 00:40:18.000000',1,'d248c9f19a6f4446b9a69a4c521a47a6'),(11,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNjU2NywianRpIjoiZjIzZGViMTE3MzFlNDExNmI0YTVlNjAxNjUzYjM3YzEiLCJ1c2VyX2lkIjoxfQ.EyotH2t0sdp_3Wozkk4Q132K7YIh5FlCU4Y73rObT94','2019-12-04 00:42:47.655490','2019-12-05 00:42:47.000000',1,'f23deb11731e4116b4a5e601653b37c1'),(12,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTUwNjc1MiwianRpIjoiNTNiOWI0YTcxODhhNDE3NzhlOWVjZmYzM2YxNmUxOWQiLCJ1c2VyX2lkIjoxfQ.pbnrYIb5H7jReO5GI7paUeqC53J-QcfYMmuKP0R1eMU','2019-12-04 00:45:52.301487','2019-12-05 00:45:52.000000',1,'53b9b4a7188a41778e9ecff33f16e19d'),(13,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1MDkxNiwianRpIjoiOTdlZTFhZWIzZTlmNDQ2NmFkZjkzNzY3Y2JiNzAzNjEiLCJ1c2VyX2lkIjoxfQ.H9gcZa7WOck7Qyn9zSrPRCglJZlANYIamrZAWiH88bg','2019-12-05 16:48:36.788563','2019-12-06 16:48:36.000000',1,'97ee1aeb3e9f4466adf93767cbb70361'),(14,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1MTEzMywianRpIjoiMjQwMDA5ODU3ODA1NDc3OTlhNmZjMmZmMTkyYTczMWYiLCJ1c2VyX2lkIjoxfQ.v0zsvtuPSqwmv81ouHgLtMRPg5DWoVu9bf4KGCgruHM','2019-12-05 16:52:13.003658','2019-12-06 16:52:13.000000',1,'24000985780547799a6fc2ff192a731f'),(15,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1MzM2NSwianRpIjoiMTVkNmRiYjBhYTA0NDMxNGFkNzljOTVkZjA5YjYxMmIiLCJ1c2VyX2lkIjoxfQ.C712xlBxBLRcU9H_PiiNjVGlEJnS-EKTbFUPUk4BjJ4','2019-12-05 17:29:25.186041','2019-12-06 17:29:25.000000',1,'15d6dbb0aa044314ad79c95df09b612b'),(16,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTY1NTQwMiwianRpIjoiOTI1ZjNmNDEyYmI3NDBiYmJlOTVkMjAxYmU2ZTMyMGMiLCJ1c2VyX2lkIjoxfQ.1xBCv8wGZgE9hKuY_8CIwuLP35z1BF6NGmZ8P6ZhS0c','2019-12-05 18:03:22.826049','2019-12-06 18:03:22.000000',1,'925f3f412bb740bbbe95d201be6e320c'),(17,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NTkyNjk1OCwianRpIjoiODU3ZmVkZDM2OWY1NDExMDgxYjYzZTI3MzM0NzIzMWQiLCJ1c2VyX2lkIjoxfQ.Sd0BSdWFkEqzENaTduTZtZmBjVEZ51l4eq3pt2n-CMM','2019-12-08 21:29:18.255852','2019-12-09 21:29:18.000000',1,'857fedd369f5411081b63e273347231d'),(18,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Njc5MTk1OSwianRpIjoiYmExMDhmNWViZWIzNGQwZTllMDc2NDNhNzA1NzJkYzciLCJ1c2VyX2lkIjoxfQ.hlT_w3VMpV8yKC9wWd3FlHQgJFAGAoAmbmxWn74xrrc','2019-12-08 21:45:59.057786','2019-12-19 21:45:59.000000',1,'ba108f5ebeb34d0e9e07643a70572dc7'),(19,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Njk3NzU1OSwianRpIjoiOWQyNjgzYzJmMTI4NGIzYjljNGNmZThjNGY3ZWZmZmMiLCJ1c2VyX2lkIjoxfQ.ATD_R0WddluAaRAE3VxYO85f7oZrjcuiqABLhMaaFqo','2019-12-11 01:19:19.239477','2019-12-22 01:19:19.000000',1,'9d2683c2f1284b3b9c4cfe8c4f7efffc'),(20,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Njk3NzgzNywianRpIjoiOTBjNmVlYzUzMjFkNDMxNGJmMTIwYzZhZTllNjU1NWQiLCJ1c2VyX2lkIjoyfQ.77lzQ9dQEw10FspySCCUoS5IZ6gI33qwBAKiAM6g02Q','2019-12-11 01:23:57.343103','2019-12-22 01:23:57.000000',2,'90c6eec5321d4314bf120c6ae9e6555d'),(21,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyMzE0MywianRpIjoiZGQxNDQ5ZDY4MDE5NDdlZjliMjU4ZDhhMTYxM2Y0MjUiLCJ1c2VyX2lkIjoxfQ.6AuL5-rReEAcaF8aWa3FKpZtC_MOQBdwyItbIly4D7w','2019-12-12 17:45:43.792424','2019-12-23 17:45:43.000000',1,'dd1449d6801947ef9b258d8a1613f425'),(22,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyMzQ5NiwianRpIjoiOGJmZmRmM2QzNDU3NDBkYzk3YmQ5N2Q5ZDM2YThmOTciLCJ1c2VyX2lkIjoxfQ.8M0MGgn2jMUCijhcfL5v5Cx9uDLWGlwN34QfkRBHiZs','2019-12-12 17:51:36.344711','2019-12-23 17:51:36.000000',1,'8bffdf3d345740dc97bd97d9d36a8f97'),(23,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyMzY2MSwianRpIjoiNTNhZWEyZmI2ZWRhNDg0NTg5MGY1ZTJmOTZiMzVlMjQiLCJ1c2VyX2lkIjoxfQ._T_Y6frOtznSVKTlqz_XJtHXd9eQyC6KjSM1v-fG-kY','2019-12-12 17:54:21.407479','2019-12-23 17:54:21.000000',1,'53aea2fb6eda4845890f5e2f96b35e24'),(24,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEyNDcyOSwianRpIjoiYTAzNmQxMjFkNjc0NDYxZWIyOWRmOGRkYjkyMjJmMmIiLCJ1c2VyX2lkIjoxfQ.2ti7b693GP0yt5vK3AnE0n6in4D6ciDkXAMKGUAxJ88','2019-12-12 18:12:09.514290','2019-12-23 18:12:09.000000',1,'a036d121d674461eb29df8ddb9222f2b'),(25,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzEzMTU5OSwianRpIjoiMTQyNjRmYWQzZGNlNDY3NzkyOWFlOTExYjQ4YjVhYjAiLCJ1c2VyX2lkIjoxfQ.-0EcVyBLuWqLhXPV78nODz1Yo6nZVN8dzsGhk_F-4G0','2019-12-12 20:06:39.171049','2019-12-23 20:06:39.000000',1,'14264fad3dce4677929ae911b48b5ab0'),(26,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzIwODE0MiwianRpIjoiYjMwYzQ5M2MxMDNhNDgyNDk5OWRhNWIzYjQ0YzA2NWIiLCJ1c2VyX2lkIjoxfQ.93YSoD9nJOJEeX0f-JdrLDLDGqWEK1qdQKiGVN3Nh-8','2019-12-13 17:22:22.142934','2019-12-24 17:22:22.000000',1,'b30c493c103a4824999da5b3b44c065b'),(27,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxMjkyNywianRpIjoiYzJiNjU2NzQwN2VkNDFhYjkxMDE2ZjQyZDBiMGY1YzIiLCJ1c2VyX2lkIjoxfQ.YnMMiQAd7ETGOTpij3KbOhjRvvXLgDwde7svpDd4ph8','2019-12-14 22:28:47.954549','2019-12-25 22:28:47.000000',1,'c2b6567407ed41ab91016f42d0b0f5c2'),(28,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxMjk1NywianRpIjoiMjU2MjhiZGI4MWI2NGU5OTkxMjAxOTgwNWFjODMyYjciLCJ1c2VyX2lkIjoxfQ.X292Cd9sdne47LyFQ5lYt-vk9EBHS3Xv189nCM4pjp4','2019-12-14 22:29:17.749886','2019-12-25 22:29:17.000000',1,'25628bdb81b64e99912019805ac832b7'),(29,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxNTc0NCwianRpIjoiZTk2MDQ4ZmQ1Y2VkNGMyNmE3Y2NlNTcwOTczNDBiMDciLCJ1c2VyX2lkIjoxfQ.JpzpoYfb3bV_h_VEgoa0AEBBmEkNaZ_BMjWMljMfL9E','2019-12-14 23:15:44.476496','2019-12-25 23:15:44.000000',1,'e96048fd5ced4c26a7cce57097340b07'),(30,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMxNTg0NiwianRpIjoiYWRlOWRmN2ZiZjFjNDdmODk5ZTBiNDhjNGFlN2UxMjciLCJ1c2VyX2lkIjoxfQ.Say-0fmeBye8G37f-yP1_vaF_nH9aoJ8x5e6Ex_34Vk','2019-12-14 23:17:26.982034','2019-12-25 23:17:26.000000',1,'ade9df7fbf1c47f899e0b48c4ae7e127'),(31,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMyNDU1MiwianRpIjoiODkyZjYyYmJmYzRkNDNlNzk4YWNlZjhjZGE3NjM1MmQiLCJ1c2VyX2lkIjoxfQ.68J8JifgN731NTC3_RYnMW1IlmuRKLYtbAArnpjI_-g','2019-12-15 01:42:32.225822','2019-12-26 01:42:32.000000',1,'892f62bbfc4d43e798acef8cda76352d'),(32,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzMyNDcwNSwianRpIjoiYjljMmM2MTc5MjFjNGQ1MjhjNTIzYTVlNDNkMzllZDgiLCJ1c2VyX2lkIjoxfQ.G6UfWfL0kGhlVlP-yavChGjaD_V75ImvZ_29DO84RnA','2019-12-15 01:45:05.858287','2019-12-26 01:45:05.000000',1,'b9c2c617921c4d528c523a5e43d39ed8'),(33,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2MzM5MywianRpIjoiZWJkZmY0YmNhNDc3NDc2YWFiYTU3ODc0NmJiMmQ0NDEiLCJ1c2VyX2lkIjoxfQ.qB8TUUrT7i82U7cyArYw9i0JMMLXsZ7SMjONbETFOY8','2019-12-16 16:16:33.335163','2019-12-27 16:16:33.000000',1,'ebdff4bca477476aaba578746bb2d441'),(34,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2NTYxMCwianRpIjoiODBhNGFhNjkwYzQwNGE2Y2JjOGFhODNjM2I4YmFmYzgiLCJ1c2VyX2lkIjoxfQ.f8thckg85fYcS4rZSxejv3KuQnycLhLq_z64sOuA8L8','2019-12-16 16:53:30.684216','2019-12-27 16:53:30.000000',1,'80a4aa690c404a6cbc8aa83c3b8bafc8'),(35,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2NjY2MCwianRpIjoiOGRjMTJhMjUyOTFkNDU3N2FlMDQ3OTg2ZTYxMjRkMzAiLCJ1c2VyX2lkIjoxfQ.nyIffVFD78-7Xgpfby4c-cKYgtgtAWBXuYjKS2JAzjs','2019-12-16 17:11:00.325933','2019-12-27 17:11:00.000000',1,'8dc12a25291d4577ae047986e6124d30'),(36,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2NjgwMCwianRpIjoiZDQ1ZWU0NmU4NDMzNGI5YzhhOWZjYjUyMDFlYzM3Y2QiLCJ1c2VyX2lkIjoxfQ.hb3UbGlZ7rsRRirl48iKtBZIdxBBR3I9YZMNQROUy_s','2019-12-16 17:13:20.660060','2019-12-27 17:13:20.000000',1,'d45ee46e84334b9c8a9fcb5201ec37cd'),(37,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzQ2ODE4OCwianRpIjoiNjM3ODk2OTJmZDNjNDdjOWFmYzFmZGI4YjE2ZThkMjUiLCJ1c2VyX2lkIjoxfQ.dtOE_pmuKFaTYZj23z_OmOqFM2kQykrShhaade9QYX4','2019-12-16 17:36:28.614364','2019-12-27 17:36:28.000000',1,'63789692fd3c47c9afc1fdb8b16e8d25'),(38,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzU5MjQyMSwianRpIjoiMWU1ZDFlNzlhYjQ3NGE3NWIyYTlmYTI3OTY1OTlhN2QiLCJ1c2VyX2lkIjoxfQ.s1_hwuji8f-q5K-ALMFvsFCVbmZgYjta5e8sVXyfm4w','2019-12-18 04:07:01.798841','2019-12-29 04:07:01.000000',1,'1e5d1e79ab474a75b2a9fa2796599a7d'),(39,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzU5MjYzNiwianRpIjoiMTdkNjg1NWFkMzU3NDY5MTgyZTA4OTgwZGU3N2ZjNDMiLCJ1c2VyX2lkIjoxfQ.98PIDeePgRG3zZ2d7ecMDJ82lgDrX0zSiqMMj6PqCoA','2019-12-18 04:10:36.137760','2019-12-29 04:10:36.000000',1,'17d6855ad357469182e08980de77fc43'),(40,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzU5MzA2MCwianRpIjoiZDAzMjI5MzU0YWRkNGE4YzliNWExZDU1NWE0N2M2ZmMiLCJ1c2VyX2lkIjoxfQ.BmGwciNWwk_LDSUfPNV0SA9p5Oh_C6guGJuKU6WStAE','2019-12-18 04:17:40.281613','2019-12-29 04:17:40.000000',1,'d03229354add4a8c9b5a1d555a47c6fc'),(41,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjc4MiwianRpIjoiMGM5OGFlZTBkNjRhNDE2MjlkOWFjY2U3NmRlNjFlMDYiLCJ1c2VyX2lkIjozfQ.pSa61_I23MlR0hmKWEX6X9ZhzfEArXpHybu5UrCzK58','2019-12-18 06:59:42.980736','2019-12-29 06:59:42.000000',3,'0c98aee0d64a41629d9acce76de61e06'),(42,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjgyNiwianRpIjoiNmY0MzdmYmQ1YzMzNDA3NjlmY2I4ZTEzZjQyYjEwMzMiLCJ1c2VyX2lkIjoxfQ.R3rg3snxrbuM-oQ9Qp7-v0iDQupXyti1XqAfKKScr3I','2019-12-18 07:00:26.354168','2019-12-29 07:00:26.000000',1,'6f437fbd5c3340769fcb8e13f42b1033'),(43,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjg0NSwianRpIjoiZjIzYmI4OWIxOTNmNDAwMWFkNDJiNDlhOTA1NjVhNWUiLCJ1c2VyX2lkIjoxfQ.JweHkEaFpLbiXeVsTNn4XgJeUb3xHwL1x9uwwm7WxBg','2019-12-18 07:00:45.630350','2019-12-29 07:00:45.000000',1,'f23bb89b193f4001ad42b49a90565a5e'),(44,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMjg2MywianRpIjoiNmFmNDM3MjNiZjVkNDM2OGI2MTBhZWQ2NzE3Zjc1OTUiLCJ1c2VyX2lkIjoxfQ.vA1Q4-r5-hkvXfK0_EoKmRExVLXO0uSSUSZi_za35yg','2019-12-18 07:01:03.400875','2019-12-29 07:01:03.000000',1,'6af43723bf5d4368b610aed6717f7595'),(45,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzA3MCwianRpIjoiOGQxZGMwMTIyZDJkNGJjODkxYWE3MjEzMjM3NGZjYzEiLCJ1c2VyX2lkIjoxfQ.w7AFhlkb54SRe7FHuE60zFqzGazfjU2sIC32g-f40SQ','2019-12-18 07:04:30.531967','2019-12-29 07:04:30.000000',1,'8d1dc0122d2d4bc891aa72132374fcc1'),(46,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzIyMSwianRpIjoiYjA1YTUwZWE3NzY5NGIzOThiMmFjZjRlZWZlYmM0MjciLCJ1c2VyX2lkIjoxfQ.8n5H5vXWH74JbsyB-7ZQmWVBja1Uo3jeXK6dB7LI_XM','2019-12-18 07:07:01.826291','2019-12-29 07:07:01.000000',1,'b05a50ea77694b398b2acf4eefebc427'),(47,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzMyNywianRpIjoiZDNiYTI1Yjg5YWU2NDY5NDg5MjIyMWQwMzgyMTlmZmIiLCJ1c2VyX2lkIjoxfQ.yFxMNBNRZopxEjX32MTMLHtrFWbDqIUEFJ58vprCye0','2019-12-18 07:08:47.946965','2019-12-29 07:08:47.000000',1,'d3ba25b89ae64694892221d038219ffb'),(48,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzYwMzY5NywianRpIjoiMTNlOThjYzRlN2FiNDBhMWExYWZmNzljYTUxNWU5ZmEiLCJ1c2VyX2lkIjoxfQ.x9kdKRadQg12Vwtxm7v1sNDEZ9JEnztn7zjBNekO7oE','2019-12-18 07:14:57.186344','2019-12-29 07:14:57.000000',1,'13e98cc4e7ab40a1a1aff79ca515e9fa'),(49,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NDc1MiwianRpIjoiN2MwZmQ5NTNiOGY3NDEwYzgxN2U3MmI0ZGJmYjE2MjUiLCJ1c2VyX2lkIjoxfQ.ytGs_vThvDa5eMiCPL8G5bwq9L9LuXfsowCRA-XX8Lg','2019-12-18 18:39:12.226680','2019-12-29 18:39:12.000000',1,'7c0fd953b8f7410c817e72b4dbfb1625'),(50,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NTAwOCwianRpIjoiNmI5OTdjMmIxNDFkNDViM2I5ODg5OGJkZTNjMDAyZjAiLCJ1c2VyX2lkIjoxfQ.ZcowE-fkE_5Y0FypLVpBewJyXiuf_nBsgoGP5Z5qK_A','2019-12-18 18:43:28.551414','2019-12-29 18:43:28.000000',1,'6b997c2b141d45b3b98898bde3c002f0'),(51,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NTQxMywianRpIjoiODY5ZjJlYmMwZTk0NDNiNDliN2JlYTI4NGZkMTNjYjIiLCJ1c2VyX2lkIjoxfQ.5edjj1VC3Vf7wuAPBZjFMw4cMHRRRi0TdMIi8iY-DRA','2019-12-18 18:50:13.351902','2019-12-29 18:50:13.000000',1,'869f2ebc0e9443b49b7bea284fd13cb2'),(52,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NTY0NiwianRpIjoiYzJhYWFhZjdmZWY4NGE1YmEwODQzMGNhZTFkMDkyOWIiLCJ1c2VyX2lkIjoxfQ.GdhFRvjAgF1PvyxPhaXNIz4omnpbtEDR7_oGq91bKqI','2019-12-18 18:54:06.135425','2019-12-29 18:54:06.000000',1,'c2aaaaf7fef84a5ba08430cae1d0929b'),(53,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY0NjQ5OCwianRpIjoiZmJkNzRkOTc0MzljNGJhNjg1YzI0NjY5ZGM0YjU4NjEiLCJ1c2VyX2lkIjoxfQ.5xiqECVFsSn-DxTQUIPjDCfIAm2damH4UNRprN9FOow','2019-12-18 19:08:18.452077','2019-12-29 19:08:18.000000',1,'fbd74d97439c4ba685c24669dc4b5861'),(54,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY1MTQ4NCwianRpIjoiZmJkMDFjMTRjNjAzNDYwY2I1ZWQ5MjQwYjM4YWQ5MWMiLCJ1c2VyX2lkIjoxfQ.wdF2GMOtbxqxt6ZAN7iPlxqM9p4Kb2uGnEHsGJW3ap8','2019-12-18 20:31:24.733955','2019-12-29 20:31:24.000000',1,'fbd01c14c603460cb5ed9240b38ad91c'),(55,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzY1MTQ5OSwianRpIjoiMjA5YWExYWUxNDg3NGFjZDhjYTg4NmQ3OWY5M2M1MzQiLCJ1c2VyX2lkIjoxfQ.-YdmRJubo_-TkasJrn3IFvZMieR72LVpiT4OOqPG-h0','2019-12-18 20:31:39.267890','2019-12-29 20:31:39.000000',1,'209aa1ae14874acd8ca886d79f93c534'),(56,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzkzMzQyMiwianRpIjoiZmEyMDhhZDU2NDg4NDk2ZGE3ODE4ZTgyZmRjZDM5NTMiLCJ1c2VyX2lkIjo0fQ.gD0Cvxn3e3HF0oaqAPfXduMfrhMUD8pSKmIShxSRlIw','2019-12-22 02:50:22.363147','2020-01-02 02:50:22.000000',4,'fa208ad56488496da7818e82fdcd3953'),(57,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3NzkzNDAwMSwianRpIjoiN2E4OWE1ZTdlODliNGJhNGI1MzU3MzkxOTM3ZTI0ZGUiLCJ1c2VyX2lkIjoxfQ.2u1RUTPFapJryLdB5MI-oaDBwK0akimYjklHfiJUkGg','2019-12-22 03:00:01.461056','2020-01-02 03:00:01.000000',1,'7a89a5e7e89b4ba4b5357391937e24de'),(58,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3Nzk5MjUxOCwianRpIjoiZDBlNDcwZjBlNDVmNGYyM2IyMTZjMDczMjNhN2NmMDQiLCJ1c2VyX2lkIjoxfQ.DcMHEVGi2i-xwHMi3XkEPiKzWnXozjvaZPNY2PZZEak','2019-12-22 19:15:18.650539','2020-01-02 19:15:18.000000',1,'d0e470f0e45f4f23b216c07323a7cf04'),(59,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM0OSwianRpIjoiY2RiNzk5MWE0NTI1NGRkMGI3MzRmZmEwODUyNzIwNWQiLCJ1c2VyX2lkIjoxfQ.FTGz7ptzY9lDWGI-Ty7EkZAqNv_e_ymuiPOgyAHZrLI','2019-12-23 01:35:49.100042','2020-01-03 01:35:49.000000',1,'cdb7991a45254dd0b734ffa08527205d'),(60,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1MywianRpIjoiNGZjMzI4YjE0ZDdjNDg1NGI4MjBlYTQ1NTZhZjczMjUiLCJ1c2VyX2lkIjoxfQ.E1U5gqorw_OD2q7cI8fh_hOipzJ7fiNswffNjCD8eMw','2019-12-23 01:35:53.370911','2020-01-03 01:35:53.000000',1,'4fc328b14d7c4854b820ea4556af7325'),(61,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1NSwianRpIjoiODI0N2MzNjgzNWRmNDM1Y2FhMmY5OGY3ZTE2MzhlNTQiLCJ1c2VyX2lkIjoxfQ.EPw2tkbp3D-9k5ibE0xqhRIqSEbBV1g-LrOtl5iG0dU','2019-12-23 01:35:55.215907','2020-01-03 01:35:55.000000',1,'8247c36835df435caa2f98f7e1638e54'),(62,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1NiwianRpIjoiN2M5ZGE0YjE2N2U4NDI1MTlkOWU5NzI3YTZkMTgxNTQiLCJ1c2VyX2lkIjoxfQ.-ILQyHY636mKO6jf29RBiP4diRjddug9sxYPIujDvPA','2019-12-23 01:35:56.682563','2020-01-03 01:35:56.000000',1,'7c9da4b167e842519d9e9727a6d18154'),(63,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM1OCwianRpIjoiNWM0MmVmYzVkMTA2NDEwMWJhYzI5Mzc3OGNiZWY2MzciLCJ1c2VyX2lkIjoxfQ.ebrMJDR2xuzf3Qymdk5tGGgsGxCQ77Pf-xqpjjT_S9A','2019-12-23 01:35:58.278855','2020-01-03 01:35:58.000000',1,'5c42efc5d1064101bac293778cbef637'),(64,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM2MCwianRpIjoiOWM4OTFiMzRlMWYwNDVhMmJjYWI2NmEzMTBmOTJjNzIiLCJ1c2VyX2lkIjoxfQ.KPlrFTsIEZrzXII969ndD_UTYPUC2tTixOxjrNjH0oU','2019-12-23 01:36:00.778797','2020-01-03 01:36:00.000000',1,'9c891b34e1f045a2bcab66a310f92c72'),(65,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM2MiwianRpIjoiNGI5ZDUwZjNkYjc0NGNjMThkNjBjMzFlOTVjMGU1M2UiLCJ1c2VyX2lkIjoxfQ.iksfcBvN4E_EyQSVO2ng2Zzx5JtVVRfLBkklYAmCr7w','2019-12-23 01:36:02.358375','2020-01-03 01:36:02.000000',1,'4b9d50f3db744cc18d60c31e95c0e53e'),(66,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM2NCwianRpIjoiOTQxYmMzNmI4ZGZhNGM4Y2JiN2JlYTEzN2M1MzVjM2UiLCJ1c2VyX2lkIjoxfQ.kH13uQCZbPMMmy0odS73vGlSFWaSZmw1MBozlbaYLhA','2019-12-23 01:36:04.172010','2020-01-03 01:36:04.000000',1,'941bc36b8dfa4c8cbb7bea137c535c3e'),(67,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM3NiwianRpIjoiZWY0YzgxOGQ0NmE2NGIzNjlkM2MxZjgzYzZlNTUwMTMiLCJ1c2VyX2lkIjoxfQ.HEWpxy937mHBC5RvJWrDJZm-s9BJK1hqdIagumcvHp4','2019-12-23 01:36:16.774985','2020-01-03 01:36:16.000000',1,'ef4c818d46a64b369d3c1f83c6e55013'),(68,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4MSwianRpIjoiZmY5NDljMTEzZGQxNGE4MjgyNTY0ZDMyOWE4OTkyMDUiLCJ1c2VyX2lkIjoxfQ.Fo9GYt28Y8IW83KvX33RYbOAZsH01lNqcemSIn2AnmY','2019-12-23 01:36:21.179712','2020-01-03 01:36:21.000000',1,'ff949c113dd14a8282564d329a899205'),(69,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4MiwianRpIjoiMjY3ZWE4M2ExMjQ3NDJlNmIzYmRmYmYyYjEzOTk5ZTAiLCJ1c2VyX2lkIjoxfQ.wkuxWD0WgzTUMxumL_SynGxHOljbKs2EZRpK63mGZxI','2019-12-23 01:36:22.955854','2020-01-03 01:36:22.000000',1,'267ea83a124742e6b3bdfbf2b13999e0'),(70,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4NSwianRpIjoiODNjZmU4Y2E3NWQ4NDEwZTk2NGYyMGYwYzM0ZTczOGEiLCJ1c2VyX2lkIjoxfQ.DMeJKewPaUCgPFbwbsrJ8xA42MMen-GSs1bCUAi-vls','2019-12-23 01:36:25.026227','2020-01-03 01:36:25.000000',1,'83cfe8ca75d8410e964f20f0c34e738a'),(71,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTM4NiwianRpIjoiN2M0OWUwZGYzNmViNDk3ODg0Y2ZkMDY3OWI0ZDE1ZDEiLCJ1c2VyX2lkIjoxfQ.arMIJ58_VeqFw8PLmHKJ-mvy50jwunezmGYf3x3uL6Y','2019-12-23 01:36:26.873075','2020-01-03 01:36:26.000000',1,'7c49e0df36eb497884cfd0679b4d15d1'),(72,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3ODAxNTQ2MiwianRpIjoiYTkwNDlkYmJjODZmNDJhOWE2N2M0ZDk2Y2U5MzViNmYiLCJ1c2VyX2lkIjoxfQ.GhJlSapfXowLL3NXue76kocvV6AbSXUGORTK7qybUEs','2019-12-23 01:37:42.666697','2020-01-03 01:37:42.000000',1,'a9049dbbc86f42a9a67c4d96ce935b6f'),(73,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3OTYxMTkwOSwianRpIjoiYjA2MDMxYmM1ZjY1NDIyOWJmYmFlODcwMzVmYmQ0YzkiLCJ1c2VyX2lkIjoxfQ.wLqNw1ruo2LOdqL86ypWjE6TbXireouc5PUy-ACv6c4','2020-01-10 13:05:09.913842','2020-01-21 13:05:09.000000',1,'b06031bc5f654229bfbae87035fbd4c9'),(74,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3OTYxNjM3NCwianRpIjoiMGJiZTgyMWM1Y2M1NDMzNmFiYWI0NjUyYzU1ODUwYjAiLCJ1c2VyX2lkIjoxfQ.ASubsPhCMP44dZd_sDhlkV4fChrmORcT1jq6Ep5NDOs','2020-01-10 14:19:34.219177','2020-01-21 14:19:34.000000',1,'0bbe821c5cc54336abab4652c55850b0'),(75,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU3OTY0NDg1NywianRpIjoiNDRhMjkwYjAwNGFiNGMzOGE1MTQyNzA5MGRkYzZmODgiLCJ1c2VyX2lkIjo0fQ.o-CMthY2G7ULxd8ME-yaQ9CQFsn1nRIfkmlx73KJHUA','2020-01-10 22:14:17.945592','2020-01-21 22:14:17.000000',4,'44a290b004ab4c38a51427090ddc6f88'),(76,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDA3Nzk0NSwianRpIjoiMDU0YzRiY2JkMjlmNDM1ZTlhOTUxMDAwYjQzZThiNzEiLCJ1c2VyX2lkIjoxfQ.nWCG-z5LpOxrObgos6NdhGKggnMs0HtB4XdaxFoPVuM','2020-01-15 22:32:25.750454','2020-01-26 22:32:25.000000',1,'054c4bcbd29f435e9a951000b43e8b71'),(77,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDEzNDA1NywianRpIjoiZGIyYzAwMDdkNWI3NDE3MjlmODkxY2M1NjQ2NDQ5ODQiLCJ1c2VyX2lkIjoxfQ.sWwx4GIA21SgaVTcG6n_M42zwOOwuRzzBzaHorjMM9o','2020-01-16 14:07:37.085042','2020-01-27 14:07:37.000000',1,'db2c0007d5b741729f891cc564644984'),(78,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjAxMSwianRpIjoiM2YzZWY5YTc3M2E0NGQ4ZTg4NzAwMjc1ZjQ3NTZlNTciLCJ1c2VyX2lkIjoxfQ.VJRAjTMrd8rIjoI_cXeyOhv3Jhp3uR_IZYZ60K4D4nM','2020-01-17 17:20:11.588727','2020-01-28 17:20:11.000000',1,'3f3ef9a773a44d8e88700275f4756e57'),(79,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjQ3MywianRpIjoiMGRkOGM0ZjBkN2ZlNDM2MDhiNDQ4YWNhZjExYTkyYTEiLCJ1c2VyX2lkIjo0fQ.fwf9GODBDDIQZUwuTStELg35HpcMrcCa0vyZiEkCxKQ','2020-01-17 17:27:53.055477','2020-01-28 17:27:53.000000',4,'0dd8c4f0d7fe43608b448acaf11a92a1'),(80,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjcxMiwianRpIjoiMDA1Y2YyYTczOTNmNDU0NTkzMzBiNjE4YTY5NjA0ZjEiLCJ1c2VyX2lkIjo0fQ.39JGvSYQUybhNCGACGYBMNY3UnXc-BKNSgwMpiiDig4','2020-01-17 17:31:52.576498','2020-01-28 17:31:52.000000',4,'005cf2a7393f45459330b618a69604f1'),(81,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMjc1MSwianRpIjoiMDhhMDhlNzk5OGY0NDQ3ZWExNDZmOWNkMDAxMjBhYjEiLCJ1c2VyX2lkIjoxfQ.fcS3wkh2ZtVhGWocIzxCrseTse8yIhHz0yV8fU21JZM','2020-01-17 17:32:31.941549','2020-01-28 17:32:31.000000',1,'08a08e7998f4447ea146f9cd00120ab1'),(82,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzMzIzNywianRpIjoiMTQ5Njg1OGZmNWUyNDY3NDliZDZkYjNjMTMzZWFlMzkiLCJ1c2VyX2lkIjoxfQ.3ZNkb8pyGXuFsPh5l7gN03w0oaa4uztysEPiHaP23Ps','2020-01-17 17:40:37.898587','2020-01-28 17:40:37.000000',1,'1496858ff5e246749bd6db3c133eae39'),(83,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDIzNDIyNSwianRpIjoiZTRkYmMyZDhmM2E5NDc4NWI3NjRhMGI4NWE2OWU0MWYiLCJ1c2VyX2lkIjo0fQ.Z5qPuLAq9tV337FoP6D1a6EV3b6xNzy2Q1z8WMrmtc8','2020-01-17 17:57:05.109580','2020-01-28 17:57:05.000000',4,'e4dbc2d8f3a94785b764a0b85a69e41f'),(84,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDM5MzQ0NywianRpIjoiYTc4NjJhMjMwOTFmNDgwYmEzMTYxZTkxYzAzMDQ0Y2YiLCJ1c2VyX2lkIjo0fQ.3zTlLuHb6H9U7TYkvPeHcFB8Tldd4BKLLeljuKA3rl8','2020-01-19 14:10:47.790502','2020-01-30 14:10:47.000000',4,'a7862a23091f480ba3161e91c03044cf'),(85,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDM5MzQ2NywianRpIjoiODFkYTFmNzE5NDU2NDhiZjg1ODhhYmNmYjEyOGFhNzAiLCJ1c2VyX2lkIjoxfQ.d27YQzu0YmnakfQIDefTC_DBJ-Nttm8uapavllzXF-8','2020-01-19 14:11:07.264764','2020-01-30 14:11:07.000000',1,'81da1f71945648bf8588abcfb128aa70'),(86,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NDU4NiwianRpIjoiNWE0NTBmOWYxZjE4NDQzMzk2MGI4MWUzYmEzZjBjMjEiLCJ1c2VyX2lkIjoxfQ.O3eWJO1FJvn1a0QDVqBuFER3QgkdHYEu6jKUfSGSp9I','2020-01-24 05:36:26.999620','2020-02-04 05:36:26.000000',1,'5a450f9f1f184433960b81e3ba3f0c21'),(87,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NTQxMywianRpIjoiNmUzOTBjOTAyNzg5NDNhZDljYjgxOTUxM2JkMGQwZjQiLCJ1c2VyX2lkIjoxfQ.Wy89MDa5YdBE2R2LUyDVV8eWqat3B5s8PF3Kmk30P3M','2020-01-24 05:50:13.107117','2020-02-04 05:50:13.000000',1,'6e390c90278943ad9cb819513bd0d0f4'),(88,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NTQzMywianRpIjoiOGU1Y2Q5YmVjMDM5NDNjMWE1NGMyNWVlMWY2NjIyODkiLCJ1c2VyX2lkIjoxfQ.Hd7ZP3n_6qAUZHOPQLHe8yIWWgvv9_t9bPs81-oIMgk','2020-01-24 05:50:33.624102','2020-02-04 05:50:33.000000',1,'8e5cd9bec03943c1a54c25ee1f662289'),(89,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NTQ3NSwianRpIjoiMWRmOGYyNDk1ZTYwNDFkZWJjOWY2MDY5YjY5ZmY3ZWUiLCJ1c2VyX2lkIjoxfQ.JpxTNgTvbkr4j1p4T-6HEAWm4uL7MN5kD1DTxuMbA3k','2020-01-24 05:51:15.409097','2020-02-04 05:51:15.000000',1,'1df8f2495e6041debc9f6069b69ff7ee'),(90,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NTU5MCwianRpIjoiZDg3MWQwMjAyOTNmNDYzZTlhNTlhMDcyMGQ1NDc0MTQiLCJ1c2VyX2lkIjoxfQ.lZbkEjE3OTwPyQH92FaqAKI83BwZUwYW1OA6g_zf0d0','2020-01-24 05:53:10.222946','2020-02-04 05:53:10.000000',1,'d871d020293f463e9a59a0720d547414'),(91,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NTk3NSwianRpIjoiMWQ5ZGUyM2ZmOTA1NGMzOWFlMWQzYTZiZmZlNjNlNzkiLCJ1c2VyX2lkIjoxfQ.YQcOMmcTFVYSkS4csMghPBD_3NdXumMs-4M6ZM_kOzc','2020-01-24 05:59:35.845710','2020-02-04 05:59:35.000000',1,'1d9de23ff9054c39ae1d3a6bffe63e79'),(92,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NjAzOCwianRpIjoiZDY5MWIwZmQ0YmYzNGJhODllNTkyMWQwYzEyZDBkOTIiLCJ1c2VyX2lkIjoxfQ.msWAkBRLQnQ4w6d_YldR2s_WSnVlSD7ILXqlSbWYaSU','2020-01-24 06:00:38.626427','2020-02-04 06:00:38.000000',1,'d691b0fd4bf34ba89e5921d0c12d0d92'),(93,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NjQ1MiwianRpIjoiZGE0OWY1NGI4ZDc3NDM3ZjlmZjQ5N2NjOTdjNzFiODQiLCJ1c2VyX2lkIjoxfQ.nw5Z3nlefKEiHZcoUy9aDmG5ZgThtwdmsFIgVJuhfR0','2020-01-24 06:07:32.810697','2020-02-04 06:07:32.000000',1,'da49f54b8d77437f9ff497cc97c71b84'),(94,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NjYyNSwianRpIjoiZWI0OWVlYjAyMTAzNGY3OWJkMjdjYThhYmI2ZmI5NWQiLCJ1c2VyX2lkIjoxfQ.v4cT9F9teVpAoYxGGXHU4pPW5G18MXqfIExIBa_WnA4','2020-01-24 06:10:25.589008','2020-02-04 06:10:25.000000',1,'eb49eeb021034f79bd27ca8abb6fb95d'),(95,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NjY0NCwianRpIjoiN2ZiOWNlZjJmMzkxNGY0N2I5NjQzOWM1NTcxNWI2MzMiLCJ1c2VyX2lkIjoxfQ.eazQ3H045iei3P2dZ2hInuzXqBQDhDla_ezrCwoB5UU','2020-01-24 06:10:44.642370','2020-02-04 06:10:44.000000',1,'7fb9cef2f3914f47b96439c55715b633'),(96,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NzIzMSwianRpIjoiZmUwMjA2NzIzMjZlNDUxZWFmODZkMTgzNTU1ZmVlYTEiLCJ1c2VyX2lkIjoxfQ.6vlU7JWkb_2BkuGeHdfjOl9_dv88TVgBsSyI6Pxv4cA','2020-01-24 06:20:31.291488','2020-02-04 06:20:31.000000',1,'fe020672326e451eaf86d183555feea1'),(97,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NzMzMywianRpIjoiZjI1M2NlMWFmMTVhNGFiYmE2Y2IxOTI4YWQ0MzNlZTciLCJ1c2VyX2lkIjoxfQ.Dh7euZqcFzc79qxgVdllWOLVkleIaivRTEDscO_SPao','2020-01-24 06:22:13.854764','2020-02-04 06:22:13.000000',1,'f253ce1af15a4abba6cb1928ad433ee7'),(98,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NzQ4MywianRpIjoiNTUyMmE1MGRiY2VjNGFmYzliY2RjMmUyNWNlYTkwM2UiLCJ1c2VyX2lkIjoxfQ.xTFvby0VqU5BadcGU147LQBGyZpYZrnptxSWr6c0gwY','2020-01-24 06:24:43.054096','2020-02-04 06:24:43.000000',1,'5522a50dbcec4afc9bcdc2e25cea903e'),(99,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5NzU3MywianRpIjoiM2M3OWNhY2Q1ZmIzNGRmMzliZDlmY2U0ZDQ2NGQ1YjEiLCJ1c2VyX2lkIjoxfQ.7LR8vMaVvuE2gnu6EhUWDTdNarqmIy-gKuhkpuzu5j4','2020-01-24 06:26:13.353733','2020-02-04 06:26:13.000000',1,'3c79cacd5fb34df39bd9fce4d464d5b1'),(100,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5Nzc5MSwianRpIjoiYmZjYjFhNDU5MzI4NDQyYjkxODQ1Mzk5ZTU5ZmY0MTAiLCJ1c2VyX2lkIjoxfQ.iw5u-vKES4RfJvSE4oXm54r7xn1FZ7ValdcuQ_eULro','2020-01-24 06:29:51.099458','2020-02-04 06:29:51.000000',1,'bfcb1a459328442b91845399e59ff410'),(101,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5ODI5NCwianRpIjoiNDk0MjA2ZTdjYzA4NDg2NjhkMDZjNGNjYjY1NGYyYmYiLCJ1c2VyX2lkIjoxfQ.yNWnodHg6berdrhkgbNXnGtObkngRkHy5NvMr5tb0sU','2020-01-24 06:38:14.994092','2020-02-04 06:38:14.000000',1,'494206e7cc0848668d06c4ccb654f2bf'),(102,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5ODQxMCwianRpIjoiNzQwZTE1NmUyNDhhNDcyOGFkM2M5NWIwNTJlMTYyYzAiLCJ1c2VyX2lkIjoxfQ.UFzCl32Ttp2b5UjOm-ZI2yeFASdJqYL7295RQ_qtMCw','2020-01-24 06:40:10.209542','2020-02-04 06:40:10.000000',1,'740e156e248a4728ad3c95b052e162c0'),(103,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5ODg4MCwianRpIjoiZDgxNWFkMGMzZjQ3NGQ0Zjk1YTg5MDY3NDgwOGE1YjAiLCJ1c2VyX2lkIjoxfQ.DklYhNs8-uQ2gW4M99I9twok0vyZlAS0ornD5v6UnCM','2020-01-24 06:48:00.688030','2020-02-04 06:48:00.000000',1,'d815ad0c3f474d4f95a890674808a5b0'),(104,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDc5OTA3NSwianRpIjoiNjZmOWQ3YThlMGEwNDhlZDk1OWVjNzc4ZGYxOTQwMTYiLCJ1c2VyX2lkIjoxfQ.XlcRf5m2oAlATXgOEYLi99Y7yOV9NlVnYcHaQUrQDUg','2020-01-24 06:51:15.167452','2020-02-04 06:51:15.000000',1,'66f9d7a8e0a048ed959ec778df194016'),(105,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDgyODgzMywianRpIjoiZTAwZjMzMzBhNzM0NGNmMWFlMWQyN2M4NmNmNGYwZWQiLCJ1c2VyX2lkIjoxfQ.DC9pbX_A-Wx_Tm4VDwOCzgujZrY_cVCfFlklD2oAW68','2020-01-24 15:07:13.069218','2020-02-04 15:07:13.000000',1,'e00f3330a7344cf1ae1d27c86cf4f0ed'),(106,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDgyOTcxNywianRpIjoiNGRlYjU1NjNmYzc3NGE3ZThjODdkMGFiZGZlNThhNjYiLCJ1c2VyX2lkIjoxfQ.xu7-CF8X634ZRc91Yd1gRzrQU0c3qZEp0JRdD28yKAo','2020-01-24 15:21:57.536185','2020-02-04 15:21:57.000000',1,'4deb5563fc774a7e8c87d0abdfe58a66'),(107,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDgzMDExOSwianRpIjoiM2M2YjEwYTM4OGIzNDZmOTlmNzhlZDNkNmZiYjIyNGQiLCJ1c2VyX2lkIjoxfQ.qCmZbT78U0fw90fWYyDtkUs3b2SdDsnTaoBTfqNbmug','2020-01-24 15:28:39.292386','2020-02-04 15:28:39.000000',1,'3c6b10a388b346f99f78ed3d6fbb224d'),(108,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDgzNjQxMSwianRpIjoiYmQ3NTlkN2Q1NzJkNGJlZTk3YmJkYTRkNjI2ZGU4OTYiLCJ1c2VyX2lkIjoxfQ.Br_SQcNd8wKEipO240ehyD2QGnb3tlM1tHKgQQ2SOGM','2020-01-24 17:13:31.151675','2020-02-04 17:13:31.000000',1,'bd759d7d572d4bee97bbda4d626de896'),(109,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDgzNjQzNiwianRpIjoiNzNjYTYwOWQwZjE1NDU2NmI2NWVmM2E1NDk0MDI0MzAiLCJ1c2VyX2lkIjoxfQ.kJ4Tbsvq5QvO9ROXEiWoKYK0ZBrvL2Y8ZP8rTtiIbBU','2020-01-24 17:13:56.955904','2020-02-04 17:13:56.000000',1,'73ca609d0f154566b65ef3a549402430'),(110,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDgzNzE0MSwianRpIjoiNWU3ZGJjOWZlODE2NDIxZmEzNjkxZmViODcyYmU1NjkiLCJ1c2VyX2lkIjoxfQ.DUy4wriaKF-AWz7Bt_mxAfx1eK2p1Z2l7Cz60T4yIcc','2020-01-24 17:25:41.014879','2020-02-04 17:25:41.000000',1,'5e7dbc9fe816421fa3691feb872be569'),(111,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDkzNjcxMCwianRpIjoiNTEwN2M2YmJhZDUxNGM3YThkODk5YjY0MDM2MzMzYjYiLCJ1c2VyX2lkIjoxfQ.adWPRViJBoMo-hLCd3AISQczm2Z6b_xmu7QGOqQ8flc','2020-01-25 21:05:10.424150','2020-02-05 21:05:10.000000',1,'5107c6bbad514c7a8d899b64036333b6'),(112,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDkzOTQ4NCwianRpIjoiYjgyYjA2ODc5NzA2NDgyYzhmZWFjNGYxYWRkZDg0MTciLCJ1c2VyX2lkIjo0fQ.caQe3LgZbLa4mPfRnGiOY5vpRaS_Y18ZUNopxvjHNNk','2020-01-25 21:51:24.342502','2020-02-05 21:51:24.000000',4,'b82b06879706482c8feac4f1addd8417'),(113,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MDkzOTk3MSwianRpIjoiYTUwODdmMjM0ZWFlNGMxNzhiZDZmNWE4OThiOTgxMDYiLCJ1c2VyX2lkIjo0fQ.Dd1NKNITNNLxecfmi0gQvTWoODuUCEORb1P-MzDDCb8','2020-01-25 21:59:31.104743','2020-02-05 21:59:31.000000',4,'a5087f234eae4c178bd6f5a898b98106'),(114,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTAyMDU0NSwianRpIjoiYTNjYjYyNTQ3ODI4NDQ1OGJhM2E1NjhhM2Q2YjljYmQiLCJ1c2VyX2lkIjoxfQ.1Zg6TLzXhftiBbjVBA5QdEqfHO3KNzckErS6QEXzFJM','2020-01-26 20:22:25.728976','2020-02-06 20:22:25.000000',1,'a3cb625478284458ba3a568a3d6b9cbd'),(115,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTA0NjM1NSwianRpIjoiNGUzYjU3NDljOTg5NDM2ODk3ODdlMWU2MmVlNzNjZjgiLCJ1c2VyX2lkIjoxfQ.Ihaxt-91XbhxEvfv_mGCjccai4VTEN6iIoWdRKzeB10','2020-01-27 03:32:35.912649','2020-02-07 03:32:35.000000',1,'4e3b5749c98943689787e1e62ee73cf8'),(116,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTA5MjM1NSwianRpIjoiMGJjYmY3OGFlMTM1NGFkZGFlNDI0OTNjM2U0NThmYzUiLCJ1c2VyX2lkIjoxfQ.WdUJHvzcAlhg1_qYKRpW_Yu5gCYkYkQ0m80sqWIDBgg','2020-01-27 16:19:15.433972','2020-02-07 16:19:15.000000',1,'0bcbf78ae1354addae42493c3e458fc5'),(117,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTA5NDQ2OSwianRpIjoiNjJkZWFkMGZmMTA3NDdkMzg0YWZlMDRiOGU0YTkzNjQiLCJ1c2VyX2lkIjoxfQ.4tYOEunPBVnvB6faE6xeJlJqaywINfYhXuBercDKX-Y','2020-01-27 16:54:29.881282','2020-02-07 16:54:29.000000',1,'62dead0ff10747d384afe04b8e4a9364'),(118,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTEyNzg3MywianRpIjoiYzE2M2VkZjE1NzViNGU3NGI2NDBlOTQ1Y2Q4YTk3YmEiLCJ1c2VyX2lkIjoxfQ.LHYipq53Pl81iVK0JbSK4JnIow9Z-cgKmaOFY7sRY8U','2020-01-28 02:11:13.368412','2020-02-08 02:11:13.000000',1,'c163edf1575b4e74b640e945cd8a97ba'),(119,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTM4Mjk5MiwianRpIjoiZGVkNjUxNWM3YzFhNDgxOWExNjFkZmY2ODA1NWM1OGMiLCJ1c2VyX2lkIjoxfQ.pdIYzAr1q4W9bTxBBLtECJ8jf9_z1kmyD0R0kzk5N3o','2020-01-31 01:03:12.476296','2020-02-11 01:03:12.000000',1,'ded6515c7c1a4819a161dff68055c58c'),(120,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTQxOTcxMSwianRpIjoiNWM4ZTNmYmY4YTJhNDMwMThiNzE5YjJlZDQyOTk4MjIiLCJ1c2VyX2lkIjo0fQ.qsXzz512dqivZDSGVI-k4xxTfvMyIraQ8VUU8mREebw','2020-01-31 11:15:11.886075','2020-02-11 11:15:11.000000',4,'5c8e3fbf8a2a43018b719b2ed4299822'),(121,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUyNTQyMSwianRpIjoiYTEzYzg5ZDNhY2RlNDE2YmJlYjAyOWFlOTAyMDFkYmQiLCJ1c2VyX2lkIjoxfQ.EVldGQ6vvuM077jjI401Vefn7CQGulY54N5YUFkBwIU','2020-02-01 16:37:01.521259','2020-02-12 16:37:01.000000',1,'a13c89d3acde416bbeb029ae90201dbd'),(122,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzMTQ2MiwianRpIjoiZGFlN2JiYzk4MWZhNDkyYmI1NzViMTAxNzFiODQzODAiLCJ1c2VyX2lkIjo0fQ.gMdmt4w_4Qsv4AHfx7ATSlveiePiD5xct0J14XJENRg','2020-02-01 18:17:42.868962','2020-02-12 18:17:42.000000',4,'dae7bbc981fa492bb575b10171b84380'),(123,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzNTQzMiwianRpIjoiMjk0MzhlMmEwMDYyNDczNmEzZTI4NDAxYTlkZDMxNzUiLCJ1c2VyX2lkIjoxfQ.3eGDweJDbPAwlUoHjQoFKwlcf8JilzMKFlgGpm2h30I','2020-02-01 19:23:52.394644','2020-02-12 19:23:52.000000',1,'29438e2a00624736a3e28401a9dd3175'),(124,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzNTQ0OCwianRpIjoiYTU3ZmU5N2YyNzNkNGZlY2I5OGRhNzRjNGRkODQ3MjYiLCJ1c2VyX2lkIjoxfQ.GP_JApkH_fps5pmPpCvDuZ2hpem0elEbR1hvYzEWefo','2020-02-01 19:24:08.943529','2020-02-12 19:24:08.000000',1,'a57fe97f273d4fecb98da74c4dd84726'),(125,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzNTg2NCwianRpIjoiYjdhMzFlOGI4OTUzNDk5N2IyMzE3MmM3MGY0NmIyMTYiLCJ1c2VyX2lkIjoxfQ.L2gFniLVIa6On6PlGKmY10lV4wOn47EKR_WWYEq1dCo','2020-02-01 19:31:04.001877','2020-02-12 19:31:04.000000',1,'b7a31e8b89534997b23172c70f46b216'),(126,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzNjM2MywianRpIjoiYzJhYzExZWI2MmM2NDk3ZTlhMmFjZjBkMGVkNmE3ZWQiLCJ1c2VyX2lkIjoxfQ.M1-tDPOjLU_blogPFyLX0G1lmXKo_hKEu89z45lHPmc','2020-02-01 19:39:23.359991','2020-02-12 19:39:23.000000',1,'c2ac11eb62c6497e9a2acf0d0ed6a7ed'),(127,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzNjgxMSwianRpIjoiNDIyYWFkYTMyODQ1NGMwOGJlNTUwNjE4OWJlYmRiZDAiLCJ1c2VyX2lkIjoxfQ.KjbdJKMThEzQpiIy1Ejd85GhKWam5zv4cY2DF8LX5cg','2020-02-01 19:46:51.457976','2020-02-12 19:46:51.000000',1,'422aada328454c08be5506189bebdbd0'),(128,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTUzOTg5MiwianRpIjoiMzI2MWE0ZGY3M2ZhNDYyY2EwNTMzNjg2ZjllMDhlNGIiLCJ1c2VyX2lkIjoxfQ.E-6-QpXMf-tsdvFOnrC4z3KCAxPSSD1WMRJOdr3DC2E','2020-02-01 20:38:12.800412','2020-02-12 20:38:12.000000',1,'3261a4df73fa462ca0533686f9e08e4b'),(129,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTU1MDk2NiwianRpIjoiYTUyNzQ4N2FjMGUyNDM2NjkxOTBjNzJmMDRlMzI0NzYiLCJ1c2VyX2lkIjo0fQ.o5dqQ0vfDD0YgDhHytnoLHpvewwVpM9UuToemMMATjU','2020-02-01 23:42:46.026786','2020-02-12 23:42:46.000000',4,'a527487ac0e243669190c72f04e32476'),(130,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTU1NjU0NywianRpIjoiYzQ5MjYyYmQ3YjI1NDgyOWE3MzJkZDNjMmRhNTQ0YzkiLCJ1c2VyX2lkIjoxfQ.vnoTZhspcS7pBvx_fl2qArnY8mFX1H7dyR5j234Zv9w','2020-02-02 01:15:47.094803','2020-02-13 01:15:47.000000',1,'c49262bd7b254829a732dd3c2da544c9'),(131,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTYzMjQyMSwianRpIjoiY2UyNDIyNzdiZjEyNGNmYWIxZmZmYmEwZjRlMWY3OTkiLCJ1c2VyX2lkIjoxfQ.rif-_S8jz6vkltABTquPAZFWCKhoxE95bKlIUkI8z-o','2020-02-02 22:20:21.247409','2020-02-13 22:20:21.000000',1,'ce242277bf124cfab1fffba0f4e1f799'),(132,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTYzMzg1NiwianRpIjoiY2I1NjQ3MmJmMzM4NDhhNDkwNDIzZmIwMDJmOTY5N2UiLCJ1c2VyX2lkIjoxfQ.Rc_4_CdgAhEkGRk905Tf4Sn4ONxnFVUtU0VoIT2Pxvs','2020-02-02 22:44:16.064749','2020-02-13 22:44:16.000000',1,'cb56472bf33848a490423fb002f9697e'),(133,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTYzNTExMiwianRpIjoiMjVkZmFkNjY4ZGY1NGU2YjhlOGJjZDkzZTA1MDAxZmMiLCJ1c2VyX2lkIjo0fQ.P5cdzSxTvsFSXhepfp-ey3TTar-MQKY-9LG1X4HwAcU','2020-02-02 23:05:12.104199','2020-02-13 23:05:12.000000',4,'25dfad668df54e6b8e8bcd93e05001fc'),(134,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTYzNTE5MywianRpIjoiYTE0YTIyY2M5YjcyNGIxYmI5MGVjNDlhNzQ4MTJmYzEiLCJ1c2VyX2lkIjo0fQ.62hbqwZboNcV71iLYFh9lbLmkEtZhLYquHTQaZAsXTE','2020-02-02 23:06:33.206773','2020-02-13 23:06:33.000000',4,'a14a22cc9b724b1bb90ec49a74812fc1'),(135,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyMzcyMywianRpIjoiZWYyMzAyZmQ0MDQ2NDdmNTg2MDFlZWQyYWRhNDVlNjQiLCJ1c2VyX2lkIjoxfQ.fdXi0oHCGQ3adIAno9KI_n-ySC0DmovaXaFbO2vZOG4','2020-02-03 23:42:03.087261','2020-02-14 23:42:03.000000',1,'ef2302fd404647f58601eed2ada45e64'),(136,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyMzkzNiwianRpIjoiZDYwMzY4OTNkOWNkNDE1NmIwZDc3MDkxMDhkMjZmYWYiLCJ1c2VyX2lkIjoxfQ.tEjTS_GtKeBOTbzK4VlSav0wKgQqVsxI08iKcpA81JA','2020-02-03 23:45:36.845006','2020-02-14 23:45:36.000000',1,'d6036893d9cd4156b0d7709108d26faf'),(137,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyMzk3MSwianRpIjoiZTc4ZDNkMGE2YTRmNGYxNWE1Njg5MDNkMWM1N2E5NTgiLCJ1c2VyX2lkIjoxfQ.blmd6235prtrPPtQtCchXjQo0SBYc8Yn4k51Ch8l0BM','2020-02-03 23:46:11.079243','2020-02-14 23:46:11.000000',1,'e78d3d0a6a4f4f15a568903d1c57a958'),(138,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDA1NywianRpIjoiYjg5MjcwMzIyNWYwNGJiMWEzMTMzMTljOGM4YWJiYmIiLCJ1c2VyX2lkIjo0fQ.1z5SudUe6b1z2f8FA88Ves34qKUPPm2vWB9KOyGomUM','2020-02-03 23:47:37.991995','2020-02-14 23:47:37.000000',4,'b892703225f04bb1a313319c8c8abbbb'),(139,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDE5MywianRpIjoiNzJiYTk4ODlkNjg5NGMzOWFiZDJlMjUyODFjMjAxN2IiLCJ1c2VyX2lkIjoxfQ.-V2SakUmnfCRSWsLW-7UKZNoS2vBC-jtzANhRd4RUMQ','2020-02-03 23:49:53.331695','2020-02-14 23:49:53.000000',1,'72ba9889d6894c39abd2e25281c2017b'),(140,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDMxOCwianRpIjoiMGQ0MTc1ZjYzYWE4NDU4ODk4NDg1YzY2YjVlYTZlYTMiLCJ1c2VyX2lkIjoxfQ.oo7vCMisaoEowqIdaxUsVPjkV9VvLx4pxGYMJZbViOY','2020-02-03 23:51:58.485503','2020-02-14 23:51:58.000000',1,'0d4175f63aa8458898485c66b5ea6ea3'),(141,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDQ4NywianRpIjoiNGM1NTAyNGRkYmE3NDgxZTgwNTgxY2EzMjI5MmUwMmUiLCJ1c2VyX2lkIjoxfQ.Fq7JNi6t9s_cSVRUcN8fFvAiHaJaHIqtwfIcCylcNLA','2020-02-03 23:54:47.661560','2020-02-14 23:54:47.000000',1,'4c55024ddba7481e80581ca32292e02e'),(142,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDYzMiwianRpIjoiN2ZmMzk0N2NkNTNmNDAxNThlMDQ4MmViZDAwZjc1ZjQiLCJ1c2VyX2lkIjoxfQ.-Wx4_HUdLmH_pGIsaaGS3i-zJc0d6eafSp6i8ynLYI0','2020-02-03 23:57:12.635736','2020-02-14 23:57:12.000000',1,'7ff3947cd53f40158e0482ebd00f75f4'),(143,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDcxNywianRpIjoiZGVmOTZjYTA0YTRmNGFjMmFlNGRiNjc1YWZmZGIzZGYiLCJ1c2VyX2lkIjoxfQ.vyNJmRK09S9Rmz0F0a2KjN23y-NDRD5Q5efAyK7j534','2020-02-03 23:58:37.841798','2020-02-14 23:58:37.000000',1,'def96ca04a4f4ac2ae4db675affdb3df'),(144,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTcyNDc1MSwianRpIjoiNTYxNTNkYzMxOTQwNDk1OThhODZlYjBmMmZhYWZjMTAiLCJ1c2VyX2lkIjo0fQ.Kjasky9w10h-Znn3Ee-bHXExgR9osjeEwDNnXTJ5GsU','2020-02-03 23:59:11.712739','2020-02-14 23:59:11.000000',4,'56153dc3194049598a86eb0f2faafc10'),(145,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTczODY3MiwianRpIjoiYWJkZTI0ZWE5ZDQ1NDkyYWJjYjA1NzdjMjAxZTU4YmQiLCJ1c2VyX2lkIjo0fQ.U2iHgDd6Vq99zseQPCGB0ciS9Jrl5sj4hORMvbVhcdg','2020-02-04 03:51:12.722366','2020-02-15 03:51:12.000000',4,'abde24ea9d45492abcb0577c201e58bd'),(146,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTc4MDQzNiwianRpIjoiMzgyNTg4NjZiNGQ5NDEwZTg5OTFmZTU0YmMyZjY1MzYiLCJ1c2VyX2lkIjoxfQ.kJFd8wE3fZMYW0Q1LZQfhx_IsmaL1wgsQ7O_yEI4Jkg','2020-02-04 15:27:16.276835','2020-02-15 15:27:16.000000',1,'38258866b4d9410e8991fe54bc2f6536'),(147,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTc4MzUzNSwianRpIjoiNDlkMWYxMDJlYjcyNDAzY2JkZTgyMmFiNzhkNGI5ZmUiLCJ1c2VyX2lkIjoxfQ.yp299nikFnT8QjE0T1RTxg7rpUwN7gBEIYEbvrnwerE','2020-02-04 16:18:55.987274','2020-02-15 16:18:55.000000',1,'49d1f102eb72403cbde822ab78d4b9fe'),(148,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwNTUyOSwianRpIjoiNjA2NmVjZGU5ZGY3NDI2NmFiMWJjNjI4ODg0YmMzMDIiLCJ1c2VyX2lkIjoxfQ.mlFrK9GVwZq83e2ipUrcUw38jnRIr7hJbLWDA2X6UZA','2020-02-04 22:25:29.171327','2020-02-15 22:25:29.000000',1,'6066ecde9df74266ab1bc628884bc302'),(149,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwNTY2MCwianRpIjoiMTBkY2MzZDE0NjUzNDI4MGEwY2I3NjY0YTUxYzBiMTIiLCJ1c2VyX2lkIjo0fQ.mLJ3QxxImByk3vwEeW3w9LCxy6vY694ibxy5pRN_BzI','2020-02-04 22:27:40.540463','2020-02-15 22:27:40.000000',4,'10dcc3d146534280a0cb7664a51c0b12'),(150,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwNTc1MywianRpIjoiNTI2MzIzOGNjMTA0NDI5OWIzN2I4MGRiZDJlYjEzMmIiLCJ1c2VyX2lkIjoxfQ.t2v3VMSphrGIZkhjUpJoJ5nYPk5txwv_86Ud0TTN8rs','2020-02-04 22:29:13.036127','2020-02-15 22:29:13.000000',1,'5263238cc1044299b37b80dbd2eb132b'),(151,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwNjY4OCwianRpIjoiMTU5MGMxYzNkZmEwNDk3ZjhiNDFjMmMxZTkyNWM0ODkiLCJ1c2VyX2lkIjoxfQ.1_xZ7jcHPak1-V0Id9Xdmjs9PNytHt6tDF_lLpewg50','2020-02-04 22:44:48.981936','2020-02-15 22:44:48.000000',1,'1590c1c3dfa0497f8b41c2c1e925c489'),(152,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwNjk4MywianRpIjoiMTFmNTAxN2U0ZmI5NDU3OGEzMmRkMTM2YjM2MDk2YmEiLCJ1c2VyX2lkIjoxfQ.UK9qnxItX03BlCiMY5g84rk6QsNDCZCLQHma_71aBls','2020-02-04 22:49:43.605812','2020-02-15 22:49:43.000000',1,'11f5017e4fb94578a32dd136b36096ba'),(153,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwNzA0OCwianRpIjoiOThkMGI1NTEzMTEyNDUwZmJkOWVjNTcyMzc3M2UwMTAiLCJ1c2VyX2lkIjo0fQ.EwTlbTnXayy78yvE0qNYbt0xkIK1EoWC0I83MRC1mS0','2020-02-04 22:50:48.642968','2020-02-15 22:50:48.000000',4,'98d0b5513112450fbd9ec5723773e010'),(154,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwODM1MiwianRpIjoiMzE2NmQ3ZWMxNDJmNGU4MWJmZWQzNTc5ZWM5OTU5MDgiLCJ1c2VyX2lkIjoxfQ.4ue4jXICnCaJiak_ETmTv2lHeuSZaaUGnzcVWlh3-7I','2020-02-04 23:12:32.459500','2020-02-15 23:12:32.000000',1,'3166d7ec142f4e81bfed3579ec995908'),(155,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwODc3MCwianRpIjoiMWIwYjJjOTIxOTY1NDFlNDgzMzkxODU5MTc0NGM2NDMiLCJ1c2VyX2lkIjoxfQ.PiEzvAqDN_Tshp68pd3do78_nbplTA6qVFRR3H7TBCg','2020-02-04 23:19:30.586911','2020-02-15 23:19:30.000000',1,'1b0b2c92196541e4833918591744c643'),(156,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwODg0NywianRpIjoiOWY3YWEzN2Y5N2FkNDRiZDhiOTBlMGIwYTFmNWRiNWQiLCJ1c2VyX2lkIjoxfQ.XQwyoM417-NWCPnXV8wJHn-gGzeK6N3-q_ks5h8YvM0','2020-02-04 23:20:47.305391','2020-02-15 23:20:47.000000',1,'9f7aa37f97ad44bd8b90e0b0a1f5db5d'),(157,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwOTQ2NSwianRpIjoiNzFlOTcyNTliMGY3NDhlNmE4NGVkODdlNDRjODJjODgiLCJ1c2VyX2lkIjo0fQ.UPGOaV45875I-GZ0-k5xuklsk86jxiFC1TkSJBaTbig','2020-02-04 23:31:05.529316','2020-02-15 23:31:05.000000',4,'71e97259b0f748e6a84ed87e44c82c88'),(158,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwOTYyNSwianRpIjoiY2Q2OTIyZDdlMjM3NDgzOTkxNTUwZGMwODhkYzAwMjMiLCJ1c2VyX2lkIjoxfQ.hxU4SyLQUmwtDrN4qYXUaswKpREi5tNXpXjljh14Lfc','2020-02-04 23:33:45.988369','2020-02-15 23:33:45.000000',1,'cd6922d7e237483991550dc088dc0023'),(159,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTgwOTc1MCwianRpIjoiYmRlZDE1NGMxNDEyNGYzZDg2ODZjY2M1ODU3Yzc5ZWEiLCJ1c2VyX2lkIjo0fQ._H7yhuGbzkyTqplp4l0HpA9bQVJuRFb7lMZPNbnlPT4','2020-02-04 23:35:50.973643','2020-02-15 23:35:50.000000',4,'bded154c14124f3d8686ccc5857c79ea'),(160,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTg3MDY2MiwianRpIjoiMjJiYmY0YWIyOGI2NGQ5OGIzMWQwYjJmNWVmMTk0ODYiLCJ1c2VyX2lkIjo0fQ.Wq_pAEizdgANiHG88jeCgYn0e8Nv1kTg9TQHwJAx0PQ','2020-02-05 16:31:02.426015','2020-02-16 16:31:02.000000',4,'22bbf4ab28b64d98b31d0b2f5ef19486'),(161,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTg3MTUwNiwianRpIjoiOTQ5MDRmZjRlOWE1NDg5MDkxZmQ3ZjFmNjk4OWIwMzUiLCJ1c2VyX2lkIjoxfQ.cg0qhgtvDBYw5iAxx3RUk5i71GxZzj8copm9Xv3K0o4','2020-02-05 16:45:06.418819','2020-02-16 16:45:06.000000',1,'94904ff4e9a5489091fd7f1f6989b035'),(162,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MTkwMzMwOCwianRpIjoiMzU3Y2I4ZTE3NmJiNGIxNGI4MWJkZjUxNzkzYmZjZjIiLCJ1c2VyX2lkIjoxfQ.9ygh7uVmZEfpwhujqdHuqsnrKHkJnZ6MP_BmvE0Su5I','2020-02-06 01:35:08.414046','2020-02-17 01:35:08.000000',1,'357cb8e176bb4b14b81bdf51793bfcf2'),(163,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjAzOTMxNiwianRpIjoiMDE1MWY5YzNmY2UyNDhiMTkyZjdmZGM4NTU3MDU4YjUiLCJ1c2VyX2lkIjoxfQ.hDk1JJCkyx9CI0TOONkTIPB8Bh6ArTdCCnvaRI_9e9Y','2020-02-07 15:21:56.465319','2020-02-18 15:21:56.000000',1,'0151f9c3fce248b192f7fdc8557058b5'),(164,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjE2MzYzOCwianRpIjoiNDliYzBmYmZiZmNhNDBhNmE4MWQ0YWE1YTUwYzk0YWYiLCJ1c2VyX2lkIjoxfQ.5qKyC0EPQrfbAgUiBMdqN8ekURYpflY5vPsehPnKXkY','2020-02-09 01:53:58.616078','2020-02-20 01:53:58.000000',1,'49bc0fbfbfca40a6a81d4aa5a50c94af'),(165,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjE2Njc3MCwianRpIjoiZDA4Nzk5ZDQ1YmZjNGExY2EyNTcyMjI2OGU5OTRkNGQiLCJ1c2VyX2lkIjoxfQ.d0yu5C_Odqs5_5xAcYFKz43DvO4KkXpVgpciktca3SA','2020-02-09 02:46:10.504998','2020-02-20 02:46:10.000000',1,'d08799d45bfc4a1ca25722268e994d4d'),(166,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjIwNzI1NCwianRpIjoiMjcwM2M5MTAwOWJlNGYxYjliMDJjNTI3NGQzYTk4ZDEiLCJ1c2VyX2lkIjoxfQ.FD2tJc-RDCInkaS-ynmHoaPHjtUs6DqZnJYiL1RaF4k','2020-02-09 14:00:54.146570','2020-02-20 14:00:54.000000',1,'2703c91009be4f1b9b02c5274d3a98d1'),(167,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjI1NjI4OCwianRpIjoiYTlhNzcxMDEzZWVjNDcwMzllNjVhZGIxNTE0MDBhNTgiLCJ1c2VyX2lkIjo0fQ.p2JkvRtDQbw0e0DdzPTpaMbg71JoDad7QgafFaqqNBw','2020-02-10 03:38:08.943155','2020-02-21 03:38:08.000000',4,'a9a771013eec47039e65adb151400a58'),(168,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjMwMjM5OSwianRpIjoiNjE3NWFkY2JmZWNhNGY5N2I0NDg4OWMyODdmODE3NDEiLCJ1c2VyX2lkIjoxfQ.JwtWpXlbE9_WsmDFhaUpUZ7no-taH7ifNyj1yV-0WGY','2020-02-10 16:26:39.155104','2020-02-21 16:26:39.000000',1,'6175adcbfeca4f97b44889c287f81741'),(169,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjMwMzQ3NiwianRpIjoiZjJmNTZkZDAzZGNmNDQ0MGI1NWRlMjQ2YzAzMmQ1MDkiLCJ1c2VyX2lkIjo0fQ.o24uIdRCTL_bSJTJ09O5p6pfHhML2z0vhuQNeJ0Zdio','2020-02-10 16:44:36.077053','2020-02-21 16:44:36.000000',4,'f2f56dd03dcf4440b55de246c032d509'),(170,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjMwMzgxMCwianRpIjoiOTk1OTBkNjFkNzhhNGYzNTkwNmM1NDQwODA0NzIzYWYiLCJ1c2VyX2lkIjoxfQ.eQh-VTbfLQ5F_uyLMttfnHsS-CxsMmTNawY5nP5_dYE','2020-02-10 16:50:10.903074','2020-02-21 16:50:10.000000',1,'99590d61d78a4f35906c5440804723af'),(171,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjMwMzg1MCwianRpIjoiYzJlYzIwNDE3MDRiNDkwYzgzNjlhZTU2NWQxYmQ5ODEiLCJ1c2VyX2lkIjo0fQ.sw9-BQMTAD-UyDB1e2QKv_7_1fHDybBY8SB5pK_vjig','2020-02-10 16:50:50.035404','2020-02-21 16:50:50.000000',4,'c2ec2041704b490c8369ae565d1bd981'),(172,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjMwMzkyOSwianRpIjoiNzgxMGY2ZGZiNTgzNDAyMmE3MjE3MTZlZGIwYzhkYzMiLCJ1c2VyX2lkIjoxfQ.D4BTBfD917szuhfoKw7rsY0kZ3pVkLYTt5Yso6r60Hc','2020-02-10 16:52:09.705583','2020-02-21 16:52:09.000000',1,'7810f6dfb5834022a721716edb0c8dc3'),(173,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjMwNDAxMiwianRpIjoiNGFjZTA3YTI1MDQxNDMzZWIzMjJkNDdjY2ZmMzY0MmQiLCJ1c2VyX2lkIjoxfQ.m0Mry1-xzp7QRquKJF960ronC-eE4clE3TMH0DBDJNw','2020-02-10 16:53:32.630711','2020-02-21 16:53:32.000000',1,'4ace07a25041433eb322d47ccff3642d'),(174,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjM5OTg5MCwianRpIjoiMjhlYzFhNjM2OGI5NDMzMGJjOTA2MmMwMWUwMDQzZDEiLCJ1c2VyX2lkIjoxfQ.p5LA8gE3mXKyuJB2b9Y7EXl_0qCIiyaTauClHsOlWQ4','2020-02-11 19:31:30.048180','2020-02-22 19:31:30.000000',1,'28ec1a6368b94330bc9062c01e0043d1'),(175,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwMDg2OCwianRpIjoiNTcyZmYxMTAxMzdlNGQzMDljNGM4YjdmMjk0NDBmNjAiLCJ1c2VyX2lkIjoxfQ.ZI_foxLYANxaUx60xXqS0j7tvHWtgixv7CE84mDCySs','2020-02-11 19:47:48.785457','2020-02-22 19:47:48.000000',1,'572ff110137e4d309c4c8b7f29440f60'),(176,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwMTI5MiwianRpIjoiMDAyNDA2Yzg5MDE3NDgyMjgzOGY2OWM5NTY4M2FmOTUiLCJ1c2VyX2lkIjo0fQ.RYr-Zs1oKa46E5IeUUbZ_3I6DavuiIgPaP5zZK52GE8','2020-02-11 19:54:52.425325','2020-02-22 19:54:52.000000',4,'002406c890174822838f69c95683af95'),(177,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwMjY5MiwianRpIjoiYjZmZTM2OWE3MGExNGE4Mzk5OGYwN2I1MjQzNmZjMDUiLCJ1c2VyX2lkIjo0fQ.Vzqr1mh3duP-eeNR-0LHjl2pfNw0XFdu3ahn3V1C99c','2020-02-11 20:18:12.327515','2020-02-22 20:18:12.000000',4,'b6fe369a70a14a83998f07b52436fc05'),(178,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwMjc0NywianRpIjoiM2I0NjE0YjM1YjViNDg2Y2FmZjZjYTkyYjgwMzBhYmUiLCJ1c2VyX2lkIjo0fQ.aZUMNKuA1ph7wMDwBKfh30ySJzFHIGSTX4kvgFYXayw','2020-02-11 20:19:07.402221','2020-02-22 20:19:07.000000',4,'3b4614b35b5b486caff6ca92b8030abe'),(179,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwMzA0MiwianRpIjoiY2RiYzM5ZDhlYWY4NDQxMDhlMGE2MzM2Nzg2OGY0NzQiLCJ1c2VyX2lkIjoxfQ.jC7CGZMidR11g8GlkbzvKl1DcZUAJHfA7CVsAGk4Gos','2020-02-11 20:24:02.192160','2020-02-22 20:24:02.000000',1,'cdbc39d8eaf844108e0a63367868f474'),(180,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwNjIzMSwianRpIjoiNmQ0Njg1NzFlNWM0NDY5MGE3OWQ0MDdhNmVlNWZhY2YiLCJ1c2VyX2lkIjo0fQ.v71iro7_2wbmTwCKtosjfiIOUj9kQ7q22sgQntosMiA','2020-02-11 21:17:11.600501','2020-02-22 21:17:11.000000',4,'6d468571e5c44690a79d407a6ee5facf'),(181,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwNjI5NiwianRpIjoiOTZiOGU2MDZlMDFiNDUwYTgwYzQ5YjNhYzQ2YzMxZGYiLCJ1c2VyX2lkIjo0fQ.EzA042fa2xPzK4nxVQx7Ah8yLab-x3mzDvKruFmMbxk','2020-02-11 21:18:16.753198','2020-02-22 21:18:16.000000',4,'96b8e606e01b450a80c49b3ac46c31df'),(182,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQwNzE0NSwianRpIjoiNzUzMjg5ZTZiYTBhNDkwMDhmZDdkZTI5NGRmYjY3NDkiLCJ1c2VyX2lkIjo0fQ.raAu_vXcY28Oq8axPpJ_Py6F-nq2lOROQuMlu3XzpTE','2020-02-11 21:32:25.373608','2020-02-22 21:32:25.000000',4,'753289e6ba0a49008fd7de294dfb6749'),(183,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQ3NDUzNiwianRpIjoiYWY1ODdjNjI0ZGY0NDkzODllMTllMzkxZGQ4MjZhNTUiLCJ1c2VyX2lkIjo0fQ.9OnEBarjRSWSt3rCnI6PmwIQXXM8AsOxHv7T1iy8H0U','2020-02-12 16:15:36.716728','2020-02-23 16:15:36.000000',4,'af587c624df449389e19e391dd826a55'),(184,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQ3NDk3NSwianRpIjoiNmFmODJlOTg5OTY1NDhiNjkwYTMwZWE4MGVjZDJmYzYiLCJ1c2VyX2lkIjoxfQ.ZzABjQ9DBQkJ3kga6DmIXajP6aKsCj0xGA2p7iOBOTY','2020-02-12 16:22:55.592716','2020-02-23 16:22:55.000000',1,'6af82e98996548b690a30ea80ecd2fc6'),(185,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjQ3Nzg0MywianRpIjoiNjQ1MWIyMmE1MzdhNDZlYWJiYzY5OTMxZmMyNjMwMTMiLCJ1c2VyX2lkIjoxfQ.i_9bZIcHmn51H-TxWJ9vieso_fsIL__42oBHcFXth6c','2020-02-12 17:10:43.607643','2020-02-23 17:10:43.000000',1,'6451b22a537a46eabbc69931fc263013'),(186,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjUwODA3OSwianRpIjoiODk5MGUwNzA0ZjA5NDdjNmExYTdhZmZiOGM4MTg5ZTQiLCJ1c2VyX2lkIjoxfQ.zkEy9JB5AuAj3mZd49_sHSN4rfZ_u9hGLlw96eBx_2I','2020-02-13 01:34:39.807835','2020-02-24 01:34:39.000000',1,'8990e0704f0947c6a1a7affb8c8189e4'),(187,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjU5OTU1MSwianRpIjoiMTAwZDQ5MjMwY2VhNDBkMTllY2Y1OGFkOTU5Njg0OGQiLCJ1c2VyX2lkIjoxfQ.54jwPvQjcG5pQZXSdAiH58O-cb9WS-6T6xFLPN2CShY','2020-02-14 02:59:11.264257','2020-02-25 02:59:11.000000',1,'100d49230cea40d19ecf58ad9596848d'),(188,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjgyMjIxMCwianRpIjoiNzFiNmI5N2RlYTJmNGQ1YTg0YWYwNTA2NGFiNTI3ZmMiLCJ1c2VyX2lkIjo0fQ.pwJwld4ccFrVwaLw-9JaHQvOuMCESzHWGbgBbQFircY','2020-02-16 16:50:10.569754','2020-02-27 16:50:10.000000',4,'71b6b97dea2f4d5a84af05064ab527fc'),(189,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4Mjg0MDQ5OCwianRpIjoiZDY4MWNjNGJkMWUyNDk1ZDg3NTVmMGNhYzE2YWNjOGYiLCJ1c2VyX2lkIjoxfQ.j_wZTY6i66Zc_aldyTs73j82mwsIhHpFSwqqLA7mHm4','2020-02-16 21:54:58.837884','2020-02-27 21:54:58.000000',1,'d681cc4bd1e2495d8755f0cac16acc8f'),(190,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjkxMTE1NywianRpIjoiMjcwNTMwYThiNTY0NDRjM2JiYjg5MzNjMTcwOWFlNDciLCJ1c2VyX2lkIjoxfQ.ePyoh2Ikgk0G82xDzghAv7rq04XysTb6-TiPpZPYLrk','2020-02-17 17:32:37.835590','2020-02-28 17:32:37.000000',1,'270530a8b56444c3bbb8933c1709ae47'),(191,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjkyNzg1MywianRpIjoiMzZiNTQ4OWRjYWUzNGJiMmIzM2Q4ZWYzNmZiMTVhNzUiLCJ1c2VyX2lkIjoxfQ.esaq4jl83C4e7mkngR48hYJBp0Jyg1Lj6PrMXvEFnBY','2020-02-17 22:10:53.226650','2020-02-28 22:10:53.000000',1,'36b5489dcae34bb2b33d8ef36fb15a75'),(192,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4MjkyOTExNywianRpIjoiYzM3NDY1ZjFiZTI1NDQzYmE5ODRmMzlkNzgzOGFjYjQiLCJ1c2VyX2lkIjoxfQ.zuC8VsT2B-zdv7ZxugiM6-YUHInnlPTkDCUOAWat86U','2020-02-17 22:31:57.993656','2020-02-28 22:31:57.000000',1,'c37465f1be25443ba984f39d7838acb4'),(193,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU4OTgyODY5NCwianRpIjoiZjQyZWIxZDVjNDcxNDliMTkyOWUzNzIwNDZjZDQzN2UiLCJ1c2VyX2lkIjo0fQ.CMMrhpEkP9-_tAZ5UbYdiXn-GfK9FEaVIcaqpqNBEC8','2020-05-07 19:04:54.218882','2020-05-18 19:04:54.000000',4,'f42eb1d5c47149b1929e372046cd437e'),(194,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjIyNjkzNywianRpIjoiY2I1NjUzNDFmZTA2NDQ0NzgzNWY3NDEzZGNjZGFlZjMiLCJ1c2VyX2lkIjoyfQ.Kqj6rmliAaGCScHrq4dW5ImfKDsiSDeimeRG1cv-5XI','2020-07-20 20:22:17.966859','2020-07-31 20:22:17.000000',2,'cb565341fe064447835f7413dccdaef3'),(195,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjIyNzA1MiwianRpIjoiYmI5ZjhhODY0MDNhNDA2ZDhhMWJhNmQ0ZDYxOGU0ODUiLCJ1c2VyX2lkIjoyfQ._vkwNSHKj4xyi3Z1QLur8MFLEMjvThjsT6bJFzF1luU','2020-07-20 20:24:12.840095','2020-07-31 20:24:12.000000',2,'bb9f8a86403a406d8a1ba6d4d618e485'),(196,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjMyMzEzMywianRpIjoiOGFjZTMyODBiODk2NDRkNjhjMzNkNDAyNTBjNjk2ZGIiLCJ1c2VyX2lkIjoyfQ.ctNH3AYAUz2foXU_pgfTzdXhikQ3A9O1j2czFBnbeyY','2020-07-21 23:05:33.619604','2020-08-01 23:05:33.000000',2,'8ace3280b89644d68c33d40250c696db'),(197,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjMyNDA3NywianRpIjoiZGRlM2NlZWIzMjY5NDhlMjhiYmFkOTE5MTdlMWJlZmUiLCJ1c2VyX2lkIjoyfQ.YySRZ5-uOuiWBRxoWVYjWZ9ogFXYEyZ0wNm81X0L5BQ','2020-07-21 23:21:17.008477','2020-08-01 23:21:17.000000',2,'dde3ceeb326948e28bbad91917e1befe'),(198,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjU1MTgwMSwianRpIjoiZDBlODFiZjIxODVmNDExMGJhYmE3NGM5YmE3MTQ0M2UiLCJ1c2VyX2lkIjoyfQ.7hgIpydn4fkFjLdU4z1nOpNSwn6mQBqbL-uRy5kRFkc','2020-07-24 14:36:41.398517','2020-08-04 14:36:41.000000',2,'d0e81bf2185f4110baba74c9ba71443e'),(199,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjU1MTgwMywianRpIjoiZGU1MzRkOGQ4ZmRmNGViZTk0NmY4YzM1NTViYTdhYjMiLCJ1c2VyX2lkIjoyfQ.srgmeoG1_3AzWlSlIdq7MZT1mwva7TpW7D4zWfahG98','2020-07-24 14:36:43.040517','2020-08-04 14:36:43.000000',2,'de534d8d8fdf4ebe946f8c3555ba7ab3'),(200,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjU3NDQ0NCwianRpIjoiNGE5OTA2N2QyYmQ0NDZmNWI5MmRjNGIwYzhiYzAwZjgiLCJ1c2VyX2lkIjoyfQ.QwML763AFR3MLvYT-umcld3OpzYIUPjFdURPk1kLcFk','2020-07-24 20:54:04.509702','2020-08-04 20:54:04.000000',2,'4a99067d2bd446f5b92dc4b0c8bc00f8'),(201,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjU3NDUwMiwianRpIjoiN2I1MmU4ZjEwZWNhNGQxOWJhODRjNGM3ZmRjNGEzNjEiLCJ1c2VyX2lkIjoyfQ.wcsYjwePVltsREh0kC4nqHXtemK8dxxGu6xXmRX9qqw','2020-07-24 20:55:02.535776','2020-08-04 20:55:02.000000',2,'7b52e8f10eca4d19ba84c4c7fdc4a361'),(202,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjU3NTI5NSwianRpIjoiOTEyMTg5MGZlMzA1NDY5N2IwMDBkNGMyZjM3ZDk1NzUiLCJ1c2VyX2lkIjoyfQ.dy6xdlCUaGus7xpsxLFfAnlPpFXBa6wLYCdEsqeYRFU','2020-07-24 21:08:15.305161','2020-08-04 21:08:15.000000',2,'9121890fe3054697b000d4c2f37d9575'),(203,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0MzY4MywianRpIjoiM2FiNjJkMjVkMzc1NDBiMWE5NzEyNDgzM2E4Njk0ZjEiLCJ1c2VyX2lkIjoyfQ.kpgz8EM7SJQa5MojDm4C3EcKiUYArsNwR2_Yq-euHI8','2020-07-25 16:08:03.188284','2020-08-05 16:08:03.000000',2,'3ab62d25d37540b1a97124833a8694f1'),(204,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0MzkwNSwianRpIjoiZjk2YjIzOTMxODEwNDlmNzlkMjk4NDdlMWE3ODU5NTMiLCJ1c2VyX2lkIjoyfQ.dKvp8UwDb9YEkcHFdmVf6nHbiGNMOXK5UN9ywKW_kgA','2020-07-25 16:11:45.682645','2020-08-05 16:11:45.000000',2,'f96b2393181049f79d29847e1a785953'),(205,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0Mzk3OCwianRpIjoiMTMzM2RjOGQwMWZhNGJlYTk3NWMwZjQxZjQ5MDQwMmUiLCJ1c2VyX2lkIjoyfQ.iaRlCs_RgYAT0geQ7YlivtUeVDvUoypbDHng5ba8zhw','2020-07-25 16:12:58.910205','2020-08-05 16:12:58.000000',2,'1333dc8d01fa4bea975c0f41f490402e'),(206,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0Mzk4NCwianRpIjoiYWUyYzQ1NDg2MjhjNGFiZWE3NTMxNWQ2MGM0ZjgzNjkiLCJ1c2VyX2lkIjoyfQ.wYkXWn_nhNX1MCZ0HEwboL6CMzWcmE4hC10fM0ayCHo','2020-07-25 16:13:04.031493','2020-08-05 16:13:04.000000',2,'ae2c4548628c4abea75315d60c4f8369'),(207,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0Mzk4NSwianRpIjoiY2IwNDI4N2U1Y2VmNDViOWI5Y2MzM2ZhZmIyNWI1NGEiLCJ1c2VyX2lkIjoyfQ.VtH2HJYgU1gJI9dqUUr3HCKvKLgiMP6vCWH0iOKdgDM','2020-07-25 16:13:05.133861','2020-08-05 16:13:05.000000',2,'cb04287e5cef45b9b9cc33fafb25b54a'),(208,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0Mzk4NSwianRpIjoiZjM3ZGI3ZjgxZDRlNDliNWI2Nzg2OGJmNDNmZTgxYjgiLCJ1c2VyX2lkIjoyfQ.479MoqwQKAr2avi4GPAUdPFyhDLHtoWiQzpdVDcQNFQ','2020-07-25 16:13:05.993194','2020-08-05 16:13:05.000000',2,'f37db7f81d4e49b5b67868bf43fe81b8'),(209,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0NDEwOSwianRpIjoiNzFiZTFhMDRmNDRlNGNlMTg0MDllMGJkOGJmM2RmZDciLCJ1c2VyX2lkIjoyfQ.nrnTFjYM3L0sbskKMRg2gPnbTvclLrKMhHPSp5n5bO4','2020-07-25 16:15:09.349415','2020-08-05 16:15:09.000000',2,'71be1a04f44e4ce18409e0bd8bf3dfd7'),(210,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0NDE4NSwianRpIjoiNmNjMjA2MmIyY2EyNDU0YTlhMzRhYmQ3YTlmMmZjYTIiLCJ1c2VyX2lkIjoyfQ.fRMYvaC72C_LzINSTaWcxgIpOmIK3KnoKEOCUhZ8B-w','2020-07-25 16:16:25.045386','2020-08-05 16:16:25.000000',2,'6cc2062b2ca2454a9a34abd7a9f2fca2'),(211,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0NDE4NywianRpIjoiYWU5NGQ0OTNjMzQ3NDUwYmFiY2ExNDgzMTZkODY0ZWIiLCJ1c2VyX2lkIjoyfQ.-QCUQ2yH8xPCAybjVW5A-RrPv-iPCbXZFN4u7-aeXWY','2020-07-25 16:16:27.712574','2020-08-05 16:16:27.000000',2,'ae94d493c347450babca148316d864eb'),(212,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0NDE5NywianRpIjoiMDJiZDg5N2NmYmY2NDhiOGIzYTY3MTg5Njc3OTA4Y2IiLCJ1c2VyX2lkIjoyfQ.hQmz2IkviI4vIO0jymWlIJkun2fNrLOG-F2EyiBSS70','2020-07-25 16:16:37.179101','2020-08-05 16:16:37.000000',2,'02bd897cfbf648b8b3a67189677908cb'),(213,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NjY0NDE5OCwianRpIjoiYTQ1ZjM2YjkyYzYwNGY0OGE3MGNkNjVmMjM5NzQ1MTkiLCJ1c2VyX2lkIjoyfQ.sI4zKFePqHw_F0GW1Pqe_EbVZ3J-dhMwi4cH5lqX_cg','2020-07-25 16:16:38.529358','2020-08-05 16:16:38.000000',2,'a45f36b92c604f48a70cd65f23974519'),(214,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5NzE3Njc1MSwianRpIjoiZmI1NWIwMjQ5MWFkNDllMGJlN2M5ZTZkMmUyYzVlZTciLCJ1c2VyX2lkIjoyfQ.IoX_nE8ver4nJImx8M0TiQqwD6iL4EAAbR5i-9KL3P8','2020-07-31 20:12:31.843544','2020-08-11 20:12:31.000000',2,'fb55b02491ad49e0be7c9e6d2e2c5ee7'),(215,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODYyOTkyMiwianRpIjoiZWM5ZjdiNGMyNjRkNDU4NTliMzQ5ZjA0NDFhYzczOTciLCJ1c2VyX2lkIjoyfQ.hfe5VDd3P-PnBRbnKsCbOCazxt4peFhYFn-4iaaMgZM','2020-08-17 15:52:02.976662','2020-08-28 15:52:02.000000',2,'ec9f7b4c264d45859b349f0441ac7397'),(216,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODYyOTk2NSwianRpIjoiZmRhNDAyODVjNzYzNDg4ZGEyMzMwYWIxYTQ5NDIwNGQiLCJ1c2VyX2lkIjoyfQ.L7QfchSE2o_01-SS8glRV_gCstX4Un-f8lRyXuerVnA','2020-08-17 15:52:45.197166','2020-08-28 15:52:45.000000',2,'fda40285c763488da2330ab1a494204d'),(217,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODY1MTEzMywianRpIjoiNTg4NGI4ODM5MjU4NDc5MjhlZDQxY2MwZDU2YTlmYjgiLCJ1c2VyX2lkIjoyfQ.L6CkzrYJdQZ7LwNg09xctOFdQp34HP9ovD39DGt2ONM','2020-08-17 21:45:33.337855','2020-08-28 21:45:33.000000',2,'5884b883925847928ed41cc0d56a9fb8'),(218,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5NjI3OCwianRpIjoiNzc4N2UyM2QxMDMxNGExYmFkMzI0ZGUzNTQ0ZTRlMTIiLCJ1c2VyX2lkIjoyfQ.oBl1s2Yqn9bqWmT_ez_m5b7gY5BOrC61Pxv41HT1NdU','2020-08-19 14:04:38.353667','2020-08-30 14:04:38.000000',2,'7787e23d10314a1bad324de3544e4e12'),(219,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5NjM0NywianRpIjoiZTI0YTAyNDFjODUyNDZiMmFkYjg2NjEzYTA5YmU0M2IiLCJ1c2VyX2lkIjoyfQ.EGAeNdrMC15YPUmU_G4O-IrnylYuL1ywVzwWL2cMU7I','2020-08-19 14:05:47.281863','2020-08-30 14:05:47.000000',2,'e24a0241c85246b2adb86613a09be43b'),(220,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5NjM3NiwianRpIjoiNzlhZDFhMjMxZTkzNGM1ZWE0OWVmYmYzMzc5MTBlNWQiLCJ1c2VyX2lkIjoyfQ.8GKK0ui4Xou74tsLoZV6NTRRI_EJRuSJ0-jGVz1wYPY','2020-08-19 14:06:16.263503','2020-08-30 14:06:16.000000',2,'79ad1a231e934c5ea49efbf337910e5d'),(221,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5NjU4MCwianRpIjoiZWYzMjQxM2YzMzEzNDYyMzgxYTZmMTg4MDBmNDgwMDAiLCJ1c2VyX2lkIjoyfQ.kwmOkuYqZ-MXw1NM3iCSuU9KtE8TvbSX1DbQ5Ds8jkY','2020-08-19 14:09:40.555150','2020-08-30 14:09:40.000000',2,'ef32413f3313462381a6f18800f48000'),(222,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5NjkwNSwianRpIjoiMzRhZjRmYTQ4NWMyNGUyNGEzNDI4ZGZhODY4OWM2ODMiLCJ1c2VyX2lkIjoyfQ.fenYXQAr6zuI2zc1XB5k4YUfk90tKw4pOgMJhB_81xU','2020-08-19 14:15:05.849478','2020-08-30 14:15:05.000000',2,'34af4fa485c24e24a3428dfa8689c683'),(223,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5Njk0MiwianRpIjoiYjFlN2QwNDNlNjFiNGFhMzgwMzA1NjNhNWQ3YWFjNGEiLCJ1c2VyX2lkIjoyfQ.qxaGltawRIPP93AjhhauwOorgtMGmpik3GHEUQesbAM','2020-08-19 14:15:42.194156','2020-08-30 14:15:42.000000',2,'b1e7d043e61b4aa38030563a5d7aac4a'),(224,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODc5NzA1NCwianRpIjoiOThlOTFhZGVjNGY4NDFmYTk5ZjhjNWM3MWIzNTM0NDgiLCJ1c2VyX2lkIjoyfQ.IoDUxMGi04RQ4Az3wRZOG9pNgG1clD9d7_Z3MvPMkR8','2020-08-19 14:17:34.582682','2020-08-30 14:17:34.000000',2,'98e91adec4f841fa99f8c5c71b353448'),(225,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMjk5MywianRpIjoiYTNjNGJjODRlMWQwNDk1Y2JmZTg2YzY4NmY1ZTNiZGUiLCJ1c2VyX2lkIjoyfQ._xumph6Hv7baf-DcU7niMUGFx-SDlo5E_VIvUMA0JdA','2020-08-19 15:56:33.646609','2020-08-30 15:56:33.000000',2,'a3c4bc84e1d0495cbfe86c686f5e3bde'),(226,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMjk5NCwianRpIjoiOTU1OTAxMjcxZDgzNGRmMmJmNWJiNTFjMmUzNTBjOWIiLCJ1c2VyX2lkIjoyfQ.hqqPIDGjnyXz8oq8G2AZB8_x-4_-z2XGLPQdewyPGHk','2020-08-19 15:56:34.113869','2020-08-30 15:56:34.000000',2,'955901271d834df2bf5bb51c2e350c9b'),(227,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMjk5NCwianRpIjoiNWVjZjQ1MjRlOTE4NDUxOTlmYjI2MzI0ZjNmNTIxZjIiLCJ1c2VyX2lkIjoyfQ.8b0Y-bvJmrasYrrBfzKap-h65j4bga65-6huGE53coY','2020-08-19 15:56:34.514082','2020-08-30 15:56:34.000000',2,'5ecf4524e91845199fb26324f3f521f2'),(228,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MCwianRpIjoiYTVmZWNlMDgyZjg0NDhhOGI0NjdjOTZjMmM2ZDUwZjYiLCJ1c2VyX2lkIjoyfQ.q6Dkob1mYFzOE_0V8yhx003bXLYJtGOaYPSYoMygtTM','2020-08-19 15:59:50.584002','2020-08-30 15:59:50.000000',2,'a5fece082f8448a8b467c96c2c6d50f6'),(229,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MCwianRpIjoiMDYwNzdjMjIxNDQ5NDZkNmE5NDhiZWU3ZDhmMGY4MWUiLCJ1c2VyX2lkIjoyfQ.hIr9EoOSKw4vLdYnQIFadNR-w9BPsoSKgwVryUBghBw','2020-08-19 15:59:50.955998','2020-08-30 15:59:50.000000',2,'06077c22144946d6a948bee7d8f0f81e'),(230,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MSwianRpIjoiZGEwMDNkM2M3MTIzNDBkYjliZmUxZjA4NTllNjM2YTMiLCJ1c2VyX2lkIjoyfQ.1kHg3kIBMDsV94fbLMK6lvWnOZwOEH1fqH1w9y77hxo','2020-08-19 15:59:51.093498','2020-08-30 15:59:51.000000',2,'da003d3c712340db9bfe1f0859e636a3'),(231,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MSwianRpIjoiMDA2ODAxOGUxN2ExNDc0ZWIxNmRhOTFkMDcxODEwNGQiLCJ1c2VyX2lkIjoyfQ.Rqq60HPeqKmZGoxW5po8FwHJ7nrsdJOdAFhtb_-tyTU','2020-08-19 15:59:51.328312','2020-08-30 15:59:51.000000',2,'0068018e17a1474eb16da91d0718104d'),(232,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MiwianRpIjoiNmU5YThiNjY1MDVlNGFhY2I0MjZjOTg1MTgyNGE1NzIiLCJ1c2VyX2lkIjoyfQ.HT_KgCOQeqg03_9eRGGckF2yFHxVhOtDyb6LviXhloQ','2020-08-19 15:59:52.462592','2020-08-30 15:59:52.000000',2,'6e9a8b66505e4aacb426c9851824a572'),(233,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MywianRpIjoiMTcyMDE1OTAxMDBhNDQ2NDg3ZTRiZmVhY2U3MmRhYzUiLCJ1c2VyX2lkIjoyfQ.-uuDeDeDbk9TGVeMsAOqyS4lUfPt8m2ofZUOlL2xcA0','2020-08-19 15:59:53.901242','2020-08-30 15:59:53.000000',2,'17201590100a446487e4bfeace72dac5'),(234,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwMzE5MywianRpIjoiMzM3NjkxY2Q5NGUzNGQ3Y2FiNmYxMzJlNDlmMDBlMmEiLCJ1c2VyX2lkIjoyfQ.VMsDerNbwKegAIBx8gfRqWisyKRCGk7OGFE2LqML6mc','2020-08-19 15:59:53.926233','2020-08-30 15:59:53.000000',2,'337691cd94e34d7cab6f132e49f00e2a'),(235,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwNjA0OCwianRpIjoiM2Y3NzFhNzBkYmM1NDVkMjllNWVjYzRkNjk1MjRlOGUiLCJ1c2VyX2lkIjoyfQ.gL29mU7Tho4hhqiuGFIi7h9Z404QOxPw6ZpPdQdW9EU','2020-08-19 16:47:28.128401','2020-08-30 16:47:28.000000',2,'3f771a70dbc545d29e5ecc4d69524e8e'),(236,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwNjEyMSwianRpIjoiZjY3N2Y2M2RlNTRhNGQ3NmE3Mjg0MzlkMzA1MGFlMzUiLCJ1c2VyX2lkIjoyfQ.K08W7tSN2JiXDBoqsDD6QYieZ0zyDy1GfwRtIoxA-qE','2020-08-19 16:48:41.849934','2020-08-30 16:48:41.000000',2,'f677f63de54a4d76a728439d3050ae35'),(237,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwNjE0NiwianRpIjoiNDZhM2I2YzAzOThmNDIwZjkwZjk3MDY1MzdmNDU2YzgiLCJ1c2VyX2lkIjoyfQ.raAr0-BKEtr-R0DXQT_HuVyhMQ0gFkCPAsQ92vQDODo','2020-08-19 16:49:06.980377','2020-08-30 16:49:06.000000',2,'46a3b6c0398f420f90f9706537f456c8'),(238,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwNjI3MCwianRpIjoiZTU5YjcyMDM3MWZkNDhlN2FlMzFhZjA2ZmFkZjdmOGMiLCJ1c2VyX2lkIjoyfQ.KTegSW_08x4YhZjud8PxQJzTi51WZ-TmVXQwntu0IvA','2020-08-19 16:51:10.329746','2020-08-30 16:51:10.000000',2,'e59b720371fd48e7ae31af06fadf7f8c'),(239,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgwNjI4NywianRpIjoiZmQxNTgyZDY1Y2ViNGVjOGJmODY5OGUyOWMwODg5NjUiLCJ1c2VyX2lkIjoyfQ._G79jMs0Hy2NWgL4iuhWI2ls986LuTtAZazuw8hfpgM','2020-08-19 16:51:27.260915','2020-08-30 16:51:27.000000',2,'fd1582d65ceb4ec8bf8698e29c088965'),(240,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgxOTYzMSwianRpIjoiMDI3MTliYTM0MmI1NGYyOWIxMjBmMDY3N2Q1YzI0MzgiLCJ1c2VyX2lkIjoyfQ.DcLXxkpsSV_0_9vTIFRA8VHflwf8yNwH0UpBEttGcL0','2020-08-19 20:33:51.985409','2020-08-30 20:33:51.000000',2,'02719ba342b54f29b120f0677d5c2438'),(241,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgxOTczMiwianRpIjoiYWI2YTMyYjkxNjIwNGZiNjkwNjI3MTQ2MDllZTQ3OWQiLCJ1c2VyX2lkIjoyfQ.ehIj-tOfsY6JxZ_B4dMyYArY1-xvVsm9yWyT6HvoiBE','2020-08-19 20:35:32.429183','2020-08-30 20:35:32.000000',2,'ab6a32b916204fb69062714609ee479d'),(242,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgxOTg4NSwianRpIjoiNjA5OTVmN2FhOTBjNDNhYWFiZTMwNDViZTRmYTYzNGYiLCJ1c2VyX2lkIjoyfQ.lpb0IG3HRRaSbMpJ-SUUkHLXYx350csNmzatRpTP5nw','2020-08-19 20:38:05.160249','2020-08-30 20:38:05.000000',2,'60995f7aa90c43aaabe3045be4fa634f'),(243,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgxOTkyNSwianRpIjoiZjJjMzg5MjBjMmY1NGFmMGIyYjNhNDBhN2Q4ZWFjYmMiLCJ1c2VyX2lkIjoyfQ.5TfcqGXHd041xrP8ASfuHwuCK7ueNelNv2Vr8LVjYFg','2020-08-19 20:38:45.964748','2020-08-30 20:38:45.000000',2,'f2c38920c2f54af0b2b3a40a7d8eacbc'),(244,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyMDAxMSwianRpIjoiZWEwOGJkNWM2Mjc4NGVmODlkZDkyNTdiOTQyM2FmOWMiLCJ1c2VyX2lkIjoyfQ.BupcJvtSeIFm2kUU3w7K-1jcc-D0rQqeXgqWitBU2G8','2020-08-19 20:40:11.486766','2020-08-30 20:40:11.000000',2,'ea08bd5c62784ef89dd9257b9423af9c'),(245,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyNTc1NywianRpIjoiNWRjZDIwZTE0MDc3NDZhOWI4NjcxNTgxMmNlNDkyZjMiLCJ1c2VyX2lkIjoyfQ.QXIG9utDs51AB0UrnsBiJ_Dw48cLMIheQy_iH2FCOTk','2020-08-19 22:15:57.531803','2020-08-30 22:15:57.000000',2,'5dcd20e1407746a9b86715812ce492f3'),(246,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyNTk2NCwianRpIjoiNzAzMDFjN2FmZmVjNDY4M2I5NGRhZmZlY2U3ZjBmOGIiLCJ1c2VyX2lkIjoyfQ.qaG_m3BjANZc_lK-vQ4opioRmACGiYo4IxSpb7DhnBU','2020-08-19 22:19:24.688692','2020-08-30 22:19:24.000000',2,'70301c7affec4683b94daffece7f0f8b'),(247,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyNzcyOSwianRpIjoiMWM3YjEyNjNmOWVkNDBmYmE3MzIyNzM3OTcwYmRhNzIiLCJ1c2VyX2lkIjoyfQ.tQ2kjdWMdyhDiRRpYzBmu6Ij-3GooG1OrJnU4HFdKrA','2020-08-19 22:48:49.502753','2020-08-30 22:48:49.000000',2,'1c7b1263f9ed40fba7322737970bda72'),(248,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyNzgyNiwianRpIjoiMjFhMDFkNTM5NWY5NDFjODllZmQyNzFjZWM2ODA5YzMiLCJ1c2VyX2lkIjoyfQ.v8WiWEjqxDs09G4BdH_Y4bUcFv0Qst5k3rvJFDfhSMk','2020-08-19 22:50:26.553566','2020-08-30 22:50:26.000000',2,'21a01d5395f941c89efd271cec6809c3'),(249,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyNzkyMywianRpIjoiNWM3MzliOWRiMjhmNGMyY2EwODZlN2YzMzI4NzJiMjciLCJ1c2VyX2lkIjoyfQ.gh1tmfoSqgFXdA3J2drorbd9GWXWCRW46EO_eGmvp8I','2020-08-19 22:52:03.288057','2020-08-30 22:52:03.000000',2,'5c739b9db28f4c2ca086e7f332872b27'),(250,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODgyODAxNywianRpIjoiN2E1MjA1ZThjMjQwNGU1ZmFlN2QwMTU4ZjU5ZmQzYmEiLCJ1c2VyX2lkIjoyfQ.LmeNHDFdq8WjGqCUzrf74oKMnR92QdZ-pZehEAKOzgA','2020-08-19 22:53:37.197234','2020-08-30 22:53:37.000000',2,'7a5205e8c2404e5fae7d0158f59fd3ba'),(251,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5Nzk2NCwianRpIjoiMzFjOTAyNzkzZjVlNDFlNGFhZWM4ZjY1ODIwNTJmM2QiLCJ1c2VyX2lkIjoyfQ.jeqiRfd4SBpnOnB7OoG6-Dy2p-duiMDFNlEPYxBFLOk','2020-08-20 18:19:24.224047','2020-08-31 18:19:24.000000',2,'31c902793f5e41e4aaec8f6582052f3d'),(252,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5Nzk2NCwianRpIjoiNTEyZjVjMjEyNTc2NDJjYjg2NmYxYjlmNjI1NGFkZTgiLCJ1c2VyX2lkIjoyfQ.V681oCl_DBgFfg0bXWf0BcISIi_mJzDBRzQcfC2I9so','2020-08-20 18:19:24.503245','2020-08-31 18:19:24.000000',2,'512f5c21257642cb866f1b9f6254ade8'),(253,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5ODA2NywianRpIjoiZjEzM2E0NjU5MTc0NGU0Zjg0NDVmMzRmY2FhNzRkYzgiLCJ1c2VyX2lkIjoyfQ.wYwIdnTMtrz3Y1B0zZTfsbPUUMe6oaTi7mI9shtd4Ho','2020-08-20 18:21:07.753399','2020-08-31 18:21:07.000000',2,'f133a46591744e4f8445f34fcaa74dc8'),(254,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5ODE2MCwianRpIjoiMTEzNjU3ZGUzYWQ2NDZhYTgxNGZkNmVjYWZiY2QyMWYiLCJ1c2VyX2lkIjoyfQ.9cqO2CGpxCrZ9gUoIbMyK3u8AhMoINquCkesa8V18wE','2020-08-20 18:22:40.093376','2020-08-31 18:22:40.000000',2,'113657de3ad646aa814fd6ecafbcd21f'),(255,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5ODIyMCwianRpIjoiYzkyZWRmMDkwOGM0NDdkNGE0YmJjYmRhMzFiODBlOTAiLCJ1c2VyX2lkIjoyfQ.F5XDm9oiIBdoRZgenKe00VEG-vtCABX6jR2rFG6XnMo','2020-08-20 18:23:40.067061','2020-08-31 18:23:40.000000',2,'c92edf0908c447d4a4bbcbda31b80e90'),(256,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5ODI4NSwianRpIjoiYWY5NDU2ZmU2MTViNDRmOWJiMGQ1OGM2YjY3ZTJlN2QiLCJ1c2VyX2lkIjoyfQ.ynavwfFlHdxCQAh7yh0U_Yzb5AhDLXJpP4jaInEo6e8','2020-08-20 18:24:45.586612','2020-08-31 18:24:45.000000',2,'af9456fe615b44f9bb0d58c6b67e2e7d'),(257,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5ODMwMSwianRpIjoiMGZjZmQ0NzdiZGE3NGQxYTgyNTdlOTJhZmY3ZWE0ZDQiLCJ1c2VyX2lkIjoyfQ.W-XtyrovC3Q8dUdlzMtkvoHB3PyeYLTjrODw3CJU_dQ','2020-08-20 18:25:01.877070','2020-08-31 18:25:01.000000',2,'0fcfd477bda74d1a8257e92aff7ea4d4'),(258,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5ODg5ODM0MSwianRpIjoiNjhiMTkyNzUzMmM5NDljZDhmZDQ3NGIxOWZhZTJmMzUiLCJ1c2VyX2lkIjoyfQ.Ilr6sihtTOdhnzwfd4GxUJ0NqCByebhcixLLjkxZKWU','2020-08-20 18:25:41.869055','2020-08-31 18:25:41.000000',2,'68b1927532c949cd8fd474b19fae2f35'),(259,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTA5MDI3NiwianRpIjoiNDQ0NjliMzhhMDI1NDg5MmI0NDE3OTU0NzhlYmU3ZTciLCJ1c2VyX2lkIjoyfQ.oQrg6TXITrOYXkTqGE1qLq_0SejH1xA_egxRdoCSR6Q','2020-08-22 23:44:36.256530','2020-09-02 23:44:36.000000',2,'44469b38a0254892b441795478ebe7e7'),(260,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTA5MDQzMSwianRpIjoiZjU2NGY2ODM2ZTFhNDZjZGE0OWI4MGRiNzY5MDNhMzMiLCJ1c2VyX2lkIjoyfQ.G4s8NBvL_xBofg6cn1UBTgdQXaeRx821foXY1ttIMUI','2020-08-22 23:47:11.281448','2020-09-02 23:47:11.000000',2,'f564f6836e1a46cda49b80db76903a33'),(261,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTA5OTA4MiwianRpIjoiNWY4NjdmNzA4NWEzNGE3NmJmNmQ3YTQxYWI5MWE1Y2EiLCJ1c2VyX2lkIjoyfQ.waOACMqqrI8P2ih28sxJAkQZOEYZPwBmo1Rd-2GCNWs','2020-08-23 02:11:22.408965','2020-09-03 02:11:22.000000',2,'5f867f7085a34a76bf6d7a41ab91a5ca'),(262,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTA5OTE1MiwianRpIjoiZjRlNDIyMWYwNWU3NDM2NmIxNjllNzVhYTk5MzVlYzQiLCJ1c2VyX2lkIjoyfQ.ek3yy0tZziHeD77M26iqcnZ5haYVBbRIv5yrTHSY078','2020-08-23 02:12:32.387564','2020-09-03 02:12:32.000000',2,'f4e4221f05e74366b169e75aa9935ec4'),(263,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTA5OTI1NCwianRpIjoiYzlhZjM4ODAzYjM5NGIzYjg1MGMxNzhhMGE1Nzc5NDgiLCJ1c2VyX2lkIjoyfQ.5zIVHswzKO9ziO6hUrQOj7LzKnVboIwuW8kCgxG__zY','2020-08-23 02:14:14.694701','2020-09-03 02:14:14.000000',2,'c9af38803b394b3b850c178a0a577948'),(264,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTA5OTg5OSwianRpIjoiZjBhYjhmMGVhZTI0NDc3NDhiMzk0ZjFjZGUzMTg1MDkiLCJ1c2VyX2lkIjoyfQ.xYsk6G2JHW8TdsqU2wX5ZiLEjFB2mjKSGBWc_-vLT9s','2020-08-23 02:24:59.853408','2020-09-03 02:24:59.000000',2,'f0ab8f0eae2447748b394f1cde318509'),(265,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTIzNTQ4NiwianRpIjoiNjE4NThjNzkyMWRmNGY0YmI2NWJlYzRkZTQzN2Y0ODEiLCJ1c2VyX2lkIjoyfQ.D1QivuUDshEmLrGnoJ5G5KiaMhCH8-mU9Eqiskk7pdU','2020-08-24 16:04:46.040487','2020-09-04 16:04:46.000000',2,'61858c7921df4f4bb65bec4de437f481'),(266,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTIzODg0NSwianRpIjoiNmFkNjAwNTE3MDYwNGQzYmFhYzFiZGFjODYyMGQzODgiLCJ1c2VyX2lkIjoyfQ.4IcoFymc_INBakTd9DdIp_FVFoIfRg2m4J6lDhV7jnU','2020-08-24 17:00:45.684918','2020-09-04 17:00:45.000000',2,'6ad6005170604d3baac1bdac8620d388'),(267,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI0MDI4NywianRpIjoiNjkwOWE1ODg3ZGU4NGRhYThmMTliZmJmYmY5MjU0NGIiLCJ1c2VyX2lkIjoyfQ.M-ofzziotsoZeX4AlC2YllTLgmTXp3Kz38BKY8BEhBI','2020-08-24 17:24:47.141222','2020-09-04 17:24:47.000000',2,'6909a5887de84daa8f19bfbfbf92544b'),(268,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI0Mzc5MCwianRpIjoiZDU3NjE2ZWMwMTUxNDVhZThlOWM3Yzc0OWM5ZWJjN2MiLCJ1c2VyX2lkIjo0fQ.aiLtU4Q66pRXGYpiHkZ8LWCnMaSpOQFDCnnQZVonb0Y','2020-08-24 18:23:10.775389','2020-09-04 18:23:10.000000',4,'d57616ec015145ae8e9c7c749c9ebc7c'),(269,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI0MzgyNCwianRpIjoiMzFjNzVjYjkxNWQ3NDEyOGFhY2VkNTIyMTUwYTJiMzUiLCJ1c2VyX2lkIjo0fQ.vIIVwgFfI660SIPcVy2WfkkRMjEeHVgJWYMudSA7TEU','2020-08-24 18:23:44.977607','2020-09-04 18:23:44.000000',4,'31c75cb915d74128aaced522150a2b35'),(270,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI0Mzg1NSwianRpIjoiNmEwODViNjZkZTg5NGRiMTk5OWE2NGNkY2JmN2QwNjEiLCJ1c2VyX2lkIjo0fQ.8QMXdNyRNFfaf944mVyPpCNORvYYFG_e3gDw3tBN65A','2020-08-24 18:24:15.531662','2020-09-04 18:24:15.000000',4,'6a085b66de894db1999a64cdcbf7d061'),(271,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI1MjE0OSwianRpIjoiMzM4NjFhMWRjMTcwNGE1MjgxNzdhMGFlODRiNzlkNzEiLCJ1c2VyX2lkIjo0fQ.zSbC8ZEw2Hlu2KAa96hnNURZ1FGv42qZA3MX7yhj5Bc','2020-08-24 20:42:29.262833','2020-09-04 20:42:29.000000',4,'33861a1dc1704a528177a0ae84b79d71'),(272,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI1MjE2NywianRpIjoiMDNkYjc0NjljMmU4NDI5Yzk3NGQ3MTk2YThmZGIwYzAiLCJ1c2VyX2lkIjo0fQ.bfFivM9bwyekbMGjCGYmYnoXr8Z3ITJxUBYLyGWmJBU','2020-08-24 20:42:47.189969','2020-09-04 20:42:47.000000',4,'03db7469c2e8429c974d7196a8fdb0c0'),(273,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI1MjM2MywianRpIjoiZTI2MTYzNDA4YTVlNGU4NDk3ZGEwOWFmNmFiYTNmMTciLCJ1c2VyX2lkIjo0fQ.vl4Mr7F2nXyz7cEBdbZs-WFANAvs536N4k-OJVtiVfw','2020-08-24 20:46:03.142399','2020-09-04 20:46:03.000000',4,'e26163408a5e4e8497da09af6aba3f17'),(274,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTI1MjM3OCwianRpIjoiZGM3MGQ0ZWZjNGNiNDAxYzliM2Q3NjI2NzNmNzExZTIiLCJ1c2VyX2lkIjoyfQ.ADjColpDODNlw1jJqMWXxGO3tEaxuf_HO7vigHVPy3M','2020-08-24 20:46:18.123031','2020-09-04 20:46:18.000000',2,'dc70d4efc4cb401c9b3d762673f711e2'),(275,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTM2MTkzMSwianRpIjoiNDE3Y2YwNTdlYzdlNDVlMjg4YTIyM2ZjMTE0MmMzMWMiLCJ1c2VyX2lkIjo0fQ.ak9muGx5X3WCsiiIY6k9CcMYz2slwIO_u6SxLX_VIl0','2020-08-26 03:12:11.058093','2020-09-06 03:12:11.000000',4,'417cf057ec7e45e288a223fc1142c31c'),(276,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTM2MTk3NiwianRpIjoiYjZhMzQ0MjQ4M2ZkNGVkODliNGU0ODIzYjRhODhjN2QiLCJ1c2VyX2lkIjo0fQ.Mwq-9rbjG19tmw49nbPMF9NdWNIXa14y7kCKTEQ3mBY','2020-08-26 03:12:56.891214','2020-09-06 03:12:56.000000',4,'b6a3442483fd4ed89b4e4823b4a88c7d'),(277,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTQxMDAyNywianRpIjoiOWY4Y2ZiN2I2ZmMxNDA0M2E3YTRmNGIyNTZmYzRjZDUiLCJ1c2VyX2lkIjo0fQ.bm1np2nkX6s_fVncP26ZqJQzwLELhakUOS2TVArAxas','2020-08-26 16:33:47.311927','2020-09-06 16:33:47.000000',4,'9f8cfb7b6fc14043a7a4f4b256fc4cd5'),(278,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTQ3NjA5MywianRpIjoiNzQ0ZWU0MTlkNmRkNDBjNmE3NmFmYWRmODFmOWZhNDEiLCJ1c2VyX2lkIjoyfQ.LO_ONsjFWXGhcIEHSVjPthq2_2iJE7WNI_rFIwmkgOw','2020-08-27 10:54:53.894930','2020-09-07 10:54:53.000000',2,'744ee419d6dd40c6a76afadf81f9fa41'),(279,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5OTUwMzUzMywianRpIjoiMzM5MGE1MTM5MDdiNDhjMmEyNWRlYTBkMDVmMzdmMmYiLCJ1c2VyX2lkIjoyfQ.7KC2Nhbn4ddvXdYt4VxmV9i-Yk8Utg6jIAl2ItXMYy4','2020-08-27 18:32:13.984696','2020-09-07 18:32:13.000000',2,'3390a513907b48c2a25dea0d05f37f2f');
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

-- Dump completed on 2020-10-06 21:57:44
