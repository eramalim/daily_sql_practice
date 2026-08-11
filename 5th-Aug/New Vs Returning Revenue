/*The growth team wants to understand how much of July 2024's revenue came from brand-new customers (placing their very first order ever in July) 
versus returning customers (who had already ordered before July). Summarize July's orders and revenue split by customer type.*/
WITH first_orders AS (
    SELECT
        user_id,
        MIN(order_date) AS first_order_date
    FROM user_orders
    GROUP BY user_id
)

SELECT
    COUNT(*) AS total_orders,

    SUM(
        CASE
            WHEN f.first_order_date >= '2024-07-01'
             AND f.first_order_date < '2024-08-01'
            THEN 1
            ELSE 0
        END
    ) AS new_user_orders,

    SUM(
        CASE
            WHEN f.first_order_date >= '2024-07-01'
             AND f.first_order_date < '2024-08-01'
            THEN CAST(u.order_amount AS DECIMAL(10,2))
            ELSE 0
        END
    ) AS new_user_revenue,

    SUM(
        CASE
            WHEN f.first_order_date < '2024-07-01'
            THEN 1
            ELSE 0
        END
    ) AS returning_user_orders,

    SUM(
        CASE
            WHEN f.first_order_date < '2024-07-01'
            THEN CAST(u.order_amount AS DECIMAL(10,2))
            ELSE 0
        END
    ) AS returning_user_revenue

FROM user_orders u
JOIN first_orders f
    ON u.user_id = f.user_id

WHERE u.order_date >= '2024-07-01'
  AND u.order_date < '2024-08-01';
