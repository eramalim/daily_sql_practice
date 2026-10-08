/*Problem Description:

Azure billing analysts monitor daily subscription spend against a trailing baseline rather than a fixed threshold, 
since normal spend levels vary a lot between subscriptions. A day should only be flagged as a genuine spike once there's enough 
recent history to establish a meaningful baseline — flagging a subscription's second-ever day of billing as a "spike" 
against an average built from only one or two data points would be premature and noisy.

The result must contain the following columns:

subscription_id — the subscription
cost_date — the day being evaluated
daily_cost — that day's actual cost
moving_avg_3day — the trailing 3-day average cost (including the current day), rounded to 2 decimal places Order the result 
by subscription_id, then cost_date. Only include a day once a full 3-day trailing window is available for it, 
and only when that day's cost exceeds the moving average by more than 50%.*/

WITH detect_spikes AS (
    SELECT
        subscription_id,
        cost_date,
        daily_cost,
        ROUND(
            AVG(daily_cost) OVER (
                PARTITION BY subscription_id
                ORDER BY cost_date
                ROWS 2 PRECEDING
            ), 2
        ) AS moving_avg_3day,
        COUNT(*) OVER (
            PARTITION BY subscription_id
            ORDER BY cost_date
            ROWS 2 PRECEDING
        ) AS window_count
    FROM daily_costs
)

SELECT
    subscription_id,
    cost_date,
    daily_cost,
    moving_avg_3day
FROM detect_spikes
WHERE window_count = 3
  AND daily_cost > moving_avg_3day * 1.5
ORDER BY subscription_id, cost_date;


