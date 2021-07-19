select ordernumber
from classicmodels.orders
where customernumber in (select customernumber 
from classicmodels.customers 
where country = 'usa');