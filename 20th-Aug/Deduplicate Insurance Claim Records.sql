/*Problem Description:

An insurance company's claims intake app occasionally retries a submission after a network hiccup, creating a duplicate row in claims_intake that's 
missing the signature field the original had. The data engineering team needs to keep only the earliest submission per claim — the original, 
not the retry — before this data flows downstream into claims processing.*/

-- Write your query for: 414. Deduplicate Insurance Claim Records | @Databricks

with claim_submission as(
    select claim_number,
    policy_holder,
    submitted_at,
    has_signature,
    row_number() over(
        partition by claim_number
        order by submitted_at asc
    ) as rn 
    from claims_intake
)

select claim_number,
policy_holder, submitted_at, has_signature
from claim_submission where rn = 1 
order by claim_number
