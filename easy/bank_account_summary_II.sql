/*
Write an SQL query to report the name and balance of users with a balance higher than 10000.
The balance of an account is equal to the sum of the amounts of all transactions involving
that account.
*/

select
	u.name,
	sum(t.amount) as balance
from
	leetcode1587.Transactions t
join leetcode1587.Users u 
on
	t.account = u.account
group by
	u.name
having
	sum(t.amount) >10000;

