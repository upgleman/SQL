--01 집합연산자 & 계층형질의
--[실습1 해설] STANDARD SQL - 순수 관계 연산

-- 아래 쿼리는 student 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC student;

-- 순수 관계연산을 이용하여 student 테이블을 조회하는 쿼리를 작성해주세요.
select * from student;

-- 순수 관계 연산을 이용하여 student 테이블에서 grade가 3인 학생만 조회하는 쿼리를 작성해주세요.
select * from student
where grade = 3;

+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| id             | int(11)      | NO   | PRI | NULL    |       |
| student_number | int(11)      | NO   |     | NULL    |       |
| name           | varchar(30)  | NO   |     | NULL    |       |
| grade          | int(11)      | NO   |     | NULL    |       |
| email          | varchar(100) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
+----+----------------+--------------+-------+--------------------+
| id | student_number | name         | grade | email              |
+----+----------------+--------------+-------+--------------------+
|  1 |          10001 | HongGildong  |     2 | hong@naver.com     |
|  2 |          10002 | KimAmoogae   |     3 | NULL               |
|  3 |          10003 | HongGilsun   |     1 | hong.sun@naver.com |
|  4 |          10004 | KimChulsoo   |     3 | NULL               |
|  5 |          10005 | LeeMooMyeong |     4 | NULL               |
+----+----------------+--------------+-------+--------------------+
+----+----------------+------------+-------+-------+
| id | student_number | name       | grade | email |
+----+----------------+------------+-------+-------+
|  2 |          10002 | KimAmoogae |     3 | NULL  |
|  4 |          10004 | KimChulsoo |     3 | NULL  |
+----+----------------+------------+-------+-------+

--[실습2 해설] 집합 연산자 개념 - UNION(1)

-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;

-- 1. lecture_basic 테이블에서 학생번호(student_number)와 학생이름(student_name)을 조회하는 쿼리를 작성하세요.
select student_number,student_name from lecture_basic;

-- 2. lecture_special 테이블에서 학생번호(student_number)와 학생이름(student_name)을 조회하는 쿼리를 작성하세요.
select student_number, student_name from lecture_special;

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 데이터 연결 및 정렬과 중복제거(UNION 만)를 시행하는 쿼리를 작성하세요.
select student_number,student_name 
from lecture_basic
UNION
select student_number, student_name 
from lecture_special
order by student_number asc;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10003 | HongGilsun   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+

--[실습3 해설] 집합 연산자 개념 - UNION(2)

-- 아래 쿼리는 chicken_store, pizza_store 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC chicken_store;
DESC pizza_store;

-- 1. chicken_store에서 이용가능한 가게에 대해 가게이름만 출력하는 쿼리를 작성해보세요.
select store_name from chicken_store
where available ='Y';

-- 2. pizza_store에서 이용가능한 가게에 대해 가게이름만 출력하는 쿼리를 작성해보세요.
select store_name from pizza_store
where available = 'Y';

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 데이터 연결 및 정렬과 중복제거(UNION만)를 시행하는 쿼리를 작성하세요.
select store_name from chicken_store
where available ='Y'
UNION
select store_name from pizza_store
where available ='Y'
order by store_name asc;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| store_name | varchar(100) | NO   |     | NULL    |       |
| available  | varchar(1)   | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| store_name | varchar(100) | NO   |     | NULL    |       |
| available  | varchar(1)   | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+--------------------------+
| store_name               |
+--------------------------+
| bbp                      |
| BHA                      |
| 치킨나라피자왕자         | 
+--------------------------+
+--------------------------+
| store_name               |
+--------------------------+
| 피자킹                   |
| 한올림피자               |
| 치킨나라피자왕자         |
| 도레미피자               |
+--------------------------+
+--------------------------+
| store_name               |
+--------------------------+
| bbp                      |
| BHA                      |
| 도레미피자               |
| 치킨나라피자왕자         |
| 피자킹                   |
| 한올림피자               |
+--------------------------+

--[실습4 해설] 집합 연산자 개념 - UNION ALL

-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;

-- 1. lecture_basic 테이블에서 강의이름(lecture_name)을 조회하는 쿼리를 작성하세요.
select lecture_name from lecture_basic;

