/*
Write an SQL query to find the average number of sessions per user for a 
period of 30 days ending 2019-07-27 inclusively, rounded to 2 decimal places. 
*/

SELECT
    COALESCE(
        ROUND(
            COUNT(DISTINCT session_id)::numeric / COUNT(DISTINCT user_id),
            2
        ),
        0.00
    ) AS average_sessions_per_user
FROM
    leetcode1142.Activity
WHERE
    activity_date BETWEEN '2019-06-28' AND '2019-07-27';

