-- 02 JOIN 심화

--[미션1] 고객 명단 정리하기

-- 엘리스 컴퍼니에서는 고객관리 업무를 하기 위해 고객명단을 정리하려고 합니다. 엘리스 컴퍼니에서는 기본적인 고객 ID와 고객 이름을 가진 MEMBER 테이블을 가지고 있으며, 별도 MEMBER_DTL 테이블에 멤버 ID 별로 등급정보를 저장하고 있습니다.

-- 우선 엘리스 컴퍼니가 가지고 있는 정보를 바탕으로 고객 ID와 고객 이름, 고객 등급을 조회하려고 합니다. 이때, 전산상의 오류로 고객 등급이 저장되어 있지 않은 고객의 정보도 함께 출력되도록 해봅시다.

-- 또한, 정리된 내용 중에서 고객의 등급이 저장되어 있지 않거나, 고객 등급이 BRONZE인 고객은 한 번 더 출력해봅시다.

-- 지시사항
-- MEMBER테이블과 MEMBER_DTL 테이블에 대해서 LEFT OUTER JOIN 을 이용하여 멤버 ID, 멤버 이름, 멤버 등급을 모두 출력하는 쿼리를 작성해주세요.

-- 앞에서 출력한 정보에 대해서 고객 등급이 없거나(NULL 이거나) BRONZE 등급인 고객을 출력하는 쿼리를 작성해주세요.
DESC MEMBER;
DESC MEMBER_DTL;

select * from MEMBER;
select * from MEMBER_DTL;

-- 1. MEMBER 테이블과 MEMBER_DTL 테이블에 대해서 JOIN 구문을 활용해, 멤버ID, 멤버이름, 멤버등급을 출력해주세요.
select a.member_id, a.member_name, b.member_grade
from MEMBER as a
LEFT OUTER JOIN MEMBER_DTL as b
on a.member_id = b.member_id
order by member_id;
-- 2. 위의 쿼리에 대해서 등급이 없거나, BRONZE등급인 고객만 출력하는 쿼리를 작성해주세요.

select a.member_id, a.member_name, b.member_grade
from MEMBER as a
LEFT OUTER JOIN MEMBER_DTL as b
on a.member_id = b.member_id
where member_grade is NULL
or member_grade = 'BRONZE'
order by member_id;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| member_id   | varchar(10) | NO   | PRI | NULL    |       |
| member_name | varchar(50) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| member_id    | int(11)     | NO   | PRI | NULL    |       |
| member_grade | varchar(10) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

+-----------+-------------+
| member_id | member_name |
+-----------+-------------+
| 10001     | Kim         |
| 10002     | Park        |
| 10003     | Lee         |
| 10004     | Choi        |
| 10005     | Moon        |
+-----------+-------------+
+-----------+--------------+
| member_id | member_grade |
+-----------+--------------+
|     10001 | GOLD         |
|     10002 | GOLD         |
|     10003 | BRONZE       |
|     10004 | VIP          |
+-----------+--------------+
+-----------+-------------+--------------+
| member_id | member_name | member_grade |
+-----------+-------------+--------------+
| 10001     | Kim         | GOLD         |
| 10002     | Park        | GOLD         |
| 10003     | Lee         | BRONZE       |
| 10004     | Choi        | VIP          |
| 10005     | Moon        | NULL         |
+-----------+-------------+--------------+
+-----------+-------------+--------------+
| member_id | member_name | member_grade |
+-----------+-------------+--------------+
| 10003     | Lee         | BRONZE       |
| 10005     | Moon        | NULL         |
+-----------+-------------+--------------+

--[미션2] 투자 포트폴리오
-- 엘리스 토끼는 최근 코인 투자를 시작했어요. 엘리스 토끼가 투자한 코인에 대한 정보는 ELICE_WALLET에 저장되어 있습니다.

-- 엘리스 토끼는 자신이 구매한 코인들에 대해서 코인들의 정보가 담겨있는 EXCHANGE 테이블을 이용하여 현재 가격과 함께 확인하려고 합니다.
-- 엘리스 토끼가 구매한 코인에 대해서, 코인 이름과 코인 구입 가격, 코인 현재 가격을 출력하는 쿼리를 작성해봅시다.

-- 지시사항
-- 엘리스 토끼가 가지고 있는 코인 정보 테이블 ELICE_WALLET과 코인들의 현재 가격 정보를 담고 있는 EXCHANGE 테이블을 결합하여, 코인 이름(coin_name), 코인 구입 가격(coin_buy_price), 코인 현재 가격(coin_now_price) 을 출력하는 쿼리를 작성해보세요.

