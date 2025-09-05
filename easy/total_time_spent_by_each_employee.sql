/*
Write an SQL query to calculate the total time in minutes spent by 
each employee on each day at the office. Note that within one day, 
an employee can enter and leave more than once.
*/

select
	event_day as day ,
	emp_id,
	sum(out_time-in_time) as total_time
from
	leetcode1741.Employees
group by
	day ,
	emp_id
