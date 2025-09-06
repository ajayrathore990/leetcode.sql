/*
Write an SQL query to report the customers with postive revenue in the year 2021.
*/

select
	*
from
	leetcode1821.Customers
where
	year = 2021
	and revenue >1;

