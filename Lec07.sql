--02 JOIN ��ȭ
--[�ǽ�1] FROM�� JOIN ���� - INNER JOIN/ON(1)

-- �Ʒ� ������ EMPLOYEE, POSITION_T ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC EMPLOYEE;
DESC POSITION_T;

-- EMPLOYEE ���̺�� POSITION_T ���̺� ���� POSITION_ID�� ���� �����Ϳ� ����
-- �����ȣ(EMPLOYEE_ID)�� �̸�(NAME), ���޸�Ī(POSITION_NAME)�� ��ȸ�ϴ� ������ �ۼ��غ�����.
select * from EMPLOYEE;
select * from POSITION_T;


select a.EMPLOYEE_ID, a.NAME, b.POSITION_NAME from EMPLOYEE as a
inner join POSITION_T as b
on a.POSITION_ID = b.POSITION_ID
order by a.EMPLOYEE_ID asc;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| EMPLOYEE_ID | varchar(20) | NO   | PRI | NULL    |       |
| NAME        | varchar(50) | NO   |     | NULL    |       |
| POSITION_ID | varchar(10) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| POSITION_ID   | varchar(10) | NO   | PRI | NULL    |       |
| POSITION_NAME | varchar(50) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
+-------------+------+-------------+
| EMPLOYEE_ID | NAME | POSITION_ID |
+-------------+------+-------------+
| E001        | kim  | P01         |
| E002        | song | P02         |
| E003        | kim  | P02         |
| E004        | kim  | P03         |
| E005        | moon | P03         |
| E006        | lee  | P04         |
+-------------+------+-------------+
+-------------+---------------+
| POSITION_ID | POSITION_NAME |
+-------------+---------------+
| P01         | ����          |
| P02         | ����          |
| P03         | ����          |
| P04         | �븮          |
+-------------+---------------+
+-------------+------+---------------+
| EMPLOYEE_ID | NAME | POSITION_NAME |
+-------------+------+---------------+
| E001        | kim  | ����          |
| E002        | song | ����          |
| E003        | kim  | ����          |
| E004        | kim  | ����          |
| E005        | moon | ����          |
| E006        | lee  | �븮          |
+-------------+------+---------------+

--[�ǽ�2] FROM�� JOIN ���� - INNER JOIN/ON(2)

-- �Ʒ� ������ STORE, STORE_TYPE_CODE ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC STORE;
DESC STORE_TYPE_CODE;

-- STORE ���̺�� STORE_TYPE_CODE ���̺� ���� store_type_code �÷��� �̿��Ͽ� ������ �ǽ���,
-- �����̸�(store_name)�� Ÿ���̸�(store_type_name)�� ��ȸ�ϴ� ������ �ۼ��غ�����.

select * from STORE;
select * from STORE_TYPE_CODE;

select A.store_name, B.store_type_name
from STORE as A
inner join STORE_TYPE_CODE as B
on A.store_type_code = B.store_type_code
order by A.store_name asc;

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| store_id        | int(11)      | NO   | PRI | NULL    |       |
| store_type_code | varchar(100) | NO   |     | NULL    |       |
| store_name      | varchar(100) | NO   |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| store_type_code | varchar(100) | NO   | PRI | NULL    |       |
| store_type_name | varchar(100) | NO   |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
+----------+-----------------+------------+
| store_id | store_type_code | store_name |
+----------+-----------------+------------+
|    10001 | S001V           | store1     |
|    10002 | S002V           | store2     |
|    10003 | S001A           | store3     |
|    10004 | S002V           | store4     |
|    10005 | S001A           | store5     |
|    10006 | S001A           | store6     |
+----------+-----------------+------------+
+-----------------+-----------------+
| store_type_code | store_type_name |
+-----------------+-----------------+
| S001A           | Type-AA         |
| S001V           | Type-A          |
| S002A           | Type-BB         |
| S002V           | Type-B          |
| S003V           | Type-C          |
+-----------------+-----------------+
+------------+-----------------+
| store_name | store_type_name |
+------------+-----------------+
| store1     | Type-A          |
| store2     | Type-B          |
| store3     | Type-AA         |
| store4     | Type-B          |
| store5     | Type-AA         |
| store6     | Type-AA         |
+------------+-----------------+

