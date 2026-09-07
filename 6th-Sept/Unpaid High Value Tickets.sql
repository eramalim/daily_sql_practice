/*Problem Description:

The city's parking enforcement office wants to see which unpaid tickets over $50 were issued in July 2024, 
so collections can prioritize the biggest fines first.

The result must contain the following columns:

vehicle_plate — the ticketed vehicle's plate
violation_type — the type of violation
fine_amount — the fine amount*/

SELECT 
    vehicle_plate,
    violation_type,
    fine_amount
FROM parking_tickets
WHERE paid = 'false'
  AND fine_amount > 50
  AND issued_date >= '2024-07-01'
  AND issued_date < '2024-08-01'
ORDER BY fine_amount DESC
LIMIT 5;
