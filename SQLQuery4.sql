--query4-Write a query to find gmail accounts with latest and first signup date and difference between both the dates and also write the query to replace null value with ‘1970-01-01’
CREATE TABLE email_signup (
    id INTEGER,
    email_id VARCHAR(100),
    signup_date DATE
);

INSERT INTO email_signup (id, email_id, signup_date) VALUES
(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);

WITH gmail_accounts AS (
    SELECT
        id,
        email_id,
        signup_date,
        ROW_NUMBER() OVER (PARTITION BY SUBSTRING(email_id, CHARINDEX('@', email_id) + 1, LEN(email_id)) ORDER BY signup_date DESC) AS rn_latest,
        ROW_NUMBER() OVER (PARTITION BY SUBSTRING(email_id, CHARINDEX('@', email_id) + 1, LEN(email_id)) ORDER BY signup_date ASC) AS rn_oldest
    FROM
        email_signup
    WHERE
        email_id LIKE '%@gmail.com'
)
SELECT
    COUNT(*) AS count_gmail_account,
    MAX(CASE WHEN rn_latest = 1 THEN signup_date ELSE NULL END) AS latest_signup_date,
    MAX(CASE WHEN rn_oldest = 1 THEN signup_date ELSE NULL END) AS first_signup_date,
    DATEDIFF(DAY, MAX(CASE WHEN rn_oldest = 1 THEN signup_date ELSE NULL END), MAX(CASE WHEN rn_latest = 1 THEN signup_date ELSE NULL END)) AS diff_in_days
FROM
    gmail_accounts
WHERE
    rn_latest = 1 OR rn_oldest = 1;

