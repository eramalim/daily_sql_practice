/*Problem Description:

Talent acquisition wants a list of currently open job postings closing within the next two weeks (2024-07-01 through 2024-07-14), 
so hiring managers can push for final candidate decisions.

The result must contain the following columns:

job_title — the open position
department — the hiring department
closing_date — when the posting closes*/

-- Write your query for: 452. Job Postings Closing Soon | @LinkedIn
Select job_title,
department,
closing_date
from job_postings
where status = 'Open' and
closing_date > '2024-06-30' and closing_date <='2024-07-14'
order by closing_date asc
limit 5
