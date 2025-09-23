/*
Write a query to find the median of all numbers and name the result as median.
*/

select
	avg(t3.Number) as median
from
	leetcode571.Numbers as t3
join
    (
	select
		t1.Number,
		abs(SUM(case when t1.Number>t2.Number then t2.Frequency else 0 end) -
            SUM(case when t1.Number<t2.Number then t2.Frequency else 0 end)) as count_diff
	from
		leetcode571.numbers as t1,
		numbers as t2
	group by
		t1.Number) as t4
on
	t3.Number = t4.Number
where
	t3.Frequency >= t4.count_diff;


