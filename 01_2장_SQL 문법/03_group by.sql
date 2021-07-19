 -- [GROUP BY]
 select country, city, 
 count(customernumber) as N_customernumber
 from classicmodels.customers
 group by country, city;
 
 -- [CASE WHEN]
 select sum(case when country = 'usa' then 1 else 0 end) N_usa,
 sum(case when country = 'usa' then 1 else 0 end)/count(*) usa_portion
 from classicmodels.customers;