--02 JOIN 심화
--[실습1] FROM절 JOIN 형태 - INNER JOIN/ON(1)
-- EMPLOYEE 테이블과 POSITION_T 테이블에는 각 테이블의 구조에 맞도록 사원 정보 및 직급 정보가 담겨 있습니다.

-- EMPLOYEE 테이블의 사원 정보에는 직급의 명칭이 담겨있지 않고, 어떤 직급인지에 대한 직급 ID가 담겨있습니다.

-- 각 사원 정보에 따라서 직급 명칭을 알기 위해 INNER JOIN과 ON을 활용하여 사원 번호(EMPLOYEE_ID), 이름(NAME), 직급 명칭(POSITION_NAME) 을 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- EMPLOYEE테이블과 POSITION_T 테이블에서 직급 ID(POSITION_ID) 가 같은 데이터에 대해 INNER JOIN절 과 ON절을 이용하여 사원 번호(EMPLOYEE_ID), 이름(NAME), 직급 명칭(POSITION_NAME) 을 조회하는 쿼리를 작성하세요.

-- 아래 쿼리는 EMPLOYEE, POSITION_T 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC EMPLOYEE;
DESC POSITION_T;

-- EMPLOYEE 테이블과 POSITION_T 테이블에 대해 POSITION_ID가 같은 데이터에 대해
-- 사원번호(EMPLOYEE_ID)와 이름(NAME), 직급명칭(POSITION_NAME)을 조회하는 쿼리를 작성해보세요.
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
| P01         | 부장          |
| P02         | 차장          |
| P03         | 과장          |
| P04         | 대리          |
+-------------+---------------+
+-------------+------+---------------+
| EMPLOYEE_ID | NAME | POSITION_NAME |
+-------------+------+---------------+
| E001        | kim  | 부장          |
| E002        | song | 차장          |
| E003        | kim  | 차장          |
| E004        | kim  | 과장          |
| E005        | moon | 과장          |
| E006        | lee  | 대리          |
+-------------+------+---------------+

--[실습2] FROM절 JOIN 형태 - INNER JOIN/ON(2)
-- STORE 테이블에는 가게 타입 코드와 가게 이름 정보가 담겨 있으며, STORE_TYPE_CODE 테이블에는 가게 타입 코드와 타입 이름 정보가 담겨 있습니다.

-- STORE 테이블에는 어떠한 타입의 가게인지 가게 타입 이름이 저장되어 있지 않고, 가게 타입 코드 정보가 저장되어 있습니다. STORE_TYPE_CODE 테이블을 이용하여 STORE 테이블에서 각 가게가 어떤 가게 타입인지 코드가 아닌 이름으로 표현되도록 쿼리를 작성해봅시다.

-- STORE 테이블에 대해서 STORE_TYPE_CODE 테이블과 가게 타입 코드(store_type_code) 를 이용하여 INNER JOIN를 실시해 가게 이름(store_name)과 타입 이름(store_type_name) 을 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- STORE테이블과 STORE_TYPE_CODE 테이블에서 가게 타입 코드(store_type_code) 가 같은 데이터에 대해 INNER JOIN절 과 ON절을 이용하여 가게 이름(store_name)과 타입 이름(store_type_name) 을 조회하는 쿼리를 작성하세요.

-- 아래 쿼리는 STORE, STORE_TYPE_CODE 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC STORE;
DESC STORE_TYPE_CODE;

-- STORE 테이블과 STORE_TYPE_CODE 테이블에 대해 store_type_code 컬럼을 이용하여 조인을 실시해,
-- 가게이름(store_name)과 타입이름(store_type_name)을 조회하는 쿼리를 작성해보세요.

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

--[실습3] FROM절 JOIN 형태 - INNER JOIN/USING
-- STUDENT 테이블에는 학생 번호와 학생 이름 정보가, CLASS 테이블에는 과목 번호와 과목 이름이, 그리고 CLASS_REQUEST테이블에는 신청 번호에 대한 학생 번호와 과목 번호 정보가 담겨 있습니다.

