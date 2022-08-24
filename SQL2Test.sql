--SQL2 실력테스트
--Q1.국가별 사용자

-- 아래는 USER 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC USER;

-- 미국 유저들에 대해 잔액정보 내림차순 기준으로 3개 그룹으로 나누어 데이터를 조회하세요.
--TIP) 미국 유저에 대한 조건은 WHERE문을 이용하고, 그룹을 나누기 위해서는 NTILE 함수를 이용해봅시다.

select * from USER;

select id, country, balance,
NTILE(3) OVER(ORDER BY balance DESC) group_num
from USER
where country = 'US';

-- 지시사항 1번을 참고하여 코드를 작성하세요.
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int(11)     | NO   | PRI | NULL    |       |
| country | varchar(30) | YES  |     | NULL    |       |
| balance | int(11)     | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
+----+---------+---------+
| id | country | balance |
+----+---------+---------+
|  1 | US      |   60000 |
|  2 | KR      |    5000 |
|  3 | US      |    1000 |
|  4 | US      |   20000 |
|  5 | US      |  100000 |
|  6 | JP      |   20000 |
|  7 | KR      |  300000 |
|  8 | KR      |   35000 |
|  9 | US      |    2000 |
| 10 | US      |   33000 |
| 11 | JP      |   15000 |
| 12 | US      |   10000 |
| 13 | JP      |     500 |
| 14 | KR      |    3000 |
| 15 | US      |   50000 |
| 16 | US      |   77000 |
+----+---------+---------+
+----+---------+---------+-----------+
| id | country | balance | group_num |
+----+---------+---------+-----------+
|  5 | US      |  100000 |         1 |
| 16 | US      |   77000 |         1 |
|  1 | US      |   60000 |         1 |
| 15 | US      |   50000 |         2 |
| 10 | US      |   33000 |         2 |
|  4 | US      |   20000 |         2 |
| 12 | US      |   10000 |         3 |
|  9 | US      |    2000 |         3 |
|  3 | US      |    1000 |         3 |
+----+---------+---------+-----------+



--Q2.이소셜 로그인 사용자
-- 지시사항 1번을 참고하여 코드를 작성하세요.

-- 아래는 USER_LINE, USER_KAKAO 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC USER_LINE;
DESC USER_KAKAO;

-- 정상적으로 가입된 유저에 대해 user_id와 user_email를 모두 출력해보세요.
--TIP) WHERE문을 통해 valid값이 true인 유저정보를 추출하는 2개의 SELECT문에 UNION집합연산자를 이용해보세요.

select * from USER_LINE;
select * from USER_KAKAO;

select user_id, user_email 
from USER_LINE
where valid = TRUE
UNION
select user_id, user_email 
from USER_KAKAO
where valid = TRUE
order by user_id asc;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| user_id    | varchar(100) | YES  |     | NULL    |       |
| line_id    | varchar(100) | YES  |     | NULL    |       |
| user_email | varchar(100) | YES  |     | NULL    |       |
| line_point | int(11)      | YES  |     | NULL    |       |
| valid      | tinyint(1)   | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| user_id    | varchar(100) | YES  |     | NULL    |       |
| kakao_id   | varchar(100) | YES  |     | NULL    |       |
| user_email | varchar(100) | YES  |     | NULL    |       |
| valid      | tinyint(1)   | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+----+---------+----------+-----------------+------------+-------+
| id | user_id | line_id  | user_email      | line_point | valid |
+----+---------+----------+-----------------+------------+-------+
|  1 | u001    | line0001 | hello@naver.com |       1000 |     1 |
|  2 | u002    | line0002 | aaa@naver.com   |      10000 |     1 |
|  3 | u003    | line0003 | hi@naver.com    |       5000 |     0 |
|  4 | u005    | line0005 | line@naver.com  |       5000 |     1 |
|  5 | u007    | line0006 | bbb@naver.com   |       9000 |     1 |
|  6 | u009    | line0007 | elice@naver.com |     100000 |     1 |
|  7 | u010    | line0008 | kim@naver.com   |       2000 |     0 |
|  8 | u011    | line0009 | lee@naver.com   |          0 |     1 |
|  9 | u012    | line0010 | choi@naver.com  |       1000 |     0 |
| 10 | u014    | line0011 | park@naver.com  |       5000 |     0 |
+----+---------+----------+-----------------+------------+-------+
+----+---------+----------+-----------------+-------+
| id | user_id | kakao_id | user_email      | valid |
+----+---------+----------+-----------------+-------+
|  1 | u002    | kakao01  | aaa@naver.com   |     0 |
|  2 | u004    | kakao02  | kkk@naver.com   |     0 |
|  3 | u005    | kakao03  | line@naver.com  |     1 |
|  4 | u006    | kakao04  | kakao@naver.com |     1 |
|  5 | u008    | kakao05  | daum@naver.com  |     1 |
|  6 | u009    | kakao06  | elice@naver.com |     1 |
|  7 | u013    | kakao07  | aaa@naver.com   |     1 |
+----+---------+----------+-----------------+-------+
+---------+-----------------+
| user_id | user_email      |
+---------+-----------------+
| u001    | hello@naver.com |
| u002    | aaa@naver.com   |
| u005    | line@naver.com  |
| u006    | kakao@naver.com |
| u007    | bbb@naver.com   |
| u008    | daum@naver.com  |
| u009    | elice@naver.com |
| u011    | lee@naver.com   |
| u013    | aaa@naver.com   |
+---------+-----------------+

