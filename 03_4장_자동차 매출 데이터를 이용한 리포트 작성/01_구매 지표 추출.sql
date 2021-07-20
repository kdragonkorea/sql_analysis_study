-- 일별 매출액 조회
select A.orderdate, priceeach*quantityordered
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber;

select A.orderdate, sum(priceeach*quantityordered) as sales
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.orderNumber = B.orderNumber
group by 1
order by 1;

-- 월별 매출액 조회
select substr(A.orderdate,1,7) as MM,
sum(priceeach*quantityordered) as sales
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.ordernumber = B.orderNumber
group by 1
order by 1;

-- 연도별 매출액 조회
select substr(A.orderdate,1,4) as MM,
sum(priceeach*quantityordered) as sales
from classicmodels.orders A
left join classicmodels.orderdetails B
on A.ordernumber = B.ordernumber
group by 1
order by 1;