--[실습1] 단일 행 서브쿼리 1
--서브쿼리의 조회 결과가 1개의 행만 나오는 서브쿼리
SELECT * FROM emp;
-- 사원 번호가 7인 사원보다 나이가 어린 사원의 모든 컬럼을 조회 하는 쿼리를 작성하세요.
select * from emp
where birthdate >
(select birthdate from emp
where empnum =7);

+--------+--------+-----------+------------+------+--------+
| empnum | name   | job       | birthdate  | sal  | deptno |
+--------+--------+-----------+------------+------+--------+
|      1 | SMITH  | CLERK     | 1990-12-17 |  800 |     10 |
|      2 | SMITH  | SALESMAN  | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN  | 1983-02-22 | 1250 |     30 |
|      4 | JONES  | MANAGER   | 1981-04-02 | 2975 |     40 |
|      5 | MARTIN | SALESMAN  | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER   | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER   | 1981-06-09 | 2450 |     30 |
|      8 | SCOTT  | ANALYST   | 1987-07-13 | 2000 |     40 |
|      9 | KING   | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     10 | TURNER | SALESMAN  | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK     | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK     | 1990-12-03 |  950 |     40 |
|     13 | FORD   | ANALYST   | 1981-12-03 | 3000 |     10 |
|     14 | MILLER | CLERK     | 1982-01-23 | 1300 |     20 |
+--------+--------+-----------+------------+------+--------+
+--------+--------+-----------+------------+------+--------+
| empnum | name   | job       | birthdate  | sal  | deptno |
+--------+--------+-----------+------------+------+--------+
|      1 | SMITH  | CLERK     | 1990-12-17 |  800 |     10 |
|      2 | SMITH  | SALESMAN  | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN  | 1983-02-22 | 1250 |     30 |
|      5 | MARTIN | SALESMAN  | 1981-09-28 | 1250 |     10 |
|      8 | SCOTT  | ANALYST   | 1987-07-13 | 2000 |     40 |
|      9 | KING   | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     10 | TURNER | SALESMAN  | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK     | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK     | 1990-12-03 |  950 |     40 |
|     13 | FORD   | ANALYST   | 1981-12-03 | 3000 |     10 |
|     14 | MILLER | CLERK     | 1982-01-23 | 1300 |     20 |
+--------+--------+-----------+------------+------+--------+


--[실습2] 단일 행 서브쿼리 2

SELECT * FROM emp;
-- 전 사원의 급여 평균보다 낮은 급여를 받는 사원의 모든 컬럼을 조회 하는 쿼리를 작성하세요.
-- sub query
select avg(sal) from emp;

-- main query
select * from emp
where sal < any
(select avg(sal) from emp);

+--------+--------+-----------+------------+------+--------+
| empnum | name   | job       | birthdate  | sal  | deptno |
+--------+--------+-----------+------------+------+--------+
|      1 | SMITH  | CLERK     | 1990-12-17 |  800 |     10 |
|      2 | SMITH  | SALESMAN  | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN  | 1983-02-22 | 1250 |     30 |
|      4 | JONES  | MANAGER   | 1981-04-02 | 2975 |     40 |
|      5 | MARTIN | SALESMAN  | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER   | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER   | 1981-06-09 | 2450 |     30 |
|      8 | SCOTT  | ANALYST   | 1987-07-13 | 2000 |     40 |
|      9 | KING   | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     10 | TURNER | SALESMAN  | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK     | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK     | 1990-12-03 |  950 |     40 |
|     13 | FORD   | ANALYST   | 1981-12-03 | 3000 |     10 |
|     14 | MILLER | CLERK     | 1982-01-23 | 1300 |     20 |
+--------+--------+-----------+------------+------+--------+
+-----------+
| avg(sal)  |
+-----------+
| 2030.3571 |
+-----------+
+--------+--------+----------+------------+------+--------+
| empnum | name   | job      | birthdate  | sal  | deptno |
+--------+--------+----------+------------+------+--------+
|      1 | SMITH  | CLERK    | 1990-12-17 |  800 |     10 |
|      2 | SMITH  | SALESMAN | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN | 1983-02-22 | 1250 |     30 |
|      5 | MARTIN | SALESMAN | 1981-09-28 | 1250 |     10 |
|      8 | SCOTT  | ANALYST  | 1987-07-13 | 2000 |     40 |
|     10 | TURNER | SALESMAN | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK    | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK    | 1990-12-03 |  950 |     40 |
|     14 | MILLER | CLERK    | 1982-01-23 | 1300 |     20 |
+--------+--------+----------+------------+------+--------+

--[실습3] 단일 행 서브쿼리 3

