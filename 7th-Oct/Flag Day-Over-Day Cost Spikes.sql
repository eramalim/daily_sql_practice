/*Problem Description:

A cost-monitoring job tracks each warehouse's total compute spend per day. 
The finance team wants to catch sudden jumps in spend as early as possible — 
specifically, any day where a warehouse's cost rose by more than 50% compared to the day immediately before it.

The result must contain the following columns:

warehouse_name — the compute warehouse
cost_date — the day the spike occurred
daily_cost — that day's cost
prior_cost — the previous day's cost for the same warehouse
pct_increase — the percentage increase over the prior day, rounded to 2 decimal places Order the result by warehouse_name, then cost_date.*/

-- Write your query for: 558. Flag Day-Over-Day Cost Spikes | @Snowflake
with sudden_increase as(
    select warehouse_name,
    cost_date,
    daily_cost:: decimal,
    lag(daily_cost:: decimal,1) over(
        partition by warehouse_name
        order by cost_date 
    ) as prior_cost
    from daily_compute_cost
)

select warehouse_name,
cost_date, daily_cost,
prior_cost, 
round((daily_cost-prior_cost)/prior_cost *100.0, 2) as pct_increase
from sudden_increase  where round((daily_cost-prior_cost)/prior_cost *100.0, 2) > 50
order by warehouse_name,
cost_date