-- Q3.실적에 따라 순위 매기기
-- 지시사항 1번을 참고하여 코드를 작성하세요.

-- 아래는 EMPLOYEE, EMPLOYEE_PERFORMANCE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC EMPLOYEE;
DESC EMPLOYEE_PERFORMANCE;

-- 두 테이블을 결합하여 성과 포인트를 기준으로 순위를 매겨 지시사항에서 요구하는 정보를 조회하세요.
--TIP) EMPLOYEE테이블의 id와 EMPLOYEE_PERFORMANCE테이블의 employee_id를 기준으로 INNER JOIN을 하고 performance_point 내림차순 기준으로 DENSE_RANK 함수를 활용해보세요.

select * from EMPLOYEE;
select * from EMPLOYEE_PERFORMANCE;

select DENSE_RANK() OVER (ORDER BY performance_point DESC) rank,
name, position, year, performance_point
from EMPLOYEE
inner join EMPLOYEE_PERFORMANCE
on EMPLOYEE.id = EMPLOYEE_PERFORMANCE.employee_id
where year ='2020'
order by rank asc, name asc;

+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int(11)      | NO   | PRI | NULL    |       |
| name     | varchar(100) | YES  |     | NULL    |       |
| position | varchar(100) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
+-------------------+--------------+------+-----+---------+-------+
| Field             | Type         | Null | Key | Default | Extra |
+-------------------+--------------+------+-----+---------+-------+
| id                | int(11)      | NO   | PRI | NULL    |       |
| year              | varchar(100) | YES  |     | NULL    |       |
| employee_id       | int(11)      | YES  |     | NULL    |       |
| performance_point | int(11)      | YES  |     | NULL    |       |
+-------------------+--------------+------+-----+---------+-------+
+----+------+----------+
| id | name | position |
+----+------+----------+
|  1 | kim  | 사원     |
|  2 | moon | 사원     |
|  3 | song | 사원     |
|  4 | lee  | 대리     |
|  5 | bae  | 대리     |
|  6 | choi | 과장     |
|  7 | park | 부장     |
+----+------+----------+
+----+------+-------------+-------------------+
| id | year | employee_id | performance_point |
+----+------+-------------+-------------------+
|  1 | 2019 |           1 |               100 |
|  2 | 2019 |           2 |                10 |
|  3 | 2019 |           3 |                50 |
|  4 | 2019 |           4 |               500 |
|  5 | 2019 |           5 |               260 |
|  6 | 2019 |           6 |              1000 |
|  7 | 2019 |           7 |                30 |
|  8 | 2020 |           1 |               200 |
|  9 | 2020 |           2 |               150 |
| 10 | 2020 |           3 |              1100 |
| 11 | 2020 |           4 |               200 |
| 12 | 2020 |           5 |              2700 |
| 13 | 2020 |           6 |              1000 |
| 14 | 2020 |           7 |              1500 |
+----+------+-------------+-------------------+
+------+------+----------+------+-------------------+
| rank | name | position | year | performance_point |
+------+------+----------+------+-------------------+
|    1 | bae  | 대리     | 2020 |              2700 |
|    2 | park | 부장     | 2020 |              1500 |
|    3 | song | 사원     | 2020 |              1100 |
|    4 | choi | 과장     | 2020 |              1000 |
|    5 | kim  | 사원     | 2020 |               200 |
|    5 | lee  | 대리     | 2020 |               200 |
|    6 | moon | 사원     | 2020 |               150 |
+------+------+----------+------+-------------------+


