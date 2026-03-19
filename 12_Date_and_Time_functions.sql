-- *******************************************************************
--                  DATE AND TIME FUNCTIONS
-- *******************************************************************


-- -------------------------------------------------------
SELECT current_date();
SELECT current_time();
SELECT current_timestamp();
SELECT now();

SELECT time('2026-03-19 11:07:22');
SELECT date('2026-03-19 11:07:22');
SELECT second(current_timestamp());
SELECT minute(current_timestamp());
SELECT hour(current_timestamp());

SELECT day(current_timestamp());
SELECT month(current_timestamp());
SELECT year(current_timestamp());

SELECT extract(day from curdate());
SELECT extract(month from curdate());
SELECT extract(year from curdate());

SELECT extract(second from current_time());
SELECT extract(minute from current_time());
SELECT extract(hour from current_time());

SELECT date_add(current_date(), interval 1 day);
SELECT date_sub(current_date(), interval 1 year);
SELECT datediff(current_date(), '2023-03-19');
SELECT date_format(current_date, '%D %b %Y');
--  ---------------------------------------------------------



-- ------------------------------------------------------
--            CREATING TABLE
-- ------------------------------------------------------
	CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    order_amount INT,
    order_datetime DATETIME
);
-- ------------------------------------------------------



-- --------------------------------------------------------
-- INSERTING DATA
-- --------------------------------------------------------
INSERT INTO orders VALUES
(1, 'Ravi', 5000, '2026-03-15 10:15:20'),
(2, 'Anita', 7000, '2026-03-16 11:45:10'),
(3, 'Suresh', 8000, '2026-03-17 09:20:30'),
(4, 'Meena', 6000, '2026-03-17 14:05:40'),
(5, 'Arjun', 9000, '2025-12-25 18:30:25'),
(6, 'Neha', 10000, '2024-07-10 08:10:05');
-- -------------------------------------------------------


-- ===================================================
-- Queries for real world problems
-- ===================================================

-- 1.Show current date.
	SELECT curdate() AS today_date;
    
-- 2.Show current time.
	SELECT current_time();

-- 3.Show current timestamp.
	SELECT current_timestamp();
    
-- 4.Show only date from order_datetime.
	SELECT date(order_datetime) AS order_date
    FROM orders;

-- 5.Show only time from order_datetime.
	SELECT time(order_datetime) AS order_time
    FROM orders;


-- 6.Show order_id and order hour.
	SELECT order_id, hour(order_datetime) AS order_hour
    FROM orders;
    
-- 7.Show order_id and minute.
	SELECT order_id, MINUTE(order_datetime) AS order_Minute
    FROM orders;

-- 8.Show order_id and minute.
	SELECT order_id, second(order_datetime) AS order_second
    FROM orders;
    
-- 9.Show day of order.
	SELECT day(order_datetime) AS ORDER_DAY
    FROM orders;
    
-- 10.Show MONTH of order.
	SELECT month(order_datetime) AS ORDER_MONTH
    FROM orders;
    
-- 11.Show YEAR of order.
	SELECT year(order_datetime) AS ORDER_year
    FROM orders;

-- 12.Use extract to get day from order date.
	SELECT extract(day from order_datetime)
    FROM orders;

-- 13.Use extract to get month from order date.
	SELECT extract(month from order_datetime)
    FROM orders;

-- 14.Use extract to get year from order date.
	SELECT extract(year from order_datetime)
    FROM orders;

-- 15.Show orders placed after adding 1 day to current date.
	SELECT order_datetime,
    date_add(order_datetime, interval 1 day)
    as new_date
    FROM orders;

-- 16. Show date 1 year before today.
	SELECT order_datetime,
    date_sub(order_datetime, interval 1 day)
    as new_date
    FROM orders;
    
-- 17.Find how many days passed since order date.
	SELECT date(order_datetime) as 'DATE', 
    datediff(current_timestamp, order_datetime) as days_since_orderd
    FROM orders;

-- 18.Format order date like
	SELECT order_datetime, 
    date_format(order_datetime, '%D %b %Y') as Formated_date
    FROM orders;
    
-- 19. Show orders placed this year.
	SELECT *
    FROM orders
    WHERE YEAR(order_datetime) = '2026';

-- 20. Show orders placed this month.
	SELECT *
    FROM orders
    WHERE YEAR(order_datetime) = '2026' 
    AND MONTH(order_datetime) = '03' ;
    
-- 21 Show orders placed today.
	SELECT *
	FROM orders
    WHERE DATE(order_datetime) = current_date();
    
	