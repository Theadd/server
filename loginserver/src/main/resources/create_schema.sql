SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `openbns` ;
CREATE SCHEMA IF NOT EXISTS `openbns` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `openbns` ;

-- -----------------------------------------------------
-- Table `openbns`.`accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openbns`.`accounts` ;

CREATE TABLE IF NOT EXISTS `openbns`.`accounts` (
  `uuid` VARCHAR(36) NOT NULL,
  `login` VARCHAR(16) NOT NULL,
  `password` BLOB(32) NOT NULL,
  `accessLevel` INT NOT NULL DEFAULT 0,
  `lastLogin` DATETIME NULL,
  `lastIp` VARCHAR(15) NULL,
  `lastServerId` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`uuid`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openbns`.`accounts_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openbns`.`accounts_log` ;

CREATE TABLE IF NOT EXISTS `openbns`.`accounts_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(16) NOT NULL,
  `msgId` SMALLINT NOT NULL,
  `time` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_login`
    FOREIGN KEY (`login`)
    REFERENCES `openbns`.`accounts` (`login`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `openbns`.`accounts_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `openbns`.`accounts_info` ;

CREATE TABLE IF NOT EXISTS `openbns`.`accounts_info` (
  `login` VARCHAR(16) NOT NULL,
  `birthday` DATETIME NULL,
  `question` VARCHAR(255) NULL,
  `answer` VARCHAR(255) NULL,
  PRIMARY KEY (`login`),
  CONSTRAINT `fk_login`
    FOREIGN KEY (`login`)
    REFERENCES `openbns`.`accounts` (`login`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
