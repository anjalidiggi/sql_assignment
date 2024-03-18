                                                        SQL ASSIGNMENT
QUERY 1.Here is the Dataset for the below questions.
Gold members Data Set--Column names : (userid integer, signup_date)
('John','09-22-2017'), ('Mary','04-21-2017')

Users Data Set--Column names : (userid integer, signup_date)
('John','09-02-2014'), ('Michel','01-15-2015'), ('Mary','04-11-2014')

Sales Data Set-- Column names : (userid,created_date,product_id)
('John','04-19-2017',2), ('Mary','12-18-2019',1), ('Michel','07-20-2020',3), ('John','10-23-2019',2), ('John','03-19-2018',3), ('Mary','12-20-2016',2), ('John','11-09-2016',1), ('John','05-20-2016',3), ('Michel','09-24-2017',1), ('John','03-11-2017',2), ('John','03-11-2016',1), ('Mary','11-10-2016',1), ('Mary','12-07-2017',2)

Product Data Set--Column names : (product_id,product_name,price)
(1,'Mobile',980), (2,'Ipad',870), (3,'Laptop',330)

Questions on above Dataset :
1.Create Database as ecommerce
2.Create 4 tables (gold_member_users, users, sales, product) under the above database(ecommerce)
3.Insert the values provided above with respective datatypes
4.Show all the tables in the same database(ecommerce)
5.Count all the records of all four tables using single query
6.What is the total amount each customer spent on ecommerce company
7.Find the distinct dates of each customer visited the website:                       output should have 2 columns date and customer name
8.Find the first product purchased by each customer using 3 tables(users, sales, product)
9.What is the most purchased item of each customer and how many times the customer has purchased it: output should have 2 columns count of the items as item_count and customer name
10.Find out the customer who is not the gold_member_user
11.What is the amount spent by each customer when he was the gold_member user
12.Find the Customers names whose name starts with M
13.Find the Distinct customer Id of each customer
14.Change the Column name from product table as price_value from price
15.Change the Column value product_name – Ipad to Iphone from product table
16.Change the table name of gold_member_users to gold_membership_users
17.Create a new column  as Status in the table crate above gold_membership_users  the Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
18.Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one mention the result when performed roll back
19.Insert one more record as same (3,'Laptop',330) as product table
20.Write a query to find the duplicates in product table

QUERY 2. Write a query to find for each date the number of different products sold and their names. 
Column names: (sell_date, product)
Data: ('2020-05-30', 'Headphones'),
('2020-06-01','Pencil'),
('2020-06-02','Mask'),
('2020-05-30','Basketball'),
('2020-06-01','Book'),
('2020-06-02', ' Mask '),
('2020-05-30','T-Shirt')
	Create table product_details with above data and find the above result
	Output:
sell_date	num_sold	product_list
2020-05-30	3	Basketball, Headphones, T-Shirt
2020-06-01	2	Book, Pencil
2020-06-02	1	Mask

QUERY 3. Find the total salary of each department
Column names:(id_deptname, emp_name, salary)
Data: 
('1111-MATH', 'RAHUL', 10000),
('1111-MATH', 'RAKESH', 20000),
('2222-SCIENCE', 'AKASH', 10000),
('222-SCIENCE', 'ANDREW', 10000),
('22-CHEM', 'ANKIT', 25000),
('3333-CHEM', 'SONIKA', 12000),
('4444-BIO', 'HITESH', 2300),
('44-BIO', 'AKSHAY', 10000)
	Create table dept_tbl with above data
Output: 
dept_name	total_salary
BIO	12300
CHEM 	37000
Math	30000
Science	20000



QUERY 4.Write a query to find gmail accounts with latest and first signup date and difference between both the dates and also write the query to replace null value with ‘1970-01-01’
Column names: (id, email_id, signup_date)
Data:
(1, 'Rajesh@Gmail.com', '2022-02-01'),
(2, 'Rakesh_gmail@rediffmail.com', '2023-01-22'),
(3, 'Hitest@Gmail.com', '2020-09-08'),
(4, 'Salil@Gmmail.com', '2019-07-05'),
(5, 'Himanshu@Yahoo.com', '2023-05-09'),
(6, 'Hitesh@Twitter.com', '2015-01-01'),
(7, 'Rakesh@facebook.com', null);
Create table email_signup with above data
Output:
count_gmail_account	latest_signup_date	first_signup_date	diff_in_days
2	2022-02-01	2020-09-08	511

QUERY 5) Solve the below questions by creating below mentioned tables and adding the given dataset.
Hint: Solve using the Window Functions
1)	create a table named sales_data with columns: product_id, sale_date, and  quantity_sold.
2)	insert some sample data into the table:
dataset: 
(1, '2022-01-01', 20),
   		(2, '2022-01-01', 15),
   		(1, '2022-01-02', 10),
    		(2, '2022-01-02', 25),
    		(1, '2022-01-03', 30),
    		(2, '2022-01-03', 18),
    		(1, '2022-01-04', 12),
    	(2, '2022-01-04', 22)
3)	Assign rank by partition based on product_id and find the latest product_id sold
4)	Retrieve the quantity_sold value from a previous row and compare the quantity_sold.
5)	Partition based on product_id and return the first and last values in ordered set.
                                                                 
