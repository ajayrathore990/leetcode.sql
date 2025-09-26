/*
Mary is a teacher in a middle school and she has a table seat storing students names
and their corresponding seat ids.
Mary wants to change seats for the adjacent students.
Can you write a SQL query to output the result for Mary?
*/

select
	IIF(ID%2 = 0,
	ID-1,
	IIF(ID<(
	select
		MAX(ID)
	from
		leetcode624.students),
	ID + 1,
	ID)) as ID,
	student
from
	leetcode624.students
order by
	ID
