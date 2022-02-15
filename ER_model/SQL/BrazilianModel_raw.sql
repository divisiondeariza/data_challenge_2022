-- MySQL Script generated by MySQL Workbench
-- Sun Feb 13 03:53:06 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema olist
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema olist
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `olist` DEFAULT CHARACTER SET utf8 ;
USE `olist` ;

-- -----------------------------------------------------
-- Table `olist`.`olist_geolocation_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_geolocation_dataset` (
  `geolocation_zip_code_prefix` VARCHAR(15) NOT NULL,
  `geolocation_lat` FLOAT NULL,
  `geolocation_lng` FLOAT NULL,
  `geolocation_city` VARCHAR(15) NULL,
  `geolocation_state` VARCHAR(5) NULL,
  PRIMARY KEY (`geolocation_zip_code_prefix`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olist`.`olist_customers_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_customers_dataset` (
  `customer_id` VARCHAR(60) NOT NULL,
  `customer_unique_id` VARCHAR(60) NOT NULL,
  `customer_zip_code_prefix` VARCHAR(15) NULL,
  `customer_city` VARCHAR(15) NULL,
  `customer_state` VARCHAR(5) NULL,
  PRIMARY KEY (`customer_id`, `customer_unique_id`),
  INDEX `geolocation_zip_code_prefix_idx` (`customer_zip_code_prefix` ASC) VISIBLE )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olist`.`olist_sellers_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_sellers_dataset` (
  `seller_id` VARCHAR(60) NOT NULL,
  `seller_zip_code_prefix` VARCHAR(15) NULL,
  `seller_city` VARCHAR(15) NULL,
  `seller_state` VARCHAR(5) NULL,
  PRIMARY KEY (`seller_id`),
  INDEX `seller_zip_code_prefix_idx` (`seller_zip_code_prefix` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olist`.`olist_products_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_products_dataset` (
  `product_id` VARCHAR(60) NOT NULL,
  `product_category_name` VARCHAR(45) NULL,
  `product_name_lenght` INT NULL,
  `product_description_lengh` VARCHAR(45) NULL,
  `product_photos_qty` VARCHAR(45) NULL,
  `olist_products_datasetcol` SMALLINT(4) NULL,
  `product_weight_g` FLOAT NULL,
  `product_lengtcm` FLOAT NULL,
  `product_height_cm` FLOAT NULL,
  `product_width_cm` FLOAT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olist`.`olist_order_items_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_order_items_dataset` (
  `order_id` VARCHAR(60) NOT NULL,
  `order_item_id` VARCHAR(60) NOT NULL,
  `product_id` VARCHAR(60) NULL,
  `seller_id` VARCHAR(60) NULL,
  `shipping_limit_date` DATE NULL,
  `price` FLOAT NULL,
  `freight_value` FLOAT NULL,
  PRIMARY KEY (`order_item_id`),
  INDEX `seller_id_idx` (`seller_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olist`.`olist_orders_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_orders_dataset` (
  `order_id` VARCHAR(60) NOT NULL,
  `customer_id` VARCHAR(60) NULL,
  `order_status` VARCHAR(15) NULL,
  `order_purchase_timestamp` DATETIME NULL,
  `order_approved_at` DATETIME NULL,
  `order_delivered_carrier_date` DATETIME NULL,
  `order_delivered_customer_date` DATETIME NULL,
  `order_estimated_delivery_date` DATETIME NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `olist`.`olist_order_reviews_dataset`
-- -----------------------------------------------------
olist_customers_datasetCREATE TABLE IF NOT EXISTS `olist`.`olist_order_reviews_dataset` (
  `review_id` VARCHAR(60) NOT NULL,
  `order_id` VARCHAR(60) NOT NULL,
  `review_score` SMALLINT(5) NULL,
  `review_comment_title` TEXT NULL,
  `review_comment_message` TEXT NULL,
  `review_creation_date` DATE NULL,
  `review_answer_timestamp` DATETIME NULL,
  PRIMARY KEY (`review_id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`olist_order_payments_dataset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `olist`.`olist_order_payments_dataset` (
  `order_id` VARCHAR(60) NOT NULL,
  `payment_sequential` SMALLINT(5) NULL,
  `payment_type` VARCHAR(15) NULL,
  `payment_installments` INT NULL,
  `payment_value` FLOAT NULL,
  PRIMARY KEY (`order_id`))
 ENGINE = InnoDB; 

CREATE TABLE IF NOT EXISTS `olist`.`olist_product_category_name_translation` (
  `product_category_name` VARCHAR(255) NULL,
  `product_category_name_english` VARCHAR(255) NULL)
 ENGINE = InnoDB; 


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
