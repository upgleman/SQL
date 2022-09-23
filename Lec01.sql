-- [실습1] 테이블의 구조 - DESC
-- 본격적으로 SQL의 세계로 들어가기에 앞서 테이블의 구조를 확인하는 명령어에 대해 알아봅시다.

-- employees는 직원번호(emp_no), 생일(birth_date), 성(first_name), 이름(last_name), 성별(gender), 고용일(hire_date), 관리자번호(superior_no)로 이루어져 있습니다.

-- salaries는 직원번호(emp_no), 연봉(salary), 시작일(from_date), 종료일(to_date)로 이루어져 있습니다.

-- 그럼 직접 데이터베이스의 구조를 출력해봅시다.


-- 지시사항
-- DESC 문을 이용해 employees의 구조를 출력해보세요.
-- DESC 문을 이용해 salaries의 구조를 출력해보세요.
-- Tips
-- ;(세미콜론)은 한 문장의 끝을 의미합니다.
-- 명령어를 입력한 후 마지막에 ;을 입력해야 컴퓨터가 명령어를 구분할 수 있습니다.
-- 두 테이블은 앞으로의 실습에서 계속 사용할 테이블이니 눈여겨 보세요.

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
-- 안녕하세요! SQL의 세계로 오신 것을 환영합니다.

-- SQL은 데이터베이스를 다루기 위한 언어입니다.

-- 가장 먼저 데이터베이스의 내용을 출력해 봅시다.

-- 앞서 배운 SELECT 문을 이용해 book 테이블을 출력해 볼까요?


-- 지시사항
-- book의 정보를 검색하기 위해 오른쪽 코드 창에 다음과 같이 입력해 보세요.
-- SELECT문을 이용해 book테이블을 조회하는 쿼리를 작성해주세요.
DESC book;
SELECT * FROM book;

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int(11)     | NO   | PRI | NULL    |       |
| title         | varchar(64) | NO   |     | NULL    |       |
| author        | varchar(64) | YES  |     | NULL    |       |
| publisher     | varchar(32) | YES  |     | NULL    |       |
| date_received | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
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
DESC employees;
SELECT * FROM employees;

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
-- 이번에는 현재 도서관에 있는 책을 파악하기 위하여 데이터 목록을 뽑아내 봅시다.

-- 단, 책의 제목과 저자만 골라서 조회하려고 합니다.

-- 현재 미리 작성되어 있는 쿼리를 실행해 보면 book테이블의 구조가 출력됩니다.


-- 지시사항
-- book테이블에서 책의 제목과 저자만 골라서 조회하여 봅시다. 단 제목, 저자 순으로 출력하도록 합시다.

-- book 테이블의 구조를 조회하는 쿼리입니다. 수정하실 필요는 없습니다.
DESC book;
select * from book;

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
'
-- [실습5] 데이터 고유값만 출력하기 - DISTINCT
-- salaries 테이블에는 직원들의 연도별 연봉이 들어있습니다.

-- 어떤 직원들의 연봉이 적혀있는지 알아보려고 했는데 그냥 출력하면 직원 번호가 중복되서 검색이 됩니다.
-- 지시사항
-- DISTINCT를 이용해 중복 없이 직원 번호를 검색해보세요.
-- 직원 번호인 emp_no 컬럼만 검색합니다.

-- salaries 테이블에 있는 직원 번호를 중복 없이 출력해 봅니다.
DESC salaries;
select * from salaries;

select distinct emp_no
from salaries;

