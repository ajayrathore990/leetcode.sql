/*
Write an SQL query to report the IDs of the users that made any 
two purchases at most 7 days apart.
*/

with cte as 
(
select
	*
from
	leetcode2228.Purchases
order by
	user_id,
	purchase_date
),
cte1 as 
(
select
	*,
	lag(purchase_date) over(partition by user_id ) prv_date
from
	cte
),
cte2 as 
(
select
	user_id,
	case
		when purchase_date - prv_date is not null then user_id
		when purchase_date - prv_date >6 then user_id
	end ans_id
from
	cte1
)
select
	distinct ans_id
from
	cte2
where
	ans_id is not null;
