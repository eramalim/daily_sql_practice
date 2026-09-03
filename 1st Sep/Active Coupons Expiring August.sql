/*roblem Description:

The promotions team wants a list of active coupon codes expiring in August 2024, 
so they can plan a renewal or replacement campaign before they lapse.

The result must contain the following columns:

code — the coupon code
discount_pct — the discount percentage it offers
expiry_date — when the coupon expires*/

-- Write your query for: 449. Active Coupons Expiring August | @Microsoft
select code,
discount_pct,
expiry_date from coupon_codes
where is_active = 'True' and
expiry_date > '2024-07-31' and expiry_date < '2024-09-01' 
order by expiry_date asc limit 5
