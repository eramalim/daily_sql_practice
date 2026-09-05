/*Problem Description:

An e-commerce analytics team wants to know which product categories generate the most revenue from completed orders. 
Cancelled and pending orders should not count toward revenue. Find the top 3 categories by total revenue.

The result must contain the following columns:

category — product category name
total_revenue — sum of (quantity × unit_price) for completed orders in that category*/

select category,
sum(quantity*unit_price) as total_revenue
from orders where status = 'completed' 
group by category 
order by total_revenue desc
limit 3
