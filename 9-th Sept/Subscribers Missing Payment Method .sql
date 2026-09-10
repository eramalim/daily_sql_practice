/*Problem Description:

In the style of a Netflix subscriber-billing analytics question: 
find paying subscribers (not on a Free Trial) who signed up in 2024 but have no payment method on file — a billing-risk gap that could cause a failed renewal.

The result must contain the following columns:

subscriber_name — the subscriber's name
plan_type — their subscription plan
signup_date — when they signed up*/

-- Write your query for: 473. Subscribers Missing Payment Method | @Netflix
select subscriber_name,
plan_type,
signup_date
from subscribers
where plan_type != 'Free Trial' and
payment_method is NULL and
extract(year from signup_date) = 2024 
order by signup_date asc



