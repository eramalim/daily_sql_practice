/*Problem Description:

The lifecycle marketing team wants to review who unsubscribed from the Weekly Digest or Product Updates lists in July 2024, 
most recent first, to spot any content issues.

The result must contain the following columns:

email — the subscriber's email
unsubscribed_date — when they unsubscribed
list_name — which list they left*/

-- Write your query for: 443. Newsletter Unsubscribes This Month | @EY
select email,
Unsubscribed_date,
list_name from
newsletter_subscribers 
where list_name in ( 'Weekly Digest' , 'Product Updates') 
and Unsubscribed_date > '2024-06-30' and Unsubscribed_date < '2024-08-01'
order by Unsubscribed_date limit 5
