/*
Write an SQL query to find the most recent 3 orders of each user. 
If a user ordered less than 3 orders return all of their orders.
*/

with cte as 
(
select
	*,
	row_number() over( partition by c.customer_id
order by
	o.order_date desc) as row_n
from
	leetcode1532.Customers c
join leetcode1532.Orders o
on
	o.customer_id = c.customer_id
order by
	o.customer_id
)
select
	*
from
	cte
where
	row_n <= 3
order by
	name


