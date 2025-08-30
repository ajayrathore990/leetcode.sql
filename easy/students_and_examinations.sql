/*
Write an SQL query to find the number of times each student attended each exam.
Order the result table by student_id and subject_name.
*/

select
	student_id,
	student_name,
	subject_name,
	COUNT(e.student_id) as attended_exams
from
	leetcode1280.Students
join leetcode1280.Subjects
left join leetcode1280.Examinations as e
		using (student_id,
	subject_name)
group by
	student_id,
	subject_name
order by
	student_id,
	subject_name;


