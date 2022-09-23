--03 서브쿼리 심화

--[실습1 해설] 동작하는 방식에 따른 서브쿼리 분류 - 연관 서브쿼리
-- EMPLOYEE 테이블에는 직원 ID, 관리자 ID, 급여 정보가 담겨 있습니다.

-- 직원들 중에서 자신의 관리자보다 급여가 높거나 같은 직원에 대해서 알아보고자 합니다. EMPLOYEE 테이블에는 직원에 대해 관리자 ID 정보만 있기 때문에, 연관 서브쿼리를 통해 직원의 관리자 급여정보를 추출해야 합니다.

-- 연관 서브쿼리를 이용하여, 자신의 관리자보다 급여가 높거나 같은 직원 ID를 조회하는 쿼리를 작성해 봅시다.
-- 지시사항
-- 직원의 관리자 급여를 추출하는 서브쿼리를 WHERE문 조건에 응용하고 연관 서브쿼리 개념을 이용하여, 직원의 급여가 직원의 관리자 급여보다 높거나 같은 직원 ID(employee_id) 를 조회해 봅시다.

-- 아래는 EMPLOYEE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC EMPLOYEE;
select * from EMPLOYEE;
-- 자신의 관리자의 급여보다 높거나 같은 급여를 가진 직원의 ID를 출력하는 쿼리를 작성해봅시다.

-- 서브 쿼리 - 셀프 조인
select employee_id 
from EMPLOYEE as a
where salary >= (
    select salary 
    from EMPLOYEE as b
    where a.manager_id = b.employee_id
)
order by employee_id asc;

+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| employee_id | int(11) | NO   | PRI | NULL    |       |
| manager_id  | int(11) | YES  |     | NULL    |       |
| salary      | int(11) | NO   |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
+-------------+------------+--------+
| employee_id | manager_id | salary |
+-------------+------------+--------+
|       10000 |       NULL |   9000 |
|       10001 |       NULL |   8500 |
|       10002 |      10000 |   9000 |
|       10003 |      10002 |   7000 |
|       10004 |      10001 |   9500 |
|       10005 |      10003 |   7500 |
|       10006 |      10003 |   5000 |
+-------------+------------+--------+
+-------------+
| employee_id |
+-------------+
|       10002 |
|       10004 |
|       10005 |
+-------------+

--[실습2 해설] 동작하는 방식에 따른 서브쿼리 분류 - 비연관 서브쿼리
-- EMPLOYEE 테이블에는 직원 ID, 관리자 ID, 급여 정보가 담겨 있습니다.

-- 급여가 8,000미만인 직원을 관리하는 관리자의 ID와 급여를 출력하고자 합니다. EMPLOYEE 테이블에는 관리자의 급여정보가 없기 때문에, 비연관 서브쿼리를 통해 급여가 8,000미만인 직원의 관리자 ID를 조회하고, 해당 ID에 대해 직원 ID와 급여정보를 조회해봅시다.

-- 비연관 서브쿼리를 이용하여, 급여가 8,000 미만인 직원의 관리자 ID와 급여를 출력하는 쿼리를 작성하세요.
-- 지시사항
-- 급여가 8,000 미만인 직원의 관리자 ID 를 추출하는 서브쿼리를 WHERE문 조건에 응용하고 비연관 서브쿼리 개념을 이용하여, 급여가 8,000 미만인 직원의 관리자 ID(employee_id)와 급여(salary) 를 조회해 봅시다.


-- 아래는 EMPLOYEE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
-- 급여가 8,000 미만인 직원의 관리자 ID 를 추출하는 서브쿼리를 WHERE문 조건에 응용하고 비연관 서브쿼리 개념을 이용하여, 
-- 급여가 8,000 미만인 직원의 관리자 ID(employee_id)와 급여(salary) 를 조회해 봅시다.
DESC EMPLOYEE;
select * from EMPLOYEE;
-- 급여가 8000미만인 직원의 관리자 아이디와 급여를 출력하는 쿼리를 작성하세요.

select employee_id, salary
from EMPLOYEE
where  employee_id in (
    select manager_id
    from EMPLOYEE
    where salary < 8000
)
order by employee_id asc;

