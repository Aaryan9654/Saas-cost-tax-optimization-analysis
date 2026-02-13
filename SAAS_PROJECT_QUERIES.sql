
USE myapp;
SHOW TABLES;
DESCRIBE saas_transactions;
INSERT INTO saas_transactions 
(customer_id, country, subscription_type, base_amount)
VALUES 
(101, 'India', 'Pro', 999.99);
SELECT * FROM saas_transactions;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE
);
CREATE TABLE plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    monthly_price DECIMAL(10,2)
);
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    plan_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    payment_status VARCHAR(20)
);
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'India', '2024-01-10'),
(2, 'Sarah Khan', 'sarah@gmail.com', 'UAE', '2024-02-05'),
(3, 'John Miller', 'john@gmail.com', 'USA', '2024-03-12'),
(4, 'Priya Singh', 'priya@gmail.com', 'India', '2024-04-01'),
(5, 'David Lee', 'david@gmail.com', 'UK', '2024-05-20');
INSERT INTO plans VALUES
(1, 'Basic', 499.00),
(2, 'Pro', 999.00),
(3, 'Enterprise', 1999.00);
INSERT INTO transactions 
(customer_id, plan_id, amount, transaction_date, payment_status)
VALUES
(1, 2, 999.00, '2024-06-01', 'Success'),
(2, 3, 1999.00, '2024-06-03', 'Success'),
(3, 1, 499.00, '2024-06-05', 'Failed'),
(4, 2, 999.00, '2024-06-10', 'Success'),
(5, 3, 1999.00, '2024-06-15', 'Success'),
(1, 2, 999.00, '2024-07-01', 'Success');
SELECT SUM(amount) AS total_revenue
FROM transactions
WHERE payment_status = 'Success';
SELECT plan_id, SUM(amount) AS revenue
FROM transactions
WHERE payment_status = 'Success'
GROUP BY plan_id;
Result 25 | Result 236 | saas_transactions27
SELECT SUM(amount) AS total_revenue
FROM transactions
WHERE payment_status = 'Success';
SELECT plan_id, SUM(amount) AS revenue
FROM transactions
WHERE payment_status = 'Success'
GROUP BY plan_id;
SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM transactions
WHERE payment_status = 'Success'
GROUP BY month
ORDER BY month;
SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM transactions
WHERE payment_status = 'Success'
GROUP BY month
ORDER BY month;
SELECT 
    country,
    SUM(amount) AS total_revenue
FROM transactions
WHERE payment_status = 'Success'
GROUP BY country
ORDER BY total_revenue DESC;
SELECT 
    subscription_type,
    SUM(amount) AS total_revenue
FROM transactions
WHERE payment_status = 'Success'
GROUP BY subscription_type
ORDER BY total_revenue DESC;
SELECT 
    country,
    SUM(amount) AS total_revenue
FROM saas_transactions
WHERE payment_status = 'Success'
GROUP BY country
ORDER BY total_revenue DESC;