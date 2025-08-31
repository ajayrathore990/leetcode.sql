/*
Write an SQL query to find the id and the name of all students who are enrolled in departments 
that no longer exists.

*/

select
	s1.id ,
	s1.name
from
	leetcode1350.Students s1
left join leetcode1350.Departments d1
on
	d1.id = s1.department_id
where
	d1.id is null;


