/*Problem Description:

The platform team wants to check failure rates for different file types uploaded in July 2024, 
but only for file types with a large enough volume to draw a reliable conclusion.

The result must contain the following columns:

file_type — the uploaded file format
total_uploads — total number of uploads in July 2024
failed_count — number of those uploads that failed
failure_rate — percentage of uploads that failed, rounded to 2 decimals */

with file_upload_counts as(
    select file_type,
    count(upload_id) as total_uploads,
    sum(case
            when status = 'Failed' then 1
            else 0
        end) as failed_count
    from file_uploads 
    where upload_date > '2024-06-30' and upload_date <= '2024-07-31'
    group by file_type having count(upload_id) >= 5
)

select file_type,
total_uploads,
failed_count, 
round(failed_count*100.0/total_uploads, 2) as failure_rate
from file_upload_counts
order by failure_rate desc
