/*
Write an SQL query to find the price of each product in each store.
*/

select
	product_id,
	sum(case when store = 'store1' then price end) as store1,
	sum(case when store = 'store2' then price end) as store2,
	sum(case when store = 'store3' then price end) as store3
from
	leetcode1777.Products
group by
	product_id ;

