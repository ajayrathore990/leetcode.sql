/*
Write an SQL query that reports for each user the product id on which the 
user spent the most money. 
*/

with cte as 
(
select
	* ,
	p.product_id as p_id,
	quantity * price as spend
from
	leetcode2324.Sales s
join leetcode2324.products p
on
	s.product_id = p.product_id
)
select
	user_id,
	p_id
from
	cte
group by
	user_id,
	p_id
order by
	user_id;

