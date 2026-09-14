/*Problem Description:

Nightly rates are re-scraped periodically and stored as a snapshot history per listing. 
A sudden, steep price drop between two consecutive snapshots can indicate anything from a 
host reacting to low demand to a pricing-bug false alarm worth investigating.

The result must contain the following columns:

listing_id — the listing
snapshot_date — the date of the (lower) price snapshot
nightly_price — the new, lower price
prior_price — the price at the immediately preceding snapshot for that listing
pct_change — percentage change from prior to current, rounded to 2 decimals*/

with lising_price_drop as(
    select listing_id,
    snapshot_date,
    cast(nightly_price as numeric) as nightly_price,
    lag(cast(nightly_price as numeric)) over(
        partition by listing_id
        order by snapshot_date
    ) as prior_price
    from price_snapshots 
)

select listing_id,
snapshot_date,
nightly_price,
prior_price,
round((nightly_price-prior_price)/prior_price*100.0,2) as pct_change
from lising_price_drop
where nightly_price < prior_price and 
round((nightly_price-prior_price)/prior_price*100.0,2) <= -20
