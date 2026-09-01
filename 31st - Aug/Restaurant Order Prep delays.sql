/*Problem Description:

A food delivery platform wants to compare kitchen prep times across partner restaurants for July 2024 orders, 
but only restaurants with enough order volume to draw a reliable conclusion.

The result must contain the following columns:

restaurant_name — the partner restaurant
order_count — number of orders placed in July 2024
avg_prep_minutes — average minutes between order_placed_at and order_ready_at, rounded to 2 decimals*/

-- Write your query for: 441. Restaurant Order Prep Delays | @Walmart
with kitchen_time as(
    select restaurant_name,
    order_id,
    extract(epoch from 
    (order_ready_at - order_placed_at))/60
    as order_prep_time
    from  restaurant_orders 
    WHERE order_placed_at >= '2024-07-01'
    AND order_placed_at < '2024-08-01'
)

select restaurant_name,
count(order_id) as order_count,
round(avg(order_prep_time),2) as avg_prep_minutes
from kitchen_time 
group by restaurant_name having
count(*) >=4 
order by avg_prep_minutes desc 
