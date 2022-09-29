-- MySQL Script generated by MySQL Workbench
-- Wed Dec  8 16:38:47 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `mystore` ;

-- -----------------------------------------------------
-- Table `mystore`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`employee` (
  `employee_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  INDEX `idx_actor_last_name` (`last_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 201
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`country` (
  `country_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(50) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 110
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`city` (
  `city_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NOT NULL,
  `country_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`),
  INDEX `idx_fk_country_id` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_city_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `mystore`.`country` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 601
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`address` (
  `address_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(20) NOT NULL,
  `city_id` SMALLINT UNSIGNED NOT NULL,
  `postal_code` VARCHAR(10) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  INDEX `idx_fk_city_id` (`city_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_city`
    FOREIGN KEY (`city_id`)
    REFERENCES `mystore`.`city` (`city_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 606
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`department` (
  `department_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`store` (
  `store_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  INDEX `idx_fk_address_id` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `mystore`.`address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`customer` (
  `customer_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` TINYINT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT '1',
  `create_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  INDEX `idx_fk_store_id` (`store_id` ASC) VISIBLE,
  INDEX `idx_fk_address_id` (`address_id` ASC) VISIBLE,
  INDEX `idx_last_name` (`last_name` ASC) VISIBLE,
  CONSTRAINT `fk_customer_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `mystore`.`address` (`address_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `mystore`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 600
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`language` (
  `language_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` CHAR(20) NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`product` (
  `product_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` VARCHAR(128) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `expiration` YEAR NULL DEFAULT NULL,
  `language_id` TINYINT UNSIGNED NOT NULL,
  `original_language_id` TINYINT UNSIGNED NULL DEFAULT NULL,
  `length` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `replacement_cost` DECIMAL(5,2) NOT NULL DEFAULT '19.99',
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  INDEX `idx_title` (`product` ASC) VISIBLE,
  INDEX `idx_fk_language_id` (`language_id` ASC) VISIBLE,
  INDEX `idx_fk_original_language_id` (`original_language_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_language`
    FOREIGN KEY (`language_id`)
    REFERENCES `mystore`.`language` (`language_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_language_original`
    FOREIGN KEY (`original_language_id`)
    REFERENCES `mystore`.`language` (`language_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`employee_department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`employee_department` (
  `employee_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `department_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`, `department_id`),
  INDEX `fk_employee_department_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_actor_actor`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mystore`.`employee` (`employee_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_department_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `mystore`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`product_department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`product_department` (
  `department_id` TINYINT UNSIGNED NOT NULL,
  `product_id` SMALLINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`department_id`, `product_id`),
  INDEX `fk_product_category_category` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category_category`
    FOREIGN KEY (`department_id`)
    REFERENCES `mystore`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_category_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `mystore`.`product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`inventory` (
  `inventory_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` SMALLINT UNSIGNED NOT NULL,
  `store_id` TINYINT UNSIGNED NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  INDEX `idx_fk_product_id` (`product_id` ASC) VISIBLE,
  INDEX `idx_store_id_product_id` (`store_id` ASC, `product_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `mystore`.`product` (`product_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_store`
    FOREIGN KEY (`store_id`)
    REFERENCES `mystore`.`store` (`store_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4582
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mystore`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mystore`.`payment` (
  `payment_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` SMALLINT UNSIGNED NOT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `last_update` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  INDEX `idx_fk_customer_id` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `mystore`.`customer` (`customer_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16050
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
