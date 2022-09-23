--01 집합연산자 & 계층형질의
--[실습1 해설] STANDARD SQL - 순수 관계 연산
-- student 테이블에는 여러 학생의 정보가 담겨있습니다.

-- 해당 테이블의 정보를 이용하여 3학년인 학생의 데이터만 조회하려고 합니다.
-- 하지만 테이블에는 3학년 이외 학생들의 정보도 함께 담겨있습니다.

-- 테이블에 있는 다양한 학생 중에서 3학년 학생들의 정보만 조회하기 위해, 과거에 학습했던 SELECT문과 WHERE문을 이용하여 학년(grade)이 3학년인 학생들만 조회해봅시다.
-- 지시사항
-- student테이블을 SELECT문을 통해 확인하세요.

WHERE문을 이용해 grade 컬럼에 적절한 조건을 걸어서 결과를 조회해 보세요.

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
lecture_basic 테이블과 lecture_special 테이블에는 ID, 강의 이름, 학생 번호, 학생 이름 정보가 담겨 있습니다.

해당 테이블의 데이터를 통해 기본강의와 특별강의 상관없이 강의에 참여한 학생들의 학생 번호와 학생 이름을 조회하고 싶습니다.

이를 위해, 두 개의 테이블에서 각각 학생 번호(student_number) 와 학생 이름(student_name) 을 조회하는 2개의 SELECT 쿼리 결과를 조회해 봅시다.

이때 데이터의 중복이 없도록 처리해주는 집합 연산자를 이용합니다.

-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;
select * from lecture_basic;
select * from lecture_special;

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
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | math         |          10001 | HongGildong  |
|  2 | korean       |          10001 | HongGildong  |
|  3 | math         |          10003 | HongGilsun   |
|  4 | math         |          10004 | KimChulsoo   |
+----+--------------+----------------+--------------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | piano        |          10001 | HongGildong  |
|  2 | kendo        |          10002 | KimAmugae    |
|  3 | piano        |          10003 | HongGilsun   |
|  4 | kendo        |          10003 | HongGilsun   |
+----+--------------+----------------+--------------+

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
-- chicken_store라는 치킨 가게 테이블과 pizze_store라는 피자 가게 테이블에는 각 테이블에 구조에 맞도록 가게 이름과 이용 가능 여부(available) 정보가 담겨있습니다.

-- 치킨 가게들과 피자 가게들 중에서 이용 가능한 모든 가게에 대해서 조회해보고자 합니다.

-- 앞에서 학습한 집합 연산자를 이용하여 각 테이블에서 이용 가능한 가게를 모두 조회해보세요. 하지만 이때, 중복되는 데이터는 제거해서 출력해봅시다.
-- 지시사항
-- chicken_store테이블을 확인하고, SELECT문을 이용해 가게 이름(store_name) 을 출력하되, WHERE 문을 이용하여 이용가능한(available = ‘Y’) 가게만 조회해보세요.

-- pizza_store테이블을 확인하고, SELECT문을 이용해 가게 이름(store_name) 을 출력하되, WHERE 문을 이용하여 이용가능한(available = ‘Y’) 가게만 조회해보세요.

-- 1번과 2번에서 조회된 결과에 대해서 데이터를 연결해서 조회하되, 중복을 제거하여 확인할 수 있도록 적절한 집합 연산자를 사용해보세요.

-- 아래 쿼리는 chicken_store, pizza_store 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC chicken_store;
DESC pizza_store;
select * from chicken_store;
select * from pizza_store;

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
+----+--------------------------+-----------+
| id | store_name               | available |
+----+--------------------------+-----------+
|  1 | bbp                      | Y         |
|  2 | 노노치킨                 | N         |
|  3 | BHA                      | Y         |
|  4 | 치킨나라피자왕자         | Y         |
+----+--------------------------+-----------+
+----+--------------------------+-----------+
| id | store_name               | available |
+----+--------------------------+-----------+
|  1 | 피자킹                   | Y         |
|  2 | 한올림피자               | Y         |
|  3 | 치킨나라피자왕자         | Y         |
|  4 | 도레미피자               | Y         |
|  5 | 피자나루                 | N         |
+----+--------------------------+-----------+
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
-- 이번에는 각 강의 테이블에 어떤 강의들이 몇 번씩 신청되었는지 세어보려고 합니다. 따라서 기본강의 테이블과 특별강의 테이블에서 강의 이름만 조회하되, 숫자를 세기 위해 중복된 강의명도 그대로 조회해야 합니다.

