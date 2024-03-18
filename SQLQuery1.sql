CREATE DATABASE ecommerce;
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
SELECT * FROM sys.tables;
SELECT
    (SELECT COUNT(*) FROM gold_member_users) AS gold_member_users_count,
    (SELECT COUNT(*) FROM users) AS users_count,
    (SELECT COUNT(*) FROM sales) AS sales_count,
    (SELECT COUNT(*) FROM product) AS product_count;
SELECT
    s.userid,
    SUM(price) AS total_amount_spent
FROM
    sales s
    JOIN product p ON s.product_id = p.product_id
GROUP BY
    s.userid;
;
	SELECT DISTINCT
    s.created_date AS date,
    COALESCE(g.userid, u.userid) AS customer_name
FROM
    sales s
    LEFT JOIN gold_member_users g ON s.userid = g.userid
    LEFT JOIN users u ON s.userid = u.userid;
SELECT
    s.userid,
    MIN(s.created_date) AS first_purchase_date,
    MIN(p.product_name) AS first_product_purchased
FROM
    sales s
    JOIN product p ON s.product_id = p.product_id
GROUP BY
    s.userid;
;
SELECT
    s.userid,
    p.product_name,
    COUNT(*) AS item_count
FROM
    sales s
    JOIN product p ON s.product_id = p.product_id
GROUP BY
    s.userid,
    p.product_name
ORDER BY
    item_count DESC;
SELECT u.userid, u.signup_date
FROM users u
LEFT JOIN gold_member_users g ON u.userid = g.userid
WHERE g.userid IS NULL;
SELECT
    g.userid,
    SUM(p.price) AS total_amount_spent
FROM
    gold_member_users g
    JOIN sales s ON g.userid = s.userid
    JOIN product p ON s.product_id = p.product_id
GROUP BY
    g.userid;
SELECT
    userid,
    signup_date
FROM
    users
WHERE
    userid LIKE 'M%';
SELECT DISTINCT
    userid
FROM
    users;

ALTER TABLE product DROP COLUMN price;

ALTER TABLE product ADD price_value INTEGER;
;
UPDATE product SET product_name = 'Iphone' WHERE product_name = 'Ipad';
EXEC sp_rename 'gold_member_users', 'gold_membership_users';
;
ALTER TABLE gold_membership_users ADD Status NVARCHAR(3) NULL;


ALTER TABLE gold_membership_users ADD CONSTRAINT CHK_Status CHECK (Status IN ('Yes', 'No'));
;
UPDATE gold_membership_users SET Status = 'Yes';
DELETE FROM users WHERE userid = 1;
DELETE FROM users WHERE userid = 2;

INSERT INTO product (product_id, product_name,price ) VALUES (3, 'Laptop', 330);

SELECT product_name, COUNT(*) AS duplicates
FROM product
GROUP BY product_name
HAVING COUNT(*) > 1;

