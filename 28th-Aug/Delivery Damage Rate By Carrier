/*Problem Description:

The logistics team wants to compare damage rates across shipping carriers for July 2024, 
but only carriers with enough shipment volume to draw a reliable conclusion.

The result must contain the following columns:

carrier — the shipping carrier
total_shipments — total number of shipments in July 2024
damaged_count — number of those shipments reported damaged
damage_rate — percentage of shipments damaged, rounded to 2*/

WITH damage_count AS (
    SELECT 
        carrier,
        COUNT(shipment_id) AS total_shipments,
        SUM(
            CASE
                WHEN is_damaged = 'true' THEN 1
                ELSE 0
            END
        ) AS damaged_count
    FROM shipments where ship_date > '2024-06-30' and ship_date < '2024-08-01'
    GROUP BY carrier
    HAVING COUNT(shipment_id) >= 5
)

SELECT 
    carrier,
    total_shipments,
    damaged_count,
    ROUND(damaged_count * 100.0 / total_shipments, 2) AS damage_rate
FROM damage_count 
ORDER BY damage_rate DESC;

