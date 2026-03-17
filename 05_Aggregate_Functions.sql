-- ********************************************************
--                   Aggregate Functins                   
-- ********************************************************

-- -------------------------------------------------------
-- CREATING TABLE
-- -------------------------------------------------------
CREATE TABLE supermarket_sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    city VARCHAR(30),
    sale_date DATE
);

/* ------------------------------------------------------
INSERTING DATA INTO THE TABLE
-------------------------------------------------------*/
INSERT INTO supermarket_sales VALUES
(1, 'Rice',       'Grocery', 5, 60,  'Bangalore', '2025-02-01'),
(2, 'Wheat',      'Grocery', 3, 50,  'Chennai',   '2025-02-01'),
(3, 'Milk',       'Dairy',   10, 25, 'Bangalore', '2025-02-02'),
(4, 'Cheese',     'Dairy',   2, 120, 'Mumbai',    '2025-02-02'),
(5, 'Soap',       'Daily',   6, 40,  'Hyderabad', '2025-02-03'),
(6, 'Shampoo',    'Daily',   4, 180, 'Chennai',   '2025-02-03'),
(7, 'Rice',       'Grocery', 8, 60,  'Mumbai',    '2025-02-04'),
(8, 'Milk',       'Dairy',   6, 25,  'Hyderabad', '2025-02-04'),
(9, 'Soap',       'Daily',   3, 40,  'Bangalore', '2025-02-05'),
(10,'Cheese',     'Dairy',   1, 120, 'Chennai',   '2025-02-05');


-- -----------------------------------------------------------
-- QURIES FOR REAL WORLD PROBLEMS
-- -----------------------------------------------------------

-- “How many total sales transactions happened in the system?”
SELECT * FROM supermarket_sales;

SELECT COUNT(sale_id) AS 'Total_ transaction'
FROM supermarket_sales;

-- 2. “What is the total quantity of items sold?”
SELECT SUM(quantity) as total_quantity
FROM supermarket_sales;

-- 3. “What is the total revenue generated from all sales?”
SELECT SUM(price*quantity) as 'Total_Revenue'
FROM supermarket_sales;

-- 4. "“What is the average price of products in the Dairy category?”
SELECT AVG(price) as 'Avg price of dairy'
FROM supermarket_sales
WHERE category = 'Dairy';

-- 5. “What is the highest product price in the table?”
SELECT MAX(price) as 'Highest_product_price'
FROM supermarket_sales;

-- 6. “Show total quantity sold for each category.”
SELECT category, SUM(quantity) as 'total quantity'
FROM supermarket_sales
GROUP BY category;  -- I HAVE GIVEN MORE QUESTION ON GROUP BY CLAUSE FILE VISIT ON MY GITHUB

/* 7. “Management wants to know the lowest price at which any product was sold in our store.
 Get the minimum price from the sales table.” */
 
 SELECT MIN(price) AS 'lowest price'
 FROM supermarket_sales;
 
 -- 8. We need to check the smallest quantity ever sold in a single order. Show the minimum quantity ordered by any customer.”
 SELECT MIN(quantity) AS 'lowest_quantity'
 FROM supermarket_sales;

                  