-- Q4. 기밀문서 분류하기
-- 아래는 DOCUMENT, DOCUMENT_TYPE, EMPLOYEE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC DOCUMENT;
DESC DOCUMENT_TYPE;
DESC EMPLOYEE;

-- 기밀 등급이 Top Secret이고 사원이 작성한 문서들의 정보를 출력하세요.
--TIP) 지시사항에 안내된 컬럼들을 통해 2개의 JOIN을 실시해봅시다.

select * from DOCUMENT;
select * from DOCUMENT_TYPE;
select * from EMPLOYEE;

select document_id, document_name, name,type_name,secret_grade
from DOCUMENT
inner join DOCUMENT_TYPE
on DOCUMENT.document_type = DOCUMENT_TYPE.document_type_id
inner join EMPLOYEE
on DOCUMENT.document_writer = EMPLOYEE.employee_id
where secret_grade = 'Top Secret' and position='사원'
order by document_id asc;

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| document_id     | int(11)      | NO   | PRI | NULL    |       |
| document_name   | varchar(100) | YES  |     | NULL    |       |
| document_type   | int(11)      | YES  |     | NULL    |       |
| document_writer | int(11)      | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
+------------------+--------------+------+-----+---------+-------+
| Field            | Type         | Null | Key | Default | Extra |
+------------------+--------------+------+-----+---------+-------+
| document_type_id | int(11)      | NO   | PRI | NULL    |       |
| type_name        | varchar(100) | YES  |     | NULL    |       |
| secret_grade     | varchar(100) | YES  |     | NULL    |       |
+------------------+--------------+------+-----+---------+-------+
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| employee_id | int(11)      | YES  |     | NULL    |       |
| name        | varchar(100) | YES  |     | NULL    |       |
| position    | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+-------------+---------------+---------------+-----------------+
| document_id | document_name | document_type | document_writer |
+-------------+---------------+---------------+-----------------+
|           1 | document 1    |             1 |               1 |
|           2 | document 2    |             4 |               3 |
|           3 | document 3    |             5 |               4 |
|           4 | document 4    |             6 |               5 |
|           5 | document 5    |             2 |               5 |
|           6 | document 6    |             1 |               2 |
|           7 | document 7    |             3 |               3 |
|           8 | document 8    |             4 |               5 |
|           9 | document 9    |             5 |               4 |
|          10 | document 10   |             6 |               1 |
|          11 | document 11   |             2 |               2 |
+-------------+---------------+---------------+-----------------+
+------------------+---------------------+--------------+
| document_type_id | type_name           | secret_grade |
+------------------+---------------------+--------------+
|                1 | 내부 기술           | Top Secret   |
|                2 | 대외 평가자료       | Top Secret   |
|                3 | 전략 기획서         | Top Secret   |
|                4 | 내부 홍보자료       | Secret       |
|                5 | 외부 홍보자료       | Confidential |
|                6 | 외부 강의자료       | Confidential |
+------------------+---------------------+--------------+
+-------------+------+----------+
| employee_id | name | position |
+-------------+------+----------+
|           1 | kim  | 사원     |
|           2 | park | 사원     |
|           3 | choi | 대리     |
|           4 | lee  | 부장     |
|           5 | moon | 사장     |
+-------------+------+----------+
+-------------+---------------+------+---------------------+--------------+
| document_id | document_name | name | type_name           | secret_grade |
+-------------+---------------+------+---------------------+--------------+
|           1 | document 1    | kim  | 내부 기술           | Top Secret   |
|           6 | document 6    | park | 내부 기술           | Top Secret   |
|          11 | document 11   | park | 대외 평가자료       | Top Secret   |
+-------------+---------------+------+---------------------+--------------+

