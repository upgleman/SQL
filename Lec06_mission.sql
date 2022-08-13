--[미션1] 살 수 있는 물건들

-- 1. 2개의 커머스 사이트 상관없이 구매할 수 있는 상품이름의 목록을 조회해 봅시다.
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

-- 지각 이력이 없는 학생의 학생번호를 조회하는 쿼리를 작성해보세요.
select * from STUDENT;
select * from LATE_CHECK_LIST;


SELECT student_id
FROM STUDENT

EXCEPT

SELECT student_id
FROM LATE_CHECK_LIST
ORDER BY student_id;

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

