--SQL1 실력테스트
--Q1.콘서트 예매자

-- 지시사항 1번을 참고하여 코드를 작성하세요.
DESC concert;
select * from concert;

+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| name  | varchar(16) | NO   |     | NULL    |       |
| date  | varchar(16) | YES  |     | NULL    |       |
| time  | varchar(16) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
+------+--------+------------+----------+
| id   | name   | date       | time     |
+------+--------+------------+----------+
| 1001 | Olivia | 2019-09-28 | 13:10:00 |
| 1002 | Noah   | 2019-12-23 | 12:10:00 |
| 1003 | Emma   | 2019-11-16 | 11:50:00 |
| 1004 | Liam   | 2019-10-17 | 23:30:00 |
| 1005 | Ava    | 2019-03-12 | 15:20:00 |
+------+--------+------------+----------+



--Q2.이름 검색하기
-- 지시사항 1번을 참고하여 코드를 작성하세요.
DESC member;
select * from member;

select * from member
where name ='김진모';

+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| num     | int(11)     | NO   | PRI | 0       |       |
| name    | varchar(8)  | NO   |     | NULL    |       |
| address | varchar(16) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
+-----+-----------+---------------------+
| num | name      | address             |
+-----+-----------+---------------------+
|   1 | 황영주    | 서울시 중구         |
|   2 | 김수련    | 부산시 동래구       |
|   3 | 이성현    | 광주시 남구         |
|   4 | 정한나    | 광주시 남구         |
|   5 | 이명연    | 부산시 영도구       |
|   6 | 김영숙    | 경기도 과천시       |
|   7 | 강정은    | 경기도 시흥시       |
|   8 | 고영주    | 대전시 서구         |
|   9 | 안철영    | 경기도 수원시       |
|  10 | 김진모    | 광주시 서구         |
+-----+-----------+---------------------+
+-----+-----------+------------------+
| num | name      | address          |
+-----+-----------+------------------+
|  10 | 김진모    | 광주시 서구      |
+-----+-----------+------------------+


-- Q3.누가 수업에 등록 했는가
-- 지시사항 1번을 참고하여 코드를 작성하세요.
DESC class;
select * from class;

select DISTINCT name
from class
order by name DESC;

+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| class_id | int(11)     | NO   | PRI | NULL    |       |
| id       | int(11)     | NO   | PRI | NULL    |       |
| name     | varchar(64) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
+----------+------+-------------+
| class_id | id   | name        |
+----------+------+-------------+
|      101 | 1000 | Elice       |
|      101 | 1001 | Cheshire    |
|      101 | 1003 | Caterpillar |
|      102 | 1002 | Dodo        |
|      102 | 1003 | Caterpillar |
|      103 | 1000 | Elice       |
|      103 | 1004 | Hatter      |
|      104 | 1000 | Elice       |
|      104 | 1002 | Dodo        |
|      104 | 1003 | Caterpillar |
|      104 | 1004 | Hatter      |
+----------+------+-------------+
+-------------+
| name        |
+-------------+
| Hatter      |
| Elice       |
| Dodo        |
| Cheshire    |
| Caterpillar |
+-------------+

-- Q4.수학 점수 구하기
-- 지시사항 1번을 참고하여 코드를 작성하세요.

DESC test;
select * from test;

select AVG(math), MAX(math), MIN(math)
from test;

+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | NO   | PRI | NULL    |       |
| kor   | int(11) | NO   |     | NULL    |       |
| eng   | int(11) | NO   |     | NULL    |       |
| math  | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
+------+-----+-----+------+
| id   | kor | eng | math |
+------+-----+-----+------+
| 1000 |  85 |  30 |   70 |
| 1001 |  60 |  45 |   25 |
| 1002 | 100 |  80 |   50 |
| 1003 |  55 |  45 |   85 |
| 1004 |  35 |  35 |   60 |
| 1005 |  45 |  65 |   50 |
| 1006 |  80 |  70 |   70 |
| 1007 |  55 |  85 |   75 |
| 1008 | 100 |  35 |   85 |
| 1009 |  60 | 100 |   95 |
+------+-----+-----+------+
+-----------+-----------+-----------+
| AVG(math) | MAX(math) | MIN(math) |
+-----------+-----------+-----------+
|   66.5000 |        95 |        25 |
+-----------+-----------+-----------+


-- Q5.한국에 온 사람은 누구?
-- 지시사항 1번을 참고하여 코드를 작성하세요.

DESC ticket;
select * from ticket;

