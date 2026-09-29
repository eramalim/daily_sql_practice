/*Problem Description:

A market analytics team maintains a snapshot of active listings across three cities. 
Hosts sometimes price identically, and the team wants a clean view of the top-priced listing(s) in each city without hardcoding price cutoffs.

The result must contain the following columns:

city — the city of the listing
listing_name — the listing's display name
host_name — the host's name
price — the nightly price Order the result by city, then host_name. If two listings in the same city tie for the highest price, both should appear.*/

-- Write your query for: 530. Priciest Listing Per City | @Airbnb
with price_listing as(
    select city,
    listing_name,
    host_name, price,
    rank() over(
        partition by city
        order by price desc
    ) as rn 
    from listings
)

select city, listing_name,
host_name, price from price_listing where 
rn = 1
