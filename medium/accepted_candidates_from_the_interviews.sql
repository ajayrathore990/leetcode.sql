/*
Write an SQL query to report the IDs of the candidates who have at least two years 
of experience and the sum of the score of their interview rounds 
is strictly greater than 15.
*/

with cte as 
(
select
	*,
	sum(score) over (partition by c.candidate_id) all_score
from
	leetcode2041.candidates c
join leetcode2041.Rounds r 
on
	c.interview_id = r.interview_id
where
	c.years_of_exp >= 6 
)
select
	distinct candidate_id
from
	cte
where
	all_score >15;
