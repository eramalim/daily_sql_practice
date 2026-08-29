/*Problem Description:

The growth team wants to target shoppers who abandoned high-value carts in July 2024 with a reminder email — starting with the biggest carts first.

The result must contain the following columns:

customer_name — name of the shopper
cart_value — total value of the abandoned cart
last_updated — when the cart was last touched*/

-- Write your query for: 437. Abandoned High Value Carts | @Amazon
select customer_name,
cart_value, 
last_updated 
from shopping_carts where
checked_out = 'False' and 
cart_value> 100 and
last_updated > '2024-06-30' and last_updated < '2024-08-01'
order by cart_value desc
limit 5
