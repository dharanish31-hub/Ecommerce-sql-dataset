CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(101, 'Priya Sharma', 'priya@example.com', 'India'),
(102, 'Alex Johnson', 'alex@example.com', 'USA'),
(103, 'Meera Iyer', 'meera@example.com', 'India'),
(104, 'David Brown', 'david@example.com', 'UK');
INSERT INTO products VALUES
(201, 'Laptop', 'Electronics', 850.00),
(202, 'Smartphone', 'Electronics', 550.00),
(203, 'Wireless Mouse', 'Accessories', 25.00),
(204, 'Monitor', 'Electronics', 150.00);
INSERT INTO orders VALUES
(301, 101, '2025-08-01', 1425.00),
(302, 102, '2025-08-02', 550.00),
(303, 103, '2025-08-03', 175.00),
(304, 101, '2025-08-04', 1000.00);

INSERT INTO order_details VALUES
(401, 301, 201, 1),
(402, 301, 202, 1),
(403, 302, 202, 1),
(404, 303, 203, 3),
(405, 304, 201, 1),
(406, 304, 204, 1);

-- SELECT + WHERE + ORDER BY

SELECT name, email, country
FROM customers
WHERE country = 'India'
ORDER BY name ASC;


--  GROUP BY + Aggregate Functions

SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;


--  JOINS (INNER, LEFT, RIGHT)


-- INNER JOIN
SELECT o.order_id, c.name, o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- LEFT JOIN
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN 
SELECT c.name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;


--Subquery

SELECT name, email
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders WHERE total_amount > 1000
);
SELECT * FROM orders;


