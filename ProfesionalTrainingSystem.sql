CREATE DATABASE Sistema_Practicas_Profesionales;
USE Sistema_Practicas_Profesionales;
CREATE TABLE Administrator(
adminID INTEGER NOT NULL AUTO_INCREMENT,
cubicle INTEGER NOT NULL,
fullName VARCHAR(255) NOT NULL,
password VARCHAR(100) NOT NULL,
username VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY(adminID)
);

CREATE TABLE Academic(
academicID INTEGER NOT NULL AUTO_INCREMENT,
cubicle INTEGER NOT NULL,
dateCreation DATE NOT NULL,
dateRemoval DATE,
gender VARCHAR(15) NOT NULL,
names VARCHAR(255) NOT NULL,
password VARCHAR(100) NOT NULL,
phoneNumber VARCHAR(9) NOT NULL,
surnames VARCHAR(255) NOT NULL,
username VARCHAR(255) NOT NULL UNIQUE,
adminID INTEGER,
PRIMARY KEY(academicID)
);

ALTER TABLE Academic ADD CONSTRAINT
fk_academic_1 FOREIGN KEY(adminID)
REFERENCES Administrator(adminID);

CREATE TABLE Coordinator(
academicID INTEGER NOT NULL,
PRIMARY KEY(academicID)
);

ALTER TABLE Coordinator ADD CONSTRAINT
fk_coordinator_1 FOREIGN KEY(academicID)
REFERENCES Academic(academicID);

CREATE TABLE Professor(
academicID INTEGER NOT NULL,
shift VARCHAR(100) NOT NULL,
foramtID INTEGER,
PRIMARY KEY(academicID)
);

ALTER TABLE Professor ADD CONSTRAINT
fk_professor_1 FOREIGN KEY(academicID)
REFERENCES Academic(academicID);

CREATE TABLE PresentationFormat(
formatID INTEGER NOT NULL AUTO_INCREMENT,
presentationFormatName VARCHAR(100) NOT NULL,
savePath VARCHAR(255) NOT NULL,
PRIMARY KEY(formatID)
);

ALTER TABLE Professor ADD CONSTRAINT
fk_professor_2 FOREIGN KEY(formatID)
REFERENCES PresentationFormat(formatID);

CREATE TABLE Activity(
activityID INTEGER NOT NULL AUTO_INCREMENT,
activityName VARCHAR(120) NOT NULL,
description TEXT NOT NULL,
grade INTEGER,
submissionDate DATETIME NOT NULL,
updateTIme DATETIME,
academicID INTEGER,
traineeID INTEGER,
PRIMARY KEY(idTipo)
);

ALTER TABLE Activity ADD CONSTRAINT
fk_activity_1 FOREIGN KEY(academicID)
REFERENCES Academic(academicID);

CREATE TABLE Trainee(
traineeID INTEGER NOT NULL AUTO_INCREMENT,
studentID VARCHAR(9) NOT NULL UNIQUE,
names VARCHAR(255) NOT NULL,
surnames VARCHAR(255) NOT NULL,
password VARCHAR(100) NOT NULL,
gender VARCHAR(15) NOT NULL,
socialSector VARCHAR(100) NOT NULL,
indigenousLanguageID INTEGER,
academicID INTEGER,
scheduleID INTEGER,
assignmentDocumentID INTEGER,
finalGrade FLOAT,
PRIMARY KEY(TraineeID)
);

ALTER TABLE Trainee ADD CONSTRAINT
fk_trainee_1 FOREIGN KEY(academicID)
REFERENCES Professor(academicID);

CREATE TABLE IndigenousLanguage(
indigenousLanguageID INTEGER NOT NULL AUTO_INCREMENT,
languageName VARCHAR(255) NOT NULL,
PRIMARY KEY(indigenousLanguageID)
);

ALTER TABLE Trainee ADD CONSTRAINT
fk_trainee_2 FOREIGN KEY(indigenousLanguageID)
REFERENCES IndigenousLanguage(indigenousLanguageID);

ALTER TABLE Activity ADD CONSTRAINT
fk_activity_2 FOREIGN KEY(traineeID)
REFERENCES Trainee(traineeID);

CREATE TABLE AttachedFile(
attachedFileID INTEGER NOT NULL AUTO_INCREMENT,
fileName VARCHAR(100) NOT NULL,
savePath VARCHAR(255) NOT NULL,
documentType VARCHAR(100) NOT NULL,
traineeID INTEGER,
acceptanceDocumentID INTEGER,
PRIMARY KEY(attachedFileID)
);

ALTER TABLE AttachedFile ADD CONSTRAINT
fk_attachedfile_1 FOREIGN KEY(traineeID)
REFERENCES Trainee(traineeID);

CREATE TABLE AcceptanceDocument(
acceptanceDocumentID INTEGER NOT NULL AUTO_INCREMENT,
dateCreation DATE NOT NULL,
savePath VARCHAR(255) NOT NULL,
linkedOrganizationID INTEGER,
PRIMARY KEY(acceptanceDocumentID)
);

ALTER TABLE AttachedFile ADD CONSTRAINT
fk_attachedfile_2 FOREIGN KEY(acceptanceDocumentID)
REFERENCES AcceptanceDocument(acceptanceDocumentID);

