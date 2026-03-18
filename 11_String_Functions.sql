-- ******************************************************
-- 			STRING FUNCTIONS
-- ******************************************************


-- ---------------------------------
-- CREATING TABLE
-- ---------------------------------
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    email VARCHAR(50),
    city VARCHAR(50)
);
-- ----------------------------------


-- --------------------------------------------------
--     INSERTING DATA
-- --------------------------------------------------
INSERT INTO employees VALUES
(1, ' Ravi Kumar ', 'ravi@gmail.com', 'Bangalore'),
(2, 'Anita Sharma', 'ANITA@GMAIL.COM', 'Chennai'),
(3, 'suresh reddy', 'suresh@yahoo.com', 'Mumbai'),
(4, 'Meena  Das', 'meena@gmail.com', 'Hyderabad'),
(5, 'Arjun', 'arjun@outlook.com', 'Delhi'),
(6, 'Neha Singh', 'NEHA@GMAIL.COM', 'Bangalore');
-- --------------------------------------------------



-- ========================================================
--       Queries for real world problems
-- =========================================================

-- 1.Convert all employee names to UPPERCASE
	SELECT emp_name, upper(emp_name)
    FROM employees;
    
-- 2.Convert all emails to lowercase
	SELECT email, LOWER(email)
    FROM employees;
    
-- 3.Find length of each employee name 
	SELECT emp_name, LENGTH(emp_name) 
    FROM employees;
    
-- 4.Show employee name and city in one column
	SELECT emp_name, city, CONCAT(emp_name," - ", city) AS name_with_city
    FROM employees;

-- 5.Remove extra spaces from employee names
	SELECT emp_name, trim(emp_name)
    FROM employees;
    
    
-- 6.Show first 4 letters of employee name
	SELECT emp_name, LEFT(emp_name, 4) AS first_four_lett
    FROM employees;
    
-- 7.Show last 3 letters of city
	SELECT city, right(city, 3)
    FROM employees;
    
-- 8.Show first 2 letters of city
	SELECT city, left(city, 2)
    FROM employees;

-- 9.Replace gmail.com with company.com in email
	SELECT email,
	REPLACE(email, 'gmail.com', 'company.com') AS new_email
	FROM employees;
    
-- 10.Find position of '@' in email
	SELECT email, instr(email,'@')
    FROM employees;
    
-- 11.Show names without spaces at beginning
	SELECT emp_name, 
    ltrim(emp_name) AS cleaned_name
    FROM employees;

-- 12.Show names without spaces at end
	SELECT emp_name, 
    rtrim(emp_name) AS cleaned_name
    FROM employees;

-- 13.Show name in this format RAVI_KUMAR
	SELECT emp_name, 
    replace(UPPER(TRIM(emp_name))," ", "_")
    FROM employees;
    
-- 14.Show only first name
	SELECT emp_name, 
    substring(ltrim(emp_name),1,instr(ltrim(emp_name), " ")) AS first_name
    FROM employees;

/* 15. Show domain of email
Example:ravi@gmail.com → gmail.com */

SELECT email,
substr(email,instr(email, '@') + 1, length(email)) AS domain_name
FROM employees;
	