-- ***********************************************************************
-- 									SUBQUERIES
-- ***********************************************************************

-- -----------------------------------------------------------------
-- CREATING TABLE
-- -----------------------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50),
    amount INT
);
----------------------------------------------------------------------


-- -----------------------------------------------------------------
-- INSERTING DATA INTO THE TABLE
-- -----------------------------------------------------------------
INSERT INTO customers VALUES
(1, 'Ravi', 'Bangalore'),
(2, 'Anita', 'Chennai'),
(3, 'Suresh', 'Mumbai'),
(4, 'Meena', 'Hyderabad'),
(5, 'Arjun', 'Bangalore');

INSERT INTO orders VALUES
(101, 1, 'Laptop', 60000),
(102, 2, 'Mobile', 20000),
(103, 1, 'Tablet', 25000),
(104, 3, 'Laptop', 65000),
(105, 4, 'Headphones', 5000),
(106, 2, 'Mobile', 18000),
(107, 6, 'Camera', 30000);
-- -------------------------------------------------------------------



-- ======================================================================
-- Queries for real world problems
-- =====================================================================

-- 1. “Show customers who placed the order with amount 65000.”
	SELECT * FROM 
    customers
    WHERE customer_id = 
			(SELECT customer_id
             FROM orders
             WHERE amount = 65000);
	 
     -- (or) WE CAN ALSO RETRIVE USING JOIN (JUST FOR KNOWLEDGE)
     
     SELECT c.customer_name, o.amount 
     FROM customers c
     LEFT JOIN orders o
     ON 
     c.customer_id = o.customer_id
     WHERE o.amount = 65000;


-- 2. “Show customers who have placed at least one order.”
SELECT customer_name
FROM customers
WHERE customer_id IN (
	SELECT customer_id
    FROM orders);
    

-- 3. “Show customers who never placed any order.”
	SELECT customer_name
	FROM customers
		WHERE customer_id NOT IN (
		SELECT customer_id
		FROM orders);

-- 4. “Show orders where amount is greater than average order amount.”
	SELECT *
    FROM orders
    WHERE amount > (
		SELECT AVG(amount)
        FROM orders); 

-- 5. “Show order having highest amount.”
	SELECT *
    FROM orders
	WHERE amount = 
		(SELECT MAX(amount)
        FROM orders);
        
-- 6. “Show order having lowest amount.”
	SELECT *
    FROM orders
	WHERE amount = 
		(SELECT MIN(amount)
        FROM orders);
        
-- 7. “Show average order amount for each customer, then show only customers whose average > 30000.”
		SELECT customer_id, AVG(amount) AS avg_amount
		FROM orders
		GROUP BY customer_id;
        
	SELECT customer_id, AVG(amount) AS avg_amount
	FROM orders
	GROUP BY customer_id
	HAVING AVG(amount) >
	(
		SELECT AVG(amount)
		FROM orders
	);

-- 8. “Show orders whose amount is greater than all Mobile orders.”
	  SELECT * 
      FROM orders
      WHERE amount > (SELECT SUM(amount)
						FROM orders
						WHERE product_name = 'Mobile');
                        

-- 9. “Show customers who have orders in the orders table.”
		SELECT customer_name
        FROM customers
        WHERE customer_id IN (
				SELECT customer_id 
                FROM orders);
                
                
-- 10. “Show customers whose total order amount is greater than overall average order amount.”
		SELECT customer_id, SUM(amount) AS 'total_amount'
        FROM orders
        GROUP BY customer_id
        HAVING SUM(amount) > (
			SELECT AVG(amount)
			FROM orders
            );
            
SELECT * FROM customers;
SELECT * FROM ORDERS;
