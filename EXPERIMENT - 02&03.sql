CREATE DATABASE EmployeeDB;

USE EmployeeDB;

CREATE TABLE Persons (
    P_id INT,
    P_name VARCHAR(30),
    Gender CHAR(10),
    Designation VARCHAR(20),
    Department VARCHAR(20)
);

DESC Persons;

INSERT INTO Persons (P_id, P_name, Gender, Designation, Department)
VALUES
(100, 'SUBHAM', 'MALE', 'STUDENT', 'BSE'),
(200, 'CHAITANYASIR', 'MALE', 'TEACHER', 'CSE'),
(300, 'PRATIVAKARMAM', 'FEMALE', 'HOD', 'BSH');

SELECT * FROM Persons;

ALTER TABLE Persons
ADD Salary INT,
ADD Mob_No INT,
ADD Address VARCHAR(30);

ALTER TABLE Persons RENAME TO Faculty;

UPDATE Faculty
SET Salary = 0, Mob_No = 679854, Address = 'BAM'
WHERE P_id = 100;

UPDATE Faculty
SET Salary = 20000, Mob_No = 543245, Address = 'GNPR'
WHERE P_id = 200;

UPDATE Faculty
SET Salary = 60000, Mob_No = 765432, Address = 'RYSD'
WHERE P_id = 300;

DELETE FROM Faculty
WHERE P_id = 100;

SELECT * FROM Faculty;