/*
Write a sql to find the name of the winning candidate, 
the above example will return the winner B.
*/

select
	Name
from
	leetcode574.Candidate
where
	id = (
	select
		CandidateId
	from
		leetcode574.Vote
	group by
		CandidateId
	order by
		COUNT(1) desc
	limit 1);

    
