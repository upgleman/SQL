-- 02 데이터를 제어하는 DML

-- [미션1] 가게 DB 구축하기
-- 엘리스의 가게가 드디어 개업 준비를 끝마쳤습니다.

-- 가게의 판매 물품도 들어왔으니 이제 DB에 물건들의 정보를 넣어 봅시다.
-- 지시사항
-- 아래의 내용을 product테이블에 추가해 봅시다.
-- -는 없는 내용으로 간주하고 null로 넣으면 됩니다.
-- product테이블의 내용은 다음과 같습니다.

-- 아래에 문제 설명대로 정보를 추가해 봅시다.
DESC product;

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

+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| id              | int(11)     | NO   | PRI | NULL    |       |
| name            | varchar(32) | NO   |     | NULL    |       |
| stock           | int(11)     | YES  |     | NULL    |       |
| expiration_date | date        | YES  |     | NULL    |       |
| list_price      | int(11)     | YES  |     | NULL    |       |
| selling_price   | int(11)     | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+

+----+--------+-------+-----------------+------------+---------------+
| id | name   | stock | expiration_date | list_price | selling_price |
+----+--------+-------+-----------------+------------+---------------+
|  1 | carrot |   100 | 2019-04-10      |       1000 |           900 |
|  2 | tea    |  1000 | 2020-02-10      |       1000 |           900 |
|  3 | clock  |   100 | NULL            |     200000 |        180000 |
+----+--------+-------+-----------------+------------+---------------+

-- [미션2] 가게 DB 수정하기
-- 가게 첫날 영업을 마친 엘리스는 영업을 정산하였습니다.

-- 이 과정에서 일부 판매품들의 정보가 바뀌었습니다.

-- 따라서 가게의 product 테이블의 내용을 갱신하려 합니다.

-- 아래의 바뀐 가게 상황에 맞추어 product 테이블을 갱신하여 봅시다.

-- 지시사항
-- product 테이블의 당근이 모두 팔렸기 때문에 재고를 0으로 수정하세요.
-- product 테이블의 홍차의 판매가 저조합니다. 판매 가격을 800원으로 수정하세요.
-- product 테이블의 시계의 재고를 50개로 수정하세요.
-- product 테이블의 트럼프 카드에 문제가 있어 판매를 중지하려고 합니다. 따라서 테이블에서 삭제하세요.
-- 수정한 product 테이블 전체를 출력해 보세요.

-- 아래에 문제 설명대로 수정해 봅시다.
DESC product;

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

+-----------------+-------------+------+-----+---------+-------+
| Field           | Type        | Null | Key | Default | Extra |
+-----------------+-------------+------+-----+---------+-------+
| id              | int(11)     | NO   | PRI | NULL    |       |
| name            | varchar(32) | NO   |     | NULL    |       |
| stock           | int(11)     | YES  |     | NULL    |       |
| expiration_date | date        | YES  |     | NULL    |       |
| list_price      | int(11)     | YES  |     | NULL    |       |
| selling_price   | int(11)     | YES  |     | NULL    |       |
+-----------------+-------------+------+-----+---------+-------+

+----+--------+-------+-----------------+------------+---------------+
| id | name   | stock | expiration_date | list_price | selling_price |
+----+--------+-------+-----------------+------------+---------------+
|  1 | carrot |     0 | 2019-04-10      |       1000 |           900 |
|  2 | tea    |  1000 | 2020-02-10      |       1000 |           800 |
|  3 | clock  |    50 | NULL            |     200000 |        180000 |
|  5 | onion  |   100 | 2019-04-11      |       2000 |          1800 |
+----+--------+-------+-----------------+------------+---------------+

-- [미션3] 발언권이 강한 주주
-- 엘리스 양은 참여하는 주주들의 데이터베이스를 통해 이번 주주총회에서의 승산을 파악해보려고 합니다.

-- 우선 주식을 많이 가진 순서대로 로우를 정렬해서 발언권이 가장 강한 주주들을 파악해볼까요?

-- 주주들의 정보를 가지고 있는 데이터베이스 shareholder가 있습니다.

-- name : 주주의 이름
-- stock : 보유 주식 수
-- agree : 엘리스의 의견을 찬성하면 0, 반대하면 1

-- 지시사항
-- shareholder테이블에서 주식을 많이 보유한 순서의 내림차순으로 주주들의 모든 정보를 조회해주세요.
-- 위 지시사항 외의 다른 출력 결과를 포함할 경우, 오답처리 됩니다.

-- 아래에 미션을 수행하는 코드를 작성해 봅시다.
DESC shareholder;
select * from shareholder;

SELECT * FROM shareholder
ORDER BY stock DESC;

+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(32) | NO   |     | NULL    |       |
| stock | int(24)     | NO   |     | NULL    |       |
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

