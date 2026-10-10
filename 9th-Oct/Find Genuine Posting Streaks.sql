/*Problem Description:

A creator-programs team wants to reward members who post on consecutive days in a way that reflects real effort. 
A member's activity log can hold several rows for the same day, and a member can have several separate runs of consecutive days over time. 
A run only counts as a genuine streak if it is long enough and the member posted enough during it; a long run of token one-post days, 
or a high-volume member who keeps skipping days, should not qualify.

The result must contain the following columns:

user_id — the member
streak_start — first date of the streak
streak_end — last date of the streak
streak_days — number of consecutive days in the streak
total_posts — total posts made across the streak Order the result by user_id, then streak_start. 
Only include streaks of at least 3 consecutive days with at least 6 total posts.*/

-- Write your query for: 565. Find Genuine Posting Streaks | @Meta
WITH daily_activity AS (
    SELECT
        user_id,
        CAST(activity_date AS DATE) AS activity_date,
        SUM(CAST(posts_count AS INT)) AS posts_count
    FROM user_activity
    GROUP BY
        user_id,
        CAST(activity_date AS DATE)
),

grouped AS (
    SELECT
        user_id,
        activity_date,
        posts_count,
        activity_date
          - INTERVAL '1 day' * ROW_NUMBER() OVER (
                PARTITION BY user_id
                ORDER BY activity_date
            ) AS streak_group
    FROM daily_activity
),

streaks AS (
    SELECT
        user_id,
        MIN(activity_date) AS streak_start,
        MAX(activity_date) AS streak_end,
        COUNT(*) AS streak_days,
        SUM(posts_count) AS total_posts
    FROM grouped
    GROUP BY
        user_id,
        streak_group
)

SELECT
    user_id,
    streak_start,
    streak_end,
    streak_days,
    total_posts
FROM streaks
WHERE streak_days >= 3
  AND total_posts >= 6
ORDER BY
    user_id,
    streak_start;

