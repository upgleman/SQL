-- [미션1] 매출 비교

-- 엘리스 나라에서는 동부, 서부, 남부, 북부 4 지역으로 나누어서 가게들의 매출을 관리하고 있습니다. 이 중에서 남부 지역의 모든 가게보다 매출이 높은 가게를 찾아보려고 합니다.

-- STORE 테이블에 가게 ID, 가게 이름, 가게 위치, 매출액 정보가 담겨 있습니다.
-- 이 중, 가게 위치가 ‘남부’ 에 속해있는 모든 가게의 매출액보다 높은 매출액을 가진 가게에 대해서 서브쿼리와 ALL을 이용하여 쿼리를 작성해 봅시다.


-- STORE 테이블에서 가게 지역(store_location)이 ‘남부’ 인 가게들의 매출액(sales_amount) 을 조회하는 쿼리를 작성해봅시다.

-- 1번에서 작성한 쿼리와 ALL을 이용하여, 남부지역의 모든 가게들의 매출액보다 높은 매출을 가진 가게에 대해서 가게 ID(store_id), 가게 이름(store_name), 
-- 가게 위치(store_location), 매출액(sales_amount) 을 조회하는 쿼리를 작성해봅시다.

-- 아래는 STORE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STORE;

-- 1. 남부 지역 가게들의 매출액을 조회하는 쿼리를 작성해봅시다.
select  * from STORE;

select sales_amount
from STORE
where store_location = '남부'
order by sales_amount asc;

-- 2. 남부 지역의 모든 가게보다 매출이 높은 가게를 조회하는 쿼리를 작성해봅시다.
select * from STORE
where sales_amount > ALL (
    select sales_amount
    from STORE
    where store_location = '남부'
)
order by store_id asc;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| store_id       | int(11)     | NO   | PRI | NULL    |       |
| store_name     | varchar(30) | NO   |     | NULL    |       |
| store_location | varchar(10) | NO   |     | NULL    |       |
| sales_amount   | int(11)     | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------+--------------+----------------+--------------+
| store_id | store_name   | store_location | sales_amount |
+----------+--------------+----------------+--------------+
|    10000 | 치킨집       | 동부           |        10000 |
|    10001 | 서울치킨     | 남부           |        20000 |
|    10002 | 서울피자     | 북부           |        22000 |
|    10003 | 곱창집       | 북부           |        25000 |
|    10004 | 카페         | 서부           |        15000 |
|    10005 | 케이크집     | 남부           |        23000 |
|    10006 | 삼겹살       | 동부           |        38000 |
|    10007 | 부대찌개     | 서부           |        21000 |
|    10008 | 붕어빵       | 서부           |        18000 |
|    10009 | 북부치킨     | 북부           |        29000 |
|    10010 | 파스타       | 남부           |        17000 |
+----------+--------------+----------------+--------------+
+--------------+
| sales_amount |
+--------------+
|        17000 |
|        20000 |
|        23000 |
+--------------+
+----------+--------------+----------------+--------------+
| store_id | store_name   | store_location | sales_amount |
+----------+--------------+----------------+--------------+
|    10003 | 곱창집       | 북부           |        25000 |
|    10006 | 삼겹살       | 동부           |        38000 |
|    10009 | 북부치킨     | 북부           |        29000 |
+----------+--------------+----------------+--------------+

-- [미션2] 없는 물건 구하기

-- 엘리스 마트에서는 재고가 0인 품목들 중 창고에서 가져올 수 있는 상품의 목록을 구하려고 합니다.

-- ELICE_MART 테이블과 PRODUCT 테이블에는 서로 동일하게 상품 ID, 상품 이름, 재고 정보가 담겨 있습니다.

-- 각 테이블의 정보를 이용하여, 엘리스 마트에서 재고가 0인 품목들 중 창고에는 재고가 1개 이상으로 존재하는 상품의 정보를 조회해봅시다.

-- ELICE_MART 테이블과 PRODUCT 테이블의 구조는 아래와 같습니다.

-- ELICE_MART테이블에서 재고(stock)가 0인 상품의 상품 ID(product_id), 상품 이름(product_name) 을 조회하는 쿼리를 작성해봅시다.

-- 1번에서 작성한 쿼리에 AND로 조건을 더하여, PRODUCT 테이블에서 재고가 1 이상인 상품 ID, 상품 이름에 포함되는 상품에 대해 상품 ID(product_id), 
-- 상품 이름(product_name) 을 조회하는 쿼리를 작성해봅시다.

-- 아래는 ELICE_MART 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC ELICE_MART;
DESC PRODUCT;

-- 1. ELICE_MART 에서 재고가 0인 상품에 대해 조회하는 쿼리를 작성하세요.
select * from ELICE_MART;
select * from PRODUCT;


select product_id, product_name
from ELICE_MART
where stock = 0
order by product_id asc;
-- 2. ELICE_MART 에서는 재고가 0이고, PRODUCT 에서는 재고가 0 초과인 상품에 대해 조회하는 쿼리를 작성하세요.