--[�ǽ�3] FROM�� JOIN ���� - INNER JOIN/USING

-- �Ʒ� ������ CLASS_REQUEST, STUDENT, CLASS ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC CLASS_REQUEST;
DESC STUDENT;
DESC CLASS;

select * from CLASS_REQUEST;
select * from STUDENT;
select * from CLASS;

-- 1. CLASS_REQUEST ���̺� ���� JOIN���� USING�� �̿��� STUDENT���̺�� �����Ͽ�
-- ��û��ȣ(REQUEST_ID)�� �л��̸�(STUDENT_NAME)�� ��ȸ�ϴ� ������ �ۼ��غ�����.
select REQUEST_ID, STUDENT_NAME
from CLASS_REQUEST 
inner join STUDENT
USING (STUDENT_ID)
order by REQUEST_ID;

-- 2. CLASS_REQUEST ���̺� ���� JOIN���� USING�� �̿��� CLASS���̺�� �����Ͽ�
-- ��û��ȣ(REQUEST_ID)�� �����̸�(CLASS_NAME)�� ��ȸ�ϴ� ������ �ۼ��غ�����.
select REQUEST_ID, CLASS_NAME
from CLASS_REQUEST 
inner join CLASS
USING (CLASS_ID)
order by REQUEST_ID;

-- 3. CLASS_REQUEST ���̺� ���� JOIN���� USING�� �̿��� STUDENT���̺�, CLASS���̺�� �����Ͽ�
-- ��û��ȣ(REQUEST_ID)�� �л��̸�(STUDENT_NAME), �����̸�(CLASS_NAME)�� ��ȸ�ϴ� ������ �ۼ��غ�����.
select REQUEST_ID, STUDENT_NAME, CLASS_NAME
from CLASS_REQUEST 
inner join STUDENT USING (STUDENT_ID)
inner join CLASS USING (CLASS_ID)
order by REQUEST_ID;

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| REQUEST_ID | varchar(10) | NO   | PRI | NULL    |       |
| STUDENT_ID | varchar(10) | NO   |     | NULL    |       |
| CLASS_ID   | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| STUDENT_ID   | varchar(10) | NO   | PRI | NULL    |       |
| STUDENT_NAME | varchar(30) | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| CLASS_ID   | varchar(10) | NO   | PRI | NULL    |       |
| CLASS_NAME | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
+------------+------------+----------+
| REQUEST_ID | STUDENT_ID | CLASS_ID |
+------------+------------+----------+
| R0001      | S001       | C002     |
| R0002      | S002       | C001     |
| R0003      | S002       | C002     |
| R0004      | S003       | C001     |
+------------+------------+----------+
+------------+--------------+
| STUDENT_ID | STUDENT_NAME |
+------------+--------------+
| S001       | Kim          |
| S002       | Moon         |
| S003       | Lee          |
+------------+--------------+
+----------+------------+
| CLASS_ID | CLASS_NAME |
+----------+------------+
| C001     | Math       |
| C002     | Korean     |
+----------+------------+
+------------+--------------+
| REQUEST_ID | STUDENT_NAME |
+------------+--------------+
| R0001      | Kim          |
| R0002      | Moon         |
| R0003      | Moon         |
| R0004      | Lee          |
+------------+--------------+
+------------+------------+
| REQUEST_ID | CLASS_NAME |
+------------+------------+
| R0001      | Korean     |
| R0002      | Math       |
| R0003      | Korean     |
| R0004      | Math       |
+------------+------------+
+------------+--------------+------------+
| REQUEST_ID | STUDENT_NAME | CLASS_NAME |
+------------+--------------+------------+
| R0001      | Kim          | Korean     |
| R0002      | Moon         | Math       |
| R0003      | Moon         | Korean     |
| R0004      | Lee          | Math       |
+------------+--------------+------------+

--[�ǽ�4] FROM�� JOIN ���� - NATURAL JOIN

