/*Problem Description:

You are a Data Analyst at an e-commerce company. The warehouse team needs a quick list of all products that are currently out of stock so they can trigger reorder requests immediately.

The result must contain the following columns:

product_name
category
unit_price
reorder_level - minimum stock level that should be maintained*/

select product_name, category,
unit_price, reorder_level from inventory
where stock_quantity = 0 
order by unit_price desc
