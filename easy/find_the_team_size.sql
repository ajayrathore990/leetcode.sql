/*
Write an SQL query to find the team size of each of the employees.
*/

select
	employee_id,
	count(team_id) over( partition by team_id
order by
	employee_id ) as team_size
from
	leetcode1303.Employee;

