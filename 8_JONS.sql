
-- ********************************************************************************
-- 								SQL JOINS 
-- ********************************************************************************


-- ----------------------------------------------------------
-- CREATING TABLES
-- ---------------------------------------------------------

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);

-- -------------------------------------------------------------
-- INSERTING DATA 
-- -------------------------------------------------------------
INSERT INTO employees VALUES
(1, 'Ravi', 101, NULL, 60000),
(2, 'Anita', 102, 1, 50000),
(3, 'Suresh', 101, 1, 65000),
(4, 'Meena', 103, 2, 55000),
(5, 'Arjun', NULL, 2, 45000),
(6, 'Neha', 104, 3, 70000);

INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(105, 'Marketing');


INSERT INTO projects VALUES
(1, 1, 'Website'),
(2, 2, 'Recruitment'),
(3, 3, 'App'),
(4, 7, 'Testing');

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM projects;

-- ==============================================================
-- Queries for real world problems
-- ==============================================================

-- 1. “Show employee names with their department names.”
	
    SELECT e.emp_name, d.dept_name
	FROM employees e
    INNER JOIN departments d      
    ON
    e.dept_id = d.dept_id;
    
-- 2. “Show employees who have projects assigned.”	
	SELECT e.emp_name, p.project_name
    FROM employees e
    INNER JOIN projects p				
    ON
    e.emp_id = p.emp_id;
    
-- 3. “Show all employees and their department names, even if department is missing.”
	SELECT e.emp_name, d.dept_name
    FROM employees e
    LEFT JOIN departments d 	
    ON
    e.dept_id = d.dept_id;
    
-- 4. “Show all employees and their projects, including employees without projects.”
	SELECT e.emp_name, p.project_name
    FROM employees e
    LEFT JOIN projects p		
    ON
    e.emp_id = p.emp_id;
    
-- 5. “Show all departments and employees working in them, including departments without employees.”
	SELECT d.dept_name, e.emp_name
    FROM departments d
    LEFT JOIN employees e				
    ON 
    d.dept_id = e.dept_id;
    
-- 6. “Show all projects with employee names, including projects with no employee.”
	SELECT p.project_name, e.emp_name
    FROM projects p
    LEFT JOIN employees e
    ON
    p.emp_id = e. emp_id;

-- 7. “Show all employees and all departments, including unmatched records.”
	SELECT e.emp_id, e.emp_name, d.dept_name
	FROM employees e
	LEFT JOIN departments d
	ON e.dept_id = d.dept_id

	UNION

	SELECT e.emp_id, e.emp_name, d.dept_name
	FROM employees e
	RIGHT JOIN departments d
	ON e.dept_id = d.dept_id;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM projects;

-- 8. “Show employees who are not assigned to any department.”
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
    
-- 9. “Show departments where no employee is working.”
	SELECT d.dept_id, d.dept_name
    FROM departments d
    LEFT JOIN employees e
    ON d.dept_id = e.dept_id
    WHERE e.emp_name IS NULL;

-- 10. “Show records where employee and department do not match.”
	SELECT e.emp_name, d.dept_name
    FROM employees e
    LEFT JOIN departments d
    ON e.dept_id = d.dept_id
    WHERE e.dept_id IS NULL
     UNION
    SELECT e.emp_name, d.dept_name
    FROM employees e
    RIGHT JOIN departments  d
    ON e.dept_id = d.dept_id
    WHERE e.emp_id IS NULL;
    
-- 11. “Show employee name with their manager name.”
	 SELECT a.emp_name, b.emp_name as 'manager_name'
     FROM employees a
     JOIN employees b
     ON a.manager_id = b.emp_id;

-- +++++++++++ thank you ++++++++++++++++++++++++++++++
