-- PROJECT
create database sql_project1;
use sql_project1;

-- create table
create table retail_sales
(
   transactions_id	int primary key,
   sale_date date,
   sale_time time,	
   customer_id int,	
   gender varchar(15),
   age	int,
   category	varchar(15),
   quantiy	int,
   price_per_unit float,	
   cogs	float,
   total_sale float

);
select * from retail_sales;
-- select * from retail_sales
-- where transactions_id is Null;

-- select * from retail_sales
-- where sale_date is Null;

-- select * from retail_sales
-- where sale_time is Null;

-- DATA CLEANNING   do these
select * from retail_sales
where 
transactions_id is null
or 
sale_date is null
or
sale_time is null
or 
gender is null
or 
category is null
or
quantiy is null
or 
cogs is null
or 
total_sale is null;

-- delete null values
delete from retail_sales 
where 
transactions_id is null 
or
 sale_date is null 
 or
 sale_time is null 
 or
 gender is null
 or 
 category is null
or
 quantiy is null
or
 cogs is null
or
 total_sale is null;

-- DATA EXPLORATION

-- How  many sales we have?
select count(*) as total_sales from retail_sales;

-- how many  unique customer we have?
select count(distinct customer_id) as total_sales from retail_sales;

-- how many  unique category we have?
select count(distinct category) as total_sales from retail_sales;

-- Data Analysis or Businees key problem & Answer

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * 
from retail_sales
where sale_date='2022-11-05';
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022;
    
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, 
 sum(total_sale) as net_sales,
 count(*) as total_orders
 from retail_sales
 group by 1;
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),2) as avg_age
from retail_sales
where category='Beauty';
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select 
category, gender,count(*) as total_trans
from retail_sales
group by category,gender;

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales
select
 customer_id,
sum(total_sale )as total_sales
 from retail_sales 
 group by customer_id
 order by total_sales desc
 limit 5;
-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.
select
category,
 count( distinct customer_id)
 from retail_sales
 group by category;

-- End  of project

 
 


