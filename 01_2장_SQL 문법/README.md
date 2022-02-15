# SQL 문법



## SELECT

- 칼럼 조회

  - Syntax

    ```sql
    SELECT 호출하려는 칼럼
    FROM DB명.테이블명;
    ```

  - exam1: classicmodels.customer의 customerNumber를 조회하세요.

    ```sql
    SELECT customernumber
    FROM classicmodels.customers;
    ```

  - exam2: classicmodels.customer의 customerNumber의 개수를 조회하세요.

    ```sql
    SELECT count(customernumber)
    FROM classicmodels.customers;
    ```

- 집계 함수

  - syntax

    ```sql
    SELECT 집계 함수
    FROM DB명.테이블명;
    ```

  - exam1: classicmodels.payments의 amount의 총합과 checknumber 개수를 구하세요.

    ```sql
    select sum(amount),
    count(checknumber)
    FROM classicmodels.payments;
    ```

- `*` 모든 결과 조회

  - Syntax

    ```sql
    SELECT *
    FROM DB명.테이블명;
    
    -- 여러개의 칼럼 출력
    SELECT 칼럼명1, 칼럼명2, ...
    FROM DB명.테이블명;
    ```

  - exam1: classicmodels.products의 productName, productLine을 조회하세요.

    ```sql
    select productName, productLine
    from classicmodels.products;
    ```

- AS

  - syntax

    ```sql
    SELECT 칼럼명1 as 변경할 칼럼명
    FROM DB명.테이블명;
    ```

  - exam1: classicmodels.products의 productCode의 개수를 구하고, 칼럼 명을 n_products로 변경하세요.

    ```sql
    select count(productCode) as n_products -- as 생략 가능
    from classicmodels.products;
    ```

- DISTINCT

  - syntax

    ```sql
    SELECT DISTINCT 호출하려는 컬럼명
    FROM DB명.테이블명;
    ```

  - exam1: classicmodels.orderdetails의 ordernumber의 중복을 제거하고 조회하세요.

    ```sql
    select distinct ordernumber
    from classicmodels.orderdetails;
    ```



## FROM

- syntax

  ```sql
  SELECT 계산식 또는 칼럼명
  FROM DB명.테이블명;
  
  -- 매번 테이블 명에 DB명을 입력하는 것이 번거로울 경우 아래의 쿼리로 처리 가능
  
  USE DB명;
  
  SELECT 계산식 또는 칼럼명
  FROM 테이블명;
  ```



## WHERE

- BETWEEN

  - syntax

    ```sql
    SELECT 호출하려는 칼럼명
    FROM DB명.테이블명
    WHERE 칼럼 BETWEEN 시작점 AND 끝점;
    ```

  - exam1: classicmodels.orderdetails의 priceeach가 30에서 50 사이인 데이터를 조회하세요.

    ```sql
    select *
    from classicmodels.orderdetails
    where priceeach between 30 and 50;
    ```

- 대소 관계

  - syntax

    | 연산자 |   설명    |
    | :----: | :-------: |
    |   =    | 동일하다  |
    |   >    |   초과    |
    |   >=   |   이상    |
    |   <    |   미만    |
    |   <=   |   이하    |
    |   <>   | 같지 않다 |

  - exam1: classicmodels.orderdetails의 priceeach가 30 이상인 데이터를 조회하세요.

    ```sql
    select *
    from classicmodels.orderdetails
    where priceeach >= 30;
    ```

- IN

  - syntax

    ```sql
    SELECT 칼럼명
    FROM 테이블명
    WHERE 칼럼명 IN (값1, 값2); -- 값1과 값2 둘다 출력
    ```

  - exam1: classicmodels.customers의 country가 USA 또는 Canada인 customernumber를 조회하세요.

    ```sql
    select customernumber
    from classicmodels.customers
    where country in ('USA', 'CANADA');
    ```

- NOT IN

  - syntax

    ```sql
    SELECT 칼럼명
    FROM 테이블명
    WHERE 칼럼명 NOT IN (값1, 값2); -- 값1과 값2 둘다 출력
    ```

  - exam1: classicmodels.customers의 country가 USA, Canada가 아닌 customernumber를 조회하세요.

    ```sql
    select customernumber
    from classicmodels.customers
    where country not in ('usa','canada');
    ```

- IS NULL

  - syntax

    ```sql
    SELECT 칼럼명 또는 계산식
    FROM 테이블명
    WHERE 칼럼 IS NULL;
    
    -- NULL 이 아닌 값 조회
    SELECT 칼럼명 또는 계산식
    FROM 테이블명
    WHERE 칼럼 IS NOT NULL; -- IS NOT NULL
    ```

  - exam1: classicmodels.employees의 reportsTo의 값이 NULL인 employeenumber를 조회하세요.

    ```sql
    select employeenumber
    from classicmodels.employees
    where reportsTo is null;
    ```

- LIKE '%`포함어`%'

  - syntax: 어떤 텍스트가 포함되는 경우를 출력할 때

    ```sql
    SELECT 컬럼명
    FROM DB명.테이블명
    WHERE 컬럼명 LIKE '%텍스트%';
    ```

  - exam1: classicmodels.addressline1의 ST가 포함된 addressline1을 출력하세요.

    ```sql
     select addressline1
     from classicmodels.customers
     where addressline1 like '%ST%';
    ```



## GROUP BY

- syntax

  ```sql
  SELECT 컬럼명1, 컬럼명2, 계산식 (AVG, SUM, COUNT 등) -- AVG: 평균, COUNT: 개수, SUM: 합계
  FROM DB명.테이블
  GROUP BY 컬럼명1, 컬럼명2;
  ```