+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   |     | NULL    |       |
| salary    | int(11) | NO   |     | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  62102 | 1987-06-26 | 1988-06-25 |
|  10001 |  66074 | 1988-06-25 | 1989-06-25 |
|  10001 |  66596 | 1989-06-25 | 1990-06-25 |
|  10001 |  66961 | 1990-06-25 | 1991-06-25 |
|  10001 |  71046 | 1991-06-25 | 1992-06-24 |
|  10001 |  74333 | 1992-06-24 | 1993-06-24 |
|  10001 |  76884 | 1995-06-24 | 1996-06-23 |
|  10001 |  80013 | 1996-06-23 | 1997-06-23 |
|  10001 |  81025 | 1997-06-23 | 1998-06-23 |
|  10001 |  81097 | 1998-06-23 | 1999-06-23 |
|  10001 |  84917 | 1999-06-23 | 2000-06-22 |
|  10002 |  65828 | 1996-08-03 | 1997-08-03 |
|  10002 |  65909 | 1997-08-03 | 1998-08-03 |
|  10002 |  67534 | 1998-08-03 | 1999-08-03 |
|  10002 |  69366 | 1999-08-03 | 2000-08-02 |
|  10002 |  71963 | 2000-08-02 | 2001-08-02 |
|  10002 |  72527 | 2001-08-02 | 9999-01-01 |
|  10003 |  40006 | 1995-12-03 | 1996-12-02 |
|  10003 |  43616 | 1996-12-02 | 1997-12-02 |
|  10003 |  43311 | 2001-12-01 | 9999-01-01 |
|  10004 |  40054 | 1986-12-01 | 1987-12-01 |
|  10004 |  42283 | 1987-12-01 | 1988-11-30 |
|  10004 |  42542 | 1988-11-30 | 1989-11-30 |
|  10004 |  46065 | 1989-11-30 | 1990-11-30 |
|  10004 |  58326 | 1994-11-29 | 1995-11-29 |
|  10004 |  60770 | 1995-11-29 | 1996-11-28 |
|  10004 |  62566 | 1996-11-28 | 1997-11-28 |
|  10004 |  64340 | 1997-11-28 | 1998-11-28 |
|  10004 |  67096 | 1998-11-28 | 1999-11-28 |
|  10004 |  69722 | 1999-11-28 | 2000-11-27 |
|  10004 |  70698 | 2000-11-27 | 2001-11-27 |
|  10004 |  74057 | 2001-11-27 | 9999-01-01 |
|  10005 |  78228 | 1989-09-12 | 1990-09-12 |
|  10005 |  82621 | 1990-09-12 | 1991-09-12 |
|  10005 |  88063 | 1996-09-10 | 1997-09-10 |
|  10005 |  89724 | 1997-09-10 | 1998-09-10 |
|  10005 |  90392 | 1998-09-10 | 1999-09-10 |
|  10005 |  90531 | 1999-09-10 | 2000-09-09 |
|  10005 |  91453 | 2000-09-09 | 2001-09-09 |
|  10005 |  94692 | 2001-09-09 | 9999-01-01 |
|  10006 |  40000 | 1990-08-05 | 1991-08-05 |
|  10006 |  42085 | 1991-08-05 | 1992-08-04 |
|  10006 |  42629 | 1992-08-04 | 1993-08-04 |
|  10006 |  45844 | 1993-08-04 | 1994-08-04 |
|  10006 |  47518 | 1994-08-04 | 1995-08-04 |
|  10006 |  47917 | 1995-08-04 | 1996-08-03 |
|  10006 |  52255 | 1996-08-03 | 1997-08-03 |
|  10006 |  53747 | 1997-08-03 | 1998-08-03 |
|  10007 |  62745 | 1991-02-10 | 1992-02-10 |
|  10007 |  63475 | 1992-02-10 | 1993-02-09 |
|  10007 |  63208 | 1993-02-09 | 1994-02-09 |
|  10007 |  64563 | 1994-02-09 | 1995-02-09 |
+--------+--------+------------+------------+

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
-- 엘리스 도서관에서는 유명 작가인 Joanne Kathleen Rowling의 책들을 가지고 이벤트를 하려고 합니다.

-- 이 이벤트를 위해서는 대상이 되는 책들을 모두 골라내야 합니다.


-- 지시사항
-- 앞서 배운 WHERE를 이용해 Joanne Kathleen Rowling작가의 책만 조회해 봅시다.
-- 출력할 때는 *을 이용해 모든 컬럼을 출력하도록 합시다.

-- 테이블의 구조를 출력하는 쿼리입니다. 실행 버튼을 눌러보시면 테이블의 구조를 알 수 있습니다.
DESC book;
select * from book;

-- Joanne Kathleen Rowling작가의 책만 골라서 조회하는 쿼리를 작성해주세요.
select * from book where author = 'Joanne Kathleen Rowling';

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int(11)     | NO   | PRI | NULL    |       |
| title         | varchar(64) | NO   |     | NULL    |       |
| author        | varchar(64) | YES  |     | NULL    |       |
| publisher     | varchar(32) | YES  |     | NULL    |       |
| date_received | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
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
+------+------------------------------------------+-------------------------+-----------------------+---------------+
| id   | title                                    | author                  | publisher             | date_received |
+------+------------------------------------------+-------------------------+-----------------------+---------------+
| 1003 | Harry Potter and the Philosopher's Stone | Joanne Kathleen Rowling | Bloomsbury Publishing | 2017-06-26    |
| 1009 | Harry Potter and the Deathly Hallows     | Joanne Kathleen Rowling | Bloomsbury Publishing | 2017-07-21    |
+------+------------------------------------------+-------------------------+-----------------------+---------------+

-- [실습7] SELECT에 조건 추가하기 - WHERE 2
-- employees 테이블에서 남자 직원들만 검색하려고 합니다.

-- 앞서 배운 WHERE을 이용해 gender가 'M' 인 직원들만 검색해봅시다.


-- 지시사항
-- WHERE을 이용해 gender가 'M' 인 직원들을 검색하세요.
-- 검색할 때는 *을 이용해 모든 컬럼을 검색하도록 합시다.
-- Tips
-- SQL에서 문자열을 사용할 때에는 작은따옴표'를 사용합니다. 예를 들어 elice라는 문자열을 사용하고 싶다면 'elice'라고 작성하면 됩니다.

DESC employees;
select * from employees;

-- gender가 'M'인 직원만 골라서 조회하는 쿼리를 작성해주세요.
select * from employees where gender = 'M';

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
+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |        NULL |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |        NULL |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |        NULL |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |        NULL |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |       10001 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |       10001 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |       10002 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |       10002 |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |        NULL |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |       10001 |
+--------+------------+------------+-----------+--------+------------+-------------+

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
-- 엘리스네 반 선생님이 시험의 성적에 성적을 매기려고 합니다.

-- 수학 점수가 80점 초과 국어 점수가 90점 이상인 사람에게 A+을 주기 위해 score테이블에서 검색하려고 합니다.
-- 지시사항
-- score테이블에서 수학(math) 점수가 80점 초과, 국어(korean) 점수가 90점 이상인 학생의 정보를 검색해보세요.

