CREATE DATABASE college;

USE college;

CREATE TABLE students(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50),
dob DATE,
department VARCHAR(20),
phone VARCHAR(15)
);

-- Retrieve Data
SELECT * FROM students;

-- Sort by name
SELECT * FROM students ORDER BY name;

-- Count per department
SELECT department, COUNT(*)
FROM students
GROUP BY department;

-- Customers table
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
name VARCHAR(50)
);

-- Products table
CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price INT
);

-- Orders table
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
product_id INT,
quantity INT
);

-- Join query
SELECT customers.name, products.product_name
FROM orders
JOIN customers ON orders.customer_id=customers.customer_id
JOIN products ON orders.product_id=products.product_id;

-- Transaction Example
START TRANSACTION;

UPDATE accounts SET balance=balance-500 WHERE id=1;

UPDATE accounts SET balance=balance+500 WHERE id=2;

COMMIT;

-- Trigger example
CREATE TABLE activity_log(
log_id INT AUTO_INCREMENT PRIMARY KEY,
action_type VARCHAR(20),
action_time TIMESTAMP
);

CREATE TRIGGER log_insert
AFTER INSERT
ON students
FOR EACH ROW
INSERT INTO activity_log(action_type,action_time)
VALUES('INSERT',NOW());
