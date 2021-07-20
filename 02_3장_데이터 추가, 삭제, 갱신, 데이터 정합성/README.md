# 3장: 데이터 추가, 삭제, 갱신, 데이터 정합성



## Insert, 행 추가

- Syntax

  ```sql
  -- 1줄
  INSERT INTO table_name (column1, column2, column3, ...) VALUES
  (value1, value2, value3, ...);
  
  -- 여러줄
  INSERT INTO table_name (column1, column2, column3, ...) VALUES
  (value1, value2, value3, ...),
  (value4, value5, value6, ...);
  ```

  

## Delete, 행 삭제

- syntax

  ```sql
  DELETE FROM table_name
  WHERE some_column = some_value
  ```

- exam1:



## Update, 데이터 갱신

- syntax

  ```sql
  UPDATE table_name
  SET column_name = 'new value'
  WHERE condition;
  ```


- exam1:
- exam2:



## Procedure

- syntax: 매크로처럼 반복되는 내용을 하나의 단위로 생성하는 것

  ```sql
  DELIMITER //
  CREATE PROCEDURE 프로시저명()
  BEGIN
  쿼리;
  END //
  DELIMITER ;
  ```

- exam1: 주문 취소건이 발생할 때 자동으로 마이너스를 처리하는 procedure

  ```sql
  DELIMITER //
  CREATE PROCEDURE sales_minus()
  BEGIN
  UPDATE product
  SET 원가 = (-1)*원가
  WHERE 취소 여부 = 'Y'
  AND 판매 일자 = CURDATE()-1;
  END //
  DELIMITER ;
  ```



## View

- syntax: 테이블을 직접 생성하지 않고 SELECT 문의 출력 결과를 보여주는 것

  ```sql
  CREATE VIEW DB.cancel_prodno
  AS
  SELECT 주문번호
  FROM DB.SALES
  WHERE 취소여부 = 'Y';
  ```

- exam1:  



## 데이터 정합성

- `데이터 정합성`: 데이터들의 값이 일치함을 의미

- `MECE`: 각 항목들이 상호 배타적이면서 모였을 때는 완전하게 합쳐지는 것
