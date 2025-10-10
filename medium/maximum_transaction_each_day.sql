/*
Write an SQL query to report the IDs of the transactions with the maximum amount 
on their respective day. 
If in one day there are multiple such transactions, return all of them.
*/

with daily_transactions as (
select
	transaction_id,
	DATE(day) as date,
	amount
from
	leetcode1831.Transactions
)
select
	transaction_id
from
	daily_transactions
where
	(date,
	amount) in (
	select
		date,
		MAX(amount)
	from
		daily_transactions
	group by
		date
)
order by
	transaction_id;