SELECT * FROM emp;
-- 부서번호가 40인 부서의 급여 평균보다 높게 받는 사원들의 모든 컬럼과 나이를 조회하는 쿼리를 작성해주세요.

-- sub query
select avg(sal) from emp
where deptno = 40;

-- main query
select *,
FLOOR( (CAST(REPLACE(CURRENT_DATE,'-','') AS UNSIGNED) - 
       CAST(REPLACE(birthdate,'-','') AS UNSIGNED)) / 10000 ) as age
from emp
where sal >
(select avg(sal) from emp
where deptno = 40);

+--------+--------+-----------+------------+------+--------+
| empnum | name   | job       | birthdate  | sal  | deptno |
+--------+--------+-----------+------------+------+--------+
|      1 | SMITH  | CLERK     | 1990-12-17 |  800 |     10 |
|      2 | SMITH  | SALESMAN  | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN  | 1983-02-22 | 1250 |     30 |
|      4 | JONES  | MANAGER   | 1981-04-02 | 2975 |     40 |
|      5 | MARTIN | SALESMAN  | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER   | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER   | 1981-06-09 | 2450 |     30 |
|      8 | SCOTT  | ANALYST   | 1987-07-13 | 2000 |     40 |
|      9 | KING   | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     10 | TURNER | SALESMAN  | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK     | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK     | 1990-12-03 |  950 |     40 |
|     13 | FORD   | ANALYST   | 1981-12-03 | 3000 |     10 |
|     14 | MILLER | CLERK     | 1982-01-23 | 1300 |     20 |
+--------+--------+-----------+------------+------+--------+
+-----------+
| avg(sal)  |
+-----------+
| 1975.0000 |
+-----------+
+--------+-------+-----------+------------+------+--------+------+
| empnum | name  | job       | birthdate  | sal  | deptno | age  |
+--------+-------+-----------+------------+------+--------+------+
|      4 | JONES | MANAGER   | 1981-04-02 | 2975 |     40 |   41 |
|      6 | BLAKE | MANAGER   | 1981-05-01 | 2850 |     20 |   41 |
|      7 | CLARK | MANAGER   | 1981-06-09 | 2450 |     30 |   41 |
|      8 | SCOTT | ANALYST   | 1987-07-13 | 2000 |     40 |   35 |
|      9 | KING  | PRESIDENT | 1982-11-17 | 5000 |     10 |   39 |
|     13 | FORD  | ANALYST   | 1981-12-03 | 3000 |     10 |   40 |
+--------+-------+-----------+------------+------+--------+------+

--[실습4] 다중 행 서브쿼리 1
--다중 행 서브쿼리(Multiple-Row Subquery) 는 서브쿼리의 조회 결과가 두개 이상의 row가 나오는 서브쿼리

SELECT * FROM emp;
-- MANAGER 업무를 가진 사원 중 제일 높은 급여를 받는 사원보다 높은 급여를 받는 사원을 조회하는 쿼리를 작성해주세요.

-- sub query
select MAX(sal) from emp 
where job = 'MANAGER';

-- main query
select * from emp
where sal > ALL
(select MAX(sal) from emp 
where job = 'MANAGER');

+--------+--------+-----------+------------+------+--------+
| empnum | name   | job       | birthdate  | sal  | deptno |
+--------+--------+-----------+------------+------+--------+
|      1 | SMITH  | CLERK     | 1990-12-17 |  900 |     10 |
|      2 | ALLEN  | SALESMAN  | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN  | 1983-02-22 | 1250 |     30 |
|      4 | JONES  | MANAGER   | 1981-04-02 | 2975 |     40 |
|      5 | MARTIN | SALESMAN  | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER   | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER   | 1981-06-09 | 2450 |     30 |
|      8 | SCOTT  | ANALYST   | 1987-07-13 | 2000 |     40 |
|      9 | KING   | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     10 | TURNER | SALESMAN  | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK     | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK     | 1990-12-03 |  950 |     40 |
|     13 | FORD   | ANALYST   | 1981-12-03 | 3000 |     10 |
|     14 | MILLER | CLERK     | 1982-01-23 | 1300 |     20 |
+--------+--------+-----------+------------+------+--------+
+----------+
| MAX(sal) |
+----------+
|     2975 |
+----------+
+--------+------+-----------+------------+------+--------+
| empnum | name | job       | birthdate  | sal  | deptno |
+--------+------+-----------+------------+------+--------+
|      9 | KING | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     13 | FORD | ANALYST   | 1981-12-03 | 3000 |     10 |
+--------+------+-----------+------------+------+--------+

--[실습5] 다중 행 서브쿼리 2

