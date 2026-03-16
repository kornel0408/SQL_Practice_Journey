-- ************************************************************
--                    VIEWS
-- ************************************************************

-- -----------------------------------------------------
-- CREATIN TABLES
-- -----------------------------------------------------
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    city VARCHAR(30)
);


CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);


CREATE TABLE orders (
    order_id INT,
    emp_id INT,
    amount INT
);

-- -------------------------------------------
-- INSERTING DATA 
-- -------------------------------------------
INSERT INTO employees VALUES
(1, 'Ravi', 101, 60000, 'Bangalore'),
(2, 'Anita', 102, 50000, 'Chennai'),
(3, 'Suresh', 101, 70000, 'Mumbai'),
(4, 'Meena', 103, 55000, 'Hyderabad'),
(5, 'Arjun', 104, 45000, 'Bangalore'),
(6, 'Neha', 101, 80000, 'Chennai');


INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');


INSERT INTO orders VALUES
(1, 1, 5000),
(2, 2, 7000),
(3, 1, 8000),
(4, 3, 10000),
(5, 6, 12000);


-- ===============================================================
-- 	Queries for some real world problems
-- ===============================================================

-- 1. Manager wants a simple list of employee names and salary. Create a view.

	CREATE VIEW emp_sal_view AS
    SELECT emp_name, salary
    FROM employees;

	SELECT * FROM emp_sal_view;

-- 2. HR wants to see only employees with salary > 60000.
	CREATE VIEW high_salary_view AS
    SELECT * FROM emp_sal_view 
    WHERE salary > 60000;
    
    SELECT* FROM
    high_salary_view;
    
-- 3. Company wants report with employee name and department name.
	CREATE VIEW emp_dept_view AS
    SELECT e.emp_name, d.dept_name
    FROM employees e
    INNER JOIN
    departments d
    ON
    e.dept_id = d.dept_id;
    
    SELECT * FROM emp_dept_view;
    
-- 4. Create a view to show employees working in IT department.
	 CREATE VIEW it_emp_view AS
     SELECT * FROM emp_dept_view
     WHERE dept_name = "IT";
     
     SELECT * FROM it_emp_view;
     
-- 5. Finance team wants total salary paid in each department.
	  CREATE VIEW dept_salary_view AS
      SELECT dept_name, SUM(salary) AS total_salary
      FROM employees e
      INNER JOIN 
      departments d
      ON e.dept_id = d.dept_id
      GROUP BY d.dept_name;
      
      SELECT * FROM dept_salary_view;
      
-- 6. Sales team wants employee name and order amount. create a view using employees + orders
	  CREATE VIEW emp_orders AS
      SELECT emp_name, amount
      FROM employees e
      INNER JOIN 
      orders o
      ON
      e.emp_id = o.emp_id;
      
      SELECT * FROM emp_orders;
      
-- 7. Create a view to show employees from Bangalore with salary > 50000.
	  CREATE VIEW bng_emp_hig_sal AS
      SELECT * 
      FROM employees
      WHERE city = "Bangalore" AND salary > 50000;
      
-- 8. Change high_salary_view to show salary > 70000.
	REPLACE high_salary_view 
    SELECT * FROM emp_sal_view 
    WHERE salary > 70000;
    
    SELECT* FROM
    high_salary_view;
    
-- 9. Delete emp_salary_view.
	DROP VIEW emp_sal_view;
    
-- 10. Create a report view with employee name, department name, salary, and order amount.
	 CREATE VIEW company_report_view AS
	 SELECT emp_name, dept_name, amount
     FROM employees e
     INNER JOIN 
     departments d
     ON
     e.dept_id = d.dept_id
     INNER JOIN 
     orders o 
     ON
     e.emp_id = o.emp_id;
     
     SELECT * FROM company_report_view
     