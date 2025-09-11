/*
Write an SQL query to calculate the difference between the highest salaries 
in the marketing and engineering department. Output the absolute difference in salaries.
*/

select
	(
	select
		max(salary)
	from
		leetcode2853.salaries
	where
		department = 'Engineering')
-
(
	select
		max(salary)
	from
		leetcode2853.salaries
	where
		department = 'Marketing')
as salary_difference;
