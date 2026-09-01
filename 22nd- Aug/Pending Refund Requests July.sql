/*Problem Description:

The finance team needs to work through the backlog of pending refund requests submitted in July 2024, tackling the largest dollar amounts first.

The result must contain the following columns:

customer_name — name of the customer requesting the refund
refund_amount — the requested refund amount
request_date — when the refund was requested*/

SELECT customer_name,
       refund_amount,
       request_date
FROM refund_requests
WHERE status = 'Pending'
  AND request_date BETWEEN '2024-07-01' AND '2024-07-31'
ORDER BY CAST(refund_amount AS DECIMAL(10,2)) DESC
LIMIT 5;
