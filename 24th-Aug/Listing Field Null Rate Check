/*Problem Description:

A real estate marketplace ingests property listings from multiple broker feeds, and some feeds are far less careful about populating key fields than others. 
The data engineering team wants a per-feed null rate report for price and square_footage — 
two fields critical for search filtering — to decide which feed's broker needs a data quality conversation.*/

-- Write your query for: 423. Listing Field Null Rate Check | @Oracle
with feed_checker as(
select feed_source,
count(feed_source) as total_listings,
sum(case
        when price is null then 1
        else 0
    end) as price_null,
sum(case
        when square_footage is null then 1
        else 0
    end) as sqft_null
from property_listings
group by feed_source
)

select feed_source, 
total_listings,
round(price_null*100/total_listings) as price_null_rate,
round(sqft_null*100/total_listings) as sqft_null_rate
from feed_checker order by feed_source desc
