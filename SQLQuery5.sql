CREATE TABLE sales_data (
    product_id INTEGER,
    sale_date DATE,
    quantity_sold INTEGER
);
INSERT INTO sales_data (product_id, sale_date, quantity_sold) VALUES
(1, '2022-01-01', 20),
(2, '2022-01-01', 15),
(1, '2022-01-02', 10),
(2, '2022-01-02', 25),
(1, '2022-01-03', 30),
(2, '2022-01-03', 18),
(1, '2022-01-04', 12),
(2, '2022-01-04', 22);
SELECT
    product_id,
    sale_date,
    quantity_sold,
    RANK() OVER (PARTITION BY product_id ORDER BY sale_date DESC) AS rank
FROM
    sales_data;
SELECT
    product_id,
    sale_date,
    quantity_sold,
    LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS prev_quantity_sold
FROM
    sales_data;
SELECT
    product_id,
    sale_date,
    quantity_sold,
    FIRST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_value,
    LAST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM
    sales_data;
