/*
Write an SQL query that reports the spending of each user.
Return the resulting table ordered by spending in descending order. 
In case of a tie, order them by user_id in ascending order.

*/

select
	user_id,
	sum(quantity * price) as spending
from
	leetcode2329.Sales s
join leetcode2329.Products p 
on
	p.product_id = s.product_id
group by
	user_id
order by
	user_id;