- exam1: classicmodels.customers 테이블을 이용해 국가, 도시별 고객 수를 구하세요.

  ```sql
   select country, city, 
   count(customernumber) as N_customernumber
   from classicmodels.customers
   group by country, city;
  ```

- exam2: classicmodels.customers 테이블을 이용해 USA 거주자의 수를 계산하고, 그 비중을 구하세요.

  ```sql
  select sum(case when country = 'usa' then 1 else 0 end) N_usa,
  sum(case when country = 'usa' then 1 else 0 end)/count(*) usa_portion
  from classicmodels.customers;
  ```



## JOIN

- LEFT JOIN

  - syntax: `특정 테이블 정보를 기준으로 타 테이블을 결합`

    ```sql
    SELECT 호출하려는 컬럼명
    FROM TABLE_A
    LEFT JOIN TABLE_B
    ON TABLE_A.column1 = TABLE_B.column2
    ```

  - exam1: classicmodels.customers, classicmodels.orders 테이블을 결합하고 ORDERNUMBER와 COUNTRY를 출력하세요.

    ```sql
    select ordernumber, country
    from classicmodels.orders
    left join classicmodels.customers
    on orders.customernumber = customers.customernumber;
    ```

  - exam2: classicmodels.customers, classicmodels.orders 테이블을 이용해 USA 거주자의 주문 번호(OrderNumber), 국가(Country)를 출력하세요.

    ```sql
    select ordernumber, country
    from classicmodels.customers
    left join classicmodels.orders
    on orders.customernumber = customers.customernumber
    where country = 'usa';
    ```

- INNER JOIN

  - syntax: `2가지 테이블에 공통으로 존재하는 정보만 출력`

    ```sql
    SELECT 호출하려는 컬럼명
    FROM TABLE_A
    INNER JOIN TABLE_B
    ON TABLE_A.column1 = TABLE_B.column2
    ```

  - exam1: classicmodels.customers, classicmodels.orders 테이블을 이용해 USA 거주자의 주문 번호(OrderNumber), 국가(Country)를 출력하세요.

    ```sql
    select orderNumber, country
    from classicmodels.customers
    inner join classicmodels.orders
    on customers.customernumber = orders.customerNumber
    where country = 'usa';
    ```
  
- FULL JOIN

  - syntax: `TABLE_A 또는 TABLE_B 와 매칭되는 레코드를 모두 출력`

    ```sql
    SELECT 호출하려는 컬럼명
    FROM TABLE_A
    FULL JOIN TABLE_B
    ON TABLE_A.column1 = TABLE_B.column2
    ```



## CASE WHEN

- **syntax**

  ```sql
  SELECT CASE WHEN 조건1 THEN 결과1
  WHEN 조건2 THEN 결과2 ELSE 결과3 END
  FROM 데이터베이스.테이블 명;
  ```

- *exam1: Classicmodels.customers의 country 칼럼을 이용해 북미(Canada, USA), 비북미를 출력하는 칼럼을 생성하세요.*

  ```sql
  SELECT COUNTRY,
  CASE WHEN COUNTRY in ('USA','Canada') THEN 'north america' ELSE 'others' END AS region
  FROM classicmodels.customers;
  ```

- exam2: Classicmodels.customers의 country 칼럼을 이용해 북미(Canada, USA), 비북미를 출력하는 칼럼을 생성하고, 북미, 비북미 거주 고객의 수를 계산하세요.

  ```sql
  select case when country in ('usa', 'canada') then 'north america' else 'others' end as region,
  count(customernumber) N_customers
  from classicmodels.customers
  group by case when country in ('usa', 'canada') then 'north america' else 'others' end;
  ```



## RANK, DENSE_RANK, ROW_NUMBER

- **syntax**

  ```sql
  -- column의 순위
  SELECT ROW_NUMBER() OVER(ORDER BY column) FROM ...
  SELECT RANK() OVER(ORDER BY column) FROM ...
  SELECT DENSE_RANK() OVER(ORDER BY column) FROM ...
  
  -- column1별로 column2의 순위
  SELECT ROW_NUMBER() OVER(PARTITION BY column1 ORDER BY column2) FROM ...
  SELECT RANK() OVER(PARTITION BY column1 ORDER BY column2) FROM ...
  SELECT DENSE_RANK() OVER(PARTITION BY column1 ORDER BY column2) FROM ...
  ```

- exam1: 

  ```sql
  select buyprice,
   row_number() over(order by buyprice) rownumber,
   rank() over(order by buyprice) rnk,
   dense_rank() over(order by buyprice) denserank
   from classicmodels.products;
  ```

- *exam2: classicmodels.products 테이블의 productline별로 순위를 매겨 주세요. (buyprice 칼럼 기준, 오름차순)*

  ```sql
  select buyprice,
  row_number() over(partition by productline order by buyprice) rownumber,
  rank() over(partition by productline order by buyprice) rnk,
  dense_rank() over(partition by productline order by buyprice) denserank
  from classicmodels.products;
  ```



## SUBQUERY

- **syntax: 쿼리 안의 쿼리라는 의미**

- exam1: classicmodels.customers와 classicmodels.orders를 이용해 USA 거주자의 주문 번호를 출력하세요.

  ```sql
  select ordernumber
  from classicmodels.orders
  where customernumber in (select customernumber 
  from classicmodels.customers 
  where country = 'usa');
  ```

  
