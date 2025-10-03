/*
Write an SQL query that reports the rank of each student in their department 
as a percentage, where the rank as a percentage is computed using 
the following formula: 
(student_rank_in_the_department - 1) * 100 / 
(the_number_of_students_in_the_department - 1)

*/

with cte as 
(
select
	*,
	dense_rank() over ( partition by department_id
order by
	mark) as rank_
from
	leetcode2346.Students
),
cte1 as
(
select
	*,
	count(rank_) over ( partition by department_id ) as coun_
from
	cte
)
select
	student_id,
	department_id,
	(rank_ -1) * 100 / (coun_ - 1) as percentage
from
	cte1;