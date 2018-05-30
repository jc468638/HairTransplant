-- dropping if already exists

DROP TABLE `h_transplant`.`userBooking`;
DROP TABLE `h_transplant`.`DoctorTimetable`;
DROP TABLE `h_transplant`.`user`;
DROP TABLE `h_transplant`.`Role`;
DROP TABLE `h_transplant`.`Package_has_Doctor`;
DROP TABLE `h_transplant`.`Package`;
DROP TABLE `h_transplant`.`SurgeryType`;
DROP TABLE `h_transplant`.`DoctorDaysAvailability`;
DROP TABLE `h_transplant`.`Doctor`;



-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema h_transplant
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema h_transplant
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `h_transplant` DEFAULT CHARACTER SET utf8 ;
USE `h_transplant` ;

-- -----------------------------------------------------
-- Table `h_transplant`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`Role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`User` (
  `userId` int(11) NOT NULL  AUTO_INCREMENT ,
  `userName` varchar(45) DEFAULT NULL,
  `userFirstName` varchar(45) DEFAULT NULL,
  `userLastName` varchar(45) DEFAULT NULL,
  `userPassword` varchar(45) DEFAULT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `fk_User_Role_idx` (`roleId`),
  CONSTRAINT `fk_User_Role` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`SurgeryType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`SurgeryType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeDescription` varchar(45) DEFAULT NULL,
  `typePriceDefault` varchar(45) DEFAULT NULL,
  `typePhotoPath` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`typeId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`Package`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`Package` (
  `packageId` int(11) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(45) NOT NULL,
  `packageDescription` varchar(500) DEFAULT NULL,
  `packagePrice` int(11) DEFAULT NULL,
  `packageStatus` varchar(2) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `fk_Package_SurgeryType1_idx` (`typeId`),
  CONSTRAINT `fk_Package_SurgeryType1` FOREIGN KEY (`typeId`) REFERENCES `surgerytype` (`typeId`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`Doctor` (
  `doctorId` int(11) NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(45) DEFAULT NULL,
  `doctorLastName` varchar(45) DEFAULT NULL,
  `doctorAvailability` tinyint(4) DEFAULT NULL,
  `doctorTimeBtwPacients` int(11) DEFAULT NULL,
  PRIMARY KEY (`doctorId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`Package_has_Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`Package_has_Doctor` (
  `packageId` int(11) NOT NULL ,
  `doctorId` int(11) NOT NULL,
  PRIMARY KEY (`packageId`,`doctorId`),
  KEY `fk_Package_has_Doctor_Doctor1_idx` (`doctorId`),
  KEY `fk_Package_has_Doctor_Package1_idx` (`packageId`),
  CONSTRAINT `fk_Package_has_Doctor_Doctor1` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Package_has_Doctor_Package1` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`userBooking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`userBooking` (
  `userBookingId` int(11) NOT NULL,
  `userBookingStatus` tinyint(4) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `bookingDate` datetime DEFAULT NULL,
  `packageId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  PRIMARY KEY (`userBookingId`,`userId`,`packageId`,`doctorId`),
  KEY `fk_userBooking_User1_idx` (`userId`),
  KEY `fk_userBooking_Package_has_Doctor1_idx` (`packageId`,`doctorId`),
  CONSTRAINT `fk_userBooking_Package_has_Doctor1` FOREIGN KEY (`packageId`, `doctorId`) REFERENCES `package_has_doctor` (`packageId`, `doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_userBooking_User1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`DoctorDaysAvailability`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`DoctorDaysAvailability` (
  `DoctorDaysAvailabilityId` int(11) NOT NULL,
  `Day` varchar(45) NOT NULL,
  `Available` tinyint(4) DEFAULT NULL,
  `doctorId` int(11) NOT NULL,
  PRIMARY KEY (`DoctorDaysAvailabilityId`,`doctorId`),
  UNIQUE KEY `Day_UNIQUE` (`Day`),
  KEY `fk_DoctorDaysAvailability_Doctor1_idx` (`doctorId`),
  CONSTRAINT `fk_DoctorDaysAvailability_Doctor1` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `h_transplant`.`DoctorTimetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `h_transplant`.`DoctorTimetable` (
  `TimetableId` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `doctorId` int(11) NOT NULL,
  `Booked` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`TimetableId`,`doctorId`),
  KEY `fk_DoctorTimetable_Doctor1_idx` (`doctorId`),
  CONSTRAINT `fk_DoctorTimetable_Doctor1` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
