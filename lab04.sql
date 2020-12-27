USE master
IF(DB_ID('lab04') IS NOT NULL)
	DROP DATABASE lab04
ELSE
	CREATE DATABASE lab04
GO

USE lab04
GO

CREATE TABLE Students(
	StudentID INT IDENTITY CONSTRAINT pk_studentid PRIMARY KEY,
	StudentName nvarchar(20) NOT NULL,
	BirthDay date NOT NULL,
	Email nvarchar(50),
	Phone varchar(10),
	Gender nvarchar(5) NOT NULL
)

CREATE TABLE Class(
	ClassID INT IDENTITY CONSTRAINT pk_classid PRIMARY KEY,
	ClassName nvarchar(10)
)

CREATE TABLE StudentsClass(
	ClassID INT,
	StudentID INT,
	CONSTRAINT fk_classid FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
	CONSTRAINT fk_studentid FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
)

SELECT * FROM Students
SELECT * FROM Class
SELECT * FROM StudentsClass

--1
INSERT INTO Students(StudentName,BirthDay,Email,Phone,Gender)
VALUES ('Nguyen Van A','2002-01-01','a@gmail.com','0987654321','Nam'),
		('Nguyen Van B','2002-02-02','b@gmail.com','0987654322','Nam'),
		('Nguyen Van C','2002-03-03','c@gmail.com','0987654323','Nam'),
		('Nguyen Van D','2002-04-04','d@gmail.com','0987654324','Nam'),
		('Nguyen Van E','2002-05-05','e@gmail.com','0987654325','Nam')
		
INSERT INTO Class(ClassName) VALUES ('T2005E'), ('T2006E'), ('T2007E'), ('T2008E'), ('T2009E')

INSERT INTO StudentsClass(ClassID, StudentID) VALUES ('1','2'), ('2','3'), ('3','2'), ('4','2'), ('5','3')
--2
UPDATE Students SET BirthDay = '2002-10-10' WHERE StudentID = '2'

UPDATE Class SET ClassName = 'T2009A' WHERE ClassID = '4'

UPDATE StudentsClass SET ClassID = '1' WHERE StudentID = '5'

--3

DELETE FROM Students WHERE StudentID='4'

DELETE FROM Class WHERE ClassID = '3'

DELETE FROM StudentsClass WHERE ClassID = '3'