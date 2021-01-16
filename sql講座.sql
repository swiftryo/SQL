-- すべてのユーザー情報　　すべて
use mydb;
select * from users;

-- ユーザー情報のidと名字のみ　列を指定して
use mydb;
select id, last_name from users;

-- 列に別名
use mydb;
select name as 名前, price as 価格 from products;
asは省略可

-- 列の値に対して演算
select name 名前, price 価格, price*1.08　税込価格 from products;

-- 条件を指定してデータを取得する where
select name, price from products where price >= 9800;

-- idが１の行
select * from products where id = 1;

-- priceが100でない行
select * from products where price <> 100;
select * from products where price != 100;

-- idが1,2,3
select * from products where id in (1,2,3);

-- パターンマッチングによる絞り込み like 中を含む名字
use mydb;
select * from users where last_name like  '%中%' ;

-- 名前が三文字子で終わる
select * from users where first_name like  '__子';

-- 取得件数を制限するlimit 10件の表示
select * from products limit 10;

-- どこから何件表示させるか
select * from products limit 10,10;

-- 合計値を求める 201701の売上 sum
select sum(amount) from orders where order_time >= '2017-01-01 00:00:00' and order_time < '2017-02-01 00:00:00';

-- 平均値 avg(exor)
select avg(price) from products;

-- 最小値　min
select min(price) from products;

-- 最大値 max
select max(price) from products;

-- 行数を数える count
select count(*) from users;
select count(*) from users where gender = 2;

-- 月間ユニークユーザー数を求めるcount(distinct expr)
select count(distinct user_id) from access_logs where request_month = '2017-01-01';

-- データをグループ化 group by
select prefecture_id, count(*) from users group by prefecture_id;

-- 期間ごとにグループ化
select request_month, count(distinct user_id) from access_logs where request_month >= '2017-01-01' and request_month < '2018-01-01' group by request_month; 

-- 集計結果をさらに絞り込む having
select request_month, count(distinct user_id) from access_logs where request_month >= '2017-01-01' and request_month < '2018-01-01' group by request_month having count(distinct user_id) >= 630;

-- 

-- 

-- 

-- 























































