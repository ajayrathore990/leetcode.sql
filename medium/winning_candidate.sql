/*
Write a sql to find the name of the winning candidate, 
the above example will return the winner B.
*/

--Solution 1
--Seq Scan on candidate  (cost=45.10..70.48 rows=6 width=32)
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

--Solution 2
--Hash Join  (cost=48.63..53.39 rows=100 width=4)
  with cte1 as (
select
	candidateid ,
	count(candidateid) as c_count
from
	leetcode574.Vote
group by
	candidateid
)
select
	candidateid
from
	cte1
where
	c_count in (
	select
		max(c_count)
	from
		cte1);

--Solution 3
--Hash Join  (cost=56.10..95.31 rows=615 width=32)

with cte as (
select
	count(candidateid) as vote_count,
	candidateid
from
	leetcode574.Vote
group by
	candidateid
)
select
	name
from
	leetcode574.Candidate
where
	id in (
	select
		candidateid
	from
		cte
	group by
		candidateid
	having
		max(vote_count) = candidateid
);


