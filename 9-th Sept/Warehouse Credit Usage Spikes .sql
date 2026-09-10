/*Problem Description:

In the style of a Snowflake platform-cost-monitoring question: find compute warehouses whose average daily credit consumption 
in July 2024 exceeded 50 credits/day — a signal that a workload may need right-sizing — but only warehouses with enough days of usage data to be meaningful.

The result must contain the following columns:

warehouse_name — the virtual warehouse
day_count — number of days with recorded usage in July 2024
avg_daily_credits — average credits consumed per day, rounded to 2 decimals*/

-- Write your query for: 474. Warehouse Credit Usage Spikes | @Snowflake
select warehouse_name,
count(usage_id) as day_count,
round(avg(credits_used),2) as avg_daily_credits
from warehouse_credit_usage
where usage_date >= '2024-07-01' and usage_date <= '2024-07-31'
group by warehouse_name having count(usage_id) >=4 
and round(avg(credits_used),2) >50
order by avg_daily_credits desc