-- ELICE_WALLET테이블과 EXCHANGE테이블을 결합하여 코인이름, 코인구입가격, 코인현재가격을 출력해주세요.
DESC ELICE_WALLET;
DESC EXCHANGE;

select * from ELICE_WALLET;
select * from EXCHANGE;


select a.coin_name, a.coin_buy_price, b.coin_now_price
from ELICE_WALLET as a
inner join EXCHANGE as b
on a.coin_ticker = b.coin_ticker
order by coin_name;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| coin_ticker    | varchar(10) | NO   |     | NULL    |       |
| coin_name      | varchar(50) | NO   |     | NULL    |       |
| coin_buy_price | int(11)     | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| coin_id        | varchar(10) | NO   | PRI | NULL    |       |
| coin_ticker    | varchar(50) | NO   |     | NULL    |       |
| coin_now_price | int(11)     | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+-----------+----------------+----------------+
| coin_name | coin_buy_price | coin_now_price |
+-----------+----------------+----------------+
| Acoin     |           1000 |           2000 |
| Bcoin     |           3500 |          20000 |
| Ecoin     |            700 |            200 |
+-----------+----------------+----------------+

+----+-------------+-----------+----------------+
| id | coin_ticker | coin_name | coin_buy_price |
+----+-------------+-----------+----------------+
|  1 | AAA         | Acoin     |           1000 |
|  2 | BBB         | Bcoin     |           3500 |
|  3 | EEE         | Ecoin     |            700 |
+----+-------------+-----------+----------------+
+---------+-------------+----------------+
| coin_id | coin_ticker | coin_now_price |
+---------+-------------+----------------+
| 1       | A           |         100000 |
| 2       | AA          |           5000 |
| 3       | AAA         |           2000 |
| 4       | BBB         |          20000 |
| 5       | CCC         |           1500 |
| 6       | DDD         |           1000 |
| 7       | EEE         |            200 |
| 8       | FFF         |           2000 |
+---------+-------------+----------------+
+-----------+----------------+----------------+
| coin_name | coin_buy_price | coin_now_price |
+-----------+----------------+----------------+
| Acoin     |           1000 |           2000 |
| Bcoin     |           3500 |          20000 |
| Ecoin     |            700 |            200 |
+-----------+----------------+----------------+

--[미션3] 월급의 역전
-- 엘리스 컴퍼니에서 월급에 대해서 분석을 해보려고 합니다. 월급에 대해서는 EMPLOYEE에 직원 ID, 직원 이름, 급여를 저장해두었습니다.
-- 해당 정보를 이용하여 자신의 상사보다 더 높은 월급을 받고 있는 직원을 조회하려고 합니다.

-- 지시사항
-- EMPLOYEE 테이블에서 employee_id와 manager_id를 통해 셀프 조인을 진행하고, 이때 상사의 급여보다, 자신의 급여가 높은 직원에 대해서, 본인 employee_id, 본인 name, 본인 salary, 상사 name, 상사 salary를 조회하는 쿼리를 작성하세요.

-- EMPLOYEE 테이블에 대해 셀프조인을 활용하여 상사급여보다 자신의 급여가 높은 직원을 조회해봅시다.

select * from EMPLOYEE;

select a.employee_id, a.name, a.salary, b.name, b.salary
from EMPLOYEE as a
join EMPLOYEE as b
on  a.manager_id = b.employee_id 
where a.salary > b.salary 
order by employee_id asc;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| employee_id | int(11)     | NO   | PRI | NULL    |       |
| name        | varchar(50) | NO   |     | NULL    |       |
| salary      | int(11)     | NO   |     | NULL    |       |
| manager_id  | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

+-------------+------+--------+------------+
| employee_id | name | salary | manager_id |
+-------------+------+--------+------------+
|       10000 | kim  |  20000 |       NULL |
|       10001 | sim  |  10000 |      10000 |
|       10002 | song |   7000 |      10000 |
|       10003 | moon |   8500 |      10002 |
|       10004 | choi |   6000 |      10001 |
|       10005 | lee  |   9000 |      10003 |
|       10006 | park |   4000 |      10004 |
+-------------+------+--------+------------+
+-------------+------+--------+------+--------+
| employee_id | name | salary | name | salary |
+-------------+------+--------+------+--------+
|       10003 | moon |   8500 | song |   7000 |
|       10005 | lee  |   9000 | moon |   8500 |
+-------------+------+--------+------+--------+
