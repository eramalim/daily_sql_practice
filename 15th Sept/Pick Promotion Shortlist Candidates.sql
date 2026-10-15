/*Problem Description:

A people-analytics team keeps each employee's latest review rating along with their tenure in years. 
For the promotion shortlist, ratings are compared only within a department. 
The policy looks at rating levels rather than headcount: everyone sharing the top rating is at level 1, 
everyone at the next distinct rating is at level 2, and so on, so ties never push anyone down a level. Only the top two levels are eligible, 
and the policy has extra conditions to avoid shortlisting from tiny departments or from people who have not been around long enough.*/

-- Write your query for: 579. Pick Promotion Shortlist Candidates | @Databricks
with reviews as(
    select emp_id, 
    tenure_years,
    emp_name,
    dept,
    rating,
    dense_rank() over(
        partition by dept
        order by rating desc
    ) as rating_level
    from employee_reviews
    where dept in (select dept
                                                from employee_reviews
                                                group by dept having count(*) >= 4) 
)

select emp_id,
emp_name,
dept, rating, rating_level
from reviews where tenure_years >=2 and
rating_level in (1, 2)

