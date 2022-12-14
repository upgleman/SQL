-- [미션1] 키 순서로 줄 서보기

-- 엘리스 토끼의 학급에서는 오늘 키 순서로 줄을 서보려고 합니다. STUDENT 테이블에는 엘리스 토끼 학급 학생들의 이름, 키 정보가 담겨 있습니다.

-- 순위 함수 ROW_NUMBER()를 활용해서 키 오름차순으로, 키가 동일하면 이름 오름차순으로 정렬을 시켜 봅시다.

-- 지시사항
-- STUDENT 테이블에서 학생들의 키(HEIGHT)와 이름(NAME) 에 대해 오름차순으로 정렬하고 ROW_NUMBER() 함수로 순서를 매겨서 순서(ROW_NUMBER), 이름(NAME), 키(HEIGHT) 를 조회하는 쿼리를 작성해 봅시다.

-- 아래는 STUDENT 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STUDENT;

select * from STUDENT;
-- 키와 이름에 대해 오름차순으로 학생들을 정렬시켜 봅시다.

select ROW_NUMBER() OVER (ORDER BY HEIGHT ASC,NAME ASC) ROW_NUMBER,
NAME, HEIGHT
from STUDENT;

+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| NAME   | varchar(100) | YES  |     | NULL    |       |
| HEIGHT | int(11)      | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
+-----------+--------+
| NAME      | HEIGHT |
+-----------+--------+
| 한영일    |    199 |
| 홍인철    |    150 |
| 손병지    |    194 |
| 고만식    |    172 |
| 황진성    |    150 |
| 권광호    |    181 |
| 황은영    |    185 |
| 박문식    |    159 |
| 류정혁    |    184 |
| 정재윤    |    159 |
| 배규빈    |    174 |
| 최힘찬    |    178 |
| 윤아름    |    172 |
| 박한별    |    164 |
| 박아롱    |    170 |
| 정고은    |    169 |
| 강나래    |    179 |
| 양이슬    |    165 |
| 강혁      |    165 |
| 남재섭    |    168 |
| 한승헌    |    181 |
| 정재범    |    195 |
| 김동근    |    167 |
| 한으뜸    |    152 |
| 김보람    |    178 |
| 김준욱    |    159 |
| 오지태    |    181 |
| 박윤민    |    162 |
| 윤재혁    |    179 |
| 김정구    |    177 |
+-----------+--------+
+------------+-----------+--------+
| ROW_NUMBER | NAME      | HEIGHT |
+------------+-----------+--------+
|          1 | 홍인철    |    150 |
|          2 | 황진성    |    150 |
|          3 | 한으뜸    |    152 |
|          4 | 김준욱    |    159 |
|          5 | 박문식    |    159 |
|          6 | 정재윤    |    159 |
|          7 | 박윤민    |    162 |
|          8 | 박한별    |    164 |
|          9 | 강혁      |    165 |
|         10 | 양이슬    |    165 |
|         11 | 김동근    |    167 |
|         12 | 남재섭    |    168 |
|         13 | 정고은    |    169 |
|         14 | 박아롱    |    170 |
|         15 | 고만식    |    172 |
|         16 | 윤아름    |    172 |
|         17 | 배규빈    |    174 |
|         18 | 김정구    |    177 |
|         19 | 김보람    |    178 |
|         20 | 최힘찬    |    178 |
|         21 | 강나래    |    179 |
|         22 | 윤재혁    |    179 |
|         23 | 권광호    |    181 |
|         24 | 오지태    |    181 |
|         25 | 한승헌    |    181 |
|         26 | 류정혁    |    184 |
|         27 | 황은영    |    185 |
|         28 | 손병지    |    194 |
|         29 | 정재범    |    195 |
|         30 | 한영일    |    199 |
+------------+-----------+--------+

-- [미션2] B 등급 누가 받을까