-- �Ʒ� ������ LOGIN_HISTORY, MEMBER ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC LOGIN_HISTORY;
DESC MEMBER;

select * from LOGIN_HISTORY;
select * from MEMBER;

-- LOGIN_HISTORY���̺�� MEMBER���̺� ���� NATURAL JOIN�� �̿��Ͽ� ��ȸ�ϰ��� �ϴ� �÷��� ����غ�����.

select login_history_id, member_name, member_email, login_date
from LOGIN_HISTORY
NATURAL JOIN MEMBER
order by login_history_id;

+------------------+----------+------+-----+---------+-------+
| Field            | Type     | Null | Key | Default | Extra |
+------------------+----------+------+-----+---------+-------+
| LOGIN_HISTORY_ID | int(11)  | NO   | PRI | NULL    |       |
| MEMBER_ID        | int(11)  | NO   |     | NULL    |       |
| LOGIN_DATE       | datetime | NO   |     | NULL    |       |
+------------------+----------+------+-----+---------+-------+
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| MEMBER_ID    | int(11)      | NO   | PRI | NULL    |       |
| MEMBER_NAME  | varchar(10)  | NO   |     | NULL    |       |
| MEMBER_EMAIL | varchar(100) | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
+------------------+-----------+---------------------+
| LOGIN_HISTORY_ID | MEMBER_ID | LOGIN_DATE          |
+------------------+-----------+---------------------+
|                1 |     10002 | 2021-04-01 13:41:23 |
|                2 |     10003 | 2021-04-01 19:21:41 |
|                4 |     10002 | 2021-04-02 16:18:39 |
+------------------+-----------+---------------------+
+-----------+-------------+----------------+
| MEMBER_ID | MEMBER_NAME | MEMBER_EMAIL   |
+-----------+-------------+----------------+
|     10001 | Kim         | kim@naver.com  |
|     10002 | Moon        | moon@naver.com |
|     10003 | Lee         | lee@naver.com  |
+-----------+-------------+----------------+
+------------------+-------------+----------------+---------------------+
| login_history_id | member_name | member_email   | login_date          |
+------------------+-------------+----------------+---------------------+
|                1 | Moon        | moon@naver.com | 2021-04-01 13:41:23 |
|                2 | Lee         | lee@naver.com  | 2021-04-01 19:21:41 |
|                4 | Moon        | moon@naver.com | 2021-04-02 16:18:39 |
+------------------+-------------+----------------+---------------------+

--[�ǽ�5] FROM�� JOIN ���� - CROSS JOIN

-- �Ʒ� ������ FIRST_NAME_T, LAST_NAME_T ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC FIRST_NAME_T;
DESC LAST_NAME_T;

select * from FIRST_NAME_T;
select * from LAST_NAME_T;
-- FIRST_NAME_T�� LAST_NAME_T�� ũ�ν��������� �����ϰ�, first_name�� last_name�� ����ϼ���.

select first_name, last_name
from FIRST_NAME_T
cross join LAST_NAME_T
order by first_name asc, last_name asc;

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int(11)     | NO   | PRI | NULL    |       |
| first_name | varchar(10) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int(11)     | NO   | PRI | NULL    |       |
| last_name | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
+----+------------+
| id | first_name |
+----+------------+
|  1 | Kim        |
|  2 | Lee        |
|  3 | Choi       |
+----+------------+
+----+-----------+
| id | last_name |
+----+-----------+
|  1 | Chulsoo   |
|  2 | Gildong   |
|  3 | Yeonghee  |
+----+-----------+
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Choi       | Chulsoo   |
| Choi       | Gildong   |
| Choi       | Yeonghee  |
| Kim        | Chulsoo   |
| Kim        | Gildong   |
| Kim        | Yeonghee  |
| Lee        | Chulsoo   |
| Lee        | Gildong   |
| Lee        | Yeonghee  |
+------------+-----------+

--[�ǽ�6] FROM�� JOIN ���� - LEFT OUTER JOIN

-- �Ʒ� ������ MEMBER, MEMBER_EMAIL ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC MEMBER;
DESC MEMBER_EMAIL;