select user_id, date, time
from ticket
where country='Korea'
and date between '2019-10-01' and '2019-12-31';

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| user_id     | int(11)     | NO   | PRI | NULL    |       |
| airplane_id | int(11)     | NO   | PRI | NULL    |       |
| date        | varchar(16) | NO   | PRI |         |       |
| time        | varchar(16) | NO   | PRI |         |       |
| country     | varchar(16) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+---------+-------------+--------------+----------+-------------+
| user_id | airplane_id | date         | time     | country     |
+---------+-------------+--------------+----------+-------------+
|    1000 |         101 | 2019-09-28   | 13:10:00 | China       |
|    1000 |         103 | 2019-12-23   | 12:10:00 | Korea       |
|    1000 |         106 | 2019-12-11   | 09:20:00 | China       |
|    1000 |         107 | 2019-11-08   | 23:10:00 | Japan       |
|    1001 |         103 | 2019-12-23   | 12:10:00 | Korea       |
|    1001 |         104 | 2019-07-25   | 18:00:00 | Indonesia   |
|    1001 |         108 | 2019-09-09   | 15:10:00 | Korea       |
|    1002 |         100 | 2019-02-06   | 06:50:00 | Korea       |
|    1002 |         109 | 2019-11-16   | 11:50:00 | Russia      |
|    1003 |         100 | 2019-10-17   | 23:30:00 | Korea       |
|    1003 |         101 | 2019-09-28   | 13:10:00 | China       |
|    1004 |         101 | 2019–09-28   | 13:10:00 | China       |
|    1004 |         102 | 2019-03-12   | 15:20:00 | U.S.A       |
|    1004 |         102 | 2019-04-12   | 19:50:00 | U.S.A       |
|    1004 |         105 | 2019–04-12   | 13:10:00 | Philippines |
|    1005 |         100 | 2019-09-01   | 07:00:00 | Korea       |
|    1005 |         100 | 2019-10-01   | 12:40:00 | Korea       |
|    1006 |         104 | 2019-12-31   | 15:40:00 | Korea       |
|    1007 |         108 | 2019-08-31   | 22:10:00 | Korea       |
|    1008 |         100 | 2020-01-01   | 16:00:00 | Korea       |
+---------+-------------+--------------+----------+-------------+
+---------+------------+----------+
| user_id | date       | time     |
+---------+------------+----------+
|    1000 | 2019-12-23 | 12:10:00 |
|    1001 | 2019-12-23 | 12:10:00 |
|    1003 | 2019-10-17 | 23:30:00 |
|    1005 | 2019-10-01 | 12:40:00 |
|    1006 | 2019-12-31 | 15:40:00 |
+---------+------------+----------+

--Q6.해외 여행자
-- 지시사항 1번을 참고하여 코드를 작성하세요.

DESC ticket;
DESC airplane;

select * from ticket;
select * from airplane;

select user_id, date, country
from ticket
inner join airplane
on ticket.airplane_id = airplane.id
-- where country NOT IN ('Korea','China','Japan')
where country !='Korea'
and country !='China' 
and country !='Japan'
order by user_id ASC;

-- 논리적으로 NOT IN(집합 개념) 와 != , AND 조합은 논리적으로 동일함.

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| user_id     | int(11)     | NO   | PRI | NULL    |       |
| airplane_id | int(11)     | NO   | PRI | NULL    |       |
| date        | varchar(16) | NO   | PRI |         |       |
| time        | varchar(16) | NO   | PRI |         |       |
+-------------+-------------+------+-----+---------+-------+
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| id      | int(11)     | NO   | PRI | NULL    |       |
| code    | varchar(3)  | NO   |     | NULL    |       |
| country | varchar(16) | NO   |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
+---------+-------------+--------------+----------+
| user_id | airplane_id | date         | time     |
+---------+-------------+--------------+----------+
|    1000 |         101 | 2019-09-28   | 13:10:00 |
|    1000 |         103 | 2019-12-23   | 12:10:00 |
|    1000 |         106 | 2019-12-11   | 09:20:00 |
|    1000 |         107 | 2019-11-08   | 23:10:00 |
|    1001 |         103 | 2019-12-23   | 12:10:00 |
|    1001 |         104 | 2019-07-25   | 18:00:00 |
|    1001 |         108 | 2019-09-09   | 15:10:00 |
|    1002 |         100 | 2019-02-06   | 06:50:00 |
|    1002 |         109 | 2019-11-16   | 11:50:00 |
|    1003 |         100 | 2019-10-17   | 23:30:00 |
|    1003 |         101 | 2019-09-28   | 13:10:00 |
|    1004 |         101 | 2019–09-28   | 13:10:00 |
|    1004 |         102 | 2019-03-12   | 15:20:00 |
|    1004 |         102 | 2019-04-12   | 19:50:00 |
|    1004 |         105 | 2019–04-12   | 13:10:00 |
+---------+-------------+--------------+----------+
+-----+------+-------------+
| id  | code | country     |
+-----+------+-------------+
| 100 | AAR  | Korea       |
| 101 | CBF  | China       |
| 102 | DYA  | U.S.A       |
| 103 | CNY  | China       |
| 104 | GIA  | Indonesia   |
| 105 | PAL  | Philippines |
| 106 | CXA  | China       |
| 107 | JAL  | Japan       |
| 108 | ESR  | Korea       |
| 109 | SRT  | Russia      |
+-----+------+-------------+

-- Q7.너의 점수는
-- 지시사항 1번을 참고하여 코드를 작성하세요.

DESC test;
DESC students;
select * from test;
select * from students;

select test.id, name,
(kor+eng+math)/3 AS test_average
from students
inner join test
on students.id = test.id;

