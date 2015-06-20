use studentacademic;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Students` (
  `S_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(20) NOT NULL,
  `Last_Name` VARCHAR(20) NOT NULL,
  `Contact_Email` VARCHAR(45) NOT NULL,
  `Address_1` VARCHAR(50) NULL,
  `Address_2` VARCHAR(50) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(20) NULL,
  `ZIP` VARCHAR(15) NULL,
  PRIMARY KEY (`S_ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Sectional` (
  `Sectional_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Section_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Sectional_ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Tests` (
  `Test_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Test_name` VARCHAR(20) NULL,
  PRIMARY KEY (`Test_ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`VISA` (
  `VISA_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `VISA_type` VARCHAR(45) NULL,
  `VISA_duration` VARCHAR(45) NULL,
  `VISA_Location` VARCHAR(45) NULL,
  `VISA_Date` DATE NULL,
  PRIMARY KEY (`VISA_ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`References` (
  `Reference_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Reference_First_Name` VARCHAR(45) NOT NULL,
  `Reference_Last_Name` VARCHAR(45) NOT NULL,
  `Reference_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Reference_ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Universities` (
  `University_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `University_name` VARCHAR(70) NULL,
  `University_location` VARCHAR(20) NULL,
  `University_rank` INT NULL,
  `University_isPublic` TINYINT(1) NULL,
  `University_URL` VARCHAR(45) NULL,
  PRIMARY KEY (`University_ID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Programs` (
  `Program_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `University_ID` INT UNSIGNED NOT NULL,
  `Program_name` VARCHAR(20) NULL,
  `Program_duration` INT NULL,
  PRIMARY KEY (`Program_ID`),
  INDEX `fk_Programs_Universities1_idx` (`University_ID` ASC),
  CONSTRAINT `fk_Programs_Universities1`
    FOREIGN KEY (`University_ID`)
    REFERENCES `StudentAcademic`.`Universities` (`University_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Degrees` (
  `Degree_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Programs_ID` INT UNSIGNED NOT NULL,
  `Degree_name` VARCHAR(20) NULL,
  `Degree_rank` INT NULL,
  `Degree_duration` VARCHAR(45) NULL,
  `Degree_coreCourse_count` INT NULL,
  PRIMARY KEY (`Degree_ID`),
  INDEX `fk_Degrees_Programs1_idx` (`Programs_ID` ASC),
  CONSTRAINT `fk_Degrees_Programs1`
    FOREIGN KEY (`Programs_ID`)
    REFERENCES `StudentAcademic`.`Programs` (`Program_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Tests_Sectional` (
  `Test_Section_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Test_ID` INT UNSIGNED NOT NULL,
  `Sectional_ID` INT UNSIGNED NOT NULL,
  `Students_S_ID` INT UNSIGNED NOT NULL,
  `Test_Section_Score` INT UNSIGNED NOT NULL,
  INDEX `fk_Tests_has_Sectional_Sectional1_idx` (`Sectional_ID` ASC),
  INDEX `fk_Tests_has_Sectional_Tests1_idx` (`Test_ID` ASC),
  PRIMARY KEY (`Test_Section_ID`),
  INDEX `fk_Tests_Sectional_Students1_idx` (`Students_S_ID` ASC),
  CONSTRAINT `fk_Tests_has_Sectional_Tests1`
    FOREIGN KEY (`Test_ID`)
    REFERENCES `StudentAcademic`.`Tests` (`Test_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tests_has_Sectional_Sectional1`
    FOREIGN KEY (`Sectional_ID`)
    REFERENCES `StudentAcademic`.`Sectional` (`Sectional_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tests_Sectional_Students1`
    FOREIGN KEY (`Students_S_ID`)
    REFERENCES `StudentAcademic`.`Students` (`S_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Applications` (
  `Application_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Student_ID` INT UNSIGNED NOT NULL,
  `VISA_ID` INT UNSIGNED NOT NULL,
  `Application_Start_Date` DATE NULL,
  `Application_isSubmitted` TINYINT(1) NULL,
  `Application_Submission_Date` DATE NULL,
  `Admitted` TINYINT(1) NULL,
  `Degrees_Degree_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Application_ID`),
  INDEX `fk_Applications_VISAS1_idx` (`VISA_ID` ASC),
  INDEX `fk_Applications_Degrees1_idx` (`Degrees_Degree_ID` ASC),
  CONSTRAINT `fk_Applications_Students`
    FOREIGN KEY (`Student_ID`)
    REFERENCES `StudentAcademic`.`Students` (`S_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_VISAS1`
    FOREIGN KEY (`VISA_ID`)
    REFERENCES `StudentAcademic`.`VISA` (`VISA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_Degrees1`
    FOREIGN KEY (`Degrees_Degree_ID`)
    REFERENCES `StudentAcademic`.`Degrees` (`Degree_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `StudentAcademic`.`Applications_has_References` (
  `Application_ID` INT UNSIGNED NOT NULL,
  `Reference_ID` INT UNSIGNED NOT NULL,
  `Rating` TINYINT UNSIGNED NOT NULL,
  `Letter_text` TEXT NULL,
  PRIMARY KEY (`Application_ID`, `Reference_ID`),
  INDEX `fk_Applications_has_References_References1_idx` (`Reference_ID` ASC),
  INDEX `fk_Applications_has_References_Applications1_idx` (`Application_ID` ASC),
  CONSTRAINT `fk_Applications_has_References_Applications1`
    FOREIGN KEY (`Application_ID`)
    REFERENCES `StudentAcademic`.`Applications` (`Application_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Applications_has_References_References1`
    FOREIGN KEY (`Reference_ID`)
    REFERENCES `StudentAcademic`.`References` (`Reference_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

#students

INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('James', 'Butt', 'jbutt@gmail.com', '6649 N Blue Gum St', '', 'New Orleans', 'LA', '70116');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Josephine','Darakjy','josephine_darakjy@darakjy.org','4 B Blue Ridge Blvd','','Brighton','MI','48116');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Art','Venere','art@venere.org','8 W Cerritos Ave #54','','Bridgeport','NJ','8014');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Lenna','Paprocki','lpaprocki@hotmail.com','639 Main St','','Anchorage','AK','99501');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Donette','Foller','donette.foller@cox.net','34 Center St','','Hamilton','OH','45011');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Simona','Morasca','simona@morasca.com','3 Mcauley Dr','','Ashland','OH','44805');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Mitsue','Tollner','mitsue_tollner@yahoo.com','7 Eads St','','Chicago','IL','60632');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Leota','Dilliard','leota@hotmail.com','7 W Jackson Blvd','','San Jose','CA','95111');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Sage','Wieser','sage_wieser@cox.net','5 Boston Ave #88','','Sioux Falls','SD','57105');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Kris','Marrier','kris@gmail.com','228 Runamuck Pl #2808','','Baltimore','MD','21224');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Minna','Amigon','minna_amigon@yahoo.com','2371 Jerrold Ave','','Kulpsville','PA','19443');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Abel','Maclead','amaclead@gmail.com','37275 St  Rt 17m M','','Middle Island','NY','11953');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Kiley','Caldarera','kiley.caldarera@aol.com','25 E 75th St #69','','Los Angeles','CA','90034');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Graciela','Ruta','gruta@cox.net','98 Connecticut Ave Nw','','Chagrin Falls','OH','44023');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Cammy','Albares','calbares@gmail.com','56 E Morehead St','','Laredo','TX','78045');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Mattie','Poquette','mattie@aol.com','73 State Road 434 E','','Phoenix','AZ','85013');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Meaghan','Garufi','meaghan@hotmail.com','69734 E Carrillo St','','Mc Minnville','TN','37110');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Gladys','Rim','gladys.rim@rim.org','322 New Horizon Blvd','','Milwaukee','WI','53207');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Yuki','Whobrey','yuki_whobrey@aol.com','1 State Route 27','','Taylor','MI','48180');
INSERT into STUDENTS (First_Name, Last_Name, Contact_Email, Address_1, Address_2, City, Country, ZIP)  VALUES ('Fletcher','Flosi','fletcher.flosi@yahoo.com','394 Manchester Blvd','','Rockford','IL','61109');

#universities

INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('University of Maryland','College Park','1',1,'www.umd.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Stanford University','Massachusetts','2',0,'www.su.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Northeastern University','Boston','3',0,'www.neu.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('University of Washington','Seattle','4',1,'www.uwash.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Univerisity of California','Berkeley','5',1,'www.ucb.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Univeristy of California','San Diego','6',1,'www.ucsd.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Iowa State University','Iowa','7',0,'www.isu.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('University of Illinois','Chicago','8',1,'www.uic.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Carnegie Mellon University','Pittsburg','9',0,'www.cmu.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Pennsylvania State University','Pennsylvania','10',1,'www.upenn.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('John Hopkins University','Baltimore','11',0,'www.jhu.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Univeristy of Utah','Utah','12',1,'www.uutah.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('University of Arizona','Phoenix','13',1,'www.uoa.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('Arizona State University','Arizona','14',1,'www.asu.edu');
INSERT into UNIVERSITIES (University_name, University_location, University_rank, University_isPublic, University_URL) values ('University of Florida','Tampa','15',1,'www.ufl.edu');


#Sectional

INSERT into SECTIONAL (Section_Name) values ('Quantitative I');
INSERT into SECTIONAL (Section_Name) values ('Quantitative II');
INSERT into SECTIONAL (Section_Name) values ('Verbal I');
INSERT into SECTIONAL (Section_Name) values ('Verbal II');


#Tests

INSERT into TESTS (Test_name) values ('GRE');
INSERT into TESTS (Test_name) values ('TOEFL');

#Visa

INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Chennai','2008-11-21');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Mumbai','2008-12-16');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','New Delhi','2009-9-8');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Kolkata','2010-2-10');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Hyderabad','2010-5-10');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Chennai','2010-11-3');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Mumbai','2011-3-10');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','New Delhi','2011-10-11');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Kolkata','2011-12-29');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Hyderabad','2012-3-26');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Chennai','2013-1-4');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Mumbai','2014-1-27');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','New Delhi','2014-8-18');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Kolkata','2015-5-4');
INSERT into VISA (VISA_Type, VISA_duration, VISA_Location, VISA_Date) values ('F1','5','Hyderabad','2015-10-19');

#REFERENCES_ENTRIES

INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Joanne','Anderson','joanne.anderson@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Sean','Edmunds','sean.edmunds@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Peter','Edmunds','peter.edmunds@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Emily','Howard','emily.howard@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Gabrielle','Miller','gabrielle.miller@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Wendy','Manning','wendy.manning@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Sophie','Hudson','sophie.hudson@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Emily','Roberts','emily.roberts@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Irene','Lyman','irene.lyman@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Luke','Brown','luke.brown@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('David','Poole','david.poole@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Lisa','Quinn','lisa.quinn@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Amelia','Clarkson','amelia.clarkson@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Sue','Brown','sue.brown@gmail.com');
INSERT into REFERENCES_ENTRIES (Reference_First_Name, Reference_Last_Name, Reference_email) VALUES ('Anthony','Nolan','anthony.nolan@gmail.com');

# Programs

INSERT into PROGRAMS (University_ID, Program_name) VALUES ('34','Computer Science');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('34','Information Management');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('34','Electrical Engineering');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('35','Electrical Engineering');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('36','Information Management');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('36','Computer Science');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('36','Electrical Engineering');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('36','Telecom Engineering');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('41','Computer Science');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('43','Telecom Engineering');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('43','Information Management');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('44','Information Management');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('45','Telecom Engineering');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('45','Information Management');
INSERT into PROGRAMS (University_ID, Program_name) VALUES ('45','Computer Science');

#Degrees

INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('1','Masters','4','2','3');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('6','Masters','2','2','3');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('9','Masters','3','2','3');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('8','Masters','1','2','4');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('10','Phd','3','4','4');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('13','Phd','6','4','4');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('4','Masters','15','2','3');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('7','Masters','14','2','2');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('2','Masters','12','2','3');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('5','Masters','9','2','2');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('4','Phd','1','4','4');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('7','Phd','3','4','2');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('2','Phd','2','4','3');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('5','Phd','1','4','1');
INSERT into DEGREES (Programs_ID, Degree_name, Degree_rank, Degree_duration, Degree_coreCourse_count) VALUES ('13','Masters','3','2','3');

#applications

INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('65','3','1','2015-4-10','1','2015-4-20','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('66','4','2','2016-10-14','1','2016-10-24','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('67','5','3','2015-11-11','1','2015-11-21','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('68','6','4','2014-12-1','1','2014-12-11','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('69','7','5','2015-8-30','1','2015-8-30','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('70','8','6','2015-7-11','1','2015-7-21','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('71','9','7','2016-10-28','1','2016-11-10','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('72','10','8','2015-9-23','1','2015-10-3','1');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, Admitted) values ('73','11','9','2015-11-3','0','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, applications_Submission_Date, Admitted) values ('74','12','10','2015-5-1','1','2015-5-10','1');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, Admitted) values ('75','13','11','2015-8-5','0','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, Admitted) values ('76','14','12','2015-2-18','0','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, Admitted) values ('77','15','13','2016-6-14','0','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, Admitted) values ('86','1','14','2016-3-14','0','0');
INSERT into applications (Student_ID, VISA_ID, Degrees_Degree_ID,applications_Start_Date, applications_isSubmitted, Admitted) values ('87','2','15','2015-4-28','0','0');

#applications_has_references

INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('1','1','5');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('1','2','2');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('1','3','3');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('2','4','5');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('2','5','2');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('2','6','3');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('3','7','1');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('3','8','1');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('3','9','3');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('4','10','5');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('4','11','2');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('4','12','3');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('5','13','5');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('5','14','4');
INSERT into applications_has_references (Application_ID, Reference_ID, Rating) values ('5','15','3');

#tests_sectional

INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','1','62','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','3','62','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','4','62','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','5','62','19');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','1','63','17');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','3','63','20');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','4','63','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','5','63','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','1','64','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','3','64','19');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','4','64','17');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','5','64','20');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','1','65','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','3','65','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','4','65','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','5','65','19');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','1','66','17');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','3','66','20');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','4','66','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('1','5','66','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','1','62','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','3','62','19');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','4','62','17');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','5','62','20');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','1','63','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','3','63','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','4','63','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','5','63','19');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','1','64','17');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','3','64','20');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','4','64','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','5','64','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','1','65','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','3','65','19');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','4','65','17');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','5','65','20');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','1','66','18');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','3','66','16');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','4','66','15');
INSERT into tests_sectional (Test_ID, Sectional_ID, Students_S_ID, Test_Section_Score) values ('2','5','66','19');


#Points to be noted
# 1. All tables are populated with >= 15 entries
# 2. For certain queries, only admitted students are considered

#Query 1. find Student, his address and the university he/she is studying

CREATE VIEW STUDENT_UNIVERSITY_ATTENDING as select concat(s.first_name, space(1), s.last_name) as Student_Name, s.Contact_Email as Email_ID,
concat(s.Address_1, space(1), s.Address_2, space(1), s.City, space(1), s.state,space(1), s.ZIP) 
as Student_Address,
u.University_name as University_Name
from universities u, programs p, degrees d, applications a, students s
where u.Universstudent_university_attendingity_ID = p.University_ID 
and p.Program_ID = d.Programs_ID
and d.Degree_ID = a.Degrees_Degree_ID
and s.S_ID = a.Student_ID
and a.Admitted = '1' ;

#Query 2. find top 3 Verbal 1 scores and names of students for a given Test

CREATE VIEW TOP_3_VERBAL_SCORES as select concat(s.first_name, space(1), s.last_name) as Student_Name, ts.Test_Section_Score
from tests_sectional ts, students s, tests t , sectional se 
where t.Test_name = 'GRE'
and se.Section_Name = 'Verbal I'
and t.Test_ID = ts.Test_ID
and se.Sectional_ID = ts.Sectional_ID
and ts.Students_S_ID = s.S_ID
order by ts.Test_Section_Score desc limit 3;

#Query 3. No of students enrolled in a particular program
# filtering done to get only details of admitted students

CREATE VIEW PROGRAM_NUMBER_ENROLLED as select p.Program_name, count(*) as Number_of_Students_Enrolled
from programs p, degrees d, applications a, students s
where p.Program_ID = d.Programs_ID
and d.Degree_ID = a.Degrees_Degree_ID
and s.S_ID = a.Student_ID
and a.Admitted = '1' 
group by p.Program_name
order by Number_of_Students_Enrolled desc;

#Query 4. Count of No. of students enrolled in a particuler degree level

CREATE VIEW NUMBER_STUDENTS_DEGREE as select d.Degree_name, count(s.first_name) as Number_of_Students
from applications a, students s, degrees d
where d.Degree_ID = a.Degrees_Degree_ID
and s.S_ID = a.Student_ID
and a.Admitted = '1' 
group by d.degree_name;

#Query 5. find average rating given by references for admitted and non-admitted students 
# and university applied

CREATE VIEW AVERAGE_REFERENCE_RATING_FOR_STUDENTS as select u.University_name, concat(s.first_name, space(1), s.last_name) as Student_Name, s.Contact_Email as Email_ID, 
CASE a.Admitted 
	WHEN 0 THEN 'Rejected' 
    WHEN 1 THEN 'Accepted'
END
as Admitted_Status,  
round(avg(ar.Rating),2) as Average_Rating
from applications a, applications_has_references ar, students s, universities u, programs p, degrees d
where a.Application_ID = ar.Application_ID
and s.S_ID = a.Student_ID
and u.University_ID = p.University_ID 
and p.Program_ID = d.Programs_ID
and d.Degree_ID = a.Degrees_Degree_ID
group by a.admitted, a.Application_ID
order by u.University_name;

#Query 6. University and no_of_students applied

CREATE VIEW NUMBER_STUDENTS_UNIVERSITY as select u.University_name, u.university_location as Location, u.University_rank as Rank_of_University, 
count(s.First_Name) as No_of_Students_Enrolled 
from students s, universities u, programs p, degrees d, applications a
where s.S_ID = a.Student_ID
and u.University_ID = p.University_ID 
and p.Program_ID = d.Programs_ID
and d.Degree_ID = a.Degrees_Degree_ID
group by u.University_ID
order by No_of_Students_Enrolled desc;

#Query 7. When did student apply for VISA

CREATE VIEW VISA_STUDENT_DATE as select concat(s.first_name, space(1), s.last_name) as Student_Name, s.state as Present_State_of_stay,
v.VISA_Location, v.VISA_Date
from visa v, applications a, students s
where v.VISA_ID = a.VISA_ID
and s.S_ID = a.Student_ID
order by Student_name, VISA_Location;

#Query 8. Visa Applications count per location

CREATE VIEW VISA_COUNT_LOCATION as select v.VISA_Location as Visa_Location, count(v.visa_location) as Number_applications
from visa v 
group by VISA_Location;

#Query 9. Top 3 students who scored in GRE

CREATE VIEW TOP_3_GRE as select ts.Students_S_ID, concat(s.first_name, space(1), s.last_name) as Student_Name, 
260+sum(ts.Test_Section_Score) as Cumulative_Score from 
tests_sectional ts, tests t, sectional se, students s
where t.Test_name = 'GRE'
and t.Test_ID = ts.Test_ID
and ts.Sectional_ID = se.Sectional_ID
and s.S_ID = ts.Students_S_ID
group by ts.Students_S_ID
order by Cumulative_Score desc limit 3;

#Query 10. Top 3 student who scored in TOEFL

CREATE VIEW TOP_3_TOEFL as select ts.Students_S_ID, concat(s.first_name, space(1), s.last_name) as Student_Name, 
sum(ts.Test_Section_Score) as Cumulative_Score from 
tests_sectional ts, tests t, sectional se, students s
where t.Test_name = 'TOEFL'
and t.Test_ID = ts.Test_ID
and ts.Sectional_ID = se.Sectional_ID
and s.S_ID = ts.Students_S_ID
group by ts.Students_S_ID
order by Cumulative_Score desc limit 3;

#Query 11. Usage of subquery

CREATE VIEW  ALL_STUDENT_IDS as select s.S_ID from students s;

# get all the references details for the students

CREATE VIEW REFERENCE_DETAILS_FOR_STUDENTS as select concat(re.Reference_First_Name, space(1), re.Reference_Last_Name) as Reference_Name, re.Reference_email from applications a, applications_has_references ar, references_entries re
where a.Student_ID in (select * from all_student_ids)
and a.Application_ID = ar.Application_ID
and ar.Reference_ID = re.Reference_ID;

#Query 12. Join - to find Number of core courses in each degree program

CREATE VIEW DEGREE_CORE_COURSES as select d.degree_name as Degree_Name, p.program_name as Program_Name , d.Degree_coreCourse_count as Core_Courses_Count
from Degrees d inner join Programs p on d.Programs_ID = p.program_id
group by d.degree_name, p.Program_name;

#Query 13. Join - to find degree duration 

CREATE VIEW DEGREE_DURATION as select u.university_name as University_name, u.University_location , d.degree_name, p.program_name, d.degree_duration
from universities u join programs p 
on u.University_ID = p.University_ID
join degrees d 
on d.Programs_ID = p.program_id
group by u.university_name
order by d.Degree_name;


# All Views

select * from all_student_ids;
select * from average_reference_rating_for_students;
select * from number_students_degree;
select * from number_students_university;
select * from program_number_enrolled;
select * from reference_details_for_students;
select * from student_university_attending;
select * from top_3_toefl;
select * from top_3_gre;
select * from top_3_verbal_scores;
select * from visa_count_location;
select * from visa_student_date;
select * from DEGREE_DURATION;
select * from DEGREE_CORE_COURSES;


# All_Tables

select * from tests;
select * from sectional;
select * from tests_sectional;
select * from references_entries;
select * from students;
select * from applications; 
select * from degrees;	
select * from programs;
select * from references_entries;
select * from tests;
select * from visa;
select * from sectional;
select * from universities;