select * from MEMBER;
select * from MEMBER_EMAIL;
-- MEMBER���̺�� MEMBER_EMAIL���̺� ���� LEFT OUTER JOIN�� ����Ͽ�
-- member_name�� email�� �����Ͽ� ����ϼ���.

select MEMBER.member_name, MEMBER_EMAIL.email
from MEMBER
LEFT OUTER JOIN MEMBER_EMAIL
ON MEMBER_EMAIL.member_id = MEMBER.member_id
order by member_name ASC;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| member_id   | int(11)     | NO   | PRI | NULL    |       |
| member_name | varchar(30) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int(11)     | NO   | PRI | NULL    |       |
| member_id | int(11)     | NO   |     | NULL    |       |
| email     | varchar(30) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
+-----------+--------------+
| member_id | member_name  |
+-----------+--------------+
|     10001 | KimChulsoo   |
|     10002 | HongGildong  |
|     10003 | ChoiChulsoo  |
|     10004 | LeeJames     |
|     10005 | ParkYeonghee |
+-----------+--------------+
+----+-----------+-------------------+
| id | member_id | email             |
+----+-----------+-------------------+
|  1 |     10001 | kim@naver.com     |
|  2 |     10003 | chulsoo@naver.com |
|  3 |     10004 | james@naver.com   |
|  4 |     10002 | gildong@naver.com |
+----+-----------+-------------------+
+--------------+-------------------+
| member_name  | email             |
+--------------+-------------------+
| ChoiChulsoo  | chulsoo@naver.com |
| HongGildong  | gildong@naver.com |
| KimChulsoo   | kim@naver.com     |
| LeeJames     | james@naver.com   |
| ParkYeonghee | NULL              |
+--------------+-------------------+

--[�ǽ�7] FROM�� JOIN ���� - RIGHT OUTER JOIN

-- �Ʒ� ������ RESPONSE_DTL, REQUEST ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC RESPONSE_DTL;
DESC REQUEST;

select * from RESPONSE_DTL;
select * from REQUEST;
-- RESPONSE_DTL���̺��� �������� REQUEST���̺�� RIGHT OUTER JOIN�� �ǽ��ϴ� ������ �ۼ��غ�����.

select REQUEST.request_id, REQUEST.request_member_id, RESPONSE_DTL.response_content
from RESPONSE_DTL
RIGHT OUTER JOIN REQUEST
ON RESPONSE_DTL.response_id = REQUEST.response_id
order by request_id ASC;

+------------------+--------------+------+-----+---------+-------+
| Field            | Type         | Null | Key | Default | Extra |
+------------------+--------------+------+-----+---------+-------+
| response_id      | int(11)      | NO   | PRI | NULL    |       |
| response_content | varchar(100) | NO   |     | NULL    |       |
+------------------+--------------+------+-----+---------+-------+
+-------------------+---------+------+-----+---------+-------+
| Field             | Type    | Null | Key | Default | Extra |
+-------------------+---------+------+-----+---------+-------+
| request_id        | int(11) | NO   | PRI | NULL    |       |
| request_member_id | int(11) | NO   |     | NULL    |       |
| response_id       | int(11) | NO   |     | NULL    |       |
+-------------------+---------+------+-----+---------+-------+
+-------------+-----------------------+
| response_id | response_content      |
+-------------+-----------------------+
|         200 | Success               |
|         403 | Forbidden.            |
|         404 | Not Found             |
|         500 | Interner Server Error |
+-------------+-----------------------+
+------------+-------------------+-------------+
| request_id | request_member_id | response_id |
+------------+-------------------+-------------+
|      10101 |             10001 |         200 |
|      10102 |             10001 |         404 |
|      10103 |             10001 |         201 |
|      10104 |             10002 |         201 |
+------------+-------------------+-------------+
+------------+-------------------+------------------+
| request_id | request_member_id | response_content |
+------------+-------------------+------------------+
|      10101 |             10001 | Success          |
|      10102 |             10001 | Not Found        |
|      10103 |             10001 | NULL             |
|      10104 |             10002 | NULL             |
+------------+-------------------+------------------+

