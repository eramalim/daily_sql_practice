/*Problem Description:

A data engineering team ingests raw event data from a mobile SDK and suspects that device_id is being dropped 
for certain event types due to a tracking bug. Build a data quality report that flags any event type whose null rate for device_id exceeds 20%.

The result must contain the following columns:

event_type — the type of event
total_events — total number of events of that type
null_device_count — number of events of that type with a NULL device_id
null_device_rate_pct — null rate as a percentage, rounded to 2 decimal places*/

-- Write your query for: 459. Null Rate Quality Check | @LinkedIn
with null_rate_check as(
    select event_type,
    count(event_id) as total_events,
    sum(case
            when device_id is NULL then 1
            else 0
        end) as null_device_count
        from raw_events
        group by event_type
)

select event_type,
total_events,
null_device_count,
round(null_device_count*100.0/total_events,2) as null_device_rate_pct
from null_rate_check where round(null_device_count*100.0/total_events,2) >20
order by null_device_rate_pct desc
