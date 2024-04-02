--query1-Create Database as ecommerce
CREATE DATABASE ecommerce;
--query2-Create 4 tables (gold_member_users, users, sales, product) under the above database(ecommerce)
USE ecommerce;

CREATE TABLE gold_member_users (
    userid INTEGER PRIMARY KEY,
    signup_date DATE
);

CREATE TABLE users (
    userid INTEGER PRIMARY KEY,
    signup_date DATE
);

CREATE TABLE sales (
    userid INTEGER,
    created_date DATE,
    product_id INTEGER,
    FOREIGN KEY (userid) REFERENCES users(userid)
);

CREATE TABLE product (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(50),
    price INTEGER
);
--query3-.Insert the values provided above with respective datatypes
INSERT INTO gold_member_users (userid, signup_date) VALUES (1, '09-22-2017'), (2, '04-21-2017');
INSERT INTO users (userid, signup_date) VALUES (1, '09-02-2014'), (2, '01-15-2015'), (3, '04-11-2014');

INSERT INTO sales (userid, created_date, product_id) VALUES
    (1, '04-19-2017', 2), (2, '12-18-2019', 1), (3, '07-20-2020', 3),
    (1, '10-23-2019', 2), (1, '03-19-2018', 3), (2, '12-20-2016', 2),
    (1, '11-09-2016', 1), (1, '05-20-2016', 3), (3, '09-24-2017', 1),
    (1, '03-11-2017', 2), (1, '03-11-2016', 1), (2, '11-10-2016', 1),
    (2, '12-07-2017', 2);

INSERT INTO product (product_id, product_name, price) VALUES
    (1, 'Mobile', 980), (2, 'Ipad', 870), (3, 'Laptop', 330);
--query4-Show all the tables in the same database(ecommerce)
SELECT * FROM sys.tables;
--query5-Count all the records of all four tables using single query
SELECT
    (SELECT COUNT(*) FROM gold_member_users) AS gold_member_users_count,
    (SELECT COUNT(*) FROM users) AS users_count,
    (SELECT COUNT(*) FROM sales) AS sales_count,
    (SELECT COUNT(*) FROM product) AS product_count;
--query6-What is the total amount each customer spent on ecommerce company
SELECT
    s.userid,
    SUM(price) AS total_amount_spent
FROM
    sales s
    JOIN product p ON s.product_id = p.product_id
GROUP BY
    s.userid;
;
--query7-Find the distinct dates of each customer visited the website:    output should have 2 columns date and customer name	
SELECT u.userid AS customer, s.created_date AS date
FROM sales s
JOIN users u ON s.userid = u.userid
GROUP BY u.userid, s.created_date;

--query8-Find the first product purchased by each customer using 3 tables(users, sales, product)
SELECT u.userid AS customer, MIN(s.created_date) AS first_purchase_date, p.product_name AS first_product_purchased
FROM sales s
JOIN users u ON s.userid = u.userid
JOIN product p ON s.product_id = p.product_id
GROUP BY u.userid;

--query9-What is the most purchased item of each customer and how many times the customer has purchased it: output should have 2 columns count of the items as item_count and customer name
WITH PurchaseCounts AS (
    SELECT s.userid, s.product_id, COUNT(*) AS item_count
    FROM sales s
    GROUP BY s.userid, s.product_id
)

SELECT pc.userid AS customer_name, pc.product_id, pc.item_count
FROM PurchaseCounts pc
WHERE (pc.userid, pc.item_count) IN (
    SELECT userid, MAX(item_count)
    FROM PurchaseCounts
    GROUP BY userid
);

--query10-Find out the customer who is not the gold_member_user
SELECT u.userid, u.signup_date
FROM users u
LEFT JOIN gold_member_users g ON u.userid = g.userid
WHERE g.userid IS NULL;
--query11-What is the amount spent by each customer when he was the gold_member user
SELECT
    g.userid,
    SUM(p.price) AS total_amount_spent
FROM
    gold_member_users g
    JOIN sales s ON g.userid = s.userid
    JOIN product p ON s.product_id = p.product_id
GROUP BY
    g.userid;
--query12-.Find the Customers names whose name starts with M
SELECT
    userid,
    signup_date
FROM
    users
WHERE
    userid LIKE 'M%';
--query13-Find the Distinct customer Id of each customer
SELECT DISTINCT
    userid
FROM
    users;
--query14-Change the Column name from product table as price_value from price
ALTER TABLE product DROP COLUMN price;

ALTER TABLE product ADD price_value INTEGER;

--query15-Change the Column value product_name – Ipad to Iphone from product table
UPDATE product SET product_name = 'Iphone' WHERE product_name = 'Ipad';
--query16-Change the table name of gold_member_users to gold_membership_users
EXEC sp_rename 'gold_member_users', 'gold_membership_users';
--query17-Create a new column  as Status in the table crate above gold_membership_users  the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
ALTER TABLE gold_membership_users
ADD Status VARCHAR(3) DEFAULT 'No';

UPDATE gold_membership_users
SET Status = 'Yes'
WHERE userid IN (SELECT userid FROM gold_member_users);

--query18-Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one mention the result when performed roll back
BEGIN TRANSACTION;

-- Delete rows from the sales table
DELETE FROM sales WHERE userid = 1;
DELETE FROM sales WHERE userid = 2;

-- Delete rows from the users table
DELETE FROM users WHERE userid = 1;
DELETE FROM users WHERE userid = 2;

-- Rollback the transaction
ROLLBACK TRANSACTION;

-- Check the result after rollback
SELECT * FROM users;
SELECT * FROM sales;

--query19-Insert one more record as same (3,'Laptop',330) as product table
INSERT INTO product (product_id, product_name,price ) VALUES (3, 'Laptop', 330);
--query20-Write a query to find the duplicates in product table
SELECT product_name, COUNT(*) AS duplicates
FROM product
GROUP BY product_name
HAVING COUNT(*) > 1;
 


