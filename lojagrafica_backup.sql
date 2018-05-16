-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: lojagrafica
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
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (3,'pbkdf2_sha256$100000$DIvZeklFgIZw$y/V/rDrcYuQwMB+uFN/Oc30UAqSOLlF29sKgKOusXeA=','2018-05-09 13:18:59.124091',0,'fulano','Fulano Almeida','fulano@email.com','79854565121','Avenida Falcão Peçanha Fulano','778','89556222','Perto da praça da igreja','Montese','CE',0,1,'2018-04-25 11:04:42.292515','85945652230'),(4,'pbkdf2_sha256$100000$NA1er3Bnuxyv$Q82tQPvVaouk1FwZP/8R1vkZc5stn/hsaZywmtu9SKQ=','2018-05-07 09:52:37.723853',0,'cicrano','Cicrano da Silva','cicrano@email.com','85465985750','Rua das Alamedas','789','2222222222','Perto da praça Cicrano Albuquerque','Alamedas','MA',0,1,'2018-04-27 17:11:04.009705','85978453212'),(7,'pbkdf2_sha256$100000$MrK9s94mbO9D$ANjh9grYVXND9JQUh/d5O+o7R/IAe7vupbbiySwLy8w=','2018-05-07 13:45:06.735402',1,'adriano','Adriano Oliveira','adriano.qwe32@gmail.com','85215856320','Rua Projetada 2','110','61880000','Vem pela BR-116 e entre na rua da cooperativa','Parque Dom Pedro','CE',1,1,'2018-05-04 10:37:39.078309','85999473839'),(8,'pbkdf2_sha256$100000$Lt0wgtXVjhdW$5mzOJy1h9z6JzJJRks7IXnjMd/OPPRiF3qnWrB4ROyU=','2018-05-04 11:05:56.480420',1,'manager','','manager@email.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2018-05-04 11:05:33.415427',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add Usuário',6,'add_user'),(17,'Can change Usuário',6,'change_user'),(18,'Can delete Usuário',6,'delete_user'),(19,'Can add Serviço',7,'add_service'),(20,'Can change Serviço',7,'change_service'),(21,'Can delete Serviço',7,'delete_service'),(22,'Can add Categoria',8,'add_category'),(23,'Can change Categoria',8,'change_category'),(24,'Can delete Categoria',8,'delete_category'),(25,'Can add Pedido Criação de Arte',9,'add_orderart'),(26,'Can change Pedido Criação de Arte',9,'change_orderart'),(27,'Can delete Pedido Criação de Arte',9,'delete_orderart'),(28,'Can add order item art',10,'add_orderitemart'),(29,'Can change order item art',10,'change_orderitemart'),(30,'Can delete order item art',10,'delete_orderitemart'),(31,'Can add Impressão',11,'add_orderitemimpress'),(32,'Can change Impressão',11,'change_orderitemimpress'),(33,'Can delete Impressão',11,'delete_orderitemimpress'),(34,'Can add Pedido Impressão',12,'add_order'),(35,'Can change Pedido Impressão',12,'change_order'),(36,'Can delete Pedido Impressão',12,'delete_order'),(37,'Can add Pedido Impressão',12,'add_orderimpress'),(38,'Can change Pedido Impressão',12,'change_orderimpress'),(39,'Can delete Pedido Impressão',12,'delete_orderimpress');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category`
--

DROP TABLE IF EXISTS `catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category`
--

LOCK TABLES `catalog_category` WRITE;
/*!40000 ALTER TABLE `catalog_category` DISABLE KEYS */;
INSERT INTO `catalog_category` VALUES (1,'Cartões de Visita','cartoes-de-visita','2018-04-12 18:08:13.535416','2018-04-12 18:08:13.535455'),(2,'Tag\'s','tags','2018-04-12 18:09:57.402482','2018-04-12 18:09:57.402534'),(3,'Panfletos','panfletos','2018-04-12 18:10:46.233533','2018-04-12 18:10:46.233570'),(4,'Banners','banners','2018-04-12 18:11:34.857815','2018-04-12 18:11:34.857848'),(5,'Folders','folders','2018-04-12 18:12:23.359128','2018-04-12 18:12:23.359184'),(6,'Imã de Geladeira','ima-de-geladeira','2018-04-12 18:15:10.359768','2018-04-12 18:15:10.359806'),(7,'Porta Copos Bolacha','porta-copos-bolacha','2018-04-12 18:16:11.534007','2018-04-12 18:16:11.534056'),(8,'Mídias Sociais','midias-sociais','2018-04-12 18:17:19.090972','2018-04-12 18:17:19.091003'),(9,'Artes Gráficas','artes-graficas','2018-04-12 18:18:18.828867','2018-04-12 18:18:18.828907'),(10,'Categoria Teste',NULL,'2018-04-30 16:01:39.258560','2018-05-03 12:58:25.982740');
/*!40000 ALTER TABLE `catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_service`
--

DROP TABLE IF EXISTS `catalog_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `tipo` varchar(2) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_service_category_id_f7c3a02d_fk_catalog_category_id` (`category_id`),
  CONSTRAINT `catalog_service_category_id_f7c3a02d_fk_catalog_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_service`
--

LOCK TABLES `catalog_service` WRITE;
/*!40000 ALTER TABLE `catalog_service` DISABLE KEYS */;
INSERT INTO `catalog_service` VALUES (17,'1000 Cartões de visita - Couchê 250g - 4 x 1 Verniz total frente','impress-art/250g-4x1.jpg',80.00,'IP',1),(18,'1000 Tags 4 x 1 Couchê 250g Tamanho 4 x 4,5 Verniz Uv Total Frente','impress-art/1000-tag-4x1-250g-45x51.jpg',100.00,'IP',2),(19,'1000 Panfletos 4 x 0, Couchê 90g tamanho 10 x 14','impress-art/1000-couche-90g-4x0-10x14.jpg',130.00,'IP',3),(20,'Banner tamanho 50 x 70 cm lona 440','impress-art/01.jpg',55.00,'IP',4),(21,'1000 Folderes Couchê 115g 2 Dobras tamanho 30 x 21','impress-art/01_gWGdHdS.jpg',590.00,'IP',5),(22,'500 Imãs De Geladeira Corte Reto Tamanho 50x45 mm','impress-art/500-50x45.jpg',150.00,'IP',6),(23,'500 Porta Copos Couchê 250g tamanho 85 x 85 mm','impress-art/500-porta-copos-85x85.jpg',145.00,'IP',7),(24,'Pacote com 5 (Cinco) Artes para mídias sociais','impress-art/5-artes.jpg',140.00,'AT',8),(25,'Criação de arte para cartão de visitas (só frente)','impress-art/arte-cartao-frente.jpg',23.00,'AT',9),(31,'Este serviço eve ser deletado','impress-art/logo-qualitylife6-500x500.jpg',200.00,'IP',10),(32,'it is a test','impress-art/logo6.png',124.00,'IP',10);
/*!40000 ALTER TABLE `catalog_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_orderart`
--

DROP TABLE IF EXISTS `checkout_orderart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_orderart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `status` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_orderart_user_id_051066de_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `checkout_orderart_user_id_051066de_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_orderart`
--

LOCK TABLES `checkout_orderart` WRITE;
/*!40000 ALTER TABLE `checkout_orderart` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_orderart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_orderimpress`
--

DROP TABLE IF EXISTS `checkout_orderimpress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_orderimpress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `status` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bairro_delivery` varchar(100) DEFAULT NULL,
  `cep_delivery` varchar(10) DEFAULT NULL,
  `complemento_delivery` varchar(100) DEFAULT NULL,
  `delivery_address_is_the_same` tinyint(1) NOT NULL,
  `estado_delivery` varchar(100) DEFAULT NULL,
  `logradouro_delivery` varchar(100) DEFAULT NULL,
  `numero_delivery` varchar(100) DEFAULT NULL,
  `cidade_delivery` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_order_user_id_6420a551_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `checkout_order_user_id_6420a551_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_orderimpress`
--

LOCK TABLES `checkout_orderimpress` WRITE;
/*!40000 ALTER TABLE `checkout_orderimpress` DISABLE KEYS */;
INSERT INTO `checkout_orderimpress` VALUES (1,'2018-05-07',670.00,'EA',4,'Sapiranga','45880999','',0,'CE','Rua das Flores','456','Fortaleza'),(2,'2018-05-10',670.00,'EA',3,'','','',1,'','','','');
/*!40000 ALTER TABLE `checkout_orderimpress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_orderitemart`
--

DROP TABLE IF EXISTS `checkout_orderitemart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_orderitemart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` smallint(5) unsigned NOT NULL,
  `image_example1` varchar(100) DEFAULT NULL,
  `image_example2` varchar(100) DEFAULT NULL,
  `image_example3` varchar(100) DEFAULT NULL,
  `image_example4` varchar(100) DEFAULT NULL,
  `orderArt_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `note` longtext,
  `final_work` varchar(100) DEFAULT NULL,
  `image_view` varchar(100) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_orderitemart_service_id_b0ddc151_fk_catalog_service_id` (`service_id`),
  KEY `checkout_orderitemar_orderArt_id_9f9704db_fk_checkout_` (`orderArt_id`),
  CONSTRAINT `checkout_orderitemar_orderArt_id_9f9704db_fk_checkout_` FOREIGN KEY (`orderArt_id`) REFERENCES `checkout_orderart` (`id`),
  CONSTRAINT `checkout_orderitemart_service_id_b0ddc151_fk_catalog_service_id` FOREIGN KEY (`service_id`) REFERENCES `catalog_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_orderitemart`
--

LOCK TABLES `checkout_orderitemart` WRITE;
/*!40000 ALTER TABLE `checkout_orderitemart` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_orderitemart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_orderitemimpress`
--

DROP TABLE IF EXISTS `checkout_orderitemimpress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_orderitemimpress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` smallint(5) unsigned NOT NULL,
  `art` varchar(100) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_orderitemim_service_id_57ba7a7c_fk_catalog_s` (`service_id`),
  KEY `checkout_orderitemim_order_id_5601487f_fk_checkout_` (`order_id`),
  CONSTRAINT `checkout_orderitemim_order_id_5601487f_fk_checkout_` FOREIGN KEY (`order_id`) REFERENCES `checkout_orderimpress` (`id`),
  CONSTRAINT `checkout_orderitemim_service_id_57ba7a7c_fk_catalog_s` FOREIGN KEY (`service_id`) REFERENCES `catalog_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_orderitemimpress`
--

LOCK TABLES `checkout_orderitemimpress` WRITE;
/*!40000 ALTER TABLE `checkout_orderitemimpress` DISABLE KEYS */;
INSERT INTO `checkout_orderitemimpress` VALUES (1,1,'order-item-impress/logo-qualitylife6-500x500.jpg',1,17),(2,1,'order-item-impress/criacao-logomarca-peker-eventos-bh.jpg',1,21),(3,1,'',2,17),(9,1,'',2,21);
/*!40000 ALTER TABLE `checkout_orderitemimpress` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (50,'2018-05-04 10:38:26.824845','5','Adriano Oliveira',3,'',6,7),(51,'2018-05-04 10:38:57.504952','7','adriano',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',6,7),(52,'2018-05-04 11:07:54.609658','7','Adriano Oliveira',2,'[{\"changed\": {\"fields\": [\"is_active\", \"is_staff\"]}}]',6,8),(53,'2018-05-09 12:07:21.205058','32','it is a test',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','user'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(8,'catalog','category'),(7,'catalog','service'),(9,'checkout','orderart'),(12,'checkout','orderimpress'),(10,'checkout','orderitemart'),(11,'checkout','orderitemimpress'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-12 18:04:27.893041'),(2,'contenttypes','0002_remove_content_type_name','2018-04-12 18:04:29.431850'),(3,'auth','0001_initial','2018-04-12 18:04:36.255460'),(4,'auth','0002_alter_permission_name_max_length','2018-04-12 18:04:36.506165'),(5,'auth','0003_alter_user_email_max_length','2018-04-12 18:04:36.579248'),(6,'auth','0004_alter_user_username_opts','2018-04-12 18:04:36.698773'),(7,'auth','0005_alter_user_last_login_null','2018-04-12 18:04:36.793032'),(8,'auth','0006_require_contenttypes_0002','2018-04-12 18:04:36.860792'),(9,'auth','0007_alter_validators_add_error_messages','2018-04-12 18:04:36.945327'),(10,'auth','0008_alter_user_username_max_length','2018-04-12 18:04:37.049550'),(11,'auth','0009_alter_user_last_name_max_length','2018-04-12 18:04:37.144159'),(12,'accounts','0001_initial','2018-04-12 18:04:47.023705'),(13,'admin','0001_initial','2018-04-12 18:04:50.500523'),(14,'admin','0002_logentry_remove_auto_add','2018-04-12 18:04:50.608410'),(15,'catalog','0001_initial','2018-04-12 18:04:53.815709'),(16,'checkout','0001_initial','2018-04-12 18:05:07.445477'),(17,'sessions','0001_initial','2018-04-12 18:05:09.248516'),(18,'checkout','0002_auto_20180414_0726','2018-04-14 10:26:31.627339'),(19,'checkout','0003_auto_20180417_0847','2018-04-17 11:48:01.734497'),(20,'checkout','0004_orderitemart_note','2018-04-18 10:39:05.008018'),(21,'checkout','0005_auto_20180419_0707','2018-04-19 10:08:38.370703'),(22,'checkout','0006_orderimpress_cidade_delivery','2018-04-20 12:12:27.163013'),(23,'checkout','0007_auto_20180420_1000','2018-04-20 13:00:32.143599'),(24,'catalog','0002_auto_20180421_0441','2018-04-21 07:41:53.722754'),(25,'accounts','0002_user_telefone','2018-04-28 10:45:48.991660'),(26,'catalog','0003_auto_20180430_1259','2018-04-30 15:59:46.911306'),(27,'catalog','0004_auto_20180430_1315','2018-04-30 16:15:05.492152'),(28,'catalog','0005_auto_20180430_1344','2018-04-30 16:44:25.151891'),(29,'accounts','0003_auto_20180504_0742','2018-05-04 10:42:54.930447'),(30,'accounts','0004_auto_20180504_0757','2018-05-04 10:57:42.334880'),(31,'checkout','0008_auto_20180504_0907','2018-05-04 12:07:36.307193'),(32,'checkout','0009_orderitemart_approved','2018-05-04 12:15:27.428413'),(33,'checkout','0010_auto_20180510_0807','2018-05-10 11:08:00.788427');
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
INSERT INTO `django_session` VALUES ('1mgfiauxjcfk8t12kjjef8njsuehc474','NTQwNjUxOWZhZjcwYTNiODA5OWJjNzk2ZTJjMTM1MTkxNjk1ZDdkNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYWNjb3VudHMuYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzhkY2UxMTQ0NDA0ZDZmOWU3NDhiMmMyYjBkYjhlZjBmMWM0ODlmNCJ9','2018-05-08 10:44:16.146585'),('27vrbiaqe1trh8w4ga68nbyythkevlkb','MmVhYjM2YmNiNjJmY2FiYmM5NzIxNzUwZTc2ZDRkMGFhY2ZmYWUyYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFjY291bnRzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzRmODUzYjI5YjNlNWYwZTJjMTAxMjQ1NTgxMTY1MzlhNTZlMGZjOSJ9','2018-05-08 10:46:06.315413'),('8a5s9zpekcr7tc9bev39jj43tigllqbx','M2ExMTM3MGNkNGYzNjU4YmRmM2Q3ZGZiMjRhZWI5ODE0NjQyNjU1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWZlNDU0ZDg4MGNmOGRhNzM0M2I3MGVjMDUzMGJkNTRhZTJkNDE2ZCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFjY291bnRzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2018-04-30 17:51:35.765461'),('ezdflwcu5buz7p85rtvmj0kgo43rjcse','ZWY4YjQzMWQ3YWM3ZDI5NDRkNTIwMDc1NmZmNDhlNzVjNWU5ZGMxZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImY1YTE1YjA0Y2ZiNWUzMWEzMDZiN2Y1YjU3ZGY5YTY0YjYxMWNlZDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhY2NvdW50cy5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9','2018-05-08 10:52:54.238237'),('ic8zqk1zeduqe42zb3coxyqz22nvf2by','MzU0MWM2NDBhYzYzYjlkY2NiMWIxMDMwOWI5OGIyYTU0YTYzYWIwYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIyODE2MzIwNGQzYTZhYzljYjBkYjgwNTMwMjQ1NDlkZGY5ZmNlZjY0In0=','2018-05-14 08:26:13.158366'),('lzs6jcczjmrkq9y6e9ewz14wnoix6qmd','NjA0YTlkZTg2ZDUyZTZkM2UxYjZmYWM2N2Y3MDY1ZDllOTA5MGI0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWVjNDM4MDc3NWRhMTUxNjkxOWRiNTAyYzBiN2FkM2VlYmRjMWVmOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFjY291bnRzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2018-05-08 10:39:44.294397'),('sapqzin18i7fl1ft3s3zkwuoxl3icr37','MjY4NjFkM2I0ZTM3MzA3ZTE1MTQwNGU3MGIyMTlhYzE4ZDY5ZjAyZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2hhc2giOiI3OWVhZmEzYjljMzc3ZDcwNjFjMzAzNmRlZGI4OTdlZTJlOTVkMDRkIn0=','2018-05-23 13:18:59.179474'),('uevju38l9n3c5j5p0d9htebbhu27z1yp','NzBlZWU0OWZkNjY4ZTAyYzE2NWZhOWJiMWZkYjdlMDViYTEwOGIxOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFjY291bnRzLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTIyNzAwZWRkZWJhNGRjNDAzMWUyMGNmNGJjZDA3ZmZiMjBmZGYwZiJ9','2018-05-08 10:41:31.714389');
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

-- Dump completed on 2018-05-16  5:49:03