-- 엘리스 스쿨에서는 시험 성적에 대해서 상위 30% 이내는 A등급을, 상위 70% 이내는 B등급을, 나머지는 C등급을 주려고 합니다.

-- 우선 B등급을 받는 학생들의 번호를 출력하기 위해서 ID와 성적(SCORE) 정보가 담겨있는 STUDENT 테이블을 통해 상위 30% 초과, 상위 70% 이내 학생들의 ID를 확인해 봅시다.

-- 지시사항
-- STUDENT 테이블에서 그룹 내 비율 함수 CUME_DIST() 를 이용하여 학생들의 점수(SCORE) 내림차순을 기준으로 누적 백분율 을 구해봅시다.
-- 해당 정보를 기반으로 ID, 점수(SCORE), 누적 백분율(CUME_DIST) 을 조회하는 쿼리를 작성해 봅시다.

-- 1번에서 완성한 쿼리를 FROM절 서브쿼리로 활용하여 누적 백분율(CUME_DIST)이 상위 30% 초과(0.3 초과), 상위 70% 이내(0.7 이하) 를 만족하는 학생들에 대해서 ID, 점수(SCORE), 누적 백분율(CUME_DIST) 을 조회하는 쿼리를 작성해 봅시다.

-- Tips!
-- 1번 결과에 대해 ORDER BY 를 이용하여 ID를 기준으로 오름차순 정렬을 해주세요.
-- 2번 결과에 대해 ORDER BY 를 이용하여 누적 백분율를 기준으로 오름차순 정렬을 해주세요.
-- 데이터 조회순서는 지시사항에서 언급하고 있는 순서대로 정확히 작성하세요.

-- 아래는 STUDENT 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STUDENT;

-- 1. 윈도우 함수, CUME_DIST를 이용하여 성적에 대한 누적 백분율 값을 확인하세요.

select * from STUDENT;

select ID, SCORE,
CUME_DIST() OVER (ORDER BY SCORE DESC) AS CUME_DIST
from STUDENT
order by ID asc;
-- 2. 1번에서 확인한 누적 백분율 값에 대해 조건을 걸어, 상위 30%초과 상위 70%이내 학생들을 출력하세요.
-- FROM 서브쿼리
select *
from (select ID, SCORE, CUME_DIST() OVER (ORDER BY SCORE DESC) AS CUME_DIST 
from STUDENT) A
where A.CUME_DIST BETWEEN 0.3 AND 0.7
order by A.CUME_DIST asc;

