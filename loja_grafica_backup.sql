-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: loja_grafica
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `complemento` longtext,
  `bairro` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$100000$1tSTWop9aZ03$iigfIk6pmAkO3ElLANOnTtKFuvjfec8niXoZbw+Wewk=','2018-05-19 10:00:28.594379',1,'adriano','','adriano.qwe32@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2018-05-10 17:06:51.390134'),(2,'pbkdf2_sha256$100000$TzAZposQgsjN$rwkxTYYVSzwVIeLFtXRiXc6DvOna1K5MkuN8W3LcKPY=','2018-05-19 09:58:47.087435',0,'fulano','Fulano de Tal','fulano@email.com','85987456522','Rua do Fula',NULL,'789','78990000','Complemento do endereço do fulano','Bairro do Fulano','MA',0,1,'2018-05-11 07:53:02.593419');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add Usuário',6,'add_user'),(17,'Can change Usuário',6,'change_user'),(18,'Can delete Usuário',6,'delete_user'),(19,'Can add Categoria',7,'add_category'),(20,'Can change Categoria',7,'change_category'),(21,'Can delete Categoria',7,'delete_category'),(22,'Can add Serviço',8,'add_service'),(23,'Can change Serviço',8,'change_service'),(24,'Can delete Serviço',8,'delete_service'),(25,'Can add Pedido Criação de Arte',9,'add_orderart'),(26,'Can change Pedido Criação de Arte',9,'change_orderart'),(27,'Can delete Pedido Criação de Arte',9,'delete_orderart'),(28,'Can add Pedido Impressão',10,'add_orderimpress'),(29,'Can change Pedido Impressão',10,'change_orderimpress'),(30,'Can delete Pedido Impressão',10,'delete_orderimpress'),(31,'Can add order item art',11,'add_orderitemart'),(32,'Can change order item art',11,'change_orderitemart'),(33,'Can delete order item art',11,'delete_orderitemart'),(34,'Can add Impressão',12,'add_orderitemimpress'),(35,'Can change Impressão',12,'change_orderitemimpress'),(36,'Can delete Impressão',12,'delete_orderitemimpress'),(37,'Can add service impress',13,'add_serviceimpress'),(38,'Can change service impress',13,'change_serviceimpress'),(39,'Can delete service impress',13,'delete_serviceimpress'),(40,'Can add Pedido Criação de Arte',14,'add_orderart'),(41,'Can change Pedido Criação de Arte',14,'change_orderart'),(42,'Can delete Pedido Criação de Arte',14,'delete_orderart'),(43,'Can add Impressão',15,'add_orderitemimpress'),(44,'Can change Impressão',15,'change_orderitemimpress'),(45,'Can delete Impressão',15,'delete_orderitemimpress'),(46,'Can add Pedido Impressão',16,'add_orderimpress'),(47,'Can change Pedido Impressão',16,'change_orderimpress'),(48,'Can delete Pedido Impressão',16,'delete_orderimpress'),(49,'Can add order item art',17,'add_orderitemart'),(50,'Can change order item art',17,'change_orderitemart'),(51,'Can delete order item art',17,'delete_orderitemart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_category`
--

DROP TABLE IF EXISTS `core_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_category`
--

LOCK TABLES `core_category` WRITE;
/*!40000 ALTER TABLE `core_category` DISABLE KEYS */;
INSERT INTO `core_category` VALUES (1,'Cartões de Visita',NULL,'2018-05-11 10:20:36.269736','2018-05-11 10:20:36.269838'),(2,'Panfletos',NULL,'2018-05-11 10:38:41.982190','2018-05-11 10:38:41.982288'),(3,'Tag\'s',NULL,'2018-05-11 10:41:35.375931','2018-05-11 10:41:35.376096'),(5,'Artes Gráficas',NULL,'2018-05-11 16:06:55.639015','2018-05-11 16:06:55.639119'),(6,'Banners',NULL,'2018-05-14 12:09:43.032898','2018-05-14 12:09:43.033006'),(7,'Folders',NULL,'2018-05-14 12:15:53.700636','2018-05-14 12:15:53.700749'),(8,'Imã de Geladeira',NULL,'2018-05-14 12:22:38.942355','2018-05-14 12:22:38.942462'),(9,'Porta Copos Bolacha',NULL,'2018-05-14 12:56:33.615082','2018-05-14 12:56:33.615192'),(10,'Mídias Sociais',NULL,'2018-05-14 13:00:10.169324','2018-05-14 13:00:10.169432'),(12,'Categoria Teste',NULL,'2018-05-14 13:03:59.680974','2018-05-14 13:03:59.681072');
/*!40000 ALTER TABLE `core_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_service`
--

DROP TABLE IF EXISTS `core_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_service_category_id_7472ad4a_fk_core_category_id` (`category_id`),
  CONSTRAINT `core_service_category_id_7472ad4a_fk_core_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_service`
--

LOCK TABLES `core_service` WRITE;
/*!40000 ALTER TABLE `core_service` DISABLE KEYS */;
INSERT INTO `core_service` VALUES (14,'1000 Cartões de visita - Couchê 250g - 4 x 1 Verniz total frente','impress-art/250g-4x1_IK7VQEN.jpg',80.00,1),(15,'Criação de arte para cartão de visitas (só frente)','impress-art/arte-cartao-frente.jpg',23.00,5),(16,'1000 Tags 4 x 1 Couchê 250g Tamanho 4 x 4,5 Verniz Uv Total Frente','impress-art/1000-tag-4x1-250g-45x51.jpg',100.00,3),(17,'1000 Panfletos 4 x 0, Couchê 90g tamanho 10 x 14','impress-art/1000-couche-90g-4x0-10x14_Mkr4Fyx.jpg',130.00,2),(18,'Banner tamanho 50 x 70 cm lona 440','impress-art/01.jpg',55.00,6),(19,'1000 Folderes Couchê 115g 2 Dobras tamanho 30 x 21','impress-art/01_65Ycl0n.jpg',590.00,7),(20,'500 Imãs De Geladeira Corte Reto Tamanho 50x45 mm','impress-art/500-50x45.jpg',150.00,8),(21,'500 Porta Copos Couchê 250g tamanho 85 x 85 mm','impress-art/500-porta-copos-85x85.jpg',145.00,9),(22,'Pacote com 5 (Cinco) Artes para mídias sociais','impress-art/5-artes_tIOeeaU.jpg',140.00,10),(23,'Test','impress-art/5-artes_FtYH1D9.jpg',150.00,12);
/*!40000 ALTER TABLE `core_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_serviceimpress`
--

DROP TABLE IF EXISTS `core_serviceimpress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_serviceimpress` (
  `service_ptr_id` int(11) NOT NULL,
  `value_creation_art` decimal(8,2) NOT NULL,
  `deadline` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`service_ptr_id`),
  CONSTRAINT `core_serviceimpress_service_ptr_id_24182978_fk_core_service_id` FOREIGN KEY (`service_ptr_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_serviceimpress`
--

LOCK TABLES `core_serviceimpress` WRITE;
/*!40000 ALTER TABLE `core_serviceimpress` DISABLE KEYS */;
INSERT INTO `core_serviceimpress` VALUES (14,25.00,NULL),(16,25.00,NULL),(17,25.00,NULL),(18,25.00,NULL),(19,50.00,NULL),(20,45.00,NULL),(21,60.00,NULL),(22,30.00,NULL),(23,25.00,5);
/*!40000 ALTER TABLE `core_serviceimpress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_client_orderart`
--

DROP TABLE IF EXISTS `dashboard_client_orderart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_client_orderart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `status` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_client_orderart_user_id_40235e19_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `dashboard_client_orderart_user_id_40235e19_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_client_orderart`
--

LOCK TABLES `dashboard_client_orderart` WRITE;
/*!40000 ALTER TABLE `dashboard_client_orderart` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_client_orderart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_client_orderimpress`
--

DROP TABLE IF EXISTS `dashboard_client_orderimpress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_client_orderimpress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `status` varchar(2) NOT NULL,
  `delivery_address_is_the_same` tinyint(1) NOT NULL,
  `logradouro_delivery` varchar(100) DEFAULT NULL,
  `numero_delivery` varchar(100) DEFAULT NULL,
  `cep_delivery` varchar(10) DEFAULT NULL,
  `complemento_delivery` varchar(100) DEFAULT NULL,
  `bairro_delivery` varchar(100) DEFAULT NULL,
  `cidade_delivery` varchar(100) DEFAULT NULL,
  `estado_delivery` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_client_ord_user_id_f6e84ee0_fk_accounts_` (`user_id`),
  CONSTRAINT `dashboard_client_ord_user_id_f6e84ee0_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_client_orderimpress`
--

LOCK TABLES `dashboard_client_orderimpress` WRITE;
/*!40000 ALTER TABLE `dashboard_client_orderimpress` DISABLE KEYS */;
INSERT INTO `dashboard_client_orderimpress` VALUES (4,'2018-05-19',80.00,'EA',1,'','','','','','','',2);
/*!40000 ALTER TABLE `dashboard_client_orderimpress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_client_orderitemart`
--

DROP TABLE IF EXISTS `dashboard_client_orderitemart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_client_orderitemart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` smallint(5) unsigned NOT NULL,
  `note` longtext,
  `image_example1` varchar(100) DEFAULT NULL,
  `image_example2` varchar(100) DEFAULT NULL,
  `image_example3` varchar(100) DEFAULT NULL,
  `image_example4` varchar(100) DEFAULT NULL,
  `image_view` varchar(100) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  `final_work` varchar(100) DEFAULT NULL,
  `orderArt_id` int(11) DEFAULT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_client_ord_orderArt_id_399efd28_fk_dashboard` (`orderArt_id`),
  KEY `dashboard_client_ord_service_id_e0aa1e3c_fk_core_serv` (`service_id`),
  CONSTRAINT `dashboard_client_ord_orderArt_id_399efd28_fk_dashboard` FOREIGN KEY (`orderArt_id`) REFERENCES `dashboard_client_orderart` (`id`),
  CONSTRAINT `dashboard_client_ord_service_id_e0aa1e3c_fk_core_serv` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_client_orderitemart`
--

LOCK TABLES `dashboard_client_orderitemart` WRITE;
/*!40000 ALTER TABLE `dashboard_client_orderitemart` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_client_orderitemart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_client_orderitemimpress`
--

DROP TABLE IF EXISTS `dashboard_client_orderitemimpress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_client_orderitemimpress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` smallint(5) unsigned NOT NULL,
  `art` varchar(100) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `creation_art_solicited` tinyint(1) NOT NULL,
  `observations` longtext,
  `date_solicitation` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_client_ord_order_id_324d4f84_fk_dashboard` (`order_id`),
  KEY `dashboard_client_ord_service_id_65955eae_fk_core_serv` (`service_id`),
  CONSTRAINT `dashboard_client_ord_order_id_324d4f84_fk_dashboard` FOREIGN KEY (`order_id`) REFERENCES `dashboard_client_orderimpress` (`id`),
  CONSTRAINT `dashboard_client_ord_service_id_65955eae_fk_core_serv` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_client_orderitemimpress`
--

LOCK TABLES `dashboard_client_orderitemimpress` WRITE;
/*!40000 ALTER TABLE `dashboard_client_orderitemimpress` DISABLE KEYS */;
INSERT INTO `dashboard_client_orderitemimpress` VALUES (9,1,'',4,14,1,'Observações test','2018-05-19 03:00:00.000000');
/*!40000 ALTER TABLE `dashboard_client_orderitemimpress` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'checkout','orderart'),(10,'checkout','orderimpress'),(11,'checkout','orderitemart'),(12,'checkout','orderitemimpress'),(4,'contenttypes','contenttype'),(7,'core','category'),(8,'core','service'),(13,'core','serviceimpress'),(14,'dashboard_client','orderart'),(16,'dashboard_client','orderimpress'),(17,'dashboard_client','orderitemart'),(15,'dashboard_client','orderitemimpress'),(5,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-05-10 16:59:58.423190'),(2,'contenttypes','0002_remove_content_type_name','2018-05-10 17:00:00.119740'),(3,'auth','0001_initial','2018-05-10 17:00:05.529525'),(4,'auth','0002_alter_permission_name_max_length','2018-05-10 17:00:05.674927'),(5,'auth','0003_alter_user_email_max_length','2018-05-10 17:00:05.755183'),(6,'auth','0004_alter_user_username_opts','2018-05-10 17:00:05.821721'),(7,'auth','0005_alter_user_last_login_null','2018-05-10 17:00:05.894945'),(8,'auth','0006_require_contenttypes_0002','2018-05-10 17:00:05.941778'),(9,'auth','0007_alter_validators_add_error_messages','2018-05-10 17:00:06.012691'),(10,'auth','0008_alter_user_username_max_length','2018-05-10 17:00:06.082396'),(11,'auth','0009_alter_user_last_name_max_length','2018-05-10 17:00:06.148820'),(12,'accounts','0001_initial','2018-05-10 17:00:12.850071'),(13,'admin','0001_initial','2018-05-10 17:00:15.387893'),(14,'admin','0002_logentry_remove_auto_add','2018-05-10 17:00:15.487225'),(15,'sessions','0001_initial','2018-05-10 17:00:16.274416'),(16,'core','0001_initial','2018-05-10 17:18:32.320709'),(17,'checkout','0001_initial','2018-05-11 09:17:51.897605'),(18,'core','0002_serviceimpress','2018-05-11 12:30:16.532368'),(19,'core','0003_remove_service_category','2018-05-15 11:21:19.668844'),(20,'core','0004_service_category','2018-05-15 11:21:22.089654'),(21,'core','0005_remove_service_tipo','2018-05-15 11:45:17.257556'),(22,'dashboard_client','0001_initial','2018-05-16 11:55:16.046322'),(23,'core','0006_serviceimpress_deadline','2018-05-17 10:18:34.574373'),(24,'dashboard_client','0002_auto_20180517_0718','2018-05-17 10:19:12.052772'),(25,'core','0007_auto_20180518_0939','2018-05-18 12:40:10.329520'),(26,'dashboard_client','0003_orderitemimpress_creation_art_solicited','2018-05-18 12:40:13.400952'),(27,'core','0008_service_observations','2018-05-18 13:00:37.392246'),(28,'core','0009_remove_service_observations','2018-05-18 13:02:09.564599'),(29,'dashboard_client','0004_orderitemimpress_observations','2018-05-18 13:02:11.067029'),(30,'core','0010_serviceimpress_date_solicitation','2018-05-18 17:58:03.580839'),(31,'core','0011_remove_serviceimpress_date_solicitation','2018-05-18 18:04:24.427839'),(32,'dashboard_client','0005_orderitemimpress_date_solicitation','2018-05-18 18:04:25.632972');
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
INSERT INTO `django_session` VALUES ('w7nm5jp0hduz0k8jdyoer49jw1z5p1gn','NGVjNjhkYTE5MGQ0OWNiMmMyYmE1NThlYzRlNTg3OWU5NzNmOTNiNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjdiZDY4MzhmMjQ3MmFkOThkZWU3Mjk0MDlhOTk5YjYwYTdmY2U1MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-06-02 10:00:28.684067');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-19  7:36:59
