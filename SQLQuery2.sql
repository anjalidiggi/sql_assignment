--query-2 Write a query to find for each date the number of different products sold and their names. 
CREATE TABLE product_details (
    sell_date DATE,
    product VARCHAR(50)
);

INSERT INTO product_details (sell_date, product) VALUES
('2020-05-30', 'Headphones'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Book'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(product, ', ') AS product_list
FROM
    (
        SELECT DISTINCT
            sell_date,
            product
        FROM
            product_details
    ) AS subquery
GROUP BY
    sell_date;



