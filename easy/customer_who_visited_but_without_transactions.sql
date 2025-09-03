/*
Write an SQL query to find the IDs of the users who visited without making any transactions 
and the number of times they made these types of visits.
*/

select
	customer_id,
	count(customer_id) as count_no_trans
from
	leetcode1581.Visits v
left join leetcode1581.Transactions t
on
	v.visit_id = t.visit_id
where
	t.transaction_id is null
group by
	customer_id
order by
	count(customer_id) desc;


