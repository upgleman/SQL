-- [실습1] 테이블의 구조 - DESC

-- DESC문을 이용해 employees 테이블의 구조를 출력해보세요.
desc employees;

-- DESC문을 이용해 salaries 테이블의 구조를 출력해보세요.
desc salaries;

+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| emp_no      | int(11)       | NO   | PRI | NULL    |       |
| birth_date  | date          | NO   |     | NULL    |       |
| first_name  | varchar(14)   | NO   |     | NULL    |       |
| last_name   | varchar(16)   | NO   |     | NULL    |       |
| gender      | enum('M','F') | NO   |     | NULL    |       |
| hire_date   | date          | NO   |     | NULL    |       |
| superior_no | int(11)       | YES  | MUL | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   |     | NULL    |       |
| salary    | int(11) | NO   |     | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+



-- [실습2] 데이터 조회하기 - SELECT 1

-- SELECT문을 이용해 book테이블을 조회하는 쿼리를 작성해주세요.
SELECT * FROM book;

+------+------------------------------------------+------------------------------+-------------------------+---------------+
| id   | title                                    | author                       | publisher               | date_received |
+------+------------------------------------------+------------------------------+-------------------------+---------------+
| 1000 | Romeo and Juliet                         | William Shakespeare          | NULL                    | 2012-04-01    |
| 1001 | Don Quixote                              | Miguel de Cervantes Saavedra | NULL                    | 2015-03-31    |
| 1002 | The Little Prince                        | Antoine de Saint-Exupery     | NULL                    | 2018-12-21    |
| 1003 | Harry Potter and the Philosopher's Stone | Joanne Kathleen Rowling      | Bloomsbury Publishing   | 2017-06-26    |
| 1004 | The Lord of the Rings                    | John Ronald Reuel Tolkien    | Allen & Unwin           | 2014-07-29    |
| 1006 | Alice's Adventures in Wonderland         | Lewis Carroll                | Macmillan               | 2015-11-26    |
| 1007 | The Old Man and the Sea                  | Ernest Miller Hemingway      | Charles Scribner's Sons | 2014-11-02    |
| 1008 | The Great Gatsby                         | Francis Scott Key Fitzgerald | NULL                    | 2019-01-12    |
| 1009 | Harry Potter and the Deathly Hallows     | Joanne Kathleen Rowling      | Bloomsbury Publishing   | 2017-07-21    |
+------+------------------------------------------+------------------------------+-------------------------+---------------+
'
-- [실습3] 데이터 조회하기 - SELECT 2

-- SELECT문을 이용해 employees테이블을 조회하는 쿼리를 작성해주세요

SELECT * FROM employees;

+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |        NULL |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |        NULL |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |        NULL |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |        NULL |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |       10001 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |       10002 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |       10002 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |        NULL |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |        NULL |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |       10001 |
+--------+------------+------------+-----------+--------+------------+-------------+


--[실습4] 데이터 조회하기 - SELECT 3

-- book 테이블의 구조를 조회하는 쿼리입니다. 수정하실 필요는 없습니다.
DESC book;

-- 책의 제목과 저자만 골라서 조회하는 쿼리를 작성해주세요.
select title,author from book;

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int(11)     | NO   | PRI | NULL    |       |
| title         | varchar(64) | NO   |     | NULL    |       |
| author        | varchar(64) | YES  |     | NULL    |       |
| publisher     | varchar(32) | YES  |     | NULL    |       |
| date_received | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+

+------------------------------------------+------------------------------+
| title                                    | author                       |
+------------------------------------------+------------------------------+
| Romeo and Juliet                         | William Shakespeare          |
| Don Quixote                              | Miguel de Cervantes Saavedra |
| The Little Prince                        | Antoine de Saint-Exupery     |
| Harry Potter and the Philosopher's Stone | Joanne Kathleen Rowling      |
| The Lord of the Rings                    | John Ronald Reuel Tolkien    |
| Alice's Adventures in Wonderland         | Lewis Carroll                |
| The Old Man and the Sea                  | Ernest Miller Hemingway      |
| The Great Gatsby                         | Francis Scott Key Fitzgerald |
| Harry Potter and the Deathly Hallows     | Joanne Kathleen Rowling      |
+------------------------------------------+------------------------------+

-- [실습5] 데이터 고유값만 출력하기 - DISTINCT
-- salaries 테이블에 있는 직원 번호를 중복 없이 출력해 봅니다.

select distinct emp_no
from salaries;

+--------+
| emp_no |
+--------+
|  10001 |
|  10002 |
|  10003 |
|  10004 |
|  10005 |
|  10006 |
|  10007 |
+--------+

