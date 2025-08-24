/*
Write a SQL query to delete all duplicate email entries in a table named Person,
keeping only unique emails based on its smallest Id.

*/

delete
from
	leetcode196.person
where
	email = (
	select
		email
	from
		leetcode196.person
	group by
		email
	having
		count(email)>1
);