+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| employee_id | int(11) | NO   | PRI | NULL    |       |
| manager_id  | int(11) | YES  |     | NULL    |       |
| salary      | int(11) | NO   |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
+-------------+------------+--------+
| employee_id | manager_id | salary |
+-------------+------------+--------+
|       10000 |       NULL |   9000 |
|       10001 |       NULL |   8500 |
|       10002 |      10000 |   9000 |
|       10003 |      10002 |   7000 |
|       10004 |      10001 |   9500 |
|       10005 |      10003 |   7500 |
|       10006 |      10003 |   5000 |
+-------------+------------+--------+
+-------------+--------+
| employee_id | salary |
+-------------+--------+
|       10002 |   9000 |
|       10003 |   7000 |
+-------------+--------+

-- [실습3] 반환되는 데이터 형태에 따른 서브쿼리 분류 - 단일 행 서브쿼리

-- REQUEST 테이블에는 요청 ID와 요청상태 정보가 담겨있습니다. 또한 REQUEST_DTL테이블에는 요청 상세 ID, 요청 ID, 요청 이름, 요청 내용 등의 정보가 담겨 있습니다.

-- 요청 상태가 실패(FAILED)인 요청의 상세 정보를 알고자 합니다. 이때, REQUEST 테이블에서 요청상태 값이 실패(FAILED)인 요청 ID가 1개이기 때문에 단일 행 서브쿼리 개념을 이용하여 해당 요청의 상세정보를 조회해 봅시다.

-- REQUEST 테이블에 있는 요청상태 값이 실패(FAILED)인 요청 ID를 얻어서 그 요청에 대한 상세정보를 알아보는 쿼리를 작성해봅시다.
-- 지시사항
-- WHERE문을 이용하여, REQUEST 테이블에서 요청상태가 FAILED인 데이터의 요청 ID(request_id)를 출력하는 쿼리를 작성해봅시다.

-- 1번에서 조회한 쿼리를 서브쿼리로 이용하여, REQUEST_DTL 테이블에서 해당 요청 ID에 대한 상세정보(요청 상세 ID(request_dtl_id), 요청 ID(request_id), 요청 이름(request_name), 요청 내용(request_content))를 출력하는 쿼리를 작성해봅시다.

-- 아래는 REQUEST, REQUEST_DTL 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC REQUEST;
DESC REQUEST_DTL;

select * from REQUEST;
select * from REQUEST_DTL;

-- 1. 요청상태가 FAILED인 요청 데이터를 조회하는 쿼리를 작성해보세요.
select request_id
from REQUEST
where request_status = 'FAILED';

-- 2. 위에서 작성한 쿼리를 서브쿼리로 이용하여 REQUEST_DTL 테이블에서 요청 상세를 조회하는 쿼리를 작성해보세요.

select request_dtl_id, request_id, request_name, 
request_content from REQUEST_DTL
where request_id = (
    select request_id from REQUEST
    where request_status = 'FAILED'
);

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| request_id     | int(11)     | NO   | PRI | NULL    |       |
| request_status | varchar(10) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| request_dtl_id  | int(11)      | NO   | PRI | NULL    |       |
| request_id      | int(11)      | NO   |     | NULL    |       |
| request_name    | varchar(50)  | NO   |     | NULL    |       |
| request_content | varchar(300) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+

+------------+----------------+
| request_id | request_status |
+------------+----------------+
|      10001 | SUCCESS        |
|      10002 | FAILED         |
|      10003 | SUCCESS        |
|      10004 | SUCCESS        |
+------------+----------------+
+----------------+------------+--------------+-----------------+
| request_dtl_id | request_id | request_name | request_content |
+----------------+------------+--------------+-----------------+
|          21548 |      10001 | FOR_TEST     | NULL            |
|          21567 |      10002 | GET          | FOR GET         |
|          22211 |      10003 | POST         | DATA INPUT      |
|          34527 |      10004 | DB           | DATA INPUT      |
|          36788 |      10005 | HELLO        | NULL            |
+----------------+------------+--------------+-----------------+

+------------+
| request_id |
+------------+
|      10002 |
+------------+
+----------------+------------+--------------+-----------------+
| request_dtl_id | request_id | request_name | request_content |
+----------------+------------+--------------+-----------------+
|          21567 |      10002 | GET          | FOR GET         |
+----------------+------------+--------------+-----------------+

