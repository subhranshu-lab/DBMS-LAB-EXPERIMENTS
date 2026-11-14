SHOW DATABASES;

CREATE DATABASE GIETU;

USE GIETU;

CREATE TABLE stu (
    stu_id INT,
    NAME CHAR(30),
    Age INT
);

DESC stu;

INSERT INTO stu VALUES (104, 'Subhu', 19);
INSERT INTO stu VALUES (07, 'Rituu', 18);

SELECT * FROM stu;

ALTER TABLE stu ADD Gender CHAR(2);

UPDATE stu SET Gender = 'M' WHERE stu_id = 104;
UPDATE stu SET Gender = 'F' WHERE stu_id = 07;

DELETE FROM stu WHERE Gender = 'm';

SELECT * FROM stu;