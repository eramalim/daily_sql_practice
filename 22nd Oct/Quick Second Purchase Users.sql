/*Problem Description:

A store team wants to measure how quickly new buyers come back. 
For each user, the first purchase is the earliest by date, and the second purchase is the next one after it. 
If two purchases fall on the same date, the one with the lower purchase_id counts as earlier. 
The team wants users whose second purchase happened no more than 30 days after their first (exactly 30 days counts).

The result must contain the following columns:

user_id — the user
first_purchase_date — date of the first purchase
second_purchase_date — date of the second purchase
days_between — whole days between the two purchases Order the result by user_id.*/

WITH ranked_purchases AS (
SELECT
user_id,
purchase_date,
ROW_NUMBER() OVER (
PARTITION BY user_id
ORDER BY purchase_date, purchase_id
) AS rn
FROM purchases
),
user_purchases AS (
SELECT
user_id,
MAX(CASE WHEN rn = 1 THEN purchase_date END) AS first_purchase_date,
MAX(CASE WHEN rn = 2 THEN purchase_date END) AS second_purchase_date
FROM ranked_purchases
WHERE rn <= 2
GROUP BY user_id
)
SELECT
user_id,
first_purchase_date,
second_purchase_date,
second_purchase_date - first_purchase_date AS days_between
FROM user_purchases
WHERE second_purchase_date IS NOT NULL
AND second_purchase_date - first_purchase_date <= 30;


