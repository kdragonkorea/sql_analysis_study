--
select orderdate, customernumber, ordernumber
from classicmodels.orders;

select count(ordernumber) N_orders,
count(distinct ordernumber) N_orders_distinct
from classicmodels.orders;

select orderdate, count(distinct customernumber) N_purchaser,
count(ordernumber) N_orders
from classicmodels.orders
group by 1
order by 1;

-- 인당 매출액(연도별)
select substr(A.orderdate,1,4) as YY,
count(distinct A.customernumber) as N_purchaser,
sum(priceeach*quantityordered) as sales
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.ordernumber = B.orderNumber
group by 1
order by 1;

select substr(A.orderdate,1,4) as YY,
count(distinct A.customernumber) as N_purchaser,
sum(priceeach*quantityordered) as sales,
sum(priceeach*quantityordered)/count(distinct A.customernumber) as AMV
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.ordernumber = B.orderNumber
group by 1
order by 1;

-- 건강 구매 금액 (ATV, Average Transaction Value) (연도별)
select substr(A.orderdate,1,4) YY,
count(distinct A.ordernumber) N_purchaser,
sum(priceeach*quantityordered) as sales,
sum(priceeach*quantityordered)/count(distinct A.ordernumber) ATV
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.ordernumber = B.orderNumber
group by 1
order by 1;

