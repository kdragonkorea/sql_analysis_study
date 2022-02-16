# 4장: 자동차 매출 데이터를 이용한 리포트 작성



## 구매 지표 추출

- 매출액 (일자별, 월별, 연도별)
  1. 일별 매출액
    ```sql
    select orderDate, priceEach*quantityOrdered
    from classicmodels.orderdetails
    left join classicmodels.orders on orders.orderNumber = orderdetails.orderNumber;
    
    select orderDate, 
    sum(priceEach*quantityOrdered)
    from classicmodels.orderdetails
    left join classicmodels.orders on orders.orderNumber = orderdetails.orderNumber
    group by 1;
    ``` 
  2. 월별 매출액
    ```
    ```
  4. 연도별 매출액

- 구매자 수, 구매 건수 (일자별, 월별, 연도별)
- 인당 매출액 (AMV, Average Member Value) (연도별)
- 건당 구매 금액 (ATV, Average Transaction Value) (연도별)
  
  

## 그룹별 구매 지표 구하기

- syntax

- exam1:



## 재구매율



## Best Seller



## Churn Rate

