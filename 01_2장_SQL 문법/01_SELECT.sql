SELECT customernumber
FROM classicmodels.customers;

SELECT count(customernumber)
FROM classicmodels.customers;

select sum(amount),
count(checknumber)
FROM classicmodels.payments;

select productName, productLine
from classicmodels.products;

select count(productCode) as n_products
from classicmodels.products;

select distinct ordernumber
from classicmodels.orderdetails;