CREATE TABLE Schedule(
scheduleID INTEGER NOT NULL AUTO_INCREMENT,
fileName VARCHAR(100) NOT NULL,
savePath VARCHAR(255) NOT NULL,
projectManagerID INTEGER,
PRIMARY KEY(scheduleID)
);

ALTER TABLE Trainee ADD CONSTRAINT
fk_trainee_3 FOREIGN KEY(scheduleID)
REFERENCES Schedule(scheduleID);

CREATE TABLE ProjectManager(
projectManagerID INTEGER NOT NULL AUTO_INCREMENT,
names VARCHAR(255) NOT NULL,
surnames VARCHAR(255) NOT NULL,
jobPosition VARCHAR(100) NOT NULL,
email VARCHAR(255) NOT NULL,
phoneNumber VARCHAR(9) NOT NULL,
PRIMARY KEY(projectManagerID)
);

ALTER TABLE Schedule ADD CONSTRAINT
fk_schedule_1 FOREIGN KEY(projetManagerID)
REFERENCES Schedule(projectManagerID);

CREATE TABLE Project(
projectID INTEGER NOT NULL AUTO_INCREMENT,
projectName VARCHAR(100) NOT NULL,
businessSector VARCHAR(100) NOT NULL,
availabiltyStatus VARCHAR(15) NOT NULL,
traineeQuota INTEGER NOT NULL,
generalDescription TEXT NOT NULL,
durationInDays INTEGER NOT NULL,
generalGoal TEXT NOT NULL,
immediateGoal TEXT NOT NULL,
intermediateGoals TEXT NOT NULL,
methodology VARCHAR(255) NOT NULL,
necessaryResources TEXT NOT NULL,
projectActivities TEXT NOT NULL,
responsabilities TEXT NOT NULL,
schoolsemester VARCHAR(100) NOT NULL,
projectManagerID INTEGER,
linkedOrganizationID INTEGER,
PRIMARY KEY(projectID)
);

CREATE TABLE AssignmentDocument(
assignmentDocumentID INTEGER NOT NULL AUTO_INCREMENT,
documentName VARCHAR(255) NOT NULL,
savePath VARCHAR(255) NOT NULL,
projectID INTEGER,
PRIMARY KEY(assignmentDocumentID)
);

ALTER TABLE AssignmentDocument ADD CONSTRAINT
fk_assignmentdocument_1 FOREIGN KEY(prjectID)
REFERENCES Project(prjectID);

ALTER TABLE Trainee ADD CONSTRAINT
fk_trainee_4 FOREIGN KEY(assignmentDocumentID)
REFERENCES AssignmentDocument(assignmentDocumentID);

ALTER TABLE Project ADD CONSTRAINT
fk_project_1 FOREIGN KEY(projectmanagerID)
REFERENCES ProjectManager(projectmanagerID);

CREATE TABLE Training(
traineeID INTEGER NOT NULL,
projectID INTEGER NOT NULL,
PRIMARY KEY(traineeID, projectID)
);

CREATE TABLE MonthlyReport(
monthlyreportID INTEGER NOT NULL AUTO_INCREMENT,
reportName VARCHAR(255) NOT NULL,
recordedActivities TEXT NOT NULL,
savePath VARCHAR(255) NOT NULL,
traineeID INTEGER,
projectID INTEGER,
PRIMARY KEY(monthlyreportID)
);

ALTER TABLE MonthlyReport ADD CONSTRAINT
fk_monthlyreport_1 FOREIGN KEY(traineeID)
REFERENCES Training(traineeID);

ALTER TABLE MonthlyReport ADD CONSTRAINT
fk_monthlyreport_2 FOREIGN KEY(projectID)
REFERENCES Training(projectID);

CREATE TABLE PartialReport(
partialreportID INTEGER NOT NULL AUTO_INCREMENT,
reportName VARCHAR(255) NOT NULL,
reportDescription TEXT NOT NULL,
numberOfActivities INTEGER,
savePath VARCHAR(255) NOT NULL,
submissionDate DATETIME NOT NULL,
traineeID INTEGER,
projectID INTEGER,
PRIMARY KEY(monthlyreportID)
);

ALTER TABLE PartialReport ADD CONSTRAINT
fk_partialreport_1 FOREIGN KEY(traineeID)
REFERENCES Training(traineeID);

ALTER TABLE PartialReport ADD CONSTRAINT
fk_partialreport_2 FOREIGN KEY(projectID)
REFERENCES Training(projectID);

CREATE TABLE LinkedOrganization(
linkedOrganizationID INTEGER NOT NULL AUTO_INCREMENT,
companyName VARCHAR(255) NOT NULL,
companyAddress VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
state VARCHAR(255) NOT NULL,
phoneNumber VARCHAR(9) NOT NULL,
contactEmail VARCHAR(255) NOT NULL,
businessSector VARCHAR(255) NOT NULL,
numberOfDirectUsers INTEGER NOT NULL,
numberOfIndirectUsers INTEGER NOT NULL,
PRIMARY KEY(linkedOrganizationID)
);

ALTER TABLE AcceptanceDocument ADD CONSTRAINT
fk_acceptancedocument_1 FOREIGN KEY(linkedOrganizationID)
REFERENCES LinkedOrganization(linkedOrganizationID);


ALTER TABLE Project ADD CONSTRAINT
fk_project_2 FOREIGN KEY(linkedOrganizationID)
REFERENCES LinkedOrganization(linkedOrganizationID);









