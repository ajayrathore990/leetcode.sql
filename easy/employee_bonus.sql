/*
Write an SQL query to report the name and bonus amount of each employee with 
a bonus less than 1000.
Return the result table in any order.
*/

select
	name,
	b.bonus
from
	leetcode577.Employee e
left join leetcode577.Bonus b 
on
	e.empid = b.empid
where
	b.bonus <= 1000
	or b.bonus is null;

