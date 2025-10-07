/*
Write an SQL query to report the balance of each user after each transaction. 
You may assume that the balance of each account before any transaction is 0 
and that the balance will never be below 0 at any moment.
*/

select
	account_id,
	day,
	sum(case when type = 'Deposit' then amount else -amount end ) over (
        partition by account_id
order by
	day
    ) as balance
from
	leetcode2066.Transactions
order by
	1,
	2;


