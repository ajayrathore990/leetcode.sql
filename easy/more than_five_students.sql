/*
Please list out all classes which have more than or equal to 5 students.
*/

select
	class
from
	leetcode596.courses
group by
	class
having
	count(class) > 5;

