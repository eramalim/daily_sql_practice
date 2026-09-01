/*Problem Description:

Customer support wants to see how consistently each agent hits the 2-minute first-response SLA 
for July 2024 chat sessions, but only for agents with enough sessions to draw a reliable conclusion.

The result must contain the following columns:

agent_name — the support agent
session_count — number of chat sessions in July 2024
fast_response_count — number of sessions with a first response within 2 minutes
fast_response_rate — percentage of sessions meeting the SLA, rounded to 2 decimals*/

-- Write your query for: 447. Live Chat Response Rates | @Shopify
with chat_reponse as(
    select agent_name,
    count(session_id) as session_count,
    count(*) filter (
    where extract(epoch from (first_response_at - started_at )) <=120)
    as fast_response_count
    from chat_sessions
    where started_at > '2024-06-30' and started_at <'2024-08-01' 
    group by agent_name having count(session_id) >=4
)

select agent_name,
session_count,
fast_response_count,
round(fast_response_count*100.0/session_count) 
as fast_response_rate
from chat_reponse
order by fast_response_rate
