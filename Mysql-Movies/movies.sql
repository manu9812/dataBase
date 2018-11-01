SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`languages` (
  `languages_id` INT NOT NULL,
  `language_name` VARCHAR(45) NOT NULL,
  `language_code` CHAR(2) NULL,
  PRIMARY KEY (`languages_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Directors` (
  `director_id` INT NOT NULL,
  `director_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`director_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genders` (
  `gender_id` INT NOT NULL,
  `gender_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Countries` (
  `country_id` CHAR(2) NOT NULL,
  `Country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Movies` (
  `movies_id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `lenght_in_minuts` INT NOT NULL,
  `country_id` CHAR(2) NOT NULL,
  `director_id` INT NOT NULL,
  PRIMARY KEY (`movies_id`),
  INDEX `director_id_idx` (`director_id` ASC) VISIBLE,
  INDEX `country_id_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `director_id`
    FOREIGN KEY (`director_id`)
    REFERENCES `mydb`.`Directors` (`director_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `mydb`.`Countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genders_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genders_movies` (
  `movie_id` INT NOT NULL,
  `gender_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `gender_id`),
  INDEX `gender_id_idx` (`gender_id` ASC) VISIBLE,
  CONSTRAINT `gender_id`
    FOREIGN KEY (`gender_id`)
    REFERENCES `mydb`.`genders` (`gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `mydb`.`Movies` (`movies_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles` (
  `roles_id` INT NOT NULL,
  `role_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roles_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles_movies` (
  `roles_id` INT NOT NULL,
  `movies_id` INT NOT NULL,
  PRIMARY KEY (`movies_id`, `roles_id`),
  INDEX `roles_id_idx` (`roles_id` ASC) VISIBLE,
  CONSTRAINT `roles_id`
    FOREIGN KEY (`roles_id`)
    REFERENCES `mydb`.`Roles` (`roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movies_id`
    FOREIGN KEY (`movies_id`)
    REFERENCES `mydb`.`Movies` (`movies_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Participants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Participants` (
  `participants_id` INT NOT NULL,
  `participants_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`participants_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Roles_participants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Roles_participants` (
  `role_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  INDEX `role_id_idx` (`role_id` ASC) VISIBLE,
  PRIMARY KEY (`role_id`, `participant_id`),
  INDEX `participant_id_idx` (`participant_id` ASC) VISIBLE,
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`Roles` (`roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `participant_id`
    FOREIGN KEY (`participant_id`)
    REFERENCES `mydb`.`Participants` (`participants_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `user_id` INT NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ratings` (
  `movie_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `score` VARCHAR(45) NOT NULL,
  `ratingscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`movie_id`, `user_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `mydb`.`Movies` (`movies_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`languages_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`languages_movies` (
  `languages_id` INT NOT NULL,
  `movies_id` INT NOT NULL,
  INDEX `languages_id_idx` (`languages_id` ASC) VISIBLE,
  PRIMARY KEY (`languages_id`, `movies_id`),
  CONSTRAINT `languages_id`
    FOREIGN KEY (`languages_id`)
    REFERENCES `mydb`.`languages` (`languages_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movies_id`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Movies` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
