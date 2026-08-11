/* Problem Description:

The merchandising team wants to see which product categories are rated highest by customers in 2024. 
Reviews that were never rated (only left as text) shouldn't count toward the average.*/

select Category,
round(avg(Rating), 2) as avg_rating
from product_reviews
where review_date >= '2024-01-01'
and review_date < '2025-01-01'
and Rating is not null
group by Category order by avg_rating desc
limit 3
