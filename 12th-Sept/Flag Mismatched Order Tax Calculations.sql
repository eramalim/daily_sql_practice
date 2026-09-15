/*Problem Description:

Tax is supposed to be calculated automatically as subtotal × region tax rate, 
but a checkout bug can sometimes let a stale or manually-overridden tax amount slip through. 
A merchant support ticket asked finance to find every order where the stored tax doesn't match what the rate table says it should be.

The result must contain the following columns:

order_id — the order
subtotal — the order subtotal
tax_amount — the tax that was actually charged
expected_tax — what the tax should have been, rounded to 2 decimals
discrepancy — tax_amount minus expected_tax, rounded to 2 decimals Order final output by order_id.*/

-- Write your query for: 489. Flag Mismatched Order Tax Calculations | @Shopify
with mismatched_calculation as(
    select o.order_id,
    o.subtotal,
    o.tax_amount,
    round((t.rate*o.subtotal),2) as expected_tax
    from orders o join tax_rates t
    on o.region = t.region 
)

select order_id,
subtotal,
tax_amount,
expected_tax,
round((tax_amount-expected_tax),2) as discrepancy
from mismatched_calculation
where tax_amount <> expected_tax
order by order_id
