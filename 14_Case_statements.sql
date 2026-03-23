-- *******************************************************************
-- 							CASE STATEMENT
-- *******************************************************************


-- ----------------------------------------------------
-- CREATING TABLE
-- ----------------------------------------------------
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(50),
    salary INT,
    experience INT
);
-- ------------------------------------------------------



-- -------------------------------------------------------
-- INSERTING DATA INTO TABLE
-- -------------------------------------------------------
INSERT INTO employees VALUES
(1, 'Ravi', 'IT', 50000, 2),
(2, 'Anita', 'IT', 75000, 5),
(3, 'John', 'HR', 40000, 1),
(4, 'Meena', 'HR', 65000, 6),
(5, 'Kiran', 'Sales', 55000, 3),
(6, 'Sara', 'Sales', 90000, 8),
(7, 'David', 'Finance', 30000, 1),
(8, 'Priya', 'Finance', 85000, 7),
(9, 'Arun', 'IT', 45000, 2),
(10, 'Neha', 'Sales', 70000, 4);
-- -------------------------------------------------------




-- ===================================================================
--                       practice queries
-- ===================================================================

-- 1. Show employee name and salary level
	 SELECT emp_name, salary,
		 CASE 
			 WHEN salary >= 80000 THEN 'High'
			 WHEN salary >=60000 THEN 'Medium'
			 ELSE 'low'
		 END as 'Salary_level'
     FROM employees;


-- 2. Show employee name and experience level
	 SELECT emp_name, experience, 
		 CASE
			 WHEN experience>= 7 THEN "Senior"
			 WHEN experience>= 4 THEN "Mid"
			 ELSE "Junior"
		 END AS experience_level
     FROM employees;


-- 3. Show employee name and bonus
	 SELECT emp_name, salary, 
		CASE 
			WHEN salary >= 80000 THEN salary * 0.2
			WHEN salary >= 60000 THEN salary * 0.15
			ELSE salary * 0.1
        END as 'Bonus'
	FROM employees;


-- 4. Show employee name and department type
	 SELECT emp_name, dept, 
		CASE
			WHEN dept = 'IT' THEN 'Technical'
            WHEN dept = 'HR' THEN 'Management'
            WHEN dept = 'sales' THEN 'Marketing'
            WHEN dept = 'Finance' THEN 'Accounts'
		END AS department_type
	FROM employees;


-- 5.Show employee name and grade
	 SELECT emp_name, salary, 
		CASE	
			WHEN salary >=80000 THEN "A"
			WHEN salary >= 50000 THEN 'B'
			else 'C'
		END as sal_grade
	FROM employees;
    
    
-- 6. Show employee name and tax
	 SELECT emp_name, dept, salary, 
     CASE
		WHEN salary >= 80000 THEN salary * 0.3
        WHEN salary >= 60000 THEN salary * 0.2
        WHEN salary >= 40000 THEN salary * 0.1
        else salary * 5/100
	END AS tax
FROM employees;


-- 7.Show employee name and promotion status
	 SELECT emp_name,
		CASE
			WHEN experience >=6 THEN "Eligble"
            else "not eligeble"
		END AS promotion_status
	 FROM employees;


-- 8. Show employee name and salary after increment
	 SELECT emp_name, salary,
	 ROUND(CASE
		WHEN salary >= 80000 THEN salary + salary/100*10.
        WHEN salary >= 60000 THEN salary + salary/100*15.
        else salary + salary/100*25.
	 END )AS 
     sal_aft_inc
	 FROM employees;


        