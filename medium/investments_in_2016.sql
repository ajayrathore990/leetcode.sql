/*
Write a query to print the sum of all total investment values in 2016 (TIV_2016),
to a scale of 2 decimal places, for all policy holders who meet the following criteria:
Have the same TIV_2015 value as one or more other policyholders.
Are not located in the same city as any other policyholder 
(i.e.: the (latitude, longitude) attribute pairs must be unique).
*/

select
	sum(tiv_2016) as TIV_2016
from
	leetcode585.insurance
where
	CONCAT(LAT, ',', LON)
    in (
	select
		CONCAT(LAT, ',', LON)
	from
		leetcode585.insurance
	group by
		LAT,
		LON
	having
		COUNT(1) = 1)
	and TIV_2015 in
    (
	select
		TIV_2015
	from
		leetcode585.insurance
	group by
		TIV_2015
	having
		COUNT(1)>1);
