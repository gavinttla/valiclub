-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: ymxads
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Current Database: `ymxads`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ymxads` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ymxads`;

--
-- Table structure for table `admin_config`
--

DROP TABLE IF EXISTS `admin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_config`
--

LOCK TABLES `admin_config` WRITE;
/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;
INSERT INTO `admin_config` VALUES (1,'isMaintenance','false','flag put system into maintenance mode.','2018-02-22 02:22:46','2018-02-22 02:22:46');
/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'Dashboard','fa-bar-chart','/',NULL,'2018-03-07 02:31:56'),(2,0,2,'Admin','fa-cog',NULL,NULL,'2018-03-07 02:45:47'),(3,2,3,'Users','fa-users','auth/users',NULL,NULL),(4,2,4,'Roles','fa-user','auth/roles',NULL,NULL),(5,2,5,'Permission','fa-ban','auth/permissions',NULL,NULL),(6,2,6,'Menu','fa-bars','auth/menu',NULL,NULL),(7,2,7,'Operation log','fa-history','auth/logs',NULL,NULL),(8,0,8,'Config','fa-toggle-on','config','2018-02-22 02:13:47','2018-02-22 02:13:47'),(9,0,9,'Messages','fa-paper-plane','messages','2018-03-07 02:24:56','2018-03-07 02:24:56'),(10,0,10,'Member','fa-user','member','2018-03-08 23:43:23','2018-03-09 00:03:59');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_messages`
--

DROP TABLE IF EXISTS `admin_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_messages`
--

LOCK TABLES `admin_messages` WRITE;
/*!40000 ALTER TABLE `admin_messages` DISABLE KEYS */;
INSERT INTO `admin_messages` VALUES (1,2,1,'test','test11','2018-03-07 02:41:39','2018-03-07 02:41:39','2018-03-07 02:41:39');
/*!40000 ALTER TABLE `admin_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_operation_log`
--

DROP TABLE IF EXISTS `admin_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'ttadmin','GET','192.168.10.1','[]','2018-02-21 03:17:29','2018-02-21 03:17:29'),(2,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:37','2018-02-21 03:17:37'),(3,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:37','2018-02-21 03:17:37'),(4,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:39','2018-02-21 03:17:39'),(5,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:45','2018-02-21 03:17:45'),(6,1,'ttadmin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:50','2018-02-21 03:17:50'),(7,1,'ttadmin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:52','2018-02-21 03:17:52'),(8,1,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:17:55','2018-02-21 03:17:55'),(9,1,'ttadmin/auth/logs','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:18:04','2018-02-21 03:18:04'),(10,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:18:35','2018-02-21 03:18:35'),(11,1,'ttadmin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:18:38','2018-02-21 03:18:38'),(12,1,'ttadmin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:22:37','2018-02-21 03:22:37'),(13,1,'ttadmin/auth/permissions','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:22:43','2018-02-21 03:22:43'),(14,1,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-21 03:23:05','2018-02-21 03:23:05'),(15,1,'ttadmin','GET','192.168.10.1','[]','2018-02-22 02:00:34','2018-02-22 02:00:34'),(16,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:00:40','2018-02-22 02:00:40'),(17,1,'ttadmin','GET','192.168.10.1','[]','2018-02-22 02:20:50','2018-02-22 02:20:50'),(18,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:20:54','2018-02-22 02:20:54'),(19,1,'ttadmin/config/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:21:19','2018-02-22 02:21:19'),(20,1,'ttadmin/config','POST','192.168.10.1','{\"name\":\"isMaintenance\",\"value\":\"false\",\"description\":\"flag put system into maintenance mode.\",\"_token\":\"Cs0OBSbL4RhpI2vIlL7BzfqXXvSHrdHSsIgnz3Id\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/config\"}','2018-02-22 02:22:45','2018-02-22 02:22:45'),(21,1,'ttadmin/config','GET','192.168.10.1','[]','2018-02-22 02:22:46','2018-02-22 02:22:46'),(22,1,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:25:00','2018-02-22 02:25:00'),(23,1,'ttadmin/auth/logs','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:25:02','2018-02-22 02:25:02'),(24,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:25:25','2018-02-22 02:25:25'),(25,1,'ttadmin/config','GET','192.168.10.1','[]','2018-02-22 02:35:41','2018-02-22 02:35:41'),(26,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:35:47','2018-02-22 02:35:47'),(27,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:57:39','2018-02-22 02:57:39'),(28,1,'ttadmin/config/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-02-22 02:57:52','2018-02-22 02:57:52'),(29,1,'ttadmin/config/create','GET','192.168.10.1','[]','2018-02-22 19:29:37','2018-02-22 19:29:37'),(30,1,'ttadmin','GET','192.168.10.1','[]','2018-03-06 01:36:02','2018-03-06 01:36:02'),(31,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 01:36:25','2018-03-06 01:36:25'),(32,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 01:38:00','2018-03-06 01:38:00'),(33,1,'ttadmin/auth/roles','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 01:38:04','2018-03-06 01:38:04'),(34,1,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 01:38:12','2018-03-06 01:38:12'),(35,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:23:56','2018-03-06 02:23:56'),(36,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:24:10','2018-03-06 02:24:10'),(37,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:24:24','2018-03-06 02:24:24'),(38,1,'ttadmin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:24:29','2018-03-06 02:24:29'),(39,1,'ttadmin/auth/users/create','GET','192.168.10.1','[]','2018-03-06 02:27:28','2018-03-06 02:27:28'),(40,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:27:36','2018-03-06 02:27:36'),(41,1,'ttadmin/auth/users/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:27:40','2018-03-06 02:27:40'),(42,1,'ttadmin/auth/users','POST','192.168.10.1','{\"username\":\"gavin\",\"name\":\"gavin\",\"password\":\"aaaa1111\",\"password_confirmation\":\"aaaa1111\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"iLGkJdnCcpFYCdetFcDZWYmPC42mFi9qayklQNEh\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/auth\\/users\"}','2018-03-06 02:28:52','2018-03-06 02:28:52'),(43,1,'ttadmin/auth/users','GET','192.168.10.1','[]','2018-03-06 02:28:54','2018-03-06 02:28:54'),(44,1,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:29:10','2018-03-06 02:29:10'),(45,2,'ttadmin','GET','192.168.10.1','[]','2018-03-06 02:29:19','2018-03-06 02:29:19'),(46,2,'ttadmin','GET','192.168.10.1','[]','2018-03-06 02:29:36','2018-03-06 02:29:36'),(47,2,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:32:03','2018-03-06 02:32:03'),(48,1,'ttadmin','GET','192.168.10.1','[]','2018-03-06 02:32:12','2018-03-06 02:32:12'),(49,1,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:34:14','2018-03-06 02:34:14'),(50,2,'ttadmin','GET','192.168.10.1','[]','2018-03-06 02:34:27','2018-03-06 02:34:27'),(51,2,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:34:36','2018-03-06 02:34:36'),(52,2,'ttadmin/auth/users/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:34:40','2018-03-06 02:34:40'),(53,2,'ttadmin/auth/users/2','PUT','192.168.10.1','{\"username\":\"gavin\",\"name\":\"gavin\",\"password\":\"$2y$10$G1cv37.8bFsFmZCtJfHFv.z1APE3VmC1x2ya.6BXw3tfW52E4WSEG\",\"password_confirmation\":\"$2y$10$G1cv37.8bFsFmZCtJfHFv.z1APE3VmC1x2ya.6BXw3tfW52E4WSEG\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"iLGkJdnCcpFYCdetFcDZWYmPC42mFi9qayklQNEh\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/auth\\/users\"}','2018-03-06 02:35:10','2018-03-06 02:35:10'),(54,2,'ttadmin/auth/users','GET','192.168.10.1','[]','2018-03-06 02:35:11','2018-03-06 02:35:11'),(55,2,'ttadmin/auth/users','GET','192.168.10.1','[]','2018-03-06 02:35:20','2018-03-06 02:35:20'),(56,2,'ttadmin/auth/users','GET','192.168.10.1','[]','2018-03-06 02:35:52','2018-03-06 02:35:52'),(57,2,'ttadmin/auth/users/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:36:02','2018-03-06 02:36:02'),(58,2,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 02:37:12','2018-03-06 02:37:12'),(59,2,'ttadmin/config','GET','192.168.10.1','[]','2018-03-06 02:41:59','2018-03-06 02:41:59'),(60,2,'ttadmin/config','GET','192.168.10.1','[]','2018-03-06 02:42:33','2018-03-06 02:42:33'),(61,2,'ttadmin/config','GET','192.168.10.1','[]','2018-03-06 03:02:01','2018-03-06 03:02:01'),(62,2,'ttadmin/config','GET','192.168.10.1','[]','2018-03-06 03:02:09','2018-03-06 03:02:09'),(63,2,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 03:02:19','2018-03-06 03:02:19'),(64,2,'ttadmin','GET','192.168.10.1','[]','2018-03-06 03:02:29','2018-03-06 03:02:29'),(65,2,'ttadmin','GET','192.168.10.1','[]','2018-03-06 03:04:15','2018-03-06 03:04:15'),(66,2,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 03:04:23','2018-03-06 03:04:23'),(67,2,'ttadmin','GET','192.168.10.1','[]','2018-03-06 03:07:12','2018-03-06 03:07:12'),(68,2,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 03:07:15','2018-03-06 03:07:15'),(69,2,'ttadmin/auth/setting','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-06 03:07:56','2018-03-06 03:07:56'),(70,2,'ttadmin/auth/setting','GET','192.168.10.1','[]','2018-03-07 02:02:05','2018-03-07 02:02:05'),(71,2,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:03:05','2018-03-07 02:03:05'),(72,2,'ttadmin/auth/users','GET','192.168.10.1','[]','2018-03-07 02:25:06','2018-03-07 02:25:06'),(73,2,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:25:09','2018-03-07 02:25:09'),(74,2,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:25:13','2018-03-07 02:25:13'),(75,2,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:25:18','2018-03-07 02:25:18'),(76,2,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:25:20','2018-03-07 02:25:20'),(77,2,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:26:26','2018-03-07 02:26:26'),(78,2,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:26:35','2018-03-07 02:26:35'),(79,2,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:27:06','2018-03-07 02:27:06'),(80,2,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:30:34','2018-03-07 02:30:34'),(81,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:31:26','2018-03-07 02:31:26'),(82,2,'ttadmin/auth/menu/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:31:31','2018-03-07 02:31:31'),(83,2,'ttadmin/auth/menu/1','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"Dashboard\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"_token\":\"Lcw5ILAFV60mwM33cnETdU9tUlhhRb5BniTPgadz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/auth\\/menu\"}','2018-03-07 02:31:56','2018-03-07 02:31:56'),(84,2,'ttadmin/auth/menu','GET','192.168.10.1','[]','2018-03-07 02:31:57','2018-03-07 02:31:57'),(85,2,'ttadmin/auth/menu','GET','192.168.10.1','[]','2018-03-07 02:32:03','2018-03-07 02:32:03'),(86,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:34:41','2018-03-07 02:34:41'),(87,2,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:34:49','2018-03-07 02:34:49'),(88,2,'ttadmin/messages/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:34:53','2018-03-07 02:34:53'),(89,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:36:51','2018-03-07 02:36:51'),(90,2,'ttadmin/auth/menu/9/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:36:56','2018-03-07 02:36:56'),(91,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:37:19','2018-03-07 02:37:19'),(92,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:37:44','2018-03-07 02:37:44'),(93,2,'ttadmin/auth/logs','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:37:47','2018-03-07 02:37:47'),(94,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:38:02','2018-03-07 02:38:02'),(95,2,'ttadmin/auth/menu/3/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:38:19','2018-03-07 02:38:19'),(96,2,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:38:22','2018-03-07 02:38:22'),(97,2,'ttadmin/auth/menu/4/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:38:28','2018-03-07 02:38:28'),(98,2,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:41:15','2018-03-07 02:41:15'),(99,2,'ttadmin/messages/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:41:19','2018-03-07 02:41:19'),(100,2,'ttadmin/messages','POST','192.168.10.1','{\"to\":[\"1\",null],\"title\":\"test\",\"message\":\"test11\",\"_token\":\"Lcw5ILAFV60mwM33cnETdU9tUlhhRb5BniTPgadz\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/messages\"}','2018-03-07 02:41:38','2018-03-07 02:41:38'),(101,2,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-07 02:41:39','2018-03-07 02:41:39'),(102,2,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:42:03','2018-03-07 02:42:03'),(103,1,'ttadmin','GET','192.168.10.1','[]','2018-03-07 02:42:11','2018-03-07 02:42:11'),(104,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:42:29','2018-03-07 02:42:29'),(105,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:43:01','2018-03-07 02:43:01'),(106,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-07 02:43:11','2018-03-07 02:43:11'),(107,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-07 02:43:17','2018-03-07 02:43:17'),(108,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:43:20','2018-03-07 02:43:20'),(109,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:43:23','2018-03-07 02:43:23'),(110,1,'ttadmin/auth/setting','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:44:19','2018-03-07 02:44:19'),(111,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:44:37','2018-03-07 02:44:37'),(112,1,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:44:40','2018-03-07 02:44:40'),(113,1,'ttadmin/auth/menu/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:45:27','2018-03-07 02:45:27'),(114,1,'ttadmin/auth/menu/2','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"Admin\",\"icon\":\"fa-cog\",\"uri\":null,\"roles\":[\"1\",null],\"_token\":\"Lcw5ILAFV60mwM33cnETdU9tUlhhRb5BniTPgadz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/auth\\/menu\"}','2018-03-07 02:45:47','2018-03-07 02:45:47'),(115,1,'ttadmin/auth/menu','GET','192.168.10.1','[]','2018-03-07 02:45:48','2018-03-07 02:45:48'),(116,1,'ttadmin/auth/menu','GET','192.168.10.1','[]','2018-03-07 02:45:51','2018-03-07 02:45:51'),(117,1,'ttadmin/auth/menu/2/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:46:00','2018-03-07 02:46:00'),(118,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:46:35','2018-03-07 02:46:35'),(119,1,'ttadmin','GET','192.168.10.1','[]','2018-03-07 02:46:46','2018-03-07 02:46:46'),(120,1,'ttadmin','GET','192.168.10.1','[]','2018-03-07 02:46:52','2018-03-07 02:46:52'),(121,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:46:57','2018-03-07 02:46:57'),(122,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-07 02:46:59','2018-03-07 02:46:59'),(123,1,'ttadmin/auth/users','GET','192.168.10.1','[]','2018-03-08 21:53:20','2018-03-08 21:53:20'),(124,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 21:53:28','2018-03-08 21:53:28'),(125,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 21:53:31','2018-03-08 21:53:31'),(126,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-08 21:53:35','2018-03-08 21:53:35'),(127,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 21:53:49','2018-03-08 21:53:49'),(128,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 21:57:24','2018-03-08 21:57:24'),(129,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 21:57:29','2018-03-08 21:57:29'),(130,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 21:57:29','2018-03-08 21:57:29'),(131,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-08 21:57:36','2018-03-08 21:57:36'),(132,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-08 23:43:01','2018-03-08 23:43:01'),(133,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-08 23:43:33','2018-03-08 23:43:33'),(134,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 23:43:37','2018-03-08 23:43:37'),(135,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-08 23:44:02','2018-03-08 23:44:02'),(136,1,'ttadmin/member/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 23:44:10','2018-03-08 23:44:10'),(137,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-08 23:44:12','2018-03-08 23:44:12'),(138,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 23:44:19','2018-03-08 23:44:19'),(139,1,'ttadmin/member/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 23:59:40','2018-03-08 23:59:40'),(140,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-08 23:59:41','2018-03-08 23:59:41'),(141,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-08 23:59:54','2018-03-08 23:59:54'),(142,1,'ttadmin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:03:19','2018-03-09 00:03:19'),(143,1,'ttadmin/auth/menu/10/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:03:45','2018-03-09 00:03:45'),(144,1,'ttadmin/auth/menu/10','PUT','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"Member\",\"icon\":\"fa-user\",\"uri\":\"member\",\"roles\":[null],\"_token\":\"ZOkroH9gNKB85DxhdIasAjgxkQ6gTI56RSPbq24u\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/192.168.10.10\\/ttadmin\\/auth\\/menu\"}','2018-03-09 00:03:59','2018-03-09 00:03:59'),(145,1,'ttadmin/auth/menu','GET','192.168.10.1','[]','2018-03-09 00:04:00','2018-03-09 00:04:00'),(146,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:04:04','2018-03-09 00:04:04'),(147,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:04:09','2018-03-09 00:04:09'),(148,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-09 00:04:19','2018-03-09 00:04:19'),(149,1,'ttadmin/member/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:04:24','2018-03-09 00:04:24'),(150,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-09 00:04:26','2018-03-09 00:04:26'),(151,1,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:04:39','2018-03-09 00:04:39'),(152,1,'ttadmin','GET','192.168.10.1','[]','2018-03-09 00:05:25','2018-03-09 00:05:25'),(153,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:05:29','2018-03-09 00:05:29'),(154,1,'ttadmin/member/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:05:38','2018-03-09 00:05:38'),(155,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-09 00:05:39','2018-03-09 00:05:39'),(156,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:05:43','2018-03-09 00:05:43'),(157,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-09 00:06:51','2018-03-09 00:06:51'),(158,1,'ttadmin/member/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:06:54','2018-03-09 00:06:54'),(159,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:07:27','2018-03-09 00:07:27'),(160,1,'ttadmin/member/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:07:30','2018-03-09 00:07:30'),(161,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:07:49','2018-03-09 00:07:49'),(162,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}','2018-03-09 00:08:45','2018-03-09 00:08:45'),(163,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}','2018-03-09 00:08:47','2018-03-09 00:08:47'),(164,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_export_\":\"all\"}','2018-03-09 00:09:01','2018-03-09 00:09:01'),(165,1,'ttadmin','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:01','2018-03-09 00:51:01'),(166,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:08','2018-03-09 00:51:08'),(167,1,'ttadmin/member/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:12','2018-03-09 00:51:12'),(168,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:14','2018-03-09 00:51:14'),(169,1,'ttadmin/member/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:17','2018-03-09 00:51:17'),(170,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:22','2018-03-09 00:51:22'),(171,1,'ttadmin/auth/users','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-09 00:51:27','2018-03-09 00:51:27'),(172,1,'ttadmin','GET','192.168.10.1','[]','2018-03-13 00:19:19','2018-03-13 00:19:19'),(173,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 00:19:23','2018-03-13 00:19:23'),(174,1,'ttadmin/member/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 00:19:28','2018-03-13 00:19:28'),(175,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 00:19:31','2018-03-13 00:19:31'),(176,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-13 00:24:29','2018-03-13 00:24:29'),(177,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-13 01:10:48','2018-03-13 01:10:48'),(178,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:10:51','2018-03-13 01:10:51'),(179,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:10:56','2018-03-13 01:10:56'),(180,1,'ttadmin/member/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:11:05','2018-03-13 01:11:05'),(181,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:11:08','2018-03-13 01:11:08'),(182,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:12:23','2018-03-13 01:12:23'),(183,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:12:47','2018-03-13 01:12:47'),(184,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:13:02','2018-03-13 01:13:02'),(185,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:14:26','2018-03-13 01:14:26'),(186,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:15:04','2018-03-13 01:15:04'),(187,1,'ttadmin/member/create','GET','192.168.10.1','{\"title\":\"Re:\",\"_pjax\":\"#pjax-container\"}','2018-03-13 01:15:14','2018-03-13 01:15:14'),(188,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:15:19','2018-03-13 01:15:19'),(189,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:16:48','2018-03-13 01:16:48'),(190,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:23:34','2018-03-13 01:23:34'),(191,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-13 01:24:24','2018-03-13 01:24:24'),(192,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:27:31','2018-03-13 01:27:31'),(193,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:30:40','2018-03-13 01:30:40'),(194,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:30:44','2018-03-13 01:30:44'),(195,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:30:58','2018-03-13 01:30:58'),(196,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 01:31:03','2018-03-13 01:31:03'),(197,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-13 22:06:05','2018-03-13 22:06:05'),(198,1,'ttadmin/config','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-13 22:29:55','2018-03-13 22:29:55'),(199,1,'ttadmin/config','GET','192.168.10.1','[]','2018-03-13 22:29:59','2018-03-13 22:29:59'),(200,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-14 00:16:48','2018-03-14 00:16:48'),(201,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:17:43','2018-03-14 00:17:43'),(202,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:17:54','2018-03-14 00:17:54'),(203,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:18:34','2018-03-14 00:18:34'),(204,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:19:08','2018-03-14 00:19:08'),(205,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:19:14','2018-03-14 00:19:14'),(206,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:19:44','2018-03-14 00:19:44'),(207,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:19:57','2018-03-14 00:19:57'),(208,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:20:12','2018-03-14 00:20:12'),(209,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:21:49','2018-03-14 00:21:49'),(210,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:24:53','2018-03-14 00:24:53'),(211,1,'ttadmin/messages','GET','192.168.10.1','[]','2018-03-14 00:29:38','2018-03-14 00:29:38'),(212,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-14 00:30:05','2018-03-14 00:30:05'),(213,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-14 00:30:09','2018-03-14 00:30:09'),(214,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-14 00:30:59','2018-03-14 00:30:59'),(215,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-14 00:31:16','2018-03-14 00:31:16'),(216,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-14 00:31:27','2018-03-14 00:31:27'),(217,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-14 00:32:43','2018-03-14 00:32:43'),(218,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-14 00:47:06','2018-03-14 00:47:06'),(219,1,'ttadmin/member','GET','192.168.10.1','[]','2018-03-14 01:27:58','2018-03-14 01:27:58'),(220,1,'ttadmin','GET','192.168.10.1','[]','2018-03-15 00:20:04','2018-03-15 00:20:04'),(221,1,'ttadmin/messages','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-15 00:20:13','2018-03-15 00:20:13'),(222,1,'ttadmin','GET','192.168.10.1','[]','2018-03-17 00:20:37','2018-03-17 00:20:37'),(223,1,'ttadmin/member','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-17 00:20:41','2018-03-17 00:20:41'),(224,1,'ttadmin/auth/logout','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2018-03-17 00:20:48','2018-03-17 00:20:48');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'Admin Config','ext.config',NULL,'/config*','2018-02-22 02:13:47','2018-02-22 02:13:47'),(7,'Admin messages','ext.messages',NULL,'/messages*','2018-03-07 02:24:56','2018-03-07 02:24:56'),(8,'Admin Member','ext.member',NULL,'/member*','2018-03-08 23:43:23','2018-03-08 23:43:23');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_menu`
--

DROP TABLE IF EXISTS `admin_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permissions`
--

DROP TABLE IF EXISTS `admin_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_users`
--

DROP TABLE IF EXISTS `admin_role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2018-02-21 03:09:45','2018-02-21 03:09:45');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_permissions`
--

DROP TABLE IF EXISTS `admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
INSERT INTO `admin_user_permissions` VALUES (2,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$GxeZE1S8WPJff0kDhGwbs.oDaXDGQ0dvJl6mE3YGocOmB1IQRxj5u','Administrator',NULL,'VVZOAY8bCOodcx4rKoZLY6SgHD3sfwGgxJSQ9EWXtgPUvqcGKI5kH83s80Ji','2018-02-21 03:09:45','2018-02-21 03:09:45'),(2,'gavin','$2y$10$G1cv37.8bFsFmZCtJfHFv.z1APE3VmC1x2ya.6BXw3tfW52E4WSEG','gavin','images/minions.jpg','5i8Vz07OYw4YDcG47ETKCBWmgLq9HryRm05O1KZLZ2DsnJGaN9RzoUFYdyPl','2018-03-06 02:28:53','2018-03-06 02:28:53');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',2),(4,'2017_07_17_040159_create_config_table',3),(5,'2017_07_17_040159_create_messages_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gavin','gavintt@gmail.com','$2y$10$bFkPOLTt6t6D7qbWW8lPmu8h.LHv1krBMu1mvq3rhHUEfYzFhoQYS',NULL,0,1,'xULCTQAQ8xlC4kdo2Qpsf5kYKIMWLOPbOdiPqMw9SmhiryrBEQfiMfMHDQ3M','2018-01-24 02:55:04','2018-01-24 02:55:04'),(2,'david','davidtan78@gmail.com','$2y$10$NGC0xuduvCEab881UZRkQuhKbvaHmP4awC70EG/YgmptH/6vTvp4W',NULL,0,1,'e4f4f83ZUoSw7vEIt0UqcLZJuXebA2K2vjNtvESM1DWdq0SE1A6X8VVWRnvj','2018-03-17 00:20:05','2018-03-17 00:20:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-17  2:30:01
