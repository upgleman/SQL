--01 ���տ����� & ����������
--[�ǽ�1 �ؼ�] STANDARD SQL - ���� ���� ����
-- student ���̺��� ���� �л��� ������ ����ֽ��ϴ�.

-- �ش� ���̺��� ������ �̿��Ͽ� 3�г��� �л��� �����͸� ��ȸ�Ϸ��� �մϴ�.
-- ������ ���̺��� 3�г� �̿� �л����� ������ �Բ� ����ֽ��ϴ�.

-- ���̺� �ִ� �پ��� �л� �߿��� 3�г� �л����� ������ ��ȸ�ϱ� ����, ���ſ� �н��ߴ� SELECT���� WHERE���� �̿��Ͽ� �г�(grade)�� 3�г��� �л��鸸 ��ȸ�غ��ô�.
-- ���û���
-- student���̺��� SELECT���� ���� Ȯ���ϼ���.

WHERE���� �̿��� grade �÷��� ������ ������ �ɾ ����� ��ȸ�� ������.

-- �Ʒ� ������ student ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC student;

-- ���� ���迬���� �̿��Ͽ� student ���̺��� ��ȸ�ϴ� ������ �ۼ����ּ���.
select * from student;

-- ���� ���� ������ �̿��Ͽ� student ���̺��� grade�� 3�� �л��� ��ȸ�ϴ� ������ �ۼ����ּ���.
select * from student
where grade = 3;

+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| id             | int(11)      | NO   | PRI | NULL    |       |
| student_number | int(11)      | NO   |     | NULL    |       |
| name           | varchar(30)  | NO   |     | NULL    |       |
| grade          | int(11)      | NO   |     | NULL    |       |
| email          | varchar(100) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
+----+----------------+--------------+-------+--------------------+
| id | student_number | name         | grade | email              |
+----+----------------+--------------+-------+--------------------+
|  1 |          10001 | HongGildong  |     2 | hong@naver.com     |
|  2 |          10002 | KimAmoogae   |     3 | NULL               |
|  3 |          10003 | HongGilsun   |     1 | hong.sun@naver.com |
|  4 |          10004 | KimChulsoo   |     3 | NULL               |
|  5 |          10005 | LeeMooMyeong |     4 | NULL               |
+----+----------------+--------------+-------+--------------------+
+----+----------------+------------+-------+-------+
| id | student_number | name       | grade | email |
+----+----------------+------------+-------+-------+
|  2 |          10002 | KimAmoogae |     3 | NULL  |
|  4 |          10004 | KimChulsoo |     3 | NULL  |
+----+----------------+------------+-------+-------+

--[�ǽ�2 �ؼ�] ���� ������ ���� - UNION(1)
lecture_basic ���̺�� lecture_special ���̺��� ID, ���� �̸�, �л� ��ȣ, �л� �̸� ������ ��� �ֽ��ϴ�.

�ش� ���̺��� �����͸� ���� �⺻���ǿ� Ư������ ������� ���ǿ� ������ �л����� �л� ��ȣ�� �л� �̸��� ��ȸ�ϰ� �ͽ��ϴ�.

�̸� ����, �� ���� ���̺��� ���� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�ϴ� 2���� SELECT ���� ����� ��ȸ�� ���ô�.

�̶� �������� �ߺ��� ������ ó�����ִ� ���� �����ڸ� �̿��մϴ�.

-- �Ʒ� ������ lecture_basic, lecture_special ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC lecture_basic;
DESC lecture_special;
select * from lecture_basic;
select * from lecture_special;

