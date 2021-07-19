# SQL EXERCISE
> sql 문법에 대한 기초 학습과 실무에서 사용하는 분석기법을 학습하기 위해서 'SQL로 맛보는 데이터 전처리 분석' 교제에 대한 내용을 공부하면서 정리하였습니다.



## Syntax

1. SELECT

   ```sql
   
   ```

   

2. FROM

3. WHERE

4. GROUP BY

5. JOIN

6. CASE WHEN

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

7. RANK, DENSE_RANK, ROW_NUMBER

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

     

8. SUBQUERY

   - syntax
   - exam1
   - exam2

---





## Exercise (Report & analysis)

1. 자동차 매출 데이터를 이용한 리포트 작성
2. 상품 리뷰 데이터를 이용한 리포트 작성
3. 식품 배송 데이터 분석
4. UK Commerce 데이터를 이용한 리포트 작성
5. 타이타닉 호 데이터 분석



## R, Python 연동



