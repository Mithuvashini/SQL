drop database if exists e_commerce;

create database if not exists e_commerce;

USE e_commerce;

create table products (
    product_id int primary key,
    product_name varchar(100) not null,
    price decimal(8,2) not null
);

create table sales (
    sale_id int primary key,
    product_id int not null,
    quantity int not null,
    sale_amount DECIMAL(10,2) not null,
    foreign key  (product_id) references Products(product_id)
);

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

INSERT INTO sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

select * from products;
select * from sales;

create or replace view sales_info as
select sale_id,p.product_id,product_name,quantity,price,sale_amount
from sales s
join products p on s.product_id = p.product_id;

select * from sales_info;

/*Question 1: ORDER BY & LIMIT
Scenario:
Management wants to see the top 3 highest-priced products in the e-commerce system.
Task:
•	Write a SQL query to display the top 3 most expensive products.
•	Sort by price in descending order.
•	Use a LIMIT clause (or equivalent in SQL Server: TOP) to restrict to 3 products.
Expected Output:
Top 3 products with their product_id, product_name, and price.*/

select product_id,product_name,price 
from sales_info
order by price desc
limit 3;

/*Question 2: Aggregate Functions
Scenario:
Management wants summary statistics of the sales data.
Task:
•	Write SQL queries using aggregate functions on the Sales table:
o	COUNT() → total number of sales records
o	SUM() → total sales amount
o	AVG() → average sale amount
o	MAX() → highest sale amount
o	MIN() → lowest sale amount
Expected Output:
Aggregated results showing total sales, average sale amount, highest and lowest sale amounts.*/

select count(sale_id) no_of_sale,sum(sale_amount) total_sale,round(avg(sale_amount),2) avg_sale,max(sale_amount) max_sale,min(sale_amount) min_sale
from sales_info;

/*Management wants to know which products have total sales amount greater than ₹100.
Task:
•	Use GROUP BY on product_id (or product_name) to calculate total sales per product.
•	Use HAVING to filter products with total sales > 100.
Expected Output:
List of products with product_id, product_name, and total sales amount greater than ₹100.*/

select * from sales_info;

select product_id,product_name,sum(sale_amount) total_amount
from sales_info
group by product_id
having total_amount > 100
order by total_amount desc;

/*Question 4: Window Functions
Scenario:
Management wants a ranking of products based on their prices.
Task:
•	Write a SQL query using a Window Function (RANK() or DENSE_RANK()) to rank products.
•	Rank products from highest to lowest price.
Expected Output:
Each product with product_id, product_name, price, and rank according to price.*/

SELECT product_id,product_name,price,
    DENSE_RANK() OVER (ORDER BY price DESC)  price_rank
FROM sales_info;

SELECT product_id,product_name,price,
    RANK() OVER (ORDER BY price DESC)  price_rank
FROM sales_info;



