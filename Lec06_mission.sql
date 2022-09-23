-- 01 집합연산자 & 계층형질의

--[미션1] 살 수 있는 물건들
-- 엘리스 토끼는 두 개의 커머스 사이트에서 구매할 수 있는 물건에 대해 알아보려고 합니다.
-- 첫 번째로는 두 개의 커머스 사이트 위치에 상관없이 구매할 수 있는 상품의 이름을 찾아보려고 하고,
-- 두 번째로는 두 개의 커머스 사이트에서 공통으로 구매할 수 있는 상품의 이름을 찾아보려고 합니다.

-- 각 커머스 사이트에서 재고가 0인 것은 구매할 수 없으니, 재고가 0 이상인 상품에 관해서만 확인해봅시다.

-- 지시사항
-- 각 커머스 사이트에서 구매할 수 있는 모든 상품 이름의 목록을 조회해 봅시다.

-- COMMERCE_A테이블과 COMMERCE_B테이블에 대해 ‘구매할 수 있는’ 조건을 걸어 상품 이름(product_name) 만 출력 후 적절한 집합 연산자 를 이용하여 쿼리를 작성해보세요.
-- 2개의 커머스 사이트에서 공통적으로 구매할 수 있는 모든 상품 이름의 목록을 조회해 봅시다.

-- COMMERCE_A테이블과 COMMERCE_B테이블에 대해 ‘구매할 수 있는’ 조건을 걸어 상품 이름(product_name) 만 출력 후 적절한 집합 연산자 를 이용하여 쿼리를 작성해보세요.

-- 1. 2개의 커머스 사이트 상관없이 구매할 수 있는 상품이름의 목록을 조회해 봅시다.

DESC COMMERCE_A;
DESC COMMERCE_B;

select * from COMMERCE_A;
select * from COMMERCE_B;

select product_name
from COMMERCE_A
where product_stock > 0

UNION

select product_name
from COMMERCE_B
where product_stock > 0
ORDER BY product_name;

-- 2. 2개의 커머스 사이트에서 공통적으로 구매할 수 있는 모든 상품이름의 목록을 조회해 봅시다.
select product_name
from COMMERCE_A
where product_stock > 0

INTERSECT

select product_name
from COMMERCE_B
where product_stock > 0
ORDER BY product_name;

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| product_id    | int(11)     | NO   | PRI | NULL    |       |
| product_name  | varchar(30) | NO   |     | NULL    |       |
| product_stock | int(11)     | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
+---------------------+--------------+------+-----+---------+-------+
| Field               | Type         | Null | Key | Default | Extra |
+---------------------+--------------+------+-----+---------+-------+
| product_id          | int(11)      | NO   | PRI | NULL    |       |
| product_name        | varchar(30)  | NO   |     | NULL    |       |
| product_stock       | int(11)      | NO   |     | NULL    |       |
| product_seller_name | varchar(100) | NO   |     | NULL    |       |
+---------------------+--------------+------+-----+---------+-------+

+------------+--------------+---------------+
| product_id | product_name | product_stock |
+------------+--------------+---------------+
|      10001 | computer     |             5 |
|      10002 | mouse        |             1 |
|      10003 | monitor      |             0 |
|      10004 | keyboard     |             3 |
+------------+--------------+---------------+
+------------+--------------+---------------+---------------------+
| product_id | product_name | product_stock | product_seller_name |
+------------+--------------+---------------+---------------------+
|      20001 | mouse        |            10 | seller-A            |
|      20002 | phone        |             0 | seller-A            |
|      20003 | phone-case   |             2 | seller-A            |
|      20004 | keyboard     |             3 | seller-A            |
|      20005 | computer     |             0 | seller-B            |
|      20006 | matrix       |             1 | seller-C            |
+------------+--------------+---------------+---------------------+

+--------------+
| product_name |
+--------------+
| computer     |
| keyboard     |
| matrix       |
| mouse        |
| phone-case   |
+--------------+
+--------------+
| product_name |
+--------------+
| keyboard     |
| mouse        |
+--------------+

--[미션2] 개근상 받을 사람

-- 엘리스 스쿨에서는 1학년 학생 중에서 지금까지 지각하지 않은 학생들에 대해서 개근상을 주려고 합니다.
-- 그동안 지각을 했던 학생들은 LATE_CHECK_LIST 테이블에 학생 번호를 기록해뒀습니다.

-- 학생 정보가 담겨있는 STUDENT 테이블과, 지각 이력 정보가 담겨있는 LATE_CHECK_LIST 를 이용해 누가 개근상을 받을지 학생 번호(student_id) 를 확인해봅시다.

