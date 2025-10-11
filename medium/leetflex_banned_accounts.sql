/*
Write an SQL query to find the account_id of the accounts that should be banned from Leetflex.
An account should be banned if it was logged in at some moment from two different IP addresses.
*/

select
	distinct l1.account_id
from
	leetcode1747.LogInfo l1
join leetcode1747.LogInfo l2
on
	l1.account_id = l2.account_id
	and l1.ip_address != l2.ip_address
where
	not (l1.login > l2.logout
		or l1.logout < l2.login);


