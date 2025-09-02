/*
Write an SQL query to find the users who have valid emails.
*/

select
	*
from
	leetcode1517.Users
where
	mail like '%@leetcode.com'
	and mail not like '%#%'
	and mail not like '.%';