-- [실습4] 반환되는 데이터 형태에 따른 서브쿼리 분류 - 다중 행 서브쿼리 IN
-- 앞에서 풀었던 문제와 동일하게, REQUEST 테이블에는 요청 ID와 요청상태 정보가 담겨있습니다. 또한 REQUEST_DTL테이블에는 요청 상세 ID, 요청 ID, 요청 이름, 요청 내용 등의 정보가 담겨 있습니다.

-- 이번 문제에서도 REQUEST 테이블에 있는 요청 상태가 실패(FAILED)인 요청 ID를 얻어서 그 요청에 대한 상세정보를 알아보는 쿼리를 작성해봅시다.

-- 다만, 이전 문제와는 다르게 요청상태 값이 실패인 요청 1개가 아니라, 여러 개에 대한 요청 상세 정보를 알아봅니다.
-- 지시사항
-- 앞에서 이용했던 서브쿼리와 같이 요청상태가 FAILED인 요청 ID를 조회하는 쿼리를 이용하여, REQUEST_DTL 테이블에서 해당 요청 ID에 대한 상세정보(요청 상세 ID(request_dtl_id), 요청 ID(request_id), 요청 이름(request_name), 요청 내용(request_content))을 출력하는 쿼리를 작성해봅시다.
-- 이때, 요청상태가 FAILED인 요청 데이터가 2개 이상이기 때문에 IN을 이용해보도록 합니다.

-- 아래는 REQUEST, REQUEST_DTL 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC REQUEST;
DESC REQUEST_DTL;

select * from REQUEST;
select * from REQUEST_DTL;

select request_id from REQUEST
where request_status = 'FAILED';

-- 요청상태가 FAILED인 요청ID를 구하고, 해당 요청들에 대한 요청상세 정보를 조회하는 쿼리를 작성해보세요.
select request_dtl_id, request_id, request_name, request_content
from REQUEST_DTL
where request_id IN (
    select request_id from REQUEST
    where request_status = 'FAILED'
)
order by request_dtl_id;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| request_id     | int(11)     | NO   | PRI | NULL    |       |
| request_status | varchar(10) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| request_dtl_id  | int(11)      | NO   | PRI | NULL    |       |
| request_id      | int(11)      | NO   |     | NULL    |       |
| request_name    | varchar(50)  | NO   |     | NULL    |       |
| request_content | varchar(300) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
+------------+----------------+
| request_id | request_status |
+------------+----------------+
|      10001 | SUCCESS        |
|      10002 | FAILED         |
|      10003 | SUCCESS        |
|      10004 | SUCCESS        |
|      10005 | FAILED         |
|      10006 | FAILED         |
+------------+----------------+
+----------------+------------+--------------+-----------------+
| request_dtl_id | request_id | request_name | request_content |
+----------------+------------+--------------+-----------------+
|          21548 |      10001 | FOR_TEST     | NULL            |
|          21567 |      10002 | GET          | FOR GET         |
|          22211 |      10003 | POST         | DATA INPUT      |
|          34527 |      10004 | DB           | DATA INPUT      |
|          36788 |      10005 | HELLO        | NULL            |
|          40015 |      10006 | TEST         | TEST_CONTENT    |
+----------------+------------+--------------+-----------------+
+------------+
| request_id |
+------------+
|      10002 |
|      10005 |
|      10006 |
+------------+
+----------------+------------+--------------+-----------------+
| request_dtl_id | request_id | request_name | request_content |
+----------------+------------+--------------+-----------------+
|          21567 |      10002 | GET          | FOR GET         |
|          36788 |      10005 | HELLO        | NULL            |
|          40015 |      10006 | TEST         | TEST_CONTENT    |
+----------------+------------+--------------+-----------------+

-- [실습5] 반환되는 데이터 형태에 따른 서브쿼리 분류 - 다중 행 서브쿼리 EXISTS
-- STORE 테이블에는 가게 ID와 가게 이름 정보가 담겨있습니다. PAYMENT 테이블에는 결제 ID와 가게 ID, 결제금액 정보가 담겨 있습니다.

