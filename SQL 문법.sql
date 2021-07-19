SELECT CUSTOMERNUMBER
FROM CLASSICMODELS.CUSTOMERS;

SELECT COUNT(CUSTOMERNUMBER)
FROM CLASSICMODELS.CUSTOMERS;

SELECT SUM(AMOUNT),
COUNT(CHECKNUMBER)
FROM CLASSICMODELS.PAYMENTS;
 
SELECT PRODUCTNAME, PRODUCTLINE
FROM CLASSICMODELS.PRODUCTS;

-- AS
SELECT COUNT(PRODUCTCODE)
AS n_products
FROM CLASSICMODELS.PRODUCTS;

-- DISTINCT
SELECT DISTINCT ORDERNUMBER
FROM classicmodels.orderdetails;

-- BETWEEN (WHERE)
select *
from classicmodels.orderdetails
where priceeach between 30 and 50;

-- =/>/</>=/<=/<>(같지 않다)/ 
select *
from classicmodels.orderdetails
where priceeach >= 30;

-- IN, Not In
select customernumber
from classicmodels.customers
where country in ('USA', 'CANADA');

select customernumber
from classicmodels.customers
where country not in ('usa','canada');

-- IS NULL, IS NOT NULL
select employeenumber
from classicmodels.employees
where reportsTo is null;

 -- LIKE '%TEXT%'
 select addressline1
 from classicmodels.customers
 where addressline1 like '%ST%';
 
 -- [GROUP BY]
 select country, city, 
 count(customernumber) as N_customernumber
 from classicmodels.customers
 group by country, city;
 
 -- [CASE WHEN]
 select sum(case when country = 'usa' then 1 else 0 end) N_usa,
 sum(case when country = 'usa' then 1 else 0 end)/count(*) usa_portion
 from classicmodels.customers;
 
 -- [JOIN]
 -- LEFT JOIN
select ordernumber, country
from classicmodels.orders
left join classicmodels.customers
on orders.customernumber = customers.customernumber;

select ordernumber, country
from classicmodels.customers
left join classicmodels.orders
on orders.customernumber = customers.customernumber
where country = 'usa';

 -- INNER JOIN
 select customernumber, country
 from classicmodels.customers
 inner join classicmodels.orders
 on customers.customernumber = orders.customerNumber
 where country = 'usa';

 -- FULL JOIN
 
 -- [CASE WHEN] - 별도로 학습 필요
SELECT COUNTRY,
CASE WHEN COUNTRY in ('USA','Canada') THEN 'north america' ELSE 'others' END AS region
FROM classicmodels.customers;

select case when country in ('usa', 'canada') then 'north america' else 'others' end as region,
count(customernumber) N_customers
from classicmodels.customers
group by case when country in ('usa', 'canada') then 'north america' else 'others' end;

 -- [RANK, DENSE_RANK, ROW_NUMBER]
 select buyprice,
 row_number() over(order by buyprice) rownumber,
 rank() over(order by buyprice) rnk,
 dense_rank() over(order by buyprice) denserank
 from classicmodels.products;
 
 -- [SUBQUERY]