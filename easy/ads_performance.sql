/*
A company is running Ads and wants to calculate the performance of each Ad.
*/

with cte as (
select
	count(action),
	ad_id,
	action
from
	leetcode1322.Ads
group by
	action,
	ad_id
order by
	ad_id
),
cte1 as (
select
	sum(count) as c1_sum,
	ad_id
from
	cte
where
	action in ('Clicked', 'Viewed')
group by
	ad_id
),
cte2 as (
select
	sum(count) as c2_sum ,
	ad_id
from
	cte
where
	action in ('Clicked')
group by
	ad_id
)
select
	c1.ad_id ,
	round(c2_sum / c1_sum * 100, 2)
from
	cte1 c1
full join cte2 c2
on
	c1.ad_id = c2.ad_id
;
