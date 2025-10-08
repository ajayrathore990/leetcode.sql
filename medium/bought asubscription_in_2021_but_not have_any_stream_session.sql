/*
Write an SQL query to report the number of accounts that bought a subscription
in 2021 but did not have any stream session.
*/

with cte as 
(
select
	*
from
	leetcode2020.Streams st
join leetcode2020.Subscriptions su
on
	st.account_id = su.account_id
where
	extract (year
from
	start_date) = 2021
order by
	su.account_id
)
select
	count(1) as accounts_count
from
	cte;


