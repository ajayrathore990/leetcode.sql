/*
Write an SQL query to report each persons name followed by the first 
letter of their profession enclosed in parentheses.
*/

select
	person_id,
	concat(name, ' (',(SUBSTRING(name from 1 for 1) ), ')')
from
	leetcode2504.person
	order by person_id;

