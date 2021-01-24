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

-- データ並び替え order by
select * from products order by price desc;

-- 複数の並び替え条件の指定
select * from products order by price desc, id;

-- 絶対値 abs
select abs(10);

-- 四捨五入 round
select id, name, round(price * 1.08, 0) from products;

-- 文字列の演算  ||  concat
select concat(last_name, ' ', first_name, 'さん') from users;

-- 日付と時刻演算
select current_date();
select current_time();
select current_date() + interval 3 day;
select current_time() + interval 6 hour;
select * from orders where extract(year_month from order_time) = 201701;

-- テーブルの結合　内部結合 inner join  (joinに省略可)　省略しない方がよい　
use mydb;
select users.id, users.last_name, users.first_name, prefectures.name from users
inner join prefectures on users.prefecture_id = prefectures.id;

-- 内部結合+絞り込み　お互いに一致している行が結合テーブルの対象
select u.id, u.last_name, u.first_name, p.name from users as u
inner join prefectures as p on u.prefecture_id = p.id
where u.gender = 2;

-- 外部結合　outer join
select 
	p.id,
    p.name,
    sum(od.product_qty) num
from
	products p
-- left outer join
inner join
	order_details od
on 
	p.id = od.product_id
group by p.id
;

-- 3つ以上の結合 joinは複数回使える
select u.last_name, u.first_name, o.id, o.user_id, o.amount, o.order_time, p.name, od.product_qty, p.price 
from orders o
inner join order_details od
on o.id = od.order_id
inner join products p
on od.product_id = p.id
inner join users u
on o.user_id = u.id;
;

-- 多対多の関係を含む結合
select *
from products p
inner join products_categories pc
on p.id = pc.product_id
inner join categories c
on pc.category_id = c.id
where p.id = 3;

-- テーブルの足し算　union　集合演算子
select email, last_name, first_name, gender
from users
union
select email, last_name, first_name, gender from admin_users;

-- ビュー　並び替えができない　create view ビュー名 　削除 drop view
create view prefecture_user_counts(name, count)
as
select p.name name, count(*) count
from users u
inner join prefectures p
on u.prefecture_id = p.id
group by u.prefecture_id
;

-- サブクエリ 
select id, last_name, email
from users
where id not in (

select user_id
from orders
where order_time >= '2017-12-01 00:00:00'
and order_time < '2017-12-30 00:00:00')
;

-- スカラサブクエリ
select *
from products
where price > (
	select avg(price)
	from products
)
order by price desc, id asc
;

-- 条件分岐 case


-- 
-- 
-- 
-- 
-- 























































