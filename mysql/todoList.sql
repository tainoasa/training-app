-- MySQL dump 10.13  Distrib 8.0.0-dmr, for Linux (x86_64)
--
-- Host: localhost    Database: todoList
-- ------------------------------------------------------
-- Server version	8.0.0-dmr

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add todo',7,'add_todo'),(26,'Can change todo',7,'change_todo'),(27,'Can delete todo',7,'delete_todo'),(28,'Can view todo',7,'view_todo'),(29,'Can add training_history',8,'add_training_history'),(30,'Can change training_history',8,'change_training_history'),(31,'Can delete training_history',8,'delete_training_history'),(32,'Can view training_history',8,'view_training_history'),(33,'Can add training_list',9,'add_training_list'),(34,'Can change training_list',9,'change_training_list'),(35,'Can delete training_list',9,'delete_training_list'),(36,'Can view training_list',9,'view_training_list'),(37,'Can add recommend_history',10,'add_recommend_history'),(38,'Can change recommend_history',10,'change_recommend_history'),(39,'Can delete recommend_history',10,'delete_recommend_history'),(40,'Can view recommend_history',10,'view_recommend_history'),(41,'Can add user_info',11,'add_user_info'),(42,'Can change user_info',11,'change_user_info'),(43,'Can delete user_info',11,'delete_user_info'),(44,'Can view user_info',11,'view_user_info');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$MM6BOF3xUYCi$dE6Wb4BtoXhviHWj1cVKXFJruQGxTeDaPpEq+6LnG/I=','2023-10-07 07:39:24.708728',1,'seiji','','','tuchiya@gmail.com',1,1,'2023-10-01 02:24:37.518456');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-01 02:47:08.972262','1','パニック',1,'[{\"added\": {}}]',7,1),(2,'2023-10-01 02:48:23.188400','2','投稿1',1,'[{\"added\": {}}]',7,1),(3,'2023-10-01 02:48:34.407602','3','モンスター',1,'[{\"added\": {}}]',7,1),(4,'2023-10-04 02:40:51.097483','1','ベンチプレス',1,'[{\"added\": {}}]',8,1),(5,'2023-10-04 03:59:01.970616','1','Training_list object (1)',1,'[{\"added\": {}}]',9,1),(6,'2023-10-04 03:59:08.988759','1','Training_list object (1)',2,'[{\"changed\": {\"fields\": [\"Training movie\"]}}]',9,1),(7,'2023-10-04 03:59:13.619250','1','Training_list object (1)',2,'[]',9,1),(8,'2023-10-04 04:06:18.339389','1','Training_list object (1)',2,'[]',9,1),(9,'2023-10-04 04:06:55.777047','1','Training_list object (1)',3,'',9,1),(10,'2023-10-04 04:07:22.521751','2','Training_list object (2)',1,'[{\"added\": {}}]',9,1),(11,'2023-10-04 08:46:38.417049','2','Training_list object (2)',2,'[]',9,1),(12,'2023-10-04 08:46:48.024632','1','ベンチプレス',2,'[]',8,1),(13,'2023-10-04 08:59:31.964454','3','ダンベル・カール',1,'[{\"added\": {}}]',9,1),(14,'2023-10-04 09:00:15.699562','4','ダンベル・カール',1,'[{\"added\": {}}]',9,1),(15,'2023-10-04 09:00:41.779771','3','スタンディング・クロール',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(16,'2023-10-04 09:05:26.400427','5','スタンディング・エルボー・ダウン',1,'[{\"added\": {}}]',9,1),(17,'2023-10-04 09:06:39.403221','6','ダンベル・フレンチ・プレス',1,'[{\"added\": {}}]',9,1),(18,'2023-10-04 09:08:03.205514','7','スタンディング・バイセップス・クランチ',1,'[{\"added\": {}}]',9,1),(19,'2023-10-04 09:09:43.768161','8','ダンベル・クロール',1,'[{\"added\": {}}]',9,1),(20,'2023-10-04 09:10:26.791490','9','スタンディング・バイセップス・クランチ',1,'[{\"added\": {}}]',9,1),(21,'2023-10-04 09:14:06.895074','10','スタンディング・ミドル・レイズ',1,'[{\"added\": {}}]',9,1),(22,'2023-10-04 09:18:41.144283','10','スタンディング・ミドル・レイズ',2,'[]',9,1),(23,'2023-10-05 04:42:40.254768','2','サイドレイズ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(24,'2023-10-05 06:30:15.920150','11','腹筋ローラー',1,'[{\"added\": {}}]',9,1),(25,'2023-10-05 06:30:46.224874','11','腹筋ローラー',2,'[{\"changed\": {\"fields\": [\"Training movie\"]}}]',9,1),(26,'2023-10-05 06:37:59.668781','12','スタンディングフラットベント',1,'[{\"added\": {}}]',9,1),(27,'2023-10-05 06:39:04.886059','13','スタンディングローラーベント',1,'[{\"added\": {}}]',9,1),(28,'2023-10-05 06:40:45.342301','14','スタンディングクロスベント',1,'[{\"added\": {}}]',9,1),(29,'2023-10-05 06:41:12.270927','15','スタンディングプランク',1,'[{\"added\": {}}]',9,1),(30,'2023-10-05 06:41:53.967601','16','スタンディングバイクプランク',1,'[{\"added\": {}}]',9,1),(31,'2023-10-05 06:42:35.859574','17','スタンディングローラープランク',1,'[{\"added\": {}}]',9,1),(32,'2023-10-05 06:43:08.737880','18','スタンディングクロスプランク',1,'[{\"added\": {}}]',9,1),(33,'2023-10-05 06:43:44.987704','19','スタンディングプランクフレンチ',1,'[{\"added\": {}}]',9,1),(34,'2023-10-05 06:44:21.104169','20','スタンディングバイクプランクフレンチ',1,'[{\"added\": {}}]',9,1),(35,'2023-10-05 06:44:49.746574','21','スタンディングローラープランクフレンチ',1,'[{\"added\": {}}]',9,1),(36,'2023-10-05 06:45:18.571092','22','スタンディングクロスプランクフレンチ',1,'[{\"added\": {}}]',9,1),(37,'2023-10-05 06:47:47.177432','23','スタンディング・ショルダープレス',1,'[{\"added\": {}}]',9,1),(38,'2023-10-05 06:48:36.017515','24','スタンディング・ハンマーカール',1,'[{\"added\": {}}]',9,1),(39,'2023-10-05 06:50:07.876375','25','インクラインダンベルプレス',1,'[{\"added\": {}}]',9,1),(40,'2023-10-05 06:50:53.868511','26','プッシュアップ',1,'[{\"added\": {}}]',9,1),(41,'2023-10-05 06:51:36.727854','27','フレンチプレス',1,'[{\"added\": {}}]',9,1),(42,'2023-10-05 06:52:09.802290','28','トライセプス',1,'[{\"added\": {}}]',9,1),(43,'2023-10-05 06:52:55.488149','29','バックエレントレイズ',1,'[{\"added\": {}}]',9,1),(44,'2023-10-05 06:53:31.681494','30','オーバーローイング',1,'[{\"added\": {}}]',9,1),(45,'2023-10-05 06:54:06.152862','31','ハンマーローイング',1,'[{\"added\": {}}]',9,1),(46,'2023-10-05 07:04:46.543762','32','デッドリフト',1,'[{\"added\": {}}]',9,1),(47,'2023-10-05 07:05:11.065543','33','ラットプルダウン',1,'[{\"added\": {}}]',9,1),(48,'2023-10-05 07:05:46.947946','34','ローイングラット',1,'[{\"added\": {}}]',9,1),(49,'2023-10-05 07:07:08.405254','35','スクワット',1,'[{\"added\": {}}]',9,1),(50,'2023-10-05 07:08:00.912186','36','クロスカール',1,'[{\"added\": {}}]',9,1),(51,'2023-10-05 07:08:20.732353','24','ハンマーカール',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(52,'2023-10-05 07:08:33.029048','23','ショルダープレス',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(53,'2023-10-05 07:08:42.051992','22','クロスプランクフレンチ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(54,'2023-10-05 07:08:47.856766','21','ローラープランクフレンチ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(55,'2023-10-05 07:08:54.349918','20','バイクプランクフレンチ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(56,'2023-10-05 07:09:00.704045','19','プランクフレンチ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(57,'2023-10-05 07:09:07.445121','18','クロスプランク',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(58,'2023-10-05 07:09:14.183121','17','ローラープランク',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(59,'2023-10-05 07:09:20.753612','16','バイクプランク',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(60,'2023-10-05 07:09:30.145967','15','プランク',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(61,'2023-10-05 07:09:35.760220','14','クロスベント',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(62,'2023-10-05 07:09:43.656964','13','ローラーベント',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(63,'2023-10-05 07:09:50.126398','10','ミドル・レイズ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(64,'2023-10-05 07:09:56.280409','12','フラットベント',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(65,'2023-10-05 07:10:01.896453','9','バイセップス・クランチ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(66,'2023-10-05 07:10:07.723863','7','バイセップス・クランチ',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(67,'2023-10-05 07:10:13.111476','5','エルボー・ダウン',2,'[{\"changed\": {\"fields\": [\"Training name\"]}}]',9,1),(68,'2023-10-05 07:12:23.999016','4','スクワット',1,'[{\"added\": {}}]',8,1),(69,'2023-10-05 18:45:52.406615','37','ローライズ',1,'[{\"added\": {}}]',9,1),(70,'2023-10-05 18:46:41.979424','38','バタフライ',1,'[{\"added\": {}}]',9,1),(71,'2023-10-05 18:50:02.891584','39','フラットバックライズ',1,'[{\"added\": {}}]',9,1),(72,'2023-10-05 18:52:54.433035','40','バックエレベーター',1,'[{\"added\": {}}]',9,1),(73,'2023-10-05 18:53:52.063348','41','クロスボディ',1,'[{\"added\": {}}]',9,1),(74,'2023-10-05 18:54:35.742169','42','チェストプレス',1,'[{\"added\": {}}]',9,1),(75,'2023-10-05 18:55:20.808121','43','ランジ',1,'[{\"added\": {}}]',9,1),(76,'2023-10-05 18:56:28.382606','44','レッグプレス',1,'[{\"added\": {}}]',9,1),(77,'2023-10-05 18:57:12.197723','45','レッグランジ',1,'[{\"added\": {}}]',9,1),(78,'2023-10-05 18:57:51.584480','46','レッグカール',1,'[{\"added\": {}}]',9,1),(79,'2023-10-05 18:59:50.916182','47','バックエクステンション',1,'[{\"added\": {}}]',9,1),(80,'2023-10-05 19:06:25.286097','1','User_info object (1)',1,'[{\"added\": {}}]',11,1),(81,'2023-10-05 20:12:24.143617','1','User_info object (1)',2,'[{\"changed\": {\"fields\": [\"User level\"]}}]',11,1),(82,'2023-10-05 21:22:04.051529','48','ベンチプレス',1,'[{\"added\": {}}]',9,1),(83,'2023-10-06 06:59:34.025531','29','User_info object (29)',2,'[{\"changed\": {\"fields\": [\"Ex parameter\", \"User level\"]}}]',11,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'todo','recommend_history'),(7,'todo','todo'),(8,'todo','training_history'),(9,'todo','training_list'),(11,'todo','user_info');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-01 02:22:14.226446'),(2,'auth','0001_initial','2023-10-01 02:22:14.368217'),(3,'admin','0001_initial','2023-10-01 02:22:14.746048'),(4,'admin','0002_logentry_remove_auto_add','2023-10-01 02:22:14.845952'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-01 02:22:14.856008'),(6,'contenttypes','0002_remove_content_type_name','2023-10-01 02:22:14.957974'),(7,'auth','0002_alter_permission_name_max_length','2023-10-01 02:22:15.008964'),(8,'auth','0003_alter_user_email_max_length','2023-10-01 02:22:15.026263'),(9,'auth','0004_alter_user_username_opts','2023-10-01 02:22:15.034380'),(10,'auth','0005_alter_user_last_login_null','2023-10-01 02:22:15.091175'),(11,'auth','0006_require_contenttypes_0002','2023-10-01 02:22:15.094143'),(12,'auth','0007_alter_validators_add_error_messages','2023-10-01 02:22:15.103944'),(13,'auth','0008_alter_user_username_max_length','2023-10-01 02:22:15.164583'),(14,'auth','0009_alter_user_last_name_max_length','2023-10-01 02:22:15.223511'),(15,'auth','0010_alter_group_name_max_length','2023-10-01 02:22:15.244675'),(16,'auth','0011_update_proxy_permissions','2023-10-01 02:22:15.253030'),(17,'sessions','0001_initial','2023-10-01 02:22:15.279136'),(18,'todo','0001_initial','2023-10-01 02:22:15.317686'),(19,'todo','0002_training_history','2023-10-03 11:43:58.072677'),(20,'todo','0003_training_list','2023-10-04 03:53:11.294484'),(21,'todo','0004_recommend_history','2023-10-04 05:25:15.053387'),(22,'todo','0005_user_info','2023-10-05 05:23:41.697458'),(23,'todo','0006_user_info_user_level','2023-10-05 08:40:18.017318'),(24,'todo','0007_auto_20231006_0718','2023-10-06 07:18:30.226574');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3e4fhl9xm194i529wycjhsx8wsiiiwah','ZjRiOGVhMDI0NjkxYWY3OTdmNzg0NDIzY2JjMGE3MTI1NWRiMDMyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNWJkZWJiMGY3Y2JkMjZiNTM1ZTkwMTkyZDA3YjNhMDA5OTkxM2UzIn0=','2023-10-17 10:42:46.843166'),('48925pf6b3oxuj6dje4ug647n8hebk2t','ZjRiOGVhMDI0NjkxYWY3OTdmNzg0NDIzY2JjMGE3MTI1NWRiMDMyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNWJkZWJiMGY3Y2JkMjZiNTM1ZTkwMTkyZDA3YjNhMDA5OTkxM2UzIn0=','2023-10-21 07:39:24.714538'),('8lwse4nbtunuazdtrjgcdo87xx3t58qv','ZjRiOGVhMDI0NjkxYWY3OTdmNzg0NDIzY2JjMGE3MTI1NWRiMDMyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNWJkZWJiMGY3Y2JkMjZiNTM1ZTkwMTkyZDA3YjNhMDA5OTkxM2UzIn0=','2023-10-15 02:46:03.024870'),('e94apd3frlhka5184q90t5sr5b3s1nhs','ZjRiOGVhMDI0NjkxYWY3OTdmNzg0NDIzY2JjMGE3MTI1NWRiMDMyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNWJkZWJiMGY3Y2JkMjZiNTM1ZTkwMTkyZDA3YjNhMDA5OTkxM2UzIn0=','2023-10-15 02:46:30.078081'),('pnz6gxtsqbud8snt1gl26zz1c1n18082','ZjRiOGVhMDI0NjkxYWY3OTdmNzg0NDIzY2JjMGE3MTI1NWRiMDMyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNWJkZWJiMGY3Y2JkMjZiNTM1ZTkwMTkyZDA3YjNhMDA5OTkxM2UzIn0=','2023-10-19 19:44:29.786429'),('w02grmdumwpftcha1b7cwfe1o8myqxys','ZjRiOGVhMDI0NjkxYWY3OTdmNzg0NDIzY2JjMGE3MTI1NWRiMDMyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNWJkZWJiMGY3Y2JkMjZiNTM1ZTkwMTkyZDA3YjNhMDA5OTkxM2UzIn0=','2023-10-15 02:46:00.267568');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_recommend_history`
--

DROP TABLE IF EXISTS `todo_recommend_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_recommend_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `input_txt` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `recommend_name` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_recommend_history`
--

LOCK TABLES `todo_recommend_history` WRITE;
/*!40000 ALTER TABLE `todo_recommend_history` DISABLE KEYS */;
INSERT INTO `todo_recommend_history` VALUES (1,'巨乳になりたいです','ベンチプレス'),(2,'テニスはいかがですか？','[]'),(3,'テニスはいかがですか？','[]'),(4,'テニスしたいです','[]'),(5,'テニスするのにどこを鍛えればいいですか','[]'),(6,'テニスするのにどんな筋トレをすればいいですか','[{\'id\': 32, \'training_name\': \'デッドリフト\'}, {\'id\': 35, \'training_name\': \'スクワット\'}, {\'id\': 43, \'training_name\': \'ランジ\'}]'),(7,'テニスするのにどんな筋トレをすればいいですか','[{\'id\': 32, \'training_name\': \'デッドリフト\'}, {\'id\': 35, \'training_name\': \'スクワット\'}, {\'id\': 43, \'training_name\': \'ランジ\'}]'),(8,'野球で速球をなげるには','[{\'id\': 46, \'training_name\': \'レッグカール\'}]'),(9,'速く走れるようになりたい','[]');
/*!40000 ALTER TABLE `todo_recommend_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_todo`
--

DROP TABLE IF EXISTS `todo_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_todo`
--

LOCK TABLES `todo_todo` WRITE;
/*!40000 ALTER TABLE `todo_todo` DISABLE KEYS */;
INSERT INTO `todo_todo` VALUES (1,'パニック','未だかつてない衝撃'),(2,'投稿1','あああああ'),(3,'モンスター','ハッカソン');
/*!40000 ALTER TABLE `todo_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_training_history`
--

DROP TABLE IF EXISTS `todo_training_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_training_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_menu` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `training_weight` int(11) NOT NULL,
  `training_times` int(11) NOT NULL,
  `training_set` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_training_history`
--

LOCK TABLES `todo_training_history` WRITE;
/*!40000 ALTER TABLE `todo_training_history` DISABLE KEYS */;
INSERT INTO `todo_training_history` VALUES (1,'ベンチプレス',70,10,3),(2,'ベンチプレス',5,5,5),(3,'ベンチプレス',5,5,5),(4,'スクワット',70,5,1);
/*!40000 ALTER TABLE `todo_training_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_training_list`
--

DROP TABLE IF EXISTS `todo_training_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_training_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_parts` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `training_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `training_movie` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_training_list`
--

LOCK TABLES `todo_training_list` WRITE;
/*!40000 ALTER TABLE `todo_training_list` DISABLE KEYS */;
INSERT INTO `todo_training_list` VALUES (2,'肩','サイドレイズ','https://youtu.be/PAgQ2r05s-A?si=_boajgkgLtY6rsxf'),(3,'腕','スタンディング・クロール','https://youtu.be/9G4LyVxvSNw?si=7G6B8XQv8fjQc-L8'),(4,'腕','ダンベル・カール','https://youtu.be/VSGK6WtkTpI?si=mXiOd3wNB8wbhd8L'),(5,'腕','エルボー・ダウン','https://youtu.be/gQoDYMpUFP8?si=TtTR86Q5eOhWs3LJ'),(6,'腕','ダンベル・フレンチ・プレス','https://youtu.be/pbkkdPzS2X4?si=RKLqrzHh5wei0YwM'),(7,'腕','バイセップス・クランチ','https://youtu.be/BLZUMk6Kmw8?si=P8P84V6doJKo17JX'),(8,'腕','ダンベル・クロール','https://youtu.be/y4ESwu2cd4k?si=Y9pSzdnDJl-SWl4a'),(9,'腕','バイセップス・クランチ','https://youtu.be/rNRyxTZdB8g?si=68vVgD9mFFrSbdFM'),(10,'肩','ミドル・レイズ','https://youtu.be/X4tEoI9TxXc?si=TeUNaFHRziS9IRSb'),(11,'腹','腹筋ローラー','https://youtu.be/b6ACs9NRPNA?si=UH-POmSrdTlWSQqi'),(12,'腹','フラットベント','https://youtu.be/1XWjjzhQb6U?si=iEnSIZQDojQeCriV'),(13,'腹','ローラーベント','https://youtu.be/1MFa7d9ytM4?si=UA35l0ZFJW2-_Rx5'),(14,'腹','クロスベント','https://youtu.be/FtV7OEwiXMo?si=Fxhyq0ARy5c-AEhf'),(15,'肩','プランク','https://youtu.be/pBo_DjHqVws?si=zir16-gIAqSjhxh6'),(16,'腹','バイクプランク','https://youtu.be/LYEMfp5Q--g?si=vjBqA1Ui4g6bZYFe'),(17,'腹','ローラープランク','https://youtu.be/68lNlLrOeKM?si=0MROUH0vPqbk69Jp'),(18,'腹','クロスプランク','https://youtu.be/DIapD8hpAPY?si=G22byJfOyR9VMHFl'),(19,'腹','プランクフレンチ','https://youtu.be/eyRweAG7jZE?si=Gye8dJUlAIEFUL0l'),(20,'腹','バイクプランクフレンチ','https://youtu.be/RUE9XKihoQU?si=Qv8fZmWOYlHhQZlN'),(21,'腹','ローラープランクフレンチ','https://youtu.be/korYs9ZYGuU?si=tfjyDLRNhhul4WA_'),(22,'腹','クロスプランクフレンチ','https://youtu.be/0-s2HpY__JE?si=x26Shwm-mcND_cDu'),(23,'肩','ショルダープレス','https://youtu.be/KTA9_XYeljs?si=5hchtWvPSTmvm5jn'),(24,'腕','ハンマーカール','https://youtu.be/zqpVV7qHmfg?si=Db5nG06FuotTWHEw'),(25,'胸','インクラインダンベルプレス','https://youtu.be/CoVH4-qyhUY?si=D4ekH6T6fggd_x46'),(26,'胸','プッシュアップ','https://youtu.be/VcbmPx3J_j8?si=6B2yWLq7gU8_sUeL'),(27,'胸','フレンチプレス','https://youtu.be/pbkkdPzS2X4?si=cj2h_sLpLi5NONVV'),(28,'胸','トライセプス','https://youtu.be/UNFn-RvhxJg?si=tChG-XMGyxv1pkqe'),(29,'胸','バックエレントレイズ','https://youtu.be/VDGhPfWGTyY?si=BaWlMwEhkMsIK7PW'),(30,'背中','オーバーローイング','https://youtu.be/Ks_Tv9zdVfQ?si=gu-ju8IU_0YykBm4'),(31,'背中','ハンマーローイング','https://youtu.be/v6YnuuKLZQ4?si=Nsg0hTyVvZP4o8Kb'),(32,'背中','デッドリフト','https://youtu.be/pLcwbPrit7k?si=9I_SEh1Rma_qtmOU'),(33,'背中','ラットプルダウン','https://youtu.be/aN98D1YD00o?si=XBhLYPKP5GeoXgxr'),(34,'背中','ローイングラット','https://youtu.be/099GITDqHxo?si=rme1rnl5lNSZ17Pb'),(35,'脚','スクワット','https://youtu.be/EGvmyc8AB-I?si=e_R2aPHE60MOJqRv'),(36,'脚','クロスカール','https://youtu.be/UWC4x5b8aUs?si=2iZN6U567u58c_Qf'),(37,'腹','ローライズ','https://youtu.be/c-6iN_pXVr8?si=d9eOEQ1qqVa4MOwk'),(38,'腹','バタフライ','https://youtu.be/N106cDygues?si=OcmWN11PoPZG4faI'),(39,'腹','フラットバックライズ','https://youtu.be/VDGhPfWGTyY?si=O7VCqbXZxvW38NoP'),(40,'背中','バックエレベーター','https://youtu.be/qvK6RrOIDLk?si=zyYaLVvuVTrMOCeI'),(41,'腹','クロスボディ','https://youtu.be/69XTaoPi20I?si=TfUVJDa9ngcY10IP'),(42,'胸','チェストプレス','https://youtu.be/B1bZgrucpE4?si=5cUk4eAGwiHUaH1w'),(43,'脚','ランジ','https://youtu.be/OlGiInYmSiw?si=0jee9CQY5SWdCKdb'),(44,'脚','レッグプレス','https://youtu.be/7_qPg97ys4g?si=Epk1cVjqr5ju-qHP'),(45,'脚','レッグランジ','https://youtu.be/BFitLouawaM?si=o2GWAI4159NpXUo-'),(46,'脚','レッグカール','https://youtu.be/Bo8v_Qxcfak?si=8QHGP_AwBUH8ZkAl'),(47,'背中','バックエクステンション','https://youtu.be/cPmZpupDLrE?si=V27NcdQpCtsNlNa8'),(48,'胸','ベンチプレス','https://youtu.be/R8o8RsFddnQ?si=xzKs8NJx59h6sRGF');
/*!40000 ALTER TABLE `todo_training_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_user_info`
--

DROP TABLE IF EXISTS `todo_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_parameter` int(11) DEFAULT NULL,
  `user_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_user_info`
--

LOCK TABLES `todo_user_info` WRITE;
/*!40000 ALTER TABLE `todo_user_info` DISABLE KEYS */;
INSERT INTO `todo_user_info` VALUES (1,0,1),(2,4488,3),(3,0,1),(4,0,1),(5,2988,1),(6,2976,1),(7,2964,1),(8,2952,1),(9,2940,1),(10,2928,1),(11,2916,1),(12,2904,1),(13,2892,1),(14,2880,1),(15,2868,1),(16,606,4),(17,2469,5),(18,14457,5),(19,11257,6),(20,463,7),(21,12451,7),(22,24439,7),(23,2255,8),(24,14243,8),(25,26231,8),(26,38219,8),(27,50207,8),(28,10937,9),(29,0,1),(30,1198,1),(31,2396,1),(32,594,2),(33,1792,2);
/*!40000 ALTER TABLE `todo_user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-08  2:08:32