-- CLASS_REQUEST 테이블에는 학생 이름과 과목 이름 정보가 담겨있지 않고, 학생 번호와 과목 번호 정보가 담겨있습니다.
-- 이에 대해서 CLASS_REQUEST의 각 데이터에 대해 과목 이름과 학생 이름 정보를 함께 출력해봅시다.

-- CLASS_REQUEST 테이블을 기준으로, 신청 번호에 따른 학생 이름과 과목 이름의 정보를 조회하려고 합니다. JOIN 절과 USING 절을 이용하여, CLASS_REQUEST 테이블에 STUDENT 테이블과 CLASS 테이블을 결합하여, 신청 번호(REQUEST_ID), 학생 이름(STUDENT_NAME), 과목 이름(CLASS_NAME) 정보를 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- CLASS_REQUEST테이블에 대해 STUDENT 테이블을 INNER JOIN절 과 USING절을 이용하여 결합하고 신청 번호(REQUEST_ID)와 학생 이름(STUDENT_NAME) 을 조회하는 쿼리를 작성하세요.

-- CLASS_REQUEST테이블에 대해 CLASS 테이블을 INNER JOIN절 과 USING절을 이용하여 결합하고 신청 번호(REQUEST_ID)와 과목 이름(CLASS_NAME) 을 조회하는 쿼리를 작성하세요.

-- CLASS_REQUEST테이블에 대해 STUDENT 테이블과 CLASS테이블을 INNER JOIN절 과 USING절을 이용하여 결합하고 신청 번호(REQUEST_ID)와 학생 이름(STUDENT_NAME), 과목 이름(CLASS_NAME) 을 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 CLASS_REQUEST, STUDENT, CLASS 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC CLASS_REQUEST;
DESC STUDENT;
DESC CLASS;

select * from CLASS_REQUEST;
select * from STUDENT;
select * from CLASS;

-- 1. CLASS_REQUEST 테이블에 대해 JOIN절과 USING을 이용해 STUDENT테이블과 결합하여
-- 신청번호(REQUEST_ID)와 학생이름(STUDENT_NAME)을 조회하는 쿼리를 작성해보세요.
select REQUEST_ID, STUDENT_NAME
from CLASS_REQUEST 
inner join STUDENT
USING (STUDENT_ID)
order by REQUEST_ID;

-- 2. CLASS_REQUEST 테이블에 대해 JOIN절과 USING을 이용해 CLASS테이블과 결합하여
-- 신청번호(REQUEST_ID)와 과목이름(CLASS_NAME)을 조회하는 쿼리를 작성해보세요.
select REQUEST_ID, CLASS_NAME
from CLASS_REQUEST 
inner join CLASS
USING (CLASS_ID)
order by REQUEST_ID;

-- 3. CLASS_REQUEST 테이블에 대해 JOIN절과 USING을 이용해 STUDENT테이블, CLASS테이블과 결합하여
-- 신청번호(REQUEST_ID)와 학생이름(STUDENT_NAME), 과목이름(CLASS_NAME)을 조회하는 쿼리를 작성해보세요.
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

--[실습4] FROM절 JOIN 형태 - NATURAL JOIN
-- LOGIN_HISTORY 테이블에는 멤버의 로그인 이력 정보가 담겨있으며, MEMBER 테이블에는 멤버의 정보가 담겨있습니다.

-- 하지만 LOGIN_HISTORY 테이블에는 멤버의 이름 정보가 담겨 있지 않고, 멤버 ID정보가 담겨있습니다. JOIN을 활용하여 로그인 이력 정보에 멤버 이름을 함께 출력해봅시다.

-- LOGIN_HISTORY 테이블에 있는 멤버 ID(MEMBER_ID) 를 통해 MEMBER테이블과 NATURAL JOIN으로 결합해 로그인 이력 ID(login_history_id), 멤버 이름(member_name), 멤버 이메일(member_email), 로그인 시각(login_date) 정보를 출력하는 쿼리를 작성해봅시다.
-- 시사항
-- LOGIN_HISTORY테이블과 MEMBER 테이블에 대해 NATURAL JOIN을 이용하여 로그인 이력 ID(login_history_id), 멤버 이름(member_name), 멤버 이메일(member_email), 로그인 시각(login_date) 을 조회하는 쿼리를 작성하세요.

