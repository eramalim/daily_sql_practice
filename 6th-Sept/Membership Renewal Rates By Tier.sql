/*Problem Description:

The membership team wants to compare renewal rates across tiers for memberships expiring in July 2024, 
but only tiers with enough expirations to draw a reliable conclusion.

The result must contain the following columns:

tier — the membership tier
membership_count — number of memberships expiring in July 2024
renewed_count — number of those memberships that were renewed
renewal_rate — percentage renewed, rounded to 2 decimals*/

-- Write your query for: 462. Membership Renewal Rates By Tier | @Netflix
with membership_renewal as(
    select tier,
    count(membership_id) as membership_count,
    sum(case 
            when renewed = 'true' then 1
            else 0
        end
    ) as renewed_count 
    from memberships
    where expiry_date <= '2024-07-31' and expiry_date >= '2024-07-01'
    group by tier having count(membership_id) >=4
)

select tier,
membership_count,
renewed_count,
round(renewed_count*100.0/membership_count) as renewal_rate
from membership_renewal order by renewal_rate desc