-- 2. lecture_special 테이블에서 강의이름(lecture_name)을 조회하는 쿼리를 작성하세요.
select lecture_name from lecture_special;

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 데이터를 연결하되 데이터의 중복제거(UNION ALL)를 시행하지 않는 쿼리를 작성하세요.
select lecture_name from lecture_basic
UNION ALL
select lecture_name from lecture_special
order by lecture_name;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+--------------+
| lecture_name |
+--------------+
| math         |
| korean       |
| math         |
| math         |
+--------------+
+--------------+
| lecture_name |
+--------------+
| piano        |
| kendo        |
| piano        |
| kendo        |
+--------------+
+--------------+
| lecture_name |
+--------------+
| kendo        |
| kendo        |
| korean       |
| math         |
| math         |
| math         |
| piano        |
| piano        |
+--------------+

--[실습5 해설] 집합 연산자 개념 - UNION/UNION ALL

-- 아래 쿼리는 request_past, request_new 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC request_past;
DESC request_new;

-- 1. 각 테이블에서 이름(name)과 번호(number)를 조회하고, 집합연산자를 통해 중복을 제거하지 않고 데이터를 연결해보세요.
select name,number from request_past
UNION ALL
select name, number from request_new
order by name;

-- 2. 각 테이블에서 이름(name)과 번호(number)를 조회하고, 집합연산자를 통해 중복을 제거하여 데이터를 연결해보세요.
select name,number from request_past
UNION
select name, number from request_new
order by name;

+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int(11)      | NO   | PRI | NULL    |       |
| name   | varchar(100) | NO   |     | NULL    |       |
| number | varchar(20)  | NO   |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int(11)      | NO   | PRI | NULL    |       |
| name   | varchar(100) | NO   |     | NULL    |       |
| number | varchar(20)  | NO   |     | NULL    |       |
| email  | varchar(100) | NO   |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
+--------------+------------+
| name         | number     |
+--------------+------------+
| 권펭귄       | 1011116789 |
| 김강아지     | 1099998765 |
| 김강아지     | 1099998765 |
| 김공룡       | 1033331234 |
| 김원숭       | 1012345678 |
| 김호랑       | 1011112222 |
| 박수달       | 1012345555 |
| 이기린       | 1098765432 |
| 이기린       | 1098765432 |
| 이토끼       | 1012345679 |
| 최호랑       | 1022221234 |
+--------------+------------+
+--------------+------------+
| name         | number     |
+--------------+------------+
| 권펭귄       | 1011116789 |
| 김강아지     | 1099998765 |
| 김공룡       | 1033331234 |
| 김원숭       | 1012345678 |
| 김호랑       | 1011112222 |
| 박수달       | 1012345555 |
| 이기린       | 1098765432 |
| 이토끼       | 1012345679 |
| 최호랑       | 1022221234 |
+--------------+------------+

--[실습6 해설] 집합 연산자 개념 - INTERSECT(1)

-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;

-- 1. lecture_basic 테이블에서 학생번호(student_number)와 학생이름(student_name)을 조회하는 쿼리를 작성하세요.
select student_number, student_name
from lecture_basic;

-- 2. lecture_special 테이블에서 학생번호(student_number)와 학생이름(student_name)을 조회하는 쿼리를 작성하세요.
select student_number, student_name
from lecture_special;

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 공통적으로 존재하는 데이터를 조회하는 쿼리를 작성해주세요.
select student_number, student_name
from lecture_basic
intersect
select student_number, student_name
from lecture_special
order by student_number;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10003 | HongGilsun   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
+----------------+--------------+

--[실습7 해설] 집합 연산자 개념 - INTERSECT(2)

-- 아래 쿼리는 student, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC student;
DESC lecture_special;

-- 1. student 테이블에서 이름(name)와 이메일(email)을 조회하는 쿼리를 작성하세요.
select name, email from student;

-- 2. lecture_special 테이블에서 이름(name)와 이메일(email)을 조회하는 쿼리를 작성하세요.
select name, email from lecture_special;

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 공통적으로 존재하는 데이터를 조회하는 쿼리를 작성해주세요.
select name, email from student
intersect
select name, email from lecture_special;

