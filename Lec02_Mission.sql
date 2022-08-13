-- [미션1] 가게 DB 구축하기

-- 아래에 문제 설명대로 정보를 추가해 봅시다.
-- DESC product;
INSERT INTO product
(id,name,stock,expiration_date,
list_price,selling_price)
VALUES (1, 'carrot',100,'2019-04-10',1000,900);

INSERT INTO product
(id,name,stock,expiration_date,
list_price,selling_price)
VALUES (2, 'tea',1000,'2020-02-10',1000,900);

INSERT INTO product
(id,name,stock,expiration_date,
list_price,selling_price)
VALUES (3, 'clock',100,NULL,'2.0E5','1.8E5');

-- product테이블 전체를 조회해 봅시다.
SELECT * FROM product;

+----+--------+-------+-----------------+------------+---------------+
| id | name   | stock | expiration_date | list_price | selling_price |
+----+--------+-------+-----------------+------------+---------------+
|  1 | carrot |   100 | 2019-04-10      |       1000 |           900 |
|  2 | tea    |  1000 | 2020-02-10      |       1000 |           900 |
|  3 | clock  |   100 | NULL            |     200000 |        180000 |
+----+--------+-------+-----------------+------------+---------------+

-- [미션2] 가게 DB 수정하기

-- 아래에 문제 설명대로 수정해 봅시다.
UPDATE product
SET stock = 0
WHERE name = 'carrot';

UPDATE product
SET selling_price = 800
WHERE name = 'tea';

UPDATE product
SET stock = 50
WHERE name = 'clock';

DELETE FROM product
WHERE name = 'trump card';

-- 수정된 product테이블 전체를 조회합니다. 만약 product를 수정하지 않았다면 수정되지 않은 값이 조회됩니다.
select * from product;

+----+--------+-------+-----------------+------------+---------------+
| id | name   | stock | expiration_date | list_price | selling_price |
+----+--------+-------+-----------------+------------+---------------+
|  1 | carrot |     0 | 2019-04-10      |       1000 |           900 |
|  2 | tea    |  1000 | 2020-02-10      |       1000 |           800 |
|  3 | clock  |    50 | NULL            |     200000 |        180000 |
|  5 | onion  |   100 | 2019-04-11      |       2000 |          1800 |
+----+--------+-------+-----------------+------------+---------------+

-- [미션3] 발언권이 강한 주주

-- 아래에 미션을 수행하는 코드를 작성해 봅시다.

-- name : 주주의 이름
-- stock : 보유 주식 수
-- agree : 엘리스의 의견을 찬성하면 0, 반대하면 1
-- shareholder테이블에서 주식을 많이 보유한 순서의 내림차순으로 주주들의 모든 정보를 조회해주세요.
SELECT * FROM shareholder
ORDER BY stock DESC;

+--------+--------+-------+
| name   | stock  | agree |
+--------+--------+-------+
| Elice  | 235000 |     0 |
| Brian  | 145000 |     1 |
| Craig  | 126000 |     0 |
| Kevin  | 105000 |     0 |
| Helena | 100000 |     1 |
| Dave   |  95000 |     1 |
| Jane   |  80000 |     1 |
| Alexis |  78000 |     0 |
| Fred   |  67000 |     1 |
| Grace  |  50000 |     1 |
| Irene  |  45000 |     0 |
+--------+--------+-------+

