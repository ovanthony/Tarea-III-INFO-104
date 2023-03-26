create database TareaDB

use TareaDB

CREATE TABLE SCHOOL
(
  SchoolId int IDENTITY(1,1) PRIMARY KEY,
  SchoolName varchar(50) NOT NULL UNIQUE,
  Description varchar(1000) NULL,
  Address varchar(50) NULL,
  Phone varchar(50) NULL,
  PostCode varchar(50) NULL,
  PostAddress varchar(50) NULL,
)

CREATE TABLE CLASS
(
  ClassId int IDENTITY(1,1) PRIMARY KEY,
  SchoolId int NOT NULL FOREIGN KEY REFERENCES SCHOOL (SchoolId),
  ClassName varchar(50) NOT NULL UNIQUE,
  Description varchar(1000) NULL,
)

CREATE TABLE COURSE
(
  CourseId int IDENTITY(1,1) PRIMARY KEY,
  CourseName varchar(50) NOT NULL UNIQUE,
  SchoolId int NOT NULL FOREIGN KEY REFERENCES SCHOOL (SchoolId),
  Description varchar(1000) NULL,
)

CREATE TABLE STUDENT
(
  StudentId int IDENTITY(1,1) PRIMARY KEY,
  ClassId int NOT NULL FOREIGN KEY REFERENCES CLASS (ClassId),
  StudentName varchar(100) NOT NULL,
  StudentNumber varchar(20) NOT NULL,
  TotalGrade float NULL,
  Address varchar(100) NULL,
  Phone varchar(20) NULL,
  EMail varchar(100) NULL,
)

CREATE TABLE TEACHER(
  TeacherId int IDENTITY(1,1) PRIMARY KEY,
  SchoolId int NOT NULL FOREIGN KEY REFERENCES SCHOOL (SchoolId),
  TeacherName VARCHAR(50),
  Description VARCHAR(1000) NULL,
)

CREATE TABLE STUDENT_COURSE 
(
  StudentId int NOT NULL FOREIGN KEY REFERENCES STUDENT (StudentId),
  CourseId int NOT NULL FOREIGN KEY REFERENCES COURSE (CourseId)
)

CREATE TABLE TEACHER_COURSE
(
  TeacherId int NOT NULL FOREIGN KEY REFERENCES TEACHER (TeacherId),
  CourseId int NOT NULL FOREIGN KEY REFERENCES COURSE (CourseId)
)

CREATE TABLE GRADE(
  GradeId int IDENTITY(1,1) PRIMARY KEY,
  StudentId int NOT NULL FOREIGN KEY REFERENCES STUDENT (StudentId),
  CourseId int NOT NULL FOREIGN KEY REFERENCES COURSE (CourseId),
  Grade float NOT NULL,
  Comment varchar(1000) NULL,
)