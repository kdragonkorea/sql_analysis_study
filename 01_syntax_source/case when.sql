 -- [CASE WHEN] - 별도로 학습 필요
SELECT COUNTRY,
CASE WHEN COUNTRY in ('USA','Canada') THEN 'north america' ELSE 'others' END AS region
FROM classicmodels.customers;

select case when country in ('usa', 'canada') then 'north america' else 'others' end as region,
count(customernumber) N_customers
from classicmodels.customers
group by case when country in ('usa', 'canada') then 'north america' else 'others' end;
