CREATE DATABASE Corporate2;
USE Corporate2; 

CREATE TABLE employee1 (
    emp_id INT,
    emp_name VARCHAR(15),
    designation VARCHAR(18),
    dept VARCHAR(20),
    salary INT,
    d_hire VARCHAR(20)
);

INSERT INTO employee1 VALUES
(001, 'santosh', 'manager', 'IT', 500, '2021-01-10'),
(002, 'Subham', 'developer', 'design', 60000, '2022-03-15'),
(003, 'Subham', 'HR', 'HR', 35000, '2022-05-20'),
(004, 'Prasanna', 'Accountant', 'Finance', 45000, '2022-07-12'),
(005, 'Rosani', 'Business', 'Business', 70000, '2023-01-08'),
(006, 'Vikash', 'manager', 'sales', 48000, '2023-04-10'),
(007, 'piyush', 'Tester', 'testing', 36000, '2023-02-25'),
(008, 'biswa', 'Teacher', 'English', 25000, '2023-06-05'),
(009, 'dipu', 'civil', 'contractor', 42000, '2023-08-22'),
(010, 'babul', 'analyst', 'IT', 39000, '2024-01-15');

SELECT emp_name, UPPER(emp_name) AS upper_name
FROM employee1;

SELECT emp_name, LOWER(emp_name) AS lower_name
FROM employee1;

SELECT emp_name, LENGTH(emp_name) AS name_length
FROM employee1;

SELECT CONCAT(emp_name, '-', designation) AS employee_details
FROM employee1;

SELECT emp_name, SUBSTRING(emp_name, 1, 3) AS first_three_character
FROM employee1;

SELECT emp_name, salary, ROUND(salary) AS rounded_salary
FROM employee1;

SELECT emp_name, salary, ABS(salary - 50000) AS salary_difference
FROM employee1;

SELECT NOW() AS current_date_and_time;

SELECT emp_name, d_hire,
       ROUND(DATEDIFF(CURDATE(), d_hire) / 365.2, 2) AS years_of_service
FROM employee1;

SELECT MIN(salary) AS minimum_salary
FROM employee1;

SELECT MAX(salary) AS maximum_salary
FROM employee1;

SELECT COUNT(*) AS total_employees
FROM employee1;

SELECT AVG(salary) AS average_salary
FROM employee1;

SELECT SUM(salary) AS total_salary
FROM employee1;

SELECT dept, COUNT(*) AS total_employees
FROM employee1
GROUP BY dept;

SELECT dept, MAX(salary) AS maximum_salary
FROM employee1
GROUP BY dept;

SELECT dept, MIN(salary) AS minimum_salary
FROM employee1
GROUP BY dept;

SELECT dept, AVG(salary) AS average_salary
FROM employee1
GROUP BY dept;

SELECT dept, SUM(salary) AS sum_salary
FROM employee1
GROUP BY dept;

SELECT * FROM employee1;