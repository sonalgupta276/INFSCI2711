-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema globalterror_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema globalterror_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `globalterror_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `globalterror_db` ;

-- -----------------------------------------------------
-- Table `globalterror_db`.`alternative`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`alternative` (
  `alternative_id` INT NOT NULL AUTO_INCREMENT,
  `alternative_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`alternative_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`attacktype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`attacktype` (
  `attacktype_id` INT NOT NULL AUTO_INCREMENT,
  `attacktype_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`attacktype_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`claimmode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`claimmode` (
  `claimmode_id` INT NOT NULL AUTO_INCREMENT,
  `claimmode_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`claimmode_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`region` (
  `region_id` INT NOT NULL AUTO_INCREMENT,
  `region_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`countries` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_txt` TEXT NULL DEFAULT NULL,
  `region_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  INDEX `region_FK_idx` (`region_id` ASC) VISIBLE,
  CONSTRAINT `region_FK`
    FOREIGN KEY (`region_id`)
    REFERENCES `globalterror_db`.`region` (`region_id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 1006
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`hostageoutcome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`hostageoutcome` (
  `hostkidoutcome_id` INT NOT NULL AUTO_INCREMENT,
  `hostkidoutcome_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`hostkidoutcome_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`property` (
  `propextent_id` INT NOT NULL,
  `propextent_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`propextent_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`target_subtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`target_subtype` (
  `targsubtype_id` INT NOT NULL AUTO_INCREMENT,
  `targsubtype_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`targsubtype_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 227
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`targettype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`targettype` (
  `targettype_id` INT NOT NULL AUTO_INCREMENT,
  `targettype_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`targettype_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`weapon_subtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`weapon_subtype` (
  `weapsubtype_id` INT NOT NULL AUTO_INCREMENT,
  `weapsubtype_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`weapsubtype_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 63
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`weapontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`weapontype` (
  `weaptype_id` INT NOT NULL AUTO_INCREMENT,
  `weaptype_txt` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`weaptype_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `globalterror_db`.`terror_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`terror_events` (
  `eventid` BIGINT NOT NULL,
  `iyear` INT NULL DEFAULT NULL,
  `imonth` INT NULL DEFAULT NULL,
  `iday` INT NULL DEFAULT NULL,
  `resolution` TEXT NULL DEFAULT NULL,
  `country` INT NULL DEFAULT NULL,
  `provstate` TEXT NULL DEFAULT NULL,
  `city` TEXT NULL DEFAULT NULL,
  `latitude` DOUBLE NULL DEFAULT NULL,
  `longitude` DOUBLE NULL DEFAULT NULL,
  `specificity` INT NULL DEFAULT NULL,
  `vicinity` INT NULL DEFAULT NULL,
  `crit1` INT NULL DEFAULT NULL,
  `crit2` INT NULL DEFAULT NULL,
  `crit3` INT NULL DEFAULT NULL,
  `doubtterr` INT NULL DEFAULT NULL,
  `alternative` INT NULL DEFAULT NULL,
  `multiple` INT NULL DEFAULT NULL,
  `success` INT NULL DEFAULT NULL,
  `suicide` INT NULL DEFAULT NULL,
  `attacktype1` INT NULL DEFAULT NULL,
  `attacktype2` INT NULL DEFAULT NULL,
  `attacktype3` INT NULL DEFAULT NULL,
  `targtype1` INT NULL DEFAULT NULL,
  `targsubtype1` INT NULL DEFAULT NULL,
  `natlty1` INT NULL DEFAULT NULL,
  `targtype2` INT NULL DEFAULT NULL,
  `targsubtype2` INT NULL DEFAULT NULL,
  `natlty2` INT NULL DEFAULT NULL,
  `targtype3` INT NULL DEFAULT NULL,
  `targsubtype3` INT NULL DEFAULT NULL,
  `natlty3` INT NULL DEFAULT NULL,
  `gname` TEXT NULL DEFAULT NULL,
  `gsubname` TEXT NULL DEFAULT NULL,
  `gname2` TEXT NULL DEFAULT NULL,
  `gsubname2` TEXT NULL DEFAULT NULL,
  `gname3` TEXT NULL DEFAULT NULL,
  `gsubname3` TEXT NULL DEFAULT NULL,
  `guncertain1` INT NULL DEFAULT NULL,
  `guncertain2` TEXT NULL DEFAULT NULL,
  `guncertain3` TEXT NULL DEFAULT NULL,
  `individual` INT NULL DEFAULT NULL,
  `nperps` TEXT NULL DEFAULT NULL,
  `nperpcap` TEXT NULL DEFAULT NULL,
  `claimed` TEXT NULL DEFAULT NULL,
  `claimmode` INT NULL DEFAULT NULL,
  `claimmode2` INT NULL DEFAULT NULL,
  `claimmode3` INT NULL DEFAULT NULL,
  `compclaim` TEXT NULL DEFAULT NULL,
  `weaptype1` INT NULL DEFAULT NULL,
  `weapsubtype1` INT NULL DEFAULT NULL,
  `weaptype2` INT NULL DEFAULT NULL,
  `weapsubtype2` INT NULL DEFAULT NULL,
  `weaptype3` INT NULL DEFAULT NULL,
  `weapsubtype3` INT NULL DEFAULT NULL,
  `weaptype4` INT NULL DEFAULT NULL,
  `weapsubtype4` INT NULL DEFAULT NULL,
  `nkill` TEXT NULL DEFAULT NULL,
  `nkillus` TEXT NULL DEFAULT NULL,
  `nkillter` TEXT NULL DEFAULT NULL,
  `nwound` TEXT NULL DEFAULT NULL,
  `nwoundus` TEXT NULL DEFAULT NULL,
  `nwoundte` TEXT NULL DEFAULT NULL,
  `property` INT NULL DEFAULT NULL,
  `propextent` INT NULL DEFAULT NULL,
  `ishostkid` INT NULL DEFAULT NULL,
  `nhostkid` TEXT NULL DEFAULT NULL,
  `nhostkidus` TEXT NULL DEFAULT NULL,
  `nhours` TEXT NULL DEFAULT NULL,
  `ndays` TEXT NULL DEFAULT NULL,
  `divert` TEXT NULL DEFAULT NULL,
  `kidhijcountry` TEXT NULL DEFAULT NULL,
  `ransom` INT NULL DEFAULT NULL,
  `ransomamt` TEXT NULL DEFAULT NULL,
  `ransomamtus` TEXT NULL DEFAULT NULL,
  `ransompaid` TEXT NULL DEFAULT NULL,
  `ransompaidus` TEXT NULL DEFAULT NULL,
  `hostkidoutcome` INT NULL DEFAULT NULL,
  `nreleased` TEXT NULL DEFAULT NULL,
  `dbsource` TEXT NULL DEFAULT NULL,
  `related` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`eventid`),
  INDEX `country_FK_idx` (`country` ASC) VISIBLE,
  INDEX `alternative_FK_idx` (`alternative` ASC) VISIBLE,
  INDEX `claimmode_FK_idx` (`claimmode` ASC) VISIBLE,
  INDEX `claimmode2_FK_idx` (`claimmode2` ASC) VISIBLE,
  INDEX `claimmode3_FK_idx` (`claimmode3` ASC) VISIBLE,
  INDEX `targettype_FK_idx` (`targtype1` ASC) VISIBLE,
  INDEX `targettype2_FK_idx` (`targtype2` ASC) VISIBLE,
  INDEX `targettype3_FK_idx` (`targtype3` ASC) VISIBLE,
  INDEX `targetsubtype1_FK_idx` (`targsubtype1` ASC) VISIBLE,
  INDEX `targetsubtype2_FK_idx` (`targsubtype2` ASC) VISIBLE,
  INDEX `targetsubtype3_FK_idx` (`targsubtype3` ASC) VISIBLE,
  INDEX `nationality1_FK_idx` (`natlty1` ASC) VISIBLE,
  INDEX `weapontype_FK_idx` (`weaptype1` ASC) VISIBLE,
  INDEX `weapontype2_FK_idx` (`weaptype2` ASC) VISIBLE,
  INDEX `weapontype3_FK_idx` (`weaptype3` ASC) VISIBLE,
  INDEX `weapontype4_FK_idx` (`weaptype4` ASC) VISIBLE,
  INDEX `weaponsubtype1_FK_idx` (`weapsubtype1` ASC) VISIBLE,
  INDEX `weaponsubtype2_FK_idx` (`weapsubtype2` ASC) VISIBLE,
  INDEX `nationality2_FK_idx` (`natlty2` ASC) VISIBLE,
  INDEX `nationality3_FK_idx` (`natlty3` ASC) VISIBLE,
  INDEX `weaponsubtype3_FK_idx` (`weapsubtype3` ASC) VISIBLE,
  INDEX `weaponsubtype4_FK_idx` (`weapsubtype4` ASC) VISIBLE,
  INDEX `propextent_FK_idx` (`propextent` ASC) VISIBLE,
  INDEX `attacktype_FK_idx` (`attacktype1` ASC) VISIBLE,
  INDEX `attacktype2_FK_idx` (`attacktype2` ASC) VISIBLE,
  INDEX `attacktype3_FK_idx` (`attacktype3` ASC) VISIBLE,
  INDEX `hostageoutcome_FK_idx` (`hostkidoutcome` ASC) VISIBLE,
  CONSTRAINT `alternative_FK`
    FOREIGN KEY (`alternative`)
    REFERENCES `globalterror_db`.`alternative` (`alternative_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `attacktype2_FK`
    FOREIGN KEY (`attacktype2`)
    REFERENCES `globalterror_db`.`attacktype` (`attacktype_id`)
    ON UPDATE RESTRICT,
  CONSTRAINT `attacktype3_FK`
    FOREIGN KEY (`attacktype3`)
    REFERENCES `globalterror_db`.`attacktype` (`attacktype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `attacktype_FK`
    FOREIGN KEY (`attacktype1`)
    REFERENCES `globalterror_db`.`attacktype` (`attacktype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `claimmode2_FK`
    FOREIGN KEY (`claimmode2`)
    REFERENCES `globalterror_db`.`claimmode` (`claimmode_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `claimmode3_FK`
    FOREIGN KEY (`claimmode3`)
    REFERENCES `globalterror_db`.`claimmode` (`claimmode_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `claimmode_FK`
    FOREIGN KEY (`claimmode`)
    REFERENCES `globalterror_db`.`claimmode` (`claimmode_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `country_FK`
    FOREIGN KEY (`country`)
    REFERENCES `globalterror_db`.`countries` (`country_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `hostageoutcome_FK`
    FOREIGN KEY (`hostkidoutcome`)
    REFERENCES `globalterror_db`.`hostageoutcome` (`hostkidoutcome_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `nationality1_FK`
    FOREIGN KEY (`natlty1`)
    REFERENCES `globalterror_db`.`countries` (`country_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `nationality2_FK`
    FOREIGN KEY (`natlty2`)
    REFERENCES `globalterror_db`.`countries` (`country_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `nationality3_FK`
    FOREIGN KEY (`natlty3`)
    REFERENCES `globalterror_db`.`countries` (`country_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `propextent_FK`
    FOREIGN KEY (`propextent`)
    REFERENCES `globalterror_db`.`property` (`propextent_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `targettype2_FK`
    FOREIGN KEY (`targtype2`)
    REFERENCES `globalterror_db`.`targettype` (`targettype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `targettype3_FK`
    FOREIGN KEY (`targtype3`)
    REFERENCES `globalterror_db`.`targettype` (`targettype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `targettype_FK`
    FOREIGN KEY (`targtype1`)
    REFERENCES `globalterror_db`.`targettype` (`targettype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `targsubtype1_FK`
    FOREIGN KEY (`targsubtype1`)
    REFERENCES `globalterror_db`.`target_subtype` (`targsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `targsubtype2_FK`
    FOREIGN KEY (`targsubtype2`)
    REFERENCES `globalterror_db`.`target_subtype` (`targsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `targsubtype3_FK`
    FOREIGN KEY (`targsubtype3`)
    REFERENCES `globalterror_db`.`target_subtype` (`targsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weaponsubtype1_FK`
    FOREIGN KEY (`weapsubtype1`)
    REFERENCES `globalterror_db`.`weapon_subtype` (`weapsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weaponsubtype2_FK`
    FOREIGN KEY (`weapsubtype2`)
    REFERENCES `globalterror_db`.`weapon_subtype` (`weapsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weaponsubtype3_FK`
    FOREIGN KEY (`weapsubtype3`)
    REFERENCES `globalterror_db`.`weapon_subtype` (`weapsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weaponsubtype4_FK`
    FOREIGN KEY (`weapsubtype4`)
    REFERENCES `globalterror_db`.`weapon_subtype` (`weapsubtype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weapontype2_FK`
    FOREIGN KEY (`weaptype2`)
    REFERENCES `globalterror_db`.`weapontype` (`weaptype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weapontype3_FK`
    FOREIGN KEY (`weaptype3`)
    REFERENCES `globalterror_db`.`weapontype` (`weaptype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weapontype4_FK`
    FOREIGN KEY (`weaptype4`)
    REFERENCES `globalterror_db`.`weapontype` (`weaptype_id`)
    ON DELETE RESTRICT,
  CONSTRAINT `weapontype_FK`
    FOREIGN KEY (`weaptype1`)
    REFERENCES `globalterror_db`.`weapontype` (`weaptype_id`)
    ON DELETE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `globalterror_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `globalterror_db`.`facttableprototype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `globalterror_db`.`facttableprototype` (`iyear` INT, `imonth` INT, `numEvents` INT, `country` INT, `attacktype1` INT, `targtype1` INT, `natlty1` INT, `weaptype1` INT, `weapsubtype1` INT, `propextent` INT, `totalKilled` INT, `totalWounded` INT, `totalRansom` INT, `totalHostageOrKidnap` INT, `totalReleased` INT);

-- -----------------------------------------------------
-- View `globalterror_db`.`facttableprototype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `globalterror_db`.`facttableprototype`;
USE `globalterror_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `globalterror_db`.`facttableprototype` AS select `globalterror_db`.`terror_events`.`iyear` AS `iyear`,`globalterror_db`.`terror_events`.`imonth` AS `imonth`,count(`globalterror_db`.`terror_events`.`eventid`) AS `numEvents`,`globalterror_db`.`terror_events`.`country` AS `country`,`globalterror_db`.`terror_events`.`attacktype1` AS `attacktype1`,`globalterror_db`.`terror_events`.`targtype1` AS `targtype1`,`globalterror_db`.`terror_events`.`natlty1` AS `natlty1`,`globalterror_db`.`terror_events`.`weaptype1` AS `weaptype1`,`globalterror_db`.`terror_events`.`weapsubtype1` AS `weapsubtype1`,`globalterror_db`.`terror_events`.`propextent` AS `propextent`,sum(`globalterror_db`.`terror_events`.`nkill`) AS `totalKilled`,sum(`globalterror_db`.`terror_events`.`nwound`) AS `totalWounded`,sum(`globalterror_db`.`terror_events`.`ransomamt`) AS `totalRansom`,sum(`globalterror_db`.`terror_events`.`nhostkid`) AS `totalHostageOrKidnap`,sum(`globalterror_db`.`terror_events`.`nreleased`) AS `totalReleased` from `globalterror_db`.`terror_events` group by `globalterror_db`.`terror_events`.`iyear`,`globalterror_db`.`terror_events`.`imonth`,`globalterror_db`.`terror_events`.`country`,`globalterror_db`.`terror_events`.`attacktype1`,`globalterror_db`.`terror_events`.`targtype1`,`globalterror_db`.`terror_events`.`natlty1`,`globalterror_db`.`terror_events`.`weaptype1`,`globalterror_db`.`terror_events`.`weapsubtype1`,`globalterror_db`.`terror_events`.`propextent`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