-- [실습6] SELECT에 조건 추가하기 - WHERE 1

-- Joanne Kathleen Rowling작가의 책만 골라서 조회하는 쿼리를 작성해주세요.
select * from book where author = 'Joanne Kathleen Rowling';

+------+------------------------------------------+-------------------------+-----------------------+---------------+
| id   | title                                    | author                  | publisher             | date_received |
+------+------------------------------------------+-------------------------+-----------------------+---------------+
| 1003 | Harry Potter and the Philosopher's Stone | Joanne Kathleen Rowling | Bloomsbury Publishing | 2017-06-26    |
| 1009 | Harry Potter and the Deathly Hallows     | Joanne Kathleen Rowling | Bloomsbury Publishing | 2017-07-21    |
+------+------------------------------------------+-------------------------+-----------------------+---------------+
'
-- [실습7] SELECT에 조건 추가하기 - WHERE 2

-- gender가 'M'인 직원만 골라서 조회하는 쿼리를 작성해주세요.
select * from employees where gender = 'M';

+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |        NULL |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |        NULL |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |        NULL |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |       10001 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |       10002 |
+--------+------------+------------+-----------+--------+------------+-------------+

--[실습8] 여러 개의 조건 추가하기 - WHERE 1

DESC score;

-- 수학 점수가 80점 초과, 국어 점수가 90점 이상인 학생의 정보를 검색해보세요.
select * from score where math > 80 and korean >= 90;

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(32) | NO   | PRI | NULL    |       |
| korean  | int(11)     | YES  |     | NULL    |       |
| english | int(11)     | YES  |     | NULL    |       |
| math    | int(11)     | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
+--------+--------+---------+------+
| name   | korean | english | math |
+--------+--------+---------+------+
| Dodo   |     90 |      90 |  100 |
| Hatter |     90 |      80 |   90 |
+--------+--------+---------+------+

--[실습9] 여러 개의 조건 추가하기 - WHERE 2

-- 여자 직원 중 이름이 Chirstian인 직원들을 출력합니다.
select * from employees where gender = 'F' and first_name = 'Chirstian';

+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  14201 | 1964-07-03 | Chirstian  | Carrere   | F      | 1991-07-26 |       10909 |
|  15087 | 1954-10-11 | Chirstian  | Ushiama   | F      | 1988-09-14 |        NULL |
+--------+------------+------------+-----------+--------+------------+-------------+

--[실습10] 논리연산자를 활용하여 조건 만들기

-- 문제의 조건에 맞는 직원을을 출력합니다.
select * from employees 
where 
(first_name ='Chirstian' or first_name ='Georgi')
and gender ='M'
-- and not hire_date in ('1986-06-26')
and hire_date != '1986-06-26';

+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10008 | 1958-02-19 | Chirstian  | Kalloufi  | M      | 1994-09-15 |       10002 |
|  10909 | 1954-11-11 | Georgi     | Atchley   | M      | 1985-04-21 |        NULL |
|  11430 | 1957-01-23 | Georgi     | Lueh      | M      | 1997-06-17 |       16258 |
|  14201 | 1964-07-03 | Chirstian  | Lueh      | M      | 1991-07-26 |       10002 |
+--------+------------+------------+-----------+--------+------------+-------------+

--[실습11] 범위를 지정하여 검색하기 - BETWEEN 1

DESC score;

-- 짜장면을 받을 수 있는 학생을 조회하는 쿼리를 작성해주세요.
select * from score
where korean = 100 or english = 100 or math = 100;

-- 과자를 받을 수 있는 학생을 조회하는 쿼리를 작성해주세요.
select * from score
where korean between 70 and 95
and english between 70 and 95
and math between 70 and 95;

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| name    | varchar(32) | NO   | PRI | NULL    |       |
| korean  | int(11)     | YES  |     | NULL    |       |
| english | int(11)     | YES  |     | NULL    |       |
| math    | int(11)     | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
+-------------+--------+---------+------+
| name        | korean | english | math |
+-------------+--------+---------+------+
| Caterpillar |     75 |      85 |  100 |
| Cheshire    |    100 |      50 |   60 |
| Dodo        |     90 |      90 |  100 |
| Elice       |    100 |      80 |   60 |
| Trump       |     65 |     100 |   80 |
+-------------+--------+---------+------+
+----------------+--------+---------+------+
| name           | korean | english | math |
+----------------+--------+---------+------+
| Hatter         |     90 |      80 |   90 |
| Queen of Heart |     80 |      75 |   80 |
+----------------+--------+---------+------+