+-------+---------+------+-----+---------+----------------+
| Field | Type    | Null | Key | Default | Extra          |
+-------+---------+------+-----+---------+----------------+
| ID    | int(11) | NO   | PRI | NULL    | auto_increment |
| SCORE | int(11) | YES  |     | NULL    |                |
+-------+---------+------+-----+---------+----------------+
+----+-------+
| ID | SCORE |
+----+-------+
|  1 |    81 |
|  2 |     7 |
|  3 |    83 |
|  4 |    86 |
|  5 |    87 |
|  6 |    45 |
|  7 |    40 |
|  8 |    85 |
|  9 |    94 |
| 10 |    58 |
| 11 |    23 |
| 12 |    72 |
| 13 |    15 |
| 14 |    74 |
| 15 |    34 |
| 16 |    48 |
| 17 |    84 |
| 18 |    20 |
| 19 |    72 |
| 20 |    98 |
| 21 |    61 |
| 22 |    67 |
| 23 |    97 |
| 24 |    34 |
| 25 |    86 |
| 26 |    84 |
| 27 |     5 |
| 28 |    54 |
| 29 |    80 |
| 30 |    59 |
| 31 |    78 |
| 32 |    42 |
| 33 |    80 |
| 34 |    22 |
| 35 |    59 |
| 36 |    25 |
| 37 |     2 |
| 38 |    54 |
| 39 |    19 |
| 40 |    70 |
| 41 |    15 |
| 42 |    95 |
| 43 |    21 |
| 44 |    87 |
| 45 |    16 |
| 46 |   100 |
| 47 |    89 |
| 48 |    18 |
| 49 |    63 |
| 50 |    71 |
| 51 |    67 |
| 52 |    99 |
| 53 |    28 |
| 54 |    86 |
| 55 |     2 |
| 56 |    57 |
| 57 |    86 |
| 58 |    54 |
| 59 |    40 |
| 60 |    56 |
| 61 |    18 |
| 62 |    38 |
| 63 |    48 |
| 64 |    14 |
| 65 |    91 |
| 66 |    99 |
| 67 |    84 |
| 68 |    49 |
| 69 |    98 |
| 70 |    47 |
| 71 |    32 |
| 72 |    76 |
| 73 |    20 |
| 74 |    64 |
| 75 |    39 |
| 76 |    30 |
| 77 |    65 |
| 78 |    83 |
| 79 |    68 |
| 80 |    63 |
+----+-------+
+----+-------+--------------+
| ID | SCORE | CUME_DIST    |
+----+-------+--------------+
|  1 |    81 | 0.2875000000 |
|  2 |     7 | 0.9625000000 |
|  3 |    83 | 0.2750000000 |
|  4 |    86 | 0.2000000000 |
|  5 |    87 | 0.1500000000 |
|  6 |    45 | 0.6625000000 |
|  7 |    40 | 0.7000000000 |
|  8 |    85 | 0.2125000000 |
|  9 |    94 | 0.1000000000 |
| 10 |    58 | 0.5375000000 |
| 11 |    23 | 0.8125000000 |
| 12 |    72 | 0.3750000000 |
| 13 |    15 | 0.9375000000 |
| 14 |    74 | 0.3500000000 |
| 15 |    34 | 0.7500000000 |
| 16 |    48 | 0.6375000000 |
| 17 |    84 | 0.2500000000 |
| 18 |    20 | 0.8625000000 |
| 19 |    72 | 0.3750000000 |
| 20 |    98 | 0.0625000000 |
| 21 |    61 | 0.5000000000 |
| 22 |    67 | 0.4375000000 |
| 23 |    97 | 0.0750000000 |
| 24 |    34 | 0.7500000000 |
| 25 |    86 | 0.2000000000 |
| 26 |    84 | 0.2500000000 |
| 27 |     5 | 0.9750000000 |
| 28 |    54 | 0.6000000000 |
| 29 |    80 | 0.3125000000 |
| 30 |    59 | 0.5250000000 |
| 31 |    78 | 0.3250000000 |
| 32 |    42 | 0.6750000000 |
| 33 |    80 | 0.3125000000 |
| 34 |    22 | 0.8250000000 |
| 35 |    59 | 0.5250000000 |
| 36 |    25 | 0.8000000000 |
| 37 |     2 | 1.0000000000 |
| 38 |    54 | 0.6000000000 |
| 39 |    19 | 0.8750000000 |
| 40 |    70 | 0.4000000000 |
| 41 |    15 | 0.9375000000 |
| 42 |    95 | 0.0875000000 |
| 43 |    21 | 0.8375000000 |
| 44 |    87 | 0.1500000000 |
| 45 |    16 | 0.9125000000 |
| 46 |   100 | 0.0125000000 |
| 47 |    89 | 0.1250000000 |
| 48 |    18 | 0.9000000000 |
| 49 |    63 | 0.4875000000 |
| 50 |    71 | 0.3875000000 |
| 51 |    67 | 0.4375000000 |
| 52 |    99 | 0.0375000000 |
| 53 |    28 | 0.7875000000 |
| 54 |    86 | 0.2000000000 |
| 55 |     2 | 1.0000000000 |
| 56 |    57 | 0.5500000000 |
| 57 |    86 | 0.2000000000 |
| 58 |    54 | 0.6000000000 |
| 59 |    40 | 0.7000000000 |
| 60 |    56 | 0.5625000000 |
| 61 |    18 | 0.9000000000 |
| 62 |    38 | 0.7250000000 |
| 63 |    48 | 0.6375000000 |
| 64 |    14 | 0.9500000000 |
| 65 |    91 | 0.1125000000 |
| 66 |    99 | 0.0375000000 |
| 67 |    84 | 0.2500000000 |
| 68 |    49 | 0.6125000000 |
| 69 |    98 | 0.0625000000 |
| 70 |    47 | 0.6500000000 |
| 71 |    32 | 0.7625000000 |
| 72 |    76 | 0.3375000000 |
| 73 |    20 | 0.8625000000 |
| 74 |    64 | 0.4625000000 |
| 75 |    39 | 0.7125000000 |
| 76 |    30 | 0.7750000000 |
| 77 |    65 | 0.4500000000 |
| 78 |    83 | 0.2750000000 |
| 79 |    68 | 0.4125000000 |
| 80 |    63 | 0.4875000000 |
+----+-------+--------------+
+----+-------+--------------+
| ID | SCORE | CUME_DIST    |
+----+-------+--------------+
| 33 |    80 | 0.3125000000 |
| 29 |    80 | 0.3125000000 |
| 31 |    78 | 0.3250000000 |
| 72 |    76 | 0.3375000000 |
| 14 |    74 | 0.3500000000 |
| 19 |    72 | 0.3750000000 |
| 12 |    72 | 0.3750000000 |
| 50 |    71 | 0.3875000000 |
| 40 |    70 | 0.4000000000 |
| 79 |    68 | 0.4125000000 |
| 22 |    67 | 0.4375000000 |
| 51 |    67 | 0.4375000000 |
| 77 |    65 | 0.4500000000 |
| 74 |    64 | 0.4625000000 |
| 80 |    63 | 0.4875000000 |
| 49 |    63 | 0.4875000000 |
| 21 |    61 | 0.5000000000 |
| 35 |    59 | 0.5250000000 |
| 30 |    59 | 0.5250000000 |
| 10 |    58 | 0.5375000000 |
| 56 |    57 | 0.5500000000 |
| 60 |    56 | 0.5625000000 |
| 58 |    54 | 0.6000000000 |
| 38 |    54 | 0.6000000000 |
| 28 |    54 | 0.6000000000 |
| 68 |    49 | 0.6125000000 |
| 16 |    48 | 0.6375000000 |
| 63 |    48 | 0.6375000000 |
| 70 |    47 | 0.6500000000 |
|  6 |    45 | 0.6625000000 |
| 32 |    42 | 0.6750000000 |
| 59 |    40 | 0.7000000000 |
|  7 |    40 | 0.7000000000 |
+----+-------+--------------+

