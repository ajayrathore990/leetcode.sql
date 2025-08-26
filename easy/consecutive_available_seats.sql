/*
Cinema ticket office would like to reserve consecutive available seats. 
Can you help to query all the consecutive available seats order by 
the seat_id using the following cinema table?
*/


with cte1 as
(
select
	*,
	case
		when c1.free = c2.free then c1.seat_id
	end as ss
from
	leetcode603.cinema c1
join leetcode603.cinema c2
on
	c1.seat_id + 1 = c2.seat_id
),
cte2 as 
(
select
	*,
	case
		when c1.free = c2.free then c2.seat_id
	end as ss
from
	leetcode603.cinema c1
join leetcode603.cinema c2
on
	c1.seat_id + 1 = c2.seat_id
)
select
	ss as seatid
from
	cte1
where
	ss is not null
union
select
	ss as seatid
from
	cte2
where
	ss is not null
;
