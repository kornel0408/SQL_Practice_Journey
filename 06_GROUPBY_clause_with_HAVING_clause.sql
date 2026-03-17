-- ********************************************************************************
--                             GROUP BY AND HAVING CLAUSE                         
-- ********************************************************************************

-- ------------------------------------------------------------------------
-- CREATING TABLE
-- ------------------------------------------------------------------------
CREATE TABLE restaurant_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    food_item VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price INT,
    city VARCHAR(30),
    order_date DATE
);

-- ----------------------------------------------------------------------
--                  INSERTING DATA
-- ----------------------------------------------------------------------
 INSERT INTO restaurant_orders VALUES
(1, 'Ravi',   'Pizza',    'FastFood', 2, 300, 'Bangalore', '2025-03-01'),
(2, 'Anita',  'Burger',   'FastFood', 1, 150, 'Chennai',   '2025-03-01'),
(3, 'Suresh', 'Biryani',  'MainCourse', 3, 250, 'Hyderabad', '2025-03-02'),
(4, 'Meena',  'Dosa',     'SouthIndian', 4, 80, 'Bangalore', '2025-03-02'),
(5, 'Arjun',  'Pizza',    'FastFood', 1, 300, 'Mumbai', '2025-03-03'),
(6, 'Neha',   'Idli',     'SouthIndian', 5, 50, 'Chennai', '2025-03-03'),
(7, 'Rahul',  'Biryani',  'MainCourse', 2, 250, 'Bangalore', '2025-03-04'),
(8, 'Pooja',  'Burger',   'FastFood', 3, 150, 'Hyderabad', '2025-03-04'),
(9, 'Amit',   'Dosa',     'SouthIndian', 2, 80, 'Mumbai', '2025-03-05'),
(10,'Sneha',  'Pizza',    'FastFood', 4, 300, 'Bangalore', '2025-03-05');


-- =======================================================================
-- QUERIES FOR SOME REAL WORLD PROBLEMS
-- =======================================================================

-- 1. “Show total quantity ordered for each food category.”
SELECT category, SUM(quantity) AS 'Total_Quantity'
FROM restaurant_orders
GROUP BY category;

-- 2.“Give total number of orders placed in each city.”
SELECT city, SUM(order_id) AS 'total_orders'
FROM restaurant_orders
GROUP BY city;

-- 3.“Find total revenue generated for each food item.”
SELECT food_item, SUM(price*quantity) as 'total revenue'
FROM restaurant_orders
GROUP BY food_item;

-- 4.“Show average price of food items in each category.”
SELECT food_item, AVG(price) as 'Average price'
FROM restaurant_orders
GROUP BY food_item;

-- 5. Show total quantity ordered by each customer.”
SELECT customer_name, SUM(quantity) as 'total quantity'
FROM restaurant_orders
GROUP BY customer_name;

-- 6. “Show categories where total quantity ordered is more than 5.”
SELECT category, SUM(quantity) AS 'total quantity'
FROM restaurant_orders
GROUP BY category
HAVING SUM(quantity) > 5;

-- 7. “Show cities where more than 2 orders were placed.”
SELECT city, COUNT(order_id) as total_orders
FROM restaurant_orders
GROUP BY city
HAVING COUNT(order_id) > 2;

-- “Find food items where total revenue is greater than 1000.”
SELECT food_item, SUM(price*quantity) AS total_revenue
FROM restaurant_orders
GROUP BY food_item
HAVING SUM(price*quantity)>1000;

-- 9. “Show customers who ordered more than 4 items in total.”
SELECT customer_name, SUM(quantity) as total_items
FROM restaurant_orders
GROUP BY customer_name
HAVING SUM(quantity) > 4;

-- 10. “Show categories where average price is greater than 150.”
SELECT category, AVG(price) as average_price
FROM restaurant_orders
GROUP BY category
HAVING AVG(price) > 150;

/* 11. “Show total quantity ordered for each category, but only for orders from Bangalore, and 
		display only categories where total quantity is more than 3.” */
        
SELECT city,category, SUM(quantity) as toal_quantity
FROM restaurant_orders
WHERE city = "Bangalore"
GROUP BY category
HAVING SUM(quantity) > 3;

-- 12, “Find total revenue for each food item, but consider only orders where price is greater than 100, 
--      and show only items where total revenue is more than 500.”\

SELECT food_item, SUM(price*quantity) as tota_revenue
FROM restaurant_orders
WHERE price > 100
GROUP BY food_item
HAVING SUM(price*quantity) > 500;

