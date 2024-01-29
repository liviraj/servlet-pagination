create database servlet_pagination;

use servlet_pagination;

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

INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (1, 'raj', '9852145236', 'raj@gmail.com', 'male', '2005-01-01', 'test address', 'BCA');
INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (2, 'ram', '9852456456', 'ram@gmail.com', 'male', '2005-01-01', '3,north street, thambarm, chennai, 600016', 'BSC');
INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (3, 'ravi', '98254178542', 'ravi@gmail.com', 'male', '2004-02-01', '3,north street, thambarm, chennai, 600016', 'B.Com');
INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (4, 'revathi', '9855874522', 'revathi@gmail.com', 'female', '1997-03-01', '3,north street, thambarm, chennai, 600016', 'BCA');
INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (5, 'ammu', '9888774411', 'ammu@gmail.com', 'female', '2005-04-01', '3,north street, thambarm, chennai, 600016', 'BBA');
INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (6, 'abi', '98893366552', 'abi@gmail.com', 'male', '2006-05-01', '3,north street, thambarm, chennai, 600016', 'BSC');
INSERT INTO StudentReg (regId, name, mobileNo, emailId, gender, dob, address, department) VALUES (7, 'rani', '9852456477', 'rani@gmail.com', 'female', '2006-01-01', '3,north street, thambarm, chennai, 600016', 'BBA');
