--[미션1] 중간고사 수학왕


-- select * from students limit 5;
-- select * from middle_test limit 5;

-- 오답
-- select * from middle_test as A
-- join students as B
-- on A.student_id = B.student_id
-- where A.math >= ANY
-- (
-- select A.math from middle_test
-- where A.student_id = 10504
-- );

-- 1. 경민이보다 중간고사 수학점수를 높거나 같게 받은 학생들을 조회해 주세요.
 --메인 쿼리 정답
select * 
from middle_test as m
join students as s
on s.student_id = m.student_id
where m.math >= ANY
(
    select math
    from middle_test
    where student_id = 10504
);    
--서브쿼리

+------------+------+------+------+------------+-----------+-------+-------+--------+
| student_id | kor  | math | eng  | student_id | name      | grade | class | gender |
+------------+------+------+------+------------+-----------+-------+-------+--------+
|      10101 |  100 |  100 |  100 |      10101 | 김재원    |     1 |     1 | M      |
|      10103 |   96 |   96 |   93 |      10103 | 마성현    |     1 |     1 | M      |
|      10315 |  100 |  100 |   98 |      10315 | 장석준    |     1 |     3 | M      |
|      10504 |   12 |   96 |   21 |      10504 | 김경민    |     1 |     5 | M      |
|      10511 |   91 |   98 |   88 |      10511 | 우수현    |     1 |     5 | M      |
|      20120 |   73 |   97 |   72 |      20120 | 홍은우    |     2 |     1 | M      |
|      30403 |   90 |   96 |   87 |      30403 | 김소율    |     3 |     4 | F      |
+------------+------+------+------+------------+-----------+-------+-------+--------+