--[�ǽ�8] FROM�� JOIN ���� - FULL OUTER JOIN

-- �Ʒ� ������ FRONT_VERSION_HIST, BACK_VERSION_HIST ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC FRONT_VERSION_HIST;
DESC BACK_VERSION_HIST;

select * from FRONT_VERSION_HIST;
select * from BACK_VERSION_HIST;
-- 1. FRONT_VERSION_HIST ���̺��� �������� BACK_VERSION_HIST ���̺�� ����ID�� LEFT OUTER JOIN�� ���ּ���.
select FRONT_VERSION_HIST.version_id, FRONT_VERSION_HIST.version_content_front, BACK_VERSION_HIST.version_content_back
from FRONT_VERSION_HIST
LEFT OUTER JOIN BACK_VERSION_HIST
ON FRONT_VERSION_HIST.version_id = BACK_VERSION_HIST.version_id
order by version_id ASC;

-- 2. FRONT_VERSION_HIST ���̺��� �������� BACK_VERSION_HIST ���̺�� ����ID�� RIGHT OUTER JOIN�� ���ּ���.
select BACK_VERSION_HIST.version_id, version_content_front, version_content_back
from FRONT_VERSION_HIST
RIGHT OUTER JOIN BACK_VERSION_HIST
ON FRONT_VERSION_HIST.version_id = BACK_VERSION_HIST.version_id
order by version_id ASC;

-- 3. ������ �ۼ��� �� �������� ORDER BY�� ���� ��, �ߺ��� �����ϴ� ���տ����ڷ� �����ϰ� ���� ����� ���� ������ ���ּ���.
select FRONT_VERSION_HIST.version_id, FRONT_VERSION_HIST.version_content_front, BACK_VERSION_HIST.version_content_back
from FRONT_VERSION_HIST
LEFT OUTER JOIN BACK_VERSION_HIST
ON FRONT_VERSION_HIST.version_id = BACK_VERSION_HIST.version_id

UNION

select BACK_VERSION_HIST.version_id, version_content_front, version_content_back
from FRONT_VERSION_HIST
RIGHT OUTER JOIN BACK_VERSION_HIST
ON FRONT_VERSION_HIST.version_id = BACK_VERSION_HIST.version_id

ORDER BY version_id ASC;

+-----------------------+--------------+------+-----+---------+-------+
| Field                 | Type         | Null | Key | Default | Extra |
+-----------------------+--------------+------+-----+---------+-------+
| version_id            | varchar(100) | NO   | PRI | NULL    |       |
| version_content_front | varchar(100) | NO   |     | NULL    |       |
+-----------------------+--------------+------+-----+---------+-------+
+----------------------+--------------+------+-----+---------+-------+
| Field                | Type         | Null | Key | Default | Extra |
+----------------------+--------------+------+-----+---------+-------+
| version_id           | varchar(100) | NO   | PRI | NULL    |       |
| version_content_back | varchar(100) | NO   |     | NULL    |       |
+----------------------+--------------+------+-----+---------+-------+
+------------+-----------------------+
| version_id | version_content_front |
+------------+-----------------------+
| 0.0.1      | Front Init            |
| 0.0.2      | Front Setting         |
| 0.0.4      | Front Dev1            |
| 0.0.7      | Front Dev2            |
| 0.1.0      | Front Deploy          |
+------------+-----------------------+
+------------+----------------------+
| version_id | version_content_back |
+------------+----------------------+
| 0.0.1      | BACK Init            |
| 0.0.2      | BACK Setting         |
| 0.0.3      | BACK Dev1            |
| 0.0.5      | BACK Dev2            |
| 0.0.6      | BACK Dev3            |
| 0.1.0      | BACK Deploy          |
+------------+----------------------+
+------------+-----------------------+----------------------+
| version_id | version_content_front | version_content_back |
+------------+-----------------------+----------------------+
| 0.0.1      | Front Init            | BACK Init            |
| 0.0.2      | Front Setting         | BACK Setting         |
| 0.0.4      | Front Dev1            | NULL                 |
| 0.0.7      | Front Dev2            | NULL                 |
| 0.1.0      | Front Deploy          | BACK Deploy          |
+------------+-----------------------+----------------------+
+------------+-----------------------+----------------------+
| version_id | version_content_front | version_content_back |
+------------+-----------------------+----------------------+
| 0.0.1      | Front Init            | BACK Init            |
| 0.0.2      | Front Setting         | BACK Setting         |
| 0.0.3      | NULL                  | BACK Dev1            |
| 0.0.5      | NULL                  | BACK Dev2            |
| 0.0.6      | NULL                  | BACK Dev3            |
| 0.1.0      | Front Deploy          | BACK Deploy          |
+------------+-----------------------+----------------------+
+------------+-----------------------+----------------------+
| version_id | version_content_front | version_content_back |
+------------+-----------------------+----------------------+
| 0.0.1      | Front Init            | BACK Init            |
| 0.0.2      | Front Setting         | BACK Setting         |
| 0.0.3      | NULL                  | BACK Dev1            |
| 0.0.4      | Front Dev1            | NULL                 |
| 0.0.5      | NULL                  | BACK Dev2            |
| 0.0.6      | NULL                  | BACK Dev3            |
| 0.0.7      | Front Dev2            | NULL                 |
| 0.1.0      | Front Deploy          | BACK Deploy          |
+------------+-----------------------+----------------------+