+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | NO   | PRI | NULL    |       |
| kor   | int(11) | NO   |     | NULL    |       |
| eng   | int(11) | NO   |     | NULL    |       |
| math  | int(11) | NO   |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| name  | varchar(16) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
+------+-----+-----+------+
| id   | kor | eng | math |
+------+-----+-----+------+
| 1001 |  60 |  45 |   25 |
| 1002 | 100 |  80 |   50 |
| 1003 |  55 |  45 |   85 |
| 1004 |  35 |  35 |   60 |
| 1005 |  45 |  65 |   50 |
| 1006 |  80 |  70 |   70 |
| 1007 |  55 |  85 |   75 |
| 1008 | 100 |  35 |   85 |
| 1009 |  60 | 100 |   95 |
+------+-----+-----+------+
+------+--------+
| id   | name   |
+------+--------+
| 1001 | Olivia |
| 1002 | Noah   |
| 1003 | Emma   |
| 1004 | Liam   |
| 1005 | Ava    |
| 1006 | Mia    |
| 1007 | Mason  |
| 1008 | James  |
| 1009 | Camila |
+------+--------+
+------+--------+--------------+
| id   | name   | test_average |
+------+--------+--------------+
| 1001 | Olivia |      43.3333 |
| 1002 | Noah   |      76.6667 |
| 1003 | Emma   |      61.6667 |
| 1004 | Liam   |      43.3333 |
| 1005 | Ava    |      53.3333 |
| 1006 | Mia    |      73.3333 |
| 1007 | Mason  |      71.6667 |
| 1008 | James  |      73.3333 |
| 1009 | Camila |      85.0000 |
+------+--------+--------------+

-- Q8.쇼미더머니

-- 지시사항 1번을 참고하여 코드를 작성하세요.

DESC employees;
DESC departments;

select * from employees;
select * from departments;

select employees.name as emp_name,
departments.name as dept_name,
salary
from employees
inner join departments
on employees.dept = departments.id
where salary > (
    select AVG(salary)
    from employees
) and employees.name like 'C%';

--튜터 가이드 답변!!!!
SELECT employees.name AS emp_name, departments.name AS dept_name, employees.salary
FROM employees
INNER JOIN departments ON departments.id = employees.dept
AND employees.name like 'C%'
AND salary > (SELECT AVG(salary) FROM employees);

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| id     | int(11)     | NO   | PRI | NULL    |       |
| name   | varchar(16) | NO   |     | NULL    |       |
| salary | int(11)     | YES  |     | NULL    |       |
| dept   | int(11)     | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| name  | varchar(16) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
+------+-------------+--------+------+
| id   | name        | salary | dept |
+------+-------------+--------+------+
| 1000 | Cheshire    |  62102 |    1 |
| 1001 | Callaway    |  65828 |    2 |
| 1002 | Caterpillar |  33616 |    3 |
| 1003 | Hatter      |  48271 |    4 |
| 1004 | Elice       |  44387 |    5 |
| 1005 | Simmel      |  59008 |    1 |
| 1006 | Facello     |  78321 |    2 |
| 1007 | Bamford     |  66657 |    3 |
| 1008 | Koblick     |  54312 |    4 |
| 1009 | Maliniak    |  65400 |    5 |
| 1010 | Preusig     |  67651 |    1 |
| 1011 | Haddadi     |  45351 |    2 |
| 1012 | Berztiss    |  69955 |    3 |
| 1013 | Reistad     |  55455 |    4 |
| 1014 | Swan        |  34980 |    5 |
| 1015 | Casley      |  87494 |    1 |
| 1016 | Shanbhogue  |  54730 |    2 |
| 1017 | Czap        |  13747 |    3 |
| 1018 | Dodo        |  68473 |    4 |
| 1020 | Caine       |  73528 |    5 |
| 1021 | Wilfing     |  25549 |    1 |
| 1022 | Mack        |  85000 |    2 |
| 1023 | Claffy      |  54300 |    3 |
| 1024 | Babu        |  65234 |    4 |
| 1025 | Ranta       |  65312 |    5 |
| 1026 | Barreiro    |  54742 |    1 |
| 1027 | Cappello    |  85320 |    2 |
| 1028 | Coney       |  76586 |    3 |
| 1029 | Shokrollahi |  76410 |    4 |
| 1030 | Spelt       |  48432 |    5 |
| 1031 | Garigliano  |  48905 |    1 |
+------+-------------+--------+------+
+----+-----------------+
| id | name            |
+----+-----------------+
|  1 | Marketing       |
|  2 | Finance         |
|  3 | Human Resources |
|  4 | Production      |
|  5 | Development     |
+----+-----------------+
+----------+-----------------+--------+
| emp_name | dept_name       | salary |
+----------+-----------------+--------+
| Cheshire | Marketing       |  62102 |
| Callaway | Finance         |  65828 |
| Casley   | Marketing       |  87494 |
| Caine    | Development     |  73528 |
| Cappello | Finance         |  85320 |
| Coney    | Human Resources |  76586 |
+----------+-----------------+--------+