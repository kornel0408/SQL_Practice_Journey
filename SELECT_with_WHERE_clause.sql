-- ===================================
-- SELECT COMMAND WITH WHERE CLAUSE
-- ===================================

-- CREATING TABLE
CREATE TABLE sales (
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    product VARCHAR(30),
    quantity INT,
    price INT,
    order_date DATE
);

-- INSERTING DATA INTO TABLE
INSERT INTO sales VALUES
(101, 'Ravi',   'Bangalore', 'Laptop',   1, 55000, '2024-01-10'),
(102, 'Anita',  'Chennai',   'Mobile',   2, 20000, '2024-01-15'),
(103, 'Suresh', 'Bangalore', 'Tablet',   1, 30000, '2024-02-05'),
(104, 'Priya',  'Hyderabad', 'Laptop',   1, 60000, '2024-02-10'),
(105, 'Amit',   'Mumbai',    'Mobile',   3, 18000, '2024-02-18'),
(106, 'Neha',   'Bangalore', 'Mobile',   1, 22000, '2024-03-01'),
(107, 'Rahul',  'Chennai',   'Laptop',   2, 52000, '2024-03-05'),
(108, 'Kiran',  'Mumbai',    'Tablet',   1, 28000, '2024-03-10');

-- VIEW TABLE DATA
SELECT * FROM sales;

-- Q1.Display all sales where city = 'Bangalore'
SELECT * FROM
sales
WHERE city = "Bangalore";

-- Q2.Show orders where price > 30000
SELECT * FROM 
sales
WHERE price > 30000;

-- Q3.Get all records where quantity = 1
SELECT * FROM 
sales
WHERE quantity = 1;

-- Q4 Find orders where price < 25000
SELECT * FROM 
sales
WHERE price < 25000;

-- Q5 Show sales where city = 'Bangalore' AND product = 'Mobile'
SELECT * FROM 
sales
WHERE city = 'Bangalore' AND product = 'Mobile';

-- Q6 Find orders where city = 'Mumbai' OR city = 'Chennai'
SELECT * FROM 
sales
WHERE city = 'Mumbai' OR city = 'chennai';

-- Q7 Display orders where NOT city = 'Bangalore'
SELECT * FROM 
sales
WHERE city != 'Bangalore';
-- ************************************************************************************************
-- REAL WORLD SCENARIOS LIKE HOW YOUR BOSS ASKS QUESTION WHILE YOU ARE WORKING IN AN ORGANIZATION
-- ***********************************************************************************************

-- Q8. “I only care about Bangalore and Hyderabad sales. Show me those records.”alter
SELECT * FROM 
sales
WHERE city IN ('Bangalore','Hyderabad');

--          (OR)

SELECT * FROM 
sales
WHERE city = 'Bangalore' OR city = 'Hyderabadh';

-- Q8. “I want to analyze only Laptop and Tablet orders. Fetch that data.”
SELECT * FROM 
sales
WHERE product IN ('Laptop','Tablet');
















