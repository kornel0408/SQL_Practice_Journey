-- **************************************************************************************
--                         ORDER BY AND LIMIT CLAUSE
-- **************************************************************************************

-- CRATING TABLE
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    experience_years INT,
    city VARCHAR(30),
    joining_date DATE
);

-- INSERTING DATA
INSERT INTO employees VALUES
(1, 'Ravi',   'IT',        85000, 5,  'Bangalore', '2019-06-15'),
(2, 'Anita',  'HR',        60000, 4,  'Chennai',   '2020-03-10'),
(3, 'Suresh', 'IT',        95000, 7,  'Hyderabad', '2018-11-20'),
(4, 'Meena',  'Finance',   70000, 6,  'Mumbai',    '2017-01-05'),
(5, 'Arjun',  'Marketing', 55000, 3,  'Bangalore', '2021-07-01'),
(6, 'Neha',   'IT',       120000,10,  'Pune',      '2015-09-12'),
(7, 'Rahul',  'Finance',   80000, 5,  'Chennai',   '2019-12-25'),
(8, 'Pooja',  'HR',        65000, 4,  'Hyderabad', '2020-08-18'),
(9, 'Amit',   'Marketing', 72000, 6,  'Mumbai',    '2018-04-30'),
(10,'Sneha',  'IT',        90000, 6,  'Bangalore', '2019-02-14');

SELECT * FROM employees;

-- Q1 “I need to know who our top earners are. Give me the top 3 highest-paid employees right now.”
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Q2 “Show me the employees who are paid the least. I want to review the bottom 2 salaries.”
SELECT emp_name, salary
FROM employees
ORDER BY salary ASC
LIMIT 2;

-- Q3 “Who are our most experienced people? List the top 5 employees based on experience.”
SELECT emp_name, experience_years
FROM employees
ORDER BY experience_years DESC
LIMIT 5;

-- Q4 “Management wants to see the earliest joiners. Can you pull the first 4 employees who joined the company?”
SELECT emp_name, joining_date
FROM employees
ORDER BY joining_date ASC
LIMIT 4;

-- Q5 “For budget planning, sort all employees by salary from highest to lowest and share the list.”
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC;

-- Q6 “In the IT department, who are the highest paid? Give me the top 3 IT employees by salary.”
SELECT emp_name,department, salary
FROM employees
WHERE department = "IT"
ORDER BY salary DESC
LIMIT 3;

-- Q7 “I want to quickly review recent hires. Show me the latest 5 employees who joined.”
SELECT emp_name, joining_date
FROM employees
ORDER BY joining_date DESC
LIMIT 5;

-- Q8 “HR asked for a clean report. Sort employees department-wise and within each department show higher salaries first.”
SELECT emp_name, department, salary
FROM employees
ORDER BY department, salary DESC;
