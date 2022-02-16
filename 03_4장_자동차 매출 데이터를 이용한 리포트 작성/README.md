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
    ```sql
    * substr 함수 사용방법
    select substr('abcde',2,3)
    -> BCD
    
    * 월별 날짜 조회
    select substr(orderDate,1,7)
    from classicmodels.orders;
    
    * 월별 
    select substr(orderDate,1,7) as YM,
    sum(priceEach*quantityOrdered) as sales
    from classicmodels.orders
    left join classicmodels.orderdetails
    on orders.orderNumber = orderdetails.orderNumber
    group by 1;
    ```
    * substr(`칼럼`,`위치`,`길이`): 문자열에서 원하는 텍스트만 호출하는 함수
    * `칼럼`: 문자열
    * `위치`: 시작 텍스트의 위치를 나타낸다.
    * `길이`: 몇 개의 텍스트를 가지고 올지 정한다.
  
  3. 연도별 매출액
    ```sql
    select substr(orderDate,1,4) as YM,
    sum(priceEach*quantityOrdered) as sales
    from classicmodels.orders
    left join classicmodels.orderdetails
    on orders.orderNumber = orderdetails.orderNumber
    group by 1;
    ```
    
- 구매자 수, 구매 건수 (일자별, 월별, 연도별)
- 인당 매출액 (AMV, Average Member Value) (연도별)
- 건당 구매 금액 (ATV, Average Transaction Value) (연도별)
  
  

## 그룹별 구매 지표 구하기

- syntax

- exam1:



## 재구매율



## Best Seller



## Churn Rate

