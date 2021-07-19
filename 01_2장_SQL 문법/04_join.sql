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
select orderNumber, country
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
