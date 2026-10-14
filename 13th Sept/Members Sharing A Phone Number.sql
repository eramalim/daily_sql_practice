/*Problem Description:

A trust and safety team suspects some people have created more than one account, and a shared phone number is one of the cheapest signals to check. 
Member profiles are stored in a single table, and some members never provided a phone number at all. 
The team wants every pair of distinct members who registered the same phone number, so a reviewer can look at each pair side by side.*/

-- Write your query for: 575. Members Sharing A Phone Number | @LinkedIn
select a.member_id as member_a_id,
b.member_id as member_b_id,
a.phone from members a 
join members b on a.phone = b.phone 
and a.member_id < b.member_id 
where b.phone is not NULL 
order by member_a_id
