/*Problem Description:

Product analytics logs only record the days a subscription was actually used — 
there's no row at all for a day with no activity. The retention team wants to flag subscriptions that went quiet 
for a meaningful stretch of business days before their cancellation date, but weekends are expected to be quiet 
regardless of engagement level and shouldn't count against a subscription.

The result must contain the following columns:

sub_id — the subscription
inactive_weekday_count — number of weekdays between signup and cancellation with no logged usage Order the result by sub_id. 
Only include subscriptions where this count exceeds 3, and treat both the start date and the cancellation 
date as part of the window being checked.*/

-- Write your query for: 553. Flag Weekday Inactivity Risk | @Capgemini
WITH weekdays AS (
    SELECT
        s.sub_id,
        d::date AS activity_date
    FROM subscriptions s
    CROSS JOIN LATERAL generate_series(
        s.start_date::date,
        s.cancel_date::date,
        interval '1 day'
    ) AS d
    WHERE EXTRACT(ISODOW FROM d) BETWEEN 1 AND 5
),

inactive_days AS (
    SELECT
        w.sub_id,
        COUNT(*) AS inactive_weekday_count
    FROM weekdays w
    LEFT JOIN usage_log u
        ON w.sub_id = u.sub_id
        AND w.activity_date = u.usage_date::date
    WHERE u.sub_id IS NULL
    GROUP BY w.sub_id
)

SELECT
    sub_id,
    inactive_weekday_count
FROM inactive_days
WHERE inactive_weekday_count > 3
ORDER BY sub_id;