-- Q5.마트와 백화점
-- 아래는 SUPERMARKET, DEPARTMENT_STORE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC SUPERMARKET;
DESC DEPARTMENT_STORE;

-- SUPERMARKET과 DEPARTMENT_STORE에서 취급되는 모든 상품을 조회하세요.
--TIP) FULL OUTER JOIN을 구현하기 위해 LEFT OUTER JOIN과 RIGHT OUTER JOIN, 집합연산자 UNION을 활용해봅시다.

select * from SUPERMARKET;
select * from DEPARTMENT_STORE;

select SUPERMARKET.product_id,SUPERMARKET.product_name,market_id, SUPERMARKET.price as market_price, store_id, DEPARTMENT_STORE.price as store_price
from SUPERMARKET
LEFT OUTER JOIN DEPARTMENT_STORE
on SUPERMARKET.product_id = DEPARTMENT_STORE.product_id

UNION

select DEPARTMENT_STORE.product_id,DEPARTMENT_STORE.product_name,market_id, SUPERMARKET.price as market_price, store_id, DEPARTMENT_STORE.price as store_price
from SUPERMARKET
RIGHT OUTER JOIN DEPARTMENT_STORE
on SUPERMARKET.product_id = DEPARTMENT_STORE.product_id

order by product_id asc;

+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| market_id    | int(11)      | NO   | PRI | NULL    |       |
| product_id   | varchar(100) | YES  |     | NULL    |       |
| product_name | varchar(100) | YES  |     | NULL    |       |
| price        | int(11)      | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| store_id     | int(11)      | NO   | PRI | NULL    |       |
| product_id   | varchar(100) | YES  |     | NULL    |       |
| product_name | varchar(100) | YES  |     | NULL    |       |
| price        | int(11)      | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
+-----------+------------+--------------+-------+
| market_id | product_id | product_name | price |
+-----------+------------+--------------+-------+
|         1 | p0001      | product1     |  1000 |
|         2 | p0003      | product3     | 10000 |
|         3 | p0004      | product4     |  5000 |
|         4 | p0005      | product5     |  6000 |
|         5 | p0006      | product6     |   500 |
|         6 | p0007      | product7     | 25000 |
|         7 | p0009      | product9     |  3000 |
+-----------+------------+--------------+-------+
+----------+------------+--------------+--------+
| store_id | product_id | product_name | price  |
+----------+------------+--------------+--------+
|        1 | p0001      | product1     |   1500 |
|        2 | p0002      | product2     |   1000 |
|        3 | p0005      | product5     |   8000 |
|        4 | p0006      | product6     |    500 |
|        5 | p0007      | product7     |  25000 |
|        6 | p0008      | product8     | 100000 |
+----------+------------+--------------+--------+
+------------+--------------+-----------+--------------+----------+-------------+
| product_id | product_name | market_id | market_price | store_id | store_price |
+------------+--------------+-----------+--------------+----------+-------------+
| p0001      | product1     |         1 |         1000 |        1 |        1500 |
| p0002      | product2     |      NULL |         NULL |        2 |        1000 |
| p0003      | product3     |         2 |        10000 |     NULL |        NULL |
| p0004      | product4     |         3 |         5000 |     NULL |        NULL |
| p0005      | product5     |         4 |         6000 |        3 |        8000 |
| p0006      | product6     |         5 |          500 |        4 |         500 |
| p0007      | product7     |         6 |        25000 |        5 |       25000 |
| p0008      | product8     |      NULL |         NULL |        6 |      100000 |
| p0009      | product9     |         7 |         3000 |     NULL |        NULL |
+------------+--------------+-----------+--------------+----------+-------------+

--Q6.멤버 계층구조
-- 아래는 MEMBER 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC MEMBER;

