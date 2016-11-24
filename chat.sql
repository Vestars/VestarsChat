-- MySQL Script generated by MySQL Workbench
-- 11/14/16 02:16:48
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema chat
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema chat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `chat` DEFAULT CHARACTER SET utf8 ;
USE `chat` ;

-- -----------------------------------------------------
-- Table `chat`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chat`.`user` ;

CREATE TABLE IF NOT EXISTS `chat`.`user` (
  `username` VARCHAR(32) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `friend_count` INT NOT NULL DEFAULT 0,
  `role` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chat`.`friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chat`.`friend` ;

CREATE TABLE IF NOT EXISTS `chat`.`friend` (
  `friend_one` VARCHAR(32) NOT NULL,
  `friend_two` VARCHAR(32) NOT NULL,
  `status` ENUM('DECLINE', 'REQUEST', 'ACCEPT') NOT NULL,
  PRIMARY KEY (`friend_one`, `friend_two`),
  INDEX `fk_friend_user2_idx` (`friend_two` ASC),
  CONSTRAINT `fk_friend_user1`
    FOREIGN KEY (`friend_one`)
    REFERENCES `chat`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_user2`
    FOREIGN KEY (`friend_two`)
    REFERENCES `chat`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chat`.`chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chat`.`chat` ;

CREATE TABLE IF NOT EXISTS `chat`.`chat` (
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(4) NOT NULL,
  `creator` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`name`, `creator`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_chat_user1_idx` (`creator` ASC),
  CONSTRAINT `fk_chat_user1`
    FOREIGN KEY (`creator`)
    REFERENCES `chat`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chat`.`chat_members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chat`.`chat_members` ;

CREATE TABLE IF NOT EXISTS `chat`.`chat_members` (
  `user_username` VARCHAR(32) NOT NULL,
  `chat_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_username`, `chat_name`),
  INDEX `fk_user_has_chat_chat1_idx` (`chat_name` ASC),
  INDEX `fk_user_has_chat_user1_idx` (`user_username` ASC),
  CONSTRAINT `fk_user_has_chat_user1`
    FOREIGN KEY (`user_username`)
    REFERENCES `chat`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_chat_chat1`
    FOREIGN KEY (`chat_name`)
    REFERENCES `chat`.`chat` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `chat`.`history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chat`.`history` ;

CREATE TABLE IF NOT EXISTS `chat`.`history` (
  `chat_name` VARCHAR(255) NOT NULL,
  `user_username` VARCHAR(32) NOT NULL,
  `text` VARCHAR(255) NOT NULL,
  `date` TIMESTAMP(6) NOT NULL,
  PRIMARY KEY (`chat_name`, `user_username`),
  INDEX `fk_chat_has_user_user1_idx` (`user_username` ASC),
  INDEX `fk_chat_has_user_chat1_idx` (`chat_name` ASC),
  CONSTRAINT `fk_chat_has_user_chat1`
    FOREIGN KEY (`chat_name`)
    REFERENCES `chat`.`chat` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_chat_has_user_user1`
    FOREIGN KEY (`user_username`)
    REFERENCES `chat`.`user` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
