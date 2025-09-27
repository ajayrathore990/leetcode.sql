/*
Write a SQL query to find the highest grade with its corresponding course for each student. 
In case of a tie, you should find the course with the smallest course_id. 
The output must be sorted by increasing student_id.
*/

with cte as (
select
	student_id,
	MAX(grade)
from
	leetcode1112.Enrollments
group by
	student_id
)
select
	*
from
	cte c
join 
        leetcode1112.Enrollments e
       on
	c.student_id = e.student_id
	and c.max = e.grade

select
	distinct *
from
	leetcode1112.Enrollments
where
	(student_id ,
	grade) in (
	select
		distinct student_id ,
		max(grade) over(partition by student_id) as grade
	from
		leetcode1112.Enrollments
	order by
		student_id
)
order by
	student_id;


