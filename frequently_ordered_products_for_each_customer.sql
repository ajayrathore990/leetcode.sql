/*
Write an SQL query to find the most frequently ordered product(s) for each customer.
The result table should have the product_id and product_name for each customer_id 
who ordered at least one order. Return the result table in any order.
*/

with cte as 
(
select
	*,
	p.product_id as p_id ,
	count(p.product_id) over(partition by o.customer_id )
from
	leetcode1596.Orders o
join leetcode1596.Products p 
on
	o.product_id = p.product_id
order by
	o.customer_id
)
select
	customer_id,
	p_id,
	product_name
from
	cte
group by
	customer_id,
	p_id ,
	product_name
order by
	customer_id,
	p_id,
	product_name;