-- 지시사항
-- STUDENT테이블에서 1학년 학생들을 대상으로 적절한 집합 연산자 를 이용하여 지각이력이 있는 학생은 제외하고 학생번호(student_id) 를 조회하는 쿼리를 작성해보세요.

-- 지각 이력이 없는 학생의 학생번호를 조회하는 쿼리를 작성해보세요.

DESC STUDENT;
DESC LATE_CHECK_LIST;

select * from STUDENT;
select * from LATE_CHECK_LIST;


SELECT student_id
FROM STUDENT

EXCEPT

SELECT student_id
FROM LATE_CHECK_LIST
ORDER BY student_id;

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| student_id    | int(11)     | NO   | PRI | NULL    |       |
| product_name  | varchar(30) | NO   |     | NULL    |       |
| student_grade | int(11)     | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
+---------------+---------+------+-----+---------+-------+
| Field         | Type    | Null | Key | Default | Extra |
+---------------+---------+------+-----+---------+-------+
| late_check_id | int(11) | NO   | PRI | NULL    |       |
| student_id    | int(11) | NO   |     | NULL    |       |
+---------------+---------+------+-----+---------+-------+

+------------+--------------+---------------+
| student_id | product_name | student_grade |
+------------+--------------+---------------+
|      10001 | kim          |             1 |
|      10002 | lee          |             1 |
|      10003 | park         |             2 |
|      10004 | choi         |             3 |
|      10005 | moon         |             1 |
|      10006 | song         |             3 |
|      10007 | jang         |             4 |
+------------+--------------+---------------+
+---------------+------------+
| late_check_id | student_id |
+---------------+------------+
|             1 |      10005 |
|             2 |      10006 |
|             3 |      10003 |
|             4 |      10005 |
|             5 |      10005 |
+---------------+------------+
+------------+
| student_id |
+------------+
|      10001 |
|      10002 |
|      10004 |
|      10007 |
+------------+

--[미션3] 멘토와 멘티

-- 엘리스 스쿨의 학생들은 멘토와 멘티 프로그램에 참여하고 있습니다.
-- 멘토이면서 멘티인 학생도 있고, 멘토만 또는 멘티만 하는 학생도 있습니다.
-- (그림으로 그려보면 계층형이 될 것 같아요!)

-- 어느 날, 엘리스 스쿨의 담당 선생님은 멘토와 멘티 정보가 담겨있는 MEMBER 테이블을 통해 누가 첫 번째 멘토인지, 누가 몇 번째 멘토인지, 계층적으로 확인해보려고 합니다.

-- MEMBER 테이블에 대해서 WITH RECURSIVE 절을 이용하여 데이터를 계층형으로 출력하는 쿼리를 작성해봅시다.

-- 이때 출력하고자 하는 컬럼은, mentee_id, mento_id, lvl 이고, 가장 최상단에 있는 멘토는 lvl = 0 이고, 한 계층마다 1씩 증가하는 것 으로 설정합시다.

-- WITH RECURSIVE 를 이용하여 계층형 질의를 작성해보세요.
DESC MEMBER;

select * from MEMBER;

WITH RECURSIVE CTE(mentee_id, mento_id, lvl) 
AS(
    SELECT mentee_id, mento_id, 0 as lvl
    FROM MEMBER 
    WHERE mento_id IS NULL
    UNION ALL
    SELECT a.mentee_id, a.mento_id, b.lvl+1
    FROM MEMBER AS a
    JOIN CTE AS b
    ON a.mento_id = b.mentee_id
)

SELECT mentee_id, mento_id, lvl
FROM CTE
ORDER BY mentee_id ASC, lvl ASC;

+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| mentee_id | int(11) | NO   | PRI | NULL    |       |
| mento_id  | int(11) | YES  |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
+-----------+----------+
| mentee_id | mento_id |
+-----------+----------+
|      1000 |     NULL |
|      1001 |     NULL |
|      1002 |     1000 |
|      1003 |     1001 |
|      1004 |     1000 |
|      1005 |     1002 |
|      1006 |     1003 |
|      1007 |     1004 |
|      1008 |     1002 |
|      1009 |     1005 |
|      1010 |     1006 |
|      1011 |     1010 |
+-----------+----------+
+-----------+----------+------+
| mentee_id | mento_id | lvl  |
+-----------+----------+------+
|      1000 |     NULL |    0 |
|      1001 |     NULL |    0 |
|      1002 |     1000 |    1 |
|      1003 |     1001 |    1 |
|      1004 |     1000 |    1 |
|      1005 |     1002 |    2 |
|      1006 |     1003 |    2 |
|      1007 |     1004 |    2 |
|      1008 |     1002 |    2 |
|      1009 |     1005 |    3 |
|      1010 |     1006 |    3 |
|      1011 |     1010 |    4 |
+-----------+----------+------+

