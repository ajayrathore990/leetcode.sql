/*
Write an SQL query to report the IDs of all the products that were ordered 
three or more times in two consecutive years.
*/

with cte as 
(
select
	* 
,
	extract (year
from
	purchase_date) as year_
from
	leetcode2292.Orders
),
cte1 as 
(
select
	product_id,
	year_,
	count(year_) over( partition by year_)
from
	cte
),
cte2 as 
(
select
	distinct year_,
	product_id
from
	cte1
)
select
	distinct c2.product_id
from
	cte2 c1
join cte2 c2
on
	c1.year_ = c2.year_ + 1
;