-- 아래 쿼리는 LOGIN_HISTORY, MEMBER 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC LOGIN_HISTORY;
DESC MEMBER;

select * from LOGIN_HISTORY;
select * from MEMBER;

-- LOGIN_HISTORY테이블과 MEMBER테이블에 대해 NATURAL JOIN을 이용하여 조회하고자 하는 컬럼을 출력해보세요.

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

--[실습5] FROM절 JOIN 형태 - CROSS JOIN
-- FIRST_NAME_T 테이블과 LAST_NAME_T 테이블에는 각 테이블의 구조에 맞도록 id 값과 first_name 또는 last_name 정보가 담겨 있습니다.

-- FIRST_NAME_T 테이블의 데이터와 LAST_NAME_T 테이블의 데이터를 결합하면 가상의 이름 데이터 하나가 출력됩니다. 그럼 각 테이블의 모든 데이터를 이용하여 first_name과 last_name에 대한 모든 경우의 수를 구해봅시다.

-- 가능한 이름의 조합에 대해 모든 경우의 수를 출력하기 위해 CROSS JOIN을 활용하려고 합니다.
-- FIRST_NAME_T 테이블과 LAST_NAME_T 테이블에 대해서 CROSS JOIN을 통해 결합하여 first_name과 last_name을 출력하여 가능한 모든 케이스를 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- FIRST_NAME_T 테이블과 LAST_NAME_T 테이블을 CROSS JOIN으로 결합하고 first_name, last_name 을 출력하는 쿼리를 작성하세요.
-- 아래 쿼리는 FIRST_NAME_T, LAST_NAME_T 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC FIRST_NAME_T;
DESC LAST_NAME_T;

select * from FIRST_NAME_T;
select * from LAST_NAME_T;
-- FIRST_NAME_T와 LAST_NAME_T를 크로스조인으로 결합하고, first_name과 last_name을 출력하세요.

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

--[실습6] FROM절 JOIN 형태 - LEFT OUTER JOIN
-- MEMBER 테이블에는 멤버 ID, 멤버 이름 정보가 담겨 있으며, MEMBER_EMAIL 테이블에는 ID와 멤버 ID, EMAIL 정보가 담겨있습니다.

-- MEMBER 테이블에 있는 멤버들의 정보에 대해 MEMBER_EMAIL 테이블의 EMAIL정보와 함께 출력하려고 합니다.
-- 하지만, 일부 멤버는 MEMBER_EMAIL 테이블에 EMAIL 정보가 없습니다. EMAIL 정보가 없는 멤버들은 출력되지 않는 것이 아니라, EMAIL 값을 NULL로 출력해봅시다.

-- MEMBER 테이블의 멤버 ID 정보와, MEMBER_EMAIL 테이블의 멤버 ID 정보를 기준으로 2개의 테이블을 결합하려 합니다. 이때 MEMBER 테이블을 기준으로하여, MEMBER 테이블의 정보는 모두 출력하되 MEMBER_EMAIL에 없는 EMAIL 정보는 NULL로 출력하려고 합니다.

-- 학습한 LEFT OUTER JOIN을 활용하여 멤버 이름(member_name)과 이메일(email) 을 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- MEMBER테이블과 MEMBER_EMAIL 테이블에 대해 LEFT OUTER JOIN으로 결합하되 기준 테이블은 MEMER테이블로 진행하여, 멤버 이름(member_name)과 이메일(email) 을 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 MEMBER, MEMBER_EMAIL 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC MEMBER;
DESC MEMBER_EMAIL;

select * from MEMBER;
select * from MEMBER_EMAIL;
-- MEMBER테이블과 MEMBER_EMAIL테이블에 대해 LEFT OUTER JOIN을 사용하여
-- member_name과 email을 결합하여 출력하세요.

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

