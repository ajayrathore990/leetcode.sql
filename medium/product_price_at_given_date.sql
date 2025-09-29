/*
Write an SQL query to find the prices of all products on 2019-08-16.
Assume the price of all products before any change is 10.
*/

with cte1 as 
(
select
	product_id,
	case
		when change_date > '2019-08-16' then 10
		else new_price
	end as price,
	change_date
from
	leetcode1164.Products
)
select
	product_id,
	max(price) as price
from
	cte1
group by
	product_id;
