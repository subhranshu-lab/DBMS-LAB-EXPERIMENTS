CREATE DATABASE Corporate3;
USE Corporate3; 

CREATE TABLE DEPARTMENT (
    Dept_Id INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Email_Id VARCHAR(100) UNIQUE,
    Salary DECIMAL(10,2) DEFAULT 25000.00,
    Join_Date DATE DEFAULT (CURRENT_DATE),
    Mobile_No VARCHAR(15),
    Dept_Id INT
);

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_dept
FOREIGN KEY (Dept_Id)
REFERENCES DEPARTMENT (Dept_Id);

ALTER TABLE Employee
ADD CONSTRAINT uq_employee_mobile
UNIQUE (Mobile_No);

ALTER TABLE Employee
ADD CONSTRAINT chk_employee_salary
CHECK (Salary >= 10000);

INSERT INTO DEPARTMENT (Dept_Id, Dept_Name)
VALUES
(101, 'Computer Science'),
(102, 'Information Technology'),
(103, 'Electronics'),
(104, 'Management');

INSERT INTO Employee VALUES
(095, 'Ayush Kumar', 'ayush@gmail.com', 95000.00, '2022-07-28', '8789871234', 101),
(079, 'Subham Dashmahapatro', 'schol@gmail.com', 40000.00, '2024-09-29', '9876987695', 102),
(121, 'Sidhartha Champati', 'sidharth@gmail.com', 56000.00, '2023-10-28', '8787898790', 101),
(073, 'Prasanna Maharan', 'prasanna@gmail.com', 40000.00, '2022-01-26', '8688688989', 103),
(090, 'Subhranshu Nayak', 'subh@gmail.com', 60000.00, '2020-02-28', '8978978971', 101);

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Salary, Mobile_No, Dept_Id)
VALUES (090, 'Subham Mahankuda', 'sm@gmail.com', 30000, '7897897890', 102);

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Salary, Mobile_No, Dept_Id)
VALUES (103, 'Aalok Kumar', 'aalok@gmail.com', 51000, '8796879610', 999);

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Salary, Mobile_No, Dept_Id)
VALUES (111, 'Om Prakash Sahoo', 'ayush@gmail.com', 30000, '9690878910', 102);

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Salary, Mobile_No, Dept_Id)
VALUES (111, 'Om Prakash Sahoo', 'omma@gmail.com', 30000, '8987891234', 102);

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Salary, Mobile_No, Dept_Id)
VALUES (111, 'NULL', 'omma@gmail.com', 30000, '8287891231', 102);

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Salary, Mobile_No, Dept_Id)
VALUES (111, 'Om Prakash Sahoo', 'omma@gmail.com', 30000, '8987891234', 102);

ALTER TABLE Employee
ALTER COLUMN Salary SET DEFAULT 30000;

INSERT INTO Employee (Emp_Id, Emp_Name, Email_Id, Mobile_No, Dept_Id)
VALUES (10, 'Anil Verma', 'anil@gmail.com', '9876593219', 103);

SELECT * FROM Employee
WHERE Emp_Id = 10;

ALTER TABLE Employee
DROP INDEX uq_employee_mobile;

ALTER TABLE Employee
DROP CONSTRAINT uq_employee_mobile;

SELECT * FROM Employee;