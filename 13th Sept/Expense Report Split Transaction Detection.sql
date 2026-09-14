/*Problem Description:

Corporate expense policy requires manager approval for any single expense over $500. 
A known evasion tactic is "transaction splitting" — submitting several smaller receipts from the same vendor on the same day that individually 
stay under the threshold, but which combined clearly represent one purchase that should have required approval.

The result must contain the following columns:

employee_id — the employee with one or more flagged violations
violation_count — how many separate splitting incidents they have
total_flagged_amount — combined dollar amount across all their flagged incidents
risk_rank — rank by violation_count descending, then total_flagged_amount descending (1 = highest risk)*/

WITH split_transaction_detection AS (
    SELECT employee_id,
           report_id,
           vendor_name,
           expense_date,
           SUM(amount) AS total_amount,
           COUNT(*) AS item_count
    FROM expense_items
    WHERE amount <= 500
    GROUP BY employee_id, report_id, vendor_name, expense_date
    HAVING COUNT(*) > 1
       AND SUM(amount) > 500
),
transaction_detection AS (
    SELECT employee_id,
           COUNT(*) AS violation_count,
           SUM(total_amount) AS total_flagged_amount
    FROM split_transaction_detection
    GROUP BY employee_id
)
SELECT employee_id,
       violation_count,
       total_flagged_amount,
       RANK() OVER (
           ORDER BY violation_count DESC,
                    total_flagged_amount DESC
       ) AS risk_rank
FROM transaction_detection
ORDER BY risk_rank;
