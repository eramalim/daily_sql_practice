/*Problem Description:

The pricing team wants to spot premium items — products whose price is strictly higher than the average price of their own category —
so they can review margins. Show each such product next to its category's average price. The result must contain the following columns:

product_name — the product
category — its category
price — the product's price
category_avg — the average price of that product's category, rounded to 2 decimals*/

-- Write your query for: 435. Products Priced Above Their Category Average | @Amazon
with average_pricing as(
    select category, 
    product_name,
    price,
    round(avg(price) over(partition by category),2) as category_avg
    from products 
)

select product_name,
Category,
price, 
category_avg from average_pricing 
where price > category_avg
order by category asc, price desc, product_name asc
