-- Create database and use it
CREATE DATABASE IF NOT EXISTS hotel_assignment;
USE hotel_assignment;

-- Drop tables if they exist (for repeatability)
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orderdetails;

-- Table: payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    check_number VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10, 2)
);

-- Table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    credit_limit DECIMAL(10, 2)
);

-- Table: orderdetails
CREATE TABLE orderdetails (
    order_id INT,
    product_code VARCHAR(50),
    quantity_ordered INT,
    price_each DECIMAL(10, 2)
);

-- Sample data: payments
INSERT INTO payments (customer_id, check_number, payment_date, amount) VALUES
(1, 'CHK1001', '2025-05-10', 300.00),
(1, 'CHK1002', '2025-05-12', 150.00),
(2, 'CHK1003', '2025-05-11', 450.00),
(3, 'CHK1004', '2025-05-09', 500.00),
(4, 'CHK1005', '2025-05-13', 600.00),
(5, 'CHK1006', '2025-05-14', 250.00);

-- Sample data: customers
INSERT INTO customers (customer_id, customer_name, country, credit_limit) VALUES
(1, 'John Smith', 'USA', 5000.00),
(2, 'emanwel', 'khenya', 3000.00),
(3, 'themba', 'zimbagwe', 7000.00),
(4, 'Pablo', 'RSA', 6000.00),
(5, 'Chen Li', 'China', 4000.00);

-- Sample data: orderdetails
INSERT INTO orderdetails (order_id, product_code, quantity_ordered, price_each) VALUES
(101, 'P001', 10, 25.00),
(102, 'P002', 5, 40.00),
(103, 'P001', 3, 25.00),
(104, 'P003', 8, 15.00),
(105, 'P004', 2, 100.00);

-- ==========================
-- ✅ Question 1
-- Total payment amount for each payment date (Top 5 latest)
-- ==========================
SELECT 
    payment_date, 
    SUM(amount) AS total_amount
FROM 
    payments
GROUP BY 
    payment_date
ORDER BY 
    payment_date DESC
LIMIT 5;

-- ==========================
-- ✅ Question 2
-- Average credit limit of each customer
-- ==========================
SELECT 
    customer_name, 
    country, 
    AVG(credit_limit) AS average_credit_limit
FROM 
    customers
GROUP BY 
    customer_name, country;

-- ==========================
-- ✅ Question 3
-- Total price of products ordered
-- ==========================


-- ==========================
-- ✅ Question 4
-- Highest payment amount for each check number
-- ==========================
SELECT 
    check_number, 
    MAX(amount) AS highest_amount
FROM 
    payments
GROUP BY 
    check_number;