--[실습7] FROM절 JOIN 형태 - RIGHT OUTER JOIN
-- RESPONSE_DTL 테이블에는 응답 ID와 응답 내용이 담겨있으며, REQUEST 테이블에는 요청 ID, 요청 멤버 ID, 응답 ID가 담겨 있습니다.

-- RESPONSE_DTL 테이블의 응답 내용과, REQUEST 테이블의 요청 멤버 ID 정보를 함께 출력하려고 합니다.
-- 하지만 이때 응답 내용이 없는 응답 ID가 존재하지만, 이러한 경우 응답 내용을 NULL로 출력하고자 합니다.

-- RESPONSE_DTL 테이블을 기준으로 하여 REQUEST 테이블과 응답 ID(response_id) 컬럼으로 RIGHT OUTER JOIN을 실시하여, 요청 ID(request_id), 요청 멤버 ID(request_member_id), 응답 내용(response_content) 를 출력하는 쿼리를 작성해봅시다.
-- 지시사항
-- RESPONSE_DTL테이블과 REQUEST 테이블을 응답 ID(response_id) 를 기준으로 RIGHT OUTER JOIN을 실시하여 요청 ID(request_id), 요청 멤버ID(request_member_id), 응답 내용(response_content) 를 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 RESPONSE_DTL, REQUEST 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC RESPONSE_DTL;
DESC REQUEST;

select * from RESPONSE_DTL;
select * from REQUEST;
-- RESPONSE_DTL테이블을 기준으로 REQUEST테이블과 RIGHT OUTER JOIN을 실시하는 쿼리를 작성해보세요.

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

--[실습8] FROM절 JOIN 형태 - FULL OUTER JOIN
-- FRONT_VERSION_HIST 테이블과 BACK_VERSION_HIST 테이블에는 각 버전 ID 값과 버전 내용이 담겨 있습니다.

-- 버전 ID를 기준으로 프론즈 버전 내용과, 백 버전 내용을 함께 출력하고자 합니다.
-- 하지만 모든 버전 ID에 대해 프론트 버전 내용과 백 버전 내용이 존재하는 것은 아닙니다.
-- 특정 버전 ID에 프론트 버전 내용이나 백 버전 내용이 없다면 NULL로 출력해봅시다.

-- 두 개의 테이블에 대해서 FULL OUTER JOIN 개념을 활용해, 버전 ID(version_id), 프론트 버전 내용(version_content_front), 백 버전 내용(version_content_back) 에 대해서 출력하려고 합니다.
-- 실습 환경이 MariaDB이기에 LEFT OUTER JOIN과 RIGHT OUTER JOIN을 활용하여 쿼리를 작성해보세요.
-- 지시사항
-- FRONT_VERSION_HIST테이블을 기준으로 BACK_VERSION_HIST 테이블과 버전 ID(version_id) 을 LEFT OUTER JOIN 을 통해 결합하여, 버전 ID(version_id), 프론트 버전 내용(version_content_front), 백 버전 내용(version_content_back) 을 조회하는 쿼리를 작성하세요.

-- FRONT_VERSION_HIST테이블을 기준으로 BACK_VERSION_HIST 테이블과 버전 ID(version_id) 을 RIGHT OUTER JOIN 을 통해 결합하여, 버전 ID(version_id), 프론트 버전 내용(version_content_front), 백 버전 내용(version_content_back) 을 조회하는 쿼리를 작성하세요.

-- 1번과 2번 에서 작성한 쿼리에서 정렬을 실행하는 ORDER BY문만 제거하고, 중복을 제거하는 집합 연산자UNION을 통해 결합하는 쿼리를 작성해주세요.
-- 아래 쿼리는 FRONT_VERSION_HIST, BACK_VERSION_HIST 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC FRONT_VERSION_HIST;
DESC BACK_VERSION_HIST;

select * from FRONT_VERSION_HIST;
select * from BACK_VERSION_HIST;
-- 1. FRONT_VERSION_HIST 테이블을 기준으로 BACK_VERSION_HIST 테이블과 버전ID로 LEFT OUTER JOIN을 해주세요.
select FRONT_VERSION_HIST.version_id, FRONT_VERSION_HIST.version_content_front, BACK_VERSION_HIST.version_content_back
from FRONT_VERSION_HIST
LEFT OUTER JOIN BACK_VERSION_HIST
ON FRONT_VERSION_HIST.version_id = BACK_VERSION_HIST.version_id
order by version_id ASC;

