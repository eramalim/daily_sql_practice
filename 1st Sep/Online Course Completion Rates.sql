/*Problem Description:

The learning platform wants to compare completion rates across course categories for July 
2024 enrollments, but only categories with enough enrollments to draw a reliable conclusion.

The result must contain the following columns:

course_category — the course category
enrollment_count — number of enrollments in July 2024
completed_count — number of those enrollments that were completed
completion_rate — percentage completed, rounded to 2 decimals*/

-- Write your query for: 450. Online Course Completion Rates | @IBM
with course_completion as(
    select course_category,
    count(enrollment_id) as enrollment_count,
    sum(case
            when completed = 'True'
            then 1
            else 0
        end)   as completed_count
    from course_enrollments
    where enrolled_date > '2024-06-30' and enrolled_date < '2024-08-01'
    group by course_category having count(enrollment_id) >=4
)

select course_category,
enrollment_count,
completed_count,
round(completed_count*100.0/enrollment_count) as completion_rate
from course_completion order by completion_rate desc 
