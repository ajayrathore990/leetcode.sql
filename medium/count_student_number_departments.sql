/*
Write a query to print the respective department name 
and number of students majoring in each department for all departments 
in the department table (even ones with no current students).
*/

select
	distinct d.dept_name,
	count(s.dept_id) over( partition by s.dept_id ) as student_number
from
	LeetCode580.student s
right join LeetCode580.department d
on
	s.dept_id = d.dept_id
order by
	student_number desc;


