--[�̼�1] �� ��� �����ϱ�

select * from MEMBER;
select * from MEMBER_DTL;

-- 1. MEMBER ���̺�� MEMBER_DTL ���̺� ���ؼ� JOIN ������ Ȱ����, ���ID, ����̸�, �������� ������ּ���.
select a.member_id, a.member_name, b.member_grade
from MEMBER as a
LEFT OUTER JOIN MEMBER_DTL as b
on a.member_id = b.member_id
order by member_id;
-- 2. ���� ������ ���ؼ� ����� ���ų�, BRONZE����� ���� ����ϴ� ������ �ۼ����ּ���.

select a.member_id, a.member_name, b.member_grade
from MEMBER as a
LEFT OUTER JOIN MEMBER_DTL as b
on a.member_id = b.member_id
where member_grade is NULL
or member_grade = 'BRONZE'
order by member_id;

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

--[�̼�2] ���� ��Ʈ������

-- ELICE_WALLET���̺�� EXCHANGE���̺��� �����Ͽ� �����̸�, ���α��԰���, �������簡���� ������ּ���.
select * from ELICE_WALLET;
select * from EXCHANGE;


select a.coin_name, a.coin_buy_price, b.coin_now_price
from ELICE_WALLET as a
inner join EXCHANGE as b
on a.coin_ticker = b.coin_ticker
order by coin_name;

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

--[�̼�3] ������ ����

-- EMPLOYEE ���̺� ���� ���������� Ȱ���Ͽ� ���޿����� �ڽ��� �޿��� ���� ������ ��ȸ�غ��ô�.

select * from EMPLOYEE;

select a.employee_id, a.name, a.salary, b.name, b.salary
from EMPLOYEE as a
join EMPLOYEE as b
on  a.manager_id = b.employee_id 
where a.salary > b.salary 
order by employee_id asc;

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