-- 두 개의 테이블에서 강의 이름(lecture_name) 에 대해서 조회하는 2개의 SELECT 쿼리의 결과를 함께 조회해 봅시다.
-- 이때 데이터의 중복에 대해서 별도 처리를 하지 않는 집합 연산자 를 이용합니다.
-- 지시사항
-- lecture_basic테이블을 확인하고, SELECT문을 이용해 강의 이름(lecture_name) 을 조회해 보세요.

-- lecture_special테이블을 확인하고, SELECT문을 이용해 강의 이름(lecture_name) 을 조회해 보세요.

-- 1번과 2번에서 조회된 결과에 대해서 집합 연산자 를 이용해 함께 조회하되, 데이터 정렬 및 중복제거를 시행하지 않도록 하세요.

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
-- request_past라는 신청(과거) 테이블과 request_new라는 신청(신규) 테이블에는 각 테이블에 구조에 맞도록 이름과 핸드폰 번호 정보가 공통으로 담겨 있습니다.

-- 과거에 신청했던 이력과 신규로 신청했던 이력들에 대해 과거/신규를 구분하지 않고 이름과 핸드폰번호를 조회하려고 합니다.

-- 두 개의 테이블에서 각각 이름(name) 과 핸드폰 번호(number) 를 조회하는 2개의 SELECT 쿼리 결과에 대해서 데이터를 연결하여 조회하되, 중복을 제거하지 않는 집합 연산자를 이용한 쿼리와 중복을 제거하는 집합 연산자를 이용한 쿼리를 만들어 봅시다.
-- 지시사항
-- request_past테이블과 request_new 테이블에서 각각 이름(name) 과 번호(number) 를 조회하는 SELECT문에 대해서 중복을 제거하지 않는 집합 연산자를 이용하여 데이터를 연결해보세요.

-- request_past테이블과 request_new 테이블에서 각각 이름(name) 과 번호(number) 를 조회하는 SELECT문에 대해서 중복을 제거하는 집합 연산자를 이용하여 데이터를 연결해보세요.

-- 아래 쿼리는 request_past, request_new 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC request_past;
DESC request_new;

select * from request_past;
select * from request_new;

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
+----+--------------+------------+
| id | name         | number     |
+----+--------------+------------+
|  1 | 김원숭       | 1012345678 |
|  2 | 김호랑       | 1011112222 |
|  3 | 이기린       | 1098765432 |
|  4 | 권펭귄       | 1011116789 |
|  5 | 김강아지     | 1099998765 |
+----+--------------+------------+
+----+--------------+------------+------------------+
| id | name         | number     | email            |
+----+--------------+------------+------------------+
|  1 | 최호랑       | 1022221234 | ho@naver.com     |
|  2 | 이기린       | 1098765432 | girin@naver.com  |
|  3 | 김공룡       | 1033331234 | gong@naver.com   |
|  4 | 이토끼       | 1012345679 | rabbit@naver.com |
|  5 | 박수달       | 1012345555 | park@naver.com   |
|  6 | 김강아지     | 1099998765 | dog@naver.com    |
+----+--------------+------------+------------------+
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
-- 이번에는 기본강의와 특별강의를 모두 수강하는 학생들의 정보를 알아보고자 합니다.

-- 두 개의 테이블에서 각각 학생 번호(student_number) 와 학생 이름(student_name) 을 조회하는 2개의 SELECT 쿼리 결과에 대해서 공통적으로 존재하는 데이터만 조회하는 쿼리를 집합 연산자 로 만들어 봅시다.
-- 지시사항
-- lecture_basic테이블을 확인하고, SELECT문을 이용해 학생 번호(student_number) 와 학생 이름(student_name) 을 조회해 보세요.

-- lecture_special테이블을 확인하고, SELECT문을 이용해 학생 번호(student_number) 와 학생 이름(student_name) 을 조회해 보세요.

