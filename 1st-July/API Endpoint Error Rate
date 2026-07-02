/*
Problem Description:

You are a Data Analyst on the platform reliability team. The engineering team wants a quick overview of each API endpoint's health - specifically the 5xx error rate, average response time, and total call volume. This feeds into a live SRE dashboard.

The result must contain the following columns:

endpoint
total_calls - total log entries for that endpoint
error_count - calls with status_code >= 500
error_rate_pct - (error_count / total_calls) * 100, rounded to 1 decimal place
avg_response_ms - average response time in milliseconds, rounded to 0 decimal places*/

-- Write your query for: 266. API Endpoint Error Rate | @EY
with error_rate as(
    select endpoint,
    count(log_id) as total_calls,
    sum(
        case 
            when status_code >= 500 then 1
            else 0
        end
    ) as error_count,
    round(avg(response_ms),0) as avg_response_ms
    from api_logs
    group by endpoint
)

select endpoint,
total_calls,
error_count,
round((error_count*100.0/total_calls),1) as error_rate_pct,
avg_response_ms from error_rate
order by error_rate_pct desc