DESC score;
select * from score;

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
+----------------+--------+---------+------+
| name           | korean | english | math |
+----------------+--------+---------+------+
| Caterpillar    |     75 |      85 |  100 |
| Cheshire       |    100 |      50 |   60 |
| Dodo           |     90 |      90 |  100 |
| Elice          |    100 |      80 |   60 |
| Hatter         |     90 |      80 |   90 |
| Queen of Heart |     80 |      75 |   80 |
| Trump          |     65 |     100 |   80 |
+----------------+--------+---------+------+
+--------+--------+---------+------+
| name   | korean | english | math |
+--------+--------+---------+------+
| Dodo   |     90 |      90 |  100 |
| Hatter |     90 |      80 |   90 |
+--------+--------+---------+------+

--[실습9] 여러 개의 조건 추가하기 - WHERE 2
-- employees 테이블에서 여자 직원들 중에 first_name이 'Chirstian' 인 직원들을 검색하려고 합니다.

-- WHERE을 사용하되 AND를 이용해서 조건을 추가해보세요.
-- 지시사항
-- 여자 직원들 중에 first_name이 'Chirstian' 인 직원들을 검색해보세요.
-- 조회할 때는 모든 컬럼을 검색하도록 합니다.
-- Tips
-- and와 or은 3개 이상에서도 사용이 가능합니다. 예를 들어 A and B and C라고 작성한다면 A, B, C모두를 만족해야 합니다.

DESC employees;
select * from employees;

-- 여자 직원 중 이름이 Chirstian인 직원들을 출력합니다.
select * from employees where gender = 'F' and first_name = 'Chirstian';

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
+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |       10909 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |        NULL |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |        NULL |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |       10909 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |       10001 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |       10001 |
|  10909 | 1954-11-11 | Georgi     | Atchley   | M      | 1985-04-21 |        NULL |
|  14201 | 1964-07-03 | Chirstian  | Carrere   | F      | 1991-07-26 |       10909 |
|  15087 | 1954-10-11 | Chirstian  | Ushiama   | F      | 1988-09-14 |        NULL |
|  15103 | 1964-04-05 | Eran       | Rosiles   | M      | 1997-02-07 |       10001 |
+--------+------------+------------+-----------+--------+------------+-------------+

+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  14201 | 1964-07-03 | Chirstian  | Carrere   | F      | 1991-07-26 |       10909 |
|  15087 | 1954-10-11 | Chirstian  | Ushiama   | F      | 1988-09-14 |        NULL |
+--------+------------+------------+-----------+--------+------------+-------------+

--[실습10] 논리연산자를 활용하여 조건 만들기 - AND, OR, NOT
-- employees 테이블에서 복잡한 조건을 만족하는 직원을 검색해 봅시다.

-- first_name이 'Chirstian' 또는 'Georgi' 이다.
-- gender가 남자이다.
-- hire_date가 '1986-06-26' 이 아니다.

-- 지시사항
-- 논리연산자를 이용해 문제에 제시된 복잡한 조건을 만족하는 쿼리를 작성하세요.
-- 조회할 때는 모든 컬럼을 검색하도록 합니다.
-- Tips
-- 연산자의 우선순위에 주의해야 합니다. ()를 활용해보세요.

-- 문제의 조건에 맞는 직원을을 출력합니다.
DESC employees;
select * from employees;

select * from employees 
where 
(first_name ='Chirstian' or first_name ='Georgi')
and gender ='M'
-- and not hire_date in ('1986-06-26')
and hire_date != '1986-06-26';

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
+--------+------------+------------+---------------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name     | gender | hire_date  | superior_no |
+--------+------------+------------+---------------+--------+------------+-------------+
|  10001 | 1953-09-02 | Georgi     | Facello       | M      | 1986-06-26 |        NULL |
|  10002 | 1964-06-02 | Bezalel    | Simmel        | F      | 1985-11-21 |        NULL |
|  10004 | 1954-05-01 | Chirstian  | Koblick       | M      | 1986-06-26 |        NULL |
|  10006 | 1953-04-20 | Anneke     | Preusig       | F      | 1989-06-02 |       15256 |
|  10008 | 1958-02-19 | Chirstian  | Kalloufi      | M      | 1994-09-15 |       10002 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau      | F      | 1989-08-24 |       15256 |
|  10257 | 1957-09-12 | Aiman      | Riexinger     | M      | 1986-08-05 |        NULL |
|  10909 | 1954-11-11 | Georgi     | Atchley       | M      | 1985-04-21 |        NULL |
|  11259 | 1964-11-24 | Chirstian  | Vesel         | M      | 1986-06-26 |        NULL |
|  11430 | 1957-01-23 | Georgi     | Lueh          | M      | 1997-06-17 |       16258 |
|  11542 | 1964-11-24 | Susanna    | Vesel         | M      | 1986-06-25 |        NULL |
|  12258 | 1955-12-12 | Susanna    | Rosiles       | F      | 1985-05-17 |        NULL |
|  14201 | 1964-07-03 | Chirstian  | Lueh          | M      | 1991-07-26 |       10002 |
|  15087 | 1954-10-11 | Chirstian  | Ushiama       | F      | 1988-09-14 |        NULL |
|  15103 | 1964-04-05 | Eran       | Rosiles       | M      | 1997-02-07 |       16258 |
|  15256 | 1960-12-02 | Irene      | Radhakrishnan | M      | 1985-10-12 |        NULL |
|  16258 | 1955-12-12 | Basil      | Ishibashi     | F      | 1985-05-17 |        NULL |
|  16670 | 1958-06-28 | Kenton     | Azumi         | M      | 1988-12-21 |        NULL |
|  16671 | 1956-01-14 | Kish       | Orlowska      | M      | 1986-07-08 |        NULL |
|  16672 | 1955-04-25 | Georgi     | Peris         | M      | 1986-06-26 |        NULL |
|  18257 | 1957-09-12 | Aiman      | Riexinger     | M      | 1986-08-05 |        NULL |
|  19220 | 1957-08-03 | Georgi     | Panienski     | F      | 1995-08-24 |       10002 |
+--------+------------+------------+---------------+--------+------------+-------------+

