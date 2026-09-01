/*Problem Description:

The claims department wants to review large Auto and Home claims filed in June 2024 — specifically, claims over $1,000 — starting with the biggest amounts.

The result must contain the following columns:

policy_holder — name of the policy holder
claim_amount — the amount claimed
claim_type — the type of claim ('Auto' or 'Home')*/

select policy_holder,
claim_amount,
claim_type
from insurance_claims
where claim_type in ('Auto','Home') and
claim_amount >= 1000 and
filed_date > '2024-05-30' and filed_date < '2024-07-01'
order by claim_amount
limit 5
