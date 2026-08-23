/*Problem Description:

An upstream feed occasionally re-sends the same customer record with at-least-once delivery, 
so raw_customer_records can contain several rows per customer_id. Deduplicate down to each customer's most recently ingested row, and report how many duplicate rows existed for each.

The result must contain the following columns:

customer_id — the customer identifier
email — the email from the most recently ingested row
duplicate_count — total number of rows (including the kept one) that existed for that customer*/


-- Write your query for: 420. Deduplicate Customer Ingestion Records | @Microsoft
with deduplicate_customer as(
    select customer_id,
    email,
    row_number() over(
        partition by customer_id
        order by ingested_at desc, record_id desc 
    ) as rn,
    count(*) over(
        partition by customer_id
    ) as duplicate_count from 
    raw_customer_records
)

select customer_id,
email, duplicate_count
from deduplicate_customer where rn = 1
