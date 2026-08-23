/*Problem Description:

The growth team wants to see which marketing sources brought in the most signups in August 2024, 
and how well each source converted signups into paying customers — but only sources with enough volume to draw a conclusion.

The result must contain the following columns:

source — the marketing source
signup_count — number of signups from that source in August 2024
converted_count — number of those signups who became paying customers
conversion_rate — percentage of signups that converted, rounded to 2 decimals*/

-- Write your query for: 417. New Signups By Source | @Shopify
with conversion_rates as(
    select source,
    sum(case
        when converted_to_paid = 'True' then 1 
        else 0
        end
    ) as converted_count,
    count(signup_id) as signup_count from 
    signups where signup_date between '2024-08-01' and '2024-08-31' 
    group by source having count(signup_id) >= 3
)

select source,
signup_count, converted_count,
round(converted_count*100/signup_count, 2) as conversion_rate
from conversion_rates
order by conversion_rate desc 
