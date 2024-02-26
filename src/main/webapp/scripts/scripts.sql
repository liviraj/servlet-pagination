create database servlet_pagination;

use servlet_pagination;

CREATE TABLE `servlet_pagination`.`login` (
  `loginId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`loginId`));

INSERT INTO `servlet_pagination`.`login` (`userName`, `password`, `role`) VALUES ('admin', 'admin', 'ADMIN');
    
CREATE TABLE StudentReg (
  regId INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  mobileNo VARCHAR(25),
  emailId VARCHAR(255),
  gender VARCHAR(255),
  dob DATE,
  address VARCHAR(500),
  department VARCHAR(255)
  PRIMARY KEY (regId)
);
