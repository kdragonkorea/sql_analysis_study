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