-- 1. lecture_basic ���̺��� �л���ȣ(student_number)�� �л��̸�(student_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number,student_name from lecture_basic;

-- 2. lecture_special ���̺��� �л���ȣ(student_number)�� �л��̸�(student_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number, student_name from lecture_special;

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� ������ ���� �� ���İ� �ߺ�����(UNION ��)�� �����ϴ� ������ �ۼ��ϼ���.
select student_number,student_name 
from lecture_basic
UNION
select student_number, student_name 
from lecture_special
order by student_number asc;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | math         |          10001 | HongGildong  |
|  2 | korean       |          10001 | HongGildong  |
|  3 | math         |          10003 | HongGilsun   |
|  4 | math         |          10004 | KimChulsoo   |
+----+--------------+----------------+--------------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | piano        |          10001 | HongGildong  |
|  2 | kendo        |          10002 | KimAmugae    |
|  3 | piano        |          10003 | HongGilsun   |
|  4 | kendo        |          10003 | HongGilsun   |
+----+--------------+----------------+--------------+

+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10003 | HongGilsun   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+

--[�ǽ�3 �ؼ�] ���� ������ ���� - UNION(2)
-- chicken_store��� ġŲ ���� ���̺�� pizze_store��� ���� ���� ���̺��� �� ���̺� ������ �µ��� ���� �̸��� �̿� ���� ����(available) ������ ����ֽ��ϴ�.

-- ġŲ ���Ե�� ���� ���Ե� �߿��� �̿� ������ ��� ���Կ� ���ؼ� ��ȸ�غ����� �մϴ�.

-- �տ��� �н��� ���� �����ڸ� �̿��Ͽ� �� ���̺��� �̿� ������ ���Ը� ��� ��ȸ�غ�����. ������ �̶�, �ߺ��Ǵ� �����ʹ� �����ؼ� ����غ��ô�.
-- ���û���
-- chicken_store���̺��� Ȯ���ϰ�, SELECT���� �̿��� ���� �̸�(store_name) �� ����ϵ�, WHERE ���� �̿��Ͽ� �̿밡����(available = ��Y��) ���Ը� ��ȸ�غ�����.

-- pizza_store���̺��� Ȯ���ϰ�, SELECT���� �̿��� ���� �̸�(store_name) �� ����ϵ�, WHERE ���� �̿��Ͽ� �̿밡����(available = ��Y��) ���Ը� ��ȸ�غ�����.

-- 1���� 2������ ��ȸ�� ����� ���ؼ� �����͸� �����ؼ� ��ȸ�ϵ�, �ߺ��� �����Ͽ� Ȯ���� �� �ֵ��� ������ ���� �����ڸ� ����غ�����.

-- �Ʒ� ������ chicken_store, pizza_store ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC chicken_store;
DESC pizza_store;
select * from chicken_store;
select * from pizza_store;

-- 1. chicken_store���� �̿밡���� ���Կ� ���� �����̸��� ����ϴ� ������ �ۼ��غ�����.
select store_name from chicken_store
where available ='Y';

-- 2. pizza_store���� �̿밡���� ���Կ� ���� �����̸��� ����ϴ� ������ �ۼ��غ�����.
select store_name from pizza_store
where available = 'Y';

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� ������ ���� �� ���İ� �ߺ�����(UNION��)�� �����ϴ� ������ �ۼ��ϼ���.
select store_name from chicken_store
where available ='Y'
UNION
select store_name from pizza_store
where available ='Y'
order by store_name asc;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| store_name | varchar(100) | NO   |     | NULL    |       |
| available  | varchar(1)   | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| id         | int(11)      | NO   | PRI | NULL    |       |
| store_name | varchar(100) | NO   |     | NULL    |       |
| available  | varchar(1)   | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
+----+--------------------------+-----------+
| id | store_name               | available |
+----+--------------------------+-----------+
|  1 | bbp                      | Y         |
|  2 | ���ġŲ                 | N         |
|  3 | BHA                      | Y         |
|  4 | ġŲ�������ڿ���         | Y         |
+----+--------------------------+-----------+
+----+--------------------------+-----------+
| id | store_name               | available |
+----+--------------------------+-----------+
|  1 | ����ŷ                   | Y         |
|  2 | �ѿø�����               | Y         |
|  3 | ġŲ�������ڿ���         | Y         |
|  4 | ����������               | Y         |
|  5 | ���ڳ���                 | N         |
+----+--------------------------+-----------+
+--------------------------+
| store_name               |
+--------------------------+
| bbp                      |
| BHA                      |
| ġŲ�������ڿ���         | 
+--------------------------+
+--------------------------+
| store_name               |
+--------------------------+
| ����ŷ                   |
| �ѿø�����               |
| ġŲ�������ڿ���         |
| ����������               |
+--------------------------+
+--------------------------+
| store_name               |
+--------------------------+
| bbp                      |
| BHA                      |
| ����������               |
| ġŲ�������ڿ���         |
| ����ŷ                   |
| �ѿø�����               |
+--------------------------+

--[�ǽ�4 �ؼ�] ���� ������ ���� - UNION ALL
-- �̹����� �� ���� ���̺� � ���ǵ��� �� ���� ��û�Ǿ����� ������� �մϴ�. ���� �⺻���� ���̺�� Ư������ ���̺��� ���� �̸��� ��ȸ�ϵ�, ���ڸ� ���� ���� �ߺ��� ���Ǹ� �״�� ��ȸ�ؾ� �մϴ�.

-- �� ���� ���̺��� ���� �̸�(lecture_name) �� ���ؼ� ��ȸ�ϴ� 2���� SELECT ������ ����� �Բ� ��ȸ�� ���ô�.
-- �̶� �������� �ߺ��� ���ؼ� ���� ó���� ���� �ʴ� ���� ������ �� �̿��մϴ�.
-- ���û���
-- lecture_basic���̺��� Ȯ���ϰ�, SELECT���� �̿��� ���� �̸�(lecture_name) �� ��ȸ�� ������.

-- lecture_special���̺��� Ȯ���ϰ�, SELECT���� �̿��� ���� �̸�(lecture_name) �� ��ȸ�� ������.

-- 1���� 2������ ��ȸ�� ����� ���ؼ� ���� ������ �� �̿��� �Բ� ��ȸ�ϵ�, ������ ���� �� �ߺ����Ÿ� �������� �ʵ��� �ϼ���.

-- �Ʒ� ������ lecture_basic, lecture_special ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC lecture_basic;
DESC lecture_special;

-- 1. lecture_basic ���̺��� �����̸�(lecture_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select lecture_name from lecture_basic;

-- 2. lecture_special ���̺��� �����̸�(lecture_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select lecture_name from lecture_special;

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� �����͸� �����ϵ� �������� �ߺ�����(UNION ALL)�� �������� �ʴ� ������ �ۼ��ϼ���.
select lecture_name from lecture_basic
UNION ALL
select lecture_name from lecture_special
order by lecture_name;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+--------------+
| lecture_name |
+--------------+
| math         |
| korean       |
| math         |
| math         |
+--------------+
+--------------+
| lecture_name |
+--------------+
| piano        |
| kendo        |
| piano        |
| kendo        |
+--------------+
+--------------+
| lecture_name |
+--------------+
| kendo        |
| kendo        |
| korean       |
| math         |
| math         |
| math         |
| piano        |
| piano        |
+--------------+

--[�ǽ�5 �ؼ�] ���� ������ ���� - UNION/UNION ALL
-- request_past��� ��û(����) ���̺�� request_new��� ��û(�ű�) ���̺��� �� ���̺� ������ �µ��� �̸��� �ڵ��� ��ȣ ������ �������� ��� �ֽ��ϴ�.

-- ���ſ� ��û�ߴ� �̷°� �űԷ� ��û�ߴ� �̷µ鿡 ���� ����/�űԸ� �������� �ʰ� �̸��� �ڵ�����ȣ�� ��ȸ�Ϸ��� �մϴ�.

-- �� ���� ���̺��� ���� �̸�(name) �� �ڵ��� ��ȣ(number) �� ��ȸ�ϴ� 2���� SELECT ���� ����� ���ؼ� �����͸� �����Ͽ� ��ȸ�ϵ�, �ߺ��� �������� �ʴ� ���� �����ڸ� �̿��� ������ �ߺ��� �����ϴ� ���� �����ڸ� �̿��� ������ ����� ���ô�.
-- ���û���
-- request_past���̺�� request_new ���̺��� ���� �̸�(name) �� ��ȣ(number) �� ��ȸ�ϴ� SELECT���� ���ؼ� �ߺ��� �������� �ʴ� ���� �����ڸ� �̿��Ͽ� �����͸� �����غ�����.

-- request_past���̺�� request_new ���̺��� ���� �̸�(name) �� ��ȣ(number) �� ��ȸ�ϴ� SELECT���� ���ؼ� �ߺ��� �����ϴ� ���� �����ڸ� �̿��Ͽ� �����͸� �����غ�����.

-- �Ʒ� ������ request_past, request_new ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC request_past;
DESC request_new;

select * from request_past;
select * from request_new;

-- 1. �� ���̺��� �̸�(name)�� ��ȣ(number)�� ��ȸ�ϰ�, ���տ����ڸ� ���� �ߺ��� �������� �ʰ� �����͸� �����غ�����.
select name,number from request_past
UNION ALL
select name, number from request_new
order by name;

-- 2. �� ���̺��� �̸�(name)�� ��ȣ(number)�� ��ȸ�ϰ�, ���տ����ڸ� ���� �ߺ��� �����Ͽ� �����͸� �����غ�����.
select name,number from request_past
UNION
select name, number from request_new
order by name;

+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int(11)      | NO   | PRI | NULL    |       |
| name   | varchar(100) | NO   |     | NULL    |       |
| number | varchar(20)  | NO   |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int(11)      | NO   | PRI | NULL    |       |
| name   | varchar(100) | NO   |     | NULL    |       |
| number | varchar(20)  | NO   |     | NULL    |       |
| email  | varchar(100) | NO   |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
+----+--------------+------------+
| id | name         | number     |
+----+--------------+------------+
|  1 | �����       | 1012345678 |
|  2 | ��ȣ��       | 1011112222 |
|  3 | �̱⸰       | 1098765432 |
|  4 | �����       | 1011116789 |
|  5 | �谭����     | 1099998765 |
+----+--------------+------------+
+----+--------------+------------+------------------+
| id | name         | number     | email            |
+----+--------------+------------+------------------+
|  1 | ��ȣ��       | 1022221234 | ho@naver.com     |
|  2 | �̱⸰       | 1098765432 | girin@naver.com  |
|  3 | �����       | 1033331234 | gong@naver.com   |
|  4 | ���䳢       | 1012345679 | rabbit@naver.com |
|  5 | �ڼ���       | 1012345555 | park@naver.com   |
|  6 | �谭����     | 1099998765 | dog@naver.com    |
+----+--------------+------------+------------------+
+--------------+------------+
| name         | number     |
+--------------+------------+
| �����       | 1011116789 |
| �谭����     | 1099998765 |
| �谭����     | 1099998765 |
| �����       | 1033331234 |
| �����       | 1012345678 |
| ��ȣ��       | 1011112222 |
| �ڼ���       | 1012345555 |
| �̱⸰       | 1098765432 |
| �̱⸰       | 1098765432 |
| ���䳢       | 1012345679 |
| ��ȣ��       | 1022221234 |
+--------------+------------+
+--------------+------------+
| name         | number     |
+--------------+------------+
| �����       | 1011116789 |
| �谭����     | 1099998765 |
| �����       | 1033331234 |
| �����       | 1012345678 |
| ��ȣ��       | 1011112222 |
| �ڼ���       | 1012345555 |
| �̱⸰       | 1098765432 |
| ���䳢       | 1012345679 |
| ��ȣ��       | 1022221234 |
+--------------+------------+

--[�ǽ�6 �ؼ�] ���� ������ ���� - INTERSECT(1)
-- �̹����� �⺻���ǿ� Ư�����Ǹ� ��� �����ϴ� �л����� ������ �˾ƺ����� �մϴ�.

-- �� ���� ���̺��� ���� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�ϴ� 2���� SELECT ���� ����� ���ؼ� ���������� �����ϴ� �����͸� ��ȸ�ϴ� ������ ���� ������ �� ����� ���ô�.
-- ���û���
-- lecture_basic���̺��� Ȯ���ϰ�, SELECT���� �̿��� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�� ������.

-- lecture_special���̺��� Ȯ���ϰ�, SELECT���� �̿��� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�� ������.

-- 1���� 2������ ��ȸ�� ����� ���ؼ� ���� �����ڸ� �̿��� �������� �����ϴ� �����͸� ��ȸ�ϼ���.

-- �Ʒ� ������ lecture_basic, lecture_special ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC lecture_basic;
DESC lecture_special;
select * from  lecture_basic;
select * from lecture_special;

-- 1. lecture_basic ���̺��� �л���ȣ(student_number)�� �л��̸�(student_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number, student_name
from lecture_basic;

-- 2. lecture_special ���̺��� �л���ȣ(student_number)�� �л��̸�(student_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number, student_name
from lecture_special;

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� ���������� �����ϴ� �����͸� ��ȸ�ϴ� ������ �ۼ����ּ���.
select student_number, student_name
from lecture_basic
intersect
select student_number, student_name
from lecture_special
order by student_number;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | math         |          10001 | HongGildong  |
|  2 | korean       |          10001 | HongGildong  |
|  3 | math         |          10003 | HongGilsun   |
|  4 | math         |          10004 | KimChulsoo   |
+----+--------------+----------------+--------------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | piano        |          10001 | HongGildong  |
|  2 | kendo        |          10002 | KimAmugae    |
|  3 | piano        |          10003 | HongGilsun   |
|  4 | kendo        |          10003 | HongGilsun   |
+----+--------------+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10003 | HongGilsun   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
+----------------+--------------+

--[�ǽ�7 �ؼ�] ���� ������ ���� - INTERSECT(2)
-- student��� �л� ���̺��� �л����� ������, lecture_special�̶�� Ư������ ���̺��� ���ǿ� ���� ��û ������ ��� �ֽ��ϴ�.

-- �л� ���̺��� �����ϴ� �л��� �߿����� Ư�����Ǹ� ��û�� ����� �ְ� �ƴ� ����� �ֽ��ϴ�.
-- �츮�� �����ϰ� �ִ� �л��� �߿��� Ư�����Ǹ� ��û�� �л��� ã�ƺ��ô�.

-- �� ���� ���̺��� ���� �̸�(name) �� �̸���(email) �� ��ȸ�ϴ� 2���� SELECT ���� ����� ���ؼ� �������� �����ϴ� �����͸� ��ȸ�ϴ� ������ ���� ������ �� ����� ���ô�.
-- ���û���
-- student���̺��� Ȯ���ϰ�, SELECT���� �̿��� �̸�(name) �� �̸���(email) �� ��ȸ�� ������.

-- lecture_special���̺��� Ȯ���ϰ�, SELECT���� �̿��� �̸�(name) �� �̸���(email) �� ��ȸ�� ������.

-- 1���� 2������ ��ȸ�� ����� ���ؼ� ���� �����ڸ� �̿��� �������� �����ϴ� �����͸� ��ȸ�ϼ���.

-- �Ʒ� ������ student, lecture_special ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC student;
DESC lecture_special;
select * from student;
select * from lecture_special;

-- 1. student ���̺��� �̸�(name)�� �̸���(email)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select name, email from student;

-- 2. lecture_special ���̺��� �̸�(name)�� �̸���(email)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select name, email from lecture_special;

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� ���������� �����ϴ� �����͸� ��ȸ�ϴ� ������ �ۼ����ּ���.
select name, email from student
intersect
select name, email from lecture_special;

+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| id             | int(11)      | NO   | PRI | NULL    |       |
| student_number | int(11)      | NO   |     | NULL    |       |
| name           | varchar(30)  | NO   |     | NULL    |       |
| grade          | int(11)      | NO   |     | NULL    |       |
| email          | varchar(100) | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| id           | int(11)      | NO   | PRI | NULL    |       |
| lecture_name | varchar(50)  | NO   |     | NULL    |       |
| name         | varchar(30)  | NO   |     | NULL    |       |
| email        | varchar(100) | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
+----+----------------+--------------+-------+--------------------+
| id | student_number | name         | grade | email              |
+----+----------------+--------------+-------+--------------------+
|  1 |          10001 | HongGildong  |     2 | hong@naver.com     |
|  2 |          10002 | KimAmoogae   |     3 | NULL               |
|  3 |          10003 | HongGilsun   |     1 | hong.sun@naver.com |
|  4 |          10004 | KimChulsoo   |     3 | NULL               |
|  5 |          10005 | LeeMooMyeong |     4 | NULL               |
+----+----------------+--------------+-------+--------------------+
+----+--------------+-------------+------------------+
| id | lecture_name | name        | email            |
+----+--------------+-------------+------------------+
|  1 | piano        | Kimseulki   | seulki@naver.com |
|  2 | kendo        | KimGuest    | guest@naver.com  |
|  3 | piano        | HongGildong | hong@naver.com   |
|  4 | kendo        | HongGilsun  | hsun@naver.com   |
+----+--------------+-------------+------------------+
+--------------+--------------------+
| name         | email              |
+--------------+--------------------+
| HongGildong  | hong@naver.com     |
| KimAmoogae   | NULL               |
| HongGilsun   | hong.sun@naver.com |
| KimChulsoo   | NULL               |
| LeeMooMyeong | NULL               |
+--------------+--------------------+
+-------------+------------------+
| name        | email            |
+-------------+------------------+
| Kimseulki   | seulki@naver.com |
| KimGuest    | guest@naver.com  |
| HongGildong | hong@naver.com   |
| HongGilsun  | hsun@naver.com   |
+-------------+------------------+
+-------------+----------------+
| name        | email          |
+-------------+----------------+
| HongGildong | hong@naver.com |
+-------------+----------------+

--[�ǽ�8 �ؼ�] ���� ������ ���� - EXCEPT(1)
-- �̹����� Ư�����Ǵ� ����������, �⺻���Ǵ� �������� �ʴ� �л����� ������ ��ȸ�غ����� �մϴ�.

-- �� ���� ���̺��� ���� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�ϴ� 2���� SELECT ���� ����� ���ؼ�, ���� ������ �� �̿��Ͽ� lecture_special ���̺��� ����������, lecture_basic ���̺��� �������� �ʴ� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�ϴ� ������ �ۼ��غ��ô�.
-- ���û���
-- lecture_basic���̺��� Ȯ���ϰ�, SELECT���� �̿��� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�� ������.

-- lecture_special���̺��� Ȯ���ϰ�, SELECT���� �̿��� �л� ��ȣ(student_number) �� �л� �̸�(student_name) �� ��ȸ�� ������.

-- 1���� 2������ ��ȸ�� ����� ���ؼ� ���� �����ڸ� �̿��� lecture_special ���̺��� ����������, lecture_basic ���̺��� �������� �ʴ� �����͸� ��ȸ�ϼ���.
-- �Ʒ� ������ lecture_basic, lecture_special ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC lecture_basic;
DESC lecture_special;
select * from lecture_basic;
select * from  lecture_special;

-- 1. lecture_basic ���̺��� �л���ȣ(student_number)�� �л��̸�(student_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number, student_name
from lecture_basic;


-- 2. lecture_special ���̺��� �л���ȣ(student_number)�� �л��̸�(student_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number, student_name
from lecture_special;

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� lecture_special ���̺��� ����������, lecture_basic���� 
-- �������� �ʴ� �л���ȣ�� �л��̸��� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select student_number, student_name
from lecture_special
except
select student_number,student_name
from lecture_basic
order by student_number;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| id             | int(11)     | NO   | PRI | NULL    |       |
| lecture_name   | varchar(50) | NO   |     | NULL    |       |
| student_number | int(11)     | NO   |     | NULL    |       |
| student_name   | varchar(30) | NO   |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | math         |          10001 | HongGildong  |
|  2 | korean       |          10001 | HongGildong  |
|  3 | math         |          10003 | HongGilsun   |
|  4 | math         |          10004 | KimChulsoo   |
+----+--------------+----------------+--------------+
+----+--------------+----------------+--------------+
| id | lecture_name | student_number | student_name |
+----+--------------+----------------+--------------+
|  1 | piano        |          10001 | HongGildong  |
|  2 | kendo        |          10002 | KimAmugae    |
|  3 | piano        |          10003 | HongGilsun   |
|  4 | kendo        |          10003 | HongGilsun   |
+----+--------------+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10001 | HongGildong  |
|          10003 | HongGilsun   |
|          10004 | KimChulsoo   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10001 | HongGildong  |
|          10002 | KimAmugae    |
|          10003 | HongGilsun   |
|          10003 | HongGilsun   |
+----------------+--------------+
+----------------+--------------+
| student_number | student_name |
+----------------+--------------+
|          10002 | KimAmugae    |
+----------------+--------------+

--[�ǽ�9 �ؼ�] ���� ������ ���� - EXCEPT(2)
-- book_store_a��� a å�� ���̺�� book_store_b��� b å�� ���̺��� �� ���̺� ������ �µ��� å�� �̸��� ��� ���� ������ ����ֽ��ϴ�.

-- �� å�濡�� ��� ����������, �� �߿����� a å�濡�� �����ϴ� å�� ã�ƺ����� �մϴ�.

-- �� ���� ���̺��� ��� �����ϴ� (stock>0) å�� ���ؼ�, book_store_a���� �����ϴ� å�� �̸�(book_name) �� ���� �����ڷ� ����غ��ô�.
-- ���û���
-- book_store_a���̺��� Ȯ���ϰ�, SELECT���� WHERE���� �̿��� ���(stock)�� 0 �ʰ��� �����Ϳ� ���ؼ� å�� �̸�(book_name) �� ��ȸ�� ������.

-- book_store_b���̺��� Ȯ���ϰ�, SELECT���� WHERE���� �̿��� ���(stock)�� 0 �ʰ��� �����Ϳ� ���ؼ� å�� �̸�(book_name) �� ��ȸ�� ������.

-- 1���� 2������ ��ȸ�� ����� ���ؼ� ������ ���� �����ڸ� �̿��� book_store_a ���̺��� �����ϴ� å�� ������ ��ȸ�ϼ���.

-- �Ʒ� ������ book_store_a, book_store_b ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC book_store_a;
DESC book_store_b;
select * from book_store_a;
select * from book_store_b;

-- 1. book_store_a ���̺��� ���(stock)�� 0 �ʰ��� �������� å���̸�(book_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select book_name from book_store_a
where stock >0;

-- 2. book_store_b ���̺��� ���(stock)�� 0 �ʰ��� �������� å���̸�(book_name)�� ��ȸ�ϴ� ������ �ۼ��ϼ���.
select book_name from book_store_b
where stock >0;

-- 3. �� 2���� ������ ���ؼ� ���� �����ڸ� �̿��Ͽ� book_store_a���� �����ϴ� �����͸� ��ȸ�ϼ���.
select book_name from book_store_a
where stock > 0
except
select book_name from book_store_b
where stock > 0;

+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| book_name | varchar(100) | NO   |     | NULL    |       |
| stock     | int(11)      | NO   |     | NULL    |       |
| writer    | varchar(30)  | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int(11)      | NO   | PRI | NULL    |       |
| book_name | varchar(100) | NO   |     | NULL    |       |
| stock     | int(11)      | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
+----+--------------------+-------+-----------+
| id | book_name          | stock | writer    |
+----+--------------------+-------+-----------+
|  1 | ��������           |     0 | ȫ�浿    |
|  2 | SQLƯ��            |     3 | ȫ�浿    |
|  3 | ����ó�����       |     1 | ȫ���    |
|  4 | ����               |     2 | ��ö��    |
+----+--------------------+-------+-----------+
+----+--------------------------+-------+
| id | book_name                | stock |
+----+--------------------------+-------+
|  1 | SQLƯ��                  |     0 |
|  2 | ����                     |     5 |
|  3 | ����ó�����             |     2 |
|  4 | ����ó��������         |     2 |
|  5 | �۾��°�����             |     1 |
+----+--------------------------+-------+
+--------------------+
| book_name          |
+--------------------+
| SQLƯ��            |
| ����ó�����       |
| ����               |
+--------------------+
+--------------------------+
| book_name                |
+--------------------------+
| ����                     |
| ����ó�����             |
| ����ó��������         |
| �۾��°�����             |
+--------------------------+
+-----------+
| book_name |
+-----------+
| SQLƯ��   |
+-----------+

--[�ǽ�10 �ؼ�] ������ ����
-- MEMBER ���̺��� ��� ID, ������ ID�� ��� �ֽ��ϴ�.

-- �� ����� ���ؼ� �������� �� ��° ������������ �˾ƺ����� �մϴ�. ��, �ֻ��������ڴ� 0��° �������Դϴ�.

-- ������ ����(WITH RECURSIVE) �� �̿��Ͽ�, MEMBER ���̺� ���� ������ ����� ����Ϸ��� �մϴ�. �տ��� �н��� ������ ���� member_id, manager_id, lvl�� ��ȸ�ϼ���.
-- ���û���
-- ������ ������ WITH RECURSIVE���� �̿��Ͽ�, MEMBER���̺� ���� member_id, manager_id, lvl�� ��ȸ�ϼ���.

-- Tips!
-- lvl ���� 0���� �����ϵ��� ���ּ���.
-- ����� ���� ORDER BY �� �̿��Ͽ� member_id �������� ��������, lvl �������� �������� ������ ���ּ���.
-- ������ ��ȸ������ ���û��׿��� ����ϰ� �ִ� ������� ��Ȯ�� �ۼ��ϼ���.

-- �Ʒ� ������ MEMBER ���̺��� ������ ��Ÿ���ϴ�. �ش� ���̺��� ������ �ʿ�� �����ϴ�.
DESC MEMBER;
select * from MEMBER;

-- ������ ����, WITH RECURSIVE �� �̿��Ͽ�, member_id, manager_id, lvl�� ����ϵ�
-- member_id ��������, lvl �������� ������ �����Ͽ� ������ �ۼ��ϼ���.

WITH RECURSIVE CTE(member_id, manager_id, lvl) 
AS(
    SELECT member_id, manager_id, 0 as lvl
    FROM MEMBER 
    WHERE manager_id IS NULL
    UNION ALL
    SELECT a.member_id, a.manager_id, b.lvl+1
    FROM MEMBER AS a
    JOIN CTE AS b
    ON a.manager_id = b.member_id
)

SELECT member_id, manager_id, lvl
FROM CTE
ORDER BY member_id ASC, lvl ASC;

+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| member_id  | int(11) | NO   | PRI | NULL    |       |
| manager_id | int(11) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
+-----------+------------+
| member_id | manager_id |
+-----------+------------+
|      1000 |       NULL |
|      1001 |       1000 |
|      1002 |       1001 |
|      1003 |       1002 |
|      1004 |       1002 |
|      1005 |       1000 |
|      1006 |       1005 |
|      1007 |       1006 |
+-----------+------------+
+-----------+------------+------+
| member_id | manager_id | lvl  |
+-----------+------------+------+
|      1000 |       NULL |    0 |
|      1001 |       1000 |    1 |
|      1002 |       1001 |    2 |
|      1003 |       1002 |    3 |
|      1004 |       1002 |    3 |
|      1005 |       1000 |    1 |
|      1006 |       1005 |    2 |
|      1007 |       1006 |    3 |
+-----------+------------+------+
