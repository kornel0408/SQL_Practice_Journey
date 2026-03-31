-- ********************************************************
--                  NULL FUNCTIONS
-- ********************************************************

-- --------------------------------
-- 		CREATING TABLE
-- --------------------------------
	CREATE TABLE employee_details (
		emp_id INT,
		emp_name VARCHAR(50),
		dept VARCHAR(50),
		salary INT,
		bonus INT,
		manager_id INT
	);
-- --------------------------------


-- -------------------------------------------------------------
--      Insert data (with NULL values)
-- -------------------------------------------------------------
	INSERT INTO employee_details VALUES
	(1,'Ravi','IT',50000,5000,101),
	(2,'Anita','IT',70000,NULL,101),
	(3,'John','HR',NULL,3000,102),
	(4,'Meena','HR',65000,NULL,NULL),
	(5,'Kiran','Sales',55000,2000,103),
	(6,'Sara','Sales',NULL,NULL,103),
	(7,'David','Finance',30000,1000,NULL),
	(8,'Priya','Finance',85000,NULL,104),
	(9,'Arun','IT',NULL,1500,101),
	(10,'Neha','Sales',70000,NULL,NULL);
    

-- ==========================================================
--       PRACTICE QUESTIONS
-- ==========================================================

-- 1.Show all employees with salary, replace NULL salary with 0
	 SELECT emp_name, IFNULL(salary, 0) as salary
     FROM employee_details;

-- 2.Show employee name and bonus, replace NULL bonus with 1000
	 SELECT emp_name, IFNULL(bonus,0) as bonus
     FROM employee_details;
     
-- 3.Show total income (salary + bonus)
	 SELECT coalesce(salary,0) + coalesce(bonus,0)
     as sal_with_bonus
     FROM employee_details;
     
-- 4.Show employees where salary is NULL
	 SELECT * from employee_details
     WHERE salary IS NULL;

-- 5.Show employees where bonus is NOT NULL
	 SELECT * from employee_details
     WHERE bonus IS NOT NULL;

-- 6.Show employee name and manager
-- If manager_id is NULL → show 'No Manager'
	 SELECT emp_name, IFNULL(manager_id, 'No Manager') 
     AS manager
	 FROM employee_details;

-- 7.Show employee salary, if NULL then use bonus, if bonus also NULL then 0
	 SELECT emp_name, coalesce(salary,bonus,0)
     FROM employee_details;

-- 8.Show average salary ignoring NULL (default behavior)
	 SELECT avg(salary) as avg_sal
     FROM employee_details;

-- 9.Show average including NULL as 0
	 SELECT avg(IFNULL(salary,0)) as avg_sal
     FROM employee_details;
     
-- 10.Show employee category
-- 	salary NULL → 'Missing Data'
-- 	salary < 50000 → 'Low'
-- 	salary >= 50000 → 'High'
	
    SELECT emp_name, salary, 
    CASE
		WHEN salary IS NULL THEN "Missing Data"
        WHEN salary < 50000 THEN "Low"
        WHEN salary >= 50000 THEN "High"
	END AS category
    FROM employee_details;

-- 11.Show employees where both salary and bonus are NULL
	 SELECT * 
     FROM employee_details
     WHERE salary IS NULL AND bonus IS NULL;

-- 12.Show employees where either salary or bonus is NULL
	 SELECT * 
     FROM employee_details
     WHERE salary IS NULL or bonus IS NULL;
     
-- 13.Show employee name and final salary:
-- if salary NULL → use dept average salary
-- if still NULL → 0

	SELECT emp_name,
       COALESCE(
           salary,
           AVG(salary) OVER (PARTITION BY dept),
           0
       ) AS final_salary
	FROM employee_details;