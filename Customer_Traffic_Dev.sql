-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Customer_Traffic_Device
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Customer_Traffic_Device
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Customer_Traffic_Device` DEFAULT CHARACTER SET utf8 ;
USE `Customer_Traffic_Device` ;

-- -----------------------------------------------------
-- Table `Customer_Traffic_Device`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer_Traffic_Device`.`Customer` (
  `Cust_ID` INT NOT NULL AUTO_INCREMENT,
  `Cust_NAME` VARCHAR(45) NOT NULL,
  `AGE` INT NOT NULL,
  PRIMARY KEY (`Cust_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Traffic_Device`.`CustomerDevice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer_Traffic_Device`.`CustomerDevice` (
  `Device_ID` INT NOT NULL,
  `Device_Model` VARCHAR(45) NOT NULL,
  `Cust_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Device_ID`),
  CONSTRAINT `Cust_ID`
    FOREIGN KEY ()
    REFERENCES `Customer_Traffic_Device`.`Customer` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Traffic_Device`.`CustomerLocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer_Traffic_Device`.`CustomerLocation` (
  `Cust_Current_Location_ID` INT NOT NULL,
  `ADDRESSLINE1` VARCHAR(45) NOT NULL,
  `ADDRESSLINE2` VARCHAR(45) NOT NULL,
  `CITY` VARCHAR(45) NOT NULL,
  `STATE` VARCHAR(45) NOT NULL,
  `POSTALCODE` VARCHAR(45) NOT NULL,
  `COUNTRY` VARCHAR(45) NOT NULL,
  `Device_ID` INT NOT NULL,
  PRIMARY KEY (`Cust_Current_Location_ID`),
  CONSTRAINT `Device_ID`
    FOREIGN KEY ()
    REFERENCES `Customer_Traffic_Device`.`CustomerDevice` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Traffic_Device`.`Customer_Shop_Proximity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer_Traffic_Device`.`Customer_Shop_Proximity` (
  `Shop_Location_ID` INT NOT NULL,
  `Cust_At_Shop` VARCHAR(4) NOT NULL,
  `Cust_Current_Location_ID` INT NOT NULL,
  PRIMARY KEY (`Shop_Location_ID`),
  CONSTRAINT `Cust_Current_Location_ID`
    FOREIGN KEY ()
    REFERENCES `Customer_Traffic_Device`.`CustomerLocation` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer_Traffic_Device`.`Customer_Shop_Traffic_Counter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer_Traffic_Device`.`Customer_Shop_Traffic_Counter` (
  `Counter_ID` INT NOT NULL,
  `Time_Spent_At_Shop` INT NOT NULL,
  `Takeaway_Or_DineIn` VARCHAR(4) NOT NULL,
  `Counter_Time_Stamp` VARCHAR(45) NOT NULL,
  `Shop_Location_ID` INT NOT NULL,
  PRIMARY KEY (`Counter_ID`),
  CONSTRAINT `Shop_Location_ID`
    FOREIGN KEY ()
    REFERENCES `Customer_Traffic_Device`.`Customer_Shop_Proximity` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
