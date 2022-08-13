-- [미션1] 신체 검사표

-- 아래에 미션을 수행하는 코드를 작성해 봅시다.
DESC student;

-- 1. 모든 학생의 이름을 조회해보세요.
select name from student;
-- 2. 성별이 남자인 학생들의 모든 정보를 조회해보세요.
select * from student
where gender = 'M';
-- 3. 키가 170 이하인 학생들의 키만 따로 조회해보세요.
select height from student
where height <= 170;
-- 4. 몸무게가 50 이상인 학생들의 몸무게만 따로 조회해보세요.
select weight from student
where weight >= 50;

+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| name   | varchar(32) | NO   |     | NULL    |       |
| height | int(11)     | NO   |     | NULL    |       |
| weight | int(11)     | NO   |     | NULL    |       |
| gender | varchar(1)  | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
+-----------+
| name      |
+-----------+
| Adam      |
| Bonnie    |
| Charlotte |
| David     |
| Edward    |
| Flora     |
+-----------+
+--------+--------+--------+--------+
| name   | height | weight | gender |
+--------+--------+--------+--------+
| Adam   |    183 |     93 | M      |
| David  |    179 |     74 | M      |
| Edward |    175 |     63 | M      |
+--------+--------+--------+--------+
+--------+
| height |
+--------+
|    167 |
|    158 |
+--------+
+--------+
| weight |
+--------+
|     93 |
|     62 |
|     74 |
|     63 |
+--------+


-- [미션2] 체지방율 검사

-- 아래에 미션을 수행하는 코드를 작성해 봅시다.

-- 1. 모든 학생들의 모든 정보와 bmi 지수를 조회해주세요.
select *,  weight/(height*height)*10000 as bmi from student;

-- 2. bmi 지수가 18.5보다 낮거나(저체중) 25.0보다 큰(과체중) 학생들의 모든 정보와 
-- bmi 지수를 한 개의 select문 안에서 조회해주세요.
select *,  weight/(height*height)*10000 as bmi from student
where weight/(height*height)*10000 < 18.5
or weight/(height*height)*10000 > 25.0;

+-----------+--------+--------+--------+---------+
| name      | height | weight | gender | bmi     |
+-----------+--------+--------+--------+---------+
| Adam      |    183 |     93 | M      | 27.7703 |
| Bonnie    |    167 |     46 | F      | 16.4940 |
| Charlotte |    158 |     62 | F      | 24.8358 |
| David     |    179 |     74 | M      | 23.0954 |
| Edward    |    175 |     63 | M      | 20.5714 |
| Flora     |    176 |     49 | F      | 15.8187 |
+-----------+--------+--------+--------+---------+
+--------+--------+--------+--------+---------+
| name   | height | weight | gender | bmi     |
+--------+--------+--------+--------+---------+
| Adam   |    183 |     93 | M      | 27.7703 |
| Bonnie |    167 |     46 | F      | 16.4940 |
| Flora  |    176 |     49 | F      | 15.8187 |
+--------+--------+--------+--------+---------+

-- [미션3] 주주총회

-- 아래에 미션을 수행하는 코드를 작성해 봅시다.

DESC shareholder;

-- 1. 모든 주주의 정보를 출력하세요.
select * from shareholder;
-- 2. 10만 주 이상 가지고 있는 주주들의 정보를 출력하세요.
select * from shareholder
where stock >= '1.0E5';
-- 3. Alexis, Craig, Fred가 가진 주식 수를 출력하세요.
select stock from shareholder
where name in ('Alexis','Craig','Fred');
-- 4. 엘리스에게 찬성하면서 10만 주 이상 보유 중인 주주들의 이름과 주식 수를 출력하세요.
select name, stock from shareholder
where agree = 1
and stock >= '1.0E5';
-- 5. 엘리스에게 반대하면서 10만 주 이상 보유 중인 주주들의 이름과 주식 수를 출력하세요.
select name, stock from shareholder
where agree = 0
and stock >= '1.0E5';
-- 6. 20만 주 이상 또는 10만 주 이하만큼 보유하고 있는 주주들의 정보를 출력하세요.
select * from shareholder
where stock >= '2.0E5'
or stock <= '1.0E5';

+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(32) | NO   |     | NULL    |       |
| stock | int(11)     | NO   |     | NULL    |       |
| agree | tinyint(1)  | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
+--------+--------+-------+
| name   | stock  | agree |
+--------+--------+-------+
| Alexis |  78000 |     0 |
| Brian  | 145000 |     1 |
| Craig  | 126000 |     0 |
| Dave   |  95000 |     1 |
| Elice  | 235000 |     0 |
| Fred   |  67000 |     1 |
| Grace  |  50000 |     1 |
| Helena | 100000 |     1 |
| Irene  |  45000 |     0 |
| Jane   |  80000 |     1 |
| Kevin  | 105000 |     0 |
+--------+--------+-------+
+--------+--------+-------+
| name   | stock  | agree |
+--------+--------+-------+
| Brian  | 145000 |     1 |
| Craig  | 126000 |     0 |
| Elice  | 235000 |     0 |
| Helena | 100000 |     1 |
| Kevin  | 105000 |     0 |
+--------+--------+-------+
+--------+
| stock  |
+--------+
|  78000 |
| 126000 |
|  67000 |
+--------+
+--------+--------+
| name   | stock  |
+--------+--------+
| Brian  | 145000 |
| Helena | 100000 |
+--------+--------+
+-------+--------+
| name  | stock  |
+-------+--------+
| Craig | 126000 |
| Elice | 235000 |
| Kevin | 105000 |
+-------+--------+
+--------+--------+-------+
| name   | stock  | agree |
+--------+--------+-------+
| Alexis |  78000 |     0 |
| Dave   |  95000 |     1 |
| Elice  | 235000 |     0 |
| Fred   |  67000 |     1 |
| Grace  |  50000 |     1 |
| Helena | 100000 |     1 |
| Irene  |  45000 |     0 |
| Jane   |  80000 |     1 |
+--------+--------+-------+