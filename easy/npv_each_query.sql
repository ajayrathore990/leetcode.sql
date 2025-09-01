/*
Write an SQL query to find the npv of each query of the Queries table.
*/

select
	distinct q.id,
	q.year,
	npv
from
	leetcode1421.NPV n
join leetcode1421.Queries q 
on
	n.id = q.id
	and n.year = q.year;