+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10008 | 1958-02-19 | Chirstian  | Kalloufi  | M      | 1994-09-15 |       10002 |
|  10909 | 1954-11-11 | Georgi     | Atchley   | M      | 1985-04-21 |        NULL |
|  11430 | 1957-01-23 | Georgi     | Lueh      | M      | 1997-06-17 |       16258 |
|  14201 | 1964-07-03 | Chirstian  | Lueh      | M      | 1991-07-26 |       10002 |
+--------+------------+------------+-----------+--------+------------+-------------+

--[실습11] 범위를 지정하여 검색하기 - BETWEEN 1
-- 엘리스네 반 선생님은 중간고사의 성적에 따라서 선물을 주겠다고 약속했습니다.

-- 국어, 영어, 수학 점수 중 하나라도 100점인 학생에게는 짜장면을 사주시기로 약속했고

-- 3과목 모두 70~95점 사이인 학생에게는 과자를 사주신다고 했습니다.

-- 여러분은 학생들의 성적이 담겨있는 score테이블에서 짜장면을 받을 학생과 과자를 받을 학생을 차례대로 조회해 봅시다.


-- 지시사항
-- 국어, 영어, 수학 점수 중 하나라도 100점인 학생을 검색해보세요.
-- 3과목 모두 70~95점 사이인 학생을 검색해보세요.
-- 조회할 때는 모든 컬럼을 조회하도록 합니다.

DESC score;
select * from score;

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
+----------------+--------+---------+------+
| name           | korean | english | math |
+----------------+--------+---------+------+
| Caterpillar    |     75 |      85 |  100 |
| Cheshire       |    100 |      50 |   60 |
| Dodo           |     90 |      90 |  100 |
| Elice          |    100 |      80 |   60 |
| Hatter         |     90 |      80 |   90 |
| Queen of Heart |     80 |      75 |   80 |
| Trump          |     65 |     100 |   80 |
+----------------+--------+---------+------+
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

-- [실습12] 범위를 지정하여 검색하기 - BETWEEN 2
-- 입사 연도에 따라 직원들에게 추가 보너스를 주 려고 합니다.

-- 1980년에서 1989년 사이에 입사한 직원과 1990년에서 1999년 사이에 입사한 직원을 각각 검색해봅시다.

-- BETWEEN을 이용해서 해결해보세요.


-- 지시사항
-- employees 테이블에서:

-- SELECT문을 이용해서 1980년에서 1989년 사이에 입사한 직원의 모든 컬럼을 검색해보세요.
-- SELECT문을 이용해서 1990년에서 1999년 사이에 입사한 직원의 모든 컬럼을 검색해보세요.
-- Tip!
-- 1980-01-01, 1989-12-31 으로 일자까지 작성해주세요.

DESC employees;
select * from employees;

-- 1980~1989년도에 입사한 직원을 검색하세요.
select * from employees
where hire_date between '1980-01-01' and '1989-12-31';

