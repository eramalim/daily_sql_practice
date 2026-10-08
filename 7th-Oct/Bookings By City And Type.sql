/*Problem Description:

A market operations team wants a quick breakdown of booking volume split two ways at once — 
by city and by room type — to understand which combinations are most popular before planning a marketing push.

The result must contain the following columns:

city — the booking's city
room_type — the type of room booked
total_bookings — count of bookings for that city and room type
total_nights — sum of nights booked for that city and room type Order the result by city, then room_type.*/

-- Write your query for: 557. Bookings By City And Type | @Airbnb
select city,
room_type,
count(booking_id) as total_bookings,
sum(nights :: numeric) as total_nights from Bookings
group by city, room_type order by city, room_type
