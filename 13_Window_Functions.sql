-- ************************************************************
-- 						WINDOW FUNCTIONS
-- *************************************************************


-- ---------------------------------------
-- CREATING TABLE
-- ---------------------------------------
	CREATE TABLE sales_data (
    order_id INT,
    order_date DATE,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    amount INT
);
-- ------------------------------------------


-- -------------------------------------------------------------------
-- 				 INSERTING DATA
-- -------------------------------------------------------------------
	INSERT INTO sales_data VALUES
(1,'2024-01-01','Ravi','Bangalore','Laptop','Electronics',50000),
(2,'2024-01-02','Anita','Bangalore','Mouse','Electronics',1000),
(3,'2024-01-03','John','Hyderabad','Chair','Furniture',7000),
(4,'2024-01-04','Meena','Hyderabad','Table','Furniture',12000),
(5,'2024-01-05','Kiran','Chennai','Mobile','Electronics',20000),
(6,'2024-01-06','Sara','Chennai','Sofa','Furniture',30000),
(7,'2024-01-07','David','Bangalore','Keyboard','Electronics',1500),
(8,'2024-01-08','Priya','Hyderabad','Bed','Furniture',25000),
(9,'2024-01-09','Arun','Chennai','TV','Electronics',40000),
(10,'2024-01-10','Neha','Bangalore','Cupboard','Furniture',18000),
(11,'2024-01-11','Ravi','Hyderabad','Laptop','Electronics',52000),
(12,'2024-01-12','Anita','Chennai','Chair','Furniture',8000),
(13,'2024-01-13','John','Bangalore','Mobile','Electronics',22000),
(14,'2024-01-14','Meena','Chennai','Table','Furniture',15000),
(15,'2024-01-15','Kiran','Hyderabad','TV','Electronics',42000);
-- ---------------------------------------------------------------------



-- =====================================================
--    practice questions with queries
-- =====================================================

-- 1. Add row number for all orders by amount descending
	SELECT *, 
    ROW_NUMBER() OVER(ORDER BY amount DESC ) 
    AS 'row_num'
    FROM sales_data;

-- 2.Rank orders by amount
	SELECT *,
	RANK() OVER(ORDER BY amount DESC) 
    AS rank_by_amount
    FROM sales_data;
    
-- 3.Dense rank orders by amount
    SELECT *,
    DENSE_RANK() OVER(ORDER BY amount DESC) 
    AS order_by_amount
    FROM sales_data;

-- 4.Rank orders inside each category
	SELECT product,category, amount,
    RANK() OVER(PARTITION BY category ORDER BY AMOUNT)
    AS orders_by_ctgry
    FROM sales_data;

-- 5.Rank orders inside each city
	SELECT *,
    RANK() OVER(PARTITION BY city ORDER BY amount DESC)
    AS rank_by_city
	FROM sales_data;

-- 6.Running total of amount by order_date
	SELECT order_id, customer_name, product, order_date, amount, SUM(amount)
    OVER(ORDER BY order_date) as rolling_total
    FROM sales_data;

-- 7.Total sales per category (without GROUP BY)
	SELECT order_id, product, category,amount,SUM(amount)
    OVER(PARTITION BY category ) as total_amount_by_category
    FROM sales_data;

-- 8.Average sales per city
	SELECT order_id, city,amount,AVG(amount)
    OVER(PARTITION BY city) AS Avg_amount_by_city
    FROM sales_data;

-- 9.Previous order amount
	SELECT order_id, order_date, product, amount,
	LAG(amount,1) OVER(ORDER BY order_date) AS previous_amount
	FROM sales_data;

-- 10.Next order amount
	SELECT order_id, order_date, product, amount,
	LEAD(amount,1) OVER(ORDER BY order_date) AS previous_amount
	FROM sales_data;

-- 11.Divide orders into 4 groups by amount
	SELECT order_id,product,category,amount,
	NTILE(4) OVER(ORDER BY amount DESC) AS group_no
	FROM sales_data;