-- 1990~1999년도에 입사한 직원을 검색하세요.
select * from employees
where hire_date between '1990-01-01' and '1999-12-31';

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
+--------+------------+-------------+-----------------+--------+------------+-------------+
| emp_no | birth_date | first_name  | last_name       | gender | hire_date  | superior_no |
+--------+------------+-------------+-----------------+--------+------------+-------------+
|  10012 | 1960-10-04 | Patricio    | Bridgland       | M      | 1992-12-18 |       10610 |
|  10015 | 1959-08-19 | Guoxiang    | Nooteboom       | M      | 1987-07-02 |        NULL |
|  10019 | 1953-01-23 | Lillian     | Haddadi         | M      | 1999-04-30 |       10015 |
|  10033 | 1959-12-03 | Parto       | Bamford         | M      | 1986-08-28 |       10202 |
|  10037 | 1957-05-23 | Tzvetan     | Zielinski       | F      | 1989-02-10 |        NULL |
|  10088 | 1958-02-19 | Saniya      | Kalloufi        | M      | 1994-09-15 |        NULL |
|  10202 | 1964-06-02 | Bezalel     | Simmel          | F      | 1985-11-21 |        NULL |
|  10404 | 1954-05-01 | Chirstian   | Michaels        | M      | 1986-12-01 |        NULL |
|  10506 | 1953-04-20 | Anneke      | Preusig         | F      | 1989-06-02 |        NULL |
|  10511 | 1953-11-07 | Mary        | Sluis           | F      | 1990-01-22 |       10610 |
|  10516 | 1961-05-02 | Kazuhito    | Cappelletti     | M      | 1995-01-27 |       10610 |
|  10610 | 1963-06-01 | Duangkaew   | Piveteau        | F      | 1989-08-24 |       10202 |
|  10620 | 1952-12-24 | Mayuko      | Warwick         | M      | 1991-01-26 |       12461 |
|  11001 | 1953-09-02 | Georgi      | Facello         | M      | 1986-06-26 |        NULL |
|  11267 | 1958-11-21 | Seshu       | Bazelow         | F      | 1993-06-16 |       16469 |
|  11366 | 1964-01-04 | Naftali     | Koshino         | F      | 1986-05-03 |        NULL |
|  11449 | 1953-12-02 | Shridhar    | Pleszkun        | M      | 1998-08-23 |        NULL |
|  11458 | 1962-03-18 | Nidapan     | Ginneken        | M      | 1993-08-29 |        NULL |
|  11460 | 1955-11-19 | Mana        | Maraist         | M      | 1992-03-14 |       10015 |
|  11467 | 1955-05-15 | Fox         | Narahari        | M      | 1985-09-10 |        NULL |
|  11468 | 1955-12-02 | Navin       | Maksimenko      | F      | 1996-03-19 |       16469 |
|  11474 | 1953-04-17 | Gennady     | Akazan          | M      | 1990-07-26 |       13473 |
|  11480 | 1960-09-13 | Masoud      | Michaels        | F      | 1990-01-01 |        NULL |
|  11563 | 1960-08-06 | Rajmohan    | Peha            | F      | 1992-05-17 |       11765 |
|  11664 | 1962-10-22 | Boutros     | Simkin          | M      | 1992-05-30 |       11765 |
|  11765 | 1956-08-21 | Tomoyuki    | Porenta         | M      | 1985-07-14 |        NULL |
|  12000 | 1957-11-09 | Claudi      | Angelov         | M      | 1989-12-31 |        NULL |
|  12001 | 1960-11-06 | Ulf         | Hofstetter      | F      | 1989-03-10 |        NULL |
|  12002 | 1959-09-17 | Seongbae    | Kavraki         | M      | 1994-10-14 |       12007 |
|  12003 | 1961-04-15 | Luise       | Genin           | M      | 1992-11-20 |       12007 |
|  12007 | 1952-06-18 | Marko       | Michaels        | M      | 1989-05-17 |       12034 |
|  12014 | 1956-02-12 | Berni       | Genin           | M      | 1987-03-11 |        NULL |
|  12034 | 1962-02-11 | Lucien      | Schlenzig       | F      | 1986-10-13 |        NULL |
|  12461 | 1955-04-18 | Kish        | Cronau          | M      | 1986-08-19 |        NULL |
|  12510 | 1956-09-26 | Otmar       | Genin           | F      | 1988-11-06 |       12034 |
|  12606 | 1963-08-09 | Remco       | Erol            | M      | 1989-12-27 |        NULL |
|  12609 | 1963-09-26 | Sariel      | Stifter         | M      | 2000-11-28 |       12034 |
|  12708 | 1953-09-13 | Frederique  | Zykh            | F      | 1999-12-31 |        NULL |
|  13013 | 1963-06-07 | Eberhardt   | Terkki          | M      | 1985-10-20 |        NULL |
|  13462 | 1959-01-28 | Chikara     | Maginnis        | M      | 1990-04-27 |       12461 |
|  13473 | 1957-06-27 | Jiakeng     | Eugenio         | M      | 1986-11-19 |        NULL |
|  15005 | 1958-07-27 | Shir        | DuCasse         | M      | 1993-03-30 |       12007 |
|  15476 | 1954-06-20 | Manton      | Yoshizawa       | F      | 1994-01-15 |       19471 |
|  15495 | 1955-01-21 | Kyoichi     | Maliniak        | M      | 1989-09-12 |       10202 |
|  16469 | 1952-12-01 | Guttorm     | Giaccio         | M      | 1988-05-23 |        NULL |
|  16475 | 1957-04-25 | Dekang      | Siegrist        | F      | 1997-08-04 |       19471 |
|  17018 | 1954-06-19 | Kazuhide    | Peha            | F      | 1987-04-03 |        NULL |
|  18470 | 1962-10-11 | Khalid      | Michaels        | M      | 1991-11-26 |       16469 |
|  18472 | 1961-04-18 | Constantino | Ghandeharizadeh | M      | 1990-04-30 |       19471 |
|  18817 | 1958-07-06 | Cristinel   | Bouloucos       | F      | 1993-08-03 |       10015 |
|  19009 | 1952-04-19 | Sumant      | Peac            | F      | 1985-02-18 |        NULL |
|  19471 | 1961-03-24 | Subhada     | Champarnaud     | F      | 1987-04-26 |        NULL |
+--------+------------+-------------+-----------------+--------+------------+-------------+
+--------+------------+------------+-------------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  | superior_no |
+--------+------------+------------+-------------+--------+------------+-------------+
|  10015 | 1959-08-19 | Guoxiang   | Nooteboom   | M      | 1987-07-02 |        NULL |
|  10033 | 1959-12-03 | Parto      | Bamford     | M      | 1986-08-28 |       10202 |
|  10037 | 1957-05-23 | Tzvetan    | Zielinski   | F      | 1989-02-10 |        NULL |
|  10202 | 1964-06-02 | Bezalel    | Simmel      | F      | 1985-11-21 |        NULL |
|  10404 | 1954-05-01 | Chirstian  | Michaels    | M      | 1986-12-01 |        NULL |
|  10506 | 1953-04-20 | Anneke     | Preusig     | F      | 1989-06-02 |        NULL |
|  10610 | 1963-06-01 | Duangkaew  | Piveteau    | F      | 1989-08-24 |       10202 |
|  11001 | 1953-09-02 | Georgi     | Facello     | M      | 1986-06-26 |        NULL |
|  11366 | 1964-01-04 | Naftali    | Koshino     | F      | 1986-05-03 |        NULL |
|  11467 | 1955-05-15 | Fox        | Narahari    | M      | 1985-09-10 |        NULL |
|  11765 | 1956-08-21 | Tomoyuki   | Porenta     | M      | 1985-07-14 |        NULL |
|  12000 | 1957-11-09 | Claudi     | Angelov     | M      | 1989-12-31 |        NULL |
|  12001 | 1960-11-06 | Ulf        | Hofstetter  | F      | 1989-03-10 |        NULL |
|  12007 | 1952-06-18 | Marko      | Michaels    | M      | 1989-05-17 |       12034 |
|  12014 | 1956-02-12 | Berni      | Genin       | M      | 1987-03-11 |        NULL |
|  12034 | 1962-02-11 | Lucien     | Schlenzig   | F      | 1986-10-13 |        NULL |
|  12461 | 1955-04-18 | Kish       | Cronau      | M      | 1986-08-19 |        NULL |
|  12510 | 1956-09-26 | Otmar      | Genin       | F      | 1988-11-06 |       12034 |
|  12606 | 1963-08-09 | Remco      | Erol        | M      | 1989-12-27 |        NULL |
|  13013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |        NULL |
|  13473 | 1957-06-27 | Jiakeng    | Eugenio     | M      | 1986-11-19 |        NULL |
|  15495 | 1955-01-21 | Kyoichi    | Maliniak    | M      | 1989-09-12 |       10202 |
|  16469 | 1952-12-01 | Guttorm    | Giaccio     | M      | 1988-05-23 |        NULL |
|  17018 | 1954-06-19 | Kazuhide   | Peha        | F      | 1987-04-03 |        NULL |
|  19009 | 1952-04-19 | Sumant     | Peac        | F      | 1985-02-18 |        NULL |
|  19471 | 1961-03-24 | Subhada    | Champarnaud | F      | 1987-04-26 |        NULL |
+--------+------------+------------+-------------+--------+------------+-------------+
+--------+------------+-------------+-----------------+--------+------------+-------------+
| emp_no | birth_date | first_name  | last_name       | gender | hire_date  | superior_no |
+--------+------------+-------------+-----------------+--------+------------+-------------+
|  10012 | 1960-10-04 | Patricio    | Bridgland       | M      | 1992-12-18 |       10610 |
|  10019 | 1953-01-23 | Lillian     | Haddadi         | M      | 1999-04-30 |       10015 |
|  10088 | 1958-02-19 | Saniya      | Kalloufi        | M      | 1994-09-15 |        NULL |
|  10511 | 1953-11-07 | Mary        | Sluis           | F      | 1990-01-22 |       10610 |
|  10516 | 1961-05-02 | Kazuhito    | Cappelletti     | M      | 1995-01-27 |       10610 |
|  10620 | 1952-12-24 | Mayuko      | Warwick         | M      | 1991-01-26 |       12461 |
|  11267 | 1958-11-21 | Seshu       | Bazelow         | F      | 1993-06-16 |       16469 |
|  11449 | 1953-12-02 | Shridhar    | Pleszkun        | M      | 1998-08-23 |        NULL |
|  11458 | 1962-03-18 | Nidapan     | Ginneken        | M      | 1993-08-29 |        NULL |
|  11460 | 1955-11-19 | Mana        | Maraist         | M      | 1992-03-14 |       10015 |
|  11468 | 1955-12-02 | Navin       | Maksimenko      | F      | 1996-03-19 |       16469 |
|  11474 | 1953-04-17 | Gennady     | Akazan          | M      | 1990-07-26 |       13473 |
|  11480 | 1960-09-13 | Masoud      | Michaels        | F      | 1990-01-01 |        NULL |
|  11563 | 1960-08-06 | Rajmohan    | Peha            | F      | 1992-05-17 |       11765 |
|  11664 | 1962-10-22 | Boutros     | Simkin          | M      | 1992-05-30 |       11765 |
|  12002 | 1959-09-17 | Seongbae    | Kavraki         | M      | 1994-10-14 |       12007 |
|  12003 | 1961-04-15 | Luise       | Genin           | M      | 1992-11-20 |       12007 |
|  12708 | 1953-09-13 | Frederique  | Zykh            | F      | 1999-12-31 |        NULL |
|  13462 | 1959-01-28 | Chikara     | Maginnis        | M      | 1990-04-27 |       12461 |
|  15005 | 1958-07-27 | Shir        | DuCasse         | M      | 1993-03-30 |       12007 |
|  15476 | 1954-06-20 | Manton      | Yoshizawa       | F      | 1994-01-15 |       19471 |
|  16475 | 1957-04-25 | Dekang      | Siegrist        | F      | 1997-08-04 |       19471 |
|  18470 | 1962-10-11 | Khalid      | Michaels        | M      | 1991-11-26 |       16469 |
|  18472 | 1961-04-18 | Constantino | Ghandeharizadeh | M      | 1990-04-30 |       19471 |
|  18817 | 1958-07-06 | Cristinel   | Bouloucos       | F      | 1993-08-03 |       10015 |
+--------+------------+-------------+-----------------+--------+------------+-------------+


