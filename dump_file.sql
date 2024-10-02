/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: econiasoft_db
-- ------------------------------------------------------
-- Server version	10.6.18-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_code` varchar(255) NOT NULL,
  `tax_office` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) NOT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payment_channel` varchar(255) DEFAULT NULL,
  `payment_account_number` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `mobile_phone_notification` longtext DEFAULT NULL,
  `outgoing_einvoice_sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sent_sms_earchive_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `sent_email_earchive_invoice` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `web_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gib_registration_date` varchar(255) DEFAULT NULL,
  `gib_receiver_alias` varchar(255) DEFAULT NULL,
  `gib_mailbox_label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_book_payment_method_id_foreign` (`payment_method_id`),
  CONSTRAINT `address_book_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `tax_office` varchar(255) DEFAULT NULL,
  `mersis_number` varchar(255) DEFAULT NULL,
  `business_registry_number` varchar(255) DEFAULT NULL,
  `operating_center` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `gib_registration_data` date DEFAULT NULL,
  `gib_sender_alias` varchar(255) DEFAULT NULL,
  `gib_receiver_alias` varchar(255) DEFAULT NULL,
  `e-signature_method` varchar(255) DEFAULT NULL,
  `date_of_last_update` date DEFAULT NULL,
  `last_update_user` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'MI Tech','1212','1111','1111','234521','Operating Center','Argentina','Chaco','Some address here.','mitech@email.com','11111111','www.testing.com',NULL,'Sender Alias','Receiver Alia','The signature method',NULL,NULL,'2024-08-14 04:47:38','2024-08-14 04:47:38'),(2,'ABSheikh Technologies','12345','029737','2222','2222442','Bauchi','Nigeria','Bauchi','Bauchi State','absheikhnet@gmail.com','07039113840','www.bauchi.go',NULL,'ABSheikh','ABSheikh Tech','Azare',NULL,NULL,'2024-08-16 20:20:14','2024-08-16 20:20:14');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_user`
--

DROP TABLE IF EXISTS `company_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  KEY `company_user_user_id_foreign` (`user_id`),
  KEY `company_user_company_id_foreign` (`company_id`),
  CONSTRAINT `company_user_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `company_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_user`
--

LOCK TABLES `company_user` WRITE;
/*!40000 ALTER TABLE `company_user` DISABLE KEYS */;
INSERT INTO `company_user` VALUES (2,1),(3,1),(4,2),(5,1);
/*!40000 ALTER TABLE `company_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `become_partner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Aliyu','M','user11@email.com','23456789078','u',0,'2024-09-05 14:47:26','2024-09-05 14:47:26'),(2,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','ss',0,'2024-09-10 11:27:09','2024-09-10 11:27:09'),(3,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','hello world',0,'2024-09-10 11:35:17','2024-09-10 11:35:17'),(4,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','hello world',0,'2024-09-10 11:35:27','2024-09-10 11:35:27'),(5,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','hello world',0,'2024-09-10 13:42:37','2024-09-10 13:42:37'),(6,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','hello world',1,'2024-09-10 13:42:46','2024-09-10 13:42:46'),(7,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','hello world',1,'2024-09-10 13:42:47','2024-09-10 13:42:47'),(8,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','hello world',1,'2024-09-10 13:42:48','2024-09-10 13:42:48'),(9,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','qqqqqqqq',0,'2024-09-10 13:43:04','2024-09-10 13:43:04'),(10,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','qqqqqq',1,'2024-09-10 13:43:35','2024-09-10 13:43:35'),(11,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','qqqqqq',1,'2024-09-10 13:44:33','2024-09-10 13:44:33'),(12,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','qqqqqq',1,'2024-09-10 13:45:07','2024-09-10 13:45:07'),(13,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','qqqqqq',1,'2024-09-10 13:46:36','2024-09-10 13:46:36'),(14,'Lawan','Aji','lawanmustaphaaji2015@gmail.com','08163649865','qqqq',0,'2024-09-10 14:03:42','2024-09-10 14:03:42');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'TRY','Türk Lirası','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'USD','Amerikan Doları','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'EUR','Euro','2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'GBP','İngiliz Sterlini','2024-08-13 12:07:44','2024-08-13 12:07:44'),(5,'JPY','Japon Yeni','2024-08-13 12:07:44','2024-08-13 12:07:44'),(6,'RUB','Rus Rublesi','2024-08-13 12:07:44','2024-08-13 12:07:44'),(7,'CNY','Çin Yuanı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(8,'INR','Hindistan Rupisi','2024-08-13 12:07:44','2024-08-13 12:07:44'),(9,'AUD','Avustralya Doları','2024-08-13 12:07:44','2024-08-13 12:07:44'),(10,'CAD','Kanada Doları','2024-08-13 12:07:44','2024-08-13 12:07:44'),(11,'CHF','İsviçre Frangı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(12,'SEK','İsveç Kronu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(13,'NOK','Norveç Kronu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(14,'DKK','Danimarka Kronu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(15,'SAR','Suudi Arabistan Riyali','2024-08-13 12:07:44','2024-08-13 12:07:44'),(16,'QAR','Katar Riyali','2024-08-13 12:07:44','2024-08-13 12:07:44'),(17,'AED','Birleşik Arap Emirlikleri Dirhemi','2024-08-13 12:07:44','2024-08-13 12:07:44'),(18,'KWD','Kuveyt Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(19,'BHD','Bahreyn Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(20,'OMR','Umman Riyali','2024-08-13 12:07:44','2024-08-13 12:07:44'),(21,'JOD','Ürdün Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(22,'ILS','İsrail Şekeli','2024-08-13 12:07:44','2024-08-13 12:07:44'),(23,'ZAR','Güney Afrika Randı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(24,'BRL','Brezilya Reali','2024-08-13 12:07:44','2024-08-13 12:07:44'),(25,'ARS','Arjantin Pezosu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(26,'MXN','Meksika Pezosu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(27,'COP','Kolombiya Pezosu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(28,'CLP','Şili Pezosu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(29,'PEN','Peru Solu','2024-08-13 12:07:44','2024-08-13 12:07:44'),(30,'EGP','Mısır Lirası','2024-08-13 12:07:44','2024-08-13 12:07:44'),(31,'ZMW','Zambiya Kvaçası','2024-08-13 12:07:44','2024-08-13 12:07:44'),(32,'KES','Kenya Şilini','2024-08-13 12:07:44','2024-08-13 12:07:44'),(33,'GHS','Gana Sedisi','2024-08-13 12:07:44','2024-08-13 12:07:44'),(34,'NGN','Nijerya Nairası','2024-08-13 12:07:44','2024-08-13 12:07:44'),(35,'MAD','Fas Dirhemi','2024-08-13 12:07:44','2024-08-13 12:07:44'),(36,'TND','Tunus Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(37,'DZD','Cezayir Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(38,'LYD','Libya Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(39,'SYP','Suriye Lirası','2024-08-13 12:07:44','2024-08-13 12:07:44'),(40,'IQD','Irak Dinarı','2024-08-13 12:07:44','2024-08-13 12:07:44'),(41,'LBP','Lübnan Lirası','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_despatch_type`
--

DROP TABLE IF EXISTS `edelivery_note_despatch_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_despatch_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_despatch_type`
--