-- 결제금액이 5,000원 이상인 가게의 가게 ID와 가게 이름을 조회하고자 합니다. 결제금액에 대해서는 PAYMENT 테이블에 있지만, 가게 이름 정보는 STORE 테이블에 있기때문에 다중 행 서브쿼리 EXISTS를 이용하여 PAYMENT 테이블에서 결제금액이 5,000원 이상이고 STORE 테이블의 가게 ID와 일치하는 데이터가 존재하는 경우의 가게 ID와 가게 이름을 조회해 봅시다.

-- 두 개의 테이블을 이용하여, 결제금액이 5,000원 이상인 가게에 대해서, 가게 ID와 가게 이름을 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- STORE 테이블을 기준으로 조회하면서 EXISTS문을 응용하여 서브쿼리상에서, PAYMENT 테이블에 대해 STORE 테이블의 가게 ID(store_id)와 일치하고 결제금액이 5,000원 이상인 데이터가 존재하는지를 통해 가게 ID(store_id), 가게 이름(store_name)을 조회하는 쿼리를 작성해보세요.

-- 아래는 STORE, PAYMENT 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STORE;
DESC PAYMENT;


SELECT * FROM STORE;
SELECT * FROM PAYMENT;
-- EXISTS문을 응용하여, 결제금액이 5000원 이상인 가게ID, 가게이름을 조회하는 쿼리를 작성해보세요.


SELECT store_id, store_name
FROM STORE
WHERE EXISTS
(
SELECT store_id FROM PAYMENT
WHERE pay_amount >= 5000)
ORDER BY store_id ASC;

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| store_id   | int(11)     | NO   | PRI | NULL    |       |
| store_name | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| payment_id | int(11) | NO   | PRI | NULL    |       |
| store_id   | int(11) | NO   |     | NULL    |       |
| pay_amount | int(11) | NO   |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
+----------+------------+
| store_id | store_name |
+----------+------------+
|     1000 | pizza      |
|     1001 | bunsik     |
|     1002 | ice-cream  |
|     1003 | coffee     |
|     1004 | cake       |
+----------+------------+
+------------+----------+------------+
| payment_id | store_id | pay_amount |
+------------+----------+------------+
|      10123 |     1000 |       1000 |
|      10124 |     1002 |       6000 |
|      10125 |     1001 |      10000 |
|      10126 |     1001 |       3000 |
|      10127 |     1003 |       4500 |
|      10128 |     1002 |       5000 |
+------------+----------+------------+
+----------+------------+
| store_id | store_name |
+----------+------------+
|     1000 | pizza      |
|     1001 | bunsik     |
|     1002 | ice-cream  |
|     1003 | coffee     |
|     1004 | cake       |
+----------+------------+

-- [실습6] 반환되는 데이터 형태에 따른 서브쿼리 분류 - 다중 행 서브쿼리 ALL
-- EMPLOYEE 테이블에는 직원 ID, 급여, 직급 정보가 담겨있습니다.

-- 직원들 중에서 모든 사원의 급여보다 급여가 높거나 같은 직원을 조회하려고 합니다. 앞에서 배운 ALL을 이용하여, 모든 사원의 급여보다 크거나 같은 급여에 대한 조건을 작성해 봅시다.

-- 직원들 중 직급이 사원인 모든 직원의 급여를 구한 뒤, ALL을 이용하여 모든 사원들의 급여보다 급여가 높거나 같은 직원을 조회하는 쿼리를 작성해 봅시다.
-- 지시사항
-- EMPLOYEE테이블에서 직급(position)이 사원인 직원의 급여(salary) 를 조회하는 쿼리를 작성해봅시다.

-- EMPLOYEE 테이블에 대해, 1번에서 완성한 쿼리와 ALL을 이용하여, 모든 사원들의 급여보다 높거나 같은 급여 를 가진 직원의 직원 ID(employee_id), 급여(salary), 직급(position) 을 조회하는 쿼리를 작성해봅시다.

-- 아래는 EMPLOYEE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC EMPLOYEE;

-- 1. 직급이 '사원'인 직원의 급여를 조회하는 쿼리를 작성해봅시다.
SELECT * FROM EMPLOYEE;

SELECT salary FROM EMPLOYEE
WHERE position = '사원'
ORDER BY salary ASC;

