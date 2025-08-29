/*
Write an SQL query to find each query_name, the quality and poor_query_percentage.
*/

with cte as (
select
	*,
	cast(cast(rating as float)/ cast (position as float) as float) as rat
from
	leetcode1211.Queries
),
cte1 as (
select
	query_name,
	count(query_name) as c1_count
from
	cte
where
	rating <3
group by
	query_name
),
cte2 as 
(
select
	query_name,
	count(query_name) as c2_count
from
	cte
group by
	query_name
),
cte3 as (
select
	query_name,
	avg(rat) as quality
from
	cte
group by
	query_name
)
select
	c1.query_name ,
	quality,
	cast(cast(c1_count as float)/ cast (c2_count as float) as float) as poor_query_percentage
from
	cte2 c2
join cte3 c3 on
	c2.query_name = c3.query_name
join cte1 c1 on
	c1.query_name = c3.query_name
;