-- [실습13] 여러 개의 OR를 간결하게 사용하기 - IN 1

-- 엘리스는 자기가 좋아하는 작가들이 작성한 책만 골라내려고 합니다.

-- A IN B 는 B의 값 중에 A가 포함된 값을 찾아줍니다.

-- 아래의 문제를 IN문을 사용해서 풀어봅시다.


-- 지시사항
-- 다음 작가가 쓴 책들만 골라서 출력해 봅시다.
-- William Shakespeare
-- John Ronald Reuel Tolkien
-- Joanne Kathleen Rowling
-- 출력할 때는 *을 이용해 모든 컬럼을 출력하도록 합니다.

-- 책들의 정보가 담긴 테이블의 구조를 출력합니다. 수정하실 필요는 없습니다.
DESC book;
select * from book;
-- 해당하는 작가가 쓴 책만 골라서 출력합니다.

SELECT * FROM book
WHERE author IN ('William Shakespeare','John Ronald Reuel Tolkien','Joanne Kathleen Rowling');

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| id            | int(11)     | NO   | PRI | NULL    |       |
| title         | varchar(64) | NO   |     | NULL    |       |
| author        | varchar(64) | YES  |     | NULL    |       |
| publisher     | varchar(32) | YES  |     | NULL    |       |
| date_received | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
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
+------+------------------------------------------+---------------------------+-----------------------+---------------+
| id   | title                                    | author                    | publisher             | date_received |
+------+------------------------------------------+---------------------------+-----------------------+---------------+
| 1000 | Romeo and Juliet                         | William Shakespeare       | NULL                  | 2012-04-01    |
| 1003 | Harry Potter and the Philosopher's Stone | Joanne Kathleen Rowling   | Bloomsbury Publishing | 2017-06-26    |
| 1004 | The Lord of the Rings                    | John Ronald Reuel Tolkien | Allen & Unwin         | 2014-07-29    |
| 1009 | Harry Potter and the Deathly Hallows     | Joanne Kathleen Rowling   | Bloomsbury Publishing | 2017-07-21    |
+------+------------------------------------------+---------------------------+-----------------------+---------------+

