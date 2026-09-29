/*Problem Description:

Warehouse compute is billed per credit, but the price per credit changes over time as pricing tiers roll out. 
A query log records credits consumed per run, and a separate rate table records which price applied during which date range for each warehouse.

The result must contain the following columns:

warehouse_name — the compute warehouse
total_cost — total dollar cost across all logged queries, using the price tier in effect on each query's 
run date Order the result by warehouse_name.*/

-- Write your query for: 531. Compute Cost By Rate Tier | @Snowflake
    select q.warehouse_name,
    sum(q.credits_used*c.price_per_credit) as total_cost
    from query_log q join credit_rate c on 
    q.warehouse_name = c.warehouse_name
    and q.run_date between c.rate_start and c.rate_end
    group by q.warehouse_name
    order by total_cost desc
