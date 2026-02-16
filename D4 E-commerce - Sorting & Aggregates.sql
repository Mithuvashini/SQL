use e_commerence;

select * from products;
select * from sales;
select * from sales_info;

/*Database: ECommerceDB
Question 1: ORDER BY
Scenario:
List all products sorted by price descending.
Task:
Use ORDER BY to sort products from highest to lowest price.
Expected Output:
product_id, product_name, price sorted descending.
*/

select product_id,product_name,price,sale_amount
from sales_info
order by sale_amount desc;

/*Question 2: ORDER BY with LIMIT
Scenario:
Show the top 3 most expensive products.
Task:
Use ORDER BY with LIMIT to display only the top 3 products.
Expected Output:
product_id, product_name, price of top 3 products.
*/

select product_id,product_name,price,sale_amount
from sales_info
order by sale_amount desc
limit 3;

/*Question 3: Aggregate Functions – Total Sales
Scenario:
Find the total sales amount across all sales.
Task:
Use SUM() on sale_amount.
Expected Output:
A single value showing total sales.
*/

select sum(sale_amount) as total_sale
from sales_info;

/*Question 4: Aggregate Functions – Average Price
Scenario:
Find the average sale amount from the Sales table.
Task:
Use AVG() on sale_amount.
Expected Output:
Average sale amount of all records.
*/

select product_id,product_name,round(avg(sale_amount),2) as avg_sale
from sales_info
group by product_id,product_name;

/*Question 5: Aggregate Functions – Count & Max/Min
Scenario:
•	Count total number of sales.
•	Find highest and lowest sale amounts.
Task:
Use COUNT(), MAX(), MIN() on sale_amount.
Expected Output:
Total sales count, highest and lowest sale amount.
*/

select count(sale_id) as total_sales,count(distinct product_name) as total_products,max(sale_amount) as highest_sales,min(sale_amount) as lowest_sales,round(avg(sale_amount),2) as avg_sale
from sales_info;

/*Question 6: GROUP BY – Total Sales per Product
Scenario:
Find total sales amount per product.
Task:
Use GROUP BY product_id (and optionally product_name) and SUM(sale_amount).
Expected Output:
product_id, product_name, total sales amount per product.
*/

select product_id,product_name,sum(sale_amount) as total_sales
from sales_info
group by product_id,product_name;

/*Question 7: GROUP BY with HAVING
Scenario:
List products whose total sales exceed ₹50,000.
Task:
Use GROUP BY and HAVING SUM(sale_amount) > 50000.
Expected Output:
product_id, product_name, total sales amount for products meeting the condition.
*/

select product_id,product_name,sum(sale_amount) as total_sales
from sales_info
group by product_id,product_name
having total_sales > 50000;

/*Question 8: ORDER BY with GROUP BY
Scenario:
Show total sales per product, sorted descending by total sales.
Task:
Use GROUP BY on product_id and ORDER BY SUM(sale_amount) DESC.
Expected Output:
Products with total sales sorted from highest to lowest.
*/

select product_id,product_name,sum(sale_amount) as total_sales
from sales_info
group by product_id
order by sum(sale_amount) desc;

/*Question 9: LIMIT with GROUP BY
Scenario:
Find the top 3 products by total sales amount.
Task:
Use GROUP BY product_id, aggregate with SUM(sale_amount), sort descending, and limit to 3 rows.
Expected Output:
product_id, product_name, total sales amount of top 3 products.
*/

select product_id,product_name,sum(sale_amount) as total_sales
from sales_info
group by product_id
order by sum(sale_amount) desc
limit 3;

/*Question 10: HAVING with Aggregate Condition
Scenario:
Show products with total sales > ₹30,000 AND average sale amount > ₹10,000.
Task:
Use GROUP BY product_id and HAVING SUM(sale_amount) > 30000 AND AVG(sale_amount) > 10000.
Expected Output:
product_id, product_name, total sales, average sale amount for products meeting the criteria.
*/

select product_id,product_name,sum(sale_amount) as total_sales,round(avg(sale_amount),2) as avg_sale_amount
from sales_info
group by product_id
having total_sales >30000 and avg_sale_amount > 10000;


