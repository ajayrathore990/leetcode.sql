/*
Write an SQL query to report the IDs of all suspicious bank accounts.
*/

with cte as (
select
	account_id,
	sum(amount) sum_month,
	extract (month
from
	day)
from
	leetcode1843.transactions
where
	type = 'Creditor'
group by
	account_id ,
	extract (month
from
	day)
),
cte1 as 
(
select
	*,
	a.account_id as a_id,
	sum_month > max_income as value
from
	cte c
join 
leetcode1843.accounts a on
	c.account_id = a.account_id
)
select
	c1.a_id as account_id
from
	cte1 C1
join cte1 C2
on
	C1.a_id = c2.a_id
where
	c1.value = c2.value
	and c1.date_part = c2.date_part-1;