-- [미션3] 점수 평균

-- STUDENT 테이블에는 ID, 학과, 학년 정보가 담겨있고 COURSE_SCORE 테이블에는 학생 ID, 수업 이름, 점수 정보가 담겨있습니다.

-- STUDENT 테이블의 ID와 COURSE_SCORE 테이블의 학생 ID를 기준으로 JOIN 을 이용하여 결합하고, 수업 이름(COURSE_NAME)과 학과(DEPARTMENT) 에 대해서 ROLLUP 을 이용하여 수업/학과별 평균, 수업별 평균, 전체 평균을 구해봅시다.

-- 지시사항
-- STUDENT 테이블과 COURSE_SCORE 테이블에 대해서 각각 ID와 학생 ID(STUDENT_ID) 로 INNER JOIN을 실시하고, 수업 이름(COURSE_NAME)과 학과(DEPARTMENT) 에 대해서 ROLLUP 을 통해 점수(SCORE)에 대한 평균(AVG) 을 구해봅시다.
-- 위 정보를 기반으로 수업 이름(COURSE_NAME), 학과(DEPARTMENT), 평균(AVG) 을 조회하는 쿼리를 작성해 봅시다.

-- 아래는 STUDENT, COURSE_SCORE 테이블에 대한 구조를 보여줍니다. 테이블을 수정하실 필요는 없습니다.
DESC STUDENT;
DESC COURSE_SCORE;