-- MEMBER 테이블로 계층형질의를 실시하고 lvl, member_name, manager_name을 조회하세요.
--TIP) 계층형 질의를 통한 CTE 테이블을 기준으로 MEMBER테이블과 LEFT OUTER JOIN을 해봅시다

select * from MEMBER;

WITH RECURSIVE CTE(member_id,member_name, manager_id, lvl) 
AS(
    SELECT member_id,member_name, manager_id, 0 as lvl
    FROM MEMBER 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT a.member_id,a.member_name, a.manager_id, b.lvl+1
    FROM MEMBER AS a
    JOIN CTE AS b
    ON a.manager_id = b.member_id
)

select * from CTE;

SELECT lvl, CTE.member_name, MEMBER.member_name as manager_name
FROM CTE
LEFT OUTER JOIN MEMBER
on CTE.manager_id = MEMBER.member_id
ORDER BY CTE.member_id ASC;

--기준을 역으로 해야 manager_name을 출력가능!

+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| member_id   | int(11)      | NO   | PRI | NULL    |       |
| member_name | varchar(100) | YES  |     | NULL    |       |
| manager_id  | int(11)      | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+

--MEMBER
+-----------+-------------+------------+
| member_id | member_name | manager_id |
+-----------+-------------+------------+
|         1 | Kim         |       NULL |
|         2 | Lee         |          1 |
|         3 | Choi        |          1 |
|         4 | Moon        |          1 |
|         5 | Song        |          2 |
|         6 | Park        |          3 |
|         7 | Ki          |          3 |
|         8 | Im          |          4 |
|         9 | Woo         |          5 |
|        10 | Bae         |          5 |
|        11 | Ko          |          6 |
+-----------+-------------+------------+

--CTE
+-----------+-------------+------------+------+
| member_id | member_name | manager_id | lvl  |
+-----------+-------------+------------+------+
|         1 | Kim         |       NULL |    0 |
|         2 | Lee         |          1 |    1 |
|         3 | Choi        |          1 |    1 |
|         4 | Moon        |          1 |    1 |
|         5 | Song        |          2 |    2 |
|         6 | Park        |          3 |    2 |
|         7 | Ki          |          3 |    2 |
|         8 | Im          |          4 |    2 |
|         9 | Woo         |          5 |    3 |
|        10 | Bae         |          5 |    3 |
|        11 | Ko          |          6 |    3 |
+-----------+-------------+------------+------+

+------+-------------+--------------+
| lvl  | member_name | manager_name |
+------+-------------+--------------+
|    0 | Kim         | NULL         |
|    1 | Lee         | Kim          |
|    1 | Choi        | Kim          |
|    1 | Moon        | Kim          |
|    2 | Song        | Lee          |
|    2 | Park        | Choi         |
|    2 | Ki          | Choi         |
|    2 | Im          | Moon         |
|    3 | Woo         | Song         |
|    3 | Bae         | Song         |
|    3 | Ko          | Park         |
+------+-------------+--------------+

-- Q7.분점들의 이벤트
-- 지시사항 1번을 참고하여 코드를 작성하세요.
-- 아래는 BRANCH, EVNET_HISTORY, TARGET_BRANCH 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC BRANCH;
DESC EVENT_HISTORY;
DESC TARGET_BRANCH;

-- 아직 체크되지 않은 분점들 중에서 sale 이벤트를 개최한 분점 정보를 출력하세요.
 --TIP) 비연관 서브쿼리를 통해 타겟 분점 ID를 구하여 정보를 출력해보세요.
 select * from BRANCH;
 select * from EVENT_HISTORY;
 select * from TARGET_BRANCH;
 
 select BRANCH.branch_id, branch_name,owner_name,event_type,event_dtl
from BRANCH
inner join EVENT_HISTORY
on BRANCH.branch_id = EVENT_HISTORY.branch_id
where  event_type = 'sale' and
BRANCH.branch_id = ANY (
    select branch_id 
    from TARGET_BRANCH
    where checked = FALSE
)
order by branch_id asc;