SELECT * FROM emp;
-- 각 부서별 급여를 제일 많이 받는 사원의 월급을 받는 사원들을 조회하는 쿼리를 작성해주세요.

-- 서브쿼리
select deptno, MAX(sal) from emp 
group by deptno order by empnum;

-- 메인 쿼리
select * from emp
where sal = ANY
(select MAX(sal) from emp 
group by deptno order by empnum);

+--------+--------+-----------+------------+------+--------+
| empnum | name   | job       | birthdate  | sal  | deptno |
+--------+--------+-----------+------------+------+--------+
|      1 | SMITH  | CLERK     | 1990-12-17 |  900 |     10 |
|      2 | ALLEN  | SALESMAN  | 1982-02-20 | 1600 |     20 |
|      3 | WARD   | SALESMAN  | 1983-02-22 | 1250 |     30 |
|      4 | JONES  | MANAGER   | 1981-04-02 | 2975 |     40 |
|      5 | MARTIN | SALESMAN  | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER   | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER   | 1981-06-09 | 2450 |     30 |
|      8 | SCOTT  | ANALYST   | 1987-07-13 | 2000 |     40 |
|      9 | KING   | PRESIDENT | 1982-11-17 | 5000 |     10 |
|     10 | TURNER | SALESMAN  | 1983-09-08 | 1900 |     20 |
|     11 | ADAMS  | CLERK     | 1987-07-13 | 1100 |     30 |
|     12 | JAMES  | CLERK     | 1990-12-03 |  950 |     40 |
|     13 | FORD   | ANALYST   | 1981-12-03 | 3000 |     10 |
|     14 | MILLER | CLERK     | 1982-01-23 | 1300 |     20 |
+--------+--------+-----------+------------+------+--------+
+--------+----------+
| deptno | MAX(sal) |
+--------+----------+
|     10 |     5000 |
|     20 |     2850 |
|     30 |     2450 |
|     40 |     2975 |
+--------+----------+
+--------+-------+-----------+------------+------+--------+
| empnum | name  | job       | birthdate  | sal  | deptno |
+--------+-------+-----------+------------+------+--------+
|      4 | JONES | MANAGER   | 1981-04-02 | 2975 |     40 |
|      6 | BLAKE | MANAGER   | 1981-05-01 | 2850 |     20 |
|      7 | CLARK | MANAGER   | 1981-06-09 | 2450 |     30 |
|      9 | KING  | PRESIDENT | 1982-11-17 | 5000 |     10 |
+--------+-------+-----------+------------+------+--------+

--[실습6] 다중 행 서브쿼리 3

-- 각 부서별 나이가 제일 많은 사원을 조회하는 쿼리를 작성해주세요.

-- 서브쿼리
select deptno, min(birthdate) from emp
group by deptno;

-- 메인 쿼리
select * from emp
where birthdate in
(select min(birthdate) from emp
group by deptno)
order by deptno;

-- ANY 메인 쿼리
select * from emp
where birthdate = ANY
(select min(birthdate) from emp
group by deptno);

+--------+----------------+
| deptno | min(birthdate) |
+--------+----------------+
|     10 | 1981-09-28     |
|     20 | 1981-05-01     |
|     30 | 1981-06-09     |
|     40 | 1981-04-02     |
+--------+----------------+
+--------+--------+----------+------------+------+--------+
| empnum | name   | job      | birthdate  | sal  | deptno |
+--------+--------+----------+------------+------+--------+
|      5 | MARTIN | SALESMAN | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER  | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER  | 1981-06-09 | 2450 |     30 |
|      4 | JONES  | MANAGER  | 1981-04-02 | 2975 |     40 |
+--------+--------+----------+------------+------+--------+
+--------+--------+----------+------------+------+--------+
| empnum | name   | job      | birthdate  | sal  | deptno |
+--------+--------+----------+------------+------+--------+
|      4 | JONES  | MANAGER  | 1981-04-02 | 2975 |     40 |
|      5 | MARTIN | SALESMAN | 1981-09-28 | 1250 |     10 |
|      6 | BLAKE  | MANAGER  | 1981-05-01 | 2850 |     20 |
|      7 | CLARK  | MANAGER  | 1981-06-09 | 2450 |     30 |
+--------+--------+----------+------------+------+--------+


--[실습7] 하나라도? 혹은 전부? - ANY, ALL
--ANY 는 만족하는 조건이 하나라도 있으면 참이 되는 것이고 ALL 은 모든 조건이 참이 되어야 만족합니다.
select * from salaries;

-- salaries 테이블에서 from_date가 2000-12-31 이전인 사람들의 급여 중 하나의 급여 보다 더 적은 급여를 받은 직원의 급여 정보를 모두 출력해보세요.
-- 서브쿼리 = from_date가 2000-12-31 이전인 사람들의 급여
select salary from salaries
where from_date < '2000-12-31';