-- 수업이름과 학과에 대해서 ROLLUP 을 이용하여 평균 점수를 구해보세요.

select * from STUDENT;
select * from COURSE_SCORE;

select COURSE_NAME, DEPARTMENT,
AVG(C.SCORE) AS AVG_SCORE
from STUDENT S
INNER JOIN COURSE_SCORE C
ON S.ID = C.STUDENT_ID
group by 
C.COURSE_NAME, S.DEPARTMENT with ROLLUP;

+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| ID         | int(11)      | NO   | PRI | NULL    | auto_increment |
| DEPARTMENT | varchar(100) | YES  |     | NULL    |                |
| GRADE      | int(11)      | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| STUDENT_ID  | int(11)      | YES  |     | NULL    |       |
| COURSE_NAME | varchar(100) | YES  |     | NULL    |       |
| SCORE       | int(11)      | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
+----+--------------------+-------+
| ID | DEPARTMENT         | GRADE |
+----+--------------------+-------+
|  1 | 컴퓨터공학과       |     2 |
|  2 | 컴퓨터공학과       |     1 |
|  3 | 컴퓨터공학과       |     4 |
|  4 | 컴퓨터공학과       |     3 |
|  5 | 컴퓨터공학과       |     1 |
|  6 | 컴퓨터공학과       |     3 |
|  7 | 컴퓨터공학과       |     1 |
|  8 | 컴퓨터공학과       |     4 |
|  9 | 컴퓨터공학과       |     4 |
| 10 | 컴퓨터공학과       |     2 |
| 11 | 컴퓨터공학과       |     3 |
| 12 | 컴퓨터공학과       |     4 |
| 13 | 컴퓨터공학과       |     2 |
| 14 | 컴퓨터공학과       |     3 |
| 15 | 컴퓨터공학과       |     3 |
| 16 | 전자공학과         |     1 |
| 17 | 전자공학과         |     4 |
| 18 | 전자공학과         |     1 |
| 19 | 전자공학과         |     3 |
| 20 | 전자공학과         |     1 |
| 21 | 전자공학과         |     4 |
| 22 | 전자공학과         |     3 |
| 23 | 전자공학과         |     4 |
| 24 | 전자공학과         |     4 |
| 25 | 전자공학과         |     2 |
| 26 | 전자공학과         |     3 |
| 27 | 전자공학과         |     3 |
| 28 | 전자공학과         |     1 |
| 29 | 전자공학과         |     3 |
| 30 | 전자공학과         |     3 |
+----+--------------------+-------+
+------------+-----------------------+-------+
| STUDENT_ID | COURSE_NAME           | SCORE |
+------------+-----------------------+-------+
|          1 | 일반물리              |    98 |
|          2 | 일반물리              |    13 |
|          3 | 일반물리              |    68 |
|          4 | 일반물리              |    98 |
|          5 | 일반물리              |    24 |
|          6 | 일반물리              |    10 |
|          7 | 일반물리              |     2 |
|          8 | 일반물리              |    48 |
|          9 | 일반물리              |    47 |
|         10 | 일반물리              |    86 |
|         11 | 일반물리              |    83 |
|         12 | 일반물리              |    92 |
|         13 | 일반물리              |     5 |
|         14 | 일반물리              |     2 |
|         15 | 일반물리              |    91 |
|         16 | 일반물리              |    35 |
|         17 | 일반물리              |     2 |
|         18 | 일반물리              |    42 |
|         19 | 일반물리              |    25 |
|         20 | 일반물리              |    49 |
|         21 | 일반물리              |    71 |
|         22 | 일반물리              |    36 |
|         23 | 일반물리              |    67 |
|         24 | 일반물리              |    39 |
|         25 | 일반물리              |    97 |
|         26 | 일반물리              |    10 |
|         27 | 일반물리              |    76 |
|         28 | 일반물리              |    29 |
|         29 | 일반물리              |     8 |
|         30 | 일반물리              |    80 |
|          1 | 공학수학              |    30 |
|          2 | 공학수학              |    34 |
|          3 | 공학수학              |    54 |
|          4 | 공학수학              |    70 |
|          5 | 공학수학              |    59 |
|          6 | 공학수학              |    82 |
|          7 | 공학수학              |    58 |
|          8 | 공학수학              |    69 |
|          9 | 공학수학              |    68 |
|         10 | 공학수학              |     3 |
|         11 | 공학수학              |    76 |
|         12 | 공학수학              |    12 |
|         13 | 공학수학              |    68 |
|         14 | 공학수학              |    62 |
|         15 | 공학수학              |    84 |
|         16 | 공학수학              |    70 |
|         17 | 공학수학              |    39 |
|         18 | 공학수학              |    40 |
|         19 | 공학수학              |    20 |
|         20 | 공학수학              |    73 |
|         21 | 공학수학              |    14 |
|         22 | 공학수학              |    71 |
|         23 | 공학수학              |    10 |
|         24 | 공학수학              |    94 |
|         25 | 공학수학              |    48 |
|         26 | 공학수학              |    61 |
|         27 | 공학수학              |    43 |
|         28 | 공학수학              |     1 |
|         29 | 공학수학              |    78 |
|         30 | 공학수학              |    70 |
|          1 | 기초프로그래밍        |    74 |
|          2 | 기초프로그래밍        |    81 |
|          3 | 기초프로그래밍        |    13 |
|          4 | 기초프로그래밍        |    43 |
|          5 | 기초프로그래밍        |    93 |
|          6 | 기초프로그래밍        |    28 |
|          7 | 기초프로그래밍        |    48 |
|          8 | 기초프로그래밍        |    73 |
|          9 | 기초프로그래밍        |    92 |
|         10 | 기초프로그래밍        |    91 |
|         11 | 기초프로그래밍        |    19 |
|         12 | 기초프로그래밍        |    66 |
|         13 | 기초프로그래밍        |    46 |
|         14 | 기초프로그래밍        |    66 |
|         15 | 기초프로그래밍        |     6 |
|         16 | 기초프로그래밍        |    72 |
|         17 | 기초프로그래밍        |    35 |
|         18 | 기초프로그래밍        |    98 |
|         19 | 기초프로그래밍        |    71 |
|         20 | 기초프로그래밍        |    47 |
|         21 | 기초프로그래밍        |    35 |
|         22 | 기초프로그래밍        |    99 |
|         23 | 기초프로그래밍        |    66 |
|         24 | 기초프로그래밍        |    81 |
|         25 | 기초프로그래밍        |    46 |
|         26 | 기초프로그래밍        |    75 |
|         27 | 기초프로그래밍        |    82 |
|         28 | 기초프로그래밍        |    46 |
|         29 | 기초프로그래밍        |    99 |
|         30 | 기초프로그래밍        |    58 |
+------------+-----------------------+-------+
+-----------------------+--------------------+-----------+
| COURSE_NAME           | DEPARTMENT         | AVG_SCORE |
+-----------------------+--------------------+-----------+
| 공학수학              | 전자공학과         |   48.8000 |
| 공학수학              | 컴퓨터공학과       |   55.2667 |
| 공학수학              | NULL               |   52.0333 |
| 기초프로그래밍        | 전자공학과         |   67.3333 |
| 기초프로그래밍        | 컴퓨터공학과       |   55.9333 |
| 기초프로그래밍        | NULL               |   61.6333 |
| 일반물리              | 전자공학과         |   44.4000 |
| 일반물리              | 컴퓨터공학과       |   51.1333 |
| 일반물리              | NULL               |   47.7667 |
| NULL                  | NULL               |   53.8111 |
+-----------------------+--------------------+-----------+