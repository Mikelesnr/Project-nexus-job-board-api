-- MySQL Script generated by MySQL Workbench
-- Sun Mar  9 19:59:59 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema job_board_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema job_board_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `job_board_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `job_board_db` ;

-- -----------------------------------------------------
-- Table `job_board_db`.`auth_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`django_content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`auth_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `job_board_db`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`auth_group_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`auth_group_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `job_board_db`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `job_board_db`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`auth_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`auth_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(128) NOT NULL,
  `last_login` DATETIME(6) NULL DEFAULT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `username` VARCHAR(150) NOT NULL,
  `first_name` VARCHAR(150) NOT NULL,
  `last_name` VARCHAR(150) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`auth_user_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`auth_user_groups` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `job_board_db`.`auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `job_board_db`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`auth_user_user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`auth_user_user_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `job_board_db`.`auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `job_board_db`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`django_admin_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `job_board_db`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `job_board_db`.`auth_user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`django_migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`django_migrations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`django_session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`jobs_jobcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`jobs_jobcategory` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`jobs_jobpost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`jobs_jobpost` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `company_name` VARCHAR(255) NOT NULL,
  `posted_at` DATETIME(6) NOT NULL,
  `category_id` BIGINT NOT NULL,
  `created_by_id` INT NOT NULL,
  `experience_level` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `jobs_jobpost_category_id_594fee87_fk_jobs_jobcategory_id` (`category_id` ASC) VISIBLE,
  INDEX `jobs_jobpost_created_by_id_f6370b2a_fk_auth_user_id` (`created_by_id` ASC) VISIBLE,
  CONSTRAINT `jobs_jobpost_category_id_594fee87_fk_jobs_jobcategory_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `job_board_db`.`jobs_jobcategory` (`id`),
  CONSTRAINT `jobs_jobpost_created_by_id_f6370b2a_fk_auth_user_id`
    FOREIGN KEY (`created_by_id`)
    REFERENCES `job_board_db`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`jobs_jobapplication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`jobs_jobapplication` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `cover_letter` LONGTEXT NOT NULL,
  `cv_path` VARCHAR(255) NOT NULL,
  `submitted_at` DATETIME(6) NOT NULL,
  `job_post_id` BIGINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `jobs_jobapplication_job_post_id_d34b8f62_fk_jobs_jobpost_id` (`job_post_id` ASC) VISIBLE,
  INDEX `jobs_jobapplication_user_id_829c54fc_fk_auth_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `jobs_jobapplication_job_post_id_d34b8f62_fk_jobs_jobpost_id`
    FOREIGN KEY (`job_post_id`)
    REFERENCES `job_board_db`.`jobs_jobpost` (`id`),
  CONSTRAINT `jobs_jobapplication_user_id_829c54fc_fk_auth_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `job_board_db`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`token_blacklist_outstandingtoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`token_blacklist_outstandingtoken` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `token` LONGTEXT NOT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `expires_at` DATETIME(6) NOT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `jti` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti` ASC) VISIBLE,
  INDEX `token_blacklist_outs_user_id_83bc629a_fk_auth_user` (`user_id` ASC) VISIBLE,
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_auth_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `job_board_db`.`auth_user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `job_board_db`.`token_blacklist_blacklistedtoken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_board_db`.`token_blacklist_blacklistedtoken` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `blacklisted_at` DATETIME(6) NOT NULL,
  `token_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `token_id` (`token_id` ASC) VISIBLE,
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk`
    FOREIGN KEY (`token_id`)
    REFERENCES `job_board_db`.`token_blacklist_outstandingtoken` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