+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| id             | int(11)      | NO   | PRI | NULL    |       |
| student_number | int(11)      | NO   |     | NULL    |       |
| name           | varchar(30)  | NO   |     | NULL    |       |
| grade          | int(11)      | NO   |     | NULL    |       |
| email          | varchar(100) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| id           | int(11)      | NO   | PRI | NULL    |       |
| lecture_name | varchar(50)  | NO   |     | NULL    |       |
| name         | varchar(30)  | NO   |     | NULL    |       |
| email        | varchar(100) | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
+--------------+--------------------+
| name         | email              |
+--------------+--------------------+
| HongGildong  | hong@naver.com     |
| KimAmoogae   | NULL               |
| HongGilsun   | hong.sun@naver.com |
| KimChulsoo   | NULL               |
| LeeMooMyeong | NULL               |
+--------------+--------------------+
+-------------+------------------+
| name        | email            |
+-------------+------------------+
| Kimseulki   | seulki@naver.com |
| KimGuest    | guest@naver.com  |
| HongGildong | hong@naver.com   |
| HongGilsun  | hsun@naver.com   |
+-------------+------------------+
+-------------+----------------+
| name        | email          |
+-------------+----------------+
| HongGildong | hong@naver.com |
+-------------+----------------+

--[실습8 해설] 집합 연산자 개념 - EXCEPT(1)

-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;

-- 1. lecture_basic 테이블에서 학생번호(student_number)와 학생이름(student_name)을 조회하는 쿼리를 작성하세요.
select student_number, student_name
from lecture_basic;


-- 2. lecture_special 테이블에서 학생번호(student_number)와 학생이름(student_name)을 조회하는 쿼리를 작성하세요.
select student_number, student_name
from lecture_special;

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 lecture_special 테이블에는 존재하지만, lecture_basic에는 
-- 존재하지 않는 학생번호와 학생이름을 조회하는 쿼리를 작성하세요.
select student_number, student_name
from lecture_special
except
select student_number,student_name
from lecture_basic
order by student_number;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10003 | HongGilsun   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10002 | KimAmugae    |
+----------------+--------------+

--[실습9 해설] 집합 연산자 개념 - EXCEPT(2)

-- 아래 쿼리는 book_store_a, book_store_b 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC book_store_a;
DESC book_store_b;

-- 1. book_store_a 테이블에서 재고(stock)가 0 초과인 데이터의 책의이름(book_name)을 조회하는 쿼리를 작성하세요.
select book_name from book_store_a
where stock >0;

-- 2. book_store_b 테이블에서 재고(stock)가 0 초과인 데이터의 책의이름(book_name)을 조회하는 쿼리를 작성하세요.
select book_name from book_store_b
where stock >0;

-- 3. 위 2개의 쿼리에 대해서 집합 연산자를 이용하여 book_store_a에만 존재하는 데이터를 조회하세요.
select book_name from book_store_a
where stock > 0
except
select book_name from book_store_b
where stock > 0;

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| book_name | varchar(100) | NO   |     | NULL    |       |
| stock     | int(11)      | NO   |     | NULL    |       |
| writer    | varchar(30)  | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| book_name | varchar(100) | NO   |     | NULL    |       |
| stock     | int(11)      | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
+--------------------+
| book_name          |
+--------------------+
| SQL특집            |
| 정보처리기사       |
| 수학               |
+--------------------+
+--------------------------+
| book_name                |
+--------------------------+
| 수학                     |
| 정보처리기사             |
| 정보처리산업기사         |
| 글쓰는개발자             |
+--------------------------+
+-----------+
| book_name |
+-----------+
| SQL특집   |
+-----------+

--[실습10 해설] 계층형 질의

-- 아래 쿼리는 MEMBER 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC MEMBER;

-- 계층형 질의, WITH RECURSIVE 를 이용하여, member_id, manager_id, lvl을 출력하되
-- member_id 오름차순, lvl 오름차순 정렬을 적용하여 쿼리를 작성하세요.

WITH RECURSIVE CTE(member_id, manager_id, lvl) 
AS(
    SELECT member_id, manager_id, 0 as lvl
    FROM MEMBER 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT a.member_id, a.manager_id, b.lvl+1
    FROM MEMBER AS a
    JOIN CTE AS b
    ON a.manager_id = b.member_id
)

SELECT member_id, manager_id, lvl
FROM CTE
ORDER BY member_id ASC, lvl ASC;

+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| member_id  | int(11) | NO   | PRI | NULL    |       |
| manager_id | int(11) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
+-----------+------------+------+
| member_id | manager_id | lvl  |
+-----------+------------+------+
|      1000 |       NULL |    0 |
|      1001 |       1000 |    1 |
|      1002 |       1001 |    2 |
|      1003 |       1002 |    3 |
|      1004 |       1002 |    3 |
|      1005 |       1000 |    1 |
|      1006 |       1005 |    2 |
|      1007 |       1006 |    3 |
+-----------+------------+------+
