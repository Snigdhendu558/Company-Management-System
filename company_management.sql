CREATE DATABASE company_db;
USE comapany_db;
SELECT DATABASE();
SHOW DATABASES;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    hire_date DATE,
    salary DECIMAL(10,2),
    department_id INT
);
SHOW TABLES;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(12,2)
);

SHOW TABLES;
CREATE TABLE Employee_Projects (
    employee_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary_amount DECIMAL(10,2),
    effective_date DATE,
    
    
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
SHOW TABLES;
INSERT INTO Departments VALUES
(1,'Human Resources','Kolkata'),
(2,'Finance','Mumbai'),
(3,'IT','Bangalore'),
(4,'Marketing','Delhi'),
(5,'Sales','Chennai');


SELECT * FROM Departments
INSERT INTO Employees VALUES
(101,'Rahul','Sharma','M','1998-05-12','rahul@gmail.com','9876543210','2022-01-15',60000,3),
(102,'Priya','Das','F','1999-08-20','priya@gmail.com','9876543211','2022-03-10',55000,2),
(103,'Amit','Roy','M','1997-11-18','amit@gmail.com','9876543212','2021-07-05',70000,3),
(104,'Sneha','Paul','F','1998-02-25','sneha@gmail.com','9876543213','2023-01-10',50000,4),
(105,'Rohan','Sen','M','1996-09-30','rohan@gmail.com','9876543214','2020-06-18',80000,1);

SELECT * FROM Employees;

INSERT INTO Projects VALUES
(1,'Employee Management System','2025-01-10','2025-06-30',500000),
(2,'Banking Application','2025-02-01','2025-09-30',800000),
(3,'E-Commerce Website','2025-03-15','2025-12-31',1000000),
(4,'Hospital Management System','2025-04-01','2025-10-15',650000),
(5,'Library Management System','2025-05-01','2025-08-31',300000);
SELECT * FROM Projects;
INSERT INTO Employee_Projects VALUES
(101,1,'Developer'),
(101,2,'Tester'),
(102,2,'Developer'),
(103,3,'Team Lead'),
(104,4,'Designer'),
(105,5,'Project Manager');
SELECT * FROM Employee_Projects;
INSERT INTO Salaries VALUES
(1,101,60000,'2025-01-01'),
(2,102,55000,'2025-01-01'),
(3,103,70000,'2025-01-01'),
(4,104,50000,'2025-01-01'),
(5,105,80000,'2025-01-01');
SELECT * FROM Salaries;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id;

SELECT
    e.first_name,
    e.last_name,
    s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id = s.employee_id;
SELECT
    e.first_name,
    e.last_name,
    s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id = s.employee_id
ORDER BY s.salary_amount DESC
LIMIT 1;
SELECT AVG(salary_amount) AS Average_Salary
FROM Salaries;
SELECT
    d.department_name,
    COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

INSERT INTO Departments VALUES
(6,'Research','Hyderabad'),
(7,'Operations','Pune'),
(8,'Customer Support','Noida'),
(9,'Legal','Jaipur'),
(10,'Administration','Ahmedabad');

INSERT INTO Employees VALUES
(106,'Ankit','Verma','M','1998-07-11','ankit@gmail.com','9876543215','2021-04-12',62000,6),
(107,'Neha','Singh','F','1999-01-15','neha@gmail.com','9876543216','2022-08-20',58000,7),
(108,'Karan','Mehta','M','1997-06-10','karan@gmail.com','9876543217','2020-09-14',76000,3),
(109,'Pooja','Roy','F','1998-11-25','pooja@gmail.com','9876543218','2021-11-05',65000,5),
(110,'Arjun','Patel','M','1996-02-19','arjun@gmail.com','9876543219','2019-06-10',90000,2),
(111,'Riya','Gupta','F','1999-04-12','riya@gmail.com','9876543220','2023-01-01',52000,8),
(112,'Sourav','Paul','M','1998-08-18','sourav@gmail.com','9876543221','2022-02-16',61000,9),
(113,'Tina','Das','F','1997-12-22','tina@gmail.com','9876543222','2020-10-21',70000,10),
(114,'Vikram','Shah','M','1995-09-17','vikram@gmail.com','9876543223','2018-05-18',95000,1),
(115,'Nisha','Sen','F','1998-03-08','nisha@gmail.com','9876543224','2021-12-30',64000,4),
(116,'Deep','Chakraborty','M','1999-06-14','deep@gmail.com','9876543225','2023-02-15',56000,3),
(117,'Ananya','Ghosh','F','1998-10-10','ananya@gmail.com','9876543226','2022-04-19',67000,5),
(118,'Raj','Mitra','M','1997-01-03','raj@gmail.com','9876543227','2020-08-11',72000,6),
(119,'Ishita','Dey','F','1999-07-21','ishita@gmail.com','9876543228','2023-05-07',53000,7),
(120,'Abhishek','Saha','M','1996-05-27','abhishek@gmail.com','9876543229','2019-11-09',87000,2);

INSERT INTO Projects VALUES
(6,'CRM System','2025-06-01','2025-12-31',450000),
(7,'Payroll Software','2025-07-01','2026-01-31',550000),
(8,'AI Chatbot','2025-08-01','2026-03-31',1200000),
(9,'Cloud Migration','2025-09-01','2026-05-31',1500000),
(10,'Inventory System','2025-10-01','2026-04-30',700000),
(11,'Online Examination','2025-11-01','2026-06-30',650000),
(12,'Travel Portal','2025-12-01','2026-08-31',850000),
(13,'Food Delivery App','2026-01-01','2026-09-30',950000),
(14,'ERP Solution','2026-02-01','2026-12-31',2000000),
(15,'IoT Monitoring','2026-03-01','2027-01-31',1800000);

INSERT INTO Employee_Projects VALUES
(106,6,'Developer'),
(107,7,'Tester'),
(108,8,'Developer'),
(109,9,'Analyst'),
(110,10,'Project Manager'),
(111,11,'Developer'),
(112,12,'Tester'),
(113,13,'Designer'),
(114,14,'Architect'),
(115,15,'Developer'),
(116,6,'Tester'),
(117,7,'Developer'),
(118,8,'Team Lead'),
(119,9,'Analyst'),
(120,10,'Manager');

INSERT INTO Salaries VALUES
(6,106,62000,'2025-01-01'),
(7,107,58000,'2025-01-01'),
(8,108,76000,'2025-01-01'),
(9,109,65000,'2025-01-01'),
(10,110,90000,'2025-01-01'),
(11,111,52000,'2025-01-01'),
(12,112,61000,'2025-01-01'),
(13,113,70000,'2025-01-01'),
(14,114,95000,'2025-01-01'),
(15,115,64000,'2025-01-01'),
(16,116,56000,'2025-01-01'),
(17,117,67000,'2025-01-01'),
(18,118,72000,'2025-01-01'),
(19,119,53000,'2025-01-01'),
(20,120,87000,'2025-01-01');

SELECT COUNT(*) AS Total_Departments FROM Departments;

SELECT COUNT(*) AS Total_Employees FROM Employees;

SELECT COUNT(*) AS Total_Projects FROM Projects;

SELECT COUNT(*) AS Total_Assignments FROM Employee_Projects;

SELECT COUNT(*) AS Total_Salaries FROM Salaries;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM Employees e
JOIN Departments d
ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id = s.employee_id;

SELECT e.first_name, e.last_name, s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id = s.employee_id
ORDER BY s.salary_amount DESC
LIMIT 1;

SELECT DISTINCT salary_amount
FROM Salaries
ORDER BY salary_amount DESC
LIMIT 1 OFFSET 1;

SELECT e.first_name, e.last_name, s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id=s.employee_id
ORDER BY s.salary_amount DESC
LIMIT 5;

SELECT AVG(salary_amount) AS Average_Salary
FROM Salaries;

SELECT e.first_name, e.last_name, s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id=s.employee_id
WHERE s.salary_amount >
(
SELECT AVG(salary_amount)
FROM Salaries
);

SELECT d.department_name,
COUNT(e.employee_id) AS Total_Employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

SELECT d.department_name,
AVG(s.salary_amount) AS Avg_Salary
FROM Departments d
JOIN Employees e
ON d.department_id=e.department_id
JOIN Salaries s
ON e.employee_id=s.employee_id
GROUP BY d.department_name;

SELECT d.department_name,
AVG(s.salary_amount) AS Avg_Salary
FROM Departments d
JOIN Employees e
ON d.department_id=e.department_id
JOIN Salaries s
ON e.employee_id=s.employee_id
GROUP BY d.department_name
ORDER BY Avg_Salary DESC
LIMIT 1;

SELECT employee_id,
COUNT(project_id) AS Total_Projects
FROM Employee_Projects
GROUP BY employee_id
HAVING COUNT(project_id)>1;

SELECT e.first_name,
p.project_name,
ep.role
FROM Employee_Projects ep
JOIN Employees e
ON ep.employee_id=e.employee_id
JOIN Projects p
ON ep.project_id=p.project_id;

SELECT *
FROM Projects
ORDER BY budget DESC
LIMIT 1;

SELECT SUM(budget)
FROM Projects;

SELECT p.project_name,
COUNT(ep.employee_id)
FROM Projects p
LEFT JOIN Employee_Projects ep
ON p.project_id=ep.project_id
GROUP BY p.project_name;

SELECT first_name,last_name
FROM Employees
WHERE employee_id NOT IN
(
SELECT employee_id
FROM Employee_Projects
);

SELECT project_name
FROM Projects
WHERE project_id NOT IN
(
SELECT project_id
FROM Employee_Projects
);

SELECT employee_id,
salary_amount,
RANK() OVER(ORDER BY salary_amount DESC) AS Salary_Rank
FROM Salaries;

SELECT employee_id,
salary_amount,
DENSE_RANK() OVER(ORDER BY salary_amount DESC) AS Salary_Rank
FROM Salaries;

SELECT employee_id,
salary_amount,
ROW_NUMBER() OVER(ORDER BY salary_amount DESC) AS Row_No
FROM Salaries;

CREATE VIEW EmployeeSalary AS
SELECT e.employee_id, e.first_name, e.last_name, s.salary_amount
FROM Employees e
JOIN Salaries s
ON e.employee_id = s.employee_id;

DELIMITER $$

CREATE PROCEDURE GetEmployeeByDepartment(IN dept INT)
BEGIN
SELECT *
FROM Employees
WHERE department_id = dept;
END $$

DELIMITER ;
CALL GetEmployeeByDepartment(3);

DELIMITER $$

CREATE TRIGGER CheckSalary
BEFORE INSERT ON Salaries
FOR EACH ROW
BEGIN
IF NEW.salary_amount < 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Salary cannot be negative';
END IF;
END $$

DELIMITER ;

INSERT INTO Salaries
VALUES (21,101,-5000,'2025-07-01');



