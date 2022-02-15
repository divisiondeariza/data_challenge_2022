-- MySQL dump 10.13  Distrib 8.0.28, for macos10.15 (x86_64)
--
-- Host: localhost    Database: olist
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `olist_customers_dataset`
--

DROP TABLE IF EXISTS `olist_customers_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_customers_dataset` (
  `customer_id` varchar(60) NOT NULL,
  `customer_unique_id` varchar(60) NOT NULL,
  `customer_zip_code_prefix` varchar(15) DEFAULT NULL,
  `customer_city` varchar(15) DEFAULT NULL,
  `customer_state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`customer_unique_id`),
  KEY `geolocation_zip_code_prefix_idx` (`customer_zip_code_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_geolocation_dataset`
--

DROP TABLE IF EXISTS `olist_geolocation_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_geolocation_dataset` (
  `geolocation_zip_code_prefix` varchar(15) NOT NULL,
  `geolocation_lat` float DEFAULT NULL,
  `geolocation_lng` float DEFAULT NULL,
  `geolocation_city` varchar(15) DEFAULT NULL,
  `geolocation_state` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_order_items_dataset`
--

DROP TABLE IF EXISTS `olist_order_items_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_order_items_dataset` (
  `order_id` varchar(255) DEFAULT NULL,
  `order_item_id` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `seller_id` varchar(255) DEFAULT NULL,
  `shipping_limit_date` date DEFAULT NULL,
  `price` float DEFAULT NULL,
  `freight_value` float DEFAULT NULL,
  KEY `seller_id_idx` (`seller_id`),
  KEY `product_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_order_payments_dataset`
--

DROP TABLE IF EXISTS `olist_order_payments_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_order_payments_dataset` (
  `order_id` varchar(60) NOT NULL,
  `payment_sequential` smallint DEFAULT NULL,
  `payment_type` varchar(15) DEFAULT NULL,
  `payment_installments` int DEFAULT NULL,
  `payment_value` float DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_order_reviews_dataset`
--

DROP TABLE IF EXISTS `olist_order_reviews_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_order_reviews_dataset` (
  `review_id` varchar(60) NOT NULL,
  `order_id` varchar(60) NOT NULL,
  `review_score` smallint DEFAULT NULL,
  `review_comment_title` text,
  `review_comment_message` text,
  `review_creation_date` date DEFAULT NULL,
  `review_answer_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `order_id_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_orders_dataset`
--

DROP TABLE IF EXISTS `olist_orders_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_orders_dataset` (
  `order_id` varchar(60) NOT NULL,
  `customer_id` varchar(60) DEFAULT NULL,
  `order_status` varchar(15) DEFAULT NULL,
  `order_purchase_timestamp` datetime DEFAULT NULL,
  `order_approved_at` datetime DEFAULT NULL,
  `order_delivered_carrier_date` datetime DEFAULT NULL,
  `order_delivered_customer_date` datetime DEFAULT NULL,
  `order_estimated_delivery_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id_idx` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_product_category_name_translation`
--

DROP TABLE IF EXISTS `olist_product_category_name_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_product_category_name_translation` (
  `product_category_name` varchar(255) DEFAULT NULL,
  `product_category_name_english` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_products_dataset`
--

DROP TABLE IF EXISTS `olist_products_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_products_dataset` (
  `product_id` varchar(60) NOT NULL,
  `product_category_name` varchar(45) DEFAULT NULL,
  `product_name_lenght` int DEFAULT NULL,
  `product_description_lengh` varchar(45) DEFAULT NULL,
  `product_photos_qty` varchar(45) DEFAULT NULL,
  `olist_products_datasetcol` smallint DEFAULT NULL,
  `product_weight_g` float DEFAULT NULL,
  `product_lengtcm` float DEFAULT NULL,
  `product_height_cm` float DEFAULT NULL,
  `product_width_cm` float DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `olist_sellers_dataset`
--

DROP TABLE IF EXISTS `olist_sellers_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olist_sellers_dataset` (
  `seller_id` varchar(60) NOT NULL,
  `seller_zip_code_prefix` varchar(15) DEFAULT NULL,
  `seller_city` varchar(15) DEFAULT NULL,
  `seller_state` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  KEY `seller_zip_code_prefix_idx` (`seller_zip_code_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 15:54:44