select product_id, product_name
from ELICE_MART
where stock = 0
intersect
select product_id, product_name
from PRODUCT
where stock >= 1
order by product_id asc;

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| product_id   | int(11)     | NO   | PRI | NULL    |       |
| product_name | varchar(30) | NO   |     | NULL    |       |
| stock        | int(11)     | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| product_id   | int(11)     | NO   | PRI | NULL    |       |
| product_name | varchar(30) | NO   |     | NULL    |       |
| stock        | int(11)     | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
+------------+-----------------+-------+
| product_id | product_name    | stock |
+------------+-----------------+-------+
|          1 | 주스            |     3 |
|          2 | 책              |     0 |
|          4 | 컵              |    11 |
|          6 | 과자            |     6 |
|          7 | 아이스크림      |     1 |
|         10 | 쌀              |     0 |
+------------+-----------------+-------+
+------------+-----------------+-------+
| product_id | product_name    | stock |
+------------+-----------------+-------+
|          1 | 주스            |     2 |
|          2 | 책              |     4 |
|          3 | 반찬            |     8 |
|          4 | 컵              |    90 |
|          5 | 휴지            |     3 |
|          6 | 과자            |    23 |
|          7 | 아이스크림      |    11 |
|         10 | 쌀              |     0 |
+------------+-----------------+-------+
+------------+--------------+
| product_id | product_name |
+------------+--------------+
|          2 | 책           |
|         10 | 쌀           |
+------------+--------------+
+------------+--------------+
| product_id | product_name |
+------------+--------------+
|          2 | 책           |
+------------+--------------+

-- [미션3] 명단과 부서

-- EMPLOYEE 테이블에는 직원 ID, 직원 이름, 급여, 부서 ID 정보가 담겨있습니다.
-- 그리고 DEPARTMENT 테이블에는 부서 ID, 부서 이름 정보가 담겨 있습니다.

-- 두 개의 테이블에 대해서 INNER JOIN을 활용하여 직원 ID(employee_id), 직원 이름(employee_name), 
-- 급여(salary), 부서 ID(department_id), 부서 이름(department_name) 정보를 가지는 EMPLOYEE_DEPARTMENT 이름의 뷰를 만들어봅시다.

-- EMPLOYEE 테이블과 DEPARTMENT 테이블에 대해 부서 ID(department_id) 를 이용하여 INNER JOIN을 실시하는 쿼리를 기반으로 
-- EMPLOYEE_DEPARTMENT 뷰를 만들고, 해당 뷰의 모든 데이터를 조회하는 쿼리를 작성해봅시다.

-- 아래는 EMPLOYEE, DEPARTMENT 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC EMPLOYEE;
DESC DEPARTMENT;

-- EMPLOYEE_DEPARTMENT 뷰를 만들고, 뷰의 모든 데이터를 조회하세요.
select * from EMPLOYEE;
select * from DEPARTMENT;

CREATE VIEW EMPLOYEE_DEPARTMENT AS (
select a.employee_id, a.employee_name, a.salary, 
b.department_id, b.department_name
from EMPLOYEE as a
INNER JOIN DEPARTMENT as b
on b.department_id = a.department_id);

SELECT * FROM EMPLOYEE_DEPARTMENT;

+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| employee_id   | int(11)      | NO   | PRI | NULL    |       |
| employee_name | varchar(100) | NO   |     | NULL    |       |
| salary        | int(11)      | YES  |     | NULL    |       |
| department_id | int(11)      | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| department_id   | int(11)      | NO   | PRI | NULL    |       |
| department_name | varchar(200) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
+-------------+---------------+--------+---------------+
| employee_id | employee_name | salary | department_id |
+-------------+---------------+--------+---------------+
|        1000 | ELICE         |  12000 |             1 |
|        1001 | JESSICA       |   9000 |             2 |
|        1002 | STEVE         |   7500 |             3 |
|        1003 | LINDA         |   5500 |             1 |
|        1004 | DAVID         |   4400 |             2 |
|        1005 | ROBERT        |   3200 |             1 |
+-------------+---------------+--------+---------------+
+---------------+-----------------+
| department_id | department_name |
+---------------+-----------------+
|             1 | 개발            |
|             2 | 품질            |
|             3 | 영업            |
+---------------+-----------------+
+-------------+---------------+--------+---------------+-----------------+
| employee_id | employee_name | salary | department_id | department_name |
+-------------+---------------+--------+---------------+-----------------+
|        1000 | ELICE         |  12000 |             1 | 개발            |
|        1001 | JESSICA       |   9000 |             2 | 품질            |
|        1002 | STEVE         |   7500 |             3 | 영업            |
|        1003 | LINDA         |   5500 |             1 | 개발            |
|        1004 | DAVID         |   4400 |             2 | 품질            |
|        1005 | ROBERT        |   3200 |             1 | 개발            |
+-------------+---------------+--------+---------------+-----------------+