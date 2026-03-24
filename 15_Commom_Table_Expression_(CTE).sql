-- *************************************************************************
--                   COMMON TABLE EXPRESSION (CTE)
-- *************************************************************************


-- --------------------------------------
--           CREATING TABLE
-- --------------------------------------
CREATE TABLE employee_sales (
    emp_id INT,
    emp_name VARCHAR(50),
    dept VARCHAR(50),
    city VARCHAR(50),
    sales INT
);
-- ---------------------------------------


-- ----------------------------------------
--           INSERTING DATA
-- ----------------------------------------
INSERT INTO employee_sales VALUES
(1,'Ravi','IT','Bangalore',50000),
(2,'Anita','IT','Bangalore',70000),
(3,'John','HR','Hyderabad',40000),
(4,'Meena','HR','Hyderabad',65000),
(5,'Kiran','Sales','Chennai',55000),
(6,'Sara','Sales','Chennai',90000),
(7,'David','Finance','Bangalore',30000),
(8,'Priya','Finance','Hyderabad',85000),
(9,'Arun','IT','Chennai',45000),
(10,'Neha','Sales','Bangalore',70000),
(11,'Ramesh','Sales','Hyderabad',60000),
(12,'Sita','Finance','Chennai',75000),
(13,'Kumar','IT','Bangalore',52000),
(14,'Pooja','HR','Chennai',48000),
(15,'Rahul','Finance','Hyderabad',62000);
-- ------------------------------------------




-- ---------------------------------------------------------
-- Practice problems on CTE
-- ---------------------------------------------------------

-- 1.Create CTE to show total sales per department
	 WITH sales_by_dept AS 
		( 
          SELECT dept, SUM(sales) AS total_sales
          FROM employee_sales
          GROUP BY dept
          )
	  SELECT * FROM sales_by_dept;

-- 2.Create CTE to show average sales per city
	 WITH avg_sales AS
		( 
			SELECT city, ROUND(AVG(sales))
            FROM employee_sales
            GROUP BY city )
	 SELECT * FROM avg_sales;

-- 3.Use CTE to rank employees by sales
	 WITH emp_rank AS
		(
          SELECT emp_name, dept, sales,
          RANK() OVER(ORDER BY sales DESC) AS emp_rank
          FROM employee_sales
          )
	 SELECT * FROM emp_rank;

-- 4.Use CTE to rank employees inside department
	 WITH rank_dept AS
		(
		  SELECT emp_name, dept, sales,
          RANK() OVER(PARTITION BY dept ORDER BY sales DESC)
          AS rank_sales
          FROM employee_sales
		 )
	 SELECT * FROM rank_dept;

-- 5.Use CTE to find top 1 employee in each department
	 WITH top_emp AS
		(
          SELECT emp_name, dept, sales, 
          RANK() OVER(PARTITION BY dept ORDER BY sales DESC) AS 'rnk'
          FROM employee_sales
		)
	 SELECT * FROM top_emp
     WHERE rnk = 1;

-- 6.Use CTE to find employees with sales greater than average sales
	 WITH sal AS
		(
		  SELECT emp_name, sales, AVG(sales) 
          over() AS avg_sales
          FROM employee_sales
		)
	 SELECT * FROM SAL
     WHERE sales > avg_sales;
     
-- 7.Use CTE to calculate running total of sales
	 WITH sale AS
		( 
          SELECT *,
          SUM(SALES) OVER(ORDER BY emp_id)
          AS running_total
          FROM employee_sales
		)
	 SELECT * FROM sale;

-- 8.Use CTE to find highest sales per city
	 WITH high_sale AS
		(
          SELECt city, sales,
          
          DENSE_RANK() OVER(PARTITION BY city ORDER BY sales DESC) as max_sal
          FROM employee_sales
		)
	  SELECT *
      FROM high_sale
      WHERE max_sal = 1;

-- 9. Use CTE to find employees whose sales < department average
	 WITH sal_avg AS
		(
          SELECT emp_name, dept,sales, AVG(sales)
          OVER(PARTITION BY dept) AS AVG_SALES
          FROM employee_sales
		) 
	 SELECT emp_name,dept, sales, avg_sales
     FROM sal_avg 
     WHERE sales > avg_sales;

-- 10.Use CTE to find top 2 sales in each department
	WITH top_2 AS
		(
          SELECT dept, sales, 
          RANK() OVER(PARTITION BY dept ORDER BY sales DESC) as sale
          FROM employee_sales
		)
	SELECT dept, sales, sale
    FROM top_2
    WHERE sale in (1, 2);

-- 11.Use CTE to show department total and employee sales together
	WITH total_sale AS
		(
          SELECT emp_name, dept, sales, SUM(sales)
          OVER(PARTITION BY dept) as dept_toal
          FROM employee_sales
		)
	SELECT * FROM total_sale;
    
-- 12.Use CTE to show difference between employee sales and dept avg
	 WITH sale_diff AS
		(
           SELECT emp_name, sales, AVG(sales)
           OVER(PARTITION BY dept) as dept_avg
           FROM employee_sales
		)
	 SELECT *,ROUND(dept_avg - sales) as difference
     FROM sale_diff;

-- 13.Use CTE to show top cities by total_sale
	 WITH city_rank AS
		(
          SELECT city, sales,
          RANK() OVER(PARTITION BY city ORDER BY SALES) as 'rnk'
          FROM employee_sales
		)
	 SELECT city, sum(sales) as total_sales,
     rank() over(ORDER BY sum(sales) desc) as rank_num
     FROM city_rank
     GROUP BY city;

-- 14. Use CTE to show highest sales employee overall
	 WITH high_sale AS
		 (
          SELECT emp_name, sales,
          rank() OVER(ORDER BY sales desc) as rnk
          FROM employee_sales
		 )
	 SELECT * FROM high_sale
     WHERE rnk = 1;


     