-- 2. 앞에서 작성한 쿼리와 ALL을 이용하여, 모든 사원들의 급여보다 높거나 같은 급여를 가진 직원을 조회하는 쿼리를 작성해봅시다.
SELECT * FROM EMPLOYEE
WHERE salary >= ALL (
    SELECT salary FROM EMPLOYEE
    WHERE position = '사원'
)
ORDER BY employee_id ASC;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| employee_id | int(11)     | NO   | PRI | NULL    |       |
| salary      | int(11)     | NO   |     | NULL    |       |
| position    | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+-------------+--------+----------+
| employee_id | salary | position |
+-------------+--------+----------+
|       10000 |   9000 | 사장     |
|       10001 |   8000 | 부장     |
|       10002 |   7800 | 과장     |
|       10003 |   7500 | 과장     |
|       10004 |   6800 | 대리     |
|       10005 |   7000 | 대리     |
|       10006 |   6000 | 대리     |
|       10007 |   5500 | 사원     |
|       10008 |   4500 | 사원     |
|       10009 |   7000 | 사원     |
+-------------+--------+----------+
+--------+
| salary |
+--------+
|   4500 |
|   5500 |
|   7000 |
+--------+
+-------------+--------+----------+
| employee_id | salary | position |
+-------------+--------+----------+
|       10000 |   9000 | 사장     |
|       10001 |   8000 | 부장     |
|       10002 |   7800 | 과장     |
|       10003 |   7500 | 과장     |
|       10005 |   7000 | 대리     |
|       10009 |   7000 | 사원     |
+-------------+--------+----------+

-- [실습7] 반환되는 데이터 형태에 따른 서브쿼리 분류 - 다중 행 서브쿼리 ANY

-- FOOD 테이블에는 음식 ID, 음식 타입, 음식 이름, 가격 정보가 담겨 있습니다.

-- 음식 중에서 임의의 Main 음식보다 가격이 비싼 음식을 조회하고자 합니다. 앞에서 배운 ANY를 이용하여 음식의 가격이 임의의 Main 음식보다 가격이 비싼지에 대한 조건을 작성해 봅시다.

-- 음식 중에서 음식 타입이 Main인 음식들의 가격을 구한 뒤, ANY를 이용하여 임의의 Main 음식보다 가격이 비싼 음식들에 대해서 조회하는 쿼리를 작성해 봅시다.
-- 지시사항
FOOD테이블에서 음식 타입(food_type)이 Main인 임의(ANY)의 음식 가격(price) 보다 가격이 비싼 음식들의 음식 ID(food_id), 음식 타입(food_type), 음식 이름(food_name), 가격(price) 을 조회하는 쿼리를 작성해봅시다.

-- 아래는 FOOD 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC FOOD;

SELECT * FROM FOOD;

-- 음식타입이 Main인 임의의 음식의 가격보다 비싼 음식들을 조회해봅시다.


select * from FOOD
where price > ANY (
    select price from FOOD
    where food_type = 'Main'
)
order by food_id;

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| food_id   | int(11)      | NO   | PRI | NULL    |       |
| food_type | varchar(30)  | NO   |     | NULL    |       |
| food_name | varchar(100) | NO   |     | NULL    |       |
| price     | int(11)      | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
+---------+-----------+-----------+-------+
| food_id | food_type | food_name | price |
+---------+-----------+-----------+-------+
|       1 | Appetizer | Salad     |  5000 |
|       2 | Appetizer | Soup      |  3500 |
|       3 | Main      | Pasta     |  8000 |
|       4 | Main      | Steak     | 11000 |
|       5 | Main      | rice      |  7000 |
|       6 | Dessert   | Ice-cream | 10000 |
|       7 | Dessert   | Cookie    |  5000 |
|       8 | Dessert   | Coffee    |  8000 |
+---------+-----------+-----------+-------+
+---------+-----------+-----------+-------+
| food_id | food_type | food_name | price |
+---------+-----------+-----------+-------+
|       3 | Main      | Pasta     |  8000 |
|       4 | Main      | Steak     | 11000 |
|       6 | Dessert   | Ice-cream | 10000 |
|       8 | Dessert   | Coffee    |  8000 |
+---------+-----------+-----------+-------+

-- [실습8] 반환되는 데이터 형태에 따른 서브쿼리 분류 - 다중 컬럼 서브쿼리
-- BOOK 테이블에는 책 ID, 책 이름, 책 작가, 가격 정보가 담겨있으며, BOOK_STOCK 테이블에는 재고 ID, 책 이름, 책 작가, 재고 수량 정보가 담겨 있습니다.

