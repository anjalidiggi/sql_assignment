--query1)	create a table named sales_data with columns: product_id, sale_date, and  quantity_sold.
CREATE TABLE sales_data (
    product_id INTEGER,
    sale_date DATE,
    quantity_sold INTEGER
);
--query2)	insert some sample data into the table:
INSERT INTO sales_data (product_id, sale_date, quantity_sold) VALUES
(1, '2022-01-01', 20),
(2, '2022-01-01', 15),
(1, '2022-01-02', 10),
(2, '2022-01-02', 25),
(1, '2022-01-03', 30),
(2, '2022-01-03', 18),
(1, '2022-01-04', 12),
(2, '2022-01-04', 22);
--query3)	Assign rank by partition based on product_id and find the latest product_id sold
WITH RankedProducts AS (
    SELECT
        product_id,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY created_date DESC) AS rn
    FROM sales
)
SELECT product_id
FROM RankedProducts
WHERE rn = 1;

--query4)	Retrieve the quantity_sold value from a previous row and compare the quantity_sold
SELECT
    product_id,
    sale_date,
    quantity_sold,
    LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS prev_quantity_sold
FROM
    sales_data;
--query5)	Partition based on product_id and return the first and last values in ordered set.
SELECT
    product_id,
    sale_date,
    quantity_sold,
    FIRST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_value,
    LAST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM
    sales_data;