-- 2. FRONT_VERSION_HIST 테이블을 기준으로 BACK_VERSION_HIST 테이블과 버전ID로 RIGHT OUTER JOIN을 해주세요.
select BACK_VERSION_HIST.version_id, version_content_front, version_content_back
from FRONT_VERSION_HIST
RIGHT OUTER JOIN BACK_VERSION_HIST
ON FRONT_VERSION_HIST.version_id = BACK_VERSION_HIST.version_id
order by version_id ASC;

-- 3. 위에서 작성한 두 쿼리에서 ORDER BY를 제거 후, 중복을 제거하는 집합연산자로 결합하고 최종 결과에 대해 정렬을 해주세요.
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

--[실습9] FROM절 JOIN 형태 - INNER JOIN/ON/WHERE(1)
-- REQUEST_HIST 테이블에는 요청 ID, 요청 상태, 요청 멤버 ID 정보가 담겨 있으며 MEMBER 테이블에는 멤버 ID, 멤버 이름 정보가 담겨 있습니다.

-- 위의 테이블을 이용하여, 어떤 멤버의 요청이 fail처리 되었는지 확인해보려고 합니다. 이때 REQUEST_HIST 테이블에는 멤버 이름이 아닌, 요청 멤버 ID 정보가 담겨 있으므로 MEMBER 테이블과 INNER JOIN을 활용해 봅시다.

-- REQUEST_HIST 테이블에서 요청상태가 fail 인 정보에 대해서만 조회하되, MEMBER 테이블과 INNER JOIN을 활용하여 요청 ID(request_id), 요청 상태(req_status), 멤버 이름(member_name) 을 출력하는 쿼리를 작성해봅시다.
-- 지시사항
-- REQUEST_HIST테이블과 MEMBER 테이블에 대해서 멤버 ID(req_member_id와 member_id) 가 같은 데이터에 대해 INNER JOIN절과 ON절을 이용하고, 요청 상태(req_status) 가 fail인 데이터에 대해서 요청 ID(request_id), 요청 상태(req_status), 멤버 이름(member_name) 을 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 REQUEST_HIST, MEMBER 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC REQUEST_HIST;
DESC MEMBER;

select * from REQUEST_HIST;
select * from MEMBER;
-- REQUEST_HIST 테이블과 MEMBER 테이블을 INNER JOIN하여 조회하되, 요청상태(req_status)가 fail인 정보만 조회하는 쿼리를 작성하세요.

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

--[실습10] FROM절 JOIN 형태 - INNER JOIN/ON/WHERE(2)
-- APPLICATION 테이블에는 앱 ID, 앱 Device 정보가 담겨 있으며, APPLICATION_DTL 테이블에는 앱 ID, 앱 이름, 앱 내용 정보가 담겨 있습니다.

-- 모든 Device에서 실행이 가능하거나 ‘iphone’에서만 실행이 가능한 앱에 대한 정보를 출력하고자 합니다.
-- 하지만, APPLICATION_DTL 테이블에는 앱 Device에 대한 정보가 없으니, 우선 APPLICATION테이블과 앱 ID를 활용하여 INNER JOIN을 실시하여 APPLICATION_DTL 테이블의 각 데이터에 올바른 앱 Device 데이터를 결합하고 이후 적절한 조건을 이용해봅시다.

-- APPLICATION_DTL 테이블과 INNER JOIN을 활용하여 APPLICATION 테이블과 결합하고, 앱 Device가 ‘iphone’ 또는 ‘all’ 인 app_id에 대해서 앱 ID(app_id), 앱 이름(app_name), 앱 내용(app_content) 을 출력하는 쿼리를 작성해봅시다.
-- 지시사항
-- APPLICATION테이블과 APPLICATION_DTL 테이블을 앱 ID(app_id) 를 기준으로 INNER JOIN을 통해 결합하고, 앱 Device(app_device)가 ‘iphone’ 또는 ‘all’인 데이터에 대해서, 앱 ID(app_id), 앱 이름(app_name), 앱 내용(app_content) 을 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 APPLICATION, APPLICATION_DTL 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC APPLICATION;
DESC APPLICATION_DTL;