--[�ǽ�9] FROM�� JOIN ���� - INNER JOIN/ON/WHERE(1)

-- �Ʒ� ������ REQUEST_HIST, MEMBER ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC REQUEST_HIST;
DESC MEMBER;

select * from REQUEST_HIST;
select * from MEMBER;
-- REQUEST_HIST ���̺�� MEMBER ���̺��� INNER JOIN�Ͽ� ��ȸ�ϵ�, ��û����(req_status)�� fail�� ������ ��ȸ�ϴ� ������ �ۼ��ϼ���.

select a.request_id, a.req_status, b.member_name
from REQUEST_HIST as a
INNER JOIN MEMBER as b
ON a.req_member_id = b.member_id
where req_status = 'fail'; 

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| request_id    | int(11)     | NO   | PRI | NULL    |       |
| req_status    | varchar(50) | NO   |     | NULL    |       |
| req_member_id | varchar(10) | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| member_id   | varchar(10) | NO   | PRI | NULL    |       |
| member_name | varchar(50) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+------------+------------+---------------+
| request_id | req_status | req_member_id |
+------------+------------+---------------+
|      10001 | success    | P001          |
|      10002 | success    | P002          |
|      10003 | fail       | P001          |
|      10004 | success    | P002          |
|      10005 | fail       | P003          |
|      10006 | fail       | P001          |
+------------+------------+---------------+
+-----------+-------------+
| member_id | member_name |
+-----------+-------------+
| P001      | Kim         |
| P002      | Park        |
| P003      | Lee         |
+-----------+-------------+
+------------+------------+-------------+
| request_id | req_status | member_name |
+------------+------------+-------------+
|      10003 | fail       | Kim         |
|      10005 | fail       | Lee         |
|      10006 | fail       | Kim         |
+------------+------------+-------------+

--[�ǽ�10] FROM�� JOIN ���� - INNER JOIN/ON/WHERE(2)

-- �Ʒ� ������ APPLICATION, APPLICATION_DTL ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC APPLICATION;
DESC APPLICATION_DTL;

select * from APPLICATION;
select * from APPLICATION_DTL;
-- APPLICATION ���̺�� APPLICATION_DTL ���̺� ���� app_id�� �������� INNER JOIN�� �ǽ��ϵ�
-- app_device�� iphone �Ǵ� all�� �����Ϳ� ���ؼ� ��ȸ�ϴ� ������ �ۼ��ϼ���.

