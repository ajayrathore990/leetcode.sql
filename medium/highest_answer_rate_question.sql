/*
Write a sql query to identify the question which has the highest answer rate.
*/

select
	question_id as survey_log
from
	(
	select
		*,
		case
			when answer_id is not null then '1'
			and action = 'answer'
		end as ss
	from
		leetcode578.survey_log
) xx
where
	ss is not null;


