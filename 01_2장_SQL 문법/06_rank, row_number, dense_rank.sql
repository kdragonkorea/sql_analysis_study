select buyprice,
row_number() over(partition by productline order by buyprice) rownumber,
rank() over(partition by productline order by buyprice) rnk,
dense_rank() over(partition by productline order by buyprice) denserank
from classicmodels.products;

select buyprice,
 row_number() over(order by buyprice) rownumber,
 rank() over(order by buyprice) rnk,
 dense_rank() over(order by buyprice) denserank
 from classicmodels.products;