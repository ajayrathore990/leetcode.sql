/*
Write a SQL query to find all duplicate emails in a table named Person.
*/

-------------
--solution 1
-------------

select
	email
from
	(
	select
		count(email),
		email
	from
		leetcode182.Person
	group by
		email
	having
		count(email) >= 2
) result;

-------------
--solution 2
-------------

with cte as (
select
	email ,
	count(email)
from
	leetcode182.Person
group by
	email
having
	count(email)>= 2
)
select
	email
from
	cte;

-------------
--solution 3
-------------

with cte as 
(
select
	*,
	row_number() over(partition by email)
from
	leetcode182.Person
)
select
	email
from
	cte
where
	row_number = 2;