-- 메인쿼리 = 이 급여 보다 더 적은 급여를 받은 직원의 급여 정보
select * from salaries
where salary < ANY -- max 최대값 비교와 동일
(select salary from salaries
where from_date < '2000-12-31');


-- salaries 테이블에서 from_date가 2000-12-31 이전인 사람들의 급여 중 모든 급여보다 적은 급여를 받은 직원의 급여 정보를 모두 출력해보세요.
-- 서브쿼리 = from_date가 2000-12-31 이전인 사람들의 급여 
-- 위와 동일

-- 메인쿼리 = 이 급여 보다 더 적은 급여를 받은 직원의 급여 정보
select * from salaries
where salary < ALL -- min 최솟값 비교와 동일
(select salary from salaries
where from_date < '2000-12-31');

+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  42958 | 2002-06-22 | 2003-06-22 |
|  10002 |  70230 | 2001-08-02 | 2002-08-02 |
|  10003 |  40000 | 2001-12-01 | 2002-12-01 |
|  10004 |  74057 | 2001-11-27 | 2002-11-27 |
|  10005 |  94692 | 2001-09-09 | 2002-09-09 |
|  10006 |  60100 | 2001-08-02 | 2002-08-02 |
|  10007 |  88070 | 2002-02-07 | 2003-02-07 |
|  10008 |  50104 | 2000-03-10 | 2001-03-10 |
|  10009 |  94409 | 2002-02-14 | 2003-02-14 |
|  10010 |  50324 | 2001-11-23 | 2002-11-23 |
|  10011 |  46753 | 1996-01-21 | 1997-01-21 |
|  10012 |  44423 | 2001-12-16 | 2002-12-16 |
|  10013 |  68901 | 2001-10-16 | 2002-10-16 |
|  10014 |  54223 | 2001-12-27 | 2002-12-27 |
|  10015 |  46200 | 1992-09-19 | 1993-09-19 |
|  10016 |  47935 | 2002-02-10 | 2003-02-10 |
|  10017 |  56000 | 1993-08-03 | 1994-08-03 |
|  10018 |  84672 | 2002-03-30 | 2003-03-30 |
+--------+--------+------------+------------+
+--------+
| salary |
+--------+
|  50104 |
|  46753 |
|  46200 |
|  56000 |
+--------+
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  42958 | 2002-06-22 | 2003-06-22 |
|  10003 |  40000 | 2001-12-01 | 2002-12-01 |
|  10008 |  50104 | 2000-03-10 | 2001-03-10 |
|  10010 |  50324 | 2001-11-23 | 2002-11-23 |
|  10011 |  46753 | 1996-01-21 | 1997-01-21 |
|  10012 |  44423 | 2001-12-16 | 2002-12-16 |
|  10014 |  54223 | 2001-12-27 | 2002-12-27 |
|  10015 |  46200 | 1992-09-19 | 1993-09-19 |
|  10016 |  47935 | 2002-02-10 | 2003-02-10 |
+--------+--------+------------+------------+
+--------+--------+------------+------------+
| emp_no | salary | from_date  | to_date    |
+--------+--------+------------+------------+
|  10001 |  42958 | 2002-06-22 | 2003-06-22 |
|  10003 |  40000 | 2001-12-01 | 2002-12-01 |
|  10012 |  44423 | 2001-12-16 | 2002-12-16 |
+--------+--------+------------+------------+

--[실습8] 스칼라 서브쿼리
--select절에서 서브쿼리를 사용하는 것을 스칼라 서브쿼리

-- salaries 테이블에서 직원 번호와 한 직원의 평균 급여를 중복없이 출력해보세요.

select distinct emp_no, avg(salary)
from salaries;

-- 메인 쿼리
select distinct emp_no,
-- 서브 쿼리 avg_salary
(
select avg(salary)
from salaries as A
where A.emp_no = B.emp_no
) as avg_salary
from salaries as B;

+--------+-------------+
| emp_no | avg(salary) |
+--------+-------------+
|  10001 |  68302.3929 |
+--------+-------------+
+--------+------------+
| emp_no | avg_salary |
+--------+------------+
|  10001 | 75388.9412 |
|  10002 | 68854.5000 |
|  10003 | 43030.2857 |
|  10004 | 56512.2500 |
|  10005 | 87275.7692 |
|  10006 | 50514.9167 |
|  10007 | 70826.7143 |
|  10008 | 49307.6667 |
|  10009 | 78284.5556 |
|  10010 | 76723.0000 |
+--------+------------+