LOCK TABLES `edelivery_note_despatch_type` WRITE;
/*!40000 ALTER TABLE `edelivery_note_despatch_type` DISABLE KEYS */;
INSERT INTO `edelivery_note_despatch_type` VALUES (1,'Despatching','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `edelivery_note_despatch_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_driver_info`
--

DROP TABLE IF EXISTS `edelivery_note_driver_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_driver_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `tckn` varchar(255) DEFAULT NULL,
  `edelivery_note_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edelivery_note_driver_info_edelivery_note_id_foreign` (`edelivery_note_id`),
  CONSTRAINT `edelivery_note_driver_info_edelivery_note_id_foreign` FOREIGN KEY (`edelivery_note_id`) REFERENCES `edelivery_note_table` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_driver_info`
--

LOCK TABLES `edelivery_note_driver_info` WRITE;
/*!40000 ALTER TABLE `edelivery_note_driver_info` DISABLE KEYS */;
INSERT INTO `edelivery_note_driver_info` VALUES (1,'D1','DS1','232',1,'2024-08-14 05:17:59','2024-08-14 05:17:59'),(2,'D1','DS1','232',2,'2024-08-14 05:18:18','2024-08-14 05:18:18'),(6,'User22','DS1','23',6,'2024-08-21 09:41:05','2024-08-21 09:41:05');
/*!40000 ALTER TABLE `edelivery_note_driver_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_invoice_attachments`
--

DROP TABLE IF EXISTS `edelivery_note_invoice_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_invoice_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_url` varchar(255) DEFAULT NULL,
  `edelivery_note_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edelivery_note_invoice_attachments_edelivery_note_id_foreign` (`edelivery_note_id`),
  CONSTRAINT `edelivery_note_invoice_attachments_edelivery_note_id_foreign` FOREIGN KEY (`edelivery_note_id`) REFERENCES `edelivery_note_table` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_invoice_attachments`
--

LOCK TABLES `edelivery_note_invoice_attachments` WRITE;
/*!40000 ALTER TABLE `edelivery_note_invoice_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `edelivery_note_invoice_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_invoice_scenario`
--

DROP TABLE IF EXISTS `edelivery_note_invoice_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_invoice_scenario` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_invoice_scenario`
--

LOCK TABLES `edelivery_note_invoice_scenario` WRITE;
/*!40000 ALTER TABLE `edelivery_note_invoice_scenario` DISABLE KEYS */;
INSERT INTO `edelivery_note_invoice_scenario` VALUES (1,'Basic','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `edelivery_note_invoice_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_products`
--

DROP TABLE IF EXISTS `edelivery_note_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_service` varchar(255) DEFAULT NULL,
  `quantity_one` decimal(10,5) NOT NULL,
  `unit_id_one` bigint(20) unsigned NOT NULL,
  `quantity_two` decimal(10,5) NOT NULL,
  `unit_id_two` bigint(20) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `product_amount` decimal(10,2) DEFAULT NULL,
  `edelivery_note_id` bigint(20) unsigned NOT NULL,
  `product_category_id` bigint(20) unsigned DEFAULT NULL,
  `product_subcategory_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edelivery_note_products_unit_id_one_foreign` (`unit_id_one`),
  KEY `edelivery_note_products_unit_id_two_foreign` (`unit_id_two`),
  KEY `edelivery_note_products_edelivery_note_id_foreign` (`edelivery_note_id`),
  KEY `edelivery_note_products_product_category_id_foreign` (`product_category_id`),
  KEY `edelivery_note_products_product_subcategory_id_foreign` (`product_subcategory_id`),
  CONSTRAINT `edelivery_note_products_edelivery_note_id_foreign` FOREIGN KEY (`edelivery_note_id`) REFERENCES `edelivery_note_table` (`id`) ON DELETE CASCADE,
  CONSTRAINT `edelivery_note_products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  CONSTRAINT `edelivery_note_products_product_subcategory_id_foreign` FOREIGN KEY (`product_subcategory_id`) REFERENCES `product_subcategories` (`id`),
  CONSTRAINT `edelivery_note_products_unit_id_one_foreign` FOREIGN KEY (`unit_id_one`) REFERENCES `measurement_units` (`id`),
  CONSTRAINT `edelivery_note_products_unit_id_two_foreign` FOREIGN KEY (`unit_id_two`) REFERENCES `measurement_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_products`
--

LOCK TABLES `edelivery_note_products` WRITE;
/*!40000 ALTER TABLE `edelivery_note_products` DISABLE KEYS */;
INSERT INTO `edelivery_note_products` VALUES (1,'Product',5.00000,1,11.00000,2,12000.00,22.00,1,1,NULL,'2024-08-14 05:17:59','2024-08-14 05:17:59'),(2,'Product',5.00000,1,11.00000,2,12000.00,22.00,2,1,NULL,'2024-08-14 05:18:18','2024-08-14 05:18:18'),(6,'Product',33.00000,3,11.00000,3,11.00,22.00,6,3,NULL,'2024-08-21 09:41:05','2024-08-21 09:41:05');
/*!40000 ALTER TABLE `edelivery_note_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_submission_type`
--

DROP TABLE IF EXISTS `edelivery_note_submission_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_submission_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_submission_type`
--

LOCK TABLES `edelivery_note_submission_type` WRITE;
/*!40000 ALTER TABLE `edelivery_note_submission_type` DISABLE KEYS */;
INSERT INTO `edelivery_note_submission_type` VALUES (1,'e-Despatch','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'e-Archive','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `edelivery_note_submission_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_table`
--

DROP TABLE IF EXISTS `edelivery_note_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_table` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `invoice_uuid` varchar(255) NOT NULL,
  `submission_type_id` bigint(20) unsigned NOT NULL,
  `despatch_date` timestamp NULL DEFAULT NULL,
  `despatch_id` varchar(255) DEFAULT NULL,
  `despatch_type_id` bigint(20) unsigned NOT NULL,
  `invoice_scenario_id` bigint(20) unsigned NOT NULL,
  `currency_unit_id` bigint(20) unsigned NOT NULL,
  `carrier_title` varchar(255) DEFAULT NULL,
  `carrier_tin` varchar(255) DEFAULT NULL,
  `vehicle_plate_number` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_tax_number` varchar(255) DEFAULT NULL,
  `receiver_gib_postacute` varchar(255) DEFAULT NULL,
  `receiver_tax_office` varchar(255) DEFAULT NULL,
  `receiver_country` varchar(255) DEFAULT NULL,
  `receiver_city` varchar(255) DEFAULT NULL,
  `receiver_destrict` varchar(255) DEFAULT NULL,
  `receiver_address` longtext DEFAULT NULL,
  `receiver_mobile_number` varchar(255) DEFAULT NULL,
  `real_buyer` varchar(255) DEFAULT NULL,
  `buyer_tax_number` varchar(255) DEFAULT NULL,
  `buyer_tax_admin` varchar(255) DEFAULT NULL,
  `buyer_tax_office` varchar(255) DEFAULT NULL,
  `buyer_country` varchar(255) DEFAULT NULL,
  `buyer_city` varchar(255) DEFAULT NULL,
  `buyer_destrict` varchar(255) DEFAULT NULL,
  `buyer_address` longtext DEFAULT NULL,
  `real_seller` varchar(255) DEFAULT NULL,
  `seller_tax_number` varchar(255) DEFAULT NULL,
  `seller_tax_admin` varchar(255) DEFAULT NULL,
  `seller_tax_office` varchar(255) DEFAULT NULL,
  `seller_country` varchar(255) DEFAULT NULL,
  `seller_city` varchar(255) DEFAULT NULL,
  `seller_destrict` varchar(255) DEFAULT NULL,
  `seller_address` longtext DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `shipment_time` varchar(255) DEFAULT NULL,
  `additional_document_id` varchar(255) DEFAULT NULL,
  `second_receiver_country` varchar(255) DEFAULT NULL,
  `second_receiver_ill` varchar(255) DEFAULT NULL,
  `second_receiver_postal_code` varchar(255) DEFAULT NULL,
  `second_receiver_district` varchar(255) DEFAULT NULL,
  `second_receiver_address` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edelivery_note_table_invoice_uuid_unique` (`invoice_uuid`),
  KEY `edelivery_note_table_user_id_foreign` (`user_id`),
  KEY `edelivery_note_table_company_id_foreign` (`company_id`),
  KEY `edelivery_note_table_submission_type_id_foreign` (`submission_type_id`),
  KEY `edelivery_note_table_despatch_type_id_foreign` (`despatch_type_id`),
  KEY `edelivery_note_table_invoice_scenario_id_foreign` (`invoice_scenario_id`),
  KEY `edelivery_note_table_currency_unit_id_foreign` (`currency_unit_id`),
  CONSTRAINT `edelivery_note_table_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `edelivery_note_table_currency_unit_id_foreign` FOREIGN KEY (`currency_unit_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `edelivery_note_table_despatch_type_id_foreign` FOREIGN KEY (`despatch_type_id`) REFERENCES `edelivery_note_despatch_type` (`id`),
  CONSTRAINT `edelivery_note_table_invoice_scenario_id_foreign` FOREIGN KEY (`invoice_scenario_id`) REFERENCES `edelivery_note_invoice_scenario` (`id`),
  CONSTRAINT `edelivery_note_table_submission_type_id_foreign` FOREIGN KEY (`submission_type_id`) REFERENCES `edelivery_note_submission_type` (`id`),
  CONSTRAINT `edelivery_note_table_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_table`
--

LOCK TABLES `edelivery_note_table` WRITE;
/*!40000 ALTER TABLE `edelivery_note_table` DISABLE KEYS */;
INSERT INTO `edelivery_note_table` VALUES (1,3,1,'7e55582d-45d0-4c51-8901-e1a67248880f',1,'2024-08-14 00:00:00','TK',1,1,2,'title','New ID','2332',123.00,'Remarks','John Doe','223','1223d2','2s2s','Algeria','Aïn Defla','District 1','Some address here','23422','Mercy','323','www','eee','Albania','Elbasan','Nassarawa','Some address here','Peter Paul','dsded','sddde','dsde','Albania','Durrës','District 132','Some address here','11','2024-08-21','06:12','dd323f','Algeria','Algeria','Some addressxx','USA 1','Some address here','Some address','2024-08-14 05:17:59','2024-08-14 05:17:59'),(2,3,1,'2ffd9d4f-08cd-4754-a40e-8b7e5950edfe',1,'2024-08-14 00:00:00','TK',1,1,2,'title','New ID','2332',123.00,'Remarks','Saul','223','1223d2','2s2s','Algeria','Aïn Defla','District 1','Some address here','23422','Mercy','323','www','eee','Albania','Elbasan','Nassarawa','Some address here','Peter Paul','dsded','sddde','dsde','Albania','Durrës','District 132','Some address here','11','2024-08-21','06:12','dd323f','Algeria','Algeria','Some addressxx','USA 1','Some address here','Some address','2024-08-14 05:18:18','2024-08-14 05:18:18'),(6,3,1,'d2993ded-7e31-47db-a23a-8f2e910ae238',2,'2024-08-21 00:00:00','TK',1,1,2,'Education','New ID','2332',343.00,'Remarks','John Doe','223','1223d2','2s2s','Albania','Durrës','District 1','Some address here.','23422','Buyer','323','Admin','eee','Algeria','Annaba','Nassarawa','Some address here.','Peter Paul','dsded','sddde','dsde','Albania','Elbasan','District 132','Some address here.','12345','2024-08-21','10:36','dd323f','Algeria','Algeria','Some addressxx','USA 1','Some address here.','Some notes here','2024-08-21 09:41:05','2024-08-21 09:41:05');
/*!40000 ALTER TABLE `edelivery_note_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edelivery_note_trailer_info`
--

DROP TABLE IF EXISTS `edelivery_note_trailer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edelivery_note_trailer_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plate_number` varchar(255) DEFAULT NULL,
  `edelivery_note_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edelivery_note_trailer_info_edelivery_note_id_foreign` (`edelivery_note_id`),
  CONSTRAINT `edelivery_note_trailer_info_edelivery_note_id_foreign` FOREIGN KEY (`edelivery_note_id`) REFERENCES `edelivery_note_table` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edelivery_note_trailer_info`
--

LOCK TABLES `edelivery_note_trailer_info` WRITE;
/*!40000 ALTER TABLE `edelivery_note_trailer_info` DISABLE KEYS */;
INSERT INTO `edelivery_note_trailer_info` VALUES (1,'1121',1,'2024-08-14 05:17:59','2024-08-14 05:17:59'),(2,'1121',2,'2024-08-14 05:18:18','2024-08-14 05:18:18'),(6,'1121',6,'2024-08-21 09:41:05','2024-08-21 09:41:05');
/*!40000 ALTER TABLE `edelivery_note_trailer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `einvoice`
--

DROP TABLE IF EXISTS `einvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `einvoice` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_uuid` varchar(255) NOT NULL,
  `invoice_date` varchar(255) NOT NULL,
  `invoice_date_time` varchar(255) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `exchange_rate` varchar(255) DEFAULT NULL,
  `wildcard` varchar(255) DEFAULT NULL,
  `invoice_tapdk_number` varchar(255) DEFAULT NULL,
  `charge_start_date` date DEFAULT NULL,
  `charge_start_date_time` varchar(255) DEFAULT NULL,
  `charge_end_date` date DEFAULT NULL,
  `charge_end_date_time` varchar(255) DEFAULT NULL,
  `plate_number` varchar(255) DEFAULT NULL,
  `vehicle_idenfitication_number` varchar(255) DEFAULT NULL,
  `esu_rapor_id` varchar(255) DEFAULT NULL,
  `esu_rapor_date` date DEFAULT NULL,
  `esu_rapor_date_time` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) NOT NULL,
  `receiver_tax_number` varchar(255) NOT NULL,
  `receiver_gib_postbox` varchar(255) NOT NULL,
  `receiver_tapdk_no` varchar(255) DEFAULT NULL,
  `receiver_tax_office` varchar(255) DEFAULT NULL,
  `receiver_country` varchar(255) NOT NULL,
  `receiver_city` varchar(255) DEFAULT NULL,
  `receiver_county` varchar(255) DEFAULT NULL,
  `receiver_address` longtext DEFAULT NULL,
  `receiver_telephone` varchar(255) DEFAULT NULL,
  `receiver_email` varchar(255) DEFAULT NULL,
  `receiver_web` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_channel_code` varchar(255) DEFAULT NULL,
  `payee_financial_account` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `dispatch_number` varchar(255) DEFAULT NULL,
  `despatch_date` date DEFAULT NULL,
  `mode_code` varchar(255) DEFAULT NULL,
  `tr_id_number` varchar(255) DEFAULT NULL,
  `declarer_name` varchar(255) DEFAULT NULL,
  `export_buyer_name` varchar(255) DEFAULT NULL,
  `export_buyer_surname` varchar(255) DEFAULT NULL,
  `export_buyer_nationality` varchar(255) DEFAULT NULL,
  `export_buyer_passport_number` varchar(255) DEFAULT NULL,
  `export_buyer_passport_date` date DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `total_products_services` decimal(10,2) NOT NULL,
  `total_discounts` decimal(10,2) NOT NULL,
  `total_increase` decimal(10,2) NOT NULL,
  `total_0015_vat` decimal(10,2) NOT NULL,
  `total_taxes` decimal(10,2) NOT NULL,
  `bottom_total_discount_rate` decimal(10,2) NOT NULL,
  `invoice_send_type_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_type_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_scenario_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_currency_id` bigint(20) unsigned DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `einvoice_invoice_uuid_unique` (`invoice_uuid`),
  KEY `einvoice_invoice_send_type_id_foreign` (`invoice_send_type_id`),
  KEY `einvoice_invoice_type_id_foreign` (`invoice_type_id`),
  KEY `einvoice_invoice_scenario_id_foreign` (`invoice_scenario_id`),
  KEY `einvoice_invoice_currency_id_foreign` (`invoice_currency_id`),
  KEY `einvoice_company_id_foreign` (`company_id`),
  CONSTRAINT `einvoice_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `einvoice_invoice_currency_id_foreign` FOREIGN KEY (`invoice_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `einvoice_invoice_scenario_id_foreign` FOREIGN KEY (`invoice_scenario_id`) REFERENCES `invoice_scenario` (`id`),
  CONSTRAINT `einvoice_invoice_send_type_id_foreign` FOREIGN KEY (`invoice_send_type_id`) REFERENCES `invoice_send_type` (`id`),
  CONSTRAINT `einvoice_invoice_type_id_foreign` FOREIGN KEY (`invoice_type_id`) REFERENCES `invoice_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `einvoice`
--

LOCK TABLES `einvoice` WRITE;
/*!40000 ALTER TABLE `einvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `einvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `einvoice_item`
--

DROP TABLE IF EXISTS `einvoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `einvoice_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product` varchar(255) NOT NULL,
  `quantity` double(10,2) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `0015_vat_rate` double(10,2) DEFAULT NULL,
  `0015_vat_amount` double(10,2) DEFAULT NULL,
  `taxline_total` double(10,2) DEFAULT NULL,
  `payable_total` double(10,2) DEFAULT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `increases_decreases_id` bigint(20) unsigned NOT NULL,
  `einvoice_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `einvoice_item_unit_id_foreign` (`unit_id`),
  KEY `einvoice_item_increases_decreases_id_foreign` (`increases_decreases_id`),
  KEY `einvoice_item_einvoice_id_foreign` (`einvoice_id`),
  CONSTRAINT `einvoice_item_einvoice_id_foreign` FOREIGN KEY (`einvoice_id`) REFERENCES `einvoice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `einvoice_item_increases_decreases_id_foreign` FOREIGN KEY (`increases_decreases_id`) REFERENCES `einvoice_item_increases_decreases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `einvoice_item_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `einvoice_item`
--

LOCK TABLES `einvoice_item` WRITE;
/*!40000 ALTER TABLE `einvoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `einvoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `einvoice_item_increases_decreases`
--

DROP TABLE IF EXISTS `einvoice_item_increases_decreases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `einvoice_item_increases_decreases` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('increase','decrease') NOT NULL,
  `rate` double(10,2) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `einvoice_item_increases_decreases`
--

LOCK TABLES `einvoice_item_increases_decreases` WRITE;
/*!40000 ALTER TABLE `einvoice_item_increases_decreases` DISABLE KEYS */;
/*!40000 ALTER TABLE `einvoice_item_increases_decreases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eledger_categories`
--

DROP TABLE IF EXISTS `eledger_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eledger_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eledger_categories`
--

LOCK TABLES `eledger_categories` WRITE;
/*!40000 ALTER TABLE `eledger_categories` DISABLE KEYS */;
INSERT INTO `eledger_categories` VALUES (1,'Sales','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Purchases','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Expenses','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `eledger_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eledger_statuses`
--

DROP TABLE IF EXISTS `eledger_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eledger_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eledger_statuses`
--

LOCK TABLES `eledger_statuses` WRITE;
/*!40000 ALTER TABLE `eledger_statuses` DISABLE KEYS */;
INSERT INTO `eledger_statuses` VALUES (1,'Pending','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Completed','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Cancelled','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `eledger_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eledger_tax_infos`
--

DROP TABLE IF EXISTS `eledger_tax_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eledger_tax_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eledger_tax_infos`
--

LOCK TABLES `eledger_tax_infos` WRITE;
/*!40000 ALTER TABLE `eledger_tax_infos` DISABLE KEYS */;
INSERT INTO `eledger_tax_infos` VALUES (1,'VAT','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'GSR','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `eledger_tax_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eledger_transaction_types`
--

DROP TABLE IF EXISTS `eledger_transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eledger_transaction_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eledger_transaction_types`
--

LOCK TABLES `eledger_transaction_types` WRITE;
/*!40000 ALTER TABLE `eledger_transaction_types` DISABLE KEYS */;
INSERT INTO `eledger_transaction_types` VALUES (1,'Debit','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Credit','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `eledger_transaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eledgers`
--

DROP TABLE IF EXISTS `eledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eledgers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL,
  `transaction_type_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `transaction_date` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `tax_info_id` bigint(20) unsigned DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `payer_name` varchar(255) DEFAULT NULL,
  `payer_id_number` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eledgers_transaction_type_id_foreign` (`transaction_type_id`),
  KEY `eledgers_currency_id_foreign` (`currency_id`),
  KEY `eledgers_category_id_foreign` (`category_id`),
  KEY `eledgers_tax_info_id_foreign` (`tax_info_id`),
  KEY `eledgers_payment_method_id_foreign` (`payment_method_id`),
  KEY `eledgers_status_id_foreign` (`status_id`),
  KEY `eledgers_user_id_foreign` (`user_id`),
  KEY `eledgers_company_id_foreign` (`company_id`),
  CONSTRAINT `eledgers_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `eledger_categories` (`id`),
  CONSTRAINT `eledgers_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eledgers_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `eledgers_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `eledgers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `eledger_statuses` (`id`),
  CONSTRAINT `eledgers_tax_info_id_foreign` FOREIGN KEY (`tax_info_id`) REFERENCES `eledger_tax_infos` (`id`),
  CONSTRAINT `eledgers_transaction_type_id_foreign` FOREIGN KEY (`transaction_type_id`) REFERENCES `eledger_transaction_types` (`id`),
  CONSTRAINT `eledgers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eledgers`
--

LOCK TABLES `eledgers` WRITE;
/*!40000 ALTER TABLE `eledgers` DISABLE KEYS */;
INSERT INTO `eledgers` VALUES (2,'John Doe',1,700.00,3,'2024-09-10','Some description goes here','2345678',2,NULL,1,32432.00,2,'Mercy','2345678',2,'User11','User11',NULL,3,1,'2024-09-10 09:41:36','2024-09-10 09:42:12');
/*!40000 ALTER TABLE `eledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming_delivery_notes_archive`
--

DROP TABLE IF EXISTS `incoming_delivery_notes_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incoming_delivery_notes_archive` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) NOT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) NOT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `package_info` varchar(255) NOT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `connector_status` varchar(255) DEFAULT NULL,
  `last_update_user` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incoming_delivery_notes_archive_company_id_foreign` (`company_id`),
  KEY `incoming_delivery_notes_archive_user_id_foreign` (`user_id`),
  CONSTRAINT `incoming_delivery_notes_archive_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `incoming_delivery_notes_archive_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_delivery_notes_archive`
--

LOCK TABLES `incoming_delivery_notes_archive` WRITE;
/*!40000 ALTER TABLE `incoming_delivery_notes_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `incoming_delivery_notes_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming_delivery_notes_call`
--

DROP TABLE IF EXISTS `incoming_delivery_notes_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incoming_delivery_notes_call` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `buyer_company` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) NOT NULL,
  `buyer_company_vkn` varchar(255) NOT NULL,
  `receipient_company_mailbox` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) NOT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `package_info` varchar(255) NOT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `connector_status` varchar(255) DEFAULT NULL,
  `last_update_user` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incoming_delivery_notes_call_company_id_foreign` (`company_id`),
  KEY `incoming_delivery_notes_call_user_id_foreign` (`user_id`),
  CONSTRAINT `incoming_delivery_notes_call_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `incoming_delivery_notes_call_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_delivery_notes_call`
--

LOCK TABLES `incoming_delivery_notes_call` WRITE;
/*!40000 ALTER TABLE `incoming_delivery_notes_call` DISABLE KEYS */;
/*!40000 ALTER TABLE `incoming_delivery_notes_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming_delivery_notes_incoming`
--

DROP TABLE IF EXISTS `incoming_delivery_notes_incoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incoming_delivery_notes_incoming` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) NOT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) NOT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `activity_envelope` varchar(255) DEFAULT NULL,
  `package_info` varchar(255) NOT NULL,
  `recieved_date` timestamp NULL DEFAULT NULL,
  `response_date` timestamp NULL DEFAULT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `connector_status` varchar(255) DEFAULT NULL,
  `last_update_user` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incoming_delivery_notes_incoming_company_id_foreign` (`company_id`),
  KEY `incoming_delivery_notes_incoming_user_id_foreign` (`user_id`),
  CONSTRAINT `incoming_delivery_notes_incoming_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `incoming_delivery_notes_incoming_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_delivery_notes_incoming`
--

LOCK TABLES `incoming_delivery_notes_incoming` WRITE;
/*!40000 ALTER TABLE `incoming_delivery_notes_incoming` DISABLE KEYS */;
/*!40000 ALTER TABLE `incoming_delivery_notes_incoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_attachment`
--

DROP TABLE IF EXISTS `invoice_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_attachment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_attachment_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `invoice_attachment_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `einvoice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_attachment`
--

LOCK TABLES `invoice_attachment` WRITE;
/*!40000 ALTER TABLE `invoice_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_attachments`
--

DROP TABLE IF EXISTS `invoice_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_attachments_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `invoice_attachments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_attachments`
--

LOCK TABLES `invoice_attachments` WRITE;
/*!40000 ALTER TABLE `invoice_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_decrease_increase`
--

DROP TABLE IF EXISTS `invoice_decrease_increase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_decrease_increase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('decrease','increase') NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `invoice_product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_decrease_increase_invoice_product_id_foreign` (`invoice_product_id`),
  CONSTRAINT `invoice_decrease_increase_invoice_product_id_foreign` FOREIGN KEY (`invoice_product_id`) REFERENCES `invoice_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_decrease_increase`
--

LOCK TABLES `invoice_decrease_increase` WRITE;
/*!40000 ALTER TABLE `invoice_decrease_increase` DISABLE KEYS */;
INSERT INTO `invoice_decrease_increase` VALUES (1,'increase',1,250.00,1,'2024-08-14 04:51:06','2024-08-14 04:51:06'),(3,'increase',1,250.00,3,'2024-08-14 04:51:40','2024-08-14 04:51:40'),(4,'increase',1,250.00,4,'2024-08-14 04:52:02','2024-08-14 04:52:02'),(8,'increase',1,750.00,8,'2024-09-10 09:51:11','2024-09-10 09:51:11');
/*!40000 ALTER TABLE `invoice_decrease_increase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_products`
--

DROP TABLE IF EXISTS `invoice_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_service` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_measurement` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `taxable_amount` decimal(15,2) DEFAULT NULL,
  `zero_zero_one_five_vat_rate` decimal(5,2) DEFAULT NULL,
  `zero_zero_one_five_vat_amount` decimal(15,2) DEFAULT NULL,
  `taxline_total` decimal(5,2) DEFAULT NULL,
  `payabl_line_total` decimal(15,2) DEFAULT NULL,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `product_category_id` bigint(20) unsigned DEFAULT NULL,
  `product_subcategory_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_products_product_category_id_foreign` (`product_category_id`),
  KEY `invoice_products_product_subcategory_id_foreign` (`product_subcategory_id`),
  CONSTRAINT `invoice_products_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  CONSTRAINT `invoice_products_product_subcategory_id_foreign` FOREIGN KEY (`product_subcategory_id`) REFERENCES `product_subcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_products`
--

LOCK TABLES `invoice_products` WRITE;
/*!40000 ALTER TABLE `invoice_products` DISABLE KEYS */;
INSERT INTO `invoice_products` VALUES (1,'Product',5,'1',500.00,250.00,0.20,50.00,250.00,500.00,1,1,NULL,'2024-08-14 04:51:06','2024-08-14 04:51:06'),(3,'Product',5,'1',500.00,250.00,0.20,50.00,250.00,500.00,3,1,NULL,'2024-08-14 04:51:40','2024-08-14 04:51:40'),(4,'Product',5,'1',500.00,250.00,0.20,50.00,250.00,500.00,4,1,NULL,'2024-08-14 04:52:02','2024-08-14 04:52:02'),(8,'Product',5,'1',1500.00,750.00,0.20,150.00,750.00,1500.00,11,3,NULL,'2024-09-10 09:51:11','2024-09-10 09:51:11');
/*!40000 ALTER TABLE `invoice_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_received_tables`
--

DROP TABLE IF EXISTS `invoice_received_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_received_tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `add_payment` varchar(255) NOT NULL,
  `amount_paid` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_received_tables`
--

LOCK TABLES `invoice_received_tables` WRITE;
/*!40000 ALTER TABLE `invoice_received_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_received_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_scenario`
--

DROP TABLE IF EXISTS `invoice_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_scenario` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_scenario`
--

LOCK TABLES `invoice_scenario` WRITE;
/*!40000 ALTER TABLE `invoice_scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_scenarios`
--

DROP TABLE IF EXISTS `invoice_scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_scenarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_scenarios`
--

LOCK TABLES `invoice_scenarios` WRITE;
/*!40000 ALTER TABLE `invoice_scenarios` DISABLE KEYS */;
INSERT INTO `invoice_scenarios` VALUES (1,'Basic','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Commercial','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Export','2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'Accomplished Invoice','2024-08-13 12:07:44','2024-08-13 12:07:44'),(5,'Exclusive','2024-08-13 12:07:44','2024-08-13 12:07:44'),(6,'Government','2024-08-13 12:07:44','2024-08-13 12:07:44'),(7,'HKS','2024-08-13 12:07:44','2024-08-13 12:07:44'),(8,'ENEGERY','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `invoice_scenarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_send_type`
--

DROP TABLE IF EXISTS `invoice_send_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_send_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_send_type`
--

LOCK TABLES `invoice_send_type` WRITE;
/*!40000 ALTER TABLE `invoice_send_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_send_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_send_types`
--

DROP TABLE IF EXISTS `invoice_send_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_send_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_send_types`
--

LOCK TABLES `invoice_send_types` WRITE;
/*!40000 ALTER TABLE `invoice_send_types` DISABLE KEYS */;
INSERT INTO `invoice_send_types` VALUES (1,'e-Invoice','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'e-Archive','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `invoice_send_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_type`
--

DROP TABLE IF EXISTS `invoice_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_type`
--

LOCK TABLES `invoice_type` WRITE;
/*!40000 ALTER TABLE `invoice_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_types`
--

DROP TABLE IF EXISTS `invoice_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_types`
--

LOCK TABLES `invoice_types` WRITE;
/*!40000 ALTER TABLE `invoice_types` DISABLE KEYS */;
INSERT INTO `invoice_types` VALUES (1,'Sales','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Return','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'HKS Sales','2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'With Holding','2024-08-13 12:07:44','2024-08-13 12:07:44'),(5,'Exception','2024-08-13 12:07:44','2024-08-13 12:07:44'),(6,'Special Base','2024-08-13 12:07:44','2024-08-13 12:07:44'),(7,'Export Registration','2024-08-13 12:07:44','2024-08-13 12:07:44'),(8,'Textbook','2024-08-13 12:07:44','2024-08-13 12:07:44'),(9,'Broker','2024-08-13 12:07:44','2024-08-13 12:07:44'),(10,'CHARGE','2024-08-13 12:07:44','2024-08-13 12:07:44'),(11,'SURGERY','2024-08-13 12:07:44','2024-08-13 12:07:44'),(12,'Accommodation Tax','2024-08-13 12:07:44','2024-08-13 12:07:44'),(13,'HKS Broker','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `invoice_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `send_type` bigint(20) unsigned NOT NULL,
  `invoice_uuid` varchar(255) NOT NULL,
  `invoice_date` varchar(255) NOT NULL,
  `invoice_time` varchar(255) NOT NULL,
  `invoice_id` varchar(255) NOT NULL,
  `invoice_type` bigint(20) unsigned NOT NULL,
  `invoice_scenario` bigint(20) unsigned NOT NULL,
  `invoice_currency` bigint(20) unsigned NOT NULL,
  `exchange_rate` varchar(255) DEFAULT NULL,
  `wildcard_1` varchar(255) DEFAULT NULL,
  `your_tapdk_number` varchar(255) DEFAULT NULL,
  `charge_start_date` varchar(255) DEFAULT NULL,
  `charge_start_time` varchar(255) DEFAULT NULL,
  `charge_end_date` varchar(255) DEFAULT NULL,
  `charge_end_time` varchar(255) DEFAULT NULL,
  `plate_number` varchar(255) DEFAULT NULL,
  `vehicle_id` varchar(255) DEFAULT NULL,
  `esu_report_id` varchar(255) DEFAULT NULL,
  `esu_report_date` varchar(255) DEFAULT NULL,
  `esu_report_time` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `dispatch_number` varchar(255) DEFAULT NULL,
  `dispatch_date` varchar(255) DEFAULT NULL,
  `dispatch_time` varchar(255) DEFAULT NULL,
  `mode_code` varchar(255) DEFAULT NULL,
  `tr_id_number` varchar(255) DEFAULT NULL,
  `name_declarer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `passport_number` varchar(255) DEFAULT NULL,
  `passport_date` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `gib_post_box` varchar(255) DEFAULT NULL,
  `receiver_tapdk_number` varchar(255) DEFAULT NULL,
  `tax_office` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `receiver_email` varchar(255) DEFAULT NULL,
  `receiver_web` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `payment_date` varchar(255) DEFAULT NULL,
  `payment_means` varchar(255) DEFAULT NULL,
  `payment_channel_code` varchar(255) DEFAULT NULL,
  `payee_financial_account` varchar(255) DEFAULT NULL,
  `total_products` int(11) DEFAULT NULL,
  `total_discount` decimal(15,2) DEFAULT NULL,
  `total_increase` decimal(15,2) DEFAULT NULL,
  `zero_zero_one_five_vat` decimal(15,2) DEFAULT NULL,
  `total_taxes` decimal(15,2) DEFAULT NULL,
  `bottom_total_discount_rate` decimal(15,2) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_invoice_uuid_unique` (`invoice_uuid`),
  KEY `invoices_user_id_foreign` (`user_id`),
  KEY `invoices_company_id_foreign` (`company_id`),
  KEY `invoices_send_type_foreign` (`send_type`),
  KEY `invoices_invoice_type_foreign` (`invoice_type`),
  KEY `invoices_invoice_scenario_foreign` (`invoice_scenario`),
  KEY `invoices_invoice_currency_foreign` (`invoice_currency`),
  CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `invoices_invoice_currency_foreign` FOREIGN KEY (`invoice_currency`) REFERENCES `currencies` (`id`),
  CONSTRAINT `invoices_invoice_scenario_foreign` FOREIGN KEY (`invoice_scenario`) REFERENCES `invoice_scenarios` (`id`),
  CONSTRAINT `invoices_invoice_type_foreign` FOREIGN KEY (`invoice_type`) REFERENCES `invoice_types` (`id`),
  CONSTRAINT `invoices_send_type_foreign` FOREIGN KEY (`send_type`) REFERENCES `invoice_send_types` (`id`),
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,3,1,1,'8c298ef0-59f8-11ef-9ed4-55e706b1f944','2024-08-14','05:49','TK',1,1,2,'11','232','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','2024-08-14','1111','2024-08-14','05:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'John Doe','1212','12221','1212','234','Albania','Berat','Some address here','someone@email.com','www.testingsite.com','1234321','2024-08-14','Cash','4567','account',250,1250.00,500.00,NULL,250.00,500.00,'Some notes here.',NULL,'2024-08-14 04:51:06','2024-08-14 04:51:06'),(3,3,1,1,'e42eab80-59f8-11ef-9ed4-55e706b1f944','2024-08-14','05:49','TK',1,1,2,'11','232','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','2024-08-14','1111','2024-08-14','05:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Peter Paul','1212','12221','1212','234','Albania','Berat','Some address here','someone@email.com','www.testingsite.com','1234321','2024-08-14','Cash','4567','account',250,1250.00,500.00,NULL,250.00,500.00,'Some notes here.',NULL,'2024-08-14 04:51:40','2024-08-14 04:51:40'),(4,3,1,2,'ea9e0240-59f8-11ef-9ed4-55e706b1f944','2024-08-14','05:49','TK',1,1,2,'11','232','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','2024-08-14','1111','2024-08-14','05:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mercy','1212','12221','1212','234','Albania','Berat','Some address here','someone@email.com','www.testingsite.com','1234321','2024-08-14','Cash','4567','account',250,1250.00,500.00,NULL,250.00,500.00,'Some notes here.',NULL,'2024-08-14 04:52:02','2024-08-14 04:52:02'),(11,3,1,1,'d940f4a0-6f59-11ef-95d1-f5fd2deba679','2024-09-10','10:48','TK',1,1,2,'11','Remarks','1111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'11','2024-09-11','1111','2024-09-11','11:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mr. Musa Wakili','1212','12221','1212','234','Nigeria','Plateau','Address here','someone@email.com','www.testingsite.com','12345678','2024-09-11','Cash','4567','12342',750,3750.00,1500.00,NULL,750.00,1500.00,'Some notes here',NULL,'2024-09-10 09:51:11','2024-09-10 09:51:11');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_units`
--

DROP TABLE IF EXISTS `measurement_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_units`
--

LOCK TABLES `measurement_units` WRITE;
/*!40000 ALTER TABLE `measurement_units` DISABLE KEYS */;
INSERT INTO `measurement_units` VALUES (1,'Set','Set','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Year','Year','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Box','Box','2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'Piece','Piece','2024-08-13 12:07:44','2024-08-13 12:07:44'),(5,'Euro','Square Centimetre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(6,'Day','Day','2024-08-13 12:07:44','2024-08-13 12:07:44'),(7,'Dozen','Dozen','2024-08-13 12:07:44','2024-08-13 12:07:44'),(8,'Foot','Foot','2024-08-13 12:07:44','2024-08-13 12:07:44'),(9,'Gram','Gram','2024-08-13 12:07:44','2024-08-13 12:07:44'),(10,'Gross ton','Gross ton','2024-08-13 12:07:44','2024-08-13 12:07:44'),(11,'Hour','Hour','2024-08-13 12:07:44','2024-08-13 12:07:44'),(12,'Barrel','Barrel','2024-08-13 12:07:44','2024-08-13 12:07:44'),(13,'Kilogram','Kilogram','2024-08-13 12:07:44','2024-08-13 12:07:44'),(14,'Kilojoules','Kilojoules','2024-08-13 12:07:44','2024-08-13 12:07:44'),(15,'Kilowatt-hour','Kilowatt-hour','2024-08-13 12:07:44','2024-08-13 12:07:44'),(16,'Lot','Lot','2024-08-13 12:07:44','2024-08-13 12:07:44'),(17,'Litre','Litre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(18,'Milligrams','Milligrams','2024-08-13 12:07:44','2024-08-13 12:07:44'),(19,'Minute','Minute','2024-08-13 12:07:44','2024-08-13 12:07:44'),(20,'Cubic Millimetre','Cubic Millimetre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(21,'Month','Month','2024-08-13 12:07:44','2024-08-13 12:07:44'),(22,'Square metre','Square metre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(23,'Cubic Metre','Cubic Metre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(24,'Metre','Metre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(25,'Pair','Pair','2024-08-13 12:07:44','2024-08-13 12:07:44'),(26,'Pacakge','Package','2024-08-13 12:07:44','2024-08-13 12:07:44'),(27,'Thousand cubic metre','Thousand cubic metre','2024-08-13 12:07:44','2024-08-13 12:07:44'),(28,'Truckload','Truckload','2024-08-13 12:07:44','2024-08-13 12:07:44'),(29,'Ton (metric)','Ton (metric)','2024-08-13 12:07:44','2024-08-13 12:07:44'),(30,'Pallet','Pallet','2024-08-13 12:07:44','2024-08-13 12:07:44'),(31,'Koli','Koli','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `measurement_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_01_13_144701_create_companies_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_reset_tokens_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2024_01_21_204317_create_permission_tables',1),(7,'2024_01_23_094142_create_products_table',1),(8,'2024_02_06_160512_product_categories',1),(9,'2024_02_17_200842_create_table_invoice_type',1),(10,'2024_02_17_202346_create_invoice_scenario',1),(11,'2024_02_17_202420_create_invoice_send_type',1),(12,'2024_02_17_202703_utils_tables',1),(13,'2024_02_19_01_create_table_einvoice',1),(14,'2024_02_19_02_create_units',1),(15,'2024_02_19_03_create_einvoice_item_increases_decreases_table',1),(16,'2024_02_19_03_create_table_einvoice_item',1),(17,'2024_02_19_04_create_invoice_attachment_table',1),(18,'2024_03_12_080721_create_table_outgoing_delivery_note_archive',1),(19,'2024_03_12_080721_create_table_outgoing_delivery_note_call',1),(20,'2024_03_12_080721_create_table_outgoing_delivery_note_cancellation',1),(21,'2024_03_12_080721_create_table_outgoing_delivery_note_outgoing',1),(22,'2024_03_19_102534_create_incoming_delivery_notes_archive_table',1),(23,'2024_03_19_102534_create_incoming_delivery_notes_call_table',1),(24,'2024_03_19_102534_create_incoming_delivery_notes_incoming_table',1),(25,'2024_03_29_090707_company_user',1),(26,'2024_04_04_093_table_invoice_scenarios',1),(27,'2024_04_04_093_table_invoice_send_types',1),(28,'2024_04_04_093_table_invoice_types',1),(29,'2024_04_04_115308_table_invoices',1),(30,'2024_04_04_131609_table_invoice_products',1),(31,'2024_04_04_133031_table_invoice_decrease_increase',1),(32,'2024_04_04_215530_create_invoice_attachments',1),(33,'2024_04_04_215530_payment_methods',1),(34,'2024_04_15_130518_create_outgoing_producer_receipt_tables',1),(35,'2024_06_01_083055_edelivery_note_tables',1),(36,'2024_06_12_135125_create_producer_receipts_table',1),(37,'2024_06_12_162249_create_invoice_received_tables',1),(38,'2024_06_27_135635_eledgers',1),(39,'2024_06_28_181237_address_book',1),(40,'2024_07_10_092136_create_contacts_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (2,'App\\Models\\User',1),(2,'App\\Models\\User',2),(2,'App\\Models\\User',4),(3,'App\\Models\\User',3),(3,'App\\Models\\User',5);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoing_delivery_note_archive`
--

DROP TABLE IF EXISTS `outgoing_delivery_note_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outgoing_delivery_note_archive` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) DEFAULT NULL,
  `gib_dispatch_send_type` varchar(255) DEFAULT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` date NOT NULL,
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) DEFAULT NULL,
  `gib_post_box_email` varchar(255) DEFAULT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `connector_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outgoing_delivery_note_archive_user_id_foreign` (`user_id`),
  KEY `outgoing_delivery_note_archive_company_id_foreign` (`company_id`),
  CONSTRAINT `outgoing_delivery_note_archive_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `outgoing_delivery_note_archive_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoing_delivery_note_archive`
--

LOCK TABLES `outgoing_delivery_note_archive` WRITE;
/*!40000 ALTER TABLE `outgoing_delivery_note_archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `outgoing_delivery_note_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoing_delivery_note_call`
--

DROP TABLE IF EXISTS `outgoing_delivery_note_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outgoing_delivery_note_call` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `sender_company` varchar(255) NOT NULL,
  `sender_company_vkn` varchar(255) NOT NULL,
  `sender_company_mailbox` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) DEFAULT NULL,
  `gib_dispatch_send_type` varchar(255) DEFAULT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` date NOT NULL,
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) DEFAULT NULL,
  `gib_post_box_email` varchar(255) DEFAULT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `package_info` varchar(255) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `connector_status` varchar(255) DEFAULT NULL,
  `cancel_status` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT NULL,
  `last_update_user` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outgoing_delivery_note_call_user_id_foreign` (`user_id`),
  KEY `outgoing_delivery_note_call_company_id_foreign` (`company_id`),
  CONSTRAINT `outgoing_delivery_note_call_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `outgoing_delivery_note_call_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoing_delivery_note_call`
--

LOCK TABLES `outgoing_delivery_note_call` WRITE;
/*!40000 ALTER TABLE `outgoing_delivery_note_call` DISABLE KEYS */;
/*!40000 ALTER TABLE `outgoing_delivery_note_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoing_delivery_note_cancellation`
--

DROP TABLE IF EXISTS `outgoing_delivery_note_cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outgoing_delivery_note_cancellation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) DEFAULT NULL,
  `gib_dispatch_send_type` varchar(255) DEFAULT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` date NOT NULL,
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) DEFAULT NULL,
  `gib_post_box_email` varchar(255) DEFAULT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `connector_status` varchar(255) DEFAULT NULL,
  `cancellation_time` datetime DEFAULT NULL,
  `last_update_user` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outgoing_delivery_note_cancellation_user_id_foreign` (`user_id`),
  KEY `outgoing_delivery_note_cancellation_company_id_foreign` (`company_id`),
  CONSTRAINT `outgoing_delivery_note_cancellation_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `outgoing_delivery_note_cancellation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoing_delivery_note_cancellation`
--

LOCK TABLES `outgoing_delivery_note_cancellation` WRITE;
/*!40000 ALTER TABLE `outgoing_delivery_note_cancellation` DISABLE KEYS */;
/*!40000 ALTER TABLE `outgoing_delivery_note_cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outgoing_delivery_note_outgoing`
--

DROP TABLE IF EXISTS `outgoing_delivery_note_outgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outgoing_delivery_note_outgoing` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `gib_dispatch_type` varchar(255) DEFAULT NULL,
  `gib_dispatch_send_type` varchar(255) DEFAULT NULL,
  `supplier_code` varchar(255) DEFAULT NULL,
  `dispatch_date` date NOT NULL,
  `dispatch_id` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `dispatch_uuid` varchar(255) DEFAULT NULL,
  `gib_post_box_email` varchar(255) DEFAULT NULL,
  `wild_card1` varchar(255) DEFAULT NULL,
  `erp_reference` varchar(255) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `activity_envelope` varchar(255) DEFAULT NULL,
  `package_info` varchar(255) DEFAULT NULL,
  `send_date` datetime DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `response_date` datetime DEFAULT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) DEFAULT NULL,
  `last_update_user` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outgoing_delivery_note_outgoing_user_id_foreign` (`user_id`),
  KEY `outgoing_delivery_note_outgoing_company_id_foreign` (`company_id`),
  CONSTRAINT `outgoing_delivery_note_outgoing_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `outgoing_delivery_note_outgoing_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outgoing_delivery_note_outgoing`
--

LOCK TABLES `outgoing_delivery_note_outgoing` WRITE;
/*!40000 ALTER TABLE `outgoing_delivery_note_outgoing` DISABLE KEYS */;
/*!40000 ALTER TABLE `outgoing_delivery_note_outgoing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES ('musailliasu7@gmail.com','$2y$12$21BBWbqKbZt2SFtYRMsDcefeBpLVPUF9HDyTz4OewcKK2KZMOxcz.','2024-09-10 11:44:50');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Cash','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Bank Transfer','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Cheque','2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'Credit Card','2024-08-13 12:07:44','2024-08-13 12:07:44'),(5,'Debit Card','2024-08-13 12:07:44','2024-08-13 12:07:44'),(6,'Mobile Money','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_receipt_archives`
--

DROP TABLE IF EXISTS `producer_receipt_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer_receipt_archives` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `producer_receipt_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `producer_receipt_no` varchar(255) NOT NULL,
  `ettn` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `gib_post_box_email` varchar(255) NOT NULL,
  `portal_status` varchar(255) NOT NULL DEFAULT 'reload',
  `connector_status` varchar(255) NOT NULL DEFAULT 'unread',
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_receipt_archives_company_id_foreign` (`company_id`),
  KEY `producer_receipt_archives_user_id_foreign` (`user_id`),
  CONSTRAINT `producer_receipt_archives_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producer_receipt_archives_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_receipt_archives`
--

LOCK TABLES `producer_receipt_archives` WRITE;
/*!40000 ALTER TABLE `producer_receipt_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `producer_receipt_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_receipt_calls`
--

DROP TABLE IF EXISTS `producer_receipt_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer_receipt_calls` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_company` varchar(255) NOT NULL,
  `sender_company_vkn` varchar(255) NOT NULL,
  `sender_company_mailbox` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `mm_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mm_no` varchar(255) NOT NULL,
  `ettn` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Update/waiting Accept',
  `gib_post_box_email` varchar(255) NOT NULL,
  `portal_status` varchar(255) NOT NULL DEFAULT 'unread',
  `connector_status` varchar(255) NOT NULL DEFAULT 'unread',
  `cancell_status` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) NOT NULL DEFAULT 0,
  `last_update_user` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_receipt_calls_company_id_foreign` (`company_id`),
  KEY `producer_receipt_calls_user_id_foreign` (`user_id`),
  CONSTRAINT `producer_receipt_calls_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producer_receipt_calls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_receipt_calls`
--

LOCK TABLES `producer_receipt_calls` WRITE;
/*!40000 ALTER TABLE `producer_receipt_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `producer_receipt_calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_receipt_cancellations`
--

DROP TABLE IF EXISTS `producer_receipt_cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer_receipt_cancellations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `producer_receipt_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `producer_receipt_no` varchar(255) NOT NULL,
  `ettn` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `gib_post_box_email` varchar(255) NOT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) NOT NULL DEFAULT 'reload',
  `connector_status` varchar(255) NOT NULL DEFAULT 'unread',
  `cancellation_time` timestamp NULL DEFAULT NULL,
  `last_update_user` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_receipt_cancellations_company_id_foreign` (`company_id`),
  KEY `producer_receipt_cancellations_user_id_foreign` (`user_id`),
  CONSTRAINT `producer_receipt_cancellations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producer_receipt_cancellations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_receipt_cancellations`
--

LOCK TABLES `producer_receipt_cancellations` WRITE;
/*!40000 ALTER TABLE `producer_receipt_cancellations` DISABLE KEYS */;
/*!40000 ALTER TABLE `producer_receipt_cancellations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_receipt_outgoings`
--

DROP TABLE IF EXISTS `producer_receipt_outgoings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer_receipt_outgoings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_tax_number` varchar(255) NOT NULL,
  `producer_receipt_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mm_no` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `ettn` varchar(255) NOT NULL,
  `gib_post_box_email` varchar(255) NOT NULL,
  `mail_delivery_status` varchar(255) DEFAULT NULL,
  `portal_status` varchar(255) NOT NULL DEFAULT 'reload',
  `connector_status` varchar(255) NOT NULL DEFAULT 'unread',
  `last_update_user` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_receipt_outgoings_company_id_foreign` (`company_id`),
  KEY `producer_receipt_outgoings_user_id_foreign` (`user_id`),
  CONSTRAINT `producer_receipt_outgoings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producer_receipt_outgoings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_receipt_outgoings`
--

LOCK TABLES `producer_receipt_outgoings` WRITE;
/*!40000 ALTER TABLE `producer_receipt_outgoings` DISABLE KEYS */;
/*!40000 ALTER TABLE `producer_receipt_outgoings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_receipt_products`
--

DROP TABLE IF EXISTS `producer_receipt_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer_receipt_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fee_reason` varchar(255) DEFAULT NULL,
  `quantity1` decimal(10,5) NOT NULL,
  `quantity2` decimal(10,5) NOT NULL,
  `unit_id1` bigint(20) unsigned NOT NULL,
  `unit_id2` bigint(20) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `gross_amount` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `tax_line_total` decimal(10,2) DEFAULT NULL,
  `payable_line` decimal(10,2) DEFAULT NULL,
  `product_category_id` bigint(20) unsigned DEFAULT NULL,
  `product_subcategory_id` bigint(20) unsigned DEFAULT NULL,
  `producer_receipt_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_receipt_products_unit_id1_foreign` (`unit_id1`),
  KEY `producer_receipt_products_unit_id2_foreign` (`unit_id2`),
  KEY `producer_receipt_products_product_category_id_foreign` (`product_category_id`),
  KEY `producer_receipt_products_product_subcategory_id_foreign` (`product_subcategory_id`),
  KEY `producer_receipt_products_producer_receipt_id_foreign` (`producer_receipt_id`),
  CONSTRAINT `producer_receipt_products_producer_receipt_id_foreign` FOREIGN KEY (`producer_receipt_id`) REFERENCES `producer_receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `producer_receipt_products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  CONSTRAINT `producer_receipt_products_product_subcategory_id_foreign` FOREIGN KEY (`product_subcategory_id`) REFERENCES `product_subcategories` (`id`),
  CONSTRAINT `producer_receipt_products_unit_id1_foreign` FOREIGN KEY (`unit_id1`) REFERENCES `measurement_units` (`id`),
  CONSTRAINT `producer_receipt_products_unit_id2_foreign` FOREIGN KEY (`unit_id2`) REFERENCES `measurement_units` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_receipt_products`
--

LOCK TABLES `producer_receipt_products` WRITE;
/*!40000 ALTER TABLE `producer_receipt_products` DISABLE KEYS */;
INSERT INTO `producer_receipt_products` VALUES (1,'Fee reason 1',4.00000,5.00000,1,3,12000.00,0.50,578.00,700.00,564.00,987.00,2,NULL,1,'2024-08-14 05:32:14','2024-08-14 05:32:14');
/*!40000 ALTER TABLE `producer_receipt_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_receipts`
--

DROP TABLE IF EXISTS `producer_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producer_receipts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `producer_uuid` varchar(255) NOT NULL,
  `producer_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `producer_name` varchar(255) NOT NULL,
  `unit_id` bigint(20) unsigned NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `receiver_tax_number` varchar(255) NOT NULL,
  `receiver_tax_office` varchar(255) DEFAULT NULL,
  `sms_notification_for_earchive` tinyint(1) NOT NULL DEFAULT 0,
  `add_to_address_book` tinyint(1) NOT NULL DEFAULT 0,
  `buyer_country` varchar(255) NOT NULL,
  `buyer_city` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_mobile_number` varchar(255) DEFAULT NULL,
  `buyer_web_address` varchar(255) DEFAULT NULL,
  `buyer_address` varchar(255) NOT NULL,
  `total_product_services` decimal(10,2) NOT NULL,
  `total_0003_stoppage` decimal(10,2) NOT NULL,
  `total_taxes` decimal(10,2) NOT NULL,
  `total_payable` decimal(10,2) NOT NULL,
  `notes` longtext DEFAULT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producer_receipts_unit_id_foreign` (`unit_id`),
  KEY `producer_receipts_company_id_foreign` (`company_id`),
  KEY `producer_receipts_user_id_foreign` (`user_id`),
  CONSTRAINT `producer_receipts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `producer_receipts_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `measurement_units` (`id`),
  CONSTRAINT `producer_receipts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_receipts`
--

LOCK TABLES `producer_receipts` WRITE;
/*!40000 ALTER TABLE `producer_receipts` DISABLE KEYS */;
INSERT INTO `producer_receipts` VALUES (1,'2ecc9760-59fe-11ef-8225-270f7db26fe6','2024-08-14 00:00:00','Mercy',2,433.00,'Education','John Doe','223','2s2s',1,1,'Afghanistan','Badakhshān','some@email.com','13543','www.testing.com','Some address here',11.00,22.00,11.00,22.00,'Some notes here',1,3,'2024-08-14 05:32:14','2024-08-14 05:32:14');
/*!40000 ALTER TABLE `producer_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `vat` decimal(10,5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,'Electronics (e.g., smartphones, laptops, tablets)',20.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Clothing and Apparels',10.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Food and Beverages',NULL,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'Furniture (e.g., chairs, tables, cabinets)',10.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(5,'Books and Educational Materials',0.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(6,'Medical Products (e.g., pharmaceuticals, medical devices)',NULL,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(7,'Automotive (e.g., cars, motorcycles, parts)',20.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_subcategories`
--

DROP TABLE IF EXISTS `product_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_subcategories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `product_category_id` bigint(20) unsigned NOT NULL,
  `vat` decimal(10,5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_subcategories_product_category_id_foreign` (`product_category_id`),
  CONSTRAINT `product_subcategories_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_subcategories`
--

LOCK TABLES `product_subcategories` WRITE;
/*!40000 ALTER TABLE `product_subcategories` DISABLE KEYS */;
INSERT INTO `product_subcategories` VALUES (1,'Basic food items (e.g., bread, milk)',3,1.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'Processed foods and beverages',3,1.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'Pharmaceuticals',6,10.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'Medical devices',6,10.00000,'2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `product_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'E-Invoice','E-Invoice','2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'E-Invoice Archived','E-Invoice Archived','2024-08-13 12:07:44','2024-08-13 12:07:44'),(3,'E-Delivery Notes','E-Delivery Notes','2024-08-13 12:07:44','2024-08-13 12:07:44'),(4,'E-Producer','E-Producer','2024-08-13 12:07:44','2024-08-13 12:07:44');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super_admin','api','2024-08-13 12:07:43','2024-08-13 12:07:43'),(2,'admin','api','2024-08-13 12:07:43','2024-08-13 12:07:43'),(3,'user','api','2024-08-13 12:07:43','2024-08-13 12:07:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `notification_einvoice` tinyint(1) NOT NULL DEFAULT 0,
  `notification_edispatch` tinyint(1) NOT NULL DEFAULT 0,
  `luca_username` varchar(255) DEFAULT NULL,
  `luca_member_number` varchar(255) DEFAULT NULL,
  `luca_password` varchar(255) DEFAULT NULL,
  `export_only` tinyint(1) NOT NULL DEFAULT 0,
  `earchive` tinyint(1) NOT NULL DEFAULT 0,
  `einvoice_only` tinyint(1) NOT NULL DEFAULT 0,
  `ssi_only` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uuid_unique` (`uuid`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_luca_username_unique` (`luca_username`),
  KEY `users_company_id_foreign` (`company_id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'e4f5e3da-944c-4a79-8d5c-8dfccba21b8f','Admin','admin@localhost','081234567890',NULL,'admin',NULL,NULL,'$2y$12$iDpGxdjKFFwDxqB5KOnnoe0uqHjaaoHoSRFX5JcDbUjzdHEdOfr6S',NULL,0,0,NULL,NULL,NULL,0,0,0,0,NULL,'2024-08-13 12:07:44','2024-08-13 12:07:44'),(2,'9cee8054-6af8-4e44-8695-8e9373f43cf2','MI','musailliasu7@gmail.com','08149347975',NULL,'Illiase',NULL,NULL,'$2y$12$GpHhnSiQA5FgGWZyPViAYe0Zb99G2WHExc5F4Qlm9OceQD11.W0hq',NULL,0,0,NULL,NULL,NULL,0,0,0,0,NULL,'2024-08-13 13:34:40','2024-08-13 13:34:40'),(3,'c6c3e21d-bc06-487b-b886-bf325a41ac0b','User11','user11@email.com','11111111','11111111','user11',NULL,NULL,'$2y$12$TSr.yVut0c5g4oIcs5cO1O0MghV5kE3zxy/FS21ipd9rbcrxSDo.G',1,1,1,'Luca User11','Luca Member 11','$2y$12$NH/kEDhNdMKg42R5zgisdOSBDi9LPX00U5hS07CsyKEgU3Hk54XLq',1,0,0,1,NULL,'2024-08-14 04:48:20','2024-09-12 13:13:15'),(4,'81878b1e-3fc6-4a25-853c-38f5e162bc1d','Aminu Babayo','absheikhnet@gmail.com','09074748664',NULL,'absheikh',NULL,NULL,'$2y$12$dRLCGzzebgRXt2q1SrDOe.81kwlN1eV8lUl23plbuYLE0QSuTi1y.',NULL,0,0,NULL,NULL,NULL,0,0,0,0,NULL,'2024-08-16 20:17:32','2024-08-16 20:17:32'),(5,'8d0bbd0a-ce72-45dd-88fd-321bbd17e5cc','User22','user22@email.com','22222222','22222222','user22',NULL,NULL,'$2y$12$Z/LhR4Swk1aN7B6wkr7tC.s58apQXoFFfywbFxFsRg70xqkSVRWGy',1,1,1,'Luca User22','Luca Member 22','$2y$12$DV9QJaHyP6M0DgLLNZOGHeD4Kd7Jjfd1zbrfOKsjg.wGJcU1NoPGW',1,0,0,1,NULL,'2024-08-19 13:26:18','2024-08-19 13:26:18');
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

-- Dump completed on 2024-09-19  5:28:59