+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| branch_id   | int(11)      | NO   | PRI | NULL    |       |
| branch_name | varchar(100) | YES  |     | NULL    |       |
| owner_name  | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| event_id   | int(11)      | NO   | PRI | NULL    |       |
| branch_id  | int(11)      | YES  |     | NULL    |       |
| event_type | varchar(20)  | YES  |     | NULL    |       |
| event_dtl  | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+-----------+------------+------+-----+---------+-------+
| Field     | Type       | Null | Key | Default | Extra |
+-----------+------------+------+-----+---------+-------+
| target_id | int(11)    | NO   | PRI | NULL    |       |
| branch_id | int(11)    | YES  |     | NULL    |       |
| checked   | tinyint(1) | YES  |     | NULL    |       |
+-----------+------------+------+-----+---------+-------+
+-----------+-------------+------------+
| branch_id | branch_name | owner_name |
+-----------+-------------+------------+
|         1 | branch 01   | kim        |
|         2 | branch 02   | lee        |
|         3 | branch 03   | choi       |
|         4 | branch 04   | moon       |
|         5 | branch 05   | park       |
|         6 | branch 06   | song       |
|         7 | branch 07   | bae        |
|         8 | branch 08   | ko         |
|         9 | branch 09   | koo        |
|        10 | branch 10   | jeon       |
+-----------+-------------+------------+
+----------+-----------+------------+-------------+
| event_id | branch_id | event_type | event_dtl   |
+----------+-----------+------------+-------------+
|        1 |         3 | open       | open event! |
|        2 |         1 | open       | open event! |
|        3 |         7 | sale       | sale event! |
|        4 |         5 | sale       | sale event! |
|        5 |         2 | open       | open event! |
|        6 |         1 | sale       | sale event! |
|        7 |         3 | sale       | sale event! |
+----------+-----------+------------+-------------+
+-----------+-----------+---------+
| target_id | branch_id | checked |
+-----------+-----------+---------+
|         1 |         1 |       0 |
|         2 |         2 |       1 |
|         3 |         3 |       1 |
|         4 |         5 |       1 |
|         5 |         6 |       0 |
|         6 |         7 |       0 |
|         7 |         8 |       0 |
|         8 |         9 |       0 |
|         9 |        10 |       0 |
+-----------+-----------+---------+
+-----------+-------------+------------+------------+-------------+
| branch_id | branch_name | owner_name | event_type | event_dtl   |
+-----------+-------------+------------+------------+-------------+
|         1 | branch 01   | kim        | sale       | sale event! |
|         7 | branch 07   | bae        | sale       | sale event! |
+-----------+-------------+------------+------------+-------------+

-- Q8.코인 가격 차이
-- 아래는 KOREA_EXCHANGE, JAPAN_EXCHANGE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC KOREA_EXCHANGE;
DESC JAPAN_EXCHANGE;

-- 코인 티커가 동일한 코인에 대해서 한국 거래소 가격이 더 싸거나 같은 가격인 코인을 출력하세요.
--연관 서브쿼리를 이용하여, 코인 티커는 일치하지만 한국 거래소의 가격이 더 싸거나 같다는 조건을 만들어보세요.

select * from KOREA_EXCHANGE;
select * from JAPAN_EXCHANGE;

select KOREA_EXCHANGE.coin_ticker ,KOREA_EXCHANGE.price
from KOREA_EXCHANGE
where price <= ANY (
    select price
    from JAPAN_EXCHANGE
    where KOREA_EXCHANGE.coin_ticker = JAPAN_EXCHANGE.coin_ticker
)
order by coin_ticker asc;

