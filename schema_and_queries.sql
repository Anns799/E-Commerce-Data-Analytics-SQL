-- ===================================================
-- Project: E-Commerce Data Analytics Engine
-- Description: Database Schema, Sample Data, and Revenue Analytics Query
-- ===================================================

-- 1. SCHEMAS / TABLE CREATION
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- 2. DUMMY DATA INSERTION
INSERT INTO customers VALUES 
(1, 'Ali', 'Khan', 'ali@gmail.com'),
(2, 'Sara', 'Ahmed', 'sara@gmail.com');

INSERT INTO products VALUES 
(101, 'Mechanical Keyboard', 75.00),
(102, 'Wireless Mouse', 30.00);

INSERT INTO orders VALUES 
(501, 1, '2026-01-05'),
(502, 2, '2026-01-12');

INSERT INTO order_items VALUES 
(1001, 501, 101, 2, 75.00),
(1002, 502, 102, 1, 30.00);

-- 3. ANALYTICAL QUERY: Total Spending Per Customer
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;
