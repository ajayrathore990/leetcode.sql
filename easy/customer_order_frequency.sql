/*
Write an SQL query to report the customer_name of 
customers who have spent at least $100 in each month of June and July 2020.

*/

with cte as (
select
	*,
	price * quantity as cost
from
	leetcode1511.Product p
join leetcode1511.Orders o
on
	p.product_id = o.product_id
where
	extract(month
from
	o.order_date) in (6, 7) 
),
cte1 as (
select
	sum(cost),
	extract(month
from
	order_date),
	name
from
	cte c
join leetcode1511.Customers cu
on
	cu.customer_id = c.customer_id
where
	extract(month
from
	order_date) in (6, 7)
group by
	extract(month
from
	order_date),
	name
having
	sum(cost)>= 100
)
select
	name
from
	cte1
group by
	name
having
	count(name) = 2
;