+----+-------------+----------+
| id | coin_ticker | price    |
+----+-------------+----------+
|  1 | AAA         |      100 |
|  2 | BBB         |      200 |
|  3 | CCC         |     1000 |
|  4 | DDD         |   500000 |
|  5 | EEE         |   200000 |
|  6 | FFF         |     6500 |
|  7 | GGG         |    78000 |
|  8 | HHH         |  1000000 |
|  9 | III         |     3600 |
| 10 | JJJ         |       10 |
| 11 | KKK         | 80000000 |
| 12 | LLL         |    40000 |
| 13 | MMM         |        5 |
| 14 | NNN         |     1000 |
+----+-------------+----------+
+----+-------------+----------+
| id | coin_ticker | price    |
+----+-------------+----------+
|  1 | AAA         |      110 |
|  2 | BBB         |      300 |
|  3 | CCC         |     1000 |
|  4 | DDD         |   480000 |
|  5 | EEE         |   100000 |
|  6 | FFF         |     6600 |
|  7 | GGG         |    78100 |
|  8 | HHH         |   980000 |
|  9 | III         |     3300 |
| 10 | JJJ         |        8 |
| 11 | KKK         | 79950000 |
| 12 | LLL         |    30000 |
| 13 | MMM         |        4 |
| 14 | NNN         |     1000 |
+----+-------------+----------+
+-------------+-------+
| coin_ticker | price |
+-------------+-------+
| AAA         |   100 |
| BBB         |   200 |
| CCC         |  1000 |
| FFF         |  6500 |
| GGG         | 78000 |
| NNN         |  1000 |
+-------------+-------+

-- Q9.예약자 상세정보
-- 아래는 MEMBER, MEMBER_DTL, RESERVATION 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC MEMBER;
DESC MEMBER_DTL;
DESC RESERVATION;

-- 예약을 취소하지 않은 멤버들의 상세 정보를 출력하세요.
--INNER JOIN과 EXISTS를 활용하여 예약을 취소하지 않은 멤버의 상세 정보를 출력해보세요.

select * from MEMBER;
select * from MEMBER_DTL;
select * from RESERVATION;

select MEMBER.member_id, MEMBER.member_name, number, email
from MEMBER
inner join MEMBER_DTL
on MEMBER.member_id = MEMBER_DTL.member_id
where EXISTS (
    select member_id
    from RESERVATION
    where canceled=FALSE 
    and MEMBER.member_id=RESERVATION.member_id
)
order by MEMBER.member_id asc;

+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| member_id   | int(11)      | NO   | PRI | NULL    |       |
| member_name | varchar(100) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| member_id | int(11)      | NO   | PRI | NULL    |       |
| number    | varchar(100) | YES  |     | NULL    |       |
| email     | varchar(100) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
+----------------+------------+------+-----+---------+-------+
| Field          | Type       | Null | Key | Default | Extra |
+----------------+------------+------+-----+---------+-------+
| reservation_id | int(11)    | NO   | PRI | NULL    |       |
| member_id      | int(11)    | YES  |     | NULL    |       |
| canceled       | tinyint(1) | YES  |     | NULL    |       |
+----------------+------------+------+-----+---------+-------+
+-----------+-------------+
| member_id | member_name |
+-----------+-------------+
|         1 | Kim         |
|         2 | Lee         |
|         3 | Park        |
|         4 | Choi        |
|         5 | Song        |
|         6 | Koo         |
|         7 | Moon        |
|         8 | Bae         |
+-----------+-------------+
+-----------+---------------+---------------+
| member_id | number        | email         |
+-----------+---------------+---------------+
|         1 | 010-1111-1111 | aaa@naver.com |
|         2 | 010-2222-2222 | bbb@naver.com |
|         3 | 010-3333-3333 | ccc@naver.com |
|         4 | 010-4444-4444 | ddd@naver.com |
|         5 | 010-5555-5555 | eee@naver.com |
|         6 | 010-6666-6666 | fff@naver.com |
|         7 | 010-7777-7777 | ggg@naver.com |
|         8 | 010-8888-8888 | hhh@naver.com |
+-----------+---------------+---------------+
+----------------+-----------+----------+
| reservation_id | member_id | canceled |
+----------------+-----------+----------+
|              1 |         1 |        0 |
|              2 |         3 |        1 |
|              3 |         4 |        0 |
|              4 |         6 |        0 |
|              5 |         7 |        0 |
+----------------+-----------+----------+
+-----------+-------------+---------------+---------------+
| member_id | member_name | number        | email         |
+-----------+-------------+---------------+---------------+
|         1 | Kim         | 010-1111-1111 | aaa@naver.com |
|         4 | Choi        | 010-4444-4444 | ddd@naver.com |
|         6 | Koo         | 010-6666-6666 | fff@naver.com |
|         7 | Moon        | 010-7777-7777 | ggg@naver.com |
+-----------+-------------+---------------+---------------+