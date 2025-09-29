/*
Write an SQL query to find for each month and country,
the number of transactions and their total amount, 
the number of approved transactions and their total amount.
*/

with cte as (
select
	* ,
	concat(extract( year from trans_date), '-',
extract( month from trans_date) 
) as month_
from
	leetcode1193.Transactions
),
cte1 as 
(
select
	month_,
	country ,
	count(state),
	sum (amount) as approved_total_amount
from
	cte
group by
	country ,
	month_
),
cte2 as
(
select
	month_,
	country ,
	count(state),
	sum (amount)
from
	cte
where
	state = 'approved'
group by
	country ,
	month_
)
select
	*
from
	cte1;

