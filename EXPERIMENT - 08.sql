CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Address VARCHAR(300)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    Capacity INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Grade VARCHAR(5),
    Status VARCHAR(30),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students VALUES
(1,'Rahul',20,'Bhubaneswar'),
(2,'Priya',21,'Cuttack'),
(3,'Amit',22,'Puri'),
(4,'Sneha',19,'Berhampur'),
(5,'Ravi',23,'Sambalpur');

INSERT INTO Courses VALUES
(101,'DBMS',4,30),
(102,'Java',3,25),
(103,'Python',4,35),
(104,'Web Development',3,20),
(105,'Software Engineering',3,30);

INSERT INTO Enrollments VALUES
(1001,1,101,'2026-01-10','A','Active'),
(1002,2,102,'2026-01-12','B','Active'),
(1003,3,103,'2026-01-15','A','Completed'),
(1004,4,104,'2026-01-18','B','Active'),
(1005,5,105,'2026-01-20','A','Completed');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT S.Name, C.CourseName, E.EnrollmentDate
FROM Enrollments E
INNER JOIN Students S ON E.StudentID = S.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;

UPDATE Courses
SET Capacity = Capacity - 1
WHERE CourseID = 101;

UPDATE Enrollments
SET Grade = 'B', Status = 'Completed'
WHERE EnrollmentID = 1001;

UPDATE Courses
SET Capacity = Capacity + 5
WHERE CourseID = 101;

DELETE FROM Enrollments WHERE StudentID = 5;
DELETE FROM Students WHERE StudentID = 5;

ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Students DROP COLUMN Address;

RENAME TABLE Enrollments TO Registrations;

ALTER TABLE Students
MODIFY Name VARCHAR(100) NOT NULL;

ALTER TABLE Students
ADD CONSTRAINT chk_age CHECK (Age >= 18);

SELECT S.Name AS StudentName, C.CourseName
FROM Students S
INNER JOIN Registrations R ON S.StudentID = R.StudentID
INNER JOIN Courses C ON R.CourseID = C.CourseID;

SELECT S.Name AS StudentName, C.CourseName
FROM Students S
LEFT JOIN Registrations R ON S.StudentID = R.StudentID
LEFT JOIN Courses C ON R.CourseID = C.CourseID;

SELECT COUNT(*) AS TotalStudents FROM Students;

SELECT MAX(Credits) AS MaximumCredits,
       MIN(Credits) AS MinimumCredits
FROM Courses;

SELECT COUNT(*) AS ActiveEnrollments
FROM Registrations
WHERE Status = 'Active';

CREATE VIEW ActiveEnrollmentView AS
SELECT C.CourseName, S.Name AS StudentName, R.EnrollmentDate
FROM Registrations R
INNER JOIN Students S ON R.StudentID = S.StudentID
INNER JOIN Courses C ON R.CourseID = C.CourseID
WHERE R.Status = 'Active';

SELECT * FROM ActiveEnrollmentView;

DELIMITER //

CREATE PROCEDURE GetActiveEnrollments()
BEGIN
    SELECT C.CourseName, S.Name AS StudentName, R.EnrollmentDate
    FROM Registrations R
    INNER JOIN Students S ON R.StudentID = S.StudentID
    INNER JOIN Courses C ON R.CourseID = C.CourseID
    WHERE R.Status = 'Active';
END //

DELIMITER ;

CALL GetActiveEnrollments();