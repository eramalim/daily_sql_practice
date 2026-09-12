/*Problem Description:

The job run log stores one row per job per day, but the ops dashboard needs a wide "status board" view — 
one row per job, with a separate column showing that job's status on each of the last 3 days at a glance.

The result must contain the following columns:

job_name — the scheduled job
jul_1_status — status on 2024-07-01
jul_2_status — status on 2024-07-02
jul_3_status — status on 2024-07-03*/

-- Write your query for: 480. Pivot Daily Job Status | @Databricks
select job_name,
max(case
        when run_date = '2024-07-01' 
        then status
        end) as jul_1_status,
max(case
        when run_date = '2024-07-02' 
        then status
        end) as jul_2_status,
max(case
        when run_date = '2024-07-03' 
        then status
        end) as jul_3_status
from job_run_log
group by job_name
order by job_name asc
