/*Problem Description:

Finance maintains an approved headcount plan per department in its own reference table, while HR keeps the actual employee roster separately. 
Leadership wants to know how close each planned department is to its approved headcount, including departments that haven't hired anyone yet, 
and including departments that have gone over plan.

The result must contain the following columns:

department — the planned department
approved_headcount — headcount approved in the plan
actual_headcount — employees currently on the roster in that department
fill_rate_pct — actual divided by approved, as a percentage rounded to 2 decimal places Order the result by department. 
Departments that appear on the roster but not in the plan are out of scope.*/

-- Write your query for: 564. Hiring Progress Against Plan | @Microsoft
select h.department,
h.approved_headcount,
count(e.department) as actual_headcount,
round(count(e.department)*100.0/h.approved_headcount, 2) as fill_rate_pct
from headcount_plan h left join employees e 
on h.department = e.department
group by h.department, h.approved_headcount
order by approved_headcount desc

