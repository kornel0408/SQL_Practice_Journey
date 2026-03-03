-- ************************************************************
--                 UPDATE AND DELETE COMMANDS
-- ************************************************************

-- CREATING TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_status VARCHAR(20),   -- Pending, Shipped, Delivered, Cancelled
    city VARCHAR(30),
    order_date DATE
);

-- INSERTING DATA
INSERT INTO orders VALUES
(101, 'Ravi',   'Laptop',      1, 55000, 'Pending',   'Bangalore', '2025-01-10'),
(102, 'Anita',  'Mobile',      2, 18000, 'Shipped',   'Chennai',   '2025-01-11'),
(103, 'Suresh', 'Headphones',  3, 2000,  'Delivered', 'Hyderabad', '2025-01-12'),
(104, 'Meena',  'Tablet',      1, 22000, 'Pending',   'Mumbai',    '2025-01-12'),
(105, 'Arjun',  'Camera',      1, 45000, 'Cancelled', 'Chennai',   '2025-01-13'),
(106, 'Neha',   'Smartwatch',  2, 12000, 'Shipped',   'Bangalore', '2025-01-14'),
(107, 'Rahul',  'Laptop',      1, 52000, 'Delivered', 'Pune',      '2025-01-15'),
(108, 'Pooja',  'Mobile',      1, 15000, 'Pending',   'Hyderabad', '2025-01-16');

SELECT * FROM orders;

/* NOTE: Before DELETE or UPDATE in real company
         SELECT * FROM orders WHERE condition; */
		

-- ==============================================================
--           UPDATE Based Real-World Problems
-- ==============================================================

-- “Order 101 has been shipped today. Update the order status.”
UPDATE orders 
SET order_status = "Shipped"
WHERE order_id = 101;

SELECT * FROM orders;

-- “All pending orders from Mumbai must be marked as ‘Shipped’.”
SELECT * FROM orders
WHERE city = "Mumbai" AND order_status != "Shipped";

UPDATE orders
SET order_status = "Shipped"
WHERE city = "Mumbai";

-- “The price of Mobile has increased to 20,000. Update all mobile orders.”
UPDATE orders
SET price = price + 20000
WHERE product_name = "Mobile";

-- “Customer Pooja increased her quantity to 3 mobiles. Update that order.”
UPDATE orders
SET quantity = quantity + 3
WHERE order_id = 108;

-- “Due to system error, all ‘Shipped’ orders from Bangalore should now be marked as ‘Delivered’.”
UPDATE orders
SET order_status = "Delivered"
WHERE city = "Bangalore" AND order_status = "Shipped";

/* ===========================================================
			 DELETE Based Real-World Problem
   ===========================================================*/
   
-- “Remove all cancelled orders from the system.”
-- NOTE : selecting data using WHERE clause is good practice before deleting data

SELECT * FROM orders
WHERE order_status = "Cancelled";

DELETE FROM orders
WHERE order_status = "Cancelled";

-- “Delete orders placed before 2025-01-12.”
SELECT * FROM orders
WHERE order_date < '2025-01-12';

DELETE FROM orders
WHERE order_date < '2025-01-12';

-- “Remove the order with order_id = 104.”
DELETE FROM orders 
WHERE order_id = 104;

-- “Delete all orders where quantity is less than 2.”
SELECT * FROM orders
WHERE quantity < 2;

DELETE FROM orders
WHERE quantity < 2;

-- “Management wants to clean Hyderabad pending orders. Remove them.”
SELECT * FROM orders;
WHERE city = "Hyderabad" AND order_status = "Pending";

DELETE FROM orders
WHERE city = "Hyderabad" AND order_status = "Pending";



