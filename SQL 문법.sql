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
 
 -- GROUP BY
 -- test 