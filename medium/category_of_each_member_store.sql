/*
Write an SQL query to report the id, the name, and the category of each member.
*/

with cte as 
(
select
	p.visit_id as pvisit,
	m.member_id as m_id,
	count(v.member_id) over(partition by v.member_id) as cc,
	*
from
	leetcode2051.members m
left join leetcode2051.visits v 
on
	m.member_id = v.member_id
left join leetcode2051.purchases p 
on
	p.visit_id = v.visit_id
),
cte1 as 
(
select
	*,
	case
		when pvisit is not null then (100 * 1) / cc
		else 0
	end as rr
from
	cte
)
select
	distinct m_id as member_id,
	name,
	case
		when rr >= 80 then 'Diamend'
		when rr >80
		and rr <50 then 'gold'
		when rr <30 then 'silver'
		else 'bronze'
	end
from
	cte1
order by
	m_id;