-- 1번과 2번에서 조회된 결과에 대해서 집합 연산자를 이용해 공통으로 존재하는 데이터를 조회하세요.

-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;
select * from  lecture_basic;
select * from lecture_special;

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
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | math         |          10001 | HongGildong  |
|  2 | korean       |          10001 | HongGildong  |
|  3 | math         |          10003 | HongGilsun   |
|  4 | math         |          10004 | KimChulsoo   |
+----+--------------+----------------+--------------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | piano        |          10001 | HongGildong  |
|  2 | kendo        |          10002 | KimAmugae    |
|  3 | piano        |          10003 | HongGilsun   |
|  4 | kendo        |          10003 | HongGilsun   |
+----+--------------+----------------+--------------+
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
-- student라는 학생 테이블에는 학생들의 정보가, lecture_special이라는 특별강의 테이블에는 강의에 대한 신청 정보가 담겨 있습니다.

-- 학생 테이블에서 관리하는 학생들 중에서는 특별강의를 신청한 사람도 있고 아닌 사람도 있습니다.
-- 우리가 관리하고 있는 학생들 중에서 특별강의를 신청한 학생을 찾아봅시다.

-- 두 개의 테이블에서 각각 이름(name) 과 이메일(email) 을 조회하는 2개의 SELECT 쿼리 결과에 대해서 공통으로 존재하는 데이터만 조회하는 쿼리를 집합 연산자 로 만들어 봅시다.
-- 지시사항
-- student테이블을 확인하고, SELECT문을 이용해 이름(name) 과 이메일(email) 을 조회해 보세요.

-- lecture_special테이블을 확인하고, SELECT문을 이용해 이름(name) 와 이메일(email) 을 조회해 보세요.

-- 1번과 2번에서 조회된 결과에 대해서 집합 연산자를 이용해 공통으로 존재하는 데이터를 조회하세요.

-- 아래 쿼리는 student, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC student;
DESC lecture_special;
select * from student;
select * from lecture_special;

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
+----+----------------+--------------+-------+--------------------+
| id | student_number | name         | grade | email              |
+----+----------------+--------------+-------+--------------------+
|  1 |          10001 | HongGildong  |     2 | hong@naver.com     |
|  2 |          10002 | KimAmoogae   |     3 | NULL               |
|  3 |          10003 | HongGilsun   |     1 | hong.sun@naver.com |
|  4 |          10004 | KimChulsoo   |     3 | NULL               |
|  5 |          10005 | LeeMooMyeong |     4 | NULL               |
+----+----------------+--------------+-------+--------------------+
+----+--------------+-------------+------------------+
| id | lecture_name | name        | email            |
+----+--------------+-------------+------------------+
|  1 | piano        | Kimseulki   | seulki@naver.com |
|  2 | kendo        | KimGuest    | guest@naver.com  |
|  3 | piano        | HongGildong | hong@naver.com   |
|  4 | kendo        | HongGilsun  | hsun@naver.com   |
+----+--------------+-------------+------------------+
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
-- 이번에는 특별강의는 수강하지만, 기본강의는 수강하지 않는 학생들의 정보를 조회해보려고 합니다.

-- 두 개의 테이블에서 각각 학생 번호(student_number) 와 학생 이름(student_name) 을 조회하는 2개의 SELECT 쿼리 결과에 대해서, 집합 연산자 를 이용하여 lecture_special 테이블에는 존재하지만, lecture_basic 테이블에는 존재하지 않는 학생 번호(student_number) 와 학생 이름(student_name) 을 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- lecture_basic테이블을 확인하고, SELECT문을 이용해 학생 번호(student_number) 와 학생 이름(student_name) 을 조회해 보세요.

-- lecture_special테이블을 확인하고, SELECT문을 이용해 학생 번호(student_number) 와 학생 이름(student_name) 을 조회해 보세요.