-- 재고가 남아있는 책에 대해서 책 ID, 책 이름, 책 작가, 가격을 조회하고자 합니다. BOOK_STOCK를 통해 재고가 1이상인 책의 정보를 얻어서, 
-- BOOK 테이블에서 해당 책의 정보를 조회합니다. 
-- 하지만 BOOK 테이블에 작가가 다르지만 책 이름이 동일한 경우가 있을 수 있으니, 책 이름과 책 작가, 2가지를 비교하여 정보를 조회하도록 합시다.

-- BOOK_STOCK 테이블에서 재고 수량(stock)이 1 이상인 데이터의 책 제목(book_name), 책 작가(book_writer) 를 추출하고 
-- 해당 데이터에 대해 BOOK 테이블과 IN을 활용하여 책 ID(book_id), 책 이름(book_name), 책 작가(book_writer), 가격(price) 을 조회하는 쿼리를 작성해봅시다.

-- 아래는 BOOK, BOOK_STOCK 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC BOOK;
DESC BOOK_STOCK;

-- BOOK_STOCK 테이블에서 재고가 1이상인 데이터의 책이름, 책작가 정보를 조회후, BOOK테이블에 IN을 활용하여 조회하는 쿼리를 작성해봅시다.

select * from BOOK;
select * from BOOK_STOCK;

select book_name, book_writer from BOOK_STOCK
where stock >= 1;

select * from BOOK as a
where (a.book_name, a.book_writer) IN (
    select b.book_name, b.book_writer 
    from BOOK_STOCK as b
    where b.stock >= 1
)
order by book_id;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| book_id     | int(11)      | NO   | PRI | NULL    |       |
| book_name   | varchar(100) | NO   |     | NULL    |       |
| book_writer | varchar(100) | NO   |     | NULL    |       |
| price       | int(11)      | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| stock_id    | int(11)      | NO   | PRI | NULL    |       |
| book_name   | varchar(100) | NO   |     | NULL    |       |
| book_writer | varchar(100) | NO   |     | NULL    |       |
| stock       | int(11)      | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+---------+--------------+-------------+-------+
| book_id | book_name    | book_writer | price |
+---------+--------------+-------------+-------+
|       1 | Hello SQL    | Elice       | 10000 |
|       2 | Hello JAVA   | KIM         | 20000 |
|       3 | Hello PYTHON | MOON        | 15000 |
|       4 | Hello SERVER | SONG        | 30000 |
+---------+--------------+-------------+-------+
+----------+--------------+-------------+-------+
| stock_id | book_name    | book_writer | stock |
+----------+--------------+-------------+-------+
|     1001 | Hello SQL    | Elice       |     0 |
|     1002 | Hello JAVA   | KIM         |     2 |
|     1003 | Hello PYTHON | MOON        |     3 |
|     1004 | Hello SERVER | SONG        |     0 |
+----------+--------------+-------------+-------+
+--------------+-------------+
| book_name    | book_writer |
+--------------+-------------+
| Hello JAVA   | KIM         |
| Hello PYTHON | MOON        |
+--------------+-------------+
+---------+--------------+-------------+-------+
| book_id | book_name    | book_writer | price |
+---------+--------------+-------------+-------+
|       2 | Hello JAVA   | KIM         | 20000 |
|       3 | Hello PYTHON | MOON        | 15000 |
+---------+--------------+-------------+-------+

-- [실습9] 스칼라 서브쿼리

-- LECTURE 테이블에는 강의 ID, 강의 이름, 강의 타입 ID 정보가 담겨 있고, LECTURE_TYPE 테이블에는 타입 ID, 타입 이름 정보가 담겨 있습니다.

-- LECTURE_TYPE 테이블에 있는 각 강의 타입들에 대해서 몇 개의 강의들이 존재하는지 조회하려고 합니다.
-- 각 강의 타입의 정보와, 해당 하는 타입에 대한 강의 개수를 조회하기 위해서 스칼라 서브쿼리를 이용해 봅시다.

