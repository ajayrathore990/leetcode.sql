/*
Write an SQL query to find for each user, the join date and the number 
of orders they made as a buyer in 2019.
*/

with cte as (
select
	*
from
	leetcode1158.Orders
where
	extract(year
from
	order_date) = 2019
)
select
	u.user_id,
	join_date,
	count(c.buyer_id) as orders_in_2019
from
	cte c
right join leetcode1158.Users u 
on
	c.buyer_id = u.user_id
group by
	u.user_id,
	join_date
order by
	u.user_id;


