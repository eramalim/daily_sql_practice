/*Problem Description:

The operations team wants to compare last-mile speed across cities. For every city, 
report the average delivery time and how many parcels were delivered, counting only parcels that were actually delivered (ignore failed attempts). 
The result must contain the following columns:

city — the delivery city
avg_minutes — the average delivery_minutes of delivered parcels, rounded to 2 decimals
num_deliveries — how many delivered parcels the city had*/

-- Write your query for: 434. Average Delivery Time by City | @Uber
select city,
round(avg(delivery_minutes ),2) as avg_minutes,
round(count(delivery_id),2) as num_deliveries from 
deliveries where status = 'Delivered'
group by city 
order by avg_minutes asc,city asc