-- LECTURE 테이블의 강의 타입 ID(lecture_type_id) 를 이용하여, LECTURE_TYPE 테이블에 대해서 타입 ID(type_id), 
-- 타입 이름(type_name), 타입에 해당하는 강의 개수를 조회하는 쿼리를 작성해봅시다.

-- 지시사항
-- LECTURE_TYPE 테이블에 대해, 타입 ID(type_id), 타입 이름(type_name), 타입별 강의 개수를 조회하는 쿼리를 작성하세요.
-- 이때, LECTURE 테이블과 COUNT를 응용하여 강의 타입 ID(lecture_type_id)와 타입 ID(type_id) 가 일치하는 조건으로, 
-- 타입별 강의 개수를 구하는 서브쿼리를 만들어야 합니다.

-- 아래는 LECTURE, LECTURE_TYPE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC LECTURE;
DESC LECTURE_TYPE;

-- 타입ID, 타입이름, 타입에 해당하는 강의의 수를 조회하는 쿼리를 작성해봅시다.

select * from LECTURE;
select * from LECTURE_TYPE;

select type_id, type_name, (
select count(*) from LECTURE as l
where lt.type_id = l.lecture_type_id
) as lecture_number
from LECTURE_TYPE as lt
order by type_id asc;

+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| lecture_id      | int(11)     | NO   | PRI | NULL    |       |
| lecture_name    | varchar(30) | NO   |     | NULL    |       |
| lecture_type_id | int(11)     | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| type_id   | int(11)     | NO   | PRI | NULL    |       |
| type_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
+------------+--------------+-----------------+
| lecture_id | lecture_name | lecture_type_id |
+------------+--------------+-----------------+
|          1 | SQL          |               3 |
|          2 | Network      |               1 |
|          3 | NoSQL        |               3 |
|          4 | UI/UX        |               2 |
|          5 | API          |               1 |
+------------+--------------+-----------------+
+---------+-----------+
| type_id | type_name |
+---------+-----------+
|       1 | Back-end  |
|       2 | Front-end |
|       3 | Database  |
+---------+-----------+
+---------+-----------+----------------+
| type_id | type_name | lecture_number |
+---------+-----------+----------------+
|       1 | Back-end  |              2 |
|       2 | Front-end |              1 |
|       3 | Database  |              2 |
+---------+-----------+----------------+

-- [실습10] 뷰

-- EMPLOYEE 테이블에는 직원 ID, 부서 이름, 급여 정보가 담겨있습니다.

-- 업무 상 부서이름이 ‘개발’인 직원들의 정보만 조회하는 경우가 빈번하여, 해당 직원들에 대한 뷰를 별도로 만들고자 합니다.

-- EMPLOYEE 테이블을 이용하여 부서 이름이 ‘개발’인 직원들의 직원 ID, 급여 정보를 가진 뷰(EMPLOYEE_DEV) 를 만드는 쿼리를 작성해봅시다.

-- 지시사항
-- EMPLOYEE테이블에서 부서 이름(department_name)이 ‘개발’ 인 직원들의 직원 ID(employee_id), 급여(salary) 정보를 가지는 EMPLOYEE_DEV 뷰(View) 를 만드는 쿼리를 작성해봅시다.

-- 1번에서 만든 EMPLOYEE_DEV 뷰에 대하여 뷰의 모든 데이터를 출력하는 쿼리를 작성하세요.

-- 아래는 EMPLOYEE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC EMPLOYEE;

-- 1. 부서이름이 '개발'인 직원의 직원ID, 급여 정보를 가지는 뷰(EMPLOYEE_DEV)를 만드는 쿼리를 작성해봅시다.
CREATE VIEW EMPLOYEE_DEV AS(
select employee_id, salary from EMPLOYEE
where department_name = '개발');
-- 2. 위에서 만든 뷰(EMPLOYEE_DEV)의 모든 데이터를 조회하는 쿼리를 작성해봅시다.
select * from EMPLOYEE_DEV;

+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| employee_id     | int(11)     | NO   | PRI | NULL    |       |
| department_name | varchar(30) | NO   |     | NULL    |       |
| salary          | int(11)     | NO   |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+
+-------------+--------+
| employee_id | salary |
+-------------+--------+
|       10001 |   8500 |
|       10002 |   9000 |
|       10009 |   9000 |
|       10010 |   7500 |
+-------------+--------+
