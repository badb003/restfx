-- CREATE USER 'restfx'@'localhost' IDENTIFIED BY 'q@lUH@2.*QMF6xOa';
-- GRANT ALL PRIVILEGES ON *.* TO 'restfx'@'localhost';
-- FLUSH PRIVILEGES;

-- ALTER TABLE `restfx`.`selection` MODIFY COLUMN subject_fk VARCHAR(191) NOT NULL;


DROP DATABASE IF EXISTS `restfx`;
CREATE DATABASE `restfx` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

DROP TABLE IF EXISTS `restfx`.`users`;
CREATE TABLE IF NOT EXISTS `restfx`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `admin` TINYINT NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `restfx`.`subject`;
CREATE TABLE IF NOT EXISTS `restfx`.`subject` (
  `id` VARCHAR(191),
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `restfx`.`profile`;
CREATE TABLE IF NOT EXISTS `restfx`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `restfx`.`competence`;
CREATE TABLE IF NOT EXISTS `restfx`.`competence` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(125) NULL,
  `description` VARCHAR(256) NULL,
  `page` INT NULL,
  `xpos` INT NULL,
  `ypos` INT NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `restfx`.`selection`;
CREATE TABLE IF NOT EXISTS `restfx`.`selection` (
  `subject_fk` VARCHAR(191) NOT NULL,
  `profile_fk` INT NOT NULL,
  `competence_fk` INT NOT NULL,
  `value` TINYINT NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`subject_fk`, `profile_fk`, `competence_fk`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `restfx`.`language`;
CREATE TABLE IF NOT EXISTS `restfx`.`language` (
  `id` INT NULL,
  `lang` VARCHAR(20),
  `name` VARCHAR(256) NULL,
  `updated_at` DATETIME NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`, `lang`))
ENGINE = InnoDB;

INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Loyalty','1','1','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Value orientation','1','2','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Credibility','1','1','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Personal responsibility','1','2','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Readiness for action','1','3','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Self-management','1','4','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Creativity','1','3','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Openness to change','1','4','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Humor','1','1','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Helpfulness','1','2','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Personnel development','1','1','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Delegating','1','2','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to learn','1','3','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Holistic thinking','1','4','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Discipline','1','3','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Reliability','1','4','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Decision-making ability','2','1','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Formative Ability','2','2','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to innovate','2','1','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Resilience','2','2','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Energy','2','3','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Mobility','2','4','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to act/execute','2','3','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Initiative','2','4','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Optimism','2','1','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Social commitment','2','2','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Inspiring others','2','1','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Quick-wittiness','2','2','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Results-oriented action','2','3','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Goal-oriented leadership','2','4','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Perseverance','2','3','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Consistence','2','4','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to resolve conflicts','3','1','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to integrate','3','2','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to work in a team','3','1','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Dialogue/Customer orientation','3','2','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Acquisition strength','3','3','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Problem-solving ability','3','4','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Experimental ability','3','3','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to advise','3','4','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to communicate','3','1','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Cooperativeness','3','2','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Relationship management','3','1','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Adaptability','3','2','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Articulateness','3','3','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to understand others’ perspectives','3','4','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Sense of duty','3','3','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Conscientiousness','3','4','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Knowledge orientation','4','1','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Analytical abilities','4','2','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Objectiveness','4','1','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Judgment','4','2','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Conceptual strength','4','3','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Organizational ability','4','4','1');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Diligence','4','3','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Systematic-methodical approach','4','4','2');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Project management','4','1','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Awareness of consequences','4','2','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Ability to teach','4','1','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Professional recognition','4','2','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Expertise','4','3','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Market knowledge','4','4','3');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Planning ability','4','3','4');
INSERT INTO `restfx`.`competence`(`name`, `page`, `xpos`, `ypos`) VALUES ('Interdisciplinary understanding','4','4','4');





INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Reception desk, Information.', '5', '1', '1');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Administrative and HR activities.', '5', '1', '2');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Legal activities.', '5', '1', '3');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Agriculture, green spaces', '5', '1', '4');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Animals.', '5', '1', '5');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Army, Police, Prisons.', '5', '1', '6');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Crafts, Arts.', '5', '1', '7');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Insurance.', '5', '1', '8');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Banking', '5', '1', '9');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Film, Advertising, Printing, Journalism, Photography.', '5', '1', '10');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Trade, Economy.', '5', '1', '11');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Construction, Civil Engineering.', '5', '1', '12');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Education, Training, Coaching.', '5', '1', '13');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Environment, Waste, Sustainable development.', '5', '1', '14');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Funeral.', '5', '1', '15');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Care-taking, Cleaning, Maintenance of premises.', '5', '1', '16');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('HORECA.', '5', '1', '17');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('IT (new technologies, ICT).', '5', '1', '18');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Real Estate.', '5', '1', '19');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Industry.', '5', '1', '20');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Engineering and research', '5', '1', '21');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Management, Direction, Organization.', '5', '1', '22');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Handling, Warehousing.', '5', '1', '23');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Marketing, Communication, Events.', '5', '1', '24');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Health, Civil security.', '5', '1', '25');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Social Work.', '5', '1', '26');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Show,  Entertainment,  Tourism.', '5', '1', '27');
INSERT INTO `restfx`.`competence` (`name`, `page`, `xpos`, `ypos`) values ('Sport, Wellness, Aesthetics.', '5', '1', '28');