-- [실습14] 여러 개의 OR를 간결하게 사용하기 - IN 2

-- 회사 이벤트 상품을 지급하기 위해서 직원 중 사람을 찾으려는데 이름만 알고 있습니다.

-- 해당 이름을 가진 사람들을 보고 누가 당첨자인지 확인하려고 합니다.

-- employees 테이블을 사용하여 확인해봅시다.


-- 지시사항
-- 1.IN을 이용해서 다음의 이름(last_name)을 가진 사람들만 골라서 검색해봅시다.

-- Michaels
-- Genin
-- Peha
-- 검색할 때는 *을 이용해 모든 컬럼을 검색하도록 합니다.

-- 해당하는 이름을 가진 사람들만 골라서 출력합니다.
DESC employees;
select * from employees;

select * from employees
where
last_name in ('Michaels','Genin','Peha');

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
+--------+------------+-------------+-----------------+--------+------------+-------------+
| emp_no | birth_date | first_name  | last_name       | gender | hire_date  | superior_no |
+--------+------------+-------------+-----------------+--------+------------+-------------+
|  10012 | 1960-10-04 | Patricio    | Bridgland       | M      | 1992-12-18 |       13013 |
|  10015 | 1959-08-19 | Guoxiang    | Nooteboom       | M      | 1987-07-02 |        NULL |
|  10019 | 1953-01-23 | Lillian     | Haddadi         | M      | 1999-04-30 |       12461 |
|  10033 | 1959-12-03 | Parto       | Bamford         | M      | 1986-08-28 |        NULL |
|  10037 | 1957-05-23 | Tzvetan     | Zielinski       | F      | 1989-02-10 |       10202 |
|  10088 | 1958-02-19 | Saniya      | Kalloufi        | M      | 1994-09-15 |        NULL |
|  10202 | 1964-06-02 | Bezalel     | Simmel          | F      | 1985-11-21 |        NULL |
|  10404 | 1954-05-01 | Chirstian   | Michaels        | M      | 1986-12-01 |       10202 |
|  10506 | 1953-04-20 | Anneke      | Preusig         | F      | 1989-06-02 |        NULL |
|  10511 | 1953-11-07 | Mary        | Sluis           | F      | 1990-01-22 |        NULL |
|  10516 | 1961-05-02 | Kazuhito    | Cappelletti     | M      | 1995-01-27 |        NULL |
|  10610 | 1963-06-01 | Duangkaew   | Piveteau        | F      | 1989-08-24 |       10202 |
|  10620 | 1952-12-24 | Mayuko      | Warwick         | M      | 1991-01-26 |       12461 |
|  11001 | 1953-09-02 | Georgi      | Facello         | M      | 1986-06-26 |        NULL |
|  11267 | 1958-11-21 | Seshu       | Bazelow         | F      | 1993-06-16 |       11765 |
|  11366 | 1964-01-04 | Naftali     | Koshino         | F      | 1986-05-03 |        NULL |
|  11449 | 1953-12-02 | Shridhar    | Pleszkun        | M      | 1998-08-23 |       11467 |
|  11458 | 1962-03-18 | Nidapan     | Ginneken        | M      | 1993-08-29 |       11467 |
|  11460 | 1955-11-19 | Mana        | Maraist         | M      | 1992-03-14 |       12461 |
|  11467 | 1955-05-15 | Fox         | Narahari        | M      | 1985-09-10 |        NULL |
|  11468 | 1955-12-02 | Navin       | Maksimenko      | F      | 1996-03-19 |       11765 |
|  11474 | 1953-04-17 | Gennady     | Akazan          | M      | 1990-07-26 |       13473 |
|  11480 | 1960-09-13 | Masoud      | Michaels        | F      | 1990-03-13 |       11467 |
|  11563 | 1960-08-06 | Rajmohan    | Peha            | F      | 1992-05-17 |       13013 |
|  11664 | 1962-10-22 | Boutros     | Simkin          | M      | 1992-05-30 |       11765 |
|  11765 | 1956-08-21 | Tomoyuki    | Porenta         | M      | 1985-07-14 |        NULL |
|  12000 | 1957-11-09 | Claudi      | Angelov         | M      | 1989-01-12 |        NULL |
|  12001 | 1960-11-06 | Ulf         | Hofstetter      | F      | 1989-03-10 |        NULL |
|  12002 | 1959-09-17 | Seongbae    | Kavraki         | M      | 1994-10-14 |       12606 |
|  12003 | 1961-04-15 | Luise       | Genin           | M      | 1992-11-20 |       12606 |
|  12007 | 1952-06-18 | Marko       | Michaels        | M      | 1989-05-17 |       13473 |
|  12014 | 1956-02-12 | Berni       | Genin           | M      | 1987-03-11 |        NULL |
|  12034 | 1962-02-11 | Lucien      | Schlenzig       | F      | 1986-10-13 |        NULL |
|  12461 | 1955-04-18 | Kish        | Cronau          | M      | 1986-08-19 |        NULL |
|  12510 | 1956-09-26 | Otmar       | Genin           | F      | 1988-11-06 |        NULL |
|  12606 | 1963-08-09 | Remco       | Erol            | M      | 1989-12-27 |        NULL |
|  12609 | 1963-09-26 | Sariel      | Stifter         | M      | 1994-11-28 |       13473 |
|  12708 | 1953-09-13 | Frederique  | Zykh            | F      | 1991-08-07 |       13473 |
|  13013 | 1963-06-07 | Eberhardt   | Terkki          | M      | 1985-10-20 |        NULL |
|  13462 | 1959-01-28 | Chikara     | Maginnis        | M      | 1990-04-27 |        NULL |
|  13473 | 1957-06-27 | Jiakeng     | Eugenio         | M      | 1986-11-19 |        NULL |
|  15005 | 1958-07-27 | Shir        | DuCasse         | M      | 1993-03-30 |       12606 |
|  15476 | 1954-06-20 | Manton      | Yoshizawa       | F      | 1994-01-15 |       13473 |
|  15495 | 1955-01-21 | Kyoichi     | Maliniak        | M      | 1989-09-12 |        NULL |
|  16469 | 1952-12-01 | Guttorm     | Giaccio         | M      | 1988-05-23 |       13473 |
|  16475 | 1957-04-25 | Dekang      | Siegrist        | F      | 1997-08-04 |       13473 |
|  17018 | 1954-06-19 | Kazuhide    | Peha            | F      | 1987-04-03 |        NULL |
|  18470 | 1962-10-11 | Khalid      | Michaels        | M      | 1991-11-26 |       16469 |
|  18472 | 1961-04-18 | Constantino | Ghandeharizadeh | M      | 1990-04-30 |       16469 |
|  18817 | 1958-07-06 | Cristinel   | Bouloucos       | F      | 1993-08-03 |        NULL |
|  19009 | 1952-04-19 | Sumant      | Peac            | F      | 1985-02-18 |        NULL |
|  19471 | 1961-03-24 | Subhada     | Champarnaud     | F      | 1987-04-26 |        NULL |
+--------+------------+-------------+-----------------+--------+------------+-------------+
+--------+------------+------------+-----------+--------+------------+-------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  | superior_no |
+--------+------------+------------+-----------+--------+------------+-------------+
|  10404 | 1954-05-01 | Chirstian  | Michaels  | M      | 1986-12-01 |       10202 |
|  11480 | 1960-09-13 | Masoud     | Michaels  | F      | 1990-03-13 |       11467 |
|  11563 | 1960-08-06 | Rajmohan   | Peha      | F      | 1992-05-17 |       13013 |
|  12003 | 1961-04-15 | Luise      | Genin     | M      | 1992-11-20 |       12606 |
|  12007 | 1952-06-18 | Marko      | Michaels  | M      | 1989-05-17 |       13473 |
|  12014 | 1956-02-12 | Berni      | Genin     | M      | 1987-03-11 |        NULL |
|  12510 | 1956-09-26 | Otmar      | Genin     | F      | 1988-11-06 |        NULL |
|  17018 | 1954-06-19 | Kazuhide   | Peha      | F      | 1987-04-03 |        NULL |
|  18470 | 1962-10-11 | Khalid     | Michaels  | M      | 1991-11-26 |       16469 |
+--------+------------+------------+-----------+--------+------------+-------------+