select * from APPLICATION;
select * from APPLICATION_DTL;
-- APPLICATION 테이블과 APPLICATION_DTL 테이블에 대해 app_id를 기준으로 INNER JOIN을 실시하되
-- app_device가 iphone 또는 all인 데이터에 대해서 조회하는 쿼리를 작성하세요.

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

--[실습11] FROM절 JOIN 형태 - LEFT OUTER JOIN/WHERE
-- AIR_ROUTE 테이블에는 경로 ID, 경로 FROM, 경로 TO 정보가 담겨있으며, AIRPLANE 테이블에는 비행기 ID, 경로 ID정보가 담겨있습니다.

-- 두 개의 테이블을 이용하여, Korea에서 출발하는 경로에 대해 운행 가능한 비행기 ID를 함께 출력하고자 합니다.
-- 이를 위해, 먼저 AIR_ROUTE 테이블과 AIRPLANE 테이블을 경로 ID로 결합한 후 경로 시작지점이 Korea인 데이터에 대해서 조회해봅시다.

-- AIR_ROUTE 테이블을 기준으로, AIRPLANE 테이블과 경로 ID(route_id) 가 같은 데이터를 기준으로 결합하고 경로 FROM(route_from)이 Korea인 데이터에 대해서 경로 FROM(route_from), 경로 TO(route_to), 비행기 ID(airplane_id) 를 조회하는 쿼리를 작성해봅시다.
-- 지시사항
-- AIR_ROUTE테이블과 AIRPLANE 테이블에 대해 LEFT OUTER JOIN 을 활용하고 ON 조건에는 경로 ID(route_id)가 같다는 조건 을 표현하여 경로 FROM(route_from)이 Korea인 데이터에 대해서 경로 FROM(route_from), 경로 TO(route_to), 비행기 ID(airplane_id) 를 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 AIR_ROUTE, AIRPLANE 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC AIR_ROUTE;
DESC AIRPLANE;

select * from AIR_ROUTE;
select * from AIRPLANE;
-- AIR_ROUTE테이블과 AIRPLANE테이블에 대해 route_id가 동일하고 경로가 Korea로 시작하는 데이터를 조회하는 쿼리를 작성하세요.

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

--[실습12] 셀프 조인
-- EMPLOYEE 테이블에는 사원 ID, 사원 이름, 관리자 ID 정보가 담겨있습니다.

-- 각 사원들의 관리자가 누구인지 확인하고자 합니다. 하지만 EMPLOYEE테이블에는 관리자 ID 만 함께 존재하기 때문에, 셀프 조인 개념을 이용하여 각 사원 정보와 관리자 이름을 함께 조회해봅시다.

-- EMPLOYEE 테이블에 대해서 SELF JOIN을 이용하여, 사원 ID(employee_id), 사원 이름(employee_name), 관리자 이름(employee_name as manager_name) 을 출력하는 쿼리를 작성해봅시다.

-- EMPLOYEE테이블의 구조는 다음과 같습니다.
-- 지시사항
-- EMPLOYEE테이블의 사원 ID(employee_id)와 관리자 ID(manager_id) 를 통해 SELF JOIN 을 실시하여 사원 ID(employee_id), 사원 이름(employee_name), 관리자 이름(employee_name as manager_name) 을 조회하는 쿼리를 작성하세요.
-- 아래 쿼리는 EMPLOYEE 테이블의 구조를 나타냅니다. 해당 테이블을 수정할 필요는 없습니다.
DESC EMPLOYEE;

select * from EMPLOYEE;
-- EMPLOYEE 테이블을 SELF JOIN하여 사원ID, 사원이름, 관리자이름을 조회하는 쿼리를 작성해보세요.

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