-- 1번과 2번에서 조회된 결과에 대해서 집합 연산자를 이용해 lecture_special 테이블에는 존재하지만, lecture_basic 테이블에는 존재하지 않는 데이터를 조회하세요.
-- 아래 쿼리는 lecture_basic, lecture_special 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC lecture_basic;
DESC lecture_special;
select * from lecture_basic;
select * from  lecture_special;

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
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | math         |          10001 | HongGildong  |
|  2 | korean       |          10001 | HongGildong  |
|  3 | math         |          10003 | HongGilsun   |
|  4 | math         |          10004 | KimChulsoo   |
+----+--------------+----------------+--------------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | piano        |          10001 | HongGildong  |
|  2 | kendo        |          10002 | KimAmugae    |
|  3 | piano        |          10003 | HongGilsun   |
|  4 | kendo        |          10003 | HongGilsun   |
+----+--------------+----------------+--------------+
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
-- book_store_a라는 a 책방 테이블과 book_store_b라는 b 책방 테이블에는 각 테이블에 구조에 맞도록 책의 이름과 재고 등의 정보가 담겨있습니다.

-- 각 책방에서 재고가 존재하지만, 그 중에서도 a 책방에만 존재하는 책을 찾아보려고 합니다.

-- 두 개의 테이블에서 재고가 존재하는 (stock>0) 책에 대해서, book_store_a에만 존재하는 책의 이름(book_name) 을 집합 연산자로 출력해봅시다.
-- 지시사항
-- book_store_a테이블을 확인하고, SELECT문과 WHERE문을 이용해 재고(stock)가 0 초과인 데이터에 대해서 책의 이름(book_name) 을 조회해 보세요.

-- book_store_b테이블을 확인하고, SELECT문과 WHERE문을 이용해 재고(stock)가 0 초과인 데이터에 대해서 책의 이름(book_name) 을 조회해 보세요.

-- 1번과 2번에서 조회된 결과에 대해서 적절한 집합 연산자를 이용해 book_store_a 테이블에만 존재하는 책의 정보를 조회하세요.

-- 아래 쿼리는 book_store_a, book_store_b 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC book_store_a;
DESC book_store_b;
select * from book_store_a;
select * from book_store_b;

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
+----+--------------------+-------+-----------+
| id | book_name          | stock | writer    |
+----+--------------------+-------+-----------+
|  1 | 좋은시집           |     0 | 홍길동    |
|  2 | SQL특집            |     3 | 홍길동    |
|  3 | 정보처리기사       |     1 | 홍길순    |
|  4 | 수학               |     2 | 김철수    |
+----+--------------------+-------+-----------+
+----+--------------------------+-------+
| id | book_name                | stock |
+----+--------------------------+-------+
|  1 | SQL특집                  |     0 |
|  2 | 수학                     |     5 |
|  3 | 정보처리기사             |     2 |
|  4 | 정보처리산업기사         |     2 |
|  5 | 글쓰는개발자             |     1 |
+----+--------------------------+-------+
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
-- MEMBER 테이블에는 멤버 ID, 관리자 ID가 담겨 있습니다.

-- 각 멤버에 대해서 상위부터 몇 번째 관리자인지를 알아보고자 합니다. 즉, 최상위관리자는 0번째 관리자입니다.

-- 계층형 질의(WITH RECURSIVE) 를 이용하여, MEMBER 테이블에 대해 계층형 결과를 출력하려고 합니다. 앞에서 학습한 내용을 토대로 member_id, manager_id, lvl을 조회하세요.
-- 지시사항
-- 계층형 질의의 WITH RECURSIVE문을 이용하여, MEMBER테이블에 대해 member_id, manager_id, lvl을 조회하세요.

-- Tips!
-- lvl 값은 0부터 시작하도록 해주세요.
-- 결과에 대해 ORDER BY 를 이용하여 member_id 기준으로 오름차순, lvl 기준으로 오름차순 정렬을 해주세요.
-- 데이터 조회순서는 지시사항에서 언급하고 있는 순서대로 정확히 작성하세요.

-- 아래 쿼리는 MEMBER 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC MEMBER;
select * from MEMBER;

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
+-----------+------------+
| member_id | manager_id |
+-----------+------------+
|      1000 |       NULL |
|      1001 |       1000 |
|      1002 |       1001 |
|      1003 |       1002 |
|      1004 |       1002 |
|      1005 |       1000 |
|      1006 |       1005 |
|      1007 |       1006 |
+-----------+------------+
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
