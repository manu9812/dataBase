-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Movies_perfect
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Movies_perfect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Movies_perfect` DEFAULT CHARACTER SET utf8 ;
USE `Movies_perfect` ;

-- -----------------------------------------------------
-- Table `Movies_perfect`.`Languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Languages` (
  `language_id` INT NOT NULL,
  `language_name` VARCHAR(45) NOT NULL,
  `language_code` CHAR(2) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE INDEX `language_code_UNIQUE` (`language_code` ASC) ,
  UNIQUE INDEX `language_name_UNIQUE` (`language_name` ASC) ,
  UNIQUE INDEX `language_id_UNIQUE` (`language_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Countries` (
  `country_id` CHAR(2) NOT NULL,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_id_UNIQUE` (`country_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Directors` (
  `director_id` INT NOT NULL AUTO_INCREMENT,
  `director_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`director_id`),
  UNIQUE INDEX `director_id_UNIQUE` (`director_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `length_in_min` INT NOT NULL,
  `language_id` INT NOT NULL,
  `country_id` CHAR(2) NOT NULL,
  `director_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `title`),
  UNIQUE INDEX `movie_id_UNIQUE` (`movie_id` ASC) ,
  INDEX `fk_language_id_idx` (`language_id` ASC) ,
  INDEX `fk_country_id_idx` (`country_id` ASC) ,
  INDEX `fk_director_id_idx` (`director_id` ASC),
  CONSTRAINT `fk_language_id`
    FOREIGN KEY (`language_id`)
    REFERENCES `Movies_perfect`.`Languages` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `Movies_perfect`.`Countries` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_director_id`
    FOREIGN KEY (`director_id`)
    REFERENCES `Movies_perfect`.`Directors` (`director_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Genres` (
  `genre_id` INT NOT NULL,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE INDEX `genre_id_UNIQUE` (`genre_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `user_birth` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Participants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Participants` (
  `participant_id` INT NOT NULL,
  `participant_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`participant_id`),
  UNIQUE INDEX `participant_id_UNIQUE` (`participant_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Genres_movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Genres_movies` (
  `movie_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_id`),
  INDEX `fk_genres_id_idx` (`genre_id` ASC) ,
  CONSTRAINT `fk_movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Movies_perfect`.`Movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genres_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `Movies_perfect`.`Genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Ratings` (
  `movie_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `score` INT(2) NOT NULL,
  `critic` VARCHAR(45) NULL,
  PRIMARY KEY (`movie_id`, `user_id`),
  INDEX `fk_user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_movie_id1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Movies_perfect`.`Movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `Movies_perfect`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies_perfect`.`Cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies_perfect`.`Cast` (
  `movie_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`movie_id`, `participant_id`),
  INDEX `fk_participant_id_idx` (`participant_id` ASC),
  CONSTRAINT `fk_movie_id2`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Movies_perfect`.`Movies` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_participant_id`
    FOREIGN KEY (`participant_id`)
    REFERENCES `Movies_perfect`.`Participants` (`participant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