select a.app_id, b.app_name, b.app_content
from APPLICATION as a
INNER JOIN APPLICATION_DTL as b
ON a.app_id = b.app_id
where app_device in ('iphone', 'all')
order by app_id asc;

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| app_id     | int(11)     | NO   | PRI | NULL    |       |
| app_device | varchar(50) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| app_id      | int(11)     | NO   | PRI | NULL    |       |
| app_name    | varchar(50) | NO   |     | NULL    |       |
| app_content | varchar(50) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+--------+------------+
| app_id | app_device |
+--------+------------+
|  10001 | iphone     |
|  10002 | android    |
|  10003 | all        |
|  10004 | android    |
+--------+------------+
+--------+----------+-------------+
| app_id | app_name | app_content |
+--------+----------+-------------+
|  10001 | APP1     | First App   |
|  10002 | APP2     | Second App  |
|  10003 | APP3     | Third App   |
|  10004 | APP4     | 4th App     |
+--------+----------+-------------+
+--------+----------+-------------+
| app_id | app_name | app_content |
+--------+----------+-------------+
|  10001 | APP1     | First App   |
|  10003 | APP3     | Third App   |
+--------+----------+-------------+

--[�ǽ�11] FROM�� JOIN ���� - LEFT OUTER JOIN/WHERE

-- �Ʒ� ������ AIR_ROUTE, AIRPLANE ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC AIR_ROUTE;
DESC AIRPLANE;

select * from AIR_ROUTE;
select * from AIRPLANE;
-- AIR_ROUTE���̺�� AIRPLANE���̺� ���� route_id�� �����ϰ� ��ΰ� Korea�� �����ϴ� �����͸� ��ȸ�ϴ� ������ �ۼ��ϼ���.

select a.route_from, a.route_to, b.airplane_id
from AIR_ROUTE as a
LEFT OUTER JOIN AIRPLANE as b
ON b.route_id = a.route_id
where route_from = 'Korea'
order by airplane_id asc; 

+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| route_id   | varchar(20) | NO   | PRI | NULL    |       |
| route_from | varchar(50) | NO   |     | NULL    |       |
| route_to   | varchar(50) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| airplane_id | varchar(10) | NO   | PRI | NULL    |       |
| route_id    | varchar(20) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
+----------+------------+----------+
| route_id | route_from | route_to |
+----------+------------+----------+
| R001     | Korea      | Japan    |
| R002     | Korea      | China    |
| R003     | China      | Japan    |
| R004     | China      | Korea    |
+----------+------------+----------+
+-------------+----------+
| airplane_id | route_id |
+-------------+----------+
| P01         | R004     |
| P02         | R003     |
| P03         | R002     |
+-------------+----------+
+------------+----------+-------------+
| route_from | route_to | airplane_id |
+------------+----------+-------------+
| Korea      | Japan    | NULL        |
| Korea      | China    | P03         |
+------------+----------+-------------+

--[�ǽ�12] ���� ����

-- �Ʒ� ������ EMPLOYEE ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC EMPLOYEE;

select * from EMPLOYEE;
-- EMPLOYEE ���̺��� SELF JOIN�Ͽ� ���ID, ����̸�, �������̸��� ��ȸ�ϴ� ������ �ۼ��غ�����.

select a.employee_id, a.employee_name,
b.employee_name as manager_name
from EMPLOYEE as a,
EMPLOYEE as b
where a.manager_id = b.employee_id
order by employee_id asc;

+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| employee_id   | int(11)     | NO   | PRI | NULL    |       |
| employee_name | varchar(30) | NO   |     | NULL    |       |
| manager_id    | int(11)     | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
+-------------+---------------+------------+
| employee_id | employee_name | manager_id |
+-------------+---------------+------------+
|       10001 | Kim           |       NULL |
|       10002 | Lee           |      10001 |
|       10003 | Park          |      10001 |
|       10004 | Moon          |      10002 |
|       10005 | Choi          |      10002 |
+-------------+---------------+------------+
+-------------+---------------+--------------+
| employee_id | employee_name | manager_name |
+-------------+---------------+--------------+
|       10002 | Lee           | Kim          |
|       10003 | Park          | Kim          |
|       10004 | Moon          | Lee          |
|       10005 | Choi          | Lee          |
+-------------+---------------+--------------+