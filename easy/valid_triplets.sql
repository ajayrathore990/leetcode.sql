/*
Write an SQL query to find all the possible triplets representing the country under 
the given constraints.
*/

select
	A.student_name as member_A,
	B.student_name as member_B,
	C.student_name as member_C
from
	leetcode1623.SchoolA as A,
	leetcode1623.SchoolB as B,
	leetcode1623.SchoolC as C
where
	A.student_id != B.student_id
	and
    A.student_id != C.student_id
	and
    B.student_id != C.student_id
	and
    A.student_name != B.student_name
	and
    A.student_name != C.student_name
	and
    B.student_name != C.student_name;


