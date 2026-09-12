/*Problem Description:

Every failed job attempt still burns compute — and therefore money — before a retry eventually succeeds (or doesn't). 
The platform team wants to separate "wasted" spend (failed attempts) from "productive" spend (the attempt that actually succeeded), 
and measure how efficiently each job is using its retry budget. A job that has never succeeded yet needs to be called out explicitly, not silently averaged in.

The result must contain the following columns:

job_name — the scheduled job
wasted_cost — total compute cost of all failed attempts
productive_cost — compute cost of the successful attempt (0 if none)
status_summary — 'Resolved' if the job has succeeded at least once, otherwise 'Unresolved'
retry_efficiency_pct — productive_cost as a percentage of total cost (wasted + productive), rounded to 2 decimals
efficiency_rank — rank by retry_efficiency_pct descending (1 = most cost-efficient job)*/


Write your query for: 481. Job Retry Cost Attribution | @Databricks
with job_retry_cost as(
    select job_name,
    sum(case
            when status = 'Failed' then compute_cost
            else 0
        end
    ) as wasted_cost,
    sum(case
            when status = 'Success' then compute_cost
            else 0
        end
    ) as productive_cost
from job_runs
group by job_name
),

jobs as (
select job_name,
wasted_cost,
productive_cost,
case
        when productive_cost = 0 then 'Unresolved'
        else 'Resolved'
        end as status_summary,
round(productive_cost/NULLIF(wasted_cost+productive_cost,0)*100,2) as retry_efficiency_pct
from job_retry_cost
)

select job_name,
wasted_cost,
productive_cost,
status_summary,
retry_efficiency_pct,
rank() over(
    order by retry_efficiency_pct desc
) as efficiency_rank
from jobs
order by efficiency_rank 


