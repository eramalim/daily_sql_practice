/*Problem Description: A software vendor stores customers, its product catalogue and a licence table that links each customer 
to the products they have bought, one row per purchase or renewal. 
The security product team wants a log of who bought their products and when, ignoring everything else the customers have bought.*/

-- Write your query for: 674. Security Licence Purchase Log | @Microsoft
select c.customer_name,
p.product_name,
l.purchase_date from customers c 
join licenses l  on c.customer_id = l.customer_id
join products p on l.product_id = p.product_id
where p.category = 'Security'
order by purchase_date
