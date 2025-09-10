/*
Write a solution to calculate the number of unique subjects 
each teacher teaches in the university.
*/

select
	teacher_id ,
	count(distinct subject_id) as subject_id
from
	leetcode2356.teacher
group by
	teacher_id;

