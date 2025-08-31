/*
Write an SQL query to show the unique ID of each user,
If a user doesnt have a unique ID replace just show null.
*/

select
	u.unique_id,
	e.name
from
	leetcode1378.Employees e
left join leetcode1378.EmployeeUNI u
on
	e.id = u.id;

