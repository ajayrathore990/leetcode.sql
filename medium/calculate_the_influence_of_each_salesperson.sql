/*
Write an SQL query to report the sum of prices paid by the customers 
of each salesperson. If a salesperson does not have any customers, 
the total value should be 0.
*/

with cte as (
select
	*,
	sum(price) over( partition by salesperson_id) total
from
	leetcoe2372.customer c
join leetcoe2372.Sales s 
on
	c.customer_id = s.customer_id
),
cte1 as 
(
select
	*,
	s1.salesperson_id as sid
from
	cte c1
right join leetcoe2372.salesperson s1
on
	c1.salesperson_id = s1.salesperson_id
)
select
	distinct sid,
	name ,
	case
		when total is not null then total
		else 0
	end as total
from
	cte1;



