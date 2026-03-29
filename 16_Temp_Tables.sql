-- **********************************************************
-- 							TEMP TABLES
-- *********************************************************** 


-- ---------------------------------------
-- CREATING TABLE 
-- ---------------------------------------
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    amount INT
);


-- ------------------------------------------------------
--   INSETING DATA INTO THE TABLE
-- ------------------------------------------------------
INSERT INTO orders VALUES
(1,'Ravi','Bangalore','Laptop','Electronics',50000),
(2,'Anita','Bangalore','Mouse','Electronics',1000),
(3,'John','Hyderabad','Chair','Furniture',7000),
(4,'Meena','Hyderabad','Table','Furniture',12000),
(5,'Kiran','Chennai','Mobile','Electronics',20000),
(6,'Sara','Chennai','Sofa','Furniture',30000),
(7,'David','Bangalore','Keyboard','Electronics',1500),
(8,'Priya','Hyderabad','Bed','Furniture',25000),
(9,'Arun','Chennai','TV','Electronics',40000),
(10,'Neha','Bangalore','Cupboard','Furniture',18000),
(11,'Ravi','Hyderabad','Laptop','Electronics',52000),
(12,'Anita','Chennai','Chair','Furniture',8000),
(13,'John','Bangalore','Mobile','Electronics',22000),
(14,'Meena','Chennai','Table','Furniture',15000),
(15,'Kiran','Hyderabad','TV','Electronics',42000);
-- --------------------------------------------------------




-- ============================================================
-- PRACTICE PROBLEMS ON TEMP TABLES
-- ============================================================

-- 1.Create temp table with all orders.
	 CREATE TEMPORARY TABLE all_orders
		SELECT * FROM orders;
	
     SELECT * FROM all_orders;

-- 2.Create temp table with only Electronics category.
	 CREATE TEMPORARY TABLE Electronics_sales
		SELECT * 
		from orders
        WHERE category = "Electronics";
	 
     SELECT * FROM Electronics_sales;

-- 3.Create temp table with orders amount > 20000
	 CREATE TEMPORARY TABLE orders_greater_than_2000
		SELECT * 
        FROM orders
        WHERE amount > 2000;
	
     SELECT * FROM orders_greater_than_2000;

-- 4. Create temp table with total sales per city
	 CREATE TEMPORARY TABLE total_sales_city
		SELECT city, SUM(amount) as total_sales
		FROM orders
        GROUP BY city;
	
     SELECT * FROM total_sales_city;

-- 5.Create temp table with total sales per category
	 
	 CREATE TEMPORARY TABLE total_sales_category
		SELECT category, SUM(amount) as total_sales
		FROM orders
        GROUP BY category;
	 SELECT * FROM total_sales_category;

-- 6.Create temp table with rank by amount
	 CREATE TEMPORARY TABLE rank_by_amount
		SELECT *, 
        RANK() OVER(ORDER BY AMOUNT DESC) AS 'rnk'
        FROM orders;
	
    SELECT * FROM rank_by_amount;

-- 7.Create temp table with running total of amount
	 CREATE TEMPORARY TABLE running_total2
		SELECT order_id, product, amount, sum(amount)
        OVER(ORDER BY order_id) as rnng_total
        FROM orders;
        
	 SELECT * FROM running_total2;

-- 8.Create temp table with city average sales
	 CREATE TEMPORARY TABLE city_avg_sales
		SELECT city, AVG(amount) as average_sales
        FROM orders
        GROUP BY city;
	
     SELECT * FROM city_avg_sales;

-- 9.Create temp table with orders greater than avg amount
	 CREATE TEMPORARY TABLE top_2_orders
		SELECT * 
        FROM orders
        ORDER BY amount DESC
        LIMIT 2;
	 
     SELECT * FROM top_2_orders;
     
-- 10.Create temp table with category wise ranking
	 CREATE TEMPORARY TABLE rank_by_ctgry
		SELECT product, category, amount,
        RANK() OVER(PARTITION BY category ORDER BY amount DESC) AS rnk
        FROM orders;
	
    SELECT * FROM rank_by_ctgry;

-- 11.Create temp table with total sales per customer
	 CREATE TEMPORARY TABLE sales_per_customer
		SELECT customer_name, SUM(amount) as 'total_sales'
        FROM orders
        GROUP BY customer_name;
	 
     SELECT * FROM sales_per_customer;

-- 12.Create temp table with highest order per city
	 CREATE TEMPORARY TABLE highest_order_per_city
		Select city, MIN(amount)
        OVER(PARTITION BY city) AS 'highest_order'
        FROM orders;
	 
     SELECT city, MAX(highest_order) as top_order
     FROM highest_order_per_city
     GROUP BY city;

-- 13.Create temp table with difference between order and avg
	 CREATE TEMPORARY TABLE difference
         SELECT order_id, amount, avg(amount)
		 OVER() as average_amount
		 FROM orders;
     
	 SELECT *,
     round(average_amount - amount) as diff
     FROM difference;

-- 14.Create temp table with rank inside category and show rank <= 2
	 CREATE TEMPORARY TABLE category_rnk
		SELECT order_id, category, amount,
        RANK() OVER(PARTITION BY category ORDER BY AMOUNT DESC) AS rnk
        FROM orders;
	
     SELECT * FROM category_rnk
     WHERE